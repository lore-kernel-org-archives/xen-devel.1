Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05767C982F1
	for <xen-devel@archiver.kernel.org>; Tue, 22 Sep 2026 07:05:15 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1428230.1650950 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8uYj-00034z-TR; Tue, 22 Sep 2026 07:04:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1428230.1650950; Tue, 22 Sep 2026 07:04:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8uYj-00034s-Qn; Tue, 22 Sep 2026 07:04:57 +0000
Received: by outflank-mailman (input) for mailman id 1428230;
 Tue, 22 Sep 2026 07:04:55 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xakep.amatop@gmail.com>) id 1x8uYh-00034m-Oh
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 07:04:55 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x8uYg-001n67-HN
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 09:04:54 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6ab22893-8faa-0a2a0a5109dd-0a2a4503d7e4-8
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 09:04:54 +0200
Received: from [74.125.230.76] (helo=mail-lr2-f12.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6ab22896-fae8-0a2a45030019-4a7de64ca4dd-3
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 09:04:54 +0200
Received: by mail-lr2-f12.google.com with SMTP id
 38308e7fff4ca-3a2ff16c0e6so27080161fa.0
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 00:04:54 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1790060694; cv=none;
        d=google.com; s=arc-20260327;
        b=IvqtidKDLQdYD+WGubrQIUc4xIRHJ0VpvNrZHb1+7sx8DEMMpf/6nSCczsFXOY/fOG
         JEAeXTqyjIvJNNTZPDMOW8GOwkzJulX22wqj+IpQujPT7EDM9fQZp0p5qdX6qLrby3X4
         amol0Msr6PYCSCIwZyvL7/ZReYZT9j5z3+DFtd8aj3uKsnXhfYRQe75Wn/B5E2PhpEY4
         uHUnt5ZkGLBoMXc7aRz1/1p6LGwMpSU1nLGRx2gwk/9xCAfqFGPtYSG/CMNqXFETBQ0F
         HH8qJaYXpINX7a1APQ21m7XrR0zPLWoA2YllN44M1NEtFUB3wddPB3nU2McPbrYqQLcc
         cbjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=u5KLci8axsBZKa2iGs/VF/tpFsisOqj9U943YBJ6gIE=;
        fh=xkGovUztO+7tl6B9I9GHgFuTbTxdlGwkEzwa8Ij88OQ=;
        b=ibV2NX65RKv2VZKXnEolFu/fOG87V8d/dJBCoOM7Uh1a4qU8LqIdOLVG/xDIIqDwYN
         0Ck9H6+EgUQOmZbiFb3QJf311CrBNnhIYV+zc4pCuuwsIO780lhdVL0ekIzk6L4o9pxF
         kBL6IwwRR+CnkvW4oAPFNIwJp5MToEtiPK5b+ttr+T7528ZCGKmC35MIXcrAk6U7v+xa
         tU+hNzd1ckU8QtKedOif7IP5XV6s5dm6okXrglESfUTPGCxL/mBUd4U+TrvGqksH8XjK
         j1sXrMWwk23BZxidI0BCJ6YyQ8yP1uf/1paeBfX2DKX+f80DNmKTJGBw+hD2B6CKDHkH
         fVdQ==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790060694; x=1790665494; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=u5KLci8axsBZKa2iGs/VF/tpFsisOqj9U943YBJ6gIE=;
        b=DTAw9jDUKOAPAhxsI4mUm1VnUZ+sB1+yYmzIuoG0dKKYy6vpq8NT9D552KXjRdIrOU
         W6lVyrzdyg506K+PX7qEAXEEYhLRqQLo+3h6hgcjsJTs9YI+f0bS62k0nws+utmb3GUe
         BmQyONhS14llvs0AqqHOx/91a6Asye/uBb2YLKjRul2C/6P1TMK6RHfcZtYBqxfJ6Dkv
         k/mm6ElPfH5uuejqOD8ddin5XIjkvdbMjA0nMipiisx7kUCZlWKktObV8xvZy0hOdtIB
         Mrh9TZe2Cy0Gxuhfsx8AeNHGRJURqehUky/YQ73voWFuP6OLc+6ajeP8Cgx3Utw3pQSj
         Gi0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790060694; x=1790665494;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u5KLci8axsBZKa2iGs/VF/tpFsisOqj9U943YBJ6gIE=;
        b=H6/sAEPChVFp4c4/lM/3UpOTAea1wAjhgNxC+IUnd4ruuVhDm/+y7yiFXlrk4pmFBu
         Cue0WSi6NT8AcJIVRyVuEKbsk5eMKX/7NRG9zFe/95Z9DYZ2NQR6ixQj1MLzOnlF8Kxt
         VzsUP3m+opwOlj1VVLh/YcKd8b3511x8/kKxjWBxDHT6FohyscjTQXqOEOd/Bb0+sEBM
         C1GRpTKDZDiIsN2Pn6PwutTgUnT6aD4GBrU6jmAI8kisitoNY0s+aj3JM16fbIDhIzjF
         spzoi/yyeyp6ebZiWpgAUfKtR47qW7glaLURW+jwUnYaGVkbQqV0NorptE3PdDzRHw+F
         bwZw==
X-Gm-Message-State: AFuF++lo4kY6pCDkzKYqaDDoeoBbPyGsWxrXYaIUak8ryxiSL8vufqQZ
	P4HZG9sTxtxeJsLDIUoFwyRrr4QbbhTDUbvcs3fknIFAQYIrB8Zxy7xzm3tDn9dpWdZhuE0QJgT
	ne/kvnP3hGT2tsEvhhpd7WbezXIl5F0Y=
X-Gm-Gg: AYBFou1wlhEt6juS86oH5LknJqUB8l/KylnVhWwRV8b3EZTbSySNHSQDvP7v+RZWgTp
	OTmFo0viq6WjANY+fvXFRgrVMdVqemwLF4UspZygBZO0whRB9B+936IR8kBh0+eOUuAN+5iGMoY
	YdOK5DZM/uynzv8g79axCs27BcmkpcBpU/sGQeAejOc7Jr2KUzU5IWcbqFLqP7Mzz3fd9qKaZWI
	VD2FIf5o3YS82I5K8rurnE5VxvNy4L8JVokp5ki7W5SMfgK64EeJHaVuwqHL3YnqY112Z2Z3njL
	/SB0e2Eu1EBYNCKGDNI2bfDE0kU4WXaH7rhmVVoPe8mgdLLKtsE8Tg==
X-Received: by 2002:a05:651c:555:b0:3a4:9eb9:b99e with SMTP id
 38308e7fff4ca-3a5fbe69c92mr32878761fa.12.1790060693474; Tue, 22 Sep 2026
 00:04:53 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1787838455.git.mykola_kvach@epam.com>
In-Reply-To: <cover.1787838455.git.mykola_kvach@epam.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Tue, 22 Sep 2026 10:04:42 +0300
X-Gm-Features: AcwNN1VNhVTMm-f0Ez_W10Ey-T_SsP__u-NBkE927JyjfmMf2l1GbH7YE5sNz4k
Message-ID: <CAGeoDV9tJsuAQe4A=_koV0FpRgHWBr4G-09omAB1VG5_fV-TgA@mail.gmail.com>
Subject: Ping: [PATCH v12 00/13] Add initial Xen Suspend-to-RAM support on ARM64
To: Mykola Kvach <mykola_kvach@epam.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>, 
	Jens Wiklander <jenswi@kernel.org>, Rahul Singh <rahul.singh@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-33051d/1790060694-772F54E9-49A9190D/0/0
X-purgate-type: clean
X-purgate-size: 9420

Hi all,

Just a gentle ping on this series.

I would appreciate any further review or feedback when you have a chance.

Thanks,
Mykola

On Thu, Aug 27, 2026 at 7:22=E2=80=AFPM Mykola Kvach <mykola_kvach@epam.com=
> wrote:
>
> This is part 2 of the ARM Xen system suspend/resume patch series, based
> on earlier work by Mirela Simonovic and Mykyta Poturai.
>
> Part 1, covering guest suspend functionality, is already in mainline.
>
> NOTE: Host-wide suspend/resume support is guarded by CONFIG_SYSTEM_SUSPEN=
D,
> which can currently only be selected when UNSUPPORTED is set, and thus th=
e
> host suspend backend is neither enabled by default nor built in supported
> configurations. The separate HAS_HWDOM_SYSTEM_SUSPEND policy bit only cha=
nges
> how ARM treats SHUTDOWN_suspend from the hardware domain; it does not ena=
ble
> the host-wide suspend backend by itself.
>
> This version is ported to Xen master and includes extensive improvements
> based on reviewer feedback. The patch series restructures code to improve
> robustness and maintainability, and implements initial ARM64 host-wide
> Suspend-to-RAM support driven by control-domain PSCI SYSTEM_SUSPEND
> requests. vPSCI also exposes SYSTEM_SUSPEND as a domain suspend operation
> for all domains; attempt-time host-suspend policy failures are reported a=
s
> PSCI_DENIED rather than hidden through PSCI_FEATURES.
>
> Key updates in this series:
>  - Introduced architecture-specific suspend/resume infrastructure
>  - Integrated GICv2/GICv3 suspend and resume, including memory-backed con=
text
>    save/restore with error handling
>  - Added time and IRQ suspend/resume hooks, ensuring correct timer/interr=
upt
>    state across suspend cycles
>  - Implemented proper PSCI SYSTEM_SUSPEND invocation and version checks
>  - Added vPSCI SYSTEM_SUSPEND policy for domain suspend and host-wide
>    control-domain sequencing
>  - Improved state management and recovery in error cases during suspend/r=
esume
>  - Added support for IPMMU-VMSA/SMMUv3 context save/restore
>  - Added support for GICv3 eSPI registers context save/restore
>  - Added support for ITS registers context save/restore
> ---
>
> Link to CI: https://gitlab.com/xen-project/people/mykola_kvach/xen/-/pipe=
lines/2796733872
> ---
>
> TODOs:
>  - Enable "xl suspend" support on ARM
>  - Add suspend/resume CI test for ARM (QEMU if feasible)
>  - PCI suspend ?
> ---
>
> Detailed changelogs can be found in each patch.
>
> Changes in v12:
> - Rebase onto the latest master.
> - Updated patch 12; all other patches are unchanged.
>   No functional changes.
>
> Changes in v11:
> - Keep SMMUv3 reset helpers in init text when CONFIG_SYSTEM_SUSPEND is
>   disabled.
> - Update host suspend policy blockers after review: make the runtime gate
>   __ro_after_init, log the SMMUv3 MSI blocker only once, and wrap the Arm
>   IOMMU blocker in CONFIG_SYSTEM_SUSPEND.
>
> Changes in v10:
> - Clarify the vPSCI SYSTEM_SUSPEND policy summary: keep SYSTEM_SUSPEND
>   advertised once implemented and return PSCI_DENIED, rather than
>   PSCI_NOT_SUPPORTED, for attempt-time host-suspend policy failures.
> - Tighten GICv2/GICv3 suspend/resume based on review feedback: avoid
>   reserved interrupt register ranges, check visible active-priority state=
,
>   restore configuration before enable state, and re-enable the redistribu=
tor
>   before restoring CPU/virtual interface state on abort paths.
> - Refine ITS resume so MAPC is replayed only for ITS-backed collections a=
nd
>   clarify the collection-ID assumptions.
> - Rework IPMMU and SMMUv3 resume/suspend handling, including root-before-=
cache
>   IPMMU restore ordering and disabling SMMU interrupt generation before
>   suspend.
> - Save and restore CNTHCTL_EL2 in the arm64 CPU resume context and simpli=
fy
>   the resume trampoline/context hand-off.
> - Re-apply boot CPU errata/workaround handling after SYSTEM_SUSPEND and m=
ove
>   set_init_ttbr() declaration to asm/mmu/mm.h.
> - Update patch 12 details: shorten SYSTEM_SUSPEND blocker logs, use %pd f=
or
>   control-domain logging, mark serial_suspend_available as __ro_after_ini=
t,
>   and mention the xen/suspend.h struct domain forward declaration.
>
> Changes in v9:
> - Split the control-domain SYSTEM_SUSPEND flow so host availability,
>   runtime blockers and domain-readiness checks are handled separately fro=
m
>   the host suspend backend.
> - Gate vPSCI SYSTEM_SUSPEND on cached host PSCI support and Xen runtime
>   suspend blockers, and log firmware support during initialization.
> - Fold the arm64 resume trampoline into the CPU context save/restore patc=
h
>   and use asm-offsets-generated RESUME_CTX_* definitions for the assembly
>   save/restore path.
> - Tighten the GICv2/GICv3/ITS/IPMMU/SMMUv3 suspend/resume paths based on
>   review feedback, including state-save/restore fixes and safer failure
>   handling.
> - Reorder the host suspend/resume phases so timer and GIC state are
>   handled with local IRQs disabled and restored before console/IOMMU
>   resume.
>
> Changes in v8:
> - Rebased to latest master and refreshed the series accordingly.
> - Added a new GICv3 patch to tolerate retained redistributor LPI state
>   across CPU_OFF/CPU_ON.
> - GICv2 suspend now disables the CPU interface and distributor before
>   saving state.
> - GICv3 suspend/resume fixes the redistributor base used for LPI state.
> - ITS and SMMUv3 suspend/resume paths were tightened, with safer
>   restore/rollback handling and stricter fatal-error handling.
> - System suspend now checks that all domains are already in
>   SHUTDOWN_suspend before proceeding, and renames the hardware-domain
>   suspend capability/helper for clearer semantics.
> - Fixed alignment/cleanup issues in the low-level suspend/resume code.
>
> Changes in v7:
> - Timer helper renamed/clarified; virtual/hyper/phys handling documented.
> - GICv2 uses one context block; restore saved CTLR; panic on alloc failur=
e.
> - GICv3/eSPI/ITS always suspend/resume; restore LPI/eSPI; rdist timeout.
> - IPMMU suspend context allocated before PCI setup.
> - System suspend: control domain drives host suspend.
> - Dropped v6 IRQ descriptor restore patches; use setup_irq and re-registe=
r
>   local IRQs on resume instead.
>
> For earlier changelogs, please refer to the previous cover letters.
>
> Mirela Simonovic (5):
>   xen/arm: Add suspend and resume timer helpers
>   xen/arm: gic-v2: Implement GIC suspend/resume functions
>   xen/arm64: Save/restore CPU context across SYSTEM_SUSPEND
>   xen/arm: Implement PSCI SYSTEM_SUSPEND call (host interface)
>   xen/arm: Add host system suspend backend
>
> Mykola Kvach (7):
>   xen/arm: gic-v3: tolerate retained redistributor LPI state across
>     CPU_OFF
>   xen/arm: gic-v3: Implement GICv3 suspend/resume functions
>   xen/arm: gic-v3: add ITS suspend/resume support
>   xen/arm: tee: keep init_tee_secondary() for hotplug and resume
>   xen/arm: ffa: fix notification SRI across CPU hotplug/suspend
>   xen/arm: smmu-v3: add suspend/resume handlers
>   xen/arm: Add vPSCI SYSTEM_SUSPEND policy
>
> Oleksandr Tyshchenko (1):
>   iommu/ipmmu-vmsa: Implement suspend/resume callbacks
>
>  xen/arch/arm/Kconfig                     |   2 +
>  xen/arch/arm/Makefile                    |   1 +
>  xen/arch/arm/arm64/asm-offsets.c         |  21 +
>  xen/arch/arm/arm64/head.S                | 122 ++++++
>  xen/arch/arm/cpuerrata.c                 |   7 +-
>  xen/arch/arm/gic-v2.c                    | 226 +++++++++++
>  xen/arch/arm/gic-v3-its.c                | 146 ++++++-
>  xen/arch/arm/gic-v3-lpi.c                |  80 +++-
>  xen/arch/arm/gic-v3.c                    | 482 ++++++++++++++++++++++-
>  xen/arch/arm/gic.c                       |  35 ++
>  xen/arch/arm/include/asm/arm64/sysregs.h |   5 +
>  xen/arch/arm/include/asm/cpuerrata.h     |   1 +
>  xen/arch/arm/include/asm/gic.h           |  16 +
>  xen/arch/arm/include/asm/gic_v3_defs.h   |   3 +
>  xen/arch/arm/include/asm/gic_v3_its.h    |  28 ++
>  xen/arch/arm/include/asm/mmu/mm.h        |   2 +
>  xen/arch/arm/include/asm/psci.h          |   4 +
>  xen/arch/arm/include/asm/suspend.h       |  37 ++
>  xen/arch/arm/include/asm/time.h          |   5 +
>  xen/arch/arm/mmu/smpboot.c               |   2 +-
>  xen/arch/arm/psci.c                      |  38 +-
>  xen/arch/arm/suspend.c                   | 210 ++++++++++
>  xen/arch/arm/tee/ffa_notif.c             |  63 ++-
>  xen/arch/arm/tee/tee.c                   |   2 +-
>  xen/arch/arm/time.c                      |  44 ++-
>  xen/arch/arm/vpsci.c                     | 120 +++++-
>  xen/common/Kconfig                       |   3 +
>  xen/common/domain.c                      |   7 +-
>  xen/drivers/char/serial.c                |  12 +
>  xen/drivers/passthrough/arm/iommu.c      |   6 +
>  xen/drivers/passthrough/arm/ipmmu-vmsa.c | 323 ++++++++++++++-
>  xen/drivers/passthrough/arm/smmu-v3.c    | 203 ++++++++--
>  xen/include/xen/list.h                   |  14 +
>  xen/include/xen/serial.h                 |   1 +
>  xen/include/xen/suspend.h                |   2 +
>  35 files changed, 2169 insertions(+), 104 deletions(-)
>  create mode 100644 xen/arch/arm/suspend.c
>
> --
> 2.43.0
>
>

