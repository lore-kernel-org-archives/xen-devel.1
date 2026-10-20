Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48528606A323
	for <xen-devel@archiver.kernel.org>; Tue, 20 Oct 2026 20:04:09 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1456192.1669705 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJG3z-0001OO-PJ; Tue, 20 Oct 2026 20:03:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1456192.1669705; Tue, 20 Oct 2026 20:03:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJG3z-0001OH-Kx; Tue, 20 Oct 2026 20:03:59 +0000
Received: by outflank-mailman (input) for mailman id 1456192;
 Tue, 20 Oct 2026 20:03:58 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marcus.granado@citrix.com>) id 1xJG3y-0001Na-Cv
 for xen-devel@lists.xenproject.org; Tue, 20 Oct 2026 20:03:58 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xJG3x-003cZt-Pz
 for xen-devel@lists.xenproject.org; Tue, 20 Oct 2026 22:03:57 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marcus.granado@citrix.com>)
 id 6ad7c92b-8faa-0a2a0a5109dd-0a2a4502e304-4
 for <xen-devel@lists.xenproject.org>; Tue, 20 Oct 2026 22:03:57 +0200
Received: from [160.101.131.9] (helo=na1pdmzitismtp02.tibco.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <marcus.granado@citrix.com>)
 id 6ad7c92c-6ca4-0a2a45020019-a0658309b218-3
 for <xen-devel@lists.xenproject.org>; Tue, 20 Oct 2026 22:03:57 +0200
Received: from mewpvdipd1023.citrite.net (unknown [10.113.40.46])
 by na1pdmzitismtp02.tibco.com (Postfix) with ESMTPS id 523328424212;
 Tue, 20 Oct 2026 16:03:13 -0400 (EDT)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; none
From: Marcus Granado <marcus.granado@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Marcus Granado <marcus.granado@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Frediano Ziglio <freddy77@gmail.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH v2 2/9] docs/specs, tools: define the PAGE_DATA flags field
Date: Tue, 20 Oct 2026 21:02:30 +0100
Message-ID: <20261020200238.1815766-3-marcus.granado@citrix.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261020200238.1815766-1-marcus.granado@citrix.com>
References: <20261020200238.1815766-1-marcus.granado@citrix.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-720697/1792526637-F16AF2AC-32F8F28F/0/0
X-purgate-type: clean
X-purgate-size: 11996
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The 32-bit field after count in a PAGE_DATA record is reserved, and
libxenguest and the Python stream validator reject a record which sets
it.  The record's page_data is page_size bytes of uncompressed
contents per present page, and nothing in the record can say that it
is encoded otherwise, so pages cannot be sent compressed.

Turn that field into a flags field.  Bits 7-0 identify the algorithm
used to encode page_data, 0x00 meaning none, and a restoring side must
fail on a value it does not implement.  Bits 31-8 stay reserved, and a
restoring side must still reject a record which sets any of them,
overriding the general rule for reserved fields.  Make libxenguest and
the Python validator enforce both rules, and check the length of
page_data according to the algorithm.  Add test_page_data_flags for the
Python checks.

The specification's Future Extensions section requires a new record
type for any extension of an existing one.  Also allow an existing type
to be extended in place when a receiver which predates the extension is
guaranteed to reject the extended record rather than misread it.  For
PAGE_DATA, this holds for an encoding which leaves count and the pfn
array in plaintext and shortens page_data: an older libxenguest which
ignores the field fails its exact length check.

The stream version is not bumped.  A zero flags field means what the
reserved field meant, and no other value is accepted.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Marcus Granado <marcus.granado@citrix.com>
---

