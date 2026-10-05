Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0DC3CA5FFC
	for <xen-devel@archiver.kernel.org>; Mon,  5 Oct 2026 14:43:36 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1440912.1658436 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xDjuS-0002WV-Q8; Mon, 05 Oct 2026 14:43:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1440912.1658436; Mon, 05 Oct 2026 14:43:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xDjuS-0002WN-L7; Mon, 05 Oct 2026 14:43:20 +0000
Received: by outflank-mailman (input) for mailman id 1440912;
 Mon, 05 Oct 2026 14:43:20 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a10c848c9a0003f66@swg.vates.tech>)
 id 1xDjuR-0002WH-BI
 for xen-devel@lists.xenproject.org; Mon, 05 Oct 2026 14:43:20 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xDjuQ-00Dl8Q-IX
 for xen-devel@lists.xenproject.org; Mon, 05 Oct 2026 16:43:18 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a10c848c9a0003f66@swg.vates.tech>)
 id 6ac3b777-bab6-0a2a0a5309dd-0a2a4505bc78-4
 for <xen-devel@lists.xenproject.org>; Mon, 05 Oct 2026 16:43:18 +0200
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a10c848c9a0003f66@swg.vates.tech>)
 id 6ac3b774-4cb1-0a2a45050019-b9ff1c129f6f-3
 for <xen-devel@lists.xenproject.org>; Mon, 05 Oct 2026 16:43:01 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a10c848c9a0003f66.002 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 05 Oct 2026 14:42:55 +0000
Received: from localhost.localdomain (88-188-240-210.subs.proxad.net
 [88.188.240.210]) (Authenticated sender: teddy.astie@vates.tech)
 by mail2.vates.fr (Postfix) with ESMTPSA id E219581E07;
 Mon,  5 Oct 2026 16:42:54 +0200 (CEST)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=vates.tech header.i="@vates.tech" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:Feedback-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=Pe2+7r91QrtpgDUxoSoT90ds+FEVHjziNdH/cGFvhgo=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:feedback-id;
 b=pC+XoJUmBNxyZY1zG2GHO6aZxs9D9KfZ0BfcuAtp9SEptZK1TB2u5lZ7HuGyXezXf9kXGZmMZ
 1o5LyWXyAsFAmGs7LE1Wp7yVTOUXIAoBa9CDX7njM0XMgjVmNGhl9xrOSLsHJ32wL3LVugS8Ubz
 o252nHhaubeweYP61aMcMCuzdSBt+PWzkkaQr3qYFMpcSiwf5dYqycOaksmgpNwSFxCWzu4Y/2m
 uYeH1qMLexnNJU1qdVhkMyNMRp9coGcyclCqEhLKTp/fwjIN3e2sI75SEutcDLqQXRhnpfvgPnv
 qpKyq/DWNCpeaGNpYDQjkY7YwRbQ4mcd+W/tZ3FDqO7Q==
X-Zone-Loop: 2091a6b1e30a6d80082ae2bd718e9e3ce783ddf2c512
x-campaign-type: default
x-transaction-id: e12f5733-9902-43cb-aae4-10f3186c0f48
x-swg-uid: 01-a332c3f7-31fc-4ff1-ab1d-730fe7b53b10
X-Mailer: Sweego
Message-ID:
 <1791211375.8631fc262581453bbf619ec5b2062170.1a10c848c9a0003f66@vates.tech>
x-swg-bid: 1791211375.8631fc262581453bbf619ec5b2062170.1a10c848c9a0003f66
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
From: Teddy Astie <teddy.astie@vates.tech>
To: xen-devel@lists.xenproject.org
Cc: Teddy Astie <teddy.astie@vates.tech>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>
Subject: [PATCH] x86/shim: Report -ENOSYS instead of -EOPNOTSUPP
Date: Mon,  5 Oct 2026 16:41:51 +0200
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.659.b22e3bd23c97d1dd.1a10c8489d6.edc8bb0d479e5fb4=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1791211375062
X-purgate-ID: tlsNG-c201ff/1791211381-F4EA12A1-D83DF337/0/0
X-purgate-type: clean
X-purgate-size: 1691

---=Part.659.b22e3bd23c97d1dd.1a10c8489d6.edc8bb0d479e5fb4=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Main Xen reported -ENOSYS if the operation is not implemented, however,
shim errorneously reported it as -EOPNOTSUPP, potentially confusing the
guest=2E

Make shim more consistent with Xen by reporting -ENOSYS instead=2E

Fixes: 49f79fe03dfe ("xen/pvshim: add grant table operations")
Fixes: 368ae9a05fee ("xen/pvshim: forward evtchn ops between L0 Xen and L2=
 DomU")
Reported-by: Teddy Astie <teddy=2Eastie@vates=2Etech>
Suggested-by: Andrew Cooper <andrew=2Ecooper3@citrix=2Ecom>
Signed-off-by: Teddy Astie <teddy=2Eastie@vates=2Etech>
---
Found while running XTF tests using pv-shim with a modified xtf-runner=2E

 xen/arch/x86/pv/shim=2Ec | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/pv/shim=2Ec b/xen/arch/x86/pv/shim=2Ec
index 41000b0523=2E=2E024c49c1b3 100644
--- a/xen/arch/x86/pv/shim=2Ec
+++ b/xen/arch/x86/pv/shim=2Ec
@@ -632,7 +632,7 @@ long pv_shim_event_channel_op(int cmd, XEN_GUEST_HANDL=
E_PARAM(void) arg)
=20
     default:
         /* No FIFO or PIRQ support for now */
-        rc =3D -EOPNOTSUPP;
+        rc =3D -ENOSYS;
         break;
     }
=20
@@ -816,7 +816,7 @@ long pv_shim_grant_table_op(unsigned int cmd,
         break;
=20
     default:
-        rc =3D -EOPNOTSUPP;
+        rc =3D -ENOSYS;
         break;
     }
=20
--=20
2=2E55=2E0



-- 
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates s=
olutions

web: https://vates=2Etech
---=Part.659.b22e3bd23c97d1dd.1a10c8489d6.edc8bb0d479e5fb4=---

