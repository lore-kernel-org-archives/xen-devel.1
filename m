Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AAD21098793
	for <xen-devel@archiver.kernel.org>; Fri, 20 Mar 2026 15:02:32 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1258124.1552320 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w3bMi-0004S7-Ep; Fri, 20 Mar 2026 15:02:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1258124.1552320; Fri, 20 Mar 2026 15:02:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w3bMi-0004S0-BE; Fri, 20 Mar 2026 15:02:20 +0000
Received: by outflank-mailman (input) for mailman id 1258124;
 Fri, 20 Mar 2026 15:02:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0BFG=BU=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1w3bMg-0001ko-D6
 for xen-devel@lists.xenproject.org; Fri, 20 Mar 2026 15:02:18 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c8f1a9c6-246d-11f1-9ccf-f158ae23cfc8;
 Fri, 20 Mar 2026 16:02:16 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 7BC415BDF9;
 Fri, 20 Mar 2026 15:02:16 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 540EA42867;
 Fri, 20 Mar 2026 15:02:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id eE1xE3hhvWnzXAAAD6G6ig
 (envelope-from <jgross@suse.com>); Fri, 20 Mar 2026 15:02:16 +0000
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
X-Inumbo-ID: c8f1a9c6-246d-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1774018936; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=N+38mOISGDZ5p4EBE7e3hZ5SrJSwJQ9+PpMenks7NFU=;
	b=eOEZ7i0/vDm7ZasHeLy0eMGD0xP3Vlot+jn1kIxaqnsrwe9aFsE1uxoMF8jJqyp7R/a8hi
	5XFyKGc5DLC6vr0OmsvGBF8nE/doqRngS9Y8+BYk1dsW3JPgcESvGB4PnthEuKlVZtR17l
	nsC49HzgrskYg1HJ3k4ZaY8dzhrFEBk=
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1774018936; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=N+38mOISGDZ5p4EBE7e3hZ5SrJSwJQ9+PpMenks7NFU=;
	b=eOEZ7i0/vDm7ZasHeLy0eMGD0xP3Vlot+jn1kIxaqnsrwe9aFsE1uxoMF8jJqyp7R/a8hi
	5XFyKGc5DLC6vr0OmsvGBF8nE/doqRngS9Y8+BYk1dsW3JPgcESvGB4PnthEuKlVZtR17l
	nsC49HzgrskYg1HJ3k4ZaY8dzhrFEBk=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Nick Rosbrook <enr0n@ubuntu.com>,
	George Dunlap <gwd@xenproject.org>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH v2 10/12] tools/libxl: add support for xenstore quota in domain_config
Date: Fri, 20 Mar 2026 16:01:18 +0100
Message-ID: <20260320150120.874878-11-jgross@suse.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260320150120.874878-1-jgross@suse.com>
References: <20260320150120.874878-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.com:mid,suse.com:email];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_TLS_ALL(0.00)[]

Add support for xenstore quota in the struct domain_config. Initially
it will be used only for migration of a domain.

Signed-off-by: Juergen Gross <jgross@suse.com>
Acked-by: Nick Rosbrook <enr0n@ubuntu.com> # golang stuff
---
V2:
- use LOGED() for error logging (Anthony Perard)
- mention additional struct member xenstore_quota in libxl.h
  (Anthony Perard)
---
 tools/golang/xenlight/helpers.gen.go |  6 ++++++
 tools/golang/xenlight/types.gen.go   |  1 +
 tools/include/libxl.h                |  1 +
 tools/libs/light/libxl_dom.c         |  8 ++++++++
 tools/libs/light/libxl_domain.c      | 11 +++++++++++
 tools/libs/light/libxl_types.idl     |  1 +
 6 files changed, 28 insertions(+)

diff --git a/tools/golang/xenlight/helpers.gen.go b/tools/golang/xenlight/helpers.gen.go
index 767b9e45f5..b0c09da910 100644
--- a/tools/golang/xenlight/helpers.gen.go
+++ b/tools/golang/xenlight/helpers.gen.go
@@ -1286,6 +1286,9 @@ if err := x.TrapUnmappedAccesses.fromC(&xc.trap_unmapped_accesses);err != nil {
 return fmt.Errorf("converting field TrapUnmappedAccesses: %v", err)
 }
 x.XenstoreFeatureMask = uint32(xc.xenstore_feature_mask)