Notes:
    Changes in v2:
    - Replaces v1 1/6, which added a PAGE_DATA_LZ4 record type: PAGE_DATA's
      reserved field becomes a flags field, following review by Teddy
      Astie and Frediano Ziglio.  LZ4 is assigned in patch 3.

 docs/specs/libxc-migration-stream.pandoc | 28 +++++++++++++++++------
 tools/libs/guest/xg_sr_restore.c         | 29 ++++++++++++++++--------
 tools/libs/guest/xg_sr_stream_format.h   |  8 ++++++-
 tools/python/xen/migration/libxc.py      | 28 ++++++++++++++++++-----
 tools/python/xen/migration/tests.py      | 25 +++++++++++++++++++-
 5 files changed, 94 insertions(+), 24 deletions(-)

diff --git a/docs/specs/libxc-migration-stream.pandoc b/docs/specs/libxc-migration-stream.pandoc
index b1c81b5d68..fd44dd6e0a 100644
--- a/docs/specs/libxc-migration-stream.pandoc
+++ b/docs/specs/libxc-migration-stream.pandoc
@@ -3,7 +3,8 @@
   Andrew Cooper <<andrew.cooper3@citrix.com>>
   Wen Congyang <<wency@cn.fujitsu.com>>
   Yang Hongyang <<hongyang.yang@easystack.cn>>
-% Revision 4
+  Marcus Granado <<marcus.granado@citrix.com>>
+% Revision 5
 
 Introduction
 ============
@@ -279,7 +280,7 @@ memory contents.
 
      0     1     2     3     4     5     6     7 octet
     +-----------------------+-------------------------+
-    | count (C)             | (reserved)              |
+    | count (C)             | flags                   |
     +-----------------------+-------------------------+
     | pfn[0]                                          |
     +-------------------------------------------------+
@@ -299,8 +300,19 @@ Field       Description
 ----------- --------------------------------------------------------
 count       Number of pages described in this record.
 
-(reserved)  Set to zero on save.  A restoring side must reject a
-            record with this field non-zero.
+flags       Bit 7-0:  Algorithm used to encode page_data.
+
+                      0x00: None.  page_data is page_size octets of
+                            uncompressed contents per present page.
+
+                      0x01 - 0xFF: Unassigned.
+
+                      A restoring side must fail on an algorithm value it
+                      does not implement, rather than attempting to
+                      interpret the page_data.
+
+            Bit 31-8: Reserved.  Set to zero on save.  A restoring side
+                      must reject a record with any of these bits set.
 
 pfn         An array of count PFNs and their types.
 
@@ -312,8 +324,8 @@ pfn         An array of count PFNs and their types.
 
             Bit 51-0: PFN.
 
-page_data   page_size octets of uncompressed page contents for each
-            page set as present in the pfn array.
+page_data   Contents of each page set as present in the pfn array,
+            encoded with the algorithm in flags bits 7-0.
 --------------------------------------------------------------------
 
 Note: Count is strictly > 0.  N is strictly <= C and it is possible for there
@@ -802,7 +814,9 @@ The format may be extended by adding additional record types.
 
 Extending an existing record type must be done by adding a new record
 type.  This allows old images with the old record to still be
-restored.
+restored.  An existing record type may instead be extended in place if
+a receiver which predates the extension is guaranteed to reject the
+extended record rather than misread it.
 
 The image header may only be extended by _appending_ additional
 fields.  In particular, the `marker`, `id` and `version` fields must
diff --git a/tools/libs/guest/xg_sr_restore.c b/tools/libs/guest/xg_sr_restore.c
index eae5a8e828..93b020b55f 100644
--- a/tools/libs/guest/xg_sr_restore.c
+++ b/tools/libs/guest/xg_sr_restore.c
@@ -401,10 +401,10 @@ static int handle_page_data(struct xc_sr_context *ctx, struct xc_sr_record *rec)
     }
 
     /* Reject rather than ignore: a future use may change the layout. */
