Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32601C44515
	for <xen-devel@archiver.kernel.org>; Mon, 20 Jul 2026 15:49:57 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1366726.1616674 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wlqFY-0006ST-8s; Mon, 20 Jul 2026 15:49:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1366726.1616674; Mon, 20 Jul 2026 15:49:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wlqFY-0006SM-50; Mon, 20 Jul 2026 15:49:48 +0000
Received: by outflank-mailman (input) for mailman id 1366726;
 Mon, 20 Jul 2026 15:49:46 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marcus.granado@citrix.com>) id 1wlqFV-0006Pv-UI
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2026 15:49:46 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wlqFV-00HS72-Aw
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2026 17:49:45 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marcus.granado@citrix.com>)
 id 6a5e4386-bab6-0a2a0a5309dd-0a2a450a95b4-22
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 17:49:45 +0200
Received: from [160.101.131.9] (helo=na1pdmzitismtp02.tibco.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <marcus.granado@citrix.com>)
 id 6a5e4398-f2d2-0a2a450a0019-a0658309d57e-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 17:49:45 +0200
Received: from mewpvdipd1023.citrite.net (unknown [10.113.40.46])
 by na1pdmzitismtp02.tibco.com (Postfix) with ESMTPS id 2126E8291CA3;
 Mon, 20 Jul 2026 11:48:03 -0400 (EDT)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; none
From: Marcus Granado <marcus.granado@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Frediano Ziglio <freddy77@gmail.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Marcus Granado <marcus.granado@citrix.com>
Subject: [PATCH v1 1/6] tools/migration: introduce PAGE_DATA_LZ4 stream record type
Date: Mon, 20 Jul 2026 16:48:26 +0100
Message-ID: <20260720154832.1907401-2-marcus.granado@citrix.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260720154832.1907401-1-marcus.granado@citrix.com>
References: <20260720154832.1907401-1-marcus.granado@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-4011c0/1784562585-4B0D9CFC-669D5ACA/0/0
X-purgate-type: clean
X-purgate-size: 18033

Allocate a new migration stream record type REC_TYPE_PAGE_DATA_LZ4
(0x00000013) to transmit PAGE_DATA when payload is LZ4-compressed. The
record use the same xc_sr_rec_page_data_header as REC_TYPE_PAGE_DATA
but the page data section type changes from page_data to data_lz4.

Signed-off-by: Marcus Granado <marcus.granado@citrix.com>
---
 docs/specs/libxc-migration-stream.pandoc | 71 ++++++++++++++++-
 tools/libs/guest/xg_sr_common.c          |  4 +
 tools/libs/guest/xg_sr_stream_format.h   | 13 ++++
 tools/python/xen/migration/libxc.py      | 90 ++++++++++++++++++++-
 tools/python/xen/migration/tests.py      | 99 +++++++++++++++++++++++-
 5 files changed, 271 insertions(+), 6 deletions(-)

diff --git a/docs/specs/libxc-migration-stream.pandoc b/docs/specs/libxc-migration-stream.pandoc
index 1319ce1f1e..7469c95139 100644
--- a/docs/specs/libxc-migration-stream.pandoc
+++ b/docs/specs/libxc-migration-stream.pandoc
@@ -3,7 +3,8 @@
   Andrew Cooper <<andrew.cooper3@citrix.com>>
   Wen Congyang <<wency@cn.fujitsu.com>>
   Yang Hongyang <<hongyang.yang@easystack.cn>>
-% Revision 3
+  Marcus Granado <<marcus.granado@citrix.com>>
+% Revision 4
 
 Introduction
 ============
@@ -39,8 +40,6 @@ Not Yet Included
 The following features are not yet fully specified and will be
 included in a future draft.
 
-* Page data compression.
-
 * ARM
 
 
@@ -233,7 +232,9 @@ type         0x00000000: END
 
              0x00000012: X86_MSR_POLICY
 
-             0x00000013 - 0x7FFFFFFF: Reserved for future _mandatory_
+             0x00000013: PAGE_DATA_LZ4
+
+             0x00000014 - 0x7FFFFFFF: Reserved for future _mandatory_
              records.
 
              0x80000000 - 0xFFFFFFFF: Reserved for future _optional_
@@ -359,6 +360,68 @@ tail.
 
 \clearpage
 
