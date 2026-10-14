Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B35CCC6B30
	for <xen-devel@archiver.kernel.org>; Thu, 15 Oct 2026 00:52:37 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1449577.1665265 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xH9hi-0000G4-8T; Thu, 15 Oct 2026 00:52:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1449577.1665265; Thu, 15 Oct 2026 00:52:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xH9hi-0000Fx-59; Thu, 15 Oct 2026 00:52:18 +0000
Received: by outflank-mailman (input) for mailman id 1449577;
 Thu, 15 Oct 2026 00:52:17 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ehem@m5p.com>) id 1xH9hh-0000FL-Bc
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2026 00:52:17 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xH9hg-000UBg-Ow
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2026 02:52:16 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ehem@m5p.com>)
 id 6ad0239e-8faa-0a2a0a5109dd-0a2a4502d336-12
 for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2026 02:52:16 +0200
Received: from [74.104.188.4] (helo=mailhost.m5p.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <ehem@m5p.com>)
 id 6ad023bf-6ca4-0a2a45020019-4a68bc043d05-3
 for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2026 02:52:16 +0200
Received: from m5p.com (mailhost.m5p.com [IPv6:fdc4:6ee8:648f:6bf6:0:0:0:f7])
 by mailhost.m5p.com (8.18.1/8.17.1) with ESMTPS id 69F0q9JP092045
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Wed, 14 Oct 2026 20:52:14 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.18.1/8.15.2/Submit) id 69F0q9fr092044;
 Wed, 14 Oct 2026 17:52:09 -0700 (PDT) (envelope-from ehem)
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
Message-ID: <c400de4273a96146e9d098d2566b726064aa59af.1792017081.git.ehem+xen@m5p.com>
In-Reply-To: <cover.1792017081.git.ehem+xen@m5p.com>
References: <cover.1792017081.git.ehem+xen@m5p.com>
From: Elliott Mitchell <ehem+xen@m5p.com>
To: xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>
Cc: Juergen Gross <jgross@suse.com>
Date: Wed, 14 Oct 2026 15:31:21 -0700
Subject: [PATCH 2/3] tools/utils: rename "n" arguments to "key"
X-purgate-ID: tlsNG-720697/1792025536-66EB32AC-D4655158/0/0
X-purgate-type: clean
X-purgate-size: 2375

Date: Wed, 12 Jul 2023 23:29:59 -0700

Hopefully make it clearer to others this is the key associated with the
storage value to retrieve.

Signed-off-by: Elliott Mitchell <ehem+xen@m5p.com>
---
 tools/include/libxlutil.h | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/tools/include/libxlutil.h b/tools/include/libxlutil.h
index fcbe41b15a..0ce66c2096 100644
--- a/tools/include/libxlutil.h
+++ b/tools/include/libxlutil.h
@@ -56,24 +56,24 @@ void xlu_cfg_destroy(XLU_Config *cfg);
  *   ERANGE   value out of range (from strtol)
  */
 
-int xlu_cfg_get_string(const XLU_Config *cfg, const char *n,
+int xlu_cfg_get_string(const XLU_Config *cfg, const char *key,
                        const char **value_r, int dont_warn);
 /* free/strdup version */
-int xlu_cfg_replace_string(const XLU_Config *cfg, const char *n,
+int xlu_cfg_replace_string(const XLU_Config *cfg, const char *key,
                            char **value_r, int dont_warn);
-int xlu_cfg_get_long(const XLU_Config *cfg, const char *n, long *value_r,
+int xlu_cfg_get_long(const XLU_Config *cfg, const char *key, long *value_r,
                      int dont_warn);
-int xlu_cfg_get_bounded_long(const XLU_Config *cfg, const char *n, long min,
+int xlu_cfg_get_bounded_long(const XLU_Config *cfg, const char *key, long min,
                              long max, long *value_r, int dont_warn);
-int xlu_cfg_get_defbool(const XLU_Config *cfg, const char *n,
+int xlu_cfg_get_defbool(const XLU_Config *cfg, const char *key,
                         libxl_defbool *value_r, int dont_warn);
 
-int xlu_cfg_get_list(const XLU_Config *cfg, const char *n,
+int xlu_cfg_get_list(const XLU_Config *cfg, const char *key,
                      XLU_ConfigList **list_r /* may be 0 */,
                      int *entries_r /* may be 0 */,
                      int dont_warn);
   /* there is no need to free *list_r; lifetime is that of the XLU_Config */
-int xlu_cfg_get_list_as_string_list(const XLU_Config *cfg, const char *n,
+int xlu_cfg_get_list_as_string_list(const XLU_Config *cfg, const char *key,
                                     libxl_string_list *sl, int dont_warn);
 const char *xlu_cfg_get_listitem(const XLU_ConfigList *list, int entry);
   /* xlu_cfg_get_listitem cannot fail, except that if entry is
-- 
2.47.3