-    if ( pages->_res1 != 0 )
+    if ( pages->flags & PAGE_DATA_FLAGS_RESZ_MASK )
     {
-        ERROR("Reserved field set in PAGE_DATA record: %#x",
-              (unsigned int)pages->_res1);
+        ERROR("Reserved bits set in PAGE_DATA record: %#x",
+              (unsigned int)(pages->flags & PAGE_DATA_FLAGS_RESZ_MASK));
         goto err;
     }
 
@@ -463,13 +463,24 @@ static int handle_page_data(struct xc_sr_context *ctx, struct xc_sr_record *rec)
         types[i] = type;
     }
 
-    if ( rec->length != (sizeof(*pages) +
-                         (sizeof(uint64_t) * pages->count) +
-                         (PAGE_SIZE * pages_of_data)) )
+    switch ( pages->flags & PAGE_DATA_ALGO_MASK )
     {
-        ERROR("PAGE_DATA record wrong size: length %u, expected "
-              "%zu + %zu + %lu", rec->length, sizeof(*pages),
-              (sizeof(uint64_t) * pages->count), (PAGE_SIZE * pages_of_data));
+    case PAGE_DATA_ALGO_NONE:
+        if ( rec->length != (sizeof(*pages) +
+                             (sizeof(uint64_t) * pages->count) +
+                             (PAGE_SIZE * pages_of_data)) )
+        {
+            ERROR("PAGE_DATA record wrong size: length %u, expected "
+                  "%zu + %zu + %lu", rec->length, sizeof(*pages),
+                  (sizeof(uint64_t) * pages->count),
+                  (PAGE_SIZE * pages_of_data));
+            goto err;
+        }
+        break;
+
+    default:
+        ERROR("Unsupported algorithm %u in PAGE_DATA record",
+              (unsigned int)(pages->flags & PAGE_DATA_ALGO_MASK));
         goto err;
     }
 
diff --git a/tools/libs/guest/xg_sr_stream_format.h b/tools/libs/guest/xg_sr_stream_format.h
index 1e6e50a710..f839d874c8 100644
--- a/tools/libs/guest/xg_sr_stream_format.h
+++ b/tools/libs/guest/xg_sr_stream_format.h
@@ -83,10 +83,16 @@ struct xc_sr_rhdr
 struct xc_sr_rec_page_data_header
 {
     uint32_t count;
-    uint32_t _res1;
+    uint32_t flags;
     uint64_t pfn[0];
 };
 
+/* PAGE_DATA flags: bits 7-0 are the algorithm, bits 31-8 are reserved. */
+#define PAGE_DATA_ALGO_MASK       0x000000ffU
+#define PAGE_DATA_FLAGS_RESZ_MASK 0xffffff00U
+
+#define PAGE_DATA_ALGO_NONE       0x00000000U
+
 #define PAGE_DATA_PFN_MASK      0x000fffffffffffffULL
 #define PAGE_DATA_PFN_RESZ_MASK 0x0ff0000000000000ULL
 #define PAGE_DATA_TYPE_MASK     0xf000000000000000ULL
diff --git a/tools/python/xen/migration/libxc.py b/tools/python/xen/migration/libxc.py
index e52e632cb1..2906b78d36 100644
--- a/tools/python/xen/migration/libxc.py
+++ b/tools/python/xen/migration/libxc.py
@@ -86,6 +86,11 @@ PAGE_DATA_FORMAT             = "II"
 PAGE_DATA_PFN_MASK           = (1 << 52) - 1
 PAGE_DATA_PFN_RESZ_MASK      = ((1 << 60) - 1) & ~((1 << 52) - 1)
 
+# page_data flags: bits 7-0 algorithm, bits 31-8 reserved (must reject)
+PAGE_DATA_ALGO_MASK          = 0x000000ff
+PAGE_DATA_FLAGS_RESZ_MASK    = 0xffffff00
+PAGE_DATA_ALGO_NONE          = 0x00
+
 # flags from xen/public/domctl.h: XEN_DOMCTL_PFINFO_* shifted by 32 bits
 PAGE_DATA_TYPE_SHIFT         = 60
 PAGE_DATA_TYPE_LTABTYPE_MASK = (0x7 << PAGE_DATA_TYPE_SHIFT)
