Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FFB7C982ED
	for <xen-devel@archiver.kernel.org>; Mon, 21 Sep 2026 13:10:37 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1427488.1650197 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8dmt-0000sK-Ic; Mon, 21 Sep 2026 13:10:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1427488.1650197; Mon, 21 Sep 2026 13:10:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8dmt-0000sD-FL; Mon, 21 Sep 2026 13:10:27 +0000
Received: by outflank-mailman (input) for mailman id 1427488;
 Mon, 21 Sep 2026 13:10:26 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0c416b9f500072c4@swg.vates.tech>)
 id 1x8dms-0000s7-QC
 for xen-devel@lists.xenproject.org; Mon, 21 Sep 2026 13:10:26 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x8dms-004c6H-6y
 for xen-devel@lists.xenproject.org; Mon, 21 Sep 2026 15:10:26 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0c416b9f500072c4@swg.vates.tech>)
 id 6ab12cb7-2eae-0a2a0a5409dd-0a2a45089868-34
 for <xen-devel@lists.xenproject.org>; Mon, 21 Sep 2026 15:10:26 +0200
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0c416b9f500072c4@swg.vates.tech>)
 id 6ab12cc1-f659-0a2a45080019-b9ff1c12a51d-3
 for <xen-devel@lists.xenproject.org>; Mon, 21 Sep 2026 15:10:26 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a0c416b9f500072c4.00a for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 21 Sep 2026 13:10:18 +0000
Received: from l14 (areims-651-1-80-194.w90-18.abo.wanadoo.fr [90.18.187.194])
 (Authenticated sender: anthony.perard)
 by mail2.vates.fr (Postfix) with ESMTPSA id 0A2438236E;
 Mon, 21 Sep 2026 15:10:18 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=nCqC2331MjRiCMTlXk/sFtiMnaqgnV+5UhfQCvL7aHA=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=fACMaIIOa3n+ji3So+dsMM7/RTxo9JbT40jmT83mOQjk6yP5I3rfCuG2Ws0DktdpiSbWd6QMY
 /EYGlBSRsN6/KyTgK18gyU0STRY5kd8QcT5tg8FUAHmuBBwxWX4I8CgxfJ36IAXVrzY1634wSW1
 vQP3Zc01l/cGko9jcG+34ZVl9tkvG91tMZFLzbhJ00q9jGCQew48yIC+9qThnAb7QMhdw12ospt
 0woeeDfl1ZjvUWCNokQo0Tln4Mh7aizZqSJk8et+heO4FcwSLMakaclXRyLF7LiiNDb8389A2I9
 e4AYBbo/X4QgknSXWk+i3e0NlaskUhzY+/EDG4cYljbg==
X-Zone-Loop: 88dfb9f25510bcbd8d3d0b6b46200586a6e8033c28c1
x-campaign-type: default
x-transaction-id: 90b432ab-18b7-4701-8231-689efd1e4384
x-swg-uid: 01-a6e60efc-8944-4964-9402-3665669f10c0
X-Mailer: Sweego
Message-ID:
 <1789996218.8631fc262581453bbf619ec5b2062170.1a0c416b9f500072c4@vates.tech>
x-swg-bid: 1789996218.8631fc262581453bbf619ec5b2062170.1a0c416b9f500072c4
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Mon, 21 Sep 2026 15:10:17 +0200
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
Subject: Re: [PATCH v5 3/6] tools/arm: choose GIC version explicitly instead
 of relying on GIC_NATIVE
References: <1789130592.8631fc262581453bbf619ec5b2062170.1a0907e5286000c4f3@vates.tech>
 <1789130863.8631fc262581453bbf619ec5b2062170.1a090827272000c4f3@vates.tech>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1789130863.8631fc262581453bbf619ec5b2062170.1a090827272000c4f3@vates.tech>
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.2aa.ba8194a23281630a.1a0c416b7e2.953cc8d2724fa953=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1789996218338
X-purgate-ID: tlsNG-c1860d/1789996226-CE94287B-B3A48B91/0/0
X-purgate-type: clean
X-purgate-size: 3349

