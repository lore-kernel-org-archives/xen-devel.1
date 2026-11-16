Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27FD1606A31C
	for <xen-devel@archiver.kernel.org>; Mon, 16 Nov 2026 14:36:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LJ5K9jKA
Received: from list by lists.xenproject.org with outflank-mailman.1491014.1691925 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xSxot-0004FI-N2; Mon, 16 Nov 2026 14:36:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1491014.1691925; Mon, 16 Nov 2026 14:36:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xSxot-0004FB-Js; Mon, 16 Nov 2026 14:36:31 +0000
Received: by outflank-mailman (input) for mailman id 1491014;
 Mon, 16 Nov 2026 14:36:30 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xakep.amatop@gmail.com>) id 1xSxor-0004Dy-NP
 for xen-devel@lists.xenproject.org; Mon, 16 Nov 2026 14:36:30 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xSxoq-006zSq-SS
 for xen-devel@lists.xenproject.org; Mon, 16 Nov 2026 15:36:28 +0100
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6afb14e2-2eae-0a2a0a5409dd-0a2a4506a09e-18
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2026 15:36:28 +0100
Received: from [209.85.167.52] (helo=mail-lf1-f52.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6afb14ec-195a-0a2a45060019-d155a734b9ee-3
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2026 15:36:28 +0100
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-5be3d5927ceso4428052e87.3
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2026 06:36:28 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20260707 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version"
ARC-Seal: i=1; a=rsa-sha256; t=1794839788; cv=none;
        d=google.com; s=arc-20260327;
        b=OpwWQzom0S1/VS5YX0wxHRvJCbjpvkYhwGKE/SMrDa4sT+sy/1c3Ema7lwg9da+apm
         eFuYBQTpaXmM1rcMP0WnFp6JXrtTex0PZREs1W1hdpzD/4n0uBErqO5NRsPb8sp5jLDf
         +kVhOcyAxNOew0l+nOlZaWx38Z+12LGOiRZ6Hz75SDEi7v9OipgQ7rYr4aK3CkyTjTVx
         kKalzQSZqQVdRdV118hMJKfdQQoyYbZwNPY99Rs8IjbTAU97gABYGVSz4BrlsvyxEjrw
         CfgtDyEBoqTCKCpw2Swwx0AA7QsRk89YE9WeuvPZG2MR3D4kjKGFIrnNK0+3fGVy4wiT
         qVpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jyzvqPBg4eDWMp9KPMGc4O8HB2Zehxx6UkhrqHK3gB4=;
        fh=Jj+4LPTEHrs8o6YltPBRTLvdGOz2xJZ6o5MdhiPnCoU=;
        b=k4etpcvM1ck+tucN5V4LRB+VvueGPCdKBU0RSLioThK1hfAxwT17VC5O9Qb7ARNeXN
         faSLdB503YAF7SINDn77VwGwBoWgxvJaXTXNimYr3kvD2WmeEWUvQitQzwGADZCl9Fel
         GouvR43X5ygdmIzSnKDqGQmDkWEuLKTCa5L4mWZCyjsSRXw4yMVXbCqG+eI5QZhqLBk5
         R3x4eb8r/zOcKI6vaPV13OHlFKXo6XfAnAg/ZoanQTWXOEH5tXg8zx9FLPaRB681llq1
         2LQkNIsZgJLkn47TYdTl0xuDuPZjtqWlwVIyO6bz/nZ+tMpZQh5tdkjhpyro88BcKb/u
         +y0g==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794839788; x=1795444588; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jyzvqPBg4eDWMp9KPMGc4O8HB2Zehxx6UkhrqHK3gB4=;
        b=LJ5K9jKAmRWuzxRl3clgCBXF1R6/5+gxyvd3zImWbQ9h49M1lNDE3LERR6iny7StUK
         TDjuPHeWn8f2mqHzg+T2EfTZzm7WyVhVYzrY5+r9PqEz7tQ6sYJoOdpQfte55iFEUa8k
         jYvjPcjpX+9NhSwtp13slHpae1731D/SrMnnKqSd2DmctB13+Zq93MuAQsEEGUFxoSMJ
         QLNESL6iqwNwIpYWKOPZyXH9I5RkKLA7iu9sZTl1JExVrEHgOwaKj72Br4++5gmlepOO
         t960/tTRBw5KtCUmW6Xjv0H+EsqovJZa3hPtsMoFRNgX8egHzD67eDP4AP1q+TDjGTia
         PjXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794839788; x=1795444588;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jyzvqPBg4eDWMp9KPMGc4O8HB2Zehxx6UkhrqHK3gB4=;
        b=ALgBtSeY5zI6/6P0sVHShCMuknxB1d0pNY+fLrVBKeurs2Typ08icdQVMMGuzH2lFA
         MrJp+G3W+Mb6XTI5zWM2alUnyW4yPFTg6+e3D2qZT3OQw2sCd30iydko+kW25ki8ebs5
         G61aaTtuZONIPDe2d2PI9iDf2+3emhCuDn23W1HOC5mMDvxfCahyIg9C8HYFTE6L2l32
         Bx0GmvqB+/qziZnABVHoEAamW3zs2XFOHxxEFH4wCkFcJAc+TsOQTnwRYg7jWtcz27Iw
         7nYBADnFzWdI4HNjt5VRjGgV09fp6VaZ7o9Rgl/LAiFbSj0nLkaqPqXf3CdUOffmE6be
         tAeQ==
X-Forwarded-Encrypted: i=1; AL+hErGpqEOTzXVlKWCYK8KKNsc+ZUeJg2n1uzoximgO17dc6nPD5SErF3VoU5VCr9dr2g84r6knsDQylx0=@lists.xenproject.org
X-Gm-Message-State: APuU4Z+pozoUvUOe0M22jvacouIS4Xi9TBTqyxjpf+WtnO2K8QfZtpaY
	IxI1V0x4DYs0+PoVitG7DLKsAtKlub/tqxs6iJhL2Y0L3y+HTdlnTqjMR1frP3DNc7yBvcJNZOX
	Dx3b06oAdn5vD8g6liClhPaJMUdH5DeA=
X-Gm-Gg: AYBFou1B6Ao93bRdRUqdYTW6edKk/YqKKw/e7JhgtQzU65HEhhZO6c3T4eTQDm1mBSG
	GkdbcuD8uHDKUNNkhplDKZ/8RChsqrq/iT/Ucs14oK6Z3ZMf8Pk1lb8HOur7FRCxB4eJ4O9hp+B
	gxKCAe05ATkYFT4BXqY0vP8ZttvNg6NHtljXosrqv/2GNDbcxxfieZny2egEndQ4vjOSQykh8Yh
	XmXWr515Tfv8NUC1CwEudGSmQ1XfO20VBjN5EzDM1qMsynKnfeKjBA06ZpSHRUlKXQxuRr06AW3
	n4zsa7nwvfFA0TkzNeW/uL0kUIwVJog86wXaRh4Pf8F+DBm4Uam7SokeOXs06BJpYeP0m/WD1PO
	w4tZMVmifQB9n6B4RhZBkE80YNU1IV65sKJc=
X-Received: by 2002:a05:6512:23a9:b0:5c1:56a1:9549 with SMTP id
 2adb3069b0e04-5c17077e6aamr3681038e87.11.1794839787431; Mon, 16 Nov 2026
 06:36:27 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <cover.1793129971.git.mykola_kvach@epam.com> <2299a3912c0491680b15d10a39ec5ec7e041a390.1793129971.git.mykola_kvach@epam.com>
 <33963756-7324-42BC-9A3D-38C42716B6B1@arm.com>
In-Reply-To: <33963756-7324-42BC-9A3D-38C42716B6B1@arm.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Mon, 16 Nov 2026 16:36:16 +0200
X-Gm-Features: Aa3M54qqcRNYusQjgscJ_zaQXxtoa4soGAJ2lvRArTWCBN7FPR9uLekiziqA11o
Message-ID: <CAGeoDV-jOMx7=fGEi6uRSHw32+qogQMjRt7FXH0+pBVtQdJpZA@mail.gmail.com>
Subject: Re: [PATCH v13 14/14] xen/arm: Add host system suspend backend
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Mykola Kvach <mykola_kvach@epam.com>, 
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	Mirela Simonovic <mirela.simonovic@aggios.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Saeed Nowshadi <saeed.nowshadi@xilinx.com>, 
	Mykyta Poturai <mykyta_poturai@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-16d1c6/1794839788-F420077B-904FCB75/0/0
X-purgate-type: clean
X-purgate-size: 16869
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Bertrand,

Thank you for the review.

On Mon, Nov 16, 2026 at 3:54=E2=80=AFPM Bertrand Marquis
<Bertrand.Marquis@arm.com> wrote:
>
> Hi Mykola,
>
> Sorry forgot to answer this one :-)
>
> > On 27 Oct 2026, at 22:06, Mykola Kvach <mykola_kvach@epam.com> wrote:
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
> > Changes in V13:
> > - Explicitly discard console_resume()'s return value. It always returns
> >  zero in the current implementation (MISRA Rule 17.7). No functional
> >  change.
> > - Remove the redundant rcu_barrier() and its outdated comment before
> >  enable_nonboot_cpus(). Per-CPU areas are kept during suspend, and
> >  cpu_up() already waits for pending RCU callbacks before CPU_UP_PREPARE=
.
> >
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
> > xen/arch/arm/suspend.c               | 149 +++++++++++++++++++++++++++
> > xen/arch/arm/vpsci.c                 |  10 +-
> > 8 files changed, 170 insertions(+), 4 deletions(-)
> >
> > diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
> > index fd5f0ddb17..c3e32fb683 100644
> > --- a/xen/arch/arm/Kconfig
> > +++ b/xen/arch/arm/Kconfig
> > @@ -9,6 +9,7 @@ config ARM_64
> >       select 64BIT
> >       select HAS_DOMAIN_TYPE
> >       select HAS_FAST_MULTIPLY
> > +     select HAS_SYSTEM_SUSPEND if !MPU && UNSUPPORTED
> >       select HAS_VPCI_GUEST_SUPPORT if PCI_PASSTHROUGH
> >
> > config ARM
> > diff --git a/xen/arch/arm/cpuerrata.c b/xen/arch/arm/cpuerrata.c
> > index 35ad98d29d..5a7f127495 100644
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
> > index c7c26bcf03..e6b7f6a6cc 100644
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
> > @@ -44,6 +52,147 @@ void host_system_suspend_disable(const char *reason=
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
> > +    (void)console_resume();
> > +
> > + resume_iommu:
> > +    iommu_resume();
> > +
> > + resume_end_sync:
> > +    console_end_sync();
> > +
> > + resume_nonboot_cpus:
> > +    enable_nonboot_cpus();
> > +
> > +    scheduler_enable();
> > +    thaw_domains();
> > +
> > +    system_state =3D SYS_STATE_active;
> > +
> > +    printk("Resume (status %d)\n", status);
>
> This print should have at least a log level and I am also not quite sure
> how useful the numerical value can be for someone here. This is the
> return code of gic_suspend but the user will need to dig to have an
> understanding of that and wether it is or not a problem.
>
> Definitely we need a log level here for the rest I leave it up to you.

Agreed, I'll add explicit log levels. The GIC drivers already log their
suspend errors, and status can also come from other suspend steps or
a rejected PSCI request.

I tested a simulated PSCI failure on Orange Pi 5. Messages logged while
the console is suspended are available through xl dmesg, but are not
replayed on UART.

I'd keep the detailed error messages and print a short XENLOG_WARNING
after restoring the console if suspend failed. Otherwise, I'd print Xen
resumed with XENLOG_INFO.

Would that be OK with you?

Best regards,
Mykola

>
> Cheers
> Bertrand
>
> > +
> > +    domain_resume(d);
> > +}
> > +
> > +static DECLARE_TASKLET(system_suspend_tasklet, system_suspend, NULL);
> > +
> > +void host_system_suspend(struct domain *d)
> > +{
> > +    system_suspend_tasklet.data =3D (void *)d;
> > +    /*
> > +     * The suspend procedure has to be finalized by the pCPU#0 (non-bo=
ot pCPUs
> > +     * will be disabled during the suspend).
> > +     */
> > +    tasklet_schedule_on_cpu(&system_suspend_tasklet, 0);
> > +}
> > +
> > /*
> >  * Local variables:
> >  * mode: C
> > diff --git a/xen/arch/arm/vpsci.c b/xen/arch/arm/vpsci.c
> > index 0131c297dd..5d4c31df1e 100644
> > --- a/xen/arch/arm/vpsci.c
> > +++ b/xen/arch/arm/vpsci.c
> > @@ -238,7 +238,8 @@ static bool domain_in_suspend_state(struct domain *=
d)
> >     return suspended;
> > }
> >
> > -static int32_t domain_psci_system_suspend_policy(struct domain *d)
> > +static int32_t domain_psci_system_suspend_policy(struct domain *d,
> > +                                                 bool *host_suspend)
> > {
> >     struct domain *other;
> >     bool last_awake_control_domain =3D true;
> > @@ -305,6 +306,7 @@ static int32_t domain_psci_system_suspend_policy(st=
ruct domain *d)
> >     if ( !host_system_suspend_allowed() )
> >         return PSCI_DENIED;
> >
> > +    *host_suspend =3D true;
> >     return 0;
> > }
> >
> > @@ -315,6 +317,7 @@ static int32_t do_psci_1_0_system_suspend(register_=
t epoint, register_t cid)
> >     struct vcpu *v;
> >     struct domain *d =3D current->domain;
> >     bool is_thumb =3D epoint & 1;
> > +    bool host_suspend =3D false;
> >     struct resume_info *rctx =3D &d->arch.resume_ctx;
> >
> >     /* THUMB set is not allowed with 64-bit domain */
> > @@ -339,7 +342,7 @@ static int32_t do_psci_1_0_system_suspend(register_=
t epoint, register_t cid)
> >
> >     spin_lock(&vpsci_system_suspend_lock);
> >
> > -    rc =3D domain_psci_system_suspend_policy(d);
> > +    rc =3D domain_psci_system_suspend_policy(d, &host_suspend);
> >     if ( !rc )
> >     {
> >         rc =3D domain_shutdown(d, SHUTDOWN_suspend);
> > @@ -364,6 +367,9 @@ static int32_t do_psci_1_0_system_suspend(register_=
t epoint, register_t cid)
> >             "SYSTEM_SUSPEND requested, epoint=3D%#"PRIregister", cid=3D=
%#"PRIregister"\n",
> >             epoint, cid);
> >
> > +    if ( host_suspend )
> > +        host_system_suspend(d);
> > +
> >     return rc;
> > }
> >
> > --
> > 2.53.0
> >
>
>