+PAGE_DATA_LZ4
+-------------
+
+A PAGE_DATA_LZ4 record carries exactly the same information as a
+PAGE_DATA record, but with the page contents LZ4-compressed.  The saver
+may emit it in place of a PAGE_DATA record when LZ4 compression has been
+requested.
+
+     0     1     2     3     4     5     6     7 octet
+    +-----------------------+-------------------------+
+    | count (C)             | (reserved)              |
+    +-----------------------+-------------------------+
+    | pfn[0]                                          |
+    +-------------------------------------------------+
+    ...
+    +-------------------------------------------------+
+    | pfn[C-1]                                        |
+    +-----------+-------------------------------------+
+    | clen[0]   | page_data_lz4[0]...                 |
+    +-----------+-------------------------------------+
+    ...
+    +-----------+-------------------------------------+
+    | clen[N-1] | page_data_lz4[N-1]...               |
+    ...
+    +-------------------------------------------------+
+
+--------------------------------------------------------------------
+Field       Description
+----------- --------------------------------------------------------
+count       Number of pages described in this record.
+
+pfn         An array of count PFNs and their types, with the same
+            layout and page types as in a PAGE_DATA record.
+
+data_lz4    The compressed page contents, as one sub-block per page
+            set as present in the pfn array, in pfn-array order (i.e.
+            N sub-blocks, with N as in a PAGE_DATA record: N <= C).
+            Each sub-block is a `uint16` little-endian length `clen`
+            followed by either an LZ4 block or a raw page.  When
+            `clen > 0`, page_data_lz4 is `clen` octets of a raw LZ4
+            block (per the LZ4 block format) whose decompressed output
+            is one page_size page.  When `clen == 0`, page_data_lz4 is
+            page_size octets of a raw, uncompressed page.
+            A compressed `clen` is at most page_size - 1, occupying
+            only the low 12 bits; the top 4 bits are reserved for
+            future use and must be 0.
+--------------------------------------------------------------------
+
+The `count` (C) and `pfn` fields are identical in meaning and
+constraints to those of a PAGE_DATA record, and N (the number of
+present pages, N <= C) is as defined there.  Unlike PAGE_DATA, a
+PAGE_DATA_LZ4 record always has N >= 1 (at least one sub-block):
+the saver emits the LZ4 variant only when there is page data to
+compress, and a restoring side rejects a PAGE_DATA_LZ4 record with
+N == 0.  When a batch has no present pages (all pfns of invalid
+types) the saver emits a plain PAGE_DATA record instead.
+
+PAGE_DATA_LZ4 is a _mandatory_ record: a restoring side that does not
+support it must fail the migration.
+
+\clearpage
+
 X86_PV_INFO
 -----------
 
diff --git a/tools/libs/guest/xg_sr_common.c b/tools/libs/guest/xg_sr_common.c
index 9b2782b5cf..8b0a59fa4c 100644
--- a/tools/libs/guest/xg_sr_common.c
+++ b/tools/libs/guest/xg_sr_common.c
@@ -39,6 +39,7 @@ static const char *const mandatory_rec_types[] =
     [REC_TYPE_STATIC_DATA_END]              = "Static data end",
     [REC_TYPE_X86_CPUID_POLICY]             = "x86 CPUID policy",
     [REC_TYPE_X86_MSR_POLICY]               = "x86 MSR policy",
+    [REC_TYPE_PAGE_DATA_LZ4]                = "Page data (lz4)",
 };
 
 const char *rec_type_to_str(uint32_t type)
@@ -154,6 +155,9 @@ static void __attribute__((unused)) build_assertions(void)
     BUILD_BUG_ON(sizeof(struct xc_sr_rec_x86_tsc_info)      != 24);
     BUILD_BUG_ON(sizeof(struct xc_sr_rec_hvm_params_entry)  != 16);
     BUILD_BUG_ON(sizeof(struct xc_sr_rec_hvm_params)        != 8);
