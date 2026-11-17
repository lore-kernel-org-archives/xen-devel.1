Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07D43606A31C
	for <xen-devel@archiver.kernel.org>; Tue, 17 Nov 2026 20:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=google header.b=MlvnnfyH
Received: from list by lists.xenproject.org with outflank-mailman.1493175.1693293 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTPhb-0006Kk-7A; Tue, 17 Nov 2026 20:22:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1493175.1693293; Tue, 17 Nov 2026 20:22:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTPhb-0006Ju-2L; Tue, 17 Nov 2026 20:22:51 +0000
Received: by outflank-mailman (input) for mailman id 1493175;
 Tue, 17 Nov 2026 20:22:50 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xTPhZ-0006BI-Si
 for xen-devel@lists.xenproject.org; Tue, 17 Nov 2026 20:22:49 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xTPhZ-006F17-8h
 for xen-devel@lists.xenproject.org; Tue, 17 Nov 2026 21:22:49 +0100
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6afcb78c-8faa-0a2a0a5109dd-0a2a4501b658-12
 for <xen-devel@lists.xenproject.org>; Tue, 17 Nov 2026 21:22:49 +0100
Received: from [209.85.221.45] (helo=mail-wr1-f45.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6afcb798-5984-0a2a45010019-d155dd2dd10c-3
 for <xen-devel@lists.xenproject.org>; Tue, 17 Nov 2026 21:22:49 +0100
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-48e46e449e8so111208f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 17 Nov 2026 12:22:49 -0800 (PST)
Received: from localhost.localdomain (host-78-146-248-75.as13285.net.
 [78.146.248.75]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4a65560ab59sm640224f8f.29.2026.11.17.12.22.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Nov 2026 12:22:48 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=citrix.com header.i="@citrix.com" header.h="Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1794946968; x=1795551768; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xiGuEmdBugkthiJSjV9J37p8YyqeOuhKM/u6Oe8webo=;
        b=MlvnnfyHgzrGKzJHsY0Ye5NwPIu136UBQ/CZt8uhfL08KSOY3PnGpjzvW518yjv/Tr
         W+EuTIxy5LTSdNxOQEXt2VE2l/h6FpM4DD+z26ETWzyEytJERXMB7ee7vL9YDJCphGa8
         H3ejWhYl2/yHOBIn21wSwhnUnweBSduj4sncw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794946968; x=1795551768;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xiGuEmdBugkthiJSjV9J37p8YyqeOuhKM/u6Oe8webo=;
        b=yw+lRamZPjALzFTDFkBaDHxKClQ+qhIlF3IWGlAVxxJNQKsl3Ov6uOJDhbVZ2Rkuqp
         ElQMCNZC++zdtwSRI4SwVzU2MyPJoWtSKM2SkBre0wJQMeMePBVXMYrM+xjL5SodMXSG
         XumwfypDXLYmyrZCP645yGLUn0uU3Uf1RWbVruKLcv/rg/Blx6rYf6aOHEPtSkKNzZPh
         QAQ/uiptKeLk0EDkOO7bxgUB142LRWNWXF5jHfdUyN9nH5wuHH6ReJZRxlygJ/IV1kRK
         6JkIDU1wQ3EMgrYLB69dsz08a5r1hQ+3RpYdQw6/MODCwwpUKfm/95aEwPpM0kx55S26
         aELw==
X-Gm-Message-State: APuU4Z+jsI2gTlsMbcU8DKaLNICV1plve7NDwXMpA6OzFdux3d6Y44cH
	xnh6j8x7jFJqWH+jg5ocioInUhARvMfTbwjMkHEatw10X9VvzePk0/PK/rvJaZSJavzzEHZ6RfL
	Ok/sONAY=
X-Gm-Gg: AZFdTZctLBnVJQvOp59ssCZzUTSKvpIntKZV0dJ0U7U9tWxZWk6lGJsfKObSyWOygjJ
	07/8CnkWPyuPxUNAd2/KzdHwQ+yNIrZmWI9ekvpRYYdksaPJEZN21VUU6g7EXnhV6USuSANvshF
	lKkbfoTt67XYkV4weInGpGX6KZMeKANdR1RLbm3u3ardhhXJNVsnV2+pT1RhQI3vJ5yKRMhYvFs
	XjaZtXSUqfukVepwZf/qw3ASXSFkB9qZWG7xoJs9ggITj9vv7aN5P7nrPKxc7H4rN/BfuJQFhHJ
	pH3ePm2w1mNiTnPUCmzeJRWe3j4HEXqR+FAub8ntioqg2MG6j7tMNJwIWFYOTyN87w0akMoYlnG
	h7vkMnl4oXKPeFMKz7quPcArTDepsBUK8fMs6yezFiP2+kqR9DmoracpC9afc3G7vFxuBTFqhF0
	hloBVzXGbUTOY8o74VPp2d/IKLXQJi+K8Qy+HphM5nXWujtUIijTFCHTJq8u7W0GjPhffJ43sBe
	N2xi2hgQDB0zLXL3fGsnzAhYWOA1CBxy+oe7veTQqLZ5CsnpSibj/vkrjBwizjssYniZmY1C4EA
	Ssz5xQ99eIjrE+48cqPfKn9KkNG9KfXNNoPsbLaaRmiwgQHvpmjKyg/SvAXlwAPrsLsNYDQh7Ck
	jWVs=
X-Received: by 2002:a5d:6f08:0:b0:4a6:4687:2ce9 with SMTP id ffacd0b85a97d-4a646872d51mr1017925f8f.4.1794946968427;
        Tue, 17 Nov 2026 12:22:48 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 2/2] xen/build-id: Drop xen_build_id_check()
Date: Tue, 17 Nov 2026 20:22:44 +0000
Message-Id: <20261117202244.4054656-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261117202244.4054656-1-andrew.cooper3@citrix.com>
References: <20261117202244.4054656-1-andrew.cooper3@citrix.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d62444/1794946969-BC75B757-67B898A6/10/78276251493
X-purgate-type: spam
X-purgate-size: 4991
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The function is misnamed; it really is looking for a GNU Build ID note, not a
Xen note as the name suggests.

It also has an awkward API to use.  For a GNU Build ID, the content is always
at +16 from the start, so really doesn't need to be returned by pointer, nor
is it necessary be doing additional checks on the returned pointers being
valid.

Switching to is_gnu_build_id() allows xen_build_init() to be simplified,
returning after the first successful find rather than passing an rc down the
function to skip later checks.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
CC: Ross Lagerwall <ross.lagerwall@citrix.com>
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Jan Beulich <jbeulich@suse.com>
CC: Julien Grall <julien@xen.org>
CC: Roger Pau Monné <roger@xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>

v2:
 * Fix pointer arithmatic on n.
 * Use n->descsz instead of assuming that there is no padding.
---
 xen/common/livepatch.c    | 11 +++--------
 xen/common/version.c      | 41 +++++++--------------------------------
 xen/include/xen/version.h |  2 --
 3 files changed, 10 insertions(+), 44 deletions(-)

diff --git a/xen/common/livepatch.c b/xen/common/livepatch.c
index 7515a040ad46..b789c91797f0 100644
--- a/xen/common/livepatch.c
+++ b/xen/common/livepatch.c
@@ -453,22 +453,17 @@ static int parse_buildid(const struct livepatch_elf_sec *sec,
                          struct livepatch_build_id *id)
 {
     const Elf_Note *n;
-    int rc;
 
     /* Presence of the sections is ensured by check_special_sections(). */
     ASSERT(sec);
 
     n = sec->addr;
 
-    if ( sec->sec->sh_size <= sizeof(*n) )
+    if ( !is_gnu_build_id(n, sec->sec->sh_size) )
         return -EINVAL;
 
-    rc = xen_build_id_check(n, sec->sec->sh_size, &id->p, &id->len);
-    if ( rc )
-        return rc;
-
-    if ( !id->len || !id->p )
-        return -EINVAL;
+    id->p   = (const void *)n + NT_GNU_HDR_SIZE;
+    id->len = n->descsz
 
    return 0;
 }
diff --git a/xen/common/version.c b/xen/common/version.c
index 5e1f5ecfb68b..be4e823ee1bc 100644
--- a/xen/common/version.c
+++ b/xen/common/version.c
@@ -146,36 +146,6 @@ bool is_gnu_build_id(const Elf_Note *n, unsigned int len)
     return true;
 }
 
