Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13BE6C88E45
	for <xen-devel@archiver.kernel.org>; Fri, 11 Sep 2026 07:25:20 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1415727.1644951 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4vdE-0008BQ-0a; Fri, 11 Sep 2026 07:25:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1415727.1644951; Fri, 11 Sep 2026 07:25:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4vdD-0008BJ-Tr; Fri, 11 Sep 2026 07:25:07 +0000
Received: by outflank-mailman (input) for mailman id 1415727;
 Fri, 11 Sep 2026 07:25:06 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <brchuckz@aol.com>) id 1x4vdC-00089b-CJ
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 07:25:06 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x4vdA-004oXr-U1
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 09:25:04 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <brchuckz@aol.com>)
 id 6aa3accc-bab6-0a2a0a5309dd-0a2a4508d58a-6
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 09:25:04 +0200
Received: from [98.137.69.32] (helo=sonic316-8.consmr.mail.gq1.yahoo.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <brchuckz@aol.com>)
 id 6aa3accf-f659-0a2a45080019-628945209855-3
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 09:25:04 +0200
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic316.consmr.mail.gq1.yahoo.com with HTTP; Fri, 11 Sep 2026 07:25:02 +0000
Received: by hermes--production-bf1-54b5569bdc-fv65m (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID c4451c0cd4386c4b1051306e68eb9ea1; 
 Fri, 11 Sep 2026 07:24:58 +0000 (UTC)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=a2048 header.d=aol.com header.i="@aol.com" header.h="From:To:Cc:Subject:Date:In-Reply-To:References"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048; t=1789111502; bh=2bfcA2HA0eFN2KKmyTFegbUhGh8vw5fjlw90db5CzuY=; h=From:To:Cc:Subject:Date:In-Reply-To:References:From:Subject:Reply-To; b=IXmDy3e917fafoCDKiMu3JLjF/+baEn8doi4MYF2R9yQM5EqgH4MAHX7irFLr1+MkBmH72QNjuHLWO+G3tIKkCanQaik3Nj0SNHWpKNVdXMG693QuDR4V6irm9cT/oe07cmjJKfgMX97ZlQiSK9imAiTEIsHUJFHb6Wke+96v8rN0zWdzNnNnxBoLesXmEImDvds3o+va+dj8m9HHP+ltI82zHlJAWeDZ/jbmBSAC8RBuHTD9U7UVhI4R5RLdSPKdIoTrlZa3K9Pj4+kqS8NQ7bT9c8abqntTXcgCoJSgGKTiEZQD/hJWIENFeW07VkBmFn/MJp7S0+kU6WNSjsUUg==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1789111502; bh=Bb+TK9wUavK5OW1HyioutUUdAopuw/9tkWTkNKyTaMv=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=Y9IWjyI4/ApHHRd0KYrrO/owGil09DQu3h0R9r4n9FsmN+7lTZp2AHqm0QU2YM9uglYB2BYYQP9ArpG4IAfSnDu4zlgo7KjIQey3gN4BW+mwSmaEpR14GG9FSJTaBZ93XHy8eISiddxHcT8YH14Sc0E32e4xwL2nbIbByb6s0pPollXvQPCloOiSCCoVe/7MFeUWPRFGQvcwOdL6iPZN4EH4yKS2hJBFoAf2NHkL3qTEJTmiGykyaB4q/UQ8IHM2hpDtLNUhVXOuVE5UmHQC3lXSp9bWYC/zK6/R1Mr6j6//ZVXBGWZL2YMom5ZqD7TuCwTcqm3E+USSQZE1a2jt/w==
X-YMail-OSG: 6LTy5XQVM1k1afLOhVe_.u4gdDeNa8ddjCTiQ7cU8GnOhmF4.cnNYnxn70vsVl9
 JDqMI0JpYFMCrtJvrEGSxGFHzfoA5NpSe0iu0sx6XFmlH4bvTNMa8ktt8LZKJVF5on_IHscGuzjc
 _9lRXkSaoAi.Acyy3XJIQOhYaXWdB84eg6A5MNPnh6OmQOcSfssk4IEAz91rogy3KcpK1WaMr3Py
 Z8otViqzrIOfSCyX2gNZ2fgJQGtqcxidUg05o0qrXEgsr923OwUNgpLlpdPhfFS_8IhzXaGbZn0Q
 zZNk0iSUiUlnHyd8Tg1kLonZ.I3DwIe.IM0i77T5Y3J0CzvRmpkGXWJC9_Tt4wJo4B73ECjymLdF
 GfLY31J9UCw5OcdGPUKGj9_qkuqNWsZZeDPrS5Q79jzZQy4n3SVqgHQYnW0T8Xz8u2przyNfDv3E
 5r2rlGaFqardcgKDlSVnzm99lXUS9Gb.3KzcDxjfZI1ghBuSGjB1qoCJuf9tnVzNrdSvHPODLpGw
 sdhRRY1WoXAuYLOQaoa7zP3N5FL.ZZOsQP5dTFoZvYbgjDbR.9ECw3UWCk4bVJfPpEaU1uOQXMYl
 ZmSCWEWAAStfyzhlpjJhVin.9yR2McoNyvNv_KgUjeOWJuRoSEj89Bm0Ai0J4_U51qsqo1QznzAW
 CirPdWOphXQCLQV83jaYh3CnRTO55jxDE_l5tquNhcx3hCoYv8RpcAUPlfeI96qyq6hKzU3aFpTn
 FKW.hf46HQ7KIhsZHRk.sgxuPA5s5SJKBudIDc3FBaF4NKkABEWps6VBojaz2NttbK7OXqR4KkCX
 az8fWzscASQPD4JQOC8q_ymQkPeja9LFijFMh5HVjmtEiZrpZFijG.sgvtoumLr94U.haL3xIvUL
 8QV90d7U78tcOTgK_aanz8N1m0smWWf8N5r8kLPAiu6M3O2bLXlc9Ezo_FpgwUDB2_M4lZrJVT6i
 O8wEAAimZ_9SPLkQYZ3lOEwOfauIteSsFWJsb1Zq1dsTJK.kkRipmt5IL1dupWTkzFRtUHwBAai_
 m7a6LiSZDuM3M47yawNSbQJsIkmV_xJV7IN_Y00KDHjSvAvGU874SmSm5vm50AnG.r.iOU4Hbv9U
 foriY0NcDWk_u_dNuMmRFXX8YqMz9ASpkGhVxeGJw2OLHIyV0epV0.nRe5jlSo8pgvLG.2rHi.ms
 VehXmEFvM.4Q7HxgbzwhDbJnptKtTX3qFmgWDlKslyv6vFEtAj9lDiykI0nUdmdgCgxv0tK2bm8k
 maAOXO7hz.cKKjjrA55N5ukF3CgD1m1YM.LBDbOdgvfDU9YgWU9aj0EJanThqA6TBeUipvc9Tsr3
 1DPOVBEJHn3wOD8n7Tb6LdL5nRYXcp.xmRF2luz3Bc.CUdLlz.2fyAYUfwx37VoNNVnaIfdjU04i
 PT7RGxM8hCMEY5XOXFJQ.zxcwKmmlA4GbVDN5yN0i6mIPKxyQVvioeOQyxf4na8twH51..fXPK5o
 h.ET8Pw2oXlLmCRKjtft.2vGda4R3N0pam7CUuxinhS7Lmsc22TaadZm9qiKj5fnJBGTcUAlmgJY
 LxHoVm9dMAlMs.QTe8HzMZ4wkT2R0JWPv2COq1ViL8q4BlLqk_CKVNczeyt3_fKxKmBOJlipOTpj
 NmMszCnlDDKl.ylq_1E5wVZPV7XXVtazKAsrmX57w_TKkyQqERgmUcKX_wnzWVwbfabn0Ui0_hOY
 hejI2IApmjYRgQ0BBE2x_eXFRrxRbioTj2sZty28XfUnpKaRWKRKFcLfTnrwaKIMetynvCVMb9P5
 joZxr9etDa2doxVeENp2fJahGnfqivGiucj0kK3CkzqnC73W2pC2PF3ifONJATFOYeOFSPDzpwZR
 .LoigatUZU6pd83GyeYdSqUqf9kC_u3BJL3tX5VfEgk6qpv7D9eQw5dyDah0LWmCobv3C6x2EGCl
 fBlk8p8gJxTYRKIS6RXftbpF1Rj_Vb.UcDUzwlp5E5zzPmly0nbvw4SjAa9qJkhi9b0epcegFMHC
 BiIu6c3I1R9DvidR6t3R3abeS5HyUC5EkLSnKe_Bi5rKTHTRlCIrU6ckDgyYd_2Nq99Hcy0DSF3x
 HRL9_wNAz5VESmQFyxp0H1THmykZUCimK.b.1i_3YxwLzY9GER6HUZVCqAmXlmBEE8cD.qPG8M8c
 z1XPXdQHvXzQfpHPz75mZ13LOV7L7HekxXP7hSzmCDCR93ypuaXc12D1FWgjQBimWUbMkHH2UP39
 TFBReosiwvRvFEZNtZismBqe9GtdZ8zxzWRy4
X-Sonic-MF: <brchuckz@aol.com>
X-Sonic-ID: ec7da795-eae4-4ab0-83c2-71a43c2c372e
From: Chuck Zmudzinski <brchuckz@aol.com>
To: qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org,
	xen-devel@lists.xenproject.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony@xenproject.org>,
	"Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
	Tomita Moeko <tomitamoeko@gmail.com>
Subject: [PATCH v6 2/7] xen/igd: don't register rom bar twice
Date: Fri, 11 Sep 2026 03:24:48 -0400
Message-ID: <20260911072453.46256-3-brchuckz@aol.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260911072453.46256-1-brchuckz@aol.com>
References: <20260911072453.46256-1-brchuckz@aol.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c1860d/1789111504-D574B87B-917D3781/0/0
X-purgate-type: clean
X-purgate-size: 1401

This also fixes a failed assertion in pci [1] for Qemu
version 10 and higher when passing through an Intel
IGD with an option ROM to the guest.

[1] f6fc01c78666 ("hw/pci: Assert a bar is not registered multiple times")

Fixes: 881213f1b9c5 ("xen, gfx passthrough: retrieve VGA BIOS to work")
Signed-off-by: Chuck Zmudzinski <brchuckz@aol.com>
---
Changes in v6:
  - No changes to this patch

Changes in v5:
  - No changes to this patch

Changes in v4:
  - Use 12 digits for commit hashes

 hw/xen/xen_pt.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/xen/xen_pt.c b/hw/xen/xen_pt.c
index c8f08b5..4d159a2 100644
--- a/hw/xen/xen_pt.c
+++ b/hw/xen/xen_pt.c
@@ -459,6 +459,7 @@ static int xen_pt_register_regions(XenPCIPassthroughState *s, uint16_t *cmd)
 {
     int i = 0;
     XenHostPCIDevice *d = &s->real_device;
+    const pcibus_t romsize = s->dev.io_regions[PCI_ROM_SLOT].size;
 
     /* Register PIO/MMIO BARs */
     for (i = 0; i < PCI_ROM_SLOT; i++) {
@@ -495,7 +496,7 @@ static int xen_pt_register_regions(XenPCIPassthroughState *s, uint16_t *cmd)
     }
 
     /* Register expansion ROM address */
-    if (d->rom.base_addr && d->rom.size) {
+    if (!romsize && d->rom.base_addr && d->rom.size) {
         uint32_t bar_data = 0;
 
         /* Re-set BAR reported by OS, otherwise ROM can't be read. */
-- 
2.52.0


