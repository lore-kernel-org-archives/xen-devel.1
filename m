Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D27FCD37B6
	for <xen-devel@archiver.kernel.org>; Wed, 13 May 2026 08:33:53 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1307680.1579260 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wN521-0005B2-2H; Wed, 13 May 2026 08:33:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1307680.1579260; Wed, 13 May 2026 08:33:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wN520-0005Av-Vm; Wed, 13 May 2026 08:33:28 +0000
Received: by outflank-mailman (input) for mailman id 1307680;
 Wed, 13 May 2026 08:33:27 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19e2078180c000f373@swg.vates.tech>)
 id 1wN51y-0005Ap-Sq
 for xen-devel@lists.xenproject.org; Wed, 13 May 2026 08:33:27 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wN51y-003qST-4A
 for xen-devel@lists.xenproject.org; Wed, 13 May 2026 10:33:26 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19e2078180c000f373@swg.vates.tech>)
 id 6a04374c-bab6-0a2a0a5309dd-0a2a4502c56c-28
 for <xen-devel@lists.xenproject.org>; Wed, 13 May 2026 10:33:25 +0200
Received: from [185.255.28.34] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19e2078180c000f373@swg.vates.tech>)
 id 6a043755-af86-0a2a45020019-b9ff1c228a39-3
 for <xen-devel@lists.xenproject.org>; Wed, 13 May 2026 10:33:25 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19e2078180c000f373.004 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 13 May 2026 08:33:21 +0000
Received: from l14 (lfbn-lyo-1-414-55.w2-7.abo.wanadoo.fr [2.7.24.55])
 (Authenticated sender: anthony.perard)
 by mail2.vates.fr (Postfix) with ESMTPSA id 44B2A863FD;
 Wed, 13 May 2026 10:33:21 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=BLxOg0+mLn9yXHhy3MEH1LEgqG3zIrha9S3RgANZTNQ=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=JMZuLxcFC+hrJ3fLrIi7vtRwhwf2yH+FuanFvWyzDCLAHth8oPYaUZWbInITpMEouy7ckU7+9
 dod4+Y72/epdPSa707lqktmaiyXCJk++GrRU5b/97wyLVAU+Ye+D+1oLQpVXeG1jbzTvZQALWtn
 qB0vSbtAcRb8XYyB/GPpWjRnie03rhkWXb+3yCOcQXjqPh1JRyRhWYXjJou1Kvu06w0Uydaa7oJ
 xO3zvU9bP2SJU7wDeihBWMep+rqvRHoQ6zwS1X/VprIKRakEQtiJm0TAk5MS9r4B++rZC613AIp
 xtziG8lFD/W7GyqGxHlXvQugF96hLHfW5ebntIY+OiUw==
X-Zone-Loop: 14610ecd834d6021d94370fe1ca0bdc6c2e4b727ad3b
x-campaign-type: default
x-transaction-id: 95a45314-1519-47a4-9f5f-47747ee4a867
x-swg-uid: 01-466186c3-7371-4b44-9ac4-6e7b00dce5cd
X-Mailer: Sweego
Message-ID:
 <1778661201.8631fc262581453bbf619ec5b2062170.19e2078180c000f373@vates.tech>
x-swg-bid: 1778661201.8631fc262581453bbf619ec5b2062170.19e2078180c000f373
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Wed, 13 May 2026 10:33:20 +0200
From: Anthony PERARD <anthony.perard@vates.tech>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Juergen Gross <jgross@suse.com>,
	Michael Young <m.a.young@durham.ac.uk>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] tools/libxl: Fix libxl_nocpuid.c build with json-c
References: <20260508162815.1617203-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260508162815.1617203-1-andrew.cooper3@citrix.com>
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.aff.f9d4c5bc86c0d911.19e207815ec.18ede270610a7821=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1778661201388
X-purgate-ID: tlsNG-720697/1778661205-83961161-BF4918F7/0/0
X-purgate-type: clean
X-purgate-size: 1157

---=Part.aff.f9d4c5bc86c0d911.19e207815ec.18ede270610a7821=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Fri, May 08, 2026 at 05:28:15PM +0100, Andrew Cooper wrote:
> libxl_nocpuid=2Ec needs the same treatment as libxl_cpuid=2Ec
>=20
> Fixes: f6c6f2679d49 ("libxl: Convert libxl__object_to_json() to json-c")
> Signed-off-by: Andrew Cooper <andrew=2Ecooper3@citrix=2Ecom>
> ---
>=20
> Discovered while trying to complete the ARM CI cleanup=2E
>=20
> This supercedes
> https://lore=2Ekernel=2Eorg/xen-devel/94ffdeb1-6826-4c3a-a9c1-3ccc8b129a=
61@durham=2Eac=2Euk/T/#u
> using Anthony's suggested approach=2E
>=20
> Failed run:
>   https://gitlab=2Ecom/xen-project/hardware/xen-staging/-/jobs/142822797=
51
>=20
> Succeeding run (same container):
>   https://gitlab=2Ecom/xen-project/hardware/xen-staging/-/jobs/142827145=
27

Reviewed-by: Anthony PERARD <anthony=2Eperard@vates=2Etech>

Thanks,


-- 
Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vate=
s solutions

web: https://vates=2Etech
---=Part.aff.f9d4c5bc86c0d911.19e207815ec.18ede270610a7821=---

