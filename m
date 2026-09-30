Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91462CA5FC4
	for <xen-devel@archiver.kernel.org>; Wed, 30 Sep 2026 17:33:03 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1437774.1656741 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xByAT-00065H-Fk; Wed, 30 Sep 2026 17:32:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1437774.1656741; Wed, 30 Sep 2026 17:32:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xByAT-00065A-D8; Wed, 30 Sep 2026 17:32:33 +0000
Received: by outflank-mailman (input) for mailman id 1437774;
 Wed, 30 Sep 2026 17:32:31 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xakep.amatop@gmail.com>) id 1xByAR-00062j-Gp
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2026 17:32:31 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xByAQ-00Bp9k-7O
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2026 19:32:30 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6abd47a1-8faa-0a2a0a5109dd-0a2a450ab310-24
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 19:32:30 +0200
Received: from [74.125.230.98] (helo=mail-lr2-f34.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6abd47ad-f2d2-0a2a450a0019-4a7de6629f8e-3
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 19:32:30 +0200
Received: by mail-lr2-f34.google.com with SMTP id
 38308e7fff4ca-3a76cdef66fso17509941fa.0
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 10:32:29 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version"
ARC-Seal: i=1; a=rsa-sha256; t=1790789549; cv=none;
        d=google.com; s=arc-20260327;
        b=F8axNFfl8RODKXyJWAXKOdhHAtE3423cFZ9MYY5YAAYLnKx9ZiptBIZirxJ3vHpAPr
         0l0eUVPu5IaGHQ8b47oz+1hOzlTMRlneE4sor3xPMxzeeEP+AfPqq9R6k1hnCI6mb0tD
         bjGYWnIe4iFXOQf8pq5TSszE4c6f7bMrFoiQzgMx9MEDwYE/Ubqy/auuTB8v/zJoqSft
         NYXJmFIcidtZ1H0T6jgQwwju/ybfjE0k7da72NIhOsqonSys5tyFb4gpS6D1TxU544TD
         Jsa95JCWDyDbDu54Lh3blrF+tr3YsbgNMQpNsRjH+yH7MT2SuiQFbVV9pcyTFnhVEqWP
         VH/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pmBYNh3PS2m2gzLvQrL8S0YUAofKXv9LimmpW1HR1M8=;
        fh=Mq2lEHVOM/J/Dg3lqY0fDKPlajmc/jSeJ0FT5CSZSe8=;
        b=cazCGlhSlsnTgRth91QyHoIKnY0A5rL+YXI+s9pIY1/18oiQBQPX+whopfP1dP9BdM
         dF6weGlYv1SBtL+7+7hzegv8fwrERyRso+r3lvonvXBW23cWXiFEnQZYn3xOEn8+UMcw
         dy+BySeyhukPKjymfMvO6NlkGxn4SuoTl7ILVUsys6wS3MZJVS7Hga0cZz2pMfAg9idW
         NHHoWlLejH6ilDHEcuG84x5KuN8SAPqup2vZVFQptXBQ7ZGGGWZoarseQIVkSpAfqwwg
         rqFCz2od7Ew3Cmvg1cexM72fX4Wjf0JXfX2kiE5PocSY7SH7rkK8SOLra2GPu08l84b/
         mAVg==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790789549; x=1791394349; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pmBYNh3PS2m2gzLvQrL8S0YUAofKXv9LimmpW1HR1M8=;
        b=jJK6U/kvlV8TOBuW9uCZnyrBJCXNByC8LGA+5gCwmJxVgUdZvze1yI4e5cGEW7hbOW
         cK0f7M6rLt+55rM8Eavx2lx8GxDqMOrWaVm0WCcVWHR/H6QUtYwgEtlSKYCOAB1wSCfz
         NAB4GVA8P2JzRbZb/1Z1wVUa+U9KlZ6PbUWEYvZxLGQEe80nM0/CNLvKJr/LVrrickPc
         Y+BKBtUfmxsLXUUebUWY6xiyO79sGewfUV35Vr+eldxeKN990EPNwb4Tcn1fWQoSn7l3
         C9dTXItP+VBCF1UXc+Dn7q7+5BHBuqymkSjQNJFVF3ZJswW1XEr0X0eAf2O7b7iqEp1e
         /pxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790789549; x=1791394349;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pmBYNh3PS2m2gzLvQrL8S0YUAofKXv9LimmpW1HR1M8=;
        b=f7pjj8Qs2y0PjkzRWKslQlUSmF5Ts6PXqjvsRFuFWG6CS/U/dVF8m339sy5Gl9svsZ
         +mSq+joT6mc9VuiXjbXRJ/Nb81c4Rqn/cEdgPRXwLxut0eG3l4Nfa8YtD5LLWhucJzBK
         f5AbAPZ6LAL+IwNbORYCNG7HfQpMvL9e6q2ea2mQZNi5iXTwhYUjOcPIX4FvvGl6ef0u
         ZT+NKwfagvdJ2sKYCUXbd92q3A8RbyMHzzYmWqf4r0gXfSGC32Eo3wyJOz9zEra2aPmU
         hgaNK0NSrumYAzHMVR5PEdUzwP72E8LvY7jj3N2F6jCSRUKvYj0ib0CfB0XbvaxnISQF
         buPA==
X-Forwarded-Encrypted: i=1; AKwUvBw1xnMx7U6vg4cPT+9DwQ+hPksvHjkHFeZIm75DqtICdjgpYsYl61Uxc9ekOUM0okSvAjkcCMVr4n4=@lists.xenproject.org
X-Gm-Message-State: AFq9FYInHXzsrMthcQ8dgf108PnM3rHGaU6Bqs3DiFPOqc4rFGDKODpD
	RNjkEn8qxD85AL9yyPZ4rgbl2XivRT6jjFU+A4vWOaMWI1lFRXe1fyfevzqVZIBhgYicSGGbqee
	hOGXQ7yRTQrfygKjWi7DWd1BmhGXfYhQ=
X-Gm-Gg: AYBFou1L0Ycfr0Qeh9BxoU+0J2Vig6uIspIqr3aZWTlP8DvRzE82l4YS5hzzKXwB7gc
	IFdB4p9jXBVarr1vwPZ5zNHJ4P0D4F3dwqkoxmhL1mcUNU/6xDaUB9Lrpixx7hAg/Q4Ca6HWTuU
	8UGLvbrGxa/HZ/0qoNFsjBPg8/9QTO555gy0/uW7SmQYAzKWzCciNgj3Qs8vV6O3fex3to4KO+P
	eJ73LWNcYVZUWXH9MeT5zdp/g/i7cAkcyJCNkPU9Zh1WUSIZxuf0LqS6RHKq4KHhajoqGSJyAp3
	mOnp7eCFIkFokRc+KG+SKK3KS4YQ13vUkyok9WZ3jlar0iDv++ikAQku8novKpPB
X-Received: by 2002:a05:651c:4182:b0:3a5:e792:2dc7 with SMTP id
 38308e7fff4ca-3a77924076fmr5865881fa.15.1790789549173; Wed, 30 Sep 2026
 10:32:29 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1787838455.git.mykola_kvach@epam.com> <39722280b669cf6b914d7cc70fbda667c123e21d.1787838455.git.mykola_kvach@epam.com>
 <94B9CFD3-7B08-4CDD-A05B-86F9A6AF7744@arm.com>
In-Reply-To: <94B9CFD3-7B08-4CDD-A05B-86F9A6AF7744@arm.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Wed, 30 Sep 2026 20:32:17 +0300
X-Gm-Features: AclHuK9UuHHsMU6yuVw4nl2mxcGUnuxmoMqmxrf0gxThKxFMnHfntyd1iz9uvVg
Message-ID: <CAGeoDV8NXqmKpKV+Q7Cg5NL7zSyQho_sfm0PG8UEoynQH78==w@mail.gmail.com>
Subject: Re: [PATCH v12 11/13] xen/arm: Implement PSCI SYSTEM_SUSPEND call
 (host interface)
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Mykola Kvach <mykola_kvach@epam.com>, 
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
	Luca Fancellu <Luca.Fancellu@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-4011c0/1790789550-4BAD4CFC-A06411E9/0/0
X-purgate-type: clean
X-purgate-size: 4067

On Mon, Sep 28, 2026 at 7:19=E2=80=AFPM Bertrand Marquis
<Bertrand.Marquis@arm.com> wrote:
>
> Hi Mykola,
>
> > On 27 Aug 2026, at 16:31, Mykola Kvach <mykola_kvach@epam.com> wrote:
> >
> > From: Mirela Simonovic <mirela.simonovic@aggios.com>
> >
> > Invoke PSCI SYSTEM_SUSPEND to finalize Xen's suspend sequence on ARM64
> > platforms. Pass the Xen resume entry point (hyp_resume) to EL3 together
> > with a zero context ID, matching Linux.
> >
> > This patch wires up only the host-side PSCI SYSTEM_SUSPEND invocation.
> > The resume trampoline and context restore are provided by earlier patch=
es
> > in the series.
> >
> > Only enable this path when CONFIG_SYSTEM_SUSPEND is set and PSCI
> > advertises SYSTEM_SUSPEND via PSCI_FEATURES.
> >
> > Signed-off-by: Mirela Simonovic <mirela.simonovic@aggios.com>
> > Signed-off-by: Saeed Nowshadi <saeed.nowshadi@xilinx.com>
> > Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
> > Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> > Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
> > ---
> > Changes in v9:
> > - cache SYSTEM_SUSPEND support using PSCI_FEATURES and gate the host ca=
ll
> >  on the cached capability
> > - keep the cached SYSTEM_SUSPEND capability read-only after init
> > - log whether firmware reports SYSTEM_SUSPEND support
> > - pass an explicit zero context ID in the SYSTEM_SUSPEND call
> > - drop the stale note claiming hyp_resume is still a stub
> > ---
> > xen/arch/arm/include/asm/psci.h |  1 +
> > xen/arch/arm/psci.c             | 31 ++++++++++++++++++++++++++++++-
> > 2 files changed, 31 insertions(+), 1 deletion(-)
> >
> > diff --git a/xen/arch/arm/include/asm/psci.h b/xen/arch/arm/include/asm=
/psci.h
> > index 48a93e6b79..bb3c73496e 100644
> > --- a/xen/arch/arm/include/asm/psci.h
> > +++ b/xen/arch/arm/include/asm/psci.h
> > @@ -23,6 +23,7 @@ int call_psci_cpu_on(int cpu);
> > void call_psci_cpu_off(void);
> > void call_psci_system_off(void);
> > void call_psci_system_reset(void);
> > +int call_psci_system_suspend(void);
> >
> > /* Range of allocated PSCI function numbers */
> > #define PSCI_FNUM_MIN_VALUE                 _AC(0,U)
> > diff --git a/xen/arch/arm/psci.c b/xen/arch/arm/psci.c
> > index b6860a7760..e05dae1133 100644
> > --- a/xen/arch/arm/psci.c
> > +++ b/xen/arch/arm/psci.c
> > @@ -17,23 +17,27 @@
> > #include <asm/cpufeature.h>
> > #include <asm/psci.h>
> > #include <asm/acpi.h>
> > +#include <asm/suspend.h>
> >
> > /*
> >  * While a 64-bit OS can make calls with SMC32 calling conventions, for
> >  * some calls it is necessary to use SMC64 to pass or return 64-bit val=
ues.
> > - * For such calls PSCI_0_2_FN_NATIVE(x) will choose the appropriate
> > + * For such calls PSCI_*_FN_NATIVE(x) will choose the appropriate
> >  * (native-width) function ID.
> >  */
> > #ifdef CONFIG_ARM_64
> > #define PSCI_0_2_FN_NATIVE(name)    PSCI_0_2_FN64_##name
> > +#define PSCI_1_0_FN_NATIVE(name)    PSCI_1_0_FN64_##name
> > #else
> > #define PSCI_0_2_FN_NATIVE(name)    PSCI_0_2_FN32_##name
> > +#define PSCI_1_0_FN_NATIVE(name)    PSCI_1_0_FN32_##name
> > #endif
> >
> > uint32_t psci_ver;
> > uint32_t smccc_ver;
> >
> > static uint32_t psci_cpu_on_nr;
> > +static bool __ro_after_init has_psci_system_suspend;
> >
> > #define PSCI_RET(res)   ((int32_t)(res).a0)
> >
> > @@ -60,6 +64,25 @@ void call_psci_cpu_off(void)
> >     }
> > }
> >
> > +int call_psci_system_suspend(void)
> > +{
> > +#ifdef CONFIG_SYSTEM_SUSPEND
> > +    struct arm_smccc_res res;
> > +
> > +    if ( !has_psci_system_suspend )
> > +        return PSCI_NOT_SUPPORTED;
> > +
> > +    /* Context ID is unused for the Xen resume path. */
> > +    arm_smccc_smc(PSCI_1_0_FN_NATIVE(SYSTEM_SUSPEND), __pa(hyp_resume)=
, 0,
> > +                  &res);
>
> Since this series was sent, arm_smccc_smc() has been changed to return
> the result directly instead of writing it through a result pointer.
>
> You need to update this call.

Ack.

Best regards,
Mykola

