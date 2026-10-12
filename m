Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D7CACA9ED1
	for <xen-devel@archiver.kernel.org>; Mon, 12 Oct 2026 11:38:43 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1446184.1662251 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGEMO-0004dE-Dh; Mon, 12 Oct 2026 11:38:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1446184.1662251; Mon, 12 Oct 2026 11:38:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGEMO-0004d7-AY; Mon, 12 Oct 2026 11:38:28 +0000
Received: by outflank-mailman (input) for mailman id 1446184;
 Mon, 12 Oct 2026 11:38:27 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a12fe8173a00080d7@swg.vates.tech>)
 id 1xGEMN-0004d1-5l
 for xen-devel@lists.xenproject.org; Mon, 12 Oct 2026 11:38:27 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xGEML-005JPW-QW
 for xen-devel@lists.xenproject.org; Mon, 12 Oct 2026 13:38:25 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a12fe8173a00080d7@swg.vates.tech>)
 id 6accc6a8-bab6-0a2a0a5309dd-0a2a450689c8-18
 for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2026 13:38:25 +0200
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a12fe8173a00080d7@swg.vates.tech>)
 id 6accc6b1-195a-0a2a45060019-b9ff1c22834f-3
 for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2026 13:38:25 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a12fe8173a00080d7.00a for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 12 Oct 2026 11:38:21 +0000
Received: from l14 (areims-651-1-80-194.w90-18.abo.wanadoo.fr [90.18.187.194])
 (Authenticated sender: anthony.perard)
 by mail2.vates.fr (Postfix) with ESMTPSA id DE4C1829C7;
 Mon, 12 Oct 2026 13:38:20 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=E9zvfalTtocdmAjo75hbNWert3671awRKZGIvSICSpE=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=btSvE9F/Rjfv8cfbBkJXFZEJDnN49aYPBnWrxMYLUnLiySUEJM4v3Q40INOXbvxIfsRmLEPSV
 CnsvT7jekND3iGyCTlinIGFc7Y2RlCKrSea6YZvDND3piuNg91xSAtI1MVKnjqzRwoH88RIQDxx
 9wagjg44G+ThSbZ5PTohs7HhESjVocFGMcQlONNdYVOI/JN5QB6Tsail+sJ0SECk1sysjMUg8wL
 RUBXt01nfZaPeLem+igk7cUxe4O6AYp18f8EHD6TbxE+1uC06Ub842Q+Ymq7djLHicH+R0fbmTV
 YMUunGcj/y3eocjZtsTVTINSYbrFuXgwL7fBPF51BU3Q==
X-Zone-Loop: e6d1793f97f050213a5a50a9e6bb93970d8088774053
x-campaign-type: default
x-transaction-id: b900d876-348c-493c-9859-476cc40a7ac8
x-swg-uid: 01-d90a14ac-3275-499f-bfde-d2fe8069a942
X-Mailer: Sweego
Message-ID:
 <1791805101.8631fc262581453bbf619ec5b2062170.1a12fe8173a00080d7@vates.tech>
x-swg-bid: 1791805101.8631fc262581453bbf619ec5b2062170.1a12fe8173a00080d7
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Mon, 12 Oct 2026 13:38:20 +0200
From: Anthony PERARD <anthony.perard@vates.tech>
To: Julian Vetter <julian.vetter@vates.tech>
Cc: xen-devel@lists.xenproject.org,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Community Manager <community.manager@xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger@xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Juergen Gross <jgross@suse.com>,
	Andrii Sultanov <andriy.sultanov@vates.tech>,
	Guillaume Thouvenin <guillaume.thouvenin@vates.tech>,
	Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?= <marmarek@invisiblethingslab.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Oleksii Moisieiev <oleksii_moisieiev@epam.com>,
	Timothy Pearson <tpearson@raptorengineering.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH v6 2/5] tools/arm: choose GIC version explicitly instead
 of relying on GIC_NATIVE
References: <1790597845.8631fc262581453bbf619ec5b2062170.1a0e7f2cff3000b504@vates.tech>
 <1790598009.8631fc262581453bbf619ec5b2062170.1a0e7f553fe000b504@vates.tech>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1790598009.8631fc262581453bbf619ec5b2062170.1a0e7f553fe000b504@vates.tech>
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.e9.460c04e3df4212e.1a12fe81499.104641da1cee49dd=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1791805101215
X-purgate-ID: tlsNG-16d1c6/1791805105-F70C777B-A14FDCBB/0/0
X-purgate-type: clean
X-purgate-size: 2562

---=Part.e9.460c04e3df4212e.1a12fe81499.104641da1cee49dd=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 28, 2026 at 02:19:58PM +0200, Julian Vetter wrote:
> XEN_DOMCTL_CONFIG_GIC_NATIVE lets the toolstack ask Xen to silently
> resolve the domain's GIC version to whatever the host hardware has=2E Xe=
n
> then writes the resolved value back into the same in/out
> xen_arch_domainconfig the toolstack used as input, which is the kind of
> API abuse we're trying to get rid of=2E The struct passed to createdomai=
n
> should only be an input parameter=2E
>=20
> Move the "pick the best available GIC version" decision to the
> toolstack, using the XEN_SYSCTL_PHYSCAP_ARM_GIC_V2/V3 capability bits
> already exposed via XEN_SYSCTL_physinfo:
>=20
>  * libxl__arch_domain_build_info_setdefault() resolves the GIC version
>    against those bits before the config is built=2E An unspecified versi=
on
>    becomes v3 if available, else v2, else fails=2E An explicitly request=
ed
>    v2/v3 is validated against the same bits, so a version the host
>    cannot provide is directly rejected in the toolstack=2E
>  * The Python xc=2Edomain_create() binding does the same via a call to
>    xc_physinfo()=2E
>  * libxl__arch_domain_prepare_config() therefore only ever sees a
>    concrete v2/v3 request and just validates it=2E The GIC_NATIVE case i=
s
>    dropped since setdefault() always resolves it first=2E
>=20
> LIBXL_GIC_VERSION_DEFAULT keeps its name and value: xl=2Ecfg still accep=
ts
> "default" as the C<gic_version> keyword, and setdefault() resolves it to
> a concrete v2/v3 before anything else can observe it=2E
>=20
> This guarantees no toolstack path can still produce
> XEN_DOMCTL_CONFIG_GIC_NATIVE, in preparation for removing it from the
> Xen side and from the ABI entirely=2E
>=20
> Signed-off-by: Julian Vetter <julian=2Evetter@vates=2Etech>
> Acked-by: Michal Orzel <michal=2Eorzel@amd=2Ecom>
> ---
> Changes in v6:
> - Drop the xl=2Ecfg(5) mention of XEN_SYSCTL_physinfo
> - Brace every branch of the has_v3/has_v2 if/else, not just the else
> - Keep LIBXL_GIC_VERSION_DEFAULT, to not break gic_version=3D"default"
> - Move has_v3/has_v2 declarations to the top
> - Added Acked-by

Acked-by: Anthony PERARD <anthony=2Eperard@vates=2Etech>

Thanks,


-- 
Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vate=
s solutions

web: https://vates=2Etech
---=Part.e9.460c04e3df4212e.1a12fe81499.104641da1cee49dd=---

