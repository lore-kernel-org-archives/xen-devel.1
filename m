Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE0FDC54FDF
	for <xen-devel@archiver.kernel.org>; Thu, 30 Jul 2026 08:43:28 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1377313.1623421 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wpMMH-0005v4-62; Thu, 30 Jul 2026 08:43:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1377313.1623421; Thu, 30 Jul 2026 08:43:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wpMMH-0005ux-2m; Thu, 30 Jul 2026 08:43:17 +0000
Received: by outflank-mailman (input) for mailman id 1377313;
 Thu, 30 Jul 2026 08:43:16 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wpMMF-0005ur-FN
 for xen-devel@lists.xenproject.org; Thu, 30 Jul 2026 08:43:16 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wpMME-005Fz3-4S
 for xen-devel@lists.xenproject.org; Thu, 30 Jul 2026 10:43:14 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19fb2311930000e099@swg.vates.tech>)
 id 6a6b0ea1-bab6-0a2a0a5309dd-0a2a4507d344-2
 for <xen-devel@lists.xenproject.org>; Thu, 30 Jul 2026 10:43:13 +0200
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19fb2311930000e099@swg.vates.tech>)
 id 6a6b0ea0-b4ea-0a2a45070019-b9ff1c12b4a1-3
 for <xen-devel@lists.xenproject.org>; Thu, 30 Jul 2026 10:43:13 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19fb2311930000e099.003 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 30 Jul 2026 08:43:10 +0000
Received: from [192.168.0.38]
 (ipservice-092-208-102-202.092.208.pools.vodafone-ip.de [92.208.102.202])
 (Authenticated sender: julian.vetter)
 by mail2.vates.fr (Postfix) with ESMTPSA id B349580DCE;
 Thu, 30 Jul 2026 10:43:08 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=76uFIIQsN0BXvQ/+0uCUREFFiEZPLC4foQuubccsf4c=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=k2Kn57LByvu0f68JENfueGdRlzg+eBMu/DewKHqnNk4k/BB6eY12++rvjSqNNVcVJfEgU+7zB
 6JOL7XtdpCEEET0ZrTY918Yqq1k8v0dcNv7YZtKiu/Z+tIkc4gVOyNz9Qitgq6XfGgiYehKW3Rl
 SkMyiAEBmuWjDIExYwlcOmdSvVhR7vPnZtrLL3ehDFh95Gwe2K734TUbEessipZyuZ913TIKmm6
 vLUkSeUBqreU+p7F8NY97GksKkofZj26xHixKED9/aSgHHh/O9n/hkdRTXS3arNDtDfPvRLwW1x
 fUpQ9uMjFqITIaokOTMejw8D6+5Jgx396tz/FDfepgFw==
X-Zone-Loop: 4adcf48b18d7bab2b01e59bcb33f4e7ab7838d822f83
x-campaign-type: default
x-transaction-id: a832d35b-7fdf-4d26-9ca8-b369dca35b0f
x-swg-uid: 01-75867dce-c9bf-4f73-aace-221620361fb9
X-Mailer: Sweego
Message-ID:
 <1785400990.8631fc262581453bbf619ec5b2062170.19fb2311930000e099@vates.tech>
x-swg-bid: 1785400990.8631fc262581453bbf619ec5b2062170.19fb2311930000e099
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Thu, 30 Jul 2026 10:43:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] tools/ocaml: Fill arch_config for ARM in
 domain_getinfo{,list}()
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrii Sultanov <andriy.sultanov@vates.tech>,
 Guillaume Thouvenin <guillaume.thouvenin@vates.tech>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <20260728154830.67734-1-andrew.cooper3@citrix.com>
 <20260728154830.67734-3-andrew.cooper3@citrix.com>
Content-Language: en-US
From: Julian Vetter <julian.vetter@vates.tech>
In-Reply-To: <20260728154830.67734-3-andrew.cooper3@citrix.com>
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.1712.cbb2ec61aafbc5a5.19fb23114e8.a6439b7f2d9a4174=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1785400988904
X-purgate-ID: tlsNG-ef75cf/1785400993-3C212AE4-A195272F/10/73395122804
X-purgate-type: spam
X-purgate-size: 2499

---=Part.1712.cbb2ec61aafbc5a5.19fb23114e8.a6439b7f2d9a4174=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



On 7/28/26 17:48, Andrew Cooper wrote:
> From: Julian Vetter <julian=2Evetter@vates=2Etech>
>=20
> Add the missing ARM logic, populating xen_arm_arch_domainconfig
> from the raw xc_domaininfo_t the same way the x86 branch does for
> xen_x86_arch_domainconfig=2E
>=20
> Signed-off-by: Julian Vetter <julian=2Evetter@vates=2Etech>
> Signed-off-by: Andrew Cooper <andrew=2Ecooper3@citrix=2Ecom>
> ---
> CC: Andrew Cooper <andrew=2Ecooper3@citrix=2Ecom>
> CC: Andrii Sultanov <andriy=2Esultanov@vates=2Etech>
> CC: Guillaume Thouvenin <guillaume=2Ethouvenin@vates=2Etech>
> CC: Julian Vetter <julian=2Evetter@vates=2Etech>
> CC: Oleksii Kurochko <oleksii=2Ekurochko@gmail=2Ecom>
> ---
>   tools/ocaml/libs/xc/xenctrl_stubs=2Ec | 16 ++++++++++++++--
>   1 file changed, 14 insertions(+), 2 deletions(-)
>=20
> diff --git a/tools/ocaml/libs/xc/xenctrl_stubs=2Ec b/tools/ocaml/libs/xc=
/xenctrl_stubs=2Ec
> index 441e1d83cfec=2E=2Efb983709066f 100644
> --- a/tools/ocaml/libs/xc/xenctrl_stubs=2Ec
> +++ b/tools/ocaml/libs/xc/xenctrl_stubs=2Ec
> @@ -444,9 +444,21 @@ static value alloc_domaininfo(xc_domaininfo_t * inf=
o)
>  =20
>   	Store_field(result, 15, tmp);
>  =20
> -#if defined(__i386__) || defined(__x86_64__)
> +#if defined(__arm__) || defined(__aarch64__)
>  =20
> -	tag =3D 1; /* tag x86 */
> +	tag =3D 0; /* tag ARM */
> +
> +        /* xen_arm_arch_domainconfig */
> +        arch_config =3D caml_alloc_tuple(3);
> +        Field(arch_config, 0) =3D Val_int(info->arch_config=2Egic_versi=
on);
> +        Field(arch_config, 1) =3D Val_int(info->arch_config=2Enr_spis);
> +
> +	tmp =3D caml_copy_int32(info->arch_config=2Eclock_frequency);
> +        Field(arch_config, 2) =3D tmp;

Shouldn't the Field() be a `Store_field(arch_config, 2, tmp);`, because=20
the `caml_copy_int32` makes an allocation on the minor heap to allow=20
OCAML's GC to keep track of this pointer if ever the arch_config is=20
promoted?

> +
> +#elif defined(__i386__) || defined(__x86_64__)
> +
> +        tag =3D 1; /* tag x86 */
>  =20
>   	/*
>   	 * emulation_flags: x86_arch_emulation_flags list;



-- 
Julian Vetter | Vates Hypervisor & Kernel Developer

XCP-ng & Xen Orch=
estra - Vates solutions

web: https://vates=2Etech
---=Part.1712.cbb2ec61aafbc5a5.19fb23114e8.a6439b7f2d9a4174=---