+
+    /* clen's low bits hold the compressed length; reserved bits stay clear */
+    BUILD_BUG_ON((PAGE_SIZE - 1) & PAGE_DATA_LZ4_CLEN_RESERVED_MASK);
 }
 
 /*
diff --git a/tools/libs/guest/xg_sr_stream_format.h b/tools/libs/guest/xg_sr_stream_format.h
index 99dca5d490..e12833b2cd 100644
--- a/tools/libs/guest/xg_sr_stream_format.h
+++ b/tools/libs/guest/xg_sr_stream_format.h
@@ -76,6 +76,7 @@ struct xc_sr_rhdr
 #define REC_TYPE_STATIC_DATA_END            0x00000010U
 #define REC_TYPE_X86_CPUID_POLICY           0x00000011U
 #define REC_TYPE_X86_MSR_POLICY             0x00000012U
+#define REC_TYPE_PAGE_DATA_LZ4              0x00000013U
 
 #define REC_TYPE_OPTIONAL             0x80000000U
 
@@ -90,6 +91,18 @@ struct xc_sr_rec_page_data_header
 #define PAGE_DATA_PFN_MASK  0x000fffffffffffffULL
 #define PAGE_DATA_TYPE_MASK 0xf000000000000000ULL
 
+/*
+ * PAGE_DATA_LZ4 payload: one sub-block per present page (pfn order), each a
+ * uint16 LE length clen then clen octets.  clen == PAGE_DATA_LZ4_CLEN_RAW
+ * means a raw PAGE_SIZE page follows.  A compressed length is at most
+ * PAGE_SIZE - 1, so it occupies only the low 12 bits; the top 4 bits
+ * (PAGE_DATA_LZ4_CLEN_RESERVED_MASK) are reserved for future use and must
+ * be 0.
+ */
+#define PAGE_DATA_LZ4_CLEN_SIZE          (sizeof(uint16_t))
+#define PAGE_DATA_LZ4_CLEN_RAW           0x0000U
+#define PAGE_DATA_LZ4_CLEN_RESERVED_MASK 0xF000U
+
 /* X86_PV_INFO */
 struct xc_sr_rec_x86_pv_info
 {
diff --git a/tools/python/xen/migration/libxc.py b/tools/python/xen/migration/libxc.py
index e52e632cb1..0b161749ea 100644
--- a/tools/python/xen/migration/libxc.py
+++ b/tools/python/xen/migration/libxc.py
@@ -58,6 +58,7 @@ REC_TYPE_checkpoint_dirty_pfn_list  = 0x0000000f
 REC_TYPE_static_data_end            = 0x00000010
 REC_TYPE_x86_cpuid_policy           = 0x00000011
 REC_TYPE_x86_msr_policy             = 0x00000012
+REC_TYPE_page_data_lz4              = 0x00000013
 
 rec_type_to_str = {
     REC_TYPE_end                        : "End",
@@ -79,6 +80,7 @@ rec_type_to_str = {
     REC_TYPE_static_data_end            : "Static data end",
     REC_TYPE_x86_cpuid_policy           : "x86 CPUID policy",
     REC_TYPE_x86_msr_policy             : "x86 MSR policy",
+    REC_TYPE_page_data_lz4              : "Page data (lz4)",
 }
 
 # page_data
@@ -101,6 +103,10 @@ PAGE_DATA_TYPE_BROKEN        = (0xd << PAGE_DATA_TYPE_SHIFT) # Broken
 PAGE_DATA_TYPE_XALLOC        = (0xe << PAGE_DATA_TYPE_SHIFT) # Allocate-only
 PAGE_DATA_TYPE_XTAB          = (0xf << PAGE_DATA_TYPE_SHIFT) # Invalid
 
+# PAGE_DATA_LZ4 per-page sub-block: uint16 LE clen; top 4 bits reserved (must
+# be 0); see tools/libs/guest/xg_sr_stream_format.h.
+PAGE_DATA_LZ4_CLEN_RESERVED_MASK = 0xf000
+
 # x86_pv_info
 X86_PV_INFO_FORMAT        = "BBHI"
 
@@ -217,7 +223,7 @@ class VerifyLibxc(VerifyBase):
         contentsz = (length + 7) & ~7
         content = self.rdexact(contentsz)
 
-        if rtype != REC_TYPE_page_data:
+        if rtype not in (REC_TYPE_page_data, REC_TYPE_page_data_lz4):
 
             if self.squashed_pagedata_records > 0:
                 self.info("Squashed %d Page Data records together" %
@@ -476,6 +482,85 @@ class VerifyLibxc(VerifyBase):
                               (contentsz, sz))
 
 
+    def verify_record_page_data_lz4(self, content):
+        """ Page Data (lz4) record """
+        # Structure-only check: this verifier does not link liblz4 and so does
+        # not decompress data_lz4.  Decompression integrity (e.g. a corrupt
+        # block) is enforced by the C restore (LZ4_decompress_safe,
+        # xg_sr_restore.c) and by the end-to-end migration tests, not here.
+        minsz = calcsize(PAGE_DATA_FORMAT)
+
+        if len(content) <= minsz:
+            raise RecordError(
+                "PAGE_DATA_LZ4 record must be at least %d bytes long"
+                % (minsz, ))
+
+        count, res1 = unpack(PAGE_DATA_FORMAT, content[:minsz])
+
+        if res1 != 0:
+            raise StreamError(
+                "Reserved bits set in PAGE_DATA_LZ4 record 0x%04x" % (res1, ))
+
+        pfnsz = count * 8
+        if (len(content) - minsz) < pfnsz:
+            raise RecordError(
+                "PAGE_DATA_LZ4 record must contain a pfn record for each count")
+
+        pfns = list(unpack("=%dQ" % (count, ), content[minsz:minsz + pfnsz]))
+
+        nr_pages = 0
+        for idx, pfn in enumerate(pfns):
+
+            if pfn & PAGE_DATA_PFN_RESZ_MASK:
+                raise RecordError("Reserved bits set in pfn[%d]: 0x%016x" %
+                                  (idx, pfn & PAGE_DATA_PFN_RESZ_MASK))
+
+            if pfn >> PAGE_DATA_TYPE_SHIFT in (5, 6, 7, 8):
+                raise RecordError("Invalid type value in pfn[%d]: 0x%016x" %
+                                  (idx, pfn & PAGE_DATA_TYPE_LTAB_MASK))
+
+            # We expect page data for each normal page or pagetable
+            if PAGE_DATA_TYPE_NOTAB <= (pfn & PAGE_DATA_TYPE_LTABTYPE_MASK) \
+                    <= PAGE_DATA_TYPE_L4TAB:
+                nr_pages += 1
+
+        if nr_pages == 0:
+            raise RecordError(
+                "PAGE_DATA_LZ4 record with no pages of data "
+                "(zero-payload LZ4 records are rejected on restore)")
+
+        # data_lz4 follows as nr_pages per-page sub-blocks, in pfn order: a
+        # uint16 LE length clen then clen octets (clen == 0 => a raw 4096-byte
+        # page; clen's top 4 bits reserved).  Walk the framing exactly as the C
+        # restore does (xg_sr_restore.c); this does not decompress.
+        data_lz4 = content[minsz + pfnsz:]
+        comprsz = len(data_lz4)
+        off = 0
+        for idx in range(nr_pages):
+            if off + 2 > comprsz:
+                raise RecordError(
+                    "PAGE_DATA_LZ4 sub-block[%d]: truncated clen prefix" % idx)
+            clen = data_lz4[off] | (data_lz4[off + 1] << 8)
+            off += 2
+
+            if clen & PAGE_DATA_LZ4_CLEN_RESERVED_MASK:
+                raise RecordError(
+                    "PAGE_DATA_LZ4 sub-block[%d]: reserved clen bits 0x%04x" %
+                    (idx, clen))
+
+            blocksz = 4096 if clen == 0 else clen
+            if blocksz > comprsz - off:
+                raise RecordError(
+                    "PAGE_DATA_LZ4 sub-block[%d]: overruns payload" % idx)
+            off += blocksz
+
+        if off != comprsz:
+            raise RecordError(
+                "PAGE_DATA_LZ4 record has %u trailing octets "
+                "after %u sub-blocks"
+                % (comprsz - off, nr_pages))
+
+
 record_verifiers = {
     REC_TYPE_end:
         VerifyLibxc.verify_record_end,
@@ -525,4 +610,7 @@ record_verifiers = {
         VerifyLibxc.verify_record_x86_cpuid_policy,
     REC_TYPE_x86_msr_policy:
         VerifyLibxc.verify_record_x86_msr_policy,
+
+    REC_TYPE_page_data_lz4:
+        VerifyLibxc.verify_record_page_data_lz4,
     }
diff --git a/tools/python/xen/migration/tests.py b/tools/python/xen/migration/tests.py
index fcf94b0bb2..9f8a4e2a0d 100644
--- a/tools/python/xen/migration/tests.py
+++ b/tools/python/xen/migration/tests.py
@@ -4,9 +4,10 @@
 Unit tests for migration v2 streams
 """
 
+import io
 import unittest
 
-from struct import calcsize
+from struct import calcsize, pack
 
 from xen.migration import libxc, libxl
 
@@ -31,6 +32,102 @@ class TestLibxc(unittest.TestCase):
             self.assertEqual(calcsize(fmt), sz)
 
 
+    def test_page_data_lz4(self):
+        """ REC_TYPE_PAGE_DATA_LZ4 verifier: accept valid per-page framing,
+        reject malformed framing """
+
+        v = libxc.VerifyLibxc(lambda *_: None, lambda *_: b"")
+
+        def hdr(count, res=0):
+            return pack(libxc.PAGE_DATA_FORMAT, count, res)
+
+        def clen(n):
+            return pack("<H", n)            # uint16 LE sub-block length prefix
+
+        NOTAB = libxc.PAGE_DATA_TYPE_NOTAB | 0x1   # a normal page (type 0)
+        XTAB = libxc.PAGE_DATA_TYPE_XTAB | 0x1     # invalid type, no data
+        PAGE = b"\x00" * 4096                       # a raw page (clen == 0)
+
+        # Positive: one normal page stored raw (clen == 0 => 4096 octets).
+        v.verify_record_page_data_lz4(
+            hdr(1) + pack("=Q", NOTAB) + clen(0) + PAGE)
+
+        # Positive: one normal page "compressed" (clen > 0 => clen octets).  The
+        # bytes are arbitrary -- the verifier checks framing, not decompression.
+        v.verify_record_page_data_lz4(
+            hdr(1) + pack("=Q", NOTAB) + clen(4) + b"\xde\xad\xbe\xef")
+
+        # Positive: two pages, compressed then raw, back-to-back sub-blocks.
+        v.verify_record_page_data_lz4(
+            hdr(2) + pack("=QQ", NOTAB, NOTAB)
+            + clen(3) + b"\x01\x02\x03" + clen(0) + PAGE)
+
+        # Negative: no pages of data (all-invalid pfns) -- rejected to match the
+        # restore side, which rejects a zero-payload PAGE_DATA_LZ4 record.
+        with self.assertRaises(libxc.RecordError):
+            v.verify_record_page_data_lz4(hdr(1) + pack("=Q", XTAB))
+
+        # Negative: pages present but no payload at all (truncated clen prefix).
+        with self.assertRaises(libxc.RecordError):
+            v.verify_record_page_data_lz4(hdr(1) + pack("=Q", NOTAB))
+
+        # Negative: truncated clen prefix (1 octet where 2 are needed).
+        with self.assertRaises(libxc.RecordError):
+            v.verify_record_page_data_lz4(
+                hdr(1) + pack("=Q", NOTAB) + b"\x04")
+
+        # Negative: a compressed sub-block whose clen overruns the payload.
+        with self.assertRaises(libxc.RecordError):
+            v.verify_record_page_data_lz4(
+                hdr(1) + pack("=Q", NOTAB) + clen(8) + b"\x01\x02")
+
+        # Negative: a raw sub-block (clen == 0) without a full 4096-octet page.
+        with self.assertRaises(libxc.RecordError):
+            v.verify_record_page_data_lz4(
+                hdr(1) + pack("=Q", NOTAB) + clen(0) + b"\x00" * 100)
+
+        # Negative: reserved bits set in clen (top 4 bits).
+        with self.assertRaises(libxc.RecordError):
+            v.verify_record_page_data_lz4(
+                hdr(1) + pack("=Q", NOTAB) + clen(0x8000) + PAGE)
+
+        # Negative: trailing octets after the last sub-block.
+        with self.assertRaises(libxc.RecordError):
+            v.verify_record_page_data_lz4(
+                hdr(1) + pack("=Q", NOTAB) + clen(4) + b"\xde\xad\xbe\xef"
+                + b"\x99\x99")
+
+        # Negative: reserved bits set in the record header.
+        with self.assertRaises(libxc.StreamError):
+            v.verify_record_page_data_lz4(
+                hdr(1, 1) + pack("=Q", NOTAB) + clen(0) + PAGE)
+
+        # Negative: reserved bits set in a pfn.
+        with self.assertRaises(libxc.RecordError):
+            v.verify_record_page_data_lz4(
+                hdr(1) + pack("=Q", NOTAB | libxc.PAGE_DATA_PFN_RESZ_MASK)
+                + clen(0) + PAGE)
+
+
+    def test_page_data_lz4_dispatch(self):
+        """ REC_TYPE_PAGE_DATA_LZ4 routed through verify_record() end-to-end:
+        exercises the record_verifiers registry, the page-data squash branch,
+        and the trailing-padding check (which the direct-call test bypasses) """
+        NOTAB = libxc.PAGE_DATA_TYPE_NOTAB | 0x1
+
+        # One normal page + a compressed sub-block, 8-byte-aligned body.
+        body = (pack(libxc.PAGE_DATA_FORMAT, 1, 0)
+                + pack("=Q", NOTAB)
+                + pack("<H", 4) + b"\xde\xad\xbe\xef")
+        padding = b"\x00" * ((8 - len(body) % 8) % 8)
+        record = (pack(libxc.RH_FORMAT, libxc.REC_TYPE_page_data_lz4, len(body))
+                  + body + padding)
+
+        stream = io.BytesIO(record)
+        v = libxc.VerifyLibxc(lambda *_: None, stream.read)
+        self.assertEqual(v.verify_record(), libxc.REC_TYPE_page_data_lz4)
+
+
 class TestLibxl(unittest.TestCase):
 
     def test_format_sizes(self):

base-commit: a7fd7d4cbd5e793d31d61c25e08526b330edd7f8
-- 
2.43.0


