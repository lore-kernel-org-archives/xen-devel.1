Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 890D6CCA46C
	for <xen-devel@archiver.kernel.org>; Fri, 16 Oct 2026 17:07:00 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1452489.1667343 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHlOM-0007Ye-KS; Fri, 16 Oct 2026 17:06:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1452489.1667343; Fri, 16 Oct 2026 17:06:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHlOM-0007YT-Fp; Fri, 16 Oct 2026 17:06:50 +0000
Received: by outflank-mailman (input) for mailman id 1452489;
 Fri, 16 Oct 2026 17:06:49 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a145ae0f160008425@swg.vates.tech>)
 id 1xHlOL-0007Vb-5F
 for xen-devel@lists.xenproject.org; Fri, 16 Oct 2026 17:06:49 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xHlOK-003ZI0-IY
 for xen-devel@lists.xenproject.org; Fri, 16 Oct 2026 19:06:48 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a145ae0f160008425@swg.vates.tech>)
 id 6ad2598e-2eae-0a2a0a5409dd-0a2a450bb738-30
 for <xen-devel@lists.xenproject.org>; Fri, 16 Oct 2026 19:06:48 +0200
Received: from [185.255.28.35] (helo=prod-mta-13-02.swg-srv.net)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a145ae0f160008425@swg.vates.tech>)
 id 6ad259a8-b7e8-0a2a450b0019-b9ff1c239dbf-3
 for <xen-devel@lists.xenproject.org>; Fri, 16 Oct 2026 19:06:48 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a145ae0f160008425.004 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 16 Oct 2026 17:06:37 +0000
Received: from bazzite.gpn.vates.fr (88-188-240-210.subs.proxad.net
 [88.188.240.210]) (Authenticated sender: teddy.astie)
 by mail2.vates.fr (Postfix) with ESMTPSA id D40FC829FC;
 Fri, 16 Oct 2026 19:06:36 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=VGNPS3w2CNQZ7QQsLrPRVGZhQap8j+LcTS6Svo8f2oI=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=dFcJb/imoYkXw8b8n0p6xbJHqzACkLg8FUUZnqGbyuugvrCQYsl/+XwEts/QQXEnPEVTViPm7
 b9CrS5xbBzDmls8VhHvpeFQVQykodlNsV/4PmHh2Slm7rhLNxbKo20PznCm+AYCjNYMTykWMRaI
 bhe6MPYHnvsr0ath5/MhgA0TICYPninKY+rOBIP7lDBADpjqytNEr6+U8q5IXM8GScrAVO+AAO7
 zVJsbQN9RiGlHCjloOOKq8Fl//8RFo1yPfOWS7+X4X+vwDMzrVuzLG7IW9sgRSm20uml21qEZJe
 oPut8Lur+nFXqcddbbp7g16WlUNqohI5y8CBHuNDfkHA==
X-Zone-Loop: 8d753c50b40e7a6791a7ba262acded51e21adc6eab8e
x-campaign-type: default
x-transaction-id: 65d4361b-6b20-4bf4-b702-2edbe38e2ea0
x-swg-uid: 01-2f82f688-109f-467f-8bd4-a35c553e2c58
X-Mailer: Sweego
Message-ID:
 <1792170397.8631fc262581453bbf619ec5b2062170.1a145ae0f160008425@vates.tech>
x-swg-bid: 1792170397.8631fc262581453bbf619ec5b2062170.1a145ae0f160008425
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
	x86@kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 6/8] x86/xen/time: Mark xen_setup_vsyscall_time_info() __init
Date: Fri, 16 Oct 2026 19:06:11 +0200
In-Reply-To: <20261016170613.173406-2-teddy.astie@vates.tech>
References: <1792170295.8631fc262581453bbf619ec5b2062170.1a145ac82530008425@vates.tech>
 <20261016170613.173406-2-teddy.astie@vates.tech>
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.2fb.506bd15dabbebbe5.1a145ae0d6a.a5ca2bfd03d18e1b=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1792170397034
X-purgate-ID: tlsNG-42698a/1792170408-1B2DC9EA-638EF5FA/0/0
X-purgate-type: clean
X-purgate-size: 1350

---=Part.2fb.506bd15dabbebbe5.1a145ae0d6a.a5ca2bfd03d18e1b=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

This function is only called by xen_time_init() being itself __init=2E

Signed-off-by: Teddy Astie <teddy=2Eastie@vates=2Etech>
---
CC: Juergen Gross <jgross@suse=2Ecom>
CC: Boris Ostrovsky <boris=2Eostrovsky@oracle=2Ecom>
CC: Stefano Stabellini <sstabellini@kernel=2Eorg>
CC: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam=2Ecom>
CC: x86@kernel=2Eorg
CC: linux-kernel@vger=2Ekernel=2Eorg

 arch/x86/xen/time=2Ec | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/xen/time=2Ec b/arch/x86/xen/time=2Ec
index 87b890691fcb=2E=2E0d8643cc8159 100644
--- a/arch/x86/xen/time=2Ec
+++ b/arch/x86/xen/time=2Ec
@@ -442,7 +442,7 @@ void xen_restore_time_memory_area(void)
 	xen_sched_clock_offset =3D xen_clocksource_read() - xen_clock_value_save=
d;
 }
=20
-static void xen_setup_vsyscall_time_info(void)
+static void __init xen_setup_vsyscall_time_info(void)
 {
 	struct vcpu_register_time_memory_area t;
 	struct pvclock_vsyscall_time_info *ti;
--=20
2=2E56=2E0



-- 
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates s=
olutions

web: https://vates=2Etech
---=Part.2fb.506bd15dabbebbe5.1a145ae0d6a.a5ca2bfd03d18e1b=---

