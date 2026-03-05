Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA804F33A63
	for <xen-devel@archiver.kernel.org>; Thu,  5 Mar 2026 13:58:16 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1246751.1545888 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vy9DL-0005QS-VK; Thu, 05 Mar 2026 13:58:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1246751.1545888; Thu, 05 Mar 2026 13:58:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vy9DL-0005PX-Pz; Thu, 05 Mar 2026 13:58:07 +0000
Received: by outflank-mailman (input) for mailman id 1246751;
 Thu, 05 Mar 2026 13:58:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=y0Pc=BF=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1vy98a-00008m-2A
 for xen-devel@lists.xenproject.org; Thu, 05 Mar 2026 13:53:12 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [2a07:de40:b251:101:10:150:64:2])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a554fb30-189a-11f1-9ccf-f158ae23cfc8;
 Thu, 05 Mar 2026 14:53:10 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 37CAA5BD98;
 Thu,  5 Mar 2026 13:53:10 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1BB9B3EA68;
 Thu,  5 Mar 2026 13:53:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id qQ2hBcaKqWktTwAAD6G6ig
 (envelope-from <jgross@suse.com>); Thu, 05 Mar 2026 13:53:10 +0000
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
X-Inumbo-ID: a554fb30-189a-11f1-9ccf-f158ae23cfc8
Authentication-Results: smtp-out2.suse.de;
	none
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH 11/11] tools/xl: add support for xenstore quota setting via domain config
Date: Thu,  5 Mar 2026 14:52:08 +0100
Message-ID: <20260305135208.2208663-12-jgross@suse.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260305135208.2208663-1-jgross@suse.com>
References: <20260305135208.2208663-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Queue-Id: 37CAA5BD98
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org

Add a new "xenstore-quota" domain config parameter for setting the
Xenstore quota of a new domain via a list of <quota>=<val> items.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 docs/man/xl.cfg.5.pod.in | 13 +++++++++++++
 tools/xl/xl_parse.c      | 23 ++++++++++++++++++++++-
 2 files changed, 35 insertions(+), 1 deletion(-)

diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
index 27c455210b..3aac0bc4fb 100644
--- a/docs/man/xl.cfg.5.pod.in
+++ b/docs/man/xl.cfg.5.pod.in
@@ -748,6 +748,19 @@ via the B<xl info -x> command in dom0.
 The default value is B<0xffffffff>, meaning that all possible Xenstore
 features are visible by the guest.
 
+=item B<xenstore_quota=[ QUOTA_SPEC, QUOTA_SPEC, ...]>
+
+Specifies Xenstore quota values of the domain, overriding the default
+values of Xenstore.
+
+Each B<QUOTA_SPEC> is a B<quota-name>=B<value> specification. The supported
+B<quota-name> identifiers can be obtained by the B<xl xenstore-quota-get -g>
+command. B<value> is a non-negative integer.
+
+As per-domain Xenstore quota are an optional Xenstore feature, the
+B<xenstore_quota> config parameter may not be supported by all Xenstore
+implementations.
+
 =back
 
 =head2 Devices
diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
index 934ad4eeef..06a5b60736 100644
--- a/tools/xl/xl_parse.c
+++ b/tools/xl/xl_parse.c
@@ -1351,7 +1351,7 @@ void parse_config_data(const char *config_source,
     XLU_ConfigList *cpus, *vbds, *nics, *pcis, *cvfbs, *cpuids, *vtpms,
                    *usbctrls, *usbdevs, *p9devs, *vdispls, *pvcallsifs_devs;
     XLU_ConfigList *channels, *ioports, *irqs, *iomem, *viridian, *dtdevs,
-                   *mca_caps, *smbios, *llc_colors;
+                   *mca_caps, *smbios, *llc_colors, *xs_quota;
     int num_ioports, num_irqs, num_iomem, num_cpus, num_viridian, num_mca_caps;
     int num_smbios;
     int pci_power_mgmt = 0;
@@ -1360,6 +1360,7 @@ void parse_config_data(const char *config_source,
     int pci_seize = 0;
     int i, e;
     int num_llc_colors;
+    int num_xs_quota;
     char *kernel_basename;
 
     libxl_domain_create_info *c_info = &d_config->c_info;
@@ -1467,6 +1468,26 @@ void parse_config_data(const char *config_source,
     if (!xlu_cfg_get_long (config, "xenstore_feature_mask", &l, 0))
         b_info->xenstore_feature_mask = l;
 
+    if (!xlu_cfg_get_list(config, "xenstore_quota", &xs_quota, &num_xs_quota, 0)) {
+        b_info->xenstore_quota.num_quota = num_xs_quota;
+        b_info->xenstore_quota.quota = calloc(num_xs_quota, sizeof(* b_info->xenstore_quota.quota));
+        if (b_info->xenstore_quota.quota == NULL) {
+            fprintf(stderr, "unable to allocate memory for xenstore_quota\n");
+            exit(-1);
+        }
+
+        for (i = 0; i < num_xs_quota; i++) {
+           buf = xlu_cfg_get_listitem(xs_quota, i);
+           if (!buf) {
+                fprintf(stderr,
+                        "xl: Can't get element %d in Xenstore quota list\n", i);
+                exit(1);
+            }
+            if (parse_xsquota_item(buf, b_info->xenstore_quota.quota + i))
+                exit(1);
+        }
+    }
+
     libxl_domain_build_info_init_type(b_info, c_info->type);
 
     if (b_info->type == LIBXL_DOMAIN_TYPE_PVH) {
-- 
2.53.0


