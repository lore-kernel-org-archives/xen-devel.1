Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2488ECD98FC
	for <xen-devel@archiver.kernel.org>; Thu, 18 Jun 2026 14:56:33 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1341278.1601811 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waEAI-0001iu-CP; Thu, 18 Jun 2026 14:56:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1341278.1601811; Thu, 18 Jun 2026 14:56:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waEAI-0001i6-1H; Thu, 18 Jun 2026 14:56:22 +0000
Received: by outflank-mailman (input) for mailman id 1341278;
 Thu, 18 Jun 2026 14:56:20 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19edb3b524c000701b@swg.vates.tech>)
 id 1waEAG-0001B3-7W
 for xen-devel@lists.xenproject.org; Thu, 18 Jun 2026 14:56:20 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1waEAF-008siE-KK
 for xen-devel@lists.xenproject.org; Thu, 18 Jun 2026 16:56:19 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19edb3b524c000701b@swg.vates.tech>)
 id 6a34070c-bab6-0a2a0a5309dd-0a2a45028f70-24
 for <xen-devel@lists.xenproject.org>; Thu, 18 Jun 2026 16:56:19 +0200
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19edb3b524c000701b@swg.vates.tech>)
 id 6a3406fe-fdf1-0a2a45020019-b9ff1c12adcb-14
 for <xen-devel@lists.xenproject.org>; Thu, 18 Jun 2026 16:56:19 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19edb3b524c000701b.003 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 18 Jun 2026 14:55:58 +0000
Received: from bazzite.gpn.vates.fr (88-188-240-210.subs.proxad.net
 [88.188.240.210]) (Authenticated sender: teddy.astie@vates.tech)
 by mail2.vates.fr (Postfix) with ESMTPSA id ECF83869DB;
 Thu, 18 Jun 2026 16:55:57 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=EcZr96kEpErRQkgHDh5PnBP7wu8HobCeYxwsO4gCclE=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=sOT5eAQWnzRnJmIMlInauxkOR8C8mEiGEXecHz/7H0w0k+TEvSPTlvxOYuLer+MIqMmmBttu9
 Vo+JpdUhh2eC/FD6VtR6HZoK9HpSze7A2kWCe57FpwefWlXrmPoKDCUPY/BY6CtLkwuGAWv8jS4
 MX3ghAjH25NQQ2Jt/2BorUgIsgpjN1hhBg1XuB4QMeOAKjOmL/SjMFHVeVITB8sA95kMJ8LuGXO
 7VzkgsWGmnDjX3UMgQQr38/DKUfSILvDl/+Um1oc4ZfZC9p/+UjflJKyn7fB7sgJ2u3Uf1eFnD8
 09rEuxq5X3VutLyJ4F8eMrVRqsd058qtn97e6+4wqrWQ==
X-Zone-Loop: c673ef689ebfe0ea10d23a5e560d8487b4bcfd1a9687
x-campaign-type: default
x-transaction-id: 75d71809-dab2-4c88-8208-983fd03f1cfb
x-swg-uid: 01-e21ed00e-f7c8-46df-b2e2-d24dd3b0647c
X-Mailer: Sweego
Message-ID:
 <1781794558.8631fc262581453bbf619ec5b2062170.19edb3b524c000701b@vates.tech>
x-swg-bid: 1781794558.8631fc262581453bbf619ec5b2062170.19edb3b524c000701b
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
From: Teddy Astie <teddy.astie@vates.tech>
To: xen-devel@lists.xenproject.org
Cc: Teddy Astie <teddy.astie@vates.tech>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 11/15] vtd: Rewrite igd device check in acpi_parse_dev_scope()
Date: Thu, 18 Jun 2026 16:50:35 +0200
In-Reply-To: <cover.1781790171.git.teddy.astie@vates.tech>
References: <cover.1781790171.git.teddy.astie@vates.tech>
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.692.d2bcadc6a737d3ff.19edb3b50bb.4a2c63e6617118c9=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1781794558139
X-purgate-ID: tlsNG-720697/1781794579-466633F3-0AB96C29/0/0
X-purgate-type: clean
X-purgate-size: 1303

---=Part.692.d2bcadc6a737d3ff.19edb3b50bb.4a2c63e6617118c9=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Make it clearer that we want to check for 0000:00:02=2E0 here=2E

Signed-off-by: Teddy Astie <teddy=2Eastie@vates=2Etech>
---
 xen/drivers/passthrough/vtd/dmar=2Ec | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/drivers/passthrough/vtd/dmar=2Ec b/xen/drivers/passthroug=
h/vtd/dmar=2Ec
index 2dd362410e=2E=2E4a98f15fce 100644
--- a/xen/drivers/passthrough/vtd/dmar=2Ec
+++ b/xen/drivers/passthrough/vtd/dmar=2Ec
@@ -389,7 +389,7 @@ static int __init acpi_parse_dev_scope(
                                     PCI_CLASS_DEVICE + 1) !=3D 0x03
                                     /* PCI_BASE_CLASS_DISPLAY */ )
                     gfx_only =3D false;
-                else if ( !seg && !dev_sbdf=2Ebus && path->dev =3D=3D 2 &=
& !path->fn )
+                else if ( dev_sbdf=2Esbdf =3D=3D PCI_SBDF(0, 0, 2, 0)=2Es=
bdf )
                     igd_drhd_address =3D drhd->address;
             }
=20
--=20
2=2E54=2E0



-- 
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates s=
olutions

web: https://vates=2Etech
---=Part.692.d2bcadc6a737d3ff.19edb3b50bb.4a2c63e6617118c9=---

