Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90F33C5AC67
	for <xen-devel@archiver.kernel.org>; Thu,  6 Aug 2026 23:36:49 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1385265.1627683 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ws7dV-0006aJ-0d; Thu, 06 Aug 2026 23:36:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1385265.1627683; Thu, 06 Aug 2026 23:36:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ws7dU-0006aB-TV; Thu, 06 Aug 2026 23:36:28 +0000
Received: by outflank-mailman (input) for mailman id 1385265;
 Thu, 06 Aug 2026 23:36:27 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <3dxp1agYKCdoOA6JF8CKKCHA.8KITAJ-9ARAHHEOPO.TAJLNKFA8P.KNC@flex--seanjc.bounces.google.com>)
 id 1ws7dT-0006Zy-Lz
 for xen-devel@lists.xenproject.org; Thu, 06 Aug 2026 23:36:27 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1ws7dS-00BpFw-9T
 for xen-devel@lists.xenproject.org; Fri, 07 Aug 2026 01:36:26 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <3dxp1agYKCdoOA6JF8CKKCHA.8KITAJ-9ARAHHEOPO.TAJLNKFA8P.KNC@flex--seanjc.bounces.google.com>)
 id 6a751a68-2eae-0a2a0a5409dd-0a2a4503dca0-10
 for <xen-devel@lists.xenproject.org>; Fri, 07 Aug 2026 01:36:26 +0200
Received: from [209.85.216.69] (helo=mail-pj1-f69.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <3dxp1agYKCdoOA6JF8CKKCHA.8KITAJ-9ARAHHEOPO.TAJLNKFA8P.KNC@flex--seanjc.bounces.google.com>)
 id 6a751a78-fae8-0a2a45030019-d155d845e936-3
 for <xen-devel@lists.xenproject.org>; Fri, 07 Aug 2026 01:36:26 +0200
Received: by mail-pj1-f69.google.com with SMTP id
 98e67ed59e1d1-38dbf293831so5540470a91.3
 for <xen-devel@lists.xenproject.org>; Thu, 06 Aug 2026 16:36:25 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=google.com header.i="@google.com" header.h="Content-Type:Cc:To:From:Subject:Message-ID:Mime-Version:Date:Reply-To"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786059384; x=1786664184; darn=lists.xenproject.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :reply-to:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=keDa3uiMUyNdngDUOX3bQBFQQi+1yM63Rcdpk9ukwB4=;
        b=evNv5RETlj1UOHaSOKKCIijsDCTxuFZDIAZT3RVZZLC5O6ov2gBfb8+QnUjAWSx+Sg
         lKcA1ZpM5Kp1DmprbJ7LuHbp05r6bLJfcW1pjPgnKVm9olO81iDNlew5MimIrOnaEDQt
         JML5n+xAmY+7syhDwI12nFuqbKO+f0R14jRMLrP+dodG/VvW0FBcout0pr7emD1FTl0U
         VWtjKgDf0+aUEKrFfoX8sDmlabfHyugIWy3hV3wprr4r4/xatFHuU6Po86yNK4vD3DO4
         MQ9nWf18H1/hh2aqU/tK1xhi0/YnN4TmRL6AbtbNYKgXBdEqyubzSdkY9EOnvSQnRoEy
         oSBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786059384; x=1786664184;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=keDa3uiMUyNdngDUOX3bQBFQQi+1yM63Rcdpk9ukwB4=;
        b=NLQpp7U35yRcC+4JqKrhWnDeHPzIVmso/SDR/A7B0OSbwAUJ5qVFK165T51kZVaSGi
         BZplOnYGaHZpxNyk6Of59e9H/bqCW21EgpZ2U3AKpAWct6BGnWXoFKZa5RM1cey+aH4y
         fmRPP252nNPQy8mMJ8Rtc2nD4ee1LW7PhVHEqap822YLvOQ6SJDbp26pT/8WIdEhvfIT
         ND8jPoO7SBmpFmWAeRr/S55Vs91LFgy5VXDG7s1kuQwbRbQzTD4p1hkUrM2uDEUiCyv1
         a8yNRHil3AbQDWLGO9fol4TMxe3FYx/ESk6FWApJwDcoEsoBrF5yIyyInnCQgvDx/56w
         K64w==
