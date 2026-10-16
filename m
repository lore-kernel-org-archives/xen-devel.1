Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0DE5CCA46C
	for <xen-devel@archiver.kernel.org>; Fri, 16 Oct 2026 17:05:23 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1452477.1667289 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHlMj-0005c3-Uh; Fri, 16 Oct 2026 17:05:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1452477.1667289; Fri, 16 Oct 2026 17:05:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHlMj-0005bw-Rr; Fri, 16 Oct 2026 17:05:09 +0000
Received: by outflank-mailman (input) for mailman id 1452477;
 Fri, 16 Oct 2026 17:05:08 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a145ac87b70008425@swg.vates.tech>)
 id 1xHlMi-0005bZ-Qn
 for xen-devel@lists.xenproject.org; Fri, 16 Oct 2026 17:05:08 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xHlMi-00D0TI-68
 for xen-devel@lists.xenproject.org; Fri, 16 Oct 2026 19:05:08 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a145ac87b70008425@swg.vates.tech>)
 id 6ad25936-bab6-0a2a0a5309dd-0a2a450b968a-8
 for <xen-devel@lists.xenproject.org>; Fri, 16 Oct 2026 19:05:08 +0200
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a145ac87b70008425@swg.vates.tech>)
 id 6ad25943-b7e8-0a2a450b0019-b9ff1c12ae97-3
 for <xen-devel@lists.xenproject.org>; Fri, 16 Oct 2026 19:05:08 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a145ac87b70008425.005 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 16 Oct 2026 17:04:57 +0000
Received: from bazzite.gpn.vates.fr (88-188-240-210.subs.proxad.net
 [88.188.240.210]) (Authenticated sender: teddy.astie)
 by mail2.vates.fr (Postfix) with ESMTPSA id 9E39182147;
 Fri, 16 Oct 2026 19:04:56 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=LNS8Q1yMCOr9mDwjdOlitAadpYMFYRFn5edPH0JFlxM=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=gg9TSsFuN50hzTeApt0OUsRANLCstXoJg1VHtp1EKMUO+6GRQulENlb3wCHdEQBJ+q3vyhRL0
 A+oeKt7ZRMfbg5QPvIWHUxYfw0A7x332h3Z0YJEKemz4gq/W6Wg94zGPXTnkm0Qlnx3YQsKKGK2
 9Y8HFOIr9llVPfj70y/Ow9MQqi080MUoSWk7xeHrfR2UNdmRGAwzNE6JGxxYcyVRuYgNcR9bK73
 rD2lgVtsE8Cu88XbYlJbFJLd121q/44yluwavGhJY4hRaWZPw3UnaA5N9GHsAMDD4DNVtC7o71o
 WrTh9+NMmNG5Y4khmV5ln3IZ7jhaTcYTw0AKQmdEwA8g==
X-Zone-Loop: 0b2eb03d03dc5932ad51f01d23265ac6ddfeb6ec370f
x-campaign-type: default
x-transaction-id: facd8506-db05-4625-8eeb-32390827f856
x-swg-uid: 01-bd9b1c2b-1969-41ec-bd22-a10fe1125bc8
X-Mailer: Sweego
Message-ID:
 <1792170297.8631fc262581453bbf619ec5b2062170.1a145ac87b70008425@vates.tech>
x-swg-bid: 1792170297.8631fc262581453bbf619ec5b2062170.1a145ac87b70008425
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
Date: Fri, 16 Oct 2026 19:04:42 +0200
In-Reply-To: <20261016170449.172889-1-teddy.astie@vates.tech>
References: <20261016170449.172889-1-teddy.astie@vates.tech>
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.2f5.38d6ecc2e272c00a.1a145ac8604.36ccb94a74936a8a=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1792170296836
X-purgate-ID: tlsNG-42698a/1792170308-A9AC09EA-D72F3974/0/0
X-purgate-type: clean
X-purgate-size: 1568

---=Part.2f5.38d6ecc2e272c00a.1a145ac8604.36ccb94a74936a8a=-
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
---=Part.2f5.38d6ecc2e272c00a.1a145ac8604.36ccb94a74936a8a=---

