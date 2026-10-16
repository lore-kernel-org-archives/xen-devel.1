Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 522A0CCA490
	for <xen-devel@archiver.kernel.org>; Fri, 16 Oct 2026 17:06:52 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1452485.1667308 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHlOE-0006Yu-GL; Fri, 16 Oct 2026 17:06:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1452485.1667308; Fri, 16 Oct 2026 17:06:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHlOE-0006Yh-CC; Fri, 16 Oct 2026 17:06:42 +0000
Received: by outflank-mailman (input) for mailman id 1452485;
 Fri, 16 Oct 2026 17:06:41 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a145adfbff0008425@swg.vates.tech>)
 id 1xHlOD-0006UT-2H
 for xen-devel@lists.xenproject.org; Fri, 16 Oct 2026 17:06:41 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xHlO7-003ZI0-FR
 for xen-devel@lists.xenproject.org; Fri, 16 Oct 2026 19:06:35 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a145adfbff0008425@swg.vates.tech>)
 id 6ad2598e-2eae-0a2a0a5409dd-0a2a450bb738-18
 for <xen-devel@lists.xenproject.org>; Fri, 16 Oct 2026 19:06:35 +0200
Received: from [185.255.28.35] (helo=prod-mta-13-02.swg-srv.net)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a145adfbff0008425@swg.vates.tech>)
 id 6ad2599b-b7e8-0a2a450b0019-b9ff1c23910b-3
 for <xen-devel@lists.xenproject.org>; Fri, 16 Oct 2026 19:06:35 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a145adfbff0008425.005 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 16 Oct 2026 17:06:32 +0000
Received: from bazzite.gpn.vates.fr (88-188-240-210.subs.proxad.net
 [88.188.240.210]) (Authenticated sender: teddy.astie)
 by mail2.vates.fr (Postfix) with ESMTPSA id BDCB281C51;
 Fri, 16 Oct 2026 19:06:31 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=mmhDbK1YfxrKlQEC97zC2xToiisAWCT+Z+mazkCeCQ0=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=I2gbsdLJkK32Xw9kjVPKBaKvtfykk+KEFOpU8r1eaGP9o95ztAtfNUaLe7GGcWoo9aqXpTWod
 Yf6a5fFHaSQ06VWTxw13gK4b3tWbCtvyjipGhSA18lSf/Db95Nbgx6StuuPfRD1WmBOeJhLdlme
 vNScOhPIELYZ4ECF+k/dhp8td7ZwcTGdtaLtpN2XgT5Wqvlv1bAr5K570GKlUnyONDflvgDGJiH
 qj4oUXeak75kF0KeChNn8mm6SVQxkozkERXy7uYn0YQLpBKhlzqaaDtSjqU/8Efcjkhs0BzKsp4
 Cl2tYYHAjmR72wuwxG9jIqtZUFhJsgahYhV0+sV1fqeQ==
X-Zone-Loop: 8c2572fbe5a69fcc666fad8bf8d5629e6a3aa37d453d
x-campaign-type: default
x-transaction-id: a6670906-61e6-427c-9bf2-aff06d8555af
x-swg-uid: 01-0fab3c21-0372-41a5-9288-5c22785feb60
X-Mailer: Sweego
Message-ID:
 <1792170392.8631fc262581453bbf619ec5b2062170.1a145adfbff0008425@vates.tech>
x-swg-bid: 1792170392.8631fc262581453bbf619ec5b2062170.1a145adfbff0008425
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
From: Teddy Astie <teddy.astie@vates.tech>
To: xen-devel@lists.xenproject.org
Cc: Teddy Astie <teddy.astie@vates.tech>,
	Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	David Woodhouse <dwmw2@infradead.org>,
	x86@kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/8] x86/xen/pv: Don't setup runstate area too early
Date: Fri, 16 Oct 2026 19:06:06 +0200
In-Reply-To: <1792170295.8631fc262581453bbf619ec5b2062170.1a145ac82530008425@vates.tech>
References: <1792170295.8631fc262581453bbf619ec5b2062170.1a145ac82530008425@vates.tech>
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.2f6.a84eb19d1ebebf92.1a145adf99c.d738e27dff4c8a36=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1792170391964
X-purgate-ID: tlsNG-42698a/1792170395-188C99EA-28A9EB3B/0/0
X-purgate-type: clean
X-purgate-size: 1568

---=Part.2f6.a84eb19d1ebebf92.1a145adf99c.d738e27dff4c8a36=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

This is no longer required since [1]=2E

At this moment of boot, per_cpu areas are not initialized, which prevents
using VCPUOP_register_runstate_phys_area as per_cpu_ptr_to_phys() would
misbehave in this case=2E

[1] 8a22b9996b00 ("xen: drop xen_sched_clock in favour of using plain wall=
clock time")
---
CC: Juergen Gross <jgross@suse=2Ecom>
CC: Boris Ostrovsky <boris=2Eostrovsky@oracle=2Ecom>
CC: Stefano Stabellini <sstabellini@kernel=2Eorg>
CC: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam=2Ecom>
CC: David Woodhouse <dwmw2@infradead=2Eorg>
CC: x86@kernel=2Eorg
CC: linux-kernel@vger=2Ekernel=2Eorg

 arch/x86/xen/enlighten_pv=2Ec | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/x86/xen/enlighten_pv=2Ec b/arch/x86/xen/enlighten_pv=2Ec
index 2c64b388f616=2E=2Eab3374b2f012 100644
--- a/arch/x86/xen/enlighten_pv=2Ec
+++ b/arch/x86/xen/enlighten_pv=2Ec
@@ -1551,9 +1551,6 @@ asmlinkage __visible void __init xen_start_kernel(st=
ruct start_info *si)
 #endif
 	xen_raw_console_write("about to get started=2E=2E=2E\n");
=20
-	/* We need this for printk timestamps */
-	xen_setup_runstate_info(0);
-
 	xen_efi_init(&boot_params);
=20
 	/* Start the world */
--=20
2=2E56=2E0



-- 
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates s=
olutions

web: https://vates=2Etech
---=Part.2f6.a84eb19d1ebebf92.1a145adf99c.d738e27dff4c8a36=---

