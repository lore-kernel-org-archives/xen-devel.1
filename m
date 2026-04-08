Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51E4710F9964
	for <xen-devel@archiver.kernel.org>; Wed,  8 Apr 2026 17:24:02 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1276424.1561895 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAWd4-0005QW-6H; Wed, 08 Apr 2026 17:23:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1276424.1561895; Wed, 08 Apr 2026 17:23:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAWd4-0005QN-3f; Wed, 08 Apr 2026 17:23:50 +0000
Received: by outflank-mailman (input) for mailman id 1276424;
 Wed, 08 Apr 2026 17:23:49 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <bounce-md_30504962.69d68f21.v1-a9ac9385157d4fe2811a2f8d5aeda822@bounce.vates.tech>)
 id 1wAWd3-0005Q7-3O
 for xen-devel@lists.xenproject.org; Wed, 08 Apr 2026 17:23:49 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wAWd2-005z4v-Fd
 for xen-devel@lists.xenproject.org; Wed, 08 Apr 2026 19:23:48 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <bounce-md_30504962.69d68f21.v1-a9ac9385157d4fe2811a2f8d5aeda822@bounce.vates.tech>)
 id 69d68f00-e002-0a2a0a5209dd-0a2a4509a776-34
 for <xen-devel@lists.xenproject.org>; Wed, 08 Apr 2026 19:23:48 +0200
Received: from [198.2.180.46] (helo=mail180-46.suw31.mandrillapp.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from
 <bounce-md_30504962.69d68f21.v1-a9ac9385157d4fe2811a2f8d5aeda822@bounce.vates.tech>)
 id 69d68f22-bf79-0a2a45090019-c602b42e53ca-3
 for <xen-devel@lists.xenproject.org>; Wed, 08 Apr 2026 19:23:48 +0200
Received: from pmta11.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail180-46.suw31.mandrillapp.com (Mailchimp) with ESMTP id
 4frVKF48ZWz8XVRgS
 for <xen-devel@lists.xenproject.org>; Wed,  8 Apr 2026 17:23:45 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 a9ac9385157d4fe2811a2f8d5aeda822; Wed, 08 Apr 2026 17:23:45 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=mte1 header.d=mandrillapp.com header.i="@mandrillapp.com" header.h="From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:Date:MIME-Version:Content-Type:Content-Transfer-Encoding"; dkim=pass header.s=mte1 header.d=vates.tech header.i="thierry.escande@vates.tech" header.h="From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:Date:MIME-Version:Content-Type:Content-Transfer-Encoding"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1775669025; x=1775939025;
	bh=bL/Y0h09vhas0clUhCqZuQCPZsSmUUKUpgqhUdmmhks=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=AkuGAWul21I7hqPr7vG5L4oaDg6JuP/l8JnQqIRW+1hRaONFUZYgaUiXOqD1FHOmb
	 IcNy4U/BqDnZBrwgUOCBBn5mLtX/o8nvvI+mhIExq/RiFkWfDik8LnDYCo2loIYYEp
	 O9loGTWF3FLrC1oquRTlW5UZdYFhNoJV6ztyNt9BXvxri6A0awKvK1icNQUdTd2Z+E
	 S1sLVF0pqP7CDGdXQSl8J+Vzi85Mc3QKuOOodt8Mlj2cS/AbUz4qlyrpBxE1P1Xsmv
	 5v046kdgKnjF70Xbvoz3qqOADi9sJDGxE99ifZCxZHs/qpP+HSywSGNRHwNhr+Tiu9
	 gn+6Tlz8RoQSA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1775669025; x=1775929525; i=thierry.escande@vates.tech;
	bh=bL/Y0h09vhas0clUhCqZuQCPZsSmUUKUpgqhUdmmhks=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=a2BE5wjKAyRaDbTphxwyPGO/DgF0jM9cK+4dPpThdNIDVOsQt45QMBSjDxTOV6Lvc
	 abdDRqsCDYx53WSGv7a3G03uAB4rZWYqqbfyR9hrc+8t6OlmGEiV0vtKYdh3BM5aa8
	 HTNg43kZT8tKMbgb0nEJIEZbM1PvRV4S7V4mO2VuQg+T7RbTTSD/htyzg8R10eo/g3
	 rh1dY17f8P29zcAYNv+scOh5yW++S/swbpxaXaXBO4lrbDV8PS4zxKa3LpyzTUJrFm
	 yoPtGBC4s1FRdFAUMAfKoF/puW7MxvCqVmcfXcMWbyMzzqQ+npwtrhXY3YmCI39ITD
	 C3uCg8i8FMBaw==
