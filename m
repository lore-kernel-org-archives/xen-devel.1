Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B465C982E6
	for <xen-devel@archiver.kernel.org>; Mon, 21 Sep 2026 14:16:53 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1427598.1650398 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8eow-0005kf-AA; Mon, 21 Sep 2026 14:16:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1427598.1650398; Mon, 21 Sep 2026 14:16:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8eow-0005kY-63; Mon, 21 Sep 2026 14:16:38 +0000
Received: by outflank-mailman (input) for mailman id 1427598;
 Mon, 21 Sep 2026 14:16:36 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0c4534c3a00072c4@swg.vates.tech>)
 id 1x8eou-0005kQ-Q3
 for xen-devel@lists.xenproject.org; Mon, 21 Sep 2026 14:16:36 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x8eou-00E8iT-2f
 for xen-devel@lists.xenproject.org; Mon, 21 Sep 2026 16:16:36 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0c4534c3a00072c4@swg.vates.tech>)
 id 6ab13c2c-e002-0a2a0a5209dd-0a2a4502e4f0-40
 for <xen-devel@lists.xenproject.org>; Mon, 21 Sep 2026 16:16:35 +0200
Received: from [185.255.28.35] (helo=prod-mta-13-02.swg-srv.net)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0c4534c3a00072c4@swg.vates.tech>)
 id 6ab13c43-6ca4-0a2a45020019-b9ff1c23989d-3
 for <xen-devel@lists.xenproject.org>; Mon, 21 Sep 2026 16:16:35 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a0c4534c3a00072c4.00a for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 21 Sep 2026 14:16:28 +0000
Received: from l14 (areims-651-1-80-194.w90-18.abo.wanadoo.fr [90.18.187.194])
 (Authenticated sender: anthony.perard)
 by mail2.vates.fr (Postfix) with ESMTPSA id 0388481CD9;
 Mon, 21 Sep 2026 16:16:27 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=pOGCXt6vkCQlwrtS3DnhULGdJQA42r2yTBWcqvBKXss=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=l3USAwaXsfEkrTMnZDawZpzX4yBTAEtUQdvpUboSqUepF1WOsK3AX3dDyI6sTzWNa4kZua8Ub
 RpIKBj8063B6t/RDV6wR52weSgnMnUyWk1coH/rheg0vsNE86fofZ4V/IbeSw1ef67KFjJcDDUw
 RbpJVpjHc6ko39G9enfpRFIk2BNCEjau7J8D1ieHxH3z5rJ5payeYsvnoF/fotmwv/H+EPm556R
 OBKQDxdK8Jpltk6OSUcg8gWHNgMJuWFV7feDvs8pGdahQYScwvTxOikHXrf63RVHvXS1POlvrXT
 /oibblNsXT3xbcmILldsJ3hIjBFcxDHKEgqeNuXJ0IXQ==
X-Zone-Loop: 3a9441f31822fecd954392836c5ef1b4d450c1300250
x-campaign-type: default
x-transaction-id: 06c5598e-38eb-4d58-8439-75c73379deef
x-swg-uid: 01-6f3484ae-ac9e-4747-bacf-3fbe651426a1
X-Mailer: Sweego
Message-ID:
 <1790000188.8631fc262581453bbf619ec5b2062170.1a0c4534c3a00072c4@vates.tech>
x-swg-bid: 1790000188.8631fc262581453bbf619ec5b2062170.1a0c4534c3a00072c4
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Mon, 21 Sep 2026 16:16:26 +0200
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
Subject: Re: [PATCH v5 5/6] xen/arm: report clock_frequency via sysctl
 physinfo, not createdomain
References: <1789130592.8631fc262581453bbf619ec5b2062170.1a0907e5286000c4f3@vates.tech>
 <1789130864.8631fc262581453bbf619ec5b2062170.1a0908275e9000c4f3@vates.tech>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1789130864.8631fc262581453bbf619ec5b2062170.1a0908275e9000c4f3@vates.tech>
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.2b3.72d97aefce43d207.1a0c4534933.334128e23dbc3fbb=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1790000187699
X-purgate-ID: tlsNG-720697/1790000195-F2AB52AC-8920BDEE/0/0
X-purgate-type: clean
X-purgate-size: 4214

