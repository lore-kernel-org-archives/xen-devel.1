Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C71C4C624D3
	for <xen-devel@archiver.kernel.org>; Fri,  4 Sep 2026 23:21:23 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1409213.1641307 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x2dDK-0008I6-0s; Fri, 04 Sep 2026 23:20:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1409213.1641307; Fri, 04 Sep 2026 23:20:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x2dDJ-0008Hz-UT; Fri, 04 Sep 2026 23:20:53 +0000
Received: by outflank-mailman (input) for mailman id 1409213;
 Fri, 04 Sep 2026 23:20:52 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a06eb98619000c4f3@swg.vates.tech>)
 id 1x2dDH-0008Ht-O5
 for xen-devel@lists.xenproject.org; Fri, 04 Sep 2026 23:20:52 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x2dDG-007UC1-Vu
 for xen-devel@lists.xenproject.org; Sat, 05 Sep 2026 01:20:51 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a06eb98619000c4f3@swg.vates.tech>)
 id 6a9b51cb-e002-0a2a0a5209dd-0a2a4503c090-44
 for <xen-devel@lists.xenproject.org>; Sat, 05 Sep 2026 01:20:50 +0200
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a06eb98619000c4f3@swg.vates.tech>)
 id 6a9b5252-fae8-0a2a45030019-b9ff1c22a72f-3
 for <xen-devel@lists.xenproject.org>; Sat, 05 Sep 2026 01:20:50 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a06eb98619000c4f3.002 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 04 Sep 2026 23:20:47 +0000
Received: from [192.168.1.61] (155.223.66.37.rev.sfr.net [37.66.223.155])
 (Authenticated sender: ngoc-tu.dinh@vates.tech)
 by mail2.vates.fr (Postfix) with ESMTPSA id 985F68426A;
 Sat,  5 Sep 2026 01:20:46 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=qbNpbvLUJ2ieNtUxtsOHK5WJXuN6EDp80qnBb6l3Ros=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=V64neSLTdDsF9XPMsevH7vZL9CX/Raw4zIy6wO+JDUuZGOZwilwFHmfQcHqAjt1g3iVrjuUpk
 k7HBnbIjQ5SgTrUOrMv5pspAwSr51wfcn10sGswcqJwEMOXIeJa621yANUKvgASJDQifOTd19CF
 /W7QtZ4RvjfBEMMf1Yil68856DbNKlUox1FVLmVqSCqWhkhzLdgkplFWTfaWhYyth0EBvepc3e6
 m2X9I30yrWC/J3awsRa0HGbFYdZRPnwQTsxRr8Xaj3upnkW6zvg7s6bwGwDP9AEFb+JdgZt8J7j
 kTyft2Ia6kV2OXX+XLC0v6BsHG2Io9oVx95095LkzWwQ==
X-Zone-Loop: bf943b14c1399985b111dea518b645298f6da775ab29
x-campaign-type: default
x-transaction-id: 34e1525c-cc2e-408c-9574-e4d3f6a9e879
x-swg-uid: 01-f07115dd-bdcc-4019-8cdf-b056612b70bb
X-Mailer: Sweego
Message-ID:
 <1788564047.8631fc262581453bbf619ec5b2062170.1a06eb98619000c4f3@vates.tech>
x-swg-bid: 1788564047.8631fc262581453bbf619ec5b2062170.1a06eb98619000c4f3
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Sat, 5 Sep 2026 01:20:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] tools/libxl: Add support for Viridian stimer
 direct mode
To: Ross Lagerwall <ross.lagerwall@citrix.com>, xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Juergen Gross <jgross@suse.com>
References: <20260904141516.367862-1-ross.lagerwall@citrix.com>
 <20260904141516.367862-4-ross.lagerwall@citrix.com>
Content-Language: en-US
From: Tu Dinh <ngoc-tu.dinh@vates.tech>
In-Reply-To: <20260904141516.367862-4-ross.lagerwall@citrix.com>
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.36fc.b1f8d9cd55c526b5.1a06eb98368.5d61744e6f8e51be=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1788564046696
X-purgate-ID: tlsNG-33051d/1788564050-758824E9-240C9F5E/0/0
X-purgate-type: clean
X-purgate-size: 3548

