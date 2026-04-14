Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 236F5ED7B87
	for <xen-devel@archiver.kernel.org>; Tue, 14 Apr 2026 08:30:43 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1281465.1564352 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wCZAB-0003zL-KT; Tue, 14 Apr 2026 08:30:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1281465.1564352; Tue, 14 Apr 2026 08:30:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wCZAB-0003zE-HU; Tue, 14 Apr 2026 08:30:27 +0000
Received: by outflank-mailman (input) for mailman id 1281465;
 Tue, 14 Apr 2026 08:30:26 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <bounce-md_30504962.69ddfb1e.v1-13a796e5373942fc88336edd7b0df515@bounce.vates.tech>)
 id 1wCZA9-0003z6-TX
 for xen-devel@lists.xenproject.org; Tue, 14 Apr 2026 08:30:26 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wCZA6-005n09-UQ
 for xen-devel@lists.xenproject.org; Tue, 14 Apr 2026 10:30:24 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <bounce-md_30504962.69ddfb1e.v1-13a796e5373942fc88336edd7b0df515@bounce.vates.tech>)
 id 69ddfb19-bab6-0a2a0a5309dd-0a2a4507cf36-26
 for <xen-devel@lists.xenproject.org>; Tue, 14 Apr 2026 10:30:24 +0200
Received: from [198.2.187.1] (helo=mail187-1.suw11.mandrillapp.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from
 <bounce-md_30504962.69ddfb1e.v1-13a796e5373942fc88336edd7b0df515@bounce.vates.tech>)
 id 69ddfb1f-ba2d-0a2a45070019-c602bb018196-3
 for <xen-devel@lists.xenproject.org>; Tue, 14 Apr 2026 10:30:24 +0200
Received: from pmta09.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail187-1.suw11.mandrillapp.com (Mailchimp) with ESMTP id 4fvyC24mvBzBsXMYd
 for <xen-devel@lists.xenproject.org>; Tue, 14 Apr 2026 08:30:22 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 13a796e5373942fc88336edd7b0df515; Tue, 14 Apr 2026 08:30:22 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=mte1 header.d=mandrillapp.com header.i="@mandrillapp.com" header.h="From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:Date:MIME-Version:Content-Type:Content-Transfer-Encoding"; dkim=pass header.s=mte1 header.d=vates.tech header.i="teddy.astie@vates.tech" header.h="From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:Date:MIME-Version:Content-Type:Content-Transfer-Encoding"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1776155422; x=1776425422;
	bh=twDtVKfWbW1DxGQO9l+h7kZSrEa6BM5hE+mqdHaJ/zE=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=KaW88MzTW1vy5/Qf0DSDs59OcQiKPi3z3A+InpRA57sPzSSRmP5pAWjsGSUrNWGfH
	 nVZ7qrn3hsNsBvkEVZSBExnpZFfuKd89hszJ2hDciAeRfMK3lFut9SomR3A162alwF
	 ksLd4E3k0l3uwXyNtEnlhPp9c4V5WKmZeEvUCuNZH/fA8VJJn7PWio/DZXbaDw3l80
	 6RwBo1VcY2hI/uUSS6wd0V9w1b7Ngb9jfy/VEcNz1rMKFGPVWvSzRVy1d9p9A6yVTf
	 QoyE43VuJx41sN2uS3ZJ0ktOKXJF7wskFIXxgJLt64Lkxma4IRr18WnRaVsL45P8fu
	 XE4uwAW8h/q4Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1776155422; x=1776415922; i=teddy.astie@vates.tech;
	bh=twDtVKfWbW1DxGQO9l+h7kZSrEa6BM5hE+mqdHaJ/zE=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=hSWSgQbvGThdcMnF5iVnQ2BWc3+iWBOFNXpDVoYkBF+BXDMYOsnpbFrm3M0DjMGpi
	 RtVxKFSE4QiEg5DU2jeVlDxxcXXM5VhZAgRI3IySfLF2ezr1nKbf+YXRyut2F/+gbZ
	 L1xg63sbm0w9osjZBJRjGtuqBMI9WrPSMcJGjbUbp9l9d9zL/rFnTlOKsqFCKIyL1N
	 LYKSDg+eB0em+vkjv1JlcIzzreprTSCovey6/17/yOpNBnTnul2WOT9GCXR95uKpvG
	 /AzmZc0KPVFP/3OykCyD0Bif1y+wUgXwK9s/PSZ7Wpp/5Tu0aqVYYkWiyH5wjg3wRI
	 sVcshIcj/wquQ==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?Re:=20[RFC=20PATCH=20v3=201/3]=20xl:=20Add=20pci=20device=20hotplug=20option?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1776155421888
