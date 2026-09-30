Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 730CACA5FC4
	for <xen-devel@archiver.kernel.org>; Wed, 30 Sep 2026 22:10:49 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1437919.1656851 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xC2VF-0000HO-Va; Wed, 30 Sep 2026 22:10:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1437919.1656851; Wed, 30 Sep 2026 22:10:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xC2VF-0000HG-QP; Wed, 30 Sep 2026 22:10:17 +0000
Received: by outflank-mailman (input) for mailman id 1437919;
 Wed, 30 Sep 2026 22:10:16 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xakep.amatop@gmail.com>) id 1xC2VE-0000G3-IF
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2026 22:10:16 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xC2VA-00CJT6-Nk
 for xen-devel@lists.xenproject.org; Thu, 01 Oct 2026 00:10:12 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6abd887a-2eae-0a2a0a5409dd-0a2a4509cdd6-46
 for <xen-devel@lists.xenproject.org>; Thu, 01 Oct 2026 00:10:12 +0200
Received: from [74.125.230.99] (helo=mail-lr2-f35.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6abd88c4-be1a-0a2a45090019-4a7de66384ab-3
 for <xen-devel@lists.xenproject.org>; Thu, 01 Oct 2026 00:10:12 +0200
Received: by mail-lr2-f35.google.com with SMTP id
 38308e7fff4ca-3a776fd3b88so8697731fa.3
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 15:10:12 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1790806212; cv=none;
        d=google.com; s=arc-20260327;
        b=NEUZj0GrwLOEOt0j3+HYF5N98Y6jskBOoHiPLjJ7iYgndSWYgHAp9HDwQrlugSzzQG
         9MtSpzje8ivx3Mx9nJgQX1dsZ8JKTNjbegNx26L+G9C+xzDl+qr0c+N285LJARjnOPIi
         kSVI35B1nXAx8rUx8i8QG13TlePs1BHeUmWf4u/3bhb18Bb3oZmEQ6k9m0m/hu2eJSzC
         C4fK6QqSDB3rVF/CsWFycqA/4vf+A3BMhTWCzfwXmPUVHw+7KP4819ffWdbyw7u9gRfO
         TcMbm5sm/sS6WQinGfPCkGnN6HSA9BoaMvMj0Q6Z9C5UL5F96iZdTCBzdlYxRC/Mu3XV
         Ks5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YT8FgYZx9j26FJn2n7QaV5qh1P2fD34fsZ+lPOPJufQ=;
        fh=f2OySzG/ebpxZaoAL0gXyBE5IU56wlJG5B80LCel6Vg=;
        b=IsL7hRztRqrLkFQUfgMcKIq61wg/u+MTDr58lAsJBiAOevheAkq9OL9dxl8amA59EP
         LpECw5nAf7u0C10w12ndTmY6tqh7KrSFF1Vs3+6u4wGywskwCgiyDjiSaDn1wXMpevhb
         u3qTgwxY5IfoPM5R+G1tEoQ5wHPDpkqcgLGFhyUH7yywH9hYQESp0/ZLLcjtFtVeWPNa
         IZSZct5Ca24BN635pK/mrex930YxWtjZg8degOc4R2xx6A624Sfs1/e1XDhBe6BNYYIS
         P4zC6IXvWkAey9rxm+5VjZ4qAnuZb/5EGLXbDaFexm1BjJrPsrhIsoB6DbVsSY/W/c4u
         gxkw==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790806212; x=1791411012; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YT8FgYZx9j26FJn2n7QaV5qh1P2fD34fsZ+lPOPJufQ=;
        b=gEtyg9h6Uq53EO+mZwKe0wpp19lgIuXqUAQYFTQB4yDB2FgixP+rXnLXdim2mLO9fy
         hTy94nXaxUv1NtbjrWEsxotMxvRd9OFZn+gTnsrH3GffZ3+L5fGwktrPUz30xqkZQlBc
         vmBNkQynDfGo+ZCkjI5gZEh6CzRqqqWLy5yND0WNNeWHBikcaIA2iNMjKaDvWr+KD0zu
         FuF6BMTqeOhuFB0g0lVix55bPFdYmChDcsLNZoBearilfLN6aGqGHWGdZmbnG1hYxPLI
         bdVUEWzxJ0eX+77Q8elE9ORNhHzxx0hgOQ5ppTOuYjJgTujZPdmpb3/lRNhHSNGCGJWP
         dq1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790806212; x=1791411012;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YT8FgYZx9j26FJn2n7QaV5qh1P2fD34fsZ+lPOPJufQ=;
        b=evQ0ffHOO2aTdrJzQao2CGuvCMGzhuoUf3cTsLBNsV+8vZYbMfT3LXxrm1GZKwp2F2
         NG2W9OK3r4pBbuRygmV5Ld6Xs2c8jR+P+PHG2KZvFyeqKBlOFD3EA4P0+YpULsEH8Y4q
         MdhqNrJfiwXnau+d9q0QK77fLiCAkoiV+ph4NyyKjXLkm61vdmdVrgXTp8hjmN3pUhl0
         8fI/JyrFRV19BYOb6jHg2uACRN6TYQRJp7Q6QzP2yARnIWKcdC7KzPEChFXvRxZl7hLO
         tBauoZXzRDWnZoETedmzNCUNnp3tBhgrbPUxRCOxJutFnljFMenZDiZV3JvpwIfdHpf8
         irmg==
X-Forwarded-Encrypted: i=1; AKwUvBx20Yl+AlzlzXhiT771l66A9k6XMzAxEbj8d6dRhL4ZWW3gpPPorZ6EV9jw5O/tfBLbiWnoeV4DA1E=@lists.xenproject.org
X-Gm-Message-State: AFq9FYJFuhCoSpz337r+gG7N9C60tOSbP195LEpoLToakCEXtyMrzsTQ
	lw1H0NQLPMPS836ieyKD2sEvn3HCKNoJ7gaz3fNfLoL3aRcyivNAgNvXxRmWk9PTlthj7t4HnZU
	L1g3bsly16D8nq9GPwAxY0QMqtOirkDg=
X-Gm-Gg: AYBFou0nAFk5CDfAd8bpxhnmMqDEuD0EQjHoOIMPvdkYA+nMDEwdpPCZRR2tvmd/2RA
	qAwHN/+6Aa2IJKdjtqz3EWSIwFjw44c2vbaV6lDPO3NurwvOVDKnpj8exyVqPjYwN/OuyOJp6kZ
	6d3fdrDiqLq3cj/WikZcbFa09/tqEEw60Q3p65KJIlj6kzgxuxDBT+lU7kvxSc4+v891IE4PDfR
	sEM6r7iKIb6W7REs4JfQV77irwReIkXl63vwrq/9KUbjS9EymkayZZvaPK2LprbgqyHagF/0iWw
	qJMILY1RT3xgxLIwuJ2QrWXX18GJ2Wn2iYmABU2R6X5FBYrMQp5F/A==
X-Received: by 2002:a05:6512:39c5:b0:5b8:f0a4:3501 with SMTP id
 2adb3069b0e04-5ba402b8581mr1121622e87.2.1790806211708; Wed, 30 Sep 2026
 15:10:11 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1787838455.git.mykola_kvach@epam.com> <9d3cf11530edf478ae7a597f1c0934f4b7b1a270.1787838455.git.mykola_kvach@epam.com>
 <D16C084A-6BD6-4AF2-AB0F-80F29A3DC8C3@arm.com>
In-Reply-To: <D16C084A-6BD6-4AF2-AB0F-80F29A3DC8C3@arm.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Thu, 1 Oct 2026 01:10:00 +0300
X-Gm-Features: AclHuK_zq7KViO1lA0QKkinPlDOWEW3X6rxvaluEe9h0acPsTndVRWXMXcZ43Rw
Message-ID: <CAGeoDV-JiYAjCQ0tP-jQNbVjGwj0oX5ifVh+9VWyiJWRg=H4zA@mail.gmail.com>
Subject: Re: [PATCH v12 13/13] xen/arm: Add host system suspend backend
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Mykola Kvach <mykola_kvach@epam.com>, 
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-bad1c0/1790806212-BC4CB034-CAE569E0/0/0
X-purgate-type: clean
X-purgate-size: 14445

Hi Bertrand,

On Mon, Sep 28, 2026 at 7:20=E2=80=AFPM Bertrand Marquis
<Bertrand.Marquis@arm.com> wrote:
>
> Hi Mykola,
>
> > On 27 Aug 2026, at 16:32, Mykola Kvach <mykola_kvach@epam.com> wrote:
> >
> > From: Mirela Simonovic <mirela.simonovic@aggios.com>
> >
> > Add the Xen-wide suspend/resume backend used after a control-domain
> > vPSCI SYSTEM_SUSPEND request has been accepted. The vPSCI policy,
> > runtime driver blockers and control-domain sequencing checks are handle=
d
> > by the preceding commit; this change adds the code that actually drives
> > the host suspend attempt.
> >
> > The backend runs from a tasklet scheduled on pCPU0, because non-boot CP=
Us
> > are disabled during suspend. It freezes domains, disables the scheduler
> > and then disables non-boot CPUs.
> >
> > Host-side suspend participants are handled in phases. IOMMU and console
> > state are suspended first. Local IRQs are then disabled before suspendi=
ng
> > timer and GIC state. On resume or failure, the completed suspend phases
> > are unwound in reverse: GIC and timer state are restored while IRQs are
> > still disabled, local IRQs are restored, and then console and IOMMU sta=
te
> > are restored.
> >
> > On boot, init_ttbr is normally initialized during secondary CPU hotplug=
.
> > On uniprocessor systems this can leave init_ttbr uninitialized, so set =
it
> > from the boot CPU before entering suspend.
> >
> > Note: the code is behind CONFIG_HAS_SYSTEM_SUSPEND, which is currently
> > only selected when UNSUPPORTED is set and MPU is not set.
> >
> > Signed-off-by: Mirela Simonovic <mirela.simonovic@aggios.com>
> > Signed-off-by: Saeed Nowshadi <saeed.nowshadi@xilinx.com>
> > Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
> > Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> > ---
> > Changes in V10:
> > - Re-apply boot CPU local errata/workaround handling after SYSTEM_SUSPE=
ND,
> >  before resuming the rest of the host suspend path.
> > - Move set_init_ttbr() declaration to asm/mmu/mm.h, since it is
> >  MMU-specific.
> >
> > Changes in V9:
> > - Split vPSCI availability policy, runtime host-suspend blockers and th=
e
> >  domain-readiness precheck into the preceding commit.
> > - Trigger the host suspend backend from the control-domain SYSTEM_SUSPE=
ND
> >  path.
> > - Reorder the host suspend/resume phases so the timer is suspended with
> >  local IRQs disabled and local IRQs are restored after the GIC and time=
r
> >  resume paths, before the console and IOMMU resume paths.
> > - Move HAS_HWDOM_SYSTEM_SUSPEND and related logic to policy patch.
> >
> > Changes in V8:
> > - Add a pre-suspend check in system_suspend() after scheduler_disable()=
 to
> >  require all domains to be in the shut down state with SHUTDOWN_suspend
> >  before proceeding with the global suspend flow.
> > - Drop the common-level depends on !ARM_64 || !SYSTEM_SUSPEND from
> >  CONFIG_HAS_HWDOM_SHUTDOWN_ON_SUSPEND and model the ARM64 suspend case
> >  with an arch-selected capability instead.
> > - Rename CONFIG_HAS_HWDOM_SHUTDOWN_ON_SUSPEND to
> >  CONFIG_HAS_HWDOM_SYSTEM_SUSPEND.
> > - Rename need_hwdom_shutdown() to want_hwdom_shutdown().
> >
> > Changes in V7:
> > - Control domain is responsible for host suspend.
> > - Add an empty inline host_system_suspend() function when SYSTEM_SUSPEN=
D
> >  config is disabled.
> > - Use IS_ENABLED() for config checking instead of #ifdef.
> > - Replace #ifdef checks in domain_shutdown() with IS_ENABLED() to simpl=
ify
> >  control flow.
> > - Factor hardware domain shutdown condition into a helper
> >  (need_hwdom_shutdown()) to avoid preprocessor directives inside the
> >  function.
> > - Squash with iommu suspend/resume commit.
> > ---
> > xen/arch/arm/Kconfig                 |   1 +
> > xen/arch/arm/cpuerrata.c             |   7 +-
> > xen/arch/arm/include/asm/cpuerrata.h |   1 +
> > xen/arch/arm/include/asm/mmu/mm.h    |   2 +
> > xen/arch/arm/include/asm/suspend.h   |   2 +
> > xen/arch/arm/mmu/smpboot.c           |   2 +-
> > xen/arch/arm/suspend.c               | 156 +++++++++++++++++++++++++++
> > xen/arch/arm/vpsci.c                 |  10 +-
> > 8 files changed, 177 insertions(+), 4 deletions(-)
> >
> > diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
> > index 9027aa17eb..da1585ec50 100644
> > --- a/xen/arch/arm/Kconfig
> > +++ b/xen/arch/arm/Kconfig
> > @@ -9,6 +9,7 @@ config ARM_64
> > select 64BIT
> > select HAS_DOMAIN_TYPE
> > select HAS_FAST_MULTIPLY
> > + select HAS_SYSTEM_SUSPEND if !MPU && UNSUPPORTED
> > select HAS_VPCI_GUEST_SUPPORT if PCI_PASSTHROUGH
> >
> > config ARM
> > diff --git a/xen/arch/arm/cpuerrata.c b/xen/arch/arm/cpuerrata.c
> > index 3a32183618..e6499aaab3 100644
> > --- a/xen/arch/arm/cpuerrata.c
> > +++ b/xen/arch/arm/cpuerrata.c
> > @@ -782,6 +782,11 @@ void check_local_cpu_errata(void)
> >     update_cpu_capabilities(arm_errata, "enabled workaround for");
> > }
> >
> > +int enable_local_cpu_errata_workarounds(void)
> > +{
> > +    return enable_nonboot_cpu_caps(arm_errata);
> > +}
> > +
> > void __init enable_errata_workarounds(void)
> > {
> >     enable_cpu_capabilities(arm_errata);
> > @@ -818,7 +823,7 @@ static int cpu_errata_callback(struct notifier_bloc=
k *nfb,
> >          * fixed to expect an error at CPU_STARTING phase.
> >          */
> >         ASSERT(system_state !=3D SYS_STATE_boot);
> > -        rc =3D enable_nonboot_cpu_caps(arm_errata);
> > +        rc =3D enable_local_cpu_errata_workarounds();
> >         break;
> >     default:
> >         break;
> > diff --git a/xen/arch/arm/include/asm/cpuerrata.h b/xen/arch/arm/includ=
e/asm/cpuerrata.h
> > index 1799a16d7e..b93521326f 100644
> > --- a/xen/arch/arm/include/asm/cpuerrata.h
> > +++ b/xen/arch/arm/include/asm/cpuerrata.h
> > @@ -5,6 +5,7 @@
> > #include <asm/alternative.h>
> >
> > void check_local_cpu_errata(void);
> > +int enable_local_cpu_errata_workarounds(void);
> > void enable_errata_workarounds(void);
> >
> > #define CHECK_WORKAROUND_HELPER(erratum, feature, arch)         \
> > diff --git a/xen/arch/arm/include/asm/mmu/mm.h b/xen/arch/arm/include/a=
sm/mmu/mm.h
> > index 7f4d59137d..ee73a77777 100644
> > --- a/xen/arch/arm/include/asm/mmu/mm.h
> > +++ b/xen/arch/arm/include/asm/mmu/mm.h
> > @@ -110,6 +110,8 @@ void dump_pt_walk(paddr_t ttbr, paddr_t addr,
> > extern void switch_ttbr(uint64_t ttbr);
> > extern void relocate_and_switch_ttbr(uint64_t ttbr);
> >
> > +void set_init_ttbr(lpae_t *root);
> > +
> > #endif /* __ARM_MMU_MM_H__ */
> >
> > /*
> > diff --git a/xen/arch/arm/include/asm/suspend.h b/xen/arch/arm/include/=
asm/suspend.h
> > index 50dc6e9fdf..889a6509d9 100644
> > --- a/xen/arch/arm/include/asm/suspend.h
> > +++ b/xen/arch/arm/include/asm/suspend.h
> > @@ -41,11 +41,13 @@ int prepare_resume_ctx(void);
> > void hyp_resume(void);
> > bool host_system_suspend_allowed(void);
> > void host_system_suspend_disable(const char *reason);
> > +void host_system_suspend(struct domain *d);
> >
> > #else /* !CONFIG_SYSTEM_SUSPEND */
> >
> > static inline bool host_system_suspend_allowed(void) { return false; }
> > static inline void host_system_suspend_disable(const char *reason) {}
> > +static inline void host_system_suspend(struct domain *d) {}
> >
> > #endif
> >
> > diff --git a/xen/arch/arm/mmu/smpboot.c b/xen/arch/arm/mmu/smpboot.c
> > index 37e91d72b7..ff508ecf40 100644
> > --- a/xen/arch/arm/mmu/smpboot.c
> > +++ b/xen/arch/arm/mmu/smpboot.c
> > @@ -72,7 +72,7 @@ static void clear_boot_pagetables(void)
> >     clear_table(boot_third);
> > }
> >
> > -static void set_init_ttbr(lpae_t *root)
> > +void set_init_ttbr(lpae_t *root)
> > {
> >     /*
> >      * init_ttbr is part of the identity mapping which is read-only. So
> > diff --git a/xen/arch/arm/suspend.c b/xen/arch/arm/suspend.c
> > index c7c26bcf03..3fe2ffa4fb 100644
> > --- a/xen/arch/arm/suspend.c
> > +++ b/xen/arch/arm/suspend.c
> > @@ -1,10 +1,18 @@
> > /* SPDX-License-Identifier: GPL-2.0-only */
> >
> > +#include <asm/cpuerrata.h>
> > +#include <asm/cpufeature.h>
> > +#include <asm/gic.h>
> > #include <asm/psci.h>
> > #include <asm/suspend.h>
> >
> > +#include <xen/console.h>
> > +#include <xen/cpu.h>
> > +#include <xen/iommu.h>
> > #include <xen/lib.h>
> > +#include <xen/sched.h>
> > #include <xen/serial.h>
> > +#include <xen/tasklet.h>
> >
> > struct resume_cpu_context resume_cpu_context;
> >
> > @@ -44,6 +52,154 @@ void host_system_suspend_disable(const char *reason=
)
> >            reason ? reason : "unsupported suspend/resume path");
> > }
> >
> > +/* Xen suspend. data identifies the domain that initiated suspend. */
> > +static void system_suspend(void *data)
> > +{
> > +    int status;
> > +    unsigned long flags;
> > +    struct domain *d =3D (struct domain *)data;
> > +
> > +    BUG_ON(system_state !=3D SYS_STATE_active);
> > +
> > +    system_state =3D SYS_STATE_suspend;
> > +
> > +    printk("Xen suspending...\n");
> > +
> > +    freeze_domains();
> > +    scheduler_disable();
> > +
> > +    /*
> > +     * Non-boot CPUs have to be disabled on suspend and enabled on res=
ume
> > +     * (hotplug-based mechanism). Disabling non-boot CPUs will lead to=
 PSCI
> > +     * CPU_OFF to be called by each non-boot CPU. Depending on the und=
erlying
> > +     * platform capabilities, this may lead to the physical powering d=
own of
> > +     * CPUs.
> > +     */
> > +    status =3D disable_nonboot_cpus();
> > +    if ( status )
> > +    {
> > +        system_state =3D SYS_STATE_resume;
> > +        goto resume_nonboot_cpus;
> > +    }
> > +
> > +    console_start_sync();
> > +    status =3D iommu_suspend();
> > +    if ( status )
> > +    {
> > +        system_state =3D SYS_STATE_resume;
> > +        goto resume_end_sync;
> > +    }
> > +
> > +    status =3D console_suspend();
> > +    if ( status )
> > +    {
> > +        dprintk(XENLOG_ERR, "Failed to suspend the console, err=3D%d\n=
", status);
> > +        system_state =3D SYS_STATE_resume;
> > +        goto resume_iommu;
> > +    }
> > +
> > +    local_irq_save(flags);
> > +
> > +    time_suspend();
> > +
> > +    status =3D gic_suspend();
> > +    if ( status )
> > +    {
> > +        system_state =3D SYS_STATE_resume;
> > +        goto resume_time;
> > +    }
> > +
> > +    set_init_ttbr(xen_pgtable);
> > +
> > +    /*
> > +     * Enable identity mapping before entering suspend to simplify
> > +     * the resume path
> > +     */
> > +    update_boot_mapping(true);
> > +
> > +    if ( prepare_resume_ctx() )
> > +    {
> > +        status =3D call_psci_system_suspend();
> > +        /*
> > +         * If suspend is finalized properly by above system suspend PS=
CI call,
> > +         * the code below in this 'if' branch will never execute. Exec=
ution
> > +         * will continue from hyp_resume which is the hypervisor's res=
ume point.
> > +         * In hyp_resume CPU context will be restored and since link-r=
egister is
> > +         * restored as well, it will appear to return from prepare_res=
ume_ctx.
> > +         * The difference in returning from prepare_resume_ctx on syst=
em suspend
> > +         * versus resume is in function's return value: on suspend, th=
e return
> > +         * value is a non-zero value, on resume it is zero. That is wh=
y the
> > +         * control flow will not re-enter this 'if' branch on resume.
> > +         */
> > +        if ( status )
> > +            dprintk(XENLOG_WARNING, "PSCI system suspend failed, err=
=3D%d\n",
> > +                    status);
> > +
> > +        system_state =3D SYS_STATE_resume;
> > +    }
> > +    else
> > +    {
> > +        system_state =3D SYS_STATE_resume;
> > +
> > +        /*
> > +         * CPU0 resumes directly from hyp_resume(), bypassing the CPU =
hotplug
> > +         * path that re-checks and re-enables errata workarounds for s=
econdary
> > +         * CPUs.
> > +         */
> > +        check_local_cpu_errata();
> > +        check_local_cpu_features();
> > +        BUG_ON(enable_local_cpu_errata_workarounds());
> > +    }
> > +
> > +    update_boot_mapping(false);
> > +
> > +    gic_resume();
> > +
> > + resume_time:
> > +    time_resume();
> > +
> > +    local_irq_restore(flags);
> > +
> > +    console_resume();
> > +
> > + resume_iommu:
> > +    iommu_resume();
> > +
> > + resume_end_sync:
> > +    console_end_sync();
> > +
> > + resume_nonboot_cpus:
> > +    /*
> > +     * The rcu_barrier() has to be added to ensure that the per cpu ar=
ea is
> > +     * freed before a non-boot CPU tries to initialize it (_free_percp=
u_area()
> > +     * has to be called before the init_percpu_area()). This scenario =
occurs
> > +     * when non-boot CPUs are hot-unplugged on suspend and hotplugged =
on resume.
>
> This line would need wrapping as it is over 80 chars.
>
> > +     */
> > +    rcu_barrier();
>
> Could you clarify which per-CPU area needs freeing here?
>
> system_state is SYS_STATE_suspend for every CPU taken down by
> disable_nonboot_cpus(), so cpu_percpu_callback() does not queue
> _free_percpu_area() for any of them.
>
> So I do not quite get what your comment case actually is.
> Could you explain ?

You are right. I checked the original patch and the code it was
based on.

The barrier was added in the 2018 series. At that time, the Arm
CPU_DEAD callback queued _free_percpu_area() even during system
suspend. If resume reached init_percpu_area() before that callback
completed, it would return -EBUSY because the old area still
existed. This would trigger BUG_ON() in enable_nonboot_cpus().

The barrier ensured that the old area was freed before bringing
the CPU back up.

That reason no longer applies. The current code keeps the per-CPU
areas during suspend and reuses them on resume.

Also, since commit 540d4d60378c ("cpu: sync any remaining RCU
callbacks before CPU up/down"), cpu_up() already calls
rcu_barrier() through cpu_hotplug_begin(), before CPU_UP_PREPARE.

The separate barrier and its comment were carried over after these
changes. I will remove both in v13. This also removes the line
that needed wrapping.

Best regards,
Mykola

