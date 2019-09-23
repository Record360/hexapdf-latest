# -*- encoding: utf-8 -*-
# stub: hexapdf 0.9.3 ruby lib

Gem::Specification.new do |s|
  s.name = "hexapdf".freeze
  s.version = "0.9.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Thomas Leitner".freeze]
  s.date = "2019-09-23"
  s.description = "HexaPDF is a pure Ruby library with an accompanying application for working with PDF files.\n\nIn short, it allows creating new PDF files, manipulating existing PDF files, merging multiple PDF files into one, extracting meta information, text, images and files from PDF files, securing PDF files by encrypting them and optimizing PDF files for smaller file size or other criteria.\n\nHexaPDF was designed with ease of use and performance in mind. It uses lazy loading and lazy computing when possible and tries to produce small PDF files by default.".freeze
  s.email = "t_leitner@gmx.at".freeze
  s.executables = ["hexapdf".freeze]
  s.files = ["CHANGELOG.md".freeze, "CONTRIBUTERS".freeze, "LICENSE".freeze, "README.md".freeze, "Rakefile".freeze, "VERSION".freeze, "agpl-3.0.txt".freeze, "bin/hexapdf".freeze, "data/hexapdf".freeze, "data/hexapdf/afm".freeze, "data/hexapdf/afm/Courier-Bold.afm".freeze, "data/hexapdf/afm/Courier-BoldOblique.afm".freeze, "data/hexapdf/afm/Courier-Oblique.afm".freeze, "data/hexapdf/afm/Courier.afm".freeze, "data/hexapdf/afm/Helvetica-Bold.afm".freeze, "data/hexapdf/afm/Helvetica-BoldOblique.afm".freeze, "data/hexapdf/afm/Helvetica-Oblique.afm".freeze, "data/hexapdf/afm/Helvetica.afm".freeze, "data/hexapdf/afm/MustRead.html".freeze, "data/hexapdf/afm/Symbol.afm".freeze, "data/hexapdf/afm/Times-Bold.afm".freeze, "data/hexapdf/afm/Times-BoldItalic.afm".freeze, "data/hexapdf/afm/Times-Italic.afm".freeze, "data/hexapdf/afm/Times-Roman.afm".freeze, "data/hexapdf/afm/ZapfDingbats.afm".freeze, "data/hexapdf/cmap".freeze, "data/hexapdf/cmap/83pv-RKSJ-H".freeze, "data/hexapdf/cmap/90ms-RKSJ-H".freeze, "data/hexapdf/cmap/90ms-RKSJ-V".freeze, "data/hexapdf/cmap/90msp-RKSJ-H".freeze, "data/hexapdf/cmap/90msp-RKSJ-V".freeze, "data/hexapdf/cmap/90pv-RKSJ-H".freeze, "data/hexapdf/cmap/Add-RKSJ-H".freeze, "data/hexapdf/cmap/Add-RKSJ-V".freeze, "data/hexapdf/cmap/Adobe-CNS1-UCS2".freeze, "data/hexapdf/cmap/Adobe-GB1-UCS2".freeze, "data/hexapdf/cmap/Adobe-Japan1-UCS2".freeze, "data/hexapdf/cmap/Adobe-Korea1-UCS2".freeze, "data/hexapdf/cmap/B5pc-H".freeze, "data/hexapdf/cmap/B5pc-V".freeze, "data/hexapdf/cmap/CNS-EUC-H".freeze, "data/hexapdf/cmap/CNS-EUC-V".freeze, "data/hexapdf/cmap/ETen-B5-H".freeze, "data/hexapdf/cmap/ETen-B5-V".freeze, "data/hexapdf/cmap/ETenms-B5-H".freeze, "data/hexapdf/cmap/ETenms-B5-V".freeze, "data/hexapdf/cmap/EUC-H".freeze, "data/hexapdf/cmap/EUC-V".freeze, "data/hexapdf/cmap/Ext-RKSJ-H".freeze, "data/hexapdf/cmap/Ext-RKSJ-V".freeze, "data/hexapdf/cmap/GB-EUC-H".freeze, "data/hexapdf/cmap/GB-EUC-V".freeze, "data/hexapdf/cmap/GBK-EUC-H".freeze, "data/hexapdf/cmap/GBK-EUC-V".freeze, "data/hexapdf/cmap/GBK2K-H".freeze, "data/hexapdf/cmap/GBK2K-V".freeze, "data/hexapdf/cmap/GBKp-EUC-H".freeze, "data/hexapdf/cmap/GBKp-EUC-V".freeze, "data/hexapdf/cmap/GBpc-EUC-H".freeze, "data/hexapdf/cmap/GBpc-EUC-V".freeze, "data/hexapdf/cmap/H".freeze, "data/hexapdf/cmap/HKscs-B5-H".freeze, "data/hexapdf/cmap/HKscs-B5-V".freeze, "data/hexapdf/cmap/Identity-H".freeze, "data/hexapdf/cmap/Identity-V".freeze, "data/hexapdf/cmap/KSC-EUC-H".freeze, "data/hexapdf/cmap/KSC-EUC-V".freeze, "data/hexapdf/cmap/KSCms-UHC-H".freeze, "data/hexapdf/cmap/KSCms-UHC-HW-H".freeze, "data/hexapdf/cmap/KSCms-UHC-HW-V".freeze, "data/hexapdf/cmap/KSCms-UHC-V".freeze, "data/hexapdf/cmap/KSCpc-EUC-H".freeze, "data/hexapdf/cmap/LICENSE.txt".freeze, "data/hexapdf/cmap/README.txt".freeze, "data/hexapdf/cmap/UniCNS-UCS2-H".freeze, "data/hexapdf/cmap/UniCNS-UCS2-V".freeze, "data/hexapdf/cmap/UniCNS-UTF16-H".freeze, "data/hexapdf/cmap/UniCNS-UTF16-V".freeze, "data/hexapdf/cmap/UniGB-UCS2-H".freeze, "data/hexapdf/cmap/UniGB-UCS2-V".freeze, "data/hexapdf/cmap/UniGB-UTF16-H".freeze, "data/hexapdf/cmap/UniGB-UTF16-V".freeze, "data/hexapdf/cmap/UniJIS-UCS2-H".freeze, "data/hexapdf/cmap/UniJIS-UCS2-HW-H".freeze, "data/hexapdf/cmap/UniJIS-UCS2-HW-V".freeze, "data/hexapdf/cmap/UniJIS-UCS2-V".freeze, "data/hexapdf/cmap/UniJIS-UTF16-H".freeze, "data/hexapdf/cmap/UniJIS-UTF16-V".freeze, "data/hexapdf/cmap/UniKS-UCS2-H".freeze, "data/hexapdf/cmap/UniKS-UCS2-V".freeze, "data/hexapdf/cmap/UniKS-UTF16-H".freeze, "data/hexapdf/cmap/UniKS-UTF16-V".freeze, "data/hexapdf/cmap/V".freeze, "data/hexapdf/encoding".freeze, "data/hexapdf/encoding/glyphlist.txt".freeze, "data/hexapdf/encoding/zapfdingbats.txt".freeze, "examples/001-hello_world.rb".freeze, "examples/002-graphics.rb".freeze, "examples/003-arcs.rb".freeze, "examples/004-optimizing.rb".freeze, "examples/005-merging.rb".freeze, "examples/006-standard_pdf_fonts.rb".freeze, "examples/007-truetype.rb".freeze, "examples/008-show_char_bboxes.rb".freeze, "examples/009-text_layouter_alignment.rb".freeze, "examples/010-text_layouter_inline_boxes.rb".freeze, "examples/011-text_layouter_line_wrapping.rb".freeze, "examples/012-text_layouter_styling.rb".freeze, "examples/013-text_layouter_shapes.rb".freeze, "examples/014-text_in_polygon.rb".freeze, "examples/015-boxes.rb".freeze, "examples/016-frame_automatic_box_placement.rb".freeze, "examples/017-frame_text_flow.rb".freeze, "examples/018-composer.rb".freeze, "examples/emoji-smile.png".freeze, "examples/emoji-wink.png".freeze, "examples/machupicchu.jpg".freeze, "lib/hexapdf.rb".freeze, "lib/hexapdf/cli.rb".freeze, "lib/hexapdf/cli/batch.rb".freeze, "lib/hexapdf/cli/command.rb".freeze, "lib/hexapdf/cli/files.rb".freeze, "lib/hexapdf/cli/images.rb".freeze, "lib/hexapdf/cli/info.rb".freeze, "lib/hexapdf/cli/inspect.rb".freeze, "lib/hexapdf/cli/merge.rb".freeze, "lib/hexapdf/cli/modify.rb".freeze, "lib/hexapdf/cli/optimize.rb".freeze, "lib/hexapdf/cli/split.rb".freeze, "lib/hexapdf/composer.rb".freeze, "lib/hexapdf/configuration.rb".freeze, "lib/hexapdf/content.rb".freeze, "lib/hexapdf/content/canvas.rb".freeze, "lib/hexapdf/content/color_space.rb".freeze, "lib/hexapdf/content/graphic_object.rb".freeze, "lib/hexapdf/content/graphic_object/arc.rb".freeze, "lib/hexapdf/content/graphic_object/endpoint_arc.rb".freeze, "lib/hexapdf/content/graphic_object/geom2d.rb".freeze, "lib/hexapdf/content/graphic_object/solid_arc.rb".freeze, "lib/hexapdf/content/graphics_state.rb".freeze, "lib/hexapdf/content/operator.rb".freeze, "lib/hexapdf/content/parser.rb".freeze, "lib/hexapdf/content/processor.rb".freeze, "lib/hexapdf/content/transformation_matrix.rb".freeze, "lib/hexapdf/data_dir.rb".freeze, "lib/hexapdf/dictionary.rb".freeze, "lib/hexapdf/dictionary_fields.rb".freeze, "lib/hexapdf/document.rb".freeze, "lib/hexapdf/document/files.rb".freeze, "lib/hexapdf/document/fonts.rb".freeze, "lib/hexapdf/document/images.rb".freeze, "lib/hexapdf/document/pages.rb".freeze, "lib/hexapdf/encryption.rb".freeze, "lib/hexapdf/encryption/aes.rb".freeze, "lib/hexapdf/encryption/arc4.rb".freeze, "lib/hexapdf/encryption/fast_aes.rb".freeze, "lib/hexapdf/encryption/fast_arc4.rb".freeze, "lib/hexapdf/encryption/identity.rb".freeze, "lib/hexapdf/encryption/ruby_aes.rb".freeze, "lib/hexapdf/encryption/ruby_arc4.rb".freeze, "lib/hexapdf/encryption/security_handler.rb".freeze, "lib/hexapdf/encryption/standard_security_handler.rb".freeze, "lib/hexapdf/error.rb".freeze, "lib/hexapdf/filter.rb".freeze, "lib/hexapdf/filter/ascii85_decode.rb".freeze, "lib/hexapdf/filter/ascii_hex_decode.rb".freeze, "lib/hexapdf/filter/dct_decode.rb".freeze, "lib/hexapdf/filter/encryption.rb".freeze, "lib/hexapdf/filter/flate_decode.rb".freeze, "lib/hexapdf/filter/jpx_decode.rb".freeze, "lib/hexapdf/filter/lzw_decode.rb".freeze, "lib/hexapdf/filter/predictor.rb".freeze, "lib/hexapdf/filter/run_length_decode.rb".freeze, "lib/hexapdf/font/cmap.rb".freeze, "lib/hexapdf/font/cmap/parser.rb".freeze, "lib/hexapdf/font/cmap/writer.rb".freeze, "lib/hexapdf/font/encoding.rb".freeze, "lib/hexapdf/font/encoding/base.rb".freeze, "lib/hexapdf/font/encoding/difference_encoding.rb".freeze, "lib/hexapdf/font/encoding/glyph_list.rb".freeze, "lib/hexapdf/font/encoding/mac_expert_encoding.rb".freeze, "lib/hexapdf/font/encoding/mac_roman_encoding.rb".freeze, "lib/hexapdf/font/encoding/standard_encoding.rb".freeze, "lib/hexapdf/font/encoding/symbol_encoding.rb".freeze, "lib/hexapdf/font/encoding/win_ansi_encoding.rb".freeze, "lib/hexapdf/font/encoding/zapf_dingbats_encoding.rb".freeze, "lib/hexapdf/font/invalid_glyph.rb".freeze, "lib/hexapdf/font/true_type.rb".freeze, "lib/hexapdf/font/true_type/builder.rb".freeze, "lib/hexapdf/font/true_type/font.rb".freeze, "lib/hexapdf/font/true_type/optimizer.rb".freeze, "lib/hexapdf/font/true_type/subsetter.rb".freeze, "lib/hexapdf/font/true_type/table.rb".freeze, "lib/hexapdf/font/true_type/table/cmap.rb".freeze, "lib/hexapdf/font/true_type/table/cmap_subtable.rb".freeze, "lib/hexapdf/font/true_type/table/directory.rb".freeze, "lib/hexapdf/font/true_type/table/glyf.rb".freeze, "lib/hexapdf/font/true_type/table/head.rb".freeze, "lib/hexapdf/font/true_type/table/hhea.rb".freeze, "lib/hexapdf/font/true_type/table/hmtx.rb".freeze, "lib/hexapdf/font/true_type/table/kern.rb".freeze, "lib/hexapdf/font/true_type/table/loca.rb".freeze, "lib/hexapdf/font/true_type/table/maxp.rb".freeze, "lib/hexapdf/font/true_type/table/name.rb".freeze, "lib/hexapdf/font/true_type/table/os2.rb".freeze, "lib/hexapdf/font/true_type/table/post.rb".freeze, "lib/hexapdf/font/true_type_wrapper.rb".freeze, "lib/hexapdf/font/type1.rb".freeze, "lib/hexapdf/font/type1/afm_parser.rb".freeze, "lib/hexapdf/font/type1/character_metrics.rb".freeze, "lib/hexapdf/font/type1/font.rb".freeze, "lib/hexapdf/font/type1/font_metrics.rb".freeze, "lib/hexapdf/font/type1/pfb_parser.rb".freeze, "lib/hexapdf/font/type1_wrapper.rb".freeze, "lib/hexapdf/font_loader.rb".freeze, "lib/hexapdf/font_loader/from_configuration.rb".freeze, "lib/hexapdf/font_loader/from_file.rb".freeze, "lib/hexapdf/font_loader/standard14.rb".freeze, "lib/hexapdf/image_loader.rb".freeze, "lib/hexapdf/image_loader/jpeg.rb".freeze, "lib/hexapdf/image_loader/pdf.rb".freeze, "lib/hexapdf/image_loader/png.rb".freeze, "lib/hexapdf/importer.rb".freeze, "lib/hexapdf/layout.rb".freeze, "lib/hexapdf/layout/box.rb".freeze, "lib/hexapdf/layout/frame.rb".freeze, "lib/hexapdf/layout/image_box.rb".freeze, "lib/hexapdf/layout/inline_box.rb".freeze, "lib/hexapdf/layout/line.rb".freeze, "lib/hexapdf/layout/numeric_refinements.rb".freeze, "lib/hexapdf/layout/style.rb".freeze, "lib/hexapdf/layout/text_box.rb".freeze, "lib/hexapdf/layout/text_fragment.rb".freeze, "lib/hexapdf/layout/text_layouter.rb".freeze, "lib/hexapdf/layout/text_shaper.rb".freeze, "lib/hexapdf/layout/width_from_polygon.rb".freeze, "lib/hexapdf/name_tree_node.rb".freeze, "lib/hexapdf/number_tree_node.rb".freeze, "lib/hexapdf/object.rb".freeze, "lib/hexapdf/parser.rb".freeze, "lib/hexapdf/rectangle.rb".freeze, "lib/hexapdf/reference.rb".freeze, "lib/hexapdf/revision.rb".freeze, "lib/hexapdf/revisions.rb".freeze, "lib/hexapdf/serializer.rb".freeze, "lib/hexapdf/stream.rb".freeze, "lib/hexapdf/task.rb".freeze, "lib/hexapdf/task/dereference.rb".freeze, "lib/hexapdf/task/optimize.rb".freeze, "lib/hexapdf/tokenizer.rb".freeze, "lib/hexapdf/type.rb".freeze, "lib/hexapdf/type/action.rb".freeze, "lib/hexapdf/type/actions.rb".freeze, "lib/hexapdf/type/actions/go_to.rb".freeze, "lib/hexapdf/type/actions/go_to_r.rb".freeze, "lib/hexapdf/type/actions/launch.rb".freeze, "lib/hexapdf/type/actions/uri.rb".freeze, "lib/hexapdf/type/annotation.rb".freeze, "lib/hexapdf/type/annotations.rb".freeze, "lib/hexapdf/type/annotations/link.rb".freeze, "lib/hexapdf/type/annotations/markup_annotation.rb".freeze, "lib/hexapdf/type/annotations/text.rb".freeze, "lib/hexapdf/type/catalog.rb".freeze, "lib/hexapdf/type/cid_font.rb".freeze, "lib/hexapdf/type/embedded_file.rb".freeze, "lib/hexapdf/type/file_specification.rb".freeze, "lib/hexapdf/type/font.rb".freeze, "lib/hexapdf/type/font_descriptor.rb".freeze, "lib/hexapdf/type/font_simple.rb".freeze, "lib/hexapdf/type/font_true_type.rb".freeze, "lib/hexapdf/type/font_type0.rb".freeze, "lib/hexapdf/type/font_type1.rb".freeze, "lib/hexapdf/type/font_type3.rb".freeze, "lib/hexapdf/type/form.rb".freeze, "lib/hexapdf/type/graphics_state_parameter.rb".freeze, "lib/hexapdf/type/image.rb".freeze, "lib/hexapdf/type/info.rb".freeze, "lib/hexapdf/type/names.rb".freeze, "lib/hexapdf/type/object_stream.rb".freeze, "lib/hexapdf/type/page.rb".freeze, "lib/hexapdf/type/page_tree_node.rb".freeze, "lib/hexapdf/type/resources.rb".freeze, "lib/hexapdf/type/trailer.rb".freeze, "lib/hexapdf/type/viewer_preferences.rb".freeze, "lib/hexapdf/type/xref_stream.rb".freeze, "lib/hexapdf/utils/bit_field.rb".freeze, "lib/hexapdf/utils/bit_stream.rb".freeze, "lib/hexapdf/utils/graphics_helpers.rb".freeze, "lib/hexapdf/utils/lru_cache.rb".freeze, "lib/hexapdf/utils/math_helpers.rb".freeze, "lib/hexapdf/utils/object_hash.rb".freeze, "lib/hexapdf/utils/pdf_doc_encoding.rb".freeze, "lib/hexapdf/utils/sorted_tree_node.rb".freeze, "lib/hexapdf/version.rb".freeze, "lib/hexapdf/writer.rb".freeze, "lib/hexapdf/xref_section.rb".freeze, "man/man1/hexapdf.1".freeze, "test/data".freeze, "test/data/aes-test-vectors".freeze, "test/data/aes-test-vectors/CBCGFSbox-128-decrypt.data.gz".freeze, "test/data/aes-test-vectors/CBCGFSbox-128-encrypt.data.gz".freeze, "test/data/aes-test-vectors/CBCGFSbox-192-decrypt.data.gz".freeze, "test/data/aes-test-vectors/CBCGFSbox-192-encrypt.data.gz".freeze, "test/data/aes-test-vectors/CBCGFSbox-256-decrypt.data.gz".freeze, "test/data/aes-test-vectors/CBCGFSbox-256-encrypt.data.gz".freeze, "test/data/aes-test-vectors/CBCKeySbox-128-decrypt.data.gz".freeze, "test/data/aes-test-vectors/CBCKeySbox-128-encrypt.data.gz".freeze, "test/data/aes-test-vectors/CBCKeySbox-192-decrypt.data.gz".freeze, "test/data/aes-test-vectors/CBCKeySbox-192-encrypt.data.gz".freeze, "test/data/aes-test-vectors/CBCKeySbox-256-decrypt.data.gz".freeze, "test/data/aes-test-vectors/CBCKeySbox-256-encrypt.data.gz".freeze, "test/data/aes-test-vectors/CBCVarKey-128-decrypt.data.gz".freeze, "test/data/aes-test-vectors/CBCVarKey-128-encrypt.data.gz".freeze, "test/data/aes-test-vectors/CBCVarKey-192-decrypt.data.gz".freeze, "test/data/aes-test-vectors/CBCVarKey-192-encrypt.data.gz".freeze, "test/data/aes-test-vectors/CBCVarKey-256-decrypt.data.gz".freeze, "test/data/aes-test-vectors/CBCVarKey-256-encrypt.data.gz".freeze, "test/data/aes-test-vectors/CBCVarTxt-128-decrypt.data.gz".freeze, "test/data/aes-test-vectors/CBCVarTxt-128-encrypt.data.gz".freeze, "test/data/aes-test-vectors/CBCVarTxt-192-decrypt.data.gz".freeze, "test/data/aes-test-vectors/CBCVarTxt-192-encrypt.data.gz".freeze, "test/data/aes-test-vectors/CBCVarTxt-256-decrypt.data.gz".freeze, "test/data/aes-test-vectors/CBCVarTxt-256-encrypt.data.gz".freeze, "test/data/fonts".freeze, "test/data/fonts/Ubuntu-Title.ttf".freeze, "test/data/images".freeze, "test/data/images/cmyk.jpg".freeze, "test/data/images/fillbytes.jpg".freeze, "test/data/images/gray.jpg".freeze, "test/data/images/greyscale-1bit.png".freeze, "test/data/images/greyscale-2bit.png".freeze, "test/data/images/greyscale-4bit.png".freeze, "test/data/images/greyscale-8bit.png".freeze, "test/data/images/greyscale-alpha-8bit.png".freeze, "test/data/images/greyscale-trns-8bit.png".freeze, "test/data/images/greyscale-with-gamma1.0.png".freeze, "test/data/images/greyscale-with-gamma1.5.png".freeze, "test/data/images/indexed-1bit.png".freeze, "test/data/images/indexed-2bit.png".freeze, "test/data/images/indexed-4bit.png".freeze, "test/data/images/indexed-8bit.png".freeze, "test/data/images/indexed-alpha-4bit.png".freeze, "test/data/images/indexed-alpha-8bit.png".freeze, "test/data/images/rgb.jpg".freeze, "test/data/images/truecolour-8bit.png".freeze, "test/data/images/truecolour-alpha-8bit.png".freeze, "test/data/images/truecolour-gama-chrm-8bit.png".freeze, "test/data/images/truecolour-srgb-8bit.png".freeze, "test/data/images/ycck.jpg".freeze, "test/data/minimal.pdf".freeze, "test/data/standard-security-handler".freeze, "test/data/standard-security-handler/README".freeze, "test/data/standard-security-handler/bothpwd-aes-128bit-V4.pdf".freeze, "test/data/standard-security-handler/bothpwd-aes-256bit-V5.pdf".freeze, "test/data/standard-security-handler/bothpwd-arc4-128bit-V2.pdf".freeze, "test/data/standard-security-handler/bothpwd-arc4-128bit-V4.pdf".freeze, "test/data/standard-security-handler/bothpwd-arc4-40bit-V1.pdf".freeze, "test/data/standard-security-handler/nopwd-aes-128bit-V4.pdf".freeze, "test/data/standard-security-handler/nopwd-aes-256bit-V5.pdf".freeze, "test/data/standard-security-handler/nopwd-arc4-128bit-V2.pdf".freeze, "test/data/standard-security-handler/nopwd-arc4-128bit-V4.pdf".freeze, "test/data/standard-security-handler/nopwd-arc4-40bit-V1.pdf".freeze, "test/data/standard-security-handler/ownerpwd-aes-128bit-V4.pdf".freeze, "test/data/standard-security-handler/ownerpwd-aes-256bit-V5.pdf".freeze, "test/data/standard-security-handler/ownerpwd-arc4-128bit-V2.pdf".freeze, "test/data/standard-security-handler/ownerpwd-arc4-128bit-V4.pdf".freeze, "test/data/standard-security-handler/ownerpwd-arc4-40bit-V1.pdf".freeze, "test/data/standard-security-handler/userpwd-aes-128bit-V4.pdf".freeze, "test/data/standard-security-handler/userpwd-aes-256bit-V5.pdf".freeze, "test/data/standard-security-handler/userpwd-arc4-128bit-V2.pdf".freeze, "test/data/standard-security-handler/userpwd-arc4-128bit-V4.pdf".freeze, "test/data/standard-security-handler/userpwd-arc4-40bit-V1.pdf".freeze, "test/hexapdf".freeze, "test/hexapdf/common_tokenizer_tests.rb".freeze, "test/hexapdf/content".freeze, "test/hexapdf/content/common.rb".freeze, "test/hexapdf/content/graphic_object".freeze, "test/hexapdf/content/graphic_object/test_arc.rb".freeze, "test/hexapdf/content/graphic_object/test_endpoint_arc.rb".freeze, "test/hexapdf/content/graphic_object/test_geom2d.rb".freeze, "test/hexapdf/content/graphic_object/test_solid_arc.rb".freeze, "test/hexapdf/content/test_canvas.rb".freeze, "test/hexapdf/content/test_color_space.rb".freeze, "test/hexapdf/content/test_graphics_state.rb".freeze, "test/hexapdf/content/test_operator.rb".freeze, "test/hexapdf/content/test_parser.rb".freeze, "test/hexapdf/content/test_processor.rb".freeze, "test/hexapdf/content/test_transformation_matrix.rb".freeze, "test/hexapdf/document".freeze, "test/hexapdf/document/test_files.rb".freeze, "test/hexapdf/document/test_fonts.rb".freeze, "test/hexapdf/document/test_images.rb".freeze, "test/hexapdf/document/test_pages.rb".freeze, "test/hexapdf/encryption".freeze, "test/hexapdf/encryption/common.rb".freeze, "test/hexapdf/encryption/test_aes.rb".freeze, "test/hexapdf/encryption/test_arc4.rb".freeze, "test/hexapdf/encryption/test_fast_aes.rb".freeze, "test/hexapdf/encryption/test_fast_arc4.rb".freeze, "test/hexapdf/encryption/test_identity.rb".freeze, "test/hexapdf/encryption/test_ruby_aes.rb".freeze, "test/hexapdf/encryption/test_ruby_arc4.rb".freeze, "test/hexapdf/encryption/test_security_handler.rb".freeze, "test/hexapdf/encryption/test_standard_security_handler.rb".freeze, "test/hexapdf/filter".freeze, "test/hexapdf/filter/common.rb".freeze, "test/hexapdf/filter/test_ascii85_decode.rb".freeze, "test/hexapdf/filter/test_ascii_hex_decode.rb".freeze, "test/hexapdf/filter/test_encryption.rb".freeze, "test/hexapdf/filter/test_flate_decode.rb".freeze, "test/hexapdf/filter/test_lzw_decode.rb".freeze, "test/hexapdf/filter/test_predictor.rb".freeze, "test/hexapdf/filter/test_run_length_decode.rb".freeze, "test/hexapdf/font".freeze, "test/hexapdf/font/cmap".freeze, "test/hexapdf/font/cmap/test_parser.rb".freeze, "test/hexapdf/font/cmap/test_writer.rb".freeze, "test/hexapdf/font/encoding".freeze, "test/hexapdf/font/encoding/test_base.rb".freeze, "test/hexapdf/font/encoding/test_difference_encoding.rb".freeze, "test/hexapdf/font/encoding/test_glyph_list.rb".freeze, "test/hexapdf/font/encoding/test_zapf_dingbats_encoding.rb".freeze, "test/hexapdf/font/test_cmap.rb".freeze, "test/hexapdf/font/test_encoding.rb".freeze, "test/hexapdf/font/test_invalid_glyph.rb".freeze, "test/hexapdf/font/test_true_type_wrapper.rb".freeze, "test/hexapdf/font/test_type1_wrapper.rb".freeze, "test/hexapdf/font/true_type".freeze, "test/hexapdf/font/true_type/common.rb".freeze, "test/hexapdf/font/true_type/table".freeze, "test/hexapdf/font/true_type/table/common.rb".freeze, "test/hexapdf/font/true_type/table/test_cmap.rb".freeze, "test/hexapdf/font/true_type/table/test_cmap_subtable.rb".freeze, "test/hexapdf/font/true_type/table/test_directory.rb".freeze, "test/hexapdf/font/true_type/table/test_glyf.rb".freeze, "test/hexapdf/font/true_type/table/test_head.rb".freeze, "test/hexapdf/font/true_type/table/test_hhea.rb".freeze, "test/hexapdf/font/true_type/table/test_hmtx.rb".freeze, "test/hexapdf/font/true_type/table/test_kern.rb".freeze, "test/hexapdf/font/true_type/table/test_loca.rb".freeze, "test/hexapdf/font/true_type/table/test_maxp.rb".freeze, "test/hexapdf/font/true_type/table/test_name.rb".freeze, "test/hexapdf/font/true_type/table/test_os2.rb".freeze, "test/hexapdf/font/true_type/table/test_post.rb".freeze, "test/hexapdf/font/true_type/test_builder.rb".freeze, "test/hexapdf/font/true_type/test_font.rb".freeze, "test/hexapdf/font/true_type/test_optimizer.rb".freeze, "test/hexapdf/font/true_type/test_subsetter.rb".freeze, "test/hexapdf/font/true_type/test_table.rb".freeze, "test/hexapdf/font/type1".freeze, "test/hexapdf/font/type1/common.rb".freeze, "test/hexapdf/font/type1/test_afm_parser.rb".freeze, "test/hexapdf/font/type1/test_font.rb".freeze, "test/hexapdf/font/type1/test_font_metrics.rb".freeze, "test/hexapdf/font/type1/test_pfb_parser.rb".freeze, "test/hexapdf/font_loader".freeze, "test/hexapdf/font_loader/test_from_configuration.rb".freeze, "test/hexapdf/font_loader/test_from_file.rb".freeze, "test/hexapdf/font_loader/test_standard14.rb".freeze, "test/hexapdf/image_loader".freeze, "test/hexapdf/image_loader/test_jpeg.rb".freeze, "test/hexapdf/image_loader/test_pdf.rb".freeze, "test/hexapdf/image_loader/test_png.rb".freeze, "test/hexapdf/layout".freeze, "test/hexapdf/layout/test_box.rb".freeze, "test/hexapdf/layout/test_frame.rb".freeze, "test/hexapdf/layout/test_image_box.rb".freeze, "test/hexapdf/layout/test_inline_box.rb".freeze, "test/hexapdf/layout/test_line.rb".freeze, "test/hexapdf/layout/test_style.rb".freeze, "test/hexapdf/layout/test_text_box.rb".freeze, "test/hexapdf/layout/test_text_fragment.rb".freeze, "test/hexapdf/layout/test_text_layouter.rb".freeze, "test/hexapdf/layout/test_text_shaper.rb".freeze, "test/hexapdf/layout/test_width_from_polygon.rb".freeze, "test/hexapdf/task".freeze, "test/hexapdf/task/test_dereference.rb".freeze, "test/hexapdf/task/test_optimize.rb".freeze, "test/hexapdf/test_composer.rb".freeze, "test/hexapdf/test_configuration.rb".freeze, "test/hexapdf/test_data_dir.rb".freeze, "test/hexapdf/test_dictionary.rb".freeze, "test/hexapdf/test_dictionary_fields.rb".freeze, "test/hexapdf/test_document.rb".freeze, "test/hexapdf/test_filter.rb".freeze, "test/hexapdf/test_importer.rb".freeze, "test/hexapdf/test_object.rb".freeze, "test/hexapdf/test_parser.rb".freeze, "test/hexapdf/test_rectangle.rb".freeze, "test/hexapdf/test_reference.rb".freeze, "test/hexapdf/test_revision.rb".freeze, "test/hexapdf/test_revisions.rb".freeze, "test/hexapdf/test_serializer.rb".freeze, "test/hexapdf/test_stream.rb".freeze, "test/hexapdf/test_tokenizer.rb".freeze, "test/hexapdf/test_type.rb".freeze, "test/hexapdf/test_writer.rb".freeze, "test/hexapdf/test_xref_section.rb".freeze, "test/hexapdf/type".freeze, "test/hexapdf/type/actions".freeze, "test/hexapdf/type/actions/test_launch.rb".freeze, "test/hexapdf/type/actions/test_uri.rb".freeze, "test/hexapdf/type/annotations".freeze, "test/hexapdf/type/annotations/test_link.rb".freeze, "test/hexapdf/type/annotations/test_markup_annotation.rb".freeze, "test/hexapdf/type/annotations/test_text.rb".freeze, "test/hexapdf/type/test_annotation.rb".freeze, "test/hexapdf/type/test_catalog.rb".freeze, "test/hexapdf/type/test_cid_font.rb".freeze, "test/hexapdf/type/test_file_specification.rb".freeze, "test/hexapdf/type/test_font.rb".freeze, "test/hexapdf/type/test_font_descriptor.rb".freeze, "test/hexapdf/type/test_font_simple.rb".freeze, "test/hexapdf/type/test_font_true_type.rb".freeze, "test/hexapdf/type/test_font_type0.rb".freeze, "test/hexapdf/type/test_font_type1.rb".freeze, "test/hexapdf/type/test_font_type3.rb".freeze, "test/hexapdf/type/test_form.rb".freeze, "test/hexapdf/type/test_image.rb".freeze, "test/hexapdf/type/test_info.rb".freeze, "test/hexapdf/type/test_object_stream.rb".freeze, "test/hexapdf/type/test_page.rb".freeze, "test/hexapdf/type/test_page_tree_node.rb".freeze, "test/hexapdf/type/test_resources.rb".freeze, "test/hexapdf/type/test_trailer.rb".freeze, "test/hexapdf/type/test_xref_stream.rb".freeze, "test/hexapdf/utils".freeze, "test/hexapdf/utils/test_bit_field.rb".freeze, "test/hexapdf/utils/test_bit_stream.rb".freeze, "test/hexapdf/utils/test_graphics_helpers.rb".freeze, "test/hexapdf/utils/test_lru_cache.rb".freeze, "test/hexapdf/utils/test_object_hash.rb".freeze, "test/hexapdf/utils/test_pdf_doc_encoding.rb".freeze, "test/hexapdf/utils/test_sorted_tree_node.rb".freeze, "test/test_helper.rb".freeze]
  s.homepage = "https://hexapdf.gettalong.org".freeze
  s.licenses = ["AGPL-3.0".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.4".freeze)
  s.rubygems_version = "2.7.6.2".freeze
  s.summary = "HexaPDF - A Versatile PDF Creation and Manipulation Library For Ruby".freeze

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<cmdparse>.freeze, [">= 3.0.3", "~> 3.0"])
      s.add_runtime_dependency(%q<geom2d>.freeze, ["~> 0.2"])
      s.add_development_dependency(%q<kramdown>.freeze, [">= 1.13.0", "~> 1.0"])
      s.add_development_dependency(%q<rubocop>.freeze, [">= 0.58.2", "~> 0.58"])
    else
      s.add_dependency(%q<cmdparse>.freeze, [">= 3.0.3", "~> 3.0"])
      s.add_dependency(%q<geom2d>.freeze, ["~> 0.2"])
      s.add_dependency(%q<kramdown>.freeze, [">= 1.13.0", "~> 1.0"])
      s.add_dependency(%q<rubocop>.freeze, [">= 0.58.2", "~> 0.58"])
    end
  else
    s.add_dependency(%q<cmdparse>.freeze, [">= 3.0.3", "~> 3.0"])
    s.add_dependency(%q<geom2d>.freeze, ["~> 0.2"])
    s.add_dependency(%q<kramdown>.freeze, [">= 1.13.0", "~> 1.0"])
    s.add_dependency(%q<rubocop>.freeze, [">= 0.58.2", "~> 0.58"])
  end
end