+if err := x.XenstoreQuota.fromC(&xc.xenstore_quota);err != nil {
+return fmt.Errorf("converting field XenstoreQuota: %v", err)
+}
 
  return nil}
 
@@ -1825,6 +1828,9 @@ if err := x.TrapUnmappedAccesses.toC(&xc.trap_unmapped_accesses); err != nil {
 return fmt.Errorf("converting field TrapUnmappedAccesses: %v", err)
 }
 xc.xenstore_feature_mask = C.uint32_t(x.XenstoreFeatureMask)
+if err := x.XenstoreQuota.toC(&xc.xenstore_quota); err != nil {
+return fmt.Errorf("converting field XenstoreQuota: %v", err)
+}
 
  return nil
  }
diff --git a/tools/golang/xenlight/types.gen.go b/tools/golang/xenlight/types.gen.go
index 8dd610919d..e0fd78ec03 100644
--- a/tools/golang/xenlight/types.gen.go
+++ b/tools/golang/xenlight/types.gen.go
@@ -629,6 +629,7 @@ VmtraceBufKb int
 Vpmu Defbool
 TrapUnmappedAccesses Defbool
 XenstoreFeatureMask uint32
+XenstoreQuota XsQuotaList
 }
 
 type DomainBuildInfoTypeUnion interface {
diff --git a/tools/include/libxl.h b/tools/include/libxl.h
index 6d2910df34..80e3ec8de9 100644
--- a/tools/include/libxl.h
+++ b/tools/include/libxl.h
@@ -1545,6 +1545,7 @@ void libxl_mac_copy(libxl_ctx *ctx, libxl_mac *dst, const libxl_mac *src);
  * libxl_xs_quota_global_set()
  * libxl_xs_quota_domain_get()
  * libxl_xs_quota_domain_set()
+ * and the xenstore_quota member of struct domain_build_info
  * are available.
  */
 #define LIBXL_HAVE_XENSTORE_QUOTA
diff --git a/tools/libs/light/libxl_dom.c b/tools/libs/light/libxl_dom.c
index 05ebc69534..4ff5f65f6f 100644
--- a/tools/libs/light/libxl_dom.c
+++ b/tools/libs/light/libxl_dom.c
@@ -509,6 +509,14 @@ retry_transaction:
 
     xs_introduce_domain(ctx->xsh, domid, state->store_mfn, state->store_port);
 
+    if (info->xenstore_quota.num_quota) {
+        rc = libxl_xs_quota_domain_set(ctx, domid, &info->xenstore_quota);
+        if (rc) {
+            LOGED(ERROR, domid, "Failed to set Xenstore quota");
+            goto out;
+        }
+    }
+
  out:
     free(vm_path);
     return rc;
diff --git a/tools/libs/light/libxl_domain.c b/tools/libs/light/libxl_domain.c
index 5be47f687f..37fcd92871 100644
--- a/tools/libs/light/libxl_domain.c
+++ b/tools/libs/light/libxl_domain.c
@@ -2533,6 +2533,17 @@ static void retrieve_domain_configuration_end(libxl__egc *egc,
         }
     }
 
+    /* Xenstore quota */
+    {
+        libxl_xs_quota_list_dispose(&d_config->b_info.xenstore_quota);
+        rc = libxl_xs_quota_domain_get(CTX, domid,
+                                       &d_config->b_info.xenstore_quota);
+        if (rc) {
+            LOGED(ERROR, domid, "Fail to get xenstore quota");
+            goto out;
+        }
+    }
+
     /* Devices: disk, nic, vtpm, pcidev etc. */
 
     /* The MERGE macro implements following logic:
diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_types.idl
index 1a63c8af76..a7893460f0 100644
--- a/tools/libs/light/libxl_types.idl
+++ b/tools/libs/light/libxl_types.idl
@@ -760,6 +760,7 @@ libxl_domain_build_info = Struct("domain_build_info",[
     ("vpmu", libxl_defbool),
     ("trap_unmapped_accesses", libxl_defbool),
     ("xenstore_feature_mask", uint32, {'init_val': '~0U'}),
+    ("xenstore_quota", libxl_xs_quota_list),
 
     ], dir=DIR_IN,
        copy_deprecated_fn="libxl__domain_build_info_copy_deprecated",
-- 
2.53.0