---=Part.2aa.ba8194a23281630a.1a0c416b7e2.953cc8d2724fa953=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 11, 2026 at 02:47:33PM +0200, Julian Vetter wrote:
> diff --git a/docs/man/xl=2Ecfg=2E5=2Epod=2Ein b/docs/man/xl=2Ecfg=2E5=2E=
pod=2Ein
> index d34951edb9=2E=2E6a5e75eeab 100644
> --- a/docs/man/xl=2Ecfg=2E5=2Epod=2Ein
> +++ b/docs/man/xl=2Ecfg=2E5=2Epod=2Ein
> @@ -3081,15 +3081,16 @@ Emulate a GICv2
>  Emulate a GICv3=2E Note that the emulated GIC does not support the
>  GICv2 compatibility mode=2E
> =20
> -=3Ditem B<default>
> +=3Ditem B<none>
> =20
> -Emulate the same version as the native GIC hardware used by the host wh=
ere
> -the domain was created=2E
> +Let the toolstack choose the GIC version: GICv3 if the host supports it=
,
> +otherwise GICv2=2E This is the default when C<gic_version> is not speci=
fied=2E
> =20
>  =3Dback
> =20
>  This requires hardware compatibility with the requested version, either
> -natively or via hardware backwards compatibility support=2E
> +natively or via hardware backwards compatibility support=2E The GIC ver=
sions
> +the host can emulate for a guest are reported via C<XEN_SYSCTL_physinfo=
>=2E

I'm sorry, but I don't think this information is useful in a man page of
a CLI=2E As a user of `xl`, I have no idea what XEN_SYSCTL_physinfo
mean=2E=2E=2E or how to call it=2E

> diff --git a/tools/include/xen-tools/arm-arch-capabilities=2Eh b/tools/i=
nclude/xen-tools/arm-arch-capabilities=2Eh
> index 4aa4c6c34a=2E=2E21e3c73bd1 100644
> diff --git a/tools/libs/light/libxl_arm=2Ec b/tools/libs/light/libxl_arm=
=2Ec
> index 7e9f8a1bc3=2E=2E283cfb749b 100644
> --- a/tools/libs/light/libxl_arm=2Ec
> +++ b/tools/libs/light/libxl_arm=2Ec
> @@ -1800,6 +1797,48 @@ int libxl__arch_domain_build_info_setdefault(libx=
l__gc *gc,
>      /* Trapping of unmapped accesses enabled by default=2E  */
>      libxl_defbool_setdefault(&b_info->trap_unmapped_accesses, true);
> =20
> +    /*
> +     * Resolve the GIC version against the host capabilities reported b=
y
> +     * XEN_SYSCTL_physinfo=2E If the user didn't request a specific ver=
sion, pick
> +     * the best one available=2E Otherwise validate the requested versi=
on here,
> +     * so a bad request fails early instead of in the hypervisor=2E
> +     */
> +    {
> +        bool has_v3 =3D arch_capabilities_arm_gic_v3(physinfo->arch_cap=
abilities);
> +        bool has_v2 =3D arch_capabilities_arm_gic_v2(physinfo->arch_cap=
abilities);
> +
> +        switch (b_info->arch_arm=2Egic_version) {
> +        case LIBXL_GIC_VERSION_NONE:
> +            if (has_v3)
> +                b_info->arch_arm=2Egic_version =3D LIBXL_GIC_VERSION_V3=
;
> +            else if (has_v2)
> +                b_info->arch_arm=2Egic_version =3D LIBXL_GIC_VERSION_V2=
;
> +            else {
> +                LOG(ERROR, "No supported GIC version found on this host=
");
> +                return ERROR_FAIL;
> +            }

As you use a block for the else case, could you use a block for every
branch of the if ?

Thanks,


-- 
Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vate=
s solutions

web: https://vates=2Etech
---=Part.2aa.ba8194a23281630a.1a0c416b7e2.953cc8d2724fa953=---

