Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2183D606A329
	for <xen-devel@archiver.kernel.org>; Mon, 16 Nov 2026 12:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rSSZdFAG
Received: from list by lists.xenproject.org with outflank-mailman.1490861.1691808 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xSw50-0001KJ-7b; Mon, 16 Nov 2026 12:45:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1490861.1691808; Mon, 16 Nov 2026 12:45:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xSw50-0001KB-4p; Mon, 16 Nov 2026 12:45:02 +0000
Received: by outflank-mailman (input) for mailman id 1490861;
 Mon, 16 Nov 2026 12:45:00 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xakep.amatop@gmail.com>) id 1xSw4y-0001K5-IO
 for xen-devel@lists.xenproject.org; Mon, 16 Nov 2026 12:45:00 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xSw4x-007sxl-Qj
 for xen-devel@lists.xenproject.org; Mon, 16 Nov 2026 13:44:59 +0100
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6afafac3-8faa-0a2a0a5109dd-0a2a4504cde2-34
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2026 13:44:59 +0100
Received: from [209.85.167.53] (helo=mail-lf1-f53.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6afafacb-b57f-0a2a45040019-d155a735ddca-3
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2026 13:44:59 +0100
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-5c14f3dab0cso2925565e87.1
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2026 04:44:59 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20260707 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version"
ARC-Seal: i=1; a=rsa-sha256; t=1794833099; cv=none;
        d=google.com; s=arc-20260327;
        b=ketGy7IeYtxOM7r6gxp4etqI8muEnjvKE0uYZ2myoe2bsJQWaGMZ1flCmz0MQaNwLB
         jj0scAHKtBDmhVh6IGA8QLSNd79706/G/hJXfpUsmMSmrzOJo7X69IE9fnFqM1ko2CEt
         /4A6B+5j+VO//7VnHPtl2liKYr1QbfM36s9qMH7kzL6zbi+ymB87RxjOkvB1iPNt3Ryr
         1WnXvmwMig57Eph9Noq51aAXR2ME4Dq+0c8aIQsqXUWddcWkIEkQ52e1DJxAlfpbMFyH
         aLUC2GTReIjs08nhELdU2TxsFGoUManND1h4T4QIiOfg61jyp5503XTOIV6opjqUT+Bi
         oWDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UB3/z+3EFhW1IAzXH3J4tV+4zriJH0YAq36b7P5Nkcw=;
        fh=9svpibGmJxrLkt1AFIwJ1rNK08LTSSr9H2MtucWeRSo=;
        b=Lmvh83FtvFaRYJzewMNiMYo9W0P7GIP17hMjHStcF6wzkueWPutEEY0PSdTxAsoXlf
         OI8+ftEeaT7T7foE2V+FDWpHJXpp3Kyiuvde4MaIwOF4I8gus1JxTca9GbgBPudlOIBh
         AmbdGlZMn/SGVslpjO0vVfocGl2gd5pEA+1GTJjrnmAmm7eVW8zq37MEbmG+9jbcQ576
         uDrSJDi0gGsxz0CgS/exFVPbUAGSXy8EYTBFXFefEyh78KMXAiori3JhBIL0U+4eE5Pn
         H9URF+85y3Hpv+WlZrpy1JyTC/PUm3gTu5p22YzUXf4H5AvFFWgyeh2bqChG1YI8MHeQ
         vPbA==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794833099; x=1795437899; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UB3/z+3EFhW1IAzXH3J4tV+4zriJH0YAq36b7P5Nkcw=;
        b=rSSZdFAG8uVIM62y1gB1eJVASvDjsI9VFYcSWropYIKU384q1i4leEqYaZfOwhEXk5
         wI9I0ehnPEYPgqlzEZOkNTMk/4qW6pSMrKaNCuoCGjuAy0cLNdRcADdUFbUzZXvoKiv1
         SHpeTaZwlpYZOn8JLwQdmeLyNV4uvxe3cgZSbS0CWhM/Q5e+yjRCzmxITESeekfSwnCr
         /vO/4nNS2GJ4GBSj2KDKnQ6toMDQL0uT4pOVW8ciegLB+fhNfXsw8SRcvMmEANSrDemF
         ZPU33uQIvUbNWEUrGZAKO1q8ym8RmgoiOaEF8zWPZ5TjJx2TNpiwLy1XKUOfHORw0NfU
         6xRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794833099; x=1795437899;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UB3/z+3EFhW1IAzXH3J4tV+4zriJH0YAq36b7P5Nkcw=;
        b=wJw5laVvIGy/j1+HGkwC+Y0ymLHAPce3zJ4v6K2Chrqilp04kZVHxezsridszR6se/
         39o6YPF+zLgALuXK2E7TT3sKNuXBlMfJ0Kz4i4lsXN7828qzB6E1L0bSp69StcSSibtL
         ApXLdxWVJ9uLiHy/QoXWIRsrw1GZuhtNeY39McdIQP2iVd1NpucSVKIQSN2NPuG8O70O
         x/6rdA/HUCBLnCtXgoX/qoncQ1AaTsLLOlCiHgKJcRGcD5I1Kl0Uzs1S20t6Dx+4LmvQ
         m9d6ajADbSw7xcSir5mrGi3zngbHWh5qWcI4KT9adBxkM1njduq7/Oco6jdb88mxfhnp
         JzmQ==
X-Forwarded-Encrypted: i=1; AL+hErEt1ul+ABewYKA9eE3U83qjEnBrB2WbFcTTaauKaqsXfLstreK1EcRvzUwWtoLJl6p17CKO14dF4u4=@lists.xenproject.org
X-Gm-Message-State: APuU4Z/7KDfhmDewgCQuHHig9QLwlkVRSB4whmDfZdIHWXcq3Oj0bVhk
	Win+dEkKuXBMpaMztlybRDL2ftj9zBBBugCrDApnJHk8dcb0iOgtpVrT7vShX70QhTlt2U/XVV8
	KrjbVxbdMoibCKDYLUj0SzKFdNBPv7ck=
X-Gm-Gg: AYBFou0ICLZNL5vuqtUdWyVjTOtXATSwbfiV8qBZTfWS3TYFP8cpyEYoNfs/BTFXFo4
	PHLwyusyTbc3gtCnhR9w3mFiOz1FB3itdlWMVx7YsLvV0Y9+LnDV6E4frXbQqLTrz/7mAaOYWpJ
	R6UCVWw54a7d3mOK8/8bscP88HcBENBodWJxUDX2gaq1MTjn2xu/rEK7WkXMsAbpjpmQwmcTLk3
	x0OzI/BaZkN0qehyDpPqS7AFs5L9VgMBYn8e2GFPiBzlTDtlJqJPLF4dOEZGKTVZFbnbNssdpr6
	p9M9Y0B8fkWj8cchusV8HG6GGOZfCg5i+mMSOZC2OShClnvcY+kW5K+6KCoxCfNbjWTZrjUYZMI
	P6Yrp6SNoI0FYPy4/EHu3Ek/JrD5MmqE1dlU=
X-Received: by 2002:a05:6512:3056:b0:5be:4904:d2c4 with SMTP id
 2adb3069b0e04-5c17079ab18mr4146623e87.15.1794833098774; Mon, 16 Nov 2026
 04:44:58 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <cover.1793129971.git.mykola_kvach@epam.com> <815a067a28bdc1db079cc3ad068e3ef74b7afe5c.1793129971.git.mykola_kvach@epam.com>
 <67C4EE43-9CC9-4911-9369-79F8264B8EAA@arm.com>
In-Reply-To: <67C4EE43-9CC9-4911-9369-79F8264B8EAA@arm.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Mon, 16 Nov 2026 14:44:47 +0200
X-Gm-Features: Aa3M54oC-PnRrjt0kzNeiLmiKkz9M1-jXVw-u4HPEVpV-EF8P-_yFuutPwMw4Jk
Message-ID: <CAGeoDV-Vp6knpiYmhDNDNqHQmg-Z9VoQiqywx_-c9w=o9ntnwA@mail.gmail.com>
Subject: Re: [PATCH v13 13/14] xen/arm: Add vPSCI SYSTEM_SUSPEND policy
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Mykola Kvach <mykola_kvach@epam.com>, 
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, 
	Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>, 
	Mykyta Poturai <mykyta_poturai@epam.com>, Rahul Singh <Rahul.Singh@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-ebf023/1794833099-C20D5B50-5358A2BA/0/0
X-purgate-type: clean
X-purgate-size: 22992
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Bertrand,

On Tue, Nov 10, 2026 at 5:53=E2=80=AFPM Bertrand Marquis
<Bertrand.Marquis@arm.com> wrote:
>
> Hi Mykola,
>
> > On 27 Oct 2026, at 22:06, Mykola Kvach <mykola_kvach@epam.com> wrote:
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
> > A non-control domain can suspend only while a control domain exists to
> > resume it using XEN_DOMCTL_resumedomain. Return PSCI_DENIED otherwise,
> > including in a dom0less setup with no control domain.
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
> > Block host suspend when Xen uses an R-Car Gen4 PCIe controller. The
> > PCIe BDF-to-OSID registers are not saved and restored yet. This does
> > not affect normal IPMMU use or guest-only suspend.
> >
> > Add a struct domain forward declaration to xen/suspend.h so the generic
> > header can expose arch_domain_resume() without requiring a full domain.=
h
> > include.
> >
> > Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
>
>
> With the Nit below fixed and the commit message updated to explain the
> !MPU restriction as discussed with Jan, for the Arm and Arm SMMUv3
> changes:
>
> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com> # ARM, ARM SMMUv=
3

Ack.
Thanks for the review.

>
> > ---
> > Changes in V13:
> > - Block host suspend when Xen uses an R-Car Gen4 PCIe controller, since
> >  PCIe OSID state is not restored.
> > - Deny guest SYSTEM_SUSPEND when no control domain exists to resume it.
> > - Split the long suspend-state check across two lines.
> >
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
> > xen/arch/arm/pci/pci-host-rcar4.c     |   4 +
> > xen/arch/arm/psci.c                   |   7 ++
> > xen/arch/arm/suspend.c                |  40 +++++++++
> > xen/arch/arm/vpsci.c                  | 119 +++++++++++++++++++++++---
> > xen/common/Kconfig                    |   3 +
> > xen/common/domain.c                   |   7 +-
> > xen/drivers/char/serial.c             |  12 +++
> > xen/drivers/passthrough/arm/iommu.c   |   6 ++
> > xen/drivers/passthrough/arm/smmu-v3.c |   9 ++
> > xen/include/xen/serial.h              |   1 +
> > xen/include/xen/suspend.h             |   2 +
> > 15 files changed, 217 insertions(+), 13 deletions(-)
> >
> > diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
> > index b9c5c40678..fd5f0ddb17 100644
> > --- a/xen/arch/arm/Kconfig
> > +++ b/xen/arch/arm/Kconfig
> > @@ -19,6 +19,7 @@ config ARM
> >       select HAS_ALTERNATIVE if HAS_VMAP
> >       select HAS_DEVICE_TREE_DISCOVERY
> >       select HAS_DOM0LESS
> > +     select HAS_HWDOM_SYSTEM_SUSPEND if !MPU
> >       select HAS_GRANT_CACHE_FLUSH if GRANT_TABLE
> >       select HAS_SHARED_INFO
> >       select HAS_STACK_PROTECTOR
> > diff --git a/xen/arch/arm/gic.c b/xen/arch/arm/gic.c
> > index 30087b5938..3fb0a56d94 100644
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
> > #define       PSCI_FNUM_MIN_VALUE                 _AC(0,U)
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
> > diff --git a/xen/arch/arm/pci/pci-host-rcar4.c b/xen/arch/arm/pci/pci-h=
ost-rcar4.c
> > index e1e8eb0ee1..0d85ccf4f5 100644
> > --- a/xen/arch/arm/pci/pci-host-rcar4.c
> > +++ b/xen/arch/arm/pci/pci-host-rcar4.c
> > @@ -11,6 +11,7 @@
> > #include <asm/device.h>
> > #include <asm/io.h>
> > #include <asm/pci.h>
> > +#include <asm/suspend.h>
> >
> > #include "pci-designware.h"
> > #include "pci-host-rcar4.h"
> > @@ -221,6 +222,9 @@ static int __init pci_host_rcar4_probe(struct dt_de=
vice_node *dev,
> >     dw_pcie_set_priv(bridge, priv);
> >     dw_pcie_set_version(bridge, RCAR4_DWC_VERSION);
> >
> > +    host_system_suspend_disable(
> > +        "R-Car Gen4 PCIe OSID state is not restored");
> > +
> >     return 0;
> > err:
> >     xfree(priv);
> > diff --git a/xen/arch/arm/psci.c b/xen/arch/arm/psci.c
> > index 4d502216ce..187cad44d5 100644
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
> > index ac6af6118f..0131c297dd 100644
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
> > @@ -219,6 +220,94 @@ static void do_psci_0_2_system_reset(void)
> >     domain_shutdown(d,SHUTDOWN_reboot);
> > }
> >
> > +/*
> > + * Serialise SYSTEM_SUSPEND policy decisions with the domain suspend t=
ransition,
>
> This line is over 80 chars it seems, can you wrap it ?

Ack.

Best regards,
Mykola

>
> Cheers
> Bertrand
>
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
> > +    suspended =3D domain_shutdown_completed(d) &&
> > +                (d->shutdown_code =3D=3D SHUTDOWN_suspend);
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
> > +    bool has_control_domain =3D is_control_domain(d);
> > +
> > +    rcu_read_lock(&domlist_read_lock);
> > +
> > +    for_each_domain ( other )
> > +    {
> > +        bool suspended;
> > +
> > +        if ( other =3D=3D d )
> > +            continue;
> > +
> > +        if ( is_control_domain(other) )
> > +            has_control_domain =3D true;
> > +
> > +        suspended =3D domain_in_suspend_state(other);
> > +        if ( suspended )
> > +            continue;
> > +
> > +        if ( is_control_domain(other) )
> > +        {
> > +            last_awake_control_domain =3D false;
> > +            break;
> > +        }
> > +
> > +        awake_non_control_domain =3D true;
> > +    }
> > +
> > +    rcu_read_unlock(&domlist_read_lock);
> > +
> > +    /* Non-control domains need a control domain to resume them. */
> > +    if ( !is_control_domain(d) )
> > +        return has_control_domain ? 0 : PSCI_DENIED;
> > +
> > +    /*
> > +     * Another control domain is still awake. This request is only the=
 first
> > +     * phase of the sequencing: park this control domain and leave the=
 host
> > +     * running. Host-wide suspend gates must not block this intermedia=
te state.
> > +     */
> > +    if ( !last_awake_control_domain )
> > +        return 0;
> > +
> > +    /*
> > +     * This is the last awake control domain. It must not be parked un=
less the
> > +     * request can proceed as a host-suspend request; otherwise Xen wo=
uld lose
> > +     * the last domain that can coordinate the system suspend.
> > +     */
> > +    if ( awake_non_control_domain )
> > +    {
> > +        printk(XENLOG_DEBUG
> > +               "SYSTEM_SUSPEND denied for %pd: non-control domains awa=
ke\n",
> > +               d);
> > +        return PSCI_DENIED;
> > +    }
> > +
> > +    /*
> > +     * Host-wide gates are relevant only for the last-control-domain c=
ase. They
> > +     * must not block parking of a non-last control domain, but they m=
ust deny
> > +     * the last control domain when host suspend is not currently avai=
lable.
> > +     */
> > +    if ( !host_system_suspend_allowed() )
> > +        return PSCI_DENIED;
> > +
> > +    return 0;
> > +}
> > +
> > static int32_t do_psci_1_0_system_suspend(register_t epoint, register_t=
 cid)