---=Part.2b3.72d97aefce43d207.1a0c4534933.334128e23dbc3fbb=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 11, 2026 at 02:47:35PM +0200, Julian Vetter wrote:
> diff --git a/tools/libs/light/libxl=2Ec b/tools/libs/light/libxl=2Ec
> index a1fe16274d=2E=2Eec7e6d3f65 100644
> --- a/tools/libs/light/libxl=2Ec
> +++ b/tools/libs/light/libxl=2Ec
> @@ -410,6 +410,7 @@ int libxl_get_physinfo(libxl_ctx *ctx, libxl_physinf=
o *physinfo)
>      physinfo->cap_gnttab_v2 =3D
>          !!(xcphysinfo=2Ecapabilities & XEN_SYSCTL_PHYSCAP_gnttab_v2);
>      physinfo->arch_capabilities =3D xcphysinfo=2Earch_capabilities;
> +    physinfo->arch_clock_frequency_hz =3D xcphysinfo=2Earch_clock_frequ=
ency_hz;

That new field name doesn't really make sense=2E How a clock can be arch
specific? Which clock, I'm sure they can be many?
(also a comment about that new field in `libxl_physinfo` which is said
to be ARM only, which doesn't make sense because every CPU architectures
needs a clock, or many)=2E

Anyway, if the name is acceptable in the hypervisor public interfaces,
so be it=2E

> diff --git a/tools/libs/light/libxl_arm=2Ec b/tools/libs/light/libxl_arm=
=2Ec
> index 283cfb749b=2E=2E3d232040c9 100644
> --- a/tools/libs/light/libxl_arm=2Ec
> +++ b/tools/libs/light/libxl_arm=2Ec
> @@ -252,6 +252,9 @@ int libxl__arch_domain_save_config(libxl__gc *gc,
>                                     libxl__domain_build_state *state,
>                                     const struct xen_domctl_createdomain=
 *config)
>  {
> +    libxl_physinfo info;
> +    int rc;
> +
>      switch (config->arch=2Egic_version) {
>      case XEN_DOMCTL_CONFIG_GIC_V2:
>          d_config->b_info=2Earch_arm=2Egic_version =3D LIBXL_GIC_VERSION=
_V2;
> @@ -264,7 +267,23 @@ int libxl__arch_domain_save_config(libxl__gc *gc,
>          return ERROR_FAIL;
>      }
> =20
> -    state->clock_frequency =3D config->arch=2Eclock_frequency;
> +    libxl_physinfo_init(&info);
> +    rc =3D libxl_get_physinfo(CTX, &info);

Could you move both call to the beginning of the function? It might be
useful to more than just the new code=2E

> +    if (rc) {
> +        LOG(ERROR, "failed to get physinfo");
> +        libxl_physinfo_dispose(&info);

It would be better if there's only a single call of this function
throughout the function, and so only a single error path=2E

Could you an "out" label at the end a of function, and =2E=2E

> +        return ERROR_FAIL;

=2E=2E this and the `_dispose()` call can be replace by `goto out`;

No need to change the value of `rc`, it's already set by a libxl
function so it can be returned=2E

> +    }
> +    /*
> +     * Pass the timer frequency on to the guest DT only when Xen took i=
t from
> +     * the host DT (XEN_SYSCTL_PHYSCAP_ARM_TIMER_DT_FREQ)=2E Otherwise =
the guest
> +     * gets the right value from CNTFRQ_EL0=2E
> +     */
> +    if (arch_capabilities_arm_timer_dt_freq(info=2Earch_capabilities))
> +        state->clock_frequency =3D info=2Earch_clock_frequency_hz;
> +    else
> +        state->clock_frequency =3D 0;

Add here:

    rc =3D 0;
out:

> +    libxl_physinfo_dispose(&info);
> =20
>      return 0;

Then replace the return by `return rc`;

Then, replace every `return X` in the function by
    rc =3D X;
    goto out;

That error handling style is used in many places in libxl=2E

>  }
> diff --git a/tools/libs/light/libxl_types=2Eidl b/tools/libs/light/libxl=
_types=2Eidl
> index 8699ab3013=2E=2Ee2e4be7323 100644
> --- a/tools/libs/light/libxl_types=2Eidl
> +++ b/tools/libs/light/libxl_types=2Eidl
> @@ -1201,6 +1201,7 @@ libxl_physinfo =3D Struct("physinfo", [
>      ("cap_gnttab_v1", bool),
>      ("cap_gnttab_v2", bool),
>      ("arch_capabilities", uint32),
> +    ("arch_clock_frequency_hz", uint32), # ARM only
>      ], dir=3DDIR_OUT)
> =20
>  libxl_connectorinfo =3D Struct("connectorinfo", [

Thanks,


-- 
Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vate=
s solutions

web: https://vates=2Etech
---=Part.2b3.72d97aefce43d207.1a0c4534933.334128e23dbc3fbb=---

