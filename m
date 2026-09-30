Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D11BCA5FC4
	for <xen-devel@archiver.kernel.org>; Wed, 30 Sep 2026 20:43:15 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1437892.1656841 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xC18r-000557-TG; Wed, 30 Sep 2026 20:43:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1437892.1656841; Wed, 30 Sep 2026 20:43:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xC18r-00054u-QF; Wed, 30 Sep 2026 20:43:05 +0000
Received: by outflank-mailman (input) for mailman id 1437892;
 Wed, 30 Sep 2026 20:43:04 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xakep.amatop@gmail.com>) id 1xC18q-00054D-12
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2026 20:43:04 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xC18o-00FTH7-VF
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2026 22:43:02 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6abd7408-bab6-0a2a0a5309dd-0a2a45078dec-32
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 22:43:02 +0200
Received: from [74.125.230.98] (helo=mail-lr2-f34.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6abd7456-b4ea-0a2a45070019-4a7de662aa72-3
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 22:43:02 +0200
Received: by mail-lr2-f34.google.com with SMTP id
 38308e7fff4ca-3a65fd1534aso34763321fa.0
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 13:43:02 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1790800982; cv=none;
        d=google.com; s=arc-20260327;
        b=hudFJmx26CP5IPRxBYyS2fAagR7PlUzRuOm1YLCchpeJA6zt+N+V+FaPFEGWhT160n
         oAq93L4yKn8jyZ0HxbhQx6ZIQNAqxVFJfe/Ki+vBJfk3SoqHosUC5uE/lcXiOhFN6+um
         LEmjCnpN0mI3Vm2ISfRtGhuoSx2QCpqbNqMy+BOPu/wzIcsdAoVYiipq9crRzfAXtI+8
         cmRpbDolfwCiOucNLk2LCEN6r6P++X5bVgtZfBtkgisydM8+BI1Fz40/X4O2o1rFd3mQ
         HD8FhvdePOKemdnfjcEJIqgGi69CxxNjsNXFPSR6LigNb4iFSueEt7zXNf252a1U8WTy
         aIIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0OaLs+Y0dfMT76BGHOjTgGloKCLLhaOlGqG7YViTpzo=;
        fh=llRL5efFqnnHpFXFV9xRpBehi/y3E7RY4Hjj6ZsjGXM=;
        b=B0oj+tTmdcMt2o7/OEF/IBse9iBsjVhdfm9uL0T49001ctmiqnP7OUEkvlubGQomAk
         OnLKacveBQpzLceonLpdLUuc6F3/prWNo439amRCJHa/lQrVI82vxGBHWKAc9HehiwoP
         lArpTc5yLOSNBX4nigkEIyjvqQrpqvIb3lPeD74exTMZn/kRn3tHuRkdR1uvV+24NW6u
         6er42EYuh4UUcTCENZX12ABL/DeEmV6IgLhggz6tPWadrfM0aWWd67Tqdz1yIkQd2tr9
         iFqLF4OkeyZfJTaS7IDP+A6mW7mnv1vBm0P2fsaJct135TmdWtjXNosXr24CAZ1hol09
         yg/g==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790800982; x=1791405782; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0OaLs+Y0dfMT76BGHOjTgGloKCLLhaOlGqG7YViTpzo=;
        b=guC9Yh+zsi1S5//J4msFzTFBLQ81YzeGAlcnWreE2Vd1fA+2p+vK95v5/O+ooozAZl
         2KjjoSigkDTHqvnHm3bHa/mtowFtQfSA8DMe5QNwj0qJFCjLw8M2Vaw3x7BMy/shaPSv
         5gifPY+rSwN7hgEZ/jkm9mxVfafbE6ShHBOSdm96eWYSLrTVFNaa9wjTwWXD234/b+ih
         zYOjOgD7tgMsF5m2xsB4QyFy9YVYLixrp9847tWnlxZiTuUvqt7UWPQ1gbKavCgO/+ff
         MteUVsvPZTO1Eya7CAFLU/WnBpEke2HXbBkPm0zZrOXu2xnq2xaVDVkt3FslgMK6pENt
         AuHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790800982; x=1791405782;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0OaLs+Y0dfMT76BGHOjTgGloKCLLhaOlGqG7YViTpzo=;
        b=eR16z1es3KZNPAI7ZrOQ71etPxzK5avSl+Ua4WaO1ri02A59wWa41ZakhJIn6mFmwv
         4l0IqhOngPYaS/Xep8DLGz7q0mVVaRtDsSzrhWj4pPB3PGOiqRwkSEiyzu2aEMgva6E4
         HoYc/P/SQkYTjmRQk/0ig/oGcUrvdALcTSzjIt3ogxdPxO8ePQyPPmiergDehHAd3YgT
         BiQu/oevvZlr1FvNd5uzwqgirclwbn2BIXnUFEesGZf1JkLW75s6lalojgePZL2R799d
         +8Cjvr775mFhd9m1Y0mbQehN6CHAeOa4HnKQ4WD1atpCW23kMaWzgDEfdsG0X0pmiLHf
         g2oA==
X-Forwarded-Encrypted: i=1; AKwUvBxcQQTMvgDPBZLhgso1M6jQCdyNye+l3eAzFhJiSZCrk983aiQ1NomomxAzstC1YABXg/QQWRsPxOI=@lists.xenproject.org
X-Gm-Message-State: AFq9FYJOwcsLnulNk4Tzlm2STqUfQLCXKbC0RMoKBGjR/zY/xeLwnxja
	W0kUyuKXPl1OeFRv8IqJW2GOGE5tyv7zwaEMqvvU4z32m136bjMyp8xkzYAlvI5+4WpkPicfwPy
	KTwhBQLDT1EUzELMF7vHIdAGbecauUYw=
X-Gm-Gg: AYBFou0ak+chmYvQouLziEcBZmiKqc3qScAntOeOKo4bEc/evAKPm/VoaolqLmZK3Ae
	G8mAnyJmcD+lTZ5RUeVOTffhqOy9BxwrR3RI0cXmgmq3m4TpoCKRR2K2NznIr8XPfJOSiL8yl6G
	+pBt/ktQ1ZXF8cHXYhFq7M+AKXRlpPY6Dy+NdIxWxadNs6kA7jIUD41lK3kG5YsclTFnK3MFlfH
	tPTpeygWamjUXMPjR2ff9S40RLvNNUpR8s+gROzwgpr3OVQgQ/J60dWvdYKgkgqu6zdcn2pdAxl
	nbCM5mfPaJjM3wlvlRiu6cavDn3U2XHEmOTI2zvezhE4YMHlqZFrcXiTKtHDksV4
X-Received: by 2002:a05:651c:50e:b0:3a7:81c4:1906 with SMTP id
 38308e7fff4ca-3a781c443f0mr3743291fa.8.1790800981869; Wed, 30 Sep 2026
 13:43:01 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1787838455.git.mykola_kvach@epam.com> <1d4cee919353f883f6be9c9de4f317432d61206e.1787838455.git.mykola_kvach@epam.com>
 <4FB9774A-1929-443D-ACA1-F1E1734021A1@arm.com>
In-Reply-To: <4FB9774A-1929-443D-ACA1-F1E1734021A1@arm.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Wed, 30 Sep 2026 23:42:50 +0300
X-Gm-Features: AclHuK90Ua5oekEDPN7BuKq5nRtDd_bTbxR7yiJ1R0rGBM-k2WLbdLLe3uJtGW8
Message-ID: <CAGeoDV9TOrkKfCHWNZC+EoVx77jdF4zb+p_mXNXTWJD3kZgRNw@mail.gmail.com>
Subject: Re: [PATCH v12 12/13] xen/arm: Add vPSCI SYSTEM_SUSPEND policy
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Mykola Kvach <mykola_kvach@epam.com>, 
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, 
	Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>, 
	Rahul Singh <Rahul.Singh@arm.com>, Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-ef75cf/1790800982-A4ECEAE4-768B094B/0/0
X-purgate-type: clean
X-purgate-size: 12843

Hi Bertrand,

Thank you for the review.

On Mon, Sep 28, 2026 at 7:20=E2=80=AFPM Bertrand Marquis
<Bertrand.Marquis@arm.com> wrote:
>
> Hi Mykola,
>
> > On 27 Aug 2026, at 16:32, Mykola Kvach <mykola_kvach@epam.com> wrote:
> >
> > Introduce CONFIG_HAS_HWDOM_SYSTEM_SUSPEND as an architecture-selected
> > capability for platforms where the hardware domain can be parked with
> > SHUTDOWN_suspend without calling hwdom_shutdown().
> >
> > Expose PSCI SYSTEM_SUSPEND as a vPSCI operation for all domains. For
> > non-control domains, including the hardware domain when it is not actin=
g
> > as a control domain, the call is handled as a guest/domain suspend requ=
est
> > and parks the domain in SHUTDOWN_suspend.
> >
> > Control domains need additional sequencing because their SYSTEM_SUSPEND
> > request is used to coordinate host-wide suspend. A non-last awake contr=
ol
> > domain may be parked in SHUTDOWN_suspend without requiring the host
> > suspend path to be available. The last awake control domain is treated =
as
> > the point where the request becomes a host-suspend request, and it may
> > only proceed when all non-control domains are already in SHUTDOWN_suspe=
nd
> > and the host suspend path is available.
> >
> > Keep the control-domain sequencing and domain-readiness checks out of
> > PSCI_FEATURES. They are per-attempt runtime conditions rather than stab=
le
> > PSCI function availability. Advertise SYSTEM_SUSPEND as implemented by
> > vPSCI and report attempt-time policy failures as PSCI_DENIED.
> >
> > Select HAS_HWDOM_SYSTEM_SUSPEND independently from CONFIG_SYSTEM_SUSPEN=
D
> > so that SHUTDOWN_suspend from the hardware domain can be treated as a
> > domain suspend state rather than as a hardware-domain initiated host
> > shutdown. This does not by itself imply that host-wide suspend is
> > available.
> >
> > Add host_system_suspend_allowed() to combine the host PSCI SYSTEM_SUSPE=
ND
> > capability with runtime blockers reported by Xen-owned subsystems. Add
> > runtime blockers for registered serial, IOMMU, GIC and SMMUv3 MSI IRQ
> > paths lacking suspend/resume support. These blockers are runtime based,
> > so they only apply to drivers or paths that Xen actually uses on the
> > platform. For SMMUv3, the blocker applies only when Xen actually uses t=
he
> > MSI IRQ path, since resume does not restore the SMMU *_IRQ_CFGn MSI
> > registers yet.
> >
> > Add a struct domain forward declaration to xen/suspend.h so the generic
> > header can expose arch_domain_resume() without requiring a full domain.=
h
> > include.
> >
> > Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> > Reviewed-by: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>
> > ---
> > Changes in V12:
> > - handle missing is_shut_down, change checking to call of
> >  domain_shutdown_completed
> >
> > Changes in V11:
> > - Mark host_system_suspend_runtime_allowed as __ro_after_init.
> > - Avoid printing the SMMUv3 MSI IRQ host suspend blocker more than once
> >  when multiple SMMUv3 instances use MSIs.
> > - Wrap the Arm IOMMU host suspend blocker in CONFIG_SYSTEM_SUSPEND to m=
ake
> >  its policy-only use explicit.
> >
> > Changes in V10:
> > - Return PSCI_DENIED rather than PSCI_NOT_SUPPORTED when the last awake
> >  control domain cannot proceed to host suspend, keeping PSCI_FEATURES
> >  stable once SYSTEM_SUSPEND is advertised.
> > - Shorten SYSTEM_SUSPEND blocker messages and use %pd when logging the
> >  control domain.
> > - Mark serial_suspend_available as __ro_after_init.
> > - Mention the struct domain forward declaration added to xen/suspend.h.
> >
> > Changes in V9:
> > - Select HAS_HWDOM_SYSTEM_SUSPEND independently from CONFIG_SYSTEM_SUSP=
END
> >  so that hardware-domain SHUTDOWN_suspend support is not tied to
> >  host-wide system suspend availability.
> > - Add runtime host suspend blockers for Xen-owned subsystems lacking
> >  suspend/resume support.
> > - Keep vPSCI SYSTEM_SUSPEND advertised through PSCI_FEATURES and enforc=
e
> >  control-domain sequencing in the call handler.
> > ---
> > xen/arch/arm/Kconfig                  |   1 +
> > xen/arch/arm/gic.c                    |   6 ++
> > xen/arch/arm/include/asm/psci.h       |   3 +
> > xen/arch/arm/include/asm/suspend.h    |  10 ++-
> > xen/arch/arm/psci.c                   |   7 ++
> > xen/arch/arm/suspend.c                |  40 +++++++++
> > xen/arch/arm/vpsci.c                  | 114 +++++++++++++++++++++++---
> > xen/common/Kconfig                    |   3 +
> > xen/common/domain.c                   |   7 +-
> > xen/drivers/char/serial.c             |  12 +++
> > xen/drivers/passthrough/arm/iommu.c   |   6 ++
> > xen/drivers/passthrough/arm/smmu-v3.c |   9 ++
> > xen/include/xen/serial.h              |   1 +
> > xen/include/xen/suspend.h             |   2 +
> > 14 files changed, 208 insertions(+), 13 deletions(-)
> >
> > diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
> > index 843a43897e..9027aa17eb 100644
> > --- a/xen/arch/arm/Kconfig
> > +++ b/xen/arch/arm/Kconfig
> > @@ -19,6 +19,7 @@ config ARM
> > select HAS_ALTERNATIVE if HAS_VMAP
> > select HAS_DEVICE_TREE_DISCOVERY
> > select HAS_DOM0LESS
> > + select HAS_HWDOM_SYSTEM_SUSPEND if !MPU
> > select HAS_GRANT_CACHE_FLUSH if GRANT_TABLE
> > select HAS_STACK_PROTECTOR
> > select HAS_STATIC_MEMORY
> > diff --git a/xen/arch/arm/gic.c b/xen/arch/arm/gic.c
> > index ffc11f36a1..0695474432 100644
> > --- a/xen/arch/arm/gic.c
> > +++ b/xen/arch/arm/gic.c
> > @@ -26,6 +26,7 @@
> > #include <asm/device.h>
> > #include <asm/io.h>
> > #include <asm/gic.h>
> > +#include <asm/suspend.h>
> > #include <asm/vgic.h>
> > #include <asm/acpi.h>
> >
> > @@ -44,6 +45,11 @@ static void __init __maybe_unused build_assertions(v=
oid)
> > void register_gic_ops(const struct gic_hw_operations *ops)
> > {
> >     gic_hw_ops =3D ops;
> > +
> > +#ifdef CONFIG_SYSTEM_SUSPEND
> > +    if ( !ops->suspend || !ops->resume )
> > +        host_system_suspend_disable("GIC driver lacks suspend support"=
);
> > +#endif
> > }
> >
> > static void clear_cpu_lr_mask(void)
> > diff --git a/xen/arch/arm/include/asm/psci.h b/xen/arch/arm/include/asm=
/psci.h
> > index bb3c73496e..142fa1bfe5 100644
> > --- a/xen/arch/arm/include/asm/psci.h
> > +++ b/xen/arch/arm/include/asm/psci.h
> > @@ -24,6 +24,9 @@ void call_psci_cpu_off(void);
> > void call_psci_system_off(void);
> > void call_psci_system_reset(void);
> > int call_psci_system_suspend(void);
> > +#ifdef CONFIG_SYSTEM_SUSPEND
> > +bool psci_system_suspend_allowed(void);
> > +#endif
> >
> > /* Range of allocated PSCI function numbers */
> > #define PSCI_FNUM_MIN_VALUE                 _AC(0,U)
> > diff --git a/xen/arch/arm/include/asm/suspend.h b/xen/arch/arm/include/=
asm/suspend.h
> > index c848fc6340..50dc6e9fdf 100644
> > --- a/xen/arch/arm/include/asm/suspend.h
> > +++ b/xen/arch/arm/include/asm/suspend.h
> > @@ -39,7 +39,15 @@ extern struct resume_cpu_context resume_cpu_context;
> >
> > int prepare_resume_ctx(void);
> > void hyp_resume(void);
> > -#endif /* CONFIG_SYSTEM_SUSPEND */
> > +bool host_system_suspend_allowed(void);
> > +void host_system_suspend_disable(const char *reason);
> > +
> > +#else /* !CONFIG_SYSTEM_SUSPEND */
> > +
> > +static inline bool host_system_suspend_allowed(void) { return false; }
> > +static inline void host_system_suspend_disable(const char *reason) {}
> > +
> > +#endif
> >
> > #endif /* ARM_SUSPEND_H */
> >
> > diff --git a/xen/arch/arm/psci.c b/xen/arch/arm/psci.c
> > index e05dae1133..e9d78668fd 100644
> > --- a/xen/arch/arm/psci.c
> > +++ b/xen/arch/arm/psci.c
> > @@ -41,6 +41,13 @@ static bool __ro_after_init has_psci_system_suspend;
> >
> > #define PSCI_RET(res)   ((int32_t)(res).a0)
> >
> > +#ifdef CONFIG_SYSTEM_SUSPEND
> > +bool psci_system_suspend_allowed(void)
> > +{
> > +    return has_psci_system_suspend;
> > +}
> > +#endif
> > +
> > int call_psci_cpu_on(int cpu)
> > {
> >     struct arm_smccc_res res;
> > diff --git a/xen/arch/arm/suspend.c b/xen/arch/arm/suspend.c
> > index 6ea4a0f9cc..c7c26bcf03 100644
> > --- a/xen/arch/arm/suspend.c
> > +++ b/xen/arch/arm/suspend.c
> > @@ -1,9 +1,49 @@
> > /* SPDX-License-Identifier: GPL-2.0-only */
> >
> > +#include <asm/psci.h>
> > #include <asm/suspend.h>
> >
> > +#include <xen/lib.h>
> > +#include <xen/serial.h>
> > +
> > struct resume_cpu_context resume_cpu_context;
> >
> > +/*
> > + * Non-PSCI infrastructure can make host suspend impossible even when =
the PSCI
> > + * SYSTEM_SUSPEND conduit is present, e.g. when a Xen-owned driver has=
 no valid
> > + * suspend/resume path.
> > + *
> > + * This gate is checked only when the last awake control domain attemp=
ts to
> > + * turn a guest SYSTEM_SUSPEND request into a host-suspend request.
> > + */
> > +static bool __ro_after_init host_system_suspend_runtime_allowed =3D tr=
ue;
> > +
> > +static bool host_serial_suspend_allowed(void)
> > +{
> > +    if ( serial_suspend_supported() )
> > +        return true;
> > +
> > +    printk_once(XENLOG_INFO
> > +                "Host SYSTEM_SUSPEND blocked: serial unsupported\n");
> > +
> > +    return false;
> > +}
> > +
> > +bool host_system_suspend_allowed(void)
> > +{
> > +    return psci_system_suspend_allowed() &&
> > +           host_serial_suspend_allowed() &&
> > +           host_system_suspend_runtime_allowed;
> > +}
> > +
> > +void host_system_suspend_disable(const char *reason)
> > +{
> > +    host_system_suspend_runtime_allowed =3D false;
> > +
> > +    printk(XENLOG_INFO "Host SYSTEM_SUSPEND blocked: %s\n",
> > +           reason ? reason : "unsupported suspend/resume path");
> > +}
> > +
> > /*
> >  * Local variables:
> >  * mode: C
> > diff --git a/xen/arch/arm/vpsci.c b/xen/arch/arm/vpsci.c
> > index ac6af6118f..a41355d75d 100644
> > --- a/xen/arch/arm/vpsci.c
> > +++ b/xen/arch/arm/vpsci.c
> > @@ -5,6 +5,7 @@
> >
> > #include <asm/current.h>
> > #include <asm/domain.h>
> > +#include <asm/suspend.h>
> > #include <asm/vgic.h>
> > #include <asm/vpsci.h>
> > #include <asm/event.h>
> > @@ -219,6 +220,89 @@ static void do_psci_0_2_system_reset(void)
> >     domain_shutdown(d,SHUTDOWN_reboot);
> > }
> >
> > +/*
> > + * Serialise SYSTEM_SUSPEND policy decisions with the domain suspend t=
ransition,
> > + * so multiple control domains cannot all observe each other as still =
awake.
> > + */
> > +static DEFINE_SPINLOCK(vpsci_system_suspend_lock);
> > +
> > +static bool domain_in_suspend_state(struct domain *d)
> > +{
> > +    bool suspended;
> > +
> > +    spin_lock(&d->shutdown_lock);
> > +    suspended =3D domain_shutdown_completed(d) && (d->shutdown_code =
=3D=3D SHUTDOWN_suspend);
>
> This lines is over 80 chars and should be broken down.

Ack.

>
> > +    spin_unlock(&d->shutdown_lock);
> > +
> > +    return suspended;
> > +}
> > +
> > +static int32_t domain_psci_system_suspend_policy(struct domain *d)
> > +{
> > +    struct domain *other;
> > +    bool last_awake_control_domain =3D true;
> > +    bool awake_non_control_domain =3D false;
> > +
> > +    /* Only control domains participate in sequencing policy. */
> > +    if ( !is_control_domain(d) )
> > +        return 0;
>
> I am wondering what would happen in a dom0less setup with no control
> domain if the domains request SYSTEM_SUSPEND.
>
> Could you explain how they would be resumed?
> Should we deny SYSTEM_SUSPEND requests in this case?

In the current implementation, a domain in SHUTDOWN_suspend needs
an explicit XEN_DOMCTL_resumedomain request to resume, for example
through "xl resume". A guest interrupt does not resume it.

This series relies on a control domain to coordinate resume,
including the order of backend and frontend domains. It does not
provide autonomous guest wakeup in a dom0less setup without a
control domain.

A separate policy could support dom0less systems with independent
guests. Each guest could resume on its own wake interrupt. Xen
could enter host suspend once all guests have completed suspend
and the platform is ready, then resume on a platform-supported
wake event. Such a mode could coexist with managed resume, but
it is not implemented in this series.

So yes, in v13 I will return PSCI_DENIED when a non-control domain
requests SYSTEM_SUSPEND and no control domain exists.
PSCI_FEATURES will remain unchanged.

This only checks that a control domain exists. It does not check
whether that domain has permission to resume this guest or will
remain available (it may be crashed, dying, or suspended).
The actual resumedomain request is still checked by XSM.

Best regards,
Mykola