---=Part.36fc.b1f8d9cd55c526b5.1a06eb98368.5d61744e6f8e51be=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 04/09/2026 16:17, Ross Lagerwall wrote:
> Add support to libxl for using the stimer enlightenments in direct mode=
=2E
>=20
> Signed-off-by: Ross Lagerwall <ross=2Elagerwall@citrix=2Ecom>
> ---
>=20
> New in v2, since the new Viridian flag was added=2E
>=20
>   docs/man/xl=2Ecfg=2E5=2Epod=2Ein         | 5 +++++
>   tools/include/libxl=2Eh            | 6 ++++++
>   tools/libs/light/libxl_types=2Eidl | 1 +
>   tools/libs/light/libxl_x86=2Ec     | 5 +++++
>   4 files changed, 17 insertions(+)
>=20
> diff --git a/docs/man/xl=2Ecfg=2E5=2Epod=2Ein b/docs/man/xl=2Ecfg=2E5=2E=
pod=2Ein
> index d34951edb98d=2E=2E784e926c9990 100644
> --- a/docs/man/xl=2Ecfg=2E5=2Epod=2Ein
> +++ b/docs/man/xl=2Ecfg=2E5=2Epod=2Ein
> @@ -2496,6 +2496,11 @@ ticks and hence enabling this group will ensure t=
hat ticks will be
>   consistent with use of an enlightened time source (B<time_ref_count> o=
r
>   B<reference_tsc>)=2E
>  =20
> +=3Ditem B<stimer>
> +
> +This set is the same as the B<stimer> set but additionally supports
> +using synthetic timers in direct mode=2E
> +

I think this should be stimer_direct=2E

>   =3Ditem B<hcall_ipi>
>  =20
>   This set incorporates use of a hypercall for interprocessor interrupts=
=2E
> diff --git a/tools/include/libxl=2Eh b/tools/include/libxl=2Eh
> index 7c098edab663=2E=2E5475530a5002 100644
> --- a/tools/include/libxl=2Eh
> +++ b/tools/include/libxl=2Eh
> @@ -381,6 +381,12 @@
>    */
>   #define LIBXL_HAVE_VIRIDIAN_HCALL_IPI 1
>  =20
> +/*
> + * LIBXL_HAVE_VIRIDIAN_STIMER_DIRECT indicates that the 'stimer_direct'=
 value
> + * is present in the viridian enlightenment enumeration=2E
> + */
> +#define LIBXL_HAVE_VIRIDIAN_STIMER_DIRECT 1
> +
>   /*
>    * LIBXL_HAVE_BUILDINFO_HVM_ACPI_LAPTOP_SLATE indicates that
>    * libxl_domain_build_info has the u=2Ehvm=2Eacpi_laptop_slate field=
=2E
> diff --git a/tools/libs/light/libxl_types=2Eidl b/tools/libs/light/libxl=
_types=2Eidl
> index a7893460f013=2E=2E95075f04fe45 100644
> --- a/tools/libs/light/libxl_types=2Eidl
> +++ b/tools/libs/light/libxl_types=2Eidl
> @@ -260,6 +260,7 @@ libxl_viridian_enlightenment =3D Enumeration("viridi=
an_enlightenment", [
>       (10, "ex_processor_masks"),
>       (11, "no_vp_limit"),
>       (12, "cpu_hotplug"),
> +    (13, "stimer_direct"),
>       ])
>  =20
>   libxl_hdtype =3D Enumeration("hdtype", [
> diff --git a/tools/libs/light/libxl_x86=2Ec b/tools/libs/light/libxl_x86=
=2Ec
> index 60d4e8661c93=2E=2E9e8b48372d63 100644
> --- a/tools/libs/light/libxl_x86=2Ec
> +++ b/tools/libs/light/libxl_x86=2Ec
> @@ -389,6 +389,11 @@ static int hvm_set_viridian_features(libxl__gc *gc,=
 uint32_t domid,
>       if (libxl_bitmap_test(&enlightenments, LIBXL_VIRIDIAN_ENLIGHTENMEN=
T_CPU_HOTPLUG))
>           mask |=3D HVMPV_cpu_hotplug;
>  =20
> +    if (libxl_bitmap_test(&enlightenments,
> +                          LIBXL_VIRIDIAN_ENLIGHTENMENT_STIMER_DIRECT))
> +        mask |=3D HVMPV_time_ref_count | HVMPV_synic | HVMPV_stimer |
> +                HVMPV_stimer_direct;
> +
>       if (mask !=3D 0 &&
>           xc_hvm_param_set(CTX->xch,
>                            domid,



-- 
Ngoc Tu Dinh | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates =
solutions

web: https://vates=2Etech
---=Part.36fc.b1f8d9cd55c526b5.1a06eb98368.5d61744e6f8e51be=---

