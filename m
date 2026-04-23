Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 370EBF589DB
	for <xen-devel@archiver.kernel.org>; Thu, 23 Apr 2026 14:51:00 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1292209.1570733 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFvOC-0005dF-7D; Thu, 23 Apr 2026 14:50:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1292209.1570733; Thu, 23 Apr 2026 14:50:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFvOC-0005d8-4F; Thu, 23 Apr 2026 14:50:48 +0000
Received: by outflank-mailman (input) for mailman id 1292209;
 Thu, 23 Apr 2026 14:50:47 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19dbad2669e000f373@swg.vates.tech>)
 id 1wFvOB-0005d2-2q
 for xen-devel@lists.xenproject.org; Thu, 23 Apr 2026 14:50:47 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wFvOA-00BEO4-FK
 for xen-devel@lists.xenproject.org; Thu, 23 Apr 2026 16:50:46 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19dbad2669e000f373@swg.vates.tech>)
 id 69ea31ab-e002-0a2a0a5209dd-0a2a4509b0ec-30
 for <xen-devel@lists.xenproject.org>; Thu, 23 Apr 2026 16:50:46 +0200
Received: from [185.255.28.34] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19dbad2669e000f373@swg.vates.tech>)
 id 69ea31c6-2497-0a2a45090019-b9ff1c22a40f-3
 for <xen-devel@lists.xenproject.org>; Thu, 23 Apr 2026 16:50:46 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19dbad2669e000f373.002 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 23 Apr 2026 14:50:44 +0000
Received: from xps13-debian.gpn.vates.fr
 (lfbn-mon-1-1130-120.w90-48.abo.wanadoo.fr [90.48.233.120])
 (Authenticated sender: thierry.escande)
 by mail2.vates.fr (Postfix) with ESMTPSA id B8753860B1;
 Thu, 23 Apr 2026 16:50:43 +0200 (CEST)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=vates.tech header.i="@vates.tech" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:In-Reply-To:References:Feedback-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=KBWl2590AHjYullwyX+MHp2jMCGp9Bq1kRreRVpo7Hg=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=WV6T6gNn1hnYPsrUiEqoyfOcYYLe4YLq9YH7IiQ0T3gUFOA8uCYDlOzTXzvgPECDmejRAyAjQ
 5DVIE++Bg24jVUcdgY/GTjIBOTRMy5mYYvc/XfQoSUhqE4ldCggb1IqHLfX6TmLu3nZLALamwxy
 DAAMcnuNrxZnWY46LWnYgsU3/KJLDGBeQ1lPdJO41mv1mbsEBlEB8wYJA1iEzgnPmCTIzV6UUvK
 vqE+Ci8hgKLgyYEUiV4vcMf5p0K8qUd+B7lQA4ybQwHYdVKEAPo8Svs1Wc9n6QAHzOvHyOKgZ+x
 5oMk9gCnu4k5VKPf+lJ3OjdodLXhpO2nHGJRuidfrRfw==
X-Zone-Loop: 5d4489ed720da88da7d6f913bcc746860a10914d2ca1
x-campaign-type: default
x-transaction-id: 948046c6-d1f6-40fb-8274-2ede3dbe1a5e
x-swg-uid: 01-d4d72bf3-db56-47c3-ba66-fc4655f3a1ae
X-Mailer: Sweego
Message-ID:
 <1776955844.8631fc262581453bbf619ec5b2062170.19dbad2669e000f373@vates.tech>
x-swg-bid: 1776955844.8631fc262581453bbf619ec5b2062170.19dbad2669e000f373
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
From: Thierry Escande <thierry.escande@vates.tech>
To: xen-devel@lists.xenproject.org
Cc: Thierry Escande <thierry.escande@vates.tech>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>,
	=?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [RFC PATCH v4 1/6] xl: Add an hotplug option for PCI device passthrough
Date: Thu, 23 Apr 2026 16:50:26 +0200
In-Reply-To: <1776955586.8631fc262581453bbf619ec5b2062170.19dbace7684000f373@vates.tech>
References: <1776955586.8631fc262581453bbf619ec5b2062170.19dbace7684000f373@vates.tech>
MIME-Version: 1.0
Content-Transfert-Encoding: 8bit
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.273d.964768495393517d.19dbad26532.9289b73646f62651=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1776955843890
X-purgate-ID: tlsNG-bad1c0/1776955846-416B0A53-F48FF569/0/0
X-purgate-type: clean
X-purgate-size: 3610