X-Forwarded-Encrypted: i=1; AHgh+RrC8bAWgq5QcqyZ54Do+hmbbJR6LWfMeIlRR7u+qAYTM56/bP5glrhRCx9/UFMaUxWqfFjCb7jjzOM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxB+yCS0RNvhEOs8ffWXO2QqK/PU4Rtwf5JZJUHy/gJigVk6uut
	9lsXOKP3NIX7CPFvgbsep0T5YiXWtXWqQjQJSoAd0IR+IK7fltLQLSDxvSiOFZsJoUvzecYeabw
	YCoeIJQ==
X-Received: from pjnu1.prod.google.com ([2002:a17:90a:8901:b0:383:c59b:fc00])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:278c:b0:381:792d:f993
 with SMTP id 98e67ed59e1d1-3903c5bf6fbmr20025179a91.17.1786059383863; Thu, 06
 Aug 2026 16:36:23 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu,  6 Aug 2026 16:35:17 -0700
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.679.g6767b8d81c-goog
Message-ID: <20260806233609.212337-1-seanjc@google.com>
Subject: [PATCH v6 00/51] x86: Try to wrangle PV clocks vs. TSC
From: Sean Christopherson <seanjc@google.com>
To: Kiryl Shutsemau <kas@kernel.org>, Rick Edgecombe <rick.p.edgecombe@intel.com>, 
	Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	"K. Y. Srinivasan" <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
	Dexuan Cui <decui@microsoft.com>, Long Li <longli@microsoft.com>, 
	Ajay Kaher <ajay.kaher@broadcom.com>, Alexey Makhalov <alexey.makhalov@broadcom.com>, 
	Jan Kiszka <jan.kiszka@siemens.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Juergen Gross <jgross@suse.com>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	John Stultz <jstultz@google.com>
Cc: Vitaly Kuznetsov <vkuznets@redhat.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, Stephen Boyd <sboyd@kernel.org>, 
	Miroslav Lichvar <mlichvar@redhat.com>, x86@kernel.org, linux-coco@lists.linux.dev, 
	kvm@vger.kernel.org, linux-hyperv@vger.kernel.org, 
	virtualization@lists.linux.dev, linux-kernel@vger.kernel.org, 
	xen-devel@lists.xenproject.org, Michael Kelley <mhklinux@outlook.com>, 
	Tom Lendacky <thomas.lendacky@amd.com>, Nikunj A Dadhania <nikunj@amd.com>, 
	David Woodhouse <dwmw@amazon.co.uk>, David Woodhouse <dwmw2@infradead.org>, 
	Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
X-purgate-ID: tlsNG-33051d/1786059386-766FB4E9-CEA7D76F/0/0
X-purgate-type: clean
X-purgate-size: 11039

The primary goal of this series to fix flaws with SNP and TDX guests where a
PV clock provided by the untrusted hypervisor is used instead of the secure
TSC that is controlled by trusted firmware.

The secondary goal is modernize running under KVM.  Currently, KVM guests will
use TSC for clocksource, but not sched_clock.  And Linux-as-a-KVM-guest doesn't
support paravirt enumeration of the TSC/APIC frequencies, even though QEMU
provides that information by default.

The tertiary goal is to clean up the PV clock code to deduplicate logic across
hypervisors, and to hopefully make it all easier to maintain going forward.

The quaternary goal is to clean up the TSC calibration code, which was made
stupidly hard to follow by hypervisor code mixing in with the native
calibration routines, instead of being implemented as a pure alternative.