-int xen_build_id_check(const Elf_Note *n, unsigned int n_sz,
-                       const void **p, unsigned int *len)
-{
-    /* Check if we really have a build-id. */
-    ASSERT(n_sz > sizeof(*n));
-
-    if ( NT_GNU_BUILD_ID != n->type )
-        return -ENODATA;
-
-    if ( n->namesz + n->descsz < n->namesz )
-        return -EINVAL;
-
-    if ( n->namesz < 4 /* GNU\0 */)
-        return -EINVAL;
-
-    if ( n->namesz + n->descsz > n_sz - sizeof(*n) )
-        return -EINVAL;
-
-    /* Sanity check, name should be "GNU" for ld-generated build-id. */
-    if ( strncmp(ELFNOTE_NAME(n), "GNU", n->namesz) != 0 )
-        return -ENODATA;
-
-    if ( len )
-        *len = n->descsz;
-    if ( p )
-        *p = ELFNOTE_DESC(n);
-
-    return 0;
-}
-
 struct pe_external_debug_directory
 {
     uint32_t characteristics;
@@ -202,7 +172,6 @@ void __init xen_build_init(void)
 {
     const Elf_Note *n = __note_gnu_build_id_start;
     unsigned int sz;
-    int rc;
 
     /* --build-id invoked with wrong parameters. */
     if ( __note_gnu_build_id_end <= &n[0] )
@@ -214,14 +183,18 @@ void __init xen_build_init(void)
 
     sz = (uintptr_t)__note_gnu_build_id_end - (uintptr_t)n;
 
-    rc = xen_build_id_check(n, sz, &xen_build_id, &xen_build_id_len);
+    if ( is_gnu_build_id(n, sz) )
+    {
+        xen_build_id     = (const void *)n + NT_GNU_HDR_SIZE;
+        xen_build_id_len = n->descsz;
+        return;
+    }
 
 #ifdef CONFIG_X86
     /*
      * xen.efi built with a new enough toolchain will have a CodeView record,
      * not an ELF note.
      */
-    if ( rc )
     {
         const struct pe_external_debug_directory *dir = (const void *)n;
 
@@ -242,7 +215,7 @@ void __init xen_build_init(void)
             {
                 xen_build_id = info->signature;
                 xen_build_id_len = sizeof(info->signature);
-                rc = 0;
+                return;
             }
         }
     }
diff --git a/xen/include/xen/version.h b/xen/include/xen/version.h
index ee857616f9e4..6e9a24b7fadf 100644
--- a/xen/include/xen/version.h
+++ b/xen/include/xen/version.h
@@ -25,8 +25,6 @@ extern unsigned int xen_build_id_len; /* 0 -> No build id. */
 
 #ifdef BUILD_ID
 void xen_build_init(void);
-int xen_build_id_check(const Elf_Note *n, unsigned int n_sz,
-                       const void **p, unsigned int *len);
 bool is_gnu_build_id(const Elf_Note *n, unsigned int len);
 #else
 static inline void xen_build_init(void) {};
-- 
2.39.5