---=Part.273d.964768495393517d.19dbad26532.9289b73646f62651=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

This patch adds a boolean option to the PCI device configuration table
named hotplug=2E This will allow to control how devices are attached to
the guest, either by using the legacy QMP mechanism (this will be the
default) or by passing them directly to the Qemu command line using
xen-pci-passthrough device=2E

Sample use in xl=2Ecfg file:
 pci =3D [ "00:03=2E0,seize=3D1,hotplug=3D0" ]

If not specified, the default behavior is to use hotplug via QMP=2E

This will be needed for Q35 support in guests since the Q35 PCI root bus
doesn't support hotplugging and Xen only support 1 PCI bus for now=2E

Signed-off-by: Thierry Escande <thierry=2Eescande@vates=2Etech>
---
v2: no change

v3: no change

v4:
 - Reword commit message
---
 tools/libs/light/libxl_types=2Eidl | 1 +
 tools/libs/util/libxlu_pci=2Ec     | 2 ++
 tools/xl/xl_parse=2Ec              | 5 +++++
 3 files changed, 8 insertions(+)

diff --git a/tools/libs/light/libxl_types=2Eidl b/tools/libs/light/libxl_t=
ypes=2Eidl
index a7893460f0=2E=2Eaca0e93793 100644
--- a/tools/libs/light/libxl_types=2Eidl
+++ b/tools/libs/light/libxl_types=2Eidl
@@ -922,6 +922,7 @@ libxl_device_pci =3D Struct("device_pci", [
     ("seize", bool),
     ("rdm_policy", libxl_rdm_reserve_policy),
     ("name", string),
+    ("hotplug", bool),
     ])
=20
 libxl_device_rdm =3D Struct("device_rdm", [
diff --git a/tools/libs/util/libxlu_pci=2Ec b/tools/libs/util/libxlu_pci=
=2Ec
index 294482c6d7=2E=2Ef6440c878b 100644
--- a/tools/libs/util/libxlu_pci=2Ec
+++ b/tools/libs/util/libxlu_pci=2Ec
@@ -192,6 +192,8 @@ int xlu_pci_parse_spec_string(XLU_Config *cfg, libxl_d=
evice_pci *pci,
             name_present =3D true;
             pci->name =3D strdup(val);
             if (!pci->name) ret =3D ERROR_NOMEM;
+        } else if (!strcmp(key, "hotplug")) {
+            pci->hotplug =3D atoi(val);
         } else {
             XLU__PCI_ERR(cfg, "Unknown PCI_SPEC_STRING option: %s", key);
             ret =3D ERROR_INVAL;
diff --git a/tools/xl/xl_parse=2Ec b/tools/xl/xl_parse=2Ec
index 48c72dce9c=2E=2E7ea2a76662 100644
--- a/tools/xl/xl_parse=2Ec
+++ b/tools/xl/xl_parse=2Ec
@@ -1361,6 +1361,7 @@ void parse_config_data(const char *config_source,
     int pci_msitranslate =3D 0;
     int pci_permissive =3D 0;
     int pci_seize =3D 0;
+    int pci_hotplug =3D 1;
     int i, e;
     int num_llc_colors;
     int num_xs_quota;
@@ -1699,6 +1700,9 @@ void parse_config_data(const char *config_source,
     if (!xlu_cfg_get_long (config, "pci_seize", &l, 0))
         pci_seize =3D l;
=20
+    if (!xlu_cfg_get_long (config, "pci_hotplug", &l, 0))
+        pci_hotplug =3D l;
+
     if (!xlu_cfg_get_string(config, "rdm", &buf, 0)) {
         libxl_rdm_reserve rdm;
         if (!xlu_rdm_parse(config, &rdm, buf)) {
@@ -1720,6 +1724,7 @@ void parse_config_data(const char *config_source,
             pci->power_mgmt =3D pci_power_mgmt;
             pci->permissive =3D pci_permissive;
             pci->seize =3D pci_seize;
+            pci->hotplug =3D pci_hotplug;
             /*
              * Like other pci option, the per-device policy always follow=
s
              * the global policy by default=2E
--=20
2=2E53=2E0



-- 
Thierry Escande | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vat=
es solutions

web: https://vates=2Etech
---=Part.273d.964768495393517d.19dbad26532.9289b73646f62651=---