Note, the VMware and Xen changes still probably should get acks from those
maintainers, as my understanding of what they're trying to do may be flawed.

Lots more background on the SNP/TDX motiviation:
https://lore.kernel.org/all/20250106124633.1418972-13-nikunj@amd.com

As before, I deliberately omitted jailhouse-dev@googlegroups.com from the To/Cc,
as those emails bounced on v1, AFAICT nothing has changed.

v5:
 - Use cpu_feature_enabled() instead of boot_cpu_has(). [Boris]
 - WARN if recalibrate_cpu_khz() runs on a system with TSC_KNOWN_FREQ. [Thomas]
 - Opportunistically drop a line break in native_calibrate_tsc(). [Thomas]
 - Rely on callers of cpuid_get_tsc_info() to check the result instead of
   unnecessarily zeroing the structure. [Boris]
 - Ignore tsc_early_khz if the TSC frequency is provided by trusted firmware
   or by the hypervisor. [Thomas, Sashiko]
 - Cache CPUID output in acrn_init_platform() to avoid introducing a transient
   bug where TSC_KNOWN_FREQ could be set even if the ACRN hypervisor didn't
   actually provide the frequency. [Sashiko]
 - Drop kvmclock's useless/dead check_tsc_unstable() call (it occurs before the
   command line parameter is parsed). [Sashiko]
 - Add helpers to set lapic_timer_period, to fix not-so-theoretical overflow
   in the various "khz * 1000 / HZ" patterns. [Sashiko]
 - Drop the "x86/xen: Obtain TSC frequency from CPUID if present" patch as it
   doesn't have any dependencies/conflicts on/with this series, and Sashiko had
   concerns about the assumptions it was making. [Sashiko]
 - Collect reviews. [David] (Kirill's got dropped because the patch he reviewed
   got completely rewritten).


v4:
 - Use x86_init_noop() to skip save/restore on VMware and Xen instead of
   nullifying x86_platform.{save,restore}_sched_clock_state. [Sashiko]
 - Use '0' to indicate "failure" when getting the CPU frequency from CPUID, to
   avoid using an out-param and thus make it all but impossible to
   unintentionally clobber the global cpu_khz (which v3 did). [Sashiko]
 - Rename cpuid_get_cpu_freq() => __cpu_khz_from_cpuid() to capture its
   relationship with cpu_khz_from_cpuid().
 - Compute lapic_timer_period in units of ticks, not Khz. [Sashiko]
 - Kill off x86_platform_ops.calibrate_{cpu,tsc}(), and instead use dedicated
   hooks for hypervisor code, and direct calls for TDX and SNP. [David, loosely]
 - Drop SNP's secure TSC override of _CPU_ calibration, as there's zero
   evidence it's justified or a net positive.
 - Collect reviews/acks. [David, Wei]
 - Decouple getting TSC/APIC frequencies from KVM PV CPUID from kvmclock. [David]
 - Fix an amusing number of Opportunistically misspellings. [David]
 - Set kvm_sched_clock_offset _before_ registering kvmclock as sched_clock,
   and add a comment to guard against future goofs. [Sashiko]
 - Keep "setup_force_cpu_cap(X86_FEATURE_TSC_RELIABLE)" in Hyper-V's handling
   of HV_ACCESS_TSC_INVARIANT, as it's technically possible to have a VM
   with HV_ACCESS_TSC_INVARIANT but not HV_ACCESS_FREQUENCY_MSRS.  Though as
   a _very_ nice side effect of using dedicated sequencing for selecting the
   TSC frequency source, this would have naturally happened anyways. [Sashiko]

v3:
 - https://lore.kernel.org/all/20260515191942.1892718-1-seanjc@google.com
 - Collect reviews. [Michael, Thomas]
 - Use Hyper-V reference counter / refcounter instead of Hyper-V timer. [Michael]
 - Use the paravirt CPUID interface first proposed by VMware for KVM's
   "official" mechanism for communicating frequency to KVM-aware guests,
   instead of abusing Intel's CPUID leafs. [David]
 - Deal with paravirt code being moved into asm/timers.h and
   arch/x86/kernel/tsc.c.