> > {
> >     int32_t rc;
> > @@ -232,10 +321,6 @@ static int32_t do_psci_1_0_system_suspend(register=
_t epoint, register_t cid)
> >     if ( is_64bit_domain(d) && is_thumb )
> >         return PSCI_INVALID_ADDRESS;
> >
> > -    /* SYSTEM_SUSPEND is not supported for the hardware domain yet */
> > -    if ( is_hardware_domain(d) )
> > -        return PSCI_NOT_SUPPORTED;
> > -
> >     /* Ensure that all CPUs other than the calling one are offline */
> >     domain_lock(d);
> >     for_each_vcpu ( d, v )
> > @@ -252,16 +337,29 @@ static int32_t do_psci_1_0_system_suspend(registe=
r_t epoint, register_t cid)
> >     if ( rc )
> >         return PSCI_DENIED;
> >
> > -    rc =3D domain_shutdown(d, SHUTDOWN_suspend);
> > +    spin_lock(&vpsci_system_suspend_lock);
> > +
> > +    rc =3D domain_psci_system_suspend_policy(d);
> > +    if ( !rc )
> > +    {
> > +        rc =3D domain_shutdown(d, SHUTDOWN_suspend);
> > +        if ( rc )
> > +            rc =3D PSCI_DENIED;
> > +        else
> > +        {
> > +            rctx->ctxt =3D ctxt;
> > +            rctx->wake_cpu =3D current;
> > +        }
> > +    }
> > +
> > +    spin_unlock(&vpsci_system_suspend_lock);
> > +
> >     if ( rc )
> >     {
> >         free_vcpu_guest_context(ctxt);
> > -        return PSCI_DENIED;
> > +        return rc;
> >     }
> >
> > -    rctx->ctxt =3D ctxt;
> > -    rctx->wake_cpu =3D current;
> > -
> >     gprintk(XENLOG_DEBUG,
> >             "SYSTEM_SUSPEND requested, epoint=3D%#"PRIregister", cid=3D=
%#"PRIregister"\n",
> >             epoint, cid);
> > @@ -287,10 +385,9 @@ static int32_t do_psci_1_0_features(uint32_t psci_=
func_id)
> >     case PSCI_0_2_FN32_SYSTEM_RESET:
> >     case PSCI_1_0_FN32_PSCI_FEATURES:
> >     case ARM_SMCCC_VERSION_FID:
> > -        return 0;
> >     case PSCI_1_0_FN32_SYSTEM_SUSPEND:
> >     case PSCI_1_0_FN64_SYSTEM_SUSPEND:
> > -        return is_hardware_domain(current->domain) ? PSCI_NOT_SUPPORTE=
D : 0;
> > +        return 0;
> >     default:
> >         return PSCI_NOT_SUPPORTED;
> >     }
> > diff --git a/xen/common/Kconfig b/xen/common/Kconfig
> > index 5b289e444f..0a3e5d8a93 100644
> > --- a/xen/common/Kconfig
> > +++ b/xen/common/Kconfig
> > @@ -140,6 +140,9 @@ config HAS_EX_TABLE
> > config HAS_FAST_MULTIPLY
> >       bool
> >
> > +config HAS_HWDOM_SYSTEM_SUSPEND
> > +     bool
> > +
> > config HAS_IOPORTS
> >       bool
> >
> > diff --git a/xen/common/domain.c b/xen/common/domain.c
> > index b41be89cd0..eac94cb888 100644
> > --- a/xen/common/domain.c
> > +++ b/xen/common/domain.c
> > @@ -1377,6 +1377,11 @@ void __domain_crash(struct domain *d)
> >     domain_shutdown(d, SHUTDOWN_crash);
> > }
> >
> > +static inline bool want_hwdom_shutdown(uint8_t reason)
> > +{
> > +    return !IS_ENABLED(CONFIG_HAS_HWDOM_SYSTEM_SUSPEND) ||
> > +           reason !=3D SHUTDOWN_suspend;
> > +}
> >
> > int domain_shutdown(struct domain *d, u8 reason)
> > {
> > @@ -1393,7 +1398,7 @@ int domain_shutdown(struct domain *d, u8 reason)
> >         d->shutdown_code =3D reason;
> >     reason =3D d->shutdown_code;
> >
> > -    if ( is_hardware_domain(d) )
> > +    if ( is_hardware_domain(d) && want_hwdom_shutdown(reason) )
> >         hwdom_shutdown(reason);
> >
> >     if ( domain_shutting_down(d) )
> > diff --git a/xen/drivers/char/serial.c b/xen/drivers/char/serial.c
> > index cf0abf1893..1cdf4968ac 100644
> > --- a/xen/drivers/char/serial.c
> > +++ b/xen/drivers/char/serial.c
> > @@ -490,6 +490,8 @@ const struct vuart_info *serial_vuart_info(int idx)
> >
> > #ifdef CONFIG_SYSTEM_SUSPEND
> >
> > +static bool __ro_after_init serial_suspend_available =3D true;
> > +
> > void serial_suspend(void)
> > {
> >     int i;
> > @@ -506,6 +508,11 @@ void serial_resume(void)
> >             com[i].driver->resume(&com[i]);
> > }
> >
> > +bool serial_suspend_supported(void)
> > +{
> > +    return serial_suspend_available;
> > +}
> > +
> > #endif /* CONFIG_SYSTEM_SUSPEND */
> >
> > void __init serial_register_uart(int idx, struct uart_driver *driver,
> > @@ -514,6 +521,11 @@ void __init serial_register_uart(int idx, struct u=
art_driver *driver,
> >     /* Store UART-specific info. */
> >     com[idx].driver =3D driver;
> >     com[idx].uart   =3D uart;
> > +
> > +#ifdef CONFIG_SYSTEM_SUSPEND
> > +    if ( !driver->suspend || !driver->resume )
> > +        serial_suspend_available =3D false;
> > +#endif
> > }
> >
> > void __init serial_async_transmit(struct serial_port *port)
> > diff --git a/xen/drivers/passthrough/arm/iommu.c b/xen/drivers/passthro=
ugh/arm/iommu.c
> > index 100545e23f..461e01703e 100644
> > --- a/xen/drivers/passthrough/arm/iommu.c
> > +++ b/xen/drivers/passthrough/arm/iommu.c
> > @@ -19,6 +19,7 @@
> > #include <xen/device_tree.h>
> > #include <xen/iommu.h>
> > #include <xen/lib.h>
> > +#include <xen/suspend.h>
> >
> > #include <asm/device.h>
> >
> > @@ -46,6 +47,11 @@ void __init iommu_set_ops(const struct iommu_ops *op=
s)
> >     }
> >
> >     iommu_ops =3D ops;
> > +
> > +#ifdef CONFIG_SYSTEM_SUSPEND
> > +    if ( !ops->suspend || !ops->resume )
> > +        host_system_suspend_disable("IOMMU driver lacks suspend suppor=
t");
> > +#endif
> > }
> >
> > int __init iommu_hardware_setup(void)
> > diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passth=
rough/arm/smmu-v3.c
> > index 58530ef2d1..247c6156cc 100644
> > --- a/xen/drivers/passthrough/arm/smmu-v3.c
> > +++ b/xen/drivers/passthrough/arm/smmu-v3.c
> > @@ -91,6 +91,7 @@
> > #include <asm/io.h>
> > #include <asm/iommu_fwspec.h>
> > #include <asm/platform.h>
> > +#include <asm/suspend.h>
> >
> > #include "smmu-v3.h"
> >
> > @@ -1888,6 +1889,7 @@ static void arm_smmu_write_msi_msg(struct msi_des=
c *desc, struct msi_msg *msg)
> >
> > static void arm_smmu_setup_msis(struct arm_smmu_device *smmu)
> > {
> > +     static bool __ro_after_init host_suspend_blocked_by_msi;
> >       struct msi_desc *desc;
> >       int ret, nvec =3D ARM_SMMU_MAX_MSIS;
> >       struct device *dev =3D smmu->dev;
> > @@ -1926,6 +1928,13 @@ static void arm_smmu_setup_msis(struct arm_smmu_=
device *smmu)
> >               }
> >       }
> >
> > +     if ( !host_suspend_blocked_by_msi )
> > +     {
> > +             host_suspend_blocked_by_msi =3D true;
> > +             host_system_suspend_disable(
> > +                     "SMMUv3 MSI IRQ path is unsupported for host susp=
end");
> > +     }
> > +
> >       /* Add callback to free MSIs on teardown */
> >       devm_add_action(dev, arm_smmu_free_msis, dev);
> > }
> > diff --git a/xen/include/xen/serial.h b/xen/include/xen/serial.h
> > index 3a71da767d..4c6f891221 100644
> > --- a/xen/include/xen/serial.h
> > +++ b/xen/include/xen/serial.h
> > @@ -137,6 +137,7 @@ const struct vuart_info* serial_vuart_info(int idx)=
;
> > /* Serial suspend/resume. */
> > void serial_suspend(void);
> > void serial_resume(void);
> > +bool serial_suspend_supported(void);
> > #endif
> >
> > /*
> > diff --git a/xen/include/xen/suspend.h b/xen/include/xen/suspend.h
> > index 6f94fd53b0..a941331035 100644
> > --- a/xen/include/xen/suspend.h
> > +++ b/xen/include/xen/suspend.h
> > @@ -6,6 +6,8 @@
> > #if __has_include(<asm/suspend.h>)
> > #include <asm/suspend.h>
> > #else
> > +struct domain;
> > +
> > static inline void arch_domain_resume(struct domain *d) {}
> > #endif
> >
> > --
> > 2.53.0
> >
>
>