@@ -259,11 +264,14 @@ class VerifyLibxc(VerifyBase):
             raise RecordError(
                 "PAGE_DATA record must be at least %d bytes long" % (minsz, ))
 
-        count, res1 = unpack(PAGE_DATA_FORMAT, content[:minsz])
+        count, flags = unpack(PAGE_DATA_FORMAT, content[:minsz])
 
-        if res1 != 0:
+        if flags & PAGE_DATA_FLAGS_RESZ_MASK:
             raise StreamError(
-                "Reserved bits set in PAGE_DATA record 0x%04x" % (res1, ))
+                "Reserved bits set in PAGE_DATA record 0x%08x"
+                % (flags & PAGE_DATA_FLAGS_RESZ_MASK, ))
+
+        algo = flags & PAGE_DATA_ALGO_MASK
 
         pfnsz = count * 8
         if (len(content) - minsz) < pfnsz:
@@ -289,9 +297,17 @@ class VerifyLibxc(VerifyBase):
                 nr_pages += 1
 
         pagesz = nr_pages * 4096
-        if len(content) != minsz + pfnsz + pagesz:
-            raise RecordError("Expected %u + %u + %u, got %u" %
-                              (minsz, pfnsz, pagesz, len(content)))
+        datasz = len(content) - minsz - pfnsz
+
+        if algo == PAGE_DATA_ALGO_NONE:
+
+            if datasz != pagesz:
+                raise RecordError("Expected %u + %u + %u, got %u" %
+                                  (minsz, pfnsz, pagesz, len(content)))
+
+        else:
+            raise StreamError(
+                "Unsupported algorithm %u in PAGE_DATA record" % (algo, ))
 
 
     def verify_record_x86_pv_info(self, content):
diff --git a/tools/python/xen/migration/tests.py b/tools/python/xen/migration/tests.py
index fcf94b0bb2..1944ae09b3 100644
--- a/tools/python/xen/migration/tests.py
+++ b/tools/python/xen/migration/tests.py
@@ -6,7 +6,7 @@ Unit tests for migration v2 streams
 
 import unittest
 
-from struct import calcsize
+from struct import calcsize, pack
 
 from xen.migration import libxc, libxl
 
@@ -30,6 +30,29 @@ class TestLibxc(unittest.TestCase):
                          ):
             self.assertEqual(calcsize(fmt), sz)
 
+    def test_page_data_flags(self):
+        """ PAGE_DATA flags: algorithm dispatch and the reserved bits """
+
+        v = libxc.VerifyLibxc(lambda *_: None, lambda *_: b"")
+        PAGE = b"\x00" * 4096
+        NOTAB = libxc.PAGE_DATA_TYPE_NOTAB | 0x1   # one normal page, pfn 1
+
+        def rec(flags, data):
+            return pack(libxc.PAGE_DATA_FORMAT, 1, flags) + \
+                   pack("=Q", NOTAB) + data
+
+        # Uncompressed: exactly one page of data, and nothing else accepted.
+        v.verify_record_page_data(rec(libxc.PAGE_DATA_ALGO_NONE, PAGE))
+        self.assertRaises(libxc.RecordError, v.verify_record_page_data,
+                          rec(libxc.PAGE_DATA_ALGO_NONE, PAGE[:-1]))
+
+        # An unimplemented algorithm, and any reserved bit, are refused.
+        self.assertRaises(libxc.StreamError, v.verify_record_page_data,
+                          rec(libxc.PAGE_DATA_ALGO_NONE + 1, PAGE))
+        for bit in range(8, 32):
+            self.assertRaises(libxc.StreamError, v.verify_record_page_data,
+                              rec(1 << bit, PAGE))
+
 
 class TestLibxl(unittest.TestCase):
 
-- 
2.43.0