v2:
 - https://lore.kernel.org/all/Z8YWttWDtvkyCtdJ@google.com
 - Add struct to hold the TSC CPUID output. [Boris]
 - Don't pointlessly inline the TSC CPUID helpers. [Boris]
 - Fix a variable goof in a helper, hopefully for real this time. [Dan]
 - Collect reviews. [Nikunj]
 - Override the sched_clock save/restore hooks if and only if a PV clock
   is successfully registered.
 - During resome, restore clocksources before reading persistent time.
 - Clean up more warts created by kvmclock.
 - Fix more bugs in kvmclock's suspend/resume handling.
 - Try to harden kvmclock against future bugs.

v1: https://lore.kernel.org/all/20250201021718.699411-1-seanjc@google.com

David Woodhouse (2):
  KVM: x86: Officially define CPUID 0x40000010 as PV Timing Info (TSC
    and Bus)
  x86/kvm: Obtain TSC frequency from PV CPUID if present

Sean Christopherson (49):
  x86/apic: Provide helpers to set local APIC timer frequency in hz and
    khz
  x86/apic: Add CONFIG_X86_LOCAL_APIC=n stubs for APIC timer frequency
    APIs
  x86/tsc: Ensure that TSC recalibration doesn't run if TSC frequency is
    known
  x86/tsc: Restrict recalibrate_cpu_khz() export to p4-clockmod and
    powernow-k7
  x86/sev: Mark TSC as reliable when configuring Secure TSC
  x86/sev: Don't override CPU frequency calibration for SNP's Secure TSC
  x86/sev: Move check for SNP Secure TSC support to tsc_early_init()
  x86/sev: Shove SNP's secure/trusted TSC frequency directly into
    "calibration"
  x86/tsc: Add a standalone helper for getting TSC info from CPUID.0x15
  x86/tdx: Force TSC frequency with CPUID-based info provided by the
    TDX-Module
  x86/tsc: Add dedicated hypervisor hooks for getting known TSC/CPU
    frequencies
  x86/acrn: Register TSC/CPU frequency callbacks iff frequency is
    actually in CPUID
  x86/acrn: Mark TSC frequency as known when using ACRN for calibration
  x86/tsc: Consolidate forcing of X86_FEATURE_TSC_KNOWN_FREQ for PV code
  x86/tsc: Kill off x86_platform_ops.calibrate_{cpu,tsc}() hooks
  x86/tsc: Rename pit_hpet_ptimer_calibrate_cpu() =>
    native_calibrate_cpu_late()
  x86/tsc: Fold native_calibrate_cpu() into recalibrate_cpu_khz()
  x86/kvmclock: Rename kvm_get_tsc_khz() to kvmclock_get_tsc_khz()
  x86/kvmclock: Drop dead check on TSC being unstable during
    kvmclock_init()
  x86/kvm: Mark TSC as reliable when it's constant and nonstop
  x86/tsc: Add standalone helper for getting CPU frequency from CPUID
  x86/kvm: Get CPU base frequency from CPUID when it's available
  clocksource: hyper-v: Register sched_clock save/restore iff it's
    necessary
  clocksource: hyper-v: Drop wrappers to sched_clock save/restore
    helpers
  clocksource: hyper-v: Don't save/restore TSC offset when using HV
    sched_clock
  x86/kvmclock: Setup kvmclock for secondary CPUs iff CONFIG_SMP=y
  x86/kvm: Don't disable kvmclock on BSP in syscore_suspend()
  x86/paravirt: Remove unnecessary PARAVIRT=n stub for
    paravirt_set_sched_clock()
  x86/paravirt: Move handling of unstable PV clocks into
    paravirt_set_sched_clock()
  x86/kvmclock: Move sched_clock save/restore helpers up in kvmclock.c
  x86/xen/time: NOP-ify x86_platform's sched_clock save/restore hooks
  x86/vmware: NOP-ify save/restore hooks when using VMware's sched_clock
  x86/tsc: WARN if TSC sched_clock save/restore used with PV sched_clock
  x86/paravirt: Pass sched_clock save/restore helpers during
    registration
  x86/kvmclock: Move kvm_sched_clock_init() down in kvmclock.c
  x86/xen/time: Mark xen_setup_vsyscall_time_info() as __init
  x86/pvclock: Mark setup helpers and related various as
    __init/__ro_after_init
  x86/pvclock: WARN if pvclock's valid_flags are overwritten
  x86/kvmclock: Refactor handling of PVCLOCK_TSC_STABLE_BIT during
    kvmclock_init()
  timekeeping: Resume clocksources before reading persistent clock
  x86/kvmclock: Hook clocksource.suspend/resume when kvmclock isn't
    sched_clock
  x86/kvmclock: WARN if wall clock is read while kvmclock is suspended
  x86/paravirt: Mark __paravirt_set_sched_clock() as __init
  x86/paravirt: Plumb a return code into __paravirt_set_sched_clock()
  x86/paravirt: Don't use a PV sched_clock in CoCo guests with trusted
    TSC
  x86/kvmclock: Use TSC for sched_clock if it's constant and non-stop
  x86/kvmclock: Plumb in AP-online and BSP-resume to kvmlock, for
    documentation
  x86/paravirt: Move using_native_sched_clock() stub into timer.h
  x86/kvm: Get local APIC bus frequency from PV CPUID Timing Info

 .../admin-guide/kernel-parameters.txt         |   5 +
 Documentation/virt/kvm/x86/cpuid.rst          |  12 +
 arch/x86/coco/sev/core.c                      |  21 +-
 arch/x86/coco/tdx/tdx.c                       |  19 +-
 arch/x86/include/asm/acrn.h                   |   5 -
 arch/x86/include/asm/apic.h                   |   5 +-
 arch/x86/include/asm/kvm_para.h               |  12 +-
 arch/x86/include/asm/sev.h                    |   4 +-
 arch/x86/include/asm/tdx.h                    |   2 +
 arch/x86/include/asm/timer.h                  |  15 +-
 arch/x86/include/asm/tsc.h                    |  10 +-
 arch/x86/include/asm/x86_init.h               |   8 +-
 arch/x86/include/uapi/asm/kvm_para.h          |  11 +
 arch/x86/kernel/apic/apic.c                   |  19 +-
 arch/x86/kernel/cpu/acrn.c                    |  14 +-
 arch/x86/kernel/cpu/mshyperv.c                |  70 +-----
 arch/x86/kernel/cpu/vmware.c                  |  19 +-
 arch/x86/kernel/jailhouse.c                   |   9 +-
 arch/x86/kernel/kvm.c                         | 101 ++++++--
 arch/x86/kernel/kvmclock.c                    | 208 +++++++++++------
 arch/x86/kernel/pvclock.c                     |   9 +-
 arch/x86/kernel/tsc.c                         | 218 +++++++++++-------
 arch/x86/kernel/tsc_msr.c                     |   4 +-
 arch/x86/kernel/x86_init.c                    |   2 -
 arch/x86/mm/mem_encrypt_amd.c                 |   3 -
 arch/x86/xen/time.c                           |  14 +-
 drivers/clocksource/hyperv_timer.c            |  38 ++-
 include/clocksource/hyperv_timer.h            |   2 -
 kernel/time/timekeeping.c                     |   9 +-
 29 files changed, 547 insertions(+), 321 deletions(-)


base-commit: 6949feed6e32823a6628873000602988a4cafe06
-- 
2.55.0.679.g6767b8d81c-goog