From: "Thierry Escande" <thierry.escande@vates.tech>
Subject: =?utf-8?Q?[RFC=20PATCH=201/3]=20xl:=20Add=20pci=20device=20hotplug=20option?=
X-Mailer: git-send-email 2.53.0
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1775669024628
To: xen-devel@lists.xenproject.org
Cc: "Thierry Escande" <thierry.escande@vates.tech>, "Anthony PERARD" <anthony.perard@vates.tech>, "Juergen Gross" <jgross@suse.com>, "=?utf-8?Q?Daniel=20P=20.=20Berrang=C3=A9?=" <berrange@redhat.com>, "=?utf-8?Q?Marek=20Marczykowski-G=C3=B3recki?=" <marmarek@invisiblethingslab.com>
Message-Id: <20260408172320.539750-2-thierry.escande@vates.tech>
In-Reply-To: <20260408172320.539750-1-thierry.escande@vates.tech>
References: <20260408172320.539750-1-thierry.escande@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.a9ac9385157d4fe2811a2f8d5aeda822?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260408:md
Date: Wed, 08 Apr 2026 17:23:45 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-bad1c0/1775669028-2E74A152-EAE45717/0/0
X-purgate-type: clean
X-purgate-size: 2895

This option is used to passthrough PCI devices using the Qemu command
line (-device driver,...) instead of the QMP hot-plug mechanism.

This is needed for Q35 support since its PCI root bus doesn't support
hotplugging.

If not specified, the default behavior is to use hotplug via QMP.

Signed-off-by: Thierry Escande <thierry.escande@vates.tech>
---
 tools/libs/light/libxl_types.idl | 1 +
 tools/libs/util/libxlu_pci.c     | 2 ++
 tools/xl/xl_parse.c              | 5 +++++
 3 files changed, 8 insertions(+)

diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_types.idl
index a7893460f0..aca0e93793 100644
--- a/tools/libs/light/libxl_types.idl
+++ b/tools/libs/light/libxl_types.idl
@@ -922,6 +922,7 @@ libxl_device_pci = Struct("device_pci", [
     ("seize", bool),
     ("rdm_policy", libxl_rdm_reserve_policy),
     ("name", string),
+    ("hotplug", bool),
     ])
 
 libxl_device_rdm = Struct("device_rdm", [
diff --git a/tools/libs/util/libxlu_pci.c b/tools/libs/util/libxlu_pci.c
index 294482c6d7..f6440c878b 100644
--- a/tools/libs/util/libxlu_pci.c
+++ b/tools/libs/util/libxlu_pci.c
@@ -192,6 +192,8 @@ int xlu_pci_parse_spec_string(XLU_Config *cfg, libxl_device_pci *pci,
             name_present = true;
             pci->name = strdup(val);
             if (!pci->name) ret = ERROR_NOMEM;
+        } else if (!strcmp(key, "hotplug")) {
+            pci->hotplug = atoi(val);
         } else {
             XLU__PCI_ERR(cfg, "Unknown PCI_SPEC_STRING option: %s", key);
             ret = ERROR_INVAL;
diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
index 48c72dce9c..7ea2a76662 100644
--- a/tools/xl/xl_parse.c
+++ b/tools/xl/xl_parse.c
@@ -1361,6 +1361,7 @@ void parse_config_data(const char *config_source,
     int pci_msitranslate = 0;
     int pci_permissive = 0;
     int pci_seize = 0;
+    int pci_hotplug = 1;
     int i, e;
     int num_llc_colors;
     int num_xs_quota;
@@ -1699,6 +1700,9 @@ void parse_config_data(const char *config_source,
     if (!xlu_cfg_get_long (config, "pci_seize", &l, 0))
         pci_seize = l;
 
+    if (!xlu_cfg_get_long (config, "pci_hotplug", &l, 0))
+        pci_hotplug = l;
+
     if (!xlu_cfg_get_string(config, "rdm", &buf, 0)) {
         libxl_rdm_reserve rdm;
         if (!xlu_rdm_parse(config, &rdm, buf)) {
@@ -1720,6 +1724,7 @@ void parse_config_data(const char *config_source,
             pci->power_mgmt = pci_power_mgmt;
             pci->permissive = pci_permissive;
             pci->seize = pci_seize;
+            pci->hotplug = pci_hotplug;
             /*
              * Like other pci option, the per-device policy always follows
              * the global policy by default.
-- 
2.53.0



--
Thierry Escande | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


