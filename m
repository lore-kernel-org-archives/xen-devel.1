Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE3FD606A331
	for <xen-devel@archiver.kernel.org>; Wed,  4 Nov 2026 13:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=google header.b=KafRJ2o+
Received: from list by lists.xenproject.org with outflank-mailman.1471920.1680037 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xObOu-0003Iz-GV; Wed, 04 Nov 2026 13:51:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1471920.1680037; Wed, 04 Nov 2026 13:51:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xObOu-0003Is-DX; Wed, 04 Nov 2026 13:51:40 +0000
Received: by outflank-mailman (input) for mailman id 1471920;
 Wed, 04 Nov 2026 13:51:39 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xObOt-0003Im-8e
 for xen-devel@lists.xenproject.org; Wed, 04 Nov 2026 13:51:39 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xObOs-000SBp-LW
 for xen-devel@lists.xenproject.org; Wed, 04 Nov 2026 14:51:38 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6aeb3863-e002-0a2a0a5209dd-0a2a4505bbd4-16
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 14:51:38 +0100
Received: from [209.85.128.51] (helo=mail-wm1-f51.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6aeb386a-4cb1-0a2a45050019-d1558033a566-3
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 14:51:38 +0100
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-4a9a8d6cea8so7105755e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 05:51:38 -0800 (PST)
Received: from localhost.localdomain (host-78-146-248-75.as13285.net.
 [78.146.248.75]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4b4107b7198sm27919235e9.0.2026.11.04.05.51.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Nov 2026 05:51:37 -0800 (PST)
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
        d=citrix.com; s=google; t=1793800298; x=1794405098; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jaSUwdtn0fOJl3oyF97eAOx5DNghLz7v5vcZc9L3meE=;
        b=KafRJ2o+OZRBcC4wRznev0sFp/98dIyER/L6xsB62ED0c+TsCXRckbmMSGpxyDhiZe
         Zgo82vcuZjAksOQ4OXde7ye8YPF35Z/rWIqDfIm11jCth6wjsxBFCPFw2YAlUGTY2AFP
         naEjOgORsTBknT4mSX5ghKyCiiX+ZJYK6Xpus=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793800298; x=1794405098;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jaSUwdtn0fOJl3oyF97eAOx5DNghLz7v5vcZc9L3meE=;
        b=vIFIiWdHfqz1EjT+zneFPBmrW8tefQhveEHXQuIz+PO2D6UZ1uYdGEekwR6LDDNWZa
         VgH0F1dd0i/9c0ng4F0ON0kESdM6T5zkX5ljAdaG37Fu3P+pQiqDt53+o9tlBRDkLRvT
         ruAsrcACFRBElkauYvHi14RqfDvP7nP05xOoxjroaH9la7qBMbvuJJrGA9LkT9C9G67G
         lPs2FP3d0kzH1czwLGgM2KUDw20qVVdV728xZqiB/rzoyWCv+t8p6dACMAPYJp7MfPXG
         tbrIBXVR2bCNPb2cCz04S8QNb/REYTNI12oFZSouFQeReeALCyge+NABCk/1WBeZZJ+d
         s3XQ==
X-Gm-Message-State: APuU4Z+Rygyuf4ljjs9/3dBv5D1jDyKu+ydXpTGmFmh7Jt/JoOfNYX3l
	ZiqM1GV42dRwVBhhZp7UaYO8sUqKaMTQDgTILq7yi9Dfg0uMw3IqxLtAq7Bm2PpuRipiD0jwie4
	c47gzd+8=
X-Gm-Gg: AYBFou3ixZd1pAu+0gunTWJgxtcXKoIhRniodsXDzpC9+j503TyJaLcuzlTmThgrpo9
	YOWs8teaFMBegQ3phCQ++L3pFPLZ7UbHcZtLVQFiw1Rj7FmB6vabnZfMjHgC7jc1kFyea+j/C6g
	VpJvtkN7OX8GR53mLhVO1LNZj9VzuEk7ltvAwspysOF93vbZfOYCvVtSZfvD6Z1+VlxPDuRKQ7S
	V6yiOgQppGjyPOytaxAxuPpNUpwXqYjW0WtffZYcsV0WHOjzVIIsAelYx84HsgjhknIPtxJwj1U
	Dvq6pIMwgOsVatPTyf/yjzHhSLWgeDEuLcFe9g3NEdjeXTci//+aFBjLLmhi8Cr1jv3tAyl4ZqI
	k05fk0vkLpE4/teO+vsdrQ5UnRin4dqJ6l7l1v+CoooyQ4KaLkaAJzy8QQZR+rJA0ZX3HHTEyko
	jZgc9CAcnxVlGeidHrix1GjAYdJ/wRNNL5otJijBSt5oQoxrvUVDcKwiaP7N3EPQqJJu0wMs4lG
	puJ7ElTUtM3ccpytbTakkCXzgwImFIkv4GvOpHNghP9oWGmTWJ4phT4GVjdeGQWbpIRwzm+wmip
	YkqziDENoqkfW2Ch8muos2Jq/8mitzDCmw4wGoJjpl6ckpZ4kIUodWsiHh3SlFuaU0FNV/RPLKE
	MDC4=
X-Received: by 2002:a05:600c:3b02:b0:4b4:a551:681a with SMTP id 5b1f17b1804b1-4b4a55168c2mr27758865e9.3.1793800297918;
        Wed, 04 Nov 2026 05:51:37 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 2/2] xen/build-id: Drop xen_build_id_check()
Date: Wed,  4 Nov 2026 13:51:33 +0000
Message-Id: <20261104135133.2209628-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261104135133.2209628-1-andrew.cooper3@citrix.com>
References: <20261104135133.2209628-1-andrew.cooper3@citrix.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c201ff/1793800298-734BC2A1-74C92054/10/78276251493
X-purgate-type: spam
X-purgate-size: 4984
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
---
CC: Ross Lagerwall <ross.lagerwall@citrix.com>
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Jan Beulich <jbeulich@suse.com>
CC: Julien Grall <julien@xen.org>
CC: Roger Pau Monné <roger@xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>

The 16 probably ought to be a define somewhere, but I see no obvious
candidates in the ELF spec.
---
 xen/common/livepatch.c    | 13 +++++--------
 xen/common/version.c      | 41 +++++++--------------------------------
 xen/include/xen/version.h |  2 --
 3 files changed, 12 insertions(+), 44 deletions(-)

diff --git a/xen/common/livepatch.c b/xen/common/livepatch.c
index 7515a040ad46..9960db589b76 100644
--- a/xen/common/livepatch.c
+++ b/xen/common/livepatch.c
@@ -453,22 +453,19 @@ static int parse_buildid(const struct livepatch_elf_sec *sec,
                          struct livepatch_build_id *id)
 {
     const Elf_Note *n;
-    int rc;
+    unsigned int len;
 
     /* Presence of the sections is ensured by check_special_sections(). */
     ASSERT(sec);
 
     n = sec->addr;
+    len = sec->sec->sh_size;
 
-    if ( sec->sec->sh_size <= sizeof(*n) )
+    if ( !is_gnu_build_id(n, len) )
         return -EINVAL;
 
-    rc = xen_build_id_check(n, sec->sec->sh_size, &id->p, &id->len);
-    if ( rc )
-        return rc;
-
-    if ( !id->len || !id->p )
-        return -EINVAL;
+    id->p   = n   + NT_GNU_HDR_SIZE;
+    id->len = len - NT_GNU_HDR_SIZE;
 
    return 0;
 }
diff --git a/xen/common/version.c b/xen/common/version.c
index 7eb8a0221d82..63a5261a2279 100644
--- a/xen/common/version.c
+++ b/xen/common/version.c
@@ -145,36 +145,6 @@ bool is_gnu_build_id(const Elf_Note *n, unsigned int len)
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
@@ -201,7 +171,6 @@ void __init xen_build_init(void)
 {
     const Elf_Note *n = __note_gnu_build_id_start;
     unsigned int sz;
-    int rc;
 
     /* --build-id invoked with wrong parameters. */
     if ( __note_gnu_build_id_end <= &n[0] )
@@ -213,14 +182,18 @@ void __init xen_build_init(void)
 
     sz = (uintptr_t)__note_gnu_build_id_end - (uintptr_t)n;
 
-    rc = xen_build_id_check(n, sz, &xen_build_id, &xen_build_id_len);
+    if ( is_gnu_build_id(n, sz) )
+    {
+        xen_build_id     = n  + NT_GNU_HDR_SIZE;
+        xen_build_id_len = sz - NT_GNU_HDR_SIZE;
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
 
@@ -241,7 +214,7 @@ void __init xen_build_init(void)
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