Message-Id: <4c058f15-7396-4c06-8886-b77c56dfb14f@vates.tech>
To: "Thierry Escande" <thierry.escande@vates.tech>, xen-devel@lists.xenproject.org
Cc: "Anthony PERARD" <anthony.perard@vates.tech>, "Juergen Gross" <jgross@suse.com>, "=?utf-8?Q?Daniel=20P=20.=20Berrang=C3=A9?=" <berrange@redhat.com>, "=?utf-8?Q?Marek=20Marczykowski-G=C3=B3recki?=" <marmarek@invisiblethingslab.com>
References: <20260410150333.1533568-1-thierry.escande@vates.tech> <20260410150333.1533568-2-thierry.escande@vates.tech>
In-Reply-To: <20260410150333.1533568-2-thierry.escande@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.13a796e5373942fc88336edd7b0df515?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260414:md
Date: Tue, 14 Apr 2026 08:30:22 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-ef75cf/1776155424-8BB4041E-2B272237/0/0
X-purgate-type: clean
X-purgate-size: 3257

Le 10/04/2026 =C3=A0 17:06, Thierry Escande a =C3=A9crit=C2=A0:
> This option is used to passthrough PCI devices using the Qemu command
> line (-device driver,...) instead of the QMP hot-plug mechanism.
> 
> This is needed for Q35 support since its PCI root bus doesn't support
> hotplugging.
> 
> If not specified, the default behavior is to use hotplug via QMP.
> 
> Signed-off-by: Thierry Escande <thierry.escande@vates.tech>
> ---
> v2: no change
> v3: no change
> ---
>   tools/libs/light/libxl_types.idl | 1 +
>   tools/libs/util/libxlu_pci.c     | 2 ++
>   tools/xl/xl_parse.c              | 5 +++++
>   3 files changed, 8 insertions(+)
> 
> diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_ty=
pes.idl
> index a7893460f0..aca0e93793 100644
> --- a/tools/libs/light/libxl_types.idl
> +++ b/tools/libs/light/libxl_types.idl
> @@ -922,6 +922,7 @@ libxl_device_pci =3D Struct("device_pci", [
>       ("seize", bool),
>       ("rdm_policy", libxl_rdm_reserve_policy),
>       ("name", string),
> +    ("hotplug", bool),
>       ])
>   
>   libxl_device_rdm =3D Struct("device_rdm", [
> diff --git a/tools/libs/util/libxlu_pci.c b/tools/libs/util/libxlu_pci.c
> index 294482c6d7..f6440c878b 100644
> --- a/tools/libs/util/libxlu_pci.c
> +++ b/tools/libs/util/libxlu_pci.c
> @@ -192,6 +192,8 @@ int xlu_pci_parse_spec_string(XLU_Config *cfg, libxl_=
device_pci *pci,
>               name_present =3D true;
>               pci->name =3D strdup(val);
>               if (!pci->name) ret =3D ERROR_NOMEM;
> +        } else if (!strcmp(key, "hotplug")) {
> +            pci->hotplug =3D atoi(val);
>           } else {
>               XLU__PCI_ERR(cfg, "Unknown PCI_SPEC_STRING option: %s", key=
);
>               ret =3D ERROR_INVAL;
> diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
> index 48c72dce9c..7ea2a76662 100644
> --- a/tools/xl/xl_parse.c
> +++ b/tools/xl/xl_parse.c
> @@ -1361,6 +1361,7 @@ void parse_config_data(const char *config_source,
>       int pci_msitranslate =3D 0;
>       int pci_permissive =3D 0;
>       int pci_seize =3D 0;
> +    int pci_hotplug =3D 1;
>       int i, e;
>       int num_llc_colors;
>       int num_xs_quota;
> @@ -1699,6 +1700,9 @@ void parse_config_data(const char *config_source,
>       if (!xlu_cfg_get_long (config, "pci_seize", &l, 0))
>           pci_seize =3D l;
>   
> +    if (!xlu_cfg_get_long (config, "pci_hotplug", &l, 0))
> +        pci_hotplug =3D l;
> +
>       if (!xlu_cfg_get_string(config, "rdm", &buf, 0)) {
>           libxl_rdm_reserve rdm;
>           if (!xlu_rdm_parse(config, &rdm, buf)) {
> @@ -1720,6 +1724,7 @@ void parse_config_data(const char *config_source,
>               pci->power_mgmt =3D pci_power_mgmt;
>               pci->permissive =3D pci_permissive;
>               pci->seize =3D pci_seize;
> +            pci->hotplug =3D pci_hotplug;
>               /*
>                * Like other pci option, the per-device policy always foll=
ows
>                * the global policy by default.

Reviewed-by: Teddy Astie <teddy.astie@vates.tech>


--
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



