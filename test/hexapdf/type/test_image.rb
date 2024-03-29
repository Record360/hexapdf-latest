# -*- encoding: utf-8 -*-

require 'test_helper'
require 'stringio'
require 'tempfile'
require 'hexapdf/document'

describe HexaPDF::Type::Image do
  before do
    @jpg = File.join(TEST_DATA_DIR, 'images', 'rgb.jpg')
    @doc = HexaPDF::Document.new
  end

  it "returns the width of the image" do
    @image = @doc.wrap(Type: :XObject, Subtype: :Image, Width: 10)
    assert_equal(10, @image.width)
  end

  it "returns the height of the image" do
    @image = @doc.wrap(Type: :XObject, Subtype: :Image, Height: 10)
    assert_equal(10, @image.height)
  end

  describe "info" do
    before do
      @image = @doc.wrap(Type: :XObject, Subtype: :Image, Width: 10, Height: 5,
                         ColorSpace: :DeviceRGB, BitsPerComponent: 4)
    end

    it "uses the Width, Height and BitsPerComponent values" do
      assert_equal(10, @image.info.width)
      assert_equal(5, @image.info.height)
      assert_equal(4, @image.info.bits_per_component)
    end

    it "determines the type and extension based on the stream filter" do
      @image.set_filter(:DCTDecode)
      info = @image.info
      assert_equal(:jpeg, info.type)
      assert_equal('jpg', info.extension)
      assert(info.writable)

      @image.set_filter(:JPXDecode)
      info = @image.info
      assert_equal(:jp2, info.type)
      assert_equal('jpx', info.extension)
      assert(info.writable)

      @image.set_filter(:JBIG2Decode)
      info = @image.info
      assert_equal(:jbig2, info.type)
      refute(info.writable)

      @image.set_filter(:CCITTFaxDecode)
      info = @image.info
      assert_equal(:ccitt, info.type)
      refute(info.writable)

      @image.set_filter(nil)
      info = @image.info
      assert_equal(:png, @image.info.type)
      assert_equal('png', info.extension)
      assert(info.writable)
    end

    it "determines the color space, indexed and components values using the ColorSpace value" do
      @image[:ColorSpace] = :DeviceGray
      info = @image.info
      assert_equal(:gray, info.color_space)
      assert_equal(1, info.components)
      refute(info.indexed)
      assert(info.writable)

      @image[:ColorSpace] = [:CalGray, {WhitePoint: [1, 1, 1]}]
      info = @image.info
      assert_equal(:gray, info.color_space)
      assert_equal(1, info.components)
      refute(info.indexed)
      assert(info.writable)

      @image[:ColorSpace] = :DeviceRGB
      info = @image.info
      assert_equal(:rgb, info.color_space)
      assert_equal(3, info.components)
      refute(info.indexed)
      assert(info.writable)

      @image[:ColorSpace] = [:CalRGB, {WhitePoint: [1, 1, 1]}]
      info = @image.info
      assert_equal(:rgb, info.color_space)
      assert_equal(3, info.components)
      refute(info.indexed)
      assert(info.writable)

      @image[:ColorSpace] = :DeviceCMYK
      @image[:Filter] = :DCTDecode
      info = @image.info
      assert_equal(:cmyk, info.color_space)
      assert_equal(4, info.components)
      refute(info.indexed)
      assert(info.writable)

      @image[:ColorSpace] = :DeviceCMYK
      @image[:Filter] = :FlateDecode
      info = @image.info
      assert_equal(:cmyk, info.color_space)
      assert_equal(4, info.components)
      refute(info.indexed)
      refute(info.writable)

      @image[:ColorSpace] = [:Indexed, :DeviceRGB, 1, "\x80".b * 6]
      info = @image.info
      assert_equal(:rgb, info.color_space)
      assert_equal(3, info.components)
      assert(info.indexed)
      assert(info.writable)

      @image[:ColorSpace] = :ICCBased
      info = @image.info
      assert_equal(:other, info.color_space)
      assert_equal(-1, info.components)
    end
  end

  describe "write" do
    before do
      @file = Tempfile.new(['hexapdf-image-write-test', '.png'])
    end

    after do
      @file.unlink
    end

    `which pngcheck 2>&1`
    PNG_CHECK_AVAILABLE = $?.exitstatus == 0

    `which pngtopnm 2>&1`
    PNG_COMPARE_AVAILABLE = $?.exitstatus == 0

    def assert_valid_png(filename, original = nil)
      if PNG_CHECK_AVAILABLE
        result = `pngcheck -q #{filename}`
        assert(result.empty?, "pngcheck error: #{result}")
      else
        skip("Skipping PNG output validity check because pngcheck executable is missing")
      end
      if PNG_COMPARE_AVAILABLE
        assert_equal(`pngtopnm #{original}`, `pngtopnm #{filename}`) if original
      else
        skip("Skipping PNG output comparison check because pngtopnm executable is missing")
      end
    end

    it "can write to an IO" do
      io = StringIO.new(''.b)
      image = @doc.images.add(@jpg)
      image.write(io)
      assert_equal(File.binread(@jpg), io.string)
    end

    it "writes JPEG images to a file with .jpg extension" do
      begin
        file = Tempfile.new(['hexapdf-image-write-test', '.jpg'])
        image = @doc.images.add(@jpg)
        image.write(file.path)
        assert_equal(File.binread(@jpg), File.binread(file.path))
      ensure
        file.unlink
      end
    end

    it "writes JPEG2000 images to a file with .jpx extension" do
      begin
        file = Tempfile.new(['hexapdf-image-write-test', '.jpx'])
        image = @doc.images.add(@jpg)
        image.set_filter(:JPXDecode) # fake it
        image.write(file.path)
        assert_equal(File.binread(@jpg), File.binread(file.path))
      ensure
        file.unlink
      end
    end

    Dir.glob(File.join(TEST_DATA_DIR, 'images', '*.png')).each do |png_file|
      it "writes #{File.basename(png_file)} correctly as PNG file" do
        image = @doc.images.add(png_file)
        image.write(@file.path)
        assert_valid_png(@file.path, png_file)

        image.delete(:DecodeParms) # force re-encoding of stream
        image.write(@file.path)
        assert_valid_png(@file.path, png_file)

        new_image = @doc.images.add(@file.path)

        assert_equal(image[:Width], new_image[:Width], "file: #{png_file}")
        assert_equal(image[:Height], new_image[:Height], "file: #{png_file}")
        assert_equal(image[:BitsPerComponent], new_image[:BitsPerComponent], "file: #{png_file}")
        if image[:Mask]
          assert_equal(image[:Mask], new_image[:Mask], "file: #{png_file}")
        else
          assert_nil(new_image[:Mask], "file: #{png_file}")
        end
        assert_equal(image.stream, new_image.stream, "file: #{png_file}")

        # ColorSpace is currently not always preserved, e.g. with CalRGB
        if Array(image[:ColorSpace]).first == :Indexed
          assert_equal(image[:ColorSpace][2], new_image[:ColorSpace][2], "file: #{png_file}")

          img_palette = image[:ColorSpace][3]
          img_palette = img_palette.stream if img_palette.respond_to?(:stream)
          new_img_palette = new_image[:ColorSpace][3]
          new_img_palette = new_img_palette.stream if new_img_palette.respond_to?(:stream)
          assert_equal(img_palette, new_img_palette, "file: #{png_file}")
        end
      end
    end

    it "works for greyscale indexed images" do
      image = @doc.add(Type: :XObject, Subtype: :Image, Width: 2, Height: 2, BitsPerComponent: 2,
                       ColorSpace: [:Indexed, :DeviceGray, 3, "\x00\x40\x80\xFF".b])
      image.stream = HexaPDF::StreamData.new(filter: :ASCIIHexDecode) { "10 B0".b }
      image.write(@file.path)
      assert_valid_png(@file.path)

      new_image = @doc.images.add(@file.path)
      assert_equal([:Indexed, :DeviceRGB, 3, "\x00\x00\x00\x40\x40\x40\x80\x80\x80\xFF\xFF\xFF".b],
                   new_image[:ColorSpace])
      assert_equal(image.stream, new_image.stream)
    end

    it "fails if an unsupported stream filter is used" do
      image = @doc.images.add(@jpg)
      image.set_filter([:DCTDecode, :ASCIIHexDecode])
      assert_raises(HexaPDF::Error) { image.write(@file) }
    end

    it "fails if an unsupported colorspace is used" do
      image = @doc.add(Type: :XObject, Subtype: :Image, Width: 1, Height: 1, BitsPerComponent: 8,
                       ColorSpace: :ICCBased)
      assert_raises(HexaPDF::Error) { image.write(@file) }
    end

    it "fails if an indexed image with an unsupported colorspace is used" do
      image = @doc.add(Type: :XObject, Subtype: :Image, Width: 1, Height: 1, BitsPerComponent: 8,
                       ColorSpace: [:Indexed, :ICCBased, 0, "0"])
      assert_raises(HexaPDF::Error) { image.write(@file) }
    end
  end
end
