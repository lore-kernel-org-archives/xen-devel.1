Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C00CBCA5FC7
	for <xen-devel@archiver.kernel.org>; Wed, 30 Sep 2026 16:19:55 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1437470.1656341 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBx1q-0005G1-ID; Wed, 30 Sep 2026 16:19:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1437470.1656341; Wed, 30 Sep 2026 16:19:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBx1q-0005Fu-FZ; Wed, 30 Sep 2026 16:19:34 +0000
Received: by outflank-mailman (input) for mailman id 1437470;
 Wed, 30 Sep 2026 16:19:33 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xBx1o-0005Ej-N4
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2026 16:19:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xBx1n-006NEo-5M
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2026 18:19:31 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6abd3662-2eae-0a2a0a5409dd-0a2a450299bc-48
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 18:19:31 +0200
Received: from [74.125.225.76] (helo=mail-wr2-f12.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6abd3692-6ca4-0a2a45020019-4a7de14ce86c-3
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 18:19:31 +0200
Received: by mail-wr2-f12.google.com with SMTP id
 ffacd0b85a97d-4834977ae75so3424264f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 09:19:31 -0700 (PDT)
Received: from fedora (user-109-243-71-234.play-internet.pl. [109.243.71.234])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a01eb60804sm2807245e9.1.2026.09.30.09.19.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Sep 2026 09:19:29 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790785170; x=1791389970; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gnMN7lFzVR25lbffg6kYxX/M8blRDw2RLEq0rNXJkQM=;
        b=jj55LTiRIP32tAWzgjM/b9Fq0i51Qel/fE8b3PXGhbjKyDsU0Ko9z6HD6AupH2NeuC
         SoahBmx89S+FNooFo9/pNINvjKNvISnAJpryiVu2/CvWU2Mba7UeBUwPOGq6Nd2QeIS+
         eEnP0xZ6BS7Lyw7XuKkBp+kMM1lRhDZUUHxUFWKbpvmFMvBNX5qizxzVIpCt/8yvF4Sa
         GBZkXJU2ZdoY7ECYMXU4hze/iWlDocYNRdN0HAn63D7mkFrVTUZxN+pxsNwYz/PTS6qG
         BkEDhTdGc44GIEC3o5yrQ1pdXndLfjLz2kvnH0y8RhQKDtmKtoW74NjZusJamWP56eKX
         X3eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790785170; x=1791389970;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gnMN7lFzVR25lbffg6kYxX/M8blRDw2RLEq0rNXJkQM=;
        b=G0gAl4agdt/izStw2ccymm3lZIdERgZiYhg/TiiuTJR2EYy3NiZpSV1SSi92iEeTYK
         z21JSiy1SeILVh4WPwfGfoSPsGSwvunHQ5UegM9ELaxpSxesHsGOnE9u0nL4xJehB04j
         1obdhluTHMM4xIJGin5Lezk7GIJCmM6uJQ7AAeHWfUtCVMJFroZjBhOVkBkGRzR3u5At
         zq9Aw8v6GAmJvlFXYw8U/2WpI/8dgLQG5czyV1chHuKRIYOSev1l9ciTQyTw9w7vChqY
         idQkPJkAF6sJhRqwsScF2s1uGXQ+GlfRmtcShftLXqcqoZLljzQwk2h94/mU+U4cFB9k
         5n7A==
X-Gm-Message-State: AFuF++lIianI2kAuXWSvFI9W5+KhjSzxFFZihyCgdQFU9NyKj+ZC3Awk
	v79TYK1LNcA6/PRGUVC18Vp5tJGhCW6IZ/O5yWBwxaroSwk2B05llSFB8x9K7Q==
X-Gm-Gg: AYBFou2rb0tGkgjYhg503EFmSYzxu6mNkXAOTXRshEhaw7ih7agz3w8kAh+SH9f0ZEk
	VGFcrakdJY/khj6rmgt/hKGz6nM1YktSLaCyE1wWsJIqx2QikDberrdtpjn/FuCfZTMAFcmO6Ea
	IEgEecyaWNcZo8zDzqw4zeDDFazq0OAY/gHWZ1703CfeWjPCZv5IuYE1YfL//WlvGQ20YQnUWHs
	fts+w/mPKFuT/tv60wfd6neXfceV4IA0kZxLzt0xcIR+/e52GiSHu04xDzZesS7HKijEHq/asbx
	TeCzNEOT5OnEIXk3wtNbMU0Teuc3+HcY+paAiDF24987/ozCquiMSdwjvSI5mVtkUWmquM3ljYM
	hulFFu6pliQMZ0IXQTWF3P9BAOlNiczo1whAsbtfG9HgCmVgbuyIxvvlX4CwsH/Gr8nQtjsTqXg
	g0Zu1Co83Tr3p3WXJimrSJltgYBq3ii1gpJJXV/BASTHgi/ZbKwEdNsNaKEpLA3QO7hNEj/0ErP
	3DfkQQ+eDGccnQlr0LW8Bf+D377qLggUZJlPk1j
X-Received: by 2002:a05:600c:a40a:b0:49f:fd2d:23c7 with SMTP id 5b1f17b1804b1-4a01b12384emr31940035e9.27.1790785170366;
        Wed, 30 Sep 2026 09:19:30 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
	Baptiste Le Duc <baptiste.le-duc@vates.tech>,
	Zheng Zhang <zhangzheng@iscas.ac.cn>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v3 00/39] [PATCH v2 00/39] [RISC-V] virtual interrupt controller (vAPLIC/vIMSIC) support
Date: Wed, 30 Sep 2026 18:18:42 +0200
Message-ID: <cover.1790779209.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-720697/1790785171-F08A42AC-23E852D2/10/73395122804
X-purgate-type: spam
X-purgate-size: 12677

Hi all,

This series adds the initial virtual interrupt controller (vINTC) support
for RISC-V guests in Xen, based on the Advanced Interrupt Architecture
(AIA): a virtual APLIC (vAPLIC) in MSI mode backed by a virtual IMSIC
(vIMSIC) using hardware guest interrupt files.

Rather than emulating APLIC in direct-delivery mode (which requires
trap-and-emulate for every interrupt and is costly), the series targets
IMSIC from the start. AIA lets a hart implement several "guest interrupt
files" (up to GEILEN), so external interrupts can be delivered to a vCPU
directly by hardware via the VGEIN field of hstatus, without a hypervisor
round-trip. Xen only has to emulate the APLIC MMIO programming interface
and route the guest's intent onto the physical MSI topology; interrupt
delivery itself stays in hardware.

The work breaks down into a few logical blocks:

Preparatory fixes and cleanups (patches 1-6)
  - Drop the unused pregs field of struct cpu_user_regs and bug.h's
    duplicate instruction length helpers.
  - Program hstatus.VSXL explicitly, as decoding a trapped instruction
    depends on the effective XLEN of the guest.
  - csr_read64() as the counterpart of csr_write64(), used for CSR_TIME so
    that get_cycles() no longer truncates the time counter on RV32, and
    UINT64_MAX rather than ULONG_MAX to disable the VS-timer.
  - Request a G-stage flush on vmenter where VMIDs are unavailable, so a
    domain cannot run on the translations left behind by the one which ran
    on that hart before it.

APLIC groundwork and vAPLIC MMIO emulation (patches 7-11)
  - Add the missing APLIC register offsets/masks needed by both the
    physical and virtual APLIC code, rearranging asm/aplic.h in the style
    of x86's asm/msr-index.h (no functional change).
  - A per-domain MMIO handler table modelled on Arm's framework, so
    emulated devices self-register their GPA ranges and the fault path
    stays agnostic via a single try_handle_mmio() entry point.
  - vAPLIC MMIO read/write emulation. Writes are gated by the domain's
    authorised-IRQ bitmap so a guest cannot touch interrupts it does not
    own, and TARGET writes are translated from virtual to physical
    hart/guest-file indices. Delegation (SOURCECFG.D) is not yet
    supported.
  - Build the physical APLIC's target hart index with aplic_hart_field()
    as well, dropping the last in-tree duplicate of the AIA hart index
    formula, and add a helper to test for APLIC MSI mode.

vCPU context switching (patches 12-15)
  - context_switch() and the helpers it needs: save/restore of H/VS CSRs,
    the virtual timer and P2M context, and __context_switch() in assembly.
    The VMID is claimed in p2m_ctxt_switch_to() rather than at the next
    guest entry, which leaves p2m_handle_vmenter() with nothing to do.
  - Save and restore the AIA CSRs a guest can change (vsiselect and
    hviprio{1,2}), gated by hstateen0 where Smstateen is implemented.
  - vintc_ctxt_switch_{from,to}() wrappers over new ctxt_switch_{from,to}
    hooks in struct vintc_ops, called from the context switch path, plus
    the IMSIC implementation of those hooks: it records which pCPU owns a
    vCPU's guest interrupt file, as the pCPU id is part of the MSI
    address.

Trap and instruction emulation infrastructure (patches 16-26)
  - Extend the exception-table format with type/data fields and add
    EX_TYPE_TRAP_INFO so fixups can capture sepc/scause/stval, and look
    the table up for any trap taken in Xen context rather than for illegal
    instructions only, so that the hlv/hlvx sequences reach their fixup.
  - A guest page-fault handler, and trap_redirect() to forward a
    synchronous trap back into the guest's VS-mode handler for the faults
    which can never become an emulated access.
  - Resolve the faulting guest physical address from htval and stval,
    which first needs Shtvala to be detected, and define all four
    INSN_PSEUDO_VS_* values independently of the hypervisor's XLEN, so
    that a fault taken on an implicit VS-stage access is recognized as one
    rather than mistaken for an MMIO trap.
  - riscv_read_guest() (HLV/HLVX) to read guest memory and instructions
    safely, the decoding helpers shared by both access types, and the load
    and store emulation which dispatches the access through
    try_handle_mmio().

vCPU migration between pCPUs (patches 27-34) (introduced here for better context
of VGEIN fumctions usage)
  - arch_move_irqs(), dispatching through a new move_irqs hook in
    struct vintc_ops down to imsic_migrate_vcpu(), and the case where a
    vCPU has no guest interrupt file to move yet.
  - The move of a vCPU's IMSIC guest interrupt file itself, following the
    sequence the AIA spec prescribes: quiesce and save eidelivery/
    eithreshold of the old file, zero the new one, G-stage remap it,
    retarget the domain's APLIC interrupts at it
    (aplic_reconfigure_target()) and fence off straggler MSIs with a
    genmsi barrier, dump the old file's eip/eie arrays to memory, then
    restore that state into the new file and update the vCPU's
    hstatus.VGEIN.

VGEIN allocation and vCPU bring-up (patches 35-39)
  - Per-pCPU VGEIN (guest interrupt file) allocator: a bitmap of the files
    a hart implements (up to GEILEN) with helpers to assign and release
    one, and an owners[] map so a file reported pending in HGEIP can be
    traced back to the vCPU it belongs to.
  - Watch a descheduled vCPU's guest interrupt file through HGEIE, so that
    a guest blocked on an external interrupt is woken up instead of
    waiting for an unrelated event to schedule it again.
  - Stage-2 map a vCPU's physical guest interrupt file to the fixed
    per-vCPU GPA page the guest expects at offset 0.
  - continue_new_vcpu(): switch to the idle vCPU's own stack for the idle
    vCPU, and enter the guest through the new return_to_new_vcpu() path in
    entry.S for a guest one.
  - imsic_vsfile_attach(), called once the pCPU a vCPU will run on is
    known: it assigns a VGEIN, maps the guest interrupt file and records
    the IMSIC state as a consistent unit.

CI tests: https://gitlab.com/xen-project/people/olkur/xen/-/pipelines/2897809275

---
Changes in v3:
 - Address the comments from ML.
 - New patches: "drop INSN_{16,32}BIT_MASK and report unknown instruction
   lengths", "set the domain type for 64-bit kernel images" and
   "introduce CPU_NONE" (used instead of NR_CPUS as "no CPU" marker).
 - Drop patch series dependecny as it was merged to upstream/staging.
---
Changes in v2:
 - The series has grown from 17 to 39 patches. vCPU context switching, vCPU
   migration between pCPUs and the vCPU bring-up path (continue_new_vcpu(),
   attaching an IMSIC h/w interrupt file) are now part of it to have better
   context of how things are using, together with the trap-side pieces the
   MMIO emulation depends on (faulting GPA resolution, Shtvala detection,
   instruction decoding).
 - vintc_state_{save,restore}() became vintc_ctxt_switch_{from,to}() and
   vcpu_aia_init() became imsic_vsfile_attach(); "xen/riscv: manage
   IRQ_DISABLED flag in APLIC irq enable/disable callbacks" is no longer part
   of this series. The remaining changes are described in the per-patch
   changelogs.
---

Oleksii Kurochko (39):
  xen/riscv: drop INSN_{16,32}BIT_MASK and report unknown instruction
    lengths
  xen/riscv: set the domain type for 64-bit kernel images
  xen/riscv: introduce csr_volatile_read64()
  xen/riscv: request a G-stage flush on vmenter when VMIDs are disabled
  xen/riscv: use ~0 instead of ULONG_MAX to disable the VS-timer
  xen/riscv: introduce device-agnostic MMIO emulation dispatch
  xen/riscv: introduce CPU_NONE
  xen/riscv: implement virtual APLIC MMIO emulation
  xen/riscv: build the target hart index via aplic_hart_index()
  xen/riscv: add helper to check APLIC MSI mode
  xen/riscv: implement vCPU context switching
  xen/riscv: save and restore vsiselect on vCPU context switch
  xen/riscv: introduce vintc_ctxt_switch_{from,to}()
  xen/riscv: add IMSIC vCPU context switch handlers
  xen/riscv: extend exception tables with type and data fields
  xen/riscv: decouple INSN_PSEUDO_VS_* from the hypervisor's XLEN
  xen/riscv: add guest page fault handling stub
  xen/riscv: implement trap redirection to a guest
  xen/riscv: detect Shtvala
  xen/riscv: resolve the faulting guest physical address
  xen/riscv: add guest memory read helper
  xen/riscv: look up the exception table for any trap taken in Xen
    context
  xen/riscv: add helpers for decoding a trapped load or store
  xen/riscv: add guest load emulation for trapped MMIO accesses
  xen/riscv: add guest store emulation for trapped MMIO accesses
  xen/riscv: introduce arch_move_irqs()
  xen/riscv: handle the case when no vCPU migration is needed
  xen/riscv: introduce vaplic_reconfigure_target()
  xen/riscv: prepare new IMSIC VS-file
  xen/riscv: implement APLIC-IMSIC-hart sync barrier for vCPU migration
  xen/riscv: remap interrupts to new IMSIC VS-file
  xen/riscv: save and clear the old IMSIC VS-file on vCPU migration
  xen/riscv: restore register state in the new IMSIC VS-file
  xen/riscv: add basic VGEIN management for AIA guests
  xen/riscv: wake up a descheduled vCPU on a guest external interrupt
  xen/riscv: map IMSIC interrupt file for vCPUs
  xen/riscv: implement continue_new_vcpu()
  xen/riscv: set the guest's XLEN explicitly in hstatus.VSXL
  xen/riscv: introduce IMSIC h/w interrupt file attaching to vcpu

 docs/misc/riscv/booting.txt                 |  11 +
 xen/arch/riscv/Makefile                     |   2 +
 xen/arch/riscv/aia.c                        | 185 +++++
 xen/arch/riscv/aplic-priv.h                 |   2 +
 xen/arch/riscv/aplic.c                      | 223 +++++-
 xen/arch/riscv/cpufeature.c                 |   1 +
 xen/arch/riscv/domain-build.c               |   8 +
 xen/arch/riscv/domain.c                     | 338 ++++++++-
 xen/arch/riscv/emulate.c                    | 588 ++++++++++++++++
 xen/arch/riscv/entry.S                      |  87 +++
 xen/arch/riscv/extable.c                    |  48 +-
 xen/arch/riscv/guestcopy.c                  |  88 +++
 xen/arch/riscv/imsic.c                      | 734 +++++++++++++++++++-
 xen/arch/riscv/include/asm/aia.h            |   7 +
 xen/arch/riscv/include/asm/aplic.h          |  41 +-
 xen/arch/riscv/include/asm/config.h         |   3 +
 xen/arch/riscv/include/asm/cpufeature.h     |   1 +
 xen/arch/riscv/include/asm/csr.h            |  40 ++
 xen/arch/riscv/include/asm/current.h        |   4 +
 xen/arch/riscv/include/asm/domain.h         |  23 +-
 xen/arch/riscv/include/asm/emulate.h        |  10 +
 xen/arch/riscv/include/asm/extable.h        |  61 +-
 xen/arch/riscv/include/asm/gpr-num.h        |  53 ++
 xen/arch/riscv/include/asm/guest_access.h   |   4 +
 xen/arch/riscv/include/asm/imsic.h          |  26 +-
 xen/arch/riscv/include/asm/intc.h           |  12 +
 xen/arch/riscv/include/asm/irq.h            |   5 +-
 xen/arch/riscv/include/asm/mmio.h           |  63 ++
 xen/arch/riscv/include/asm/p2m.h            |   1 -
 xen/arch/riscv/include/asm/processor.h      |  14 +-
 xen/arch/riscv/include/asm/regs.h           |  23 +-
 xen/arch/riscv/include/asm/riscv_encoding.h |  69 +-
 xen/arch/riscv/include/asm/setup.h          |   2 +
 xen/arch/riscv/include/asm/system.h         |   2 +
 xen/arch/riscv/include/asm/time.h           |   4 +-
 xen/arch/riscv/include/asm/traps.h          |   9 +
 xen/arch/riscv/include/asm/vaplic.h         |  22 +
 xen/arch/riscv/intc.c                       |  22 +
 xen/arch/riscv/kernel.c                     |   2 +
 xen/arch/riscv/mmio.c                       | 175 +++++
 xen/arch/riscv/p2m.c                        | 155 +++--
 xen/arch/riscv/riscv64/asm-offsets.c        |  19 +-
 xen/arch/riscv/setup.c                      |   2 +
 xen/arch/riscv/stubs.c                      |   5 -
 xen/arch/riscv/time.c                       |   4 +-
 xen/arch/riscv/traps.c                      | 108 ++-
 xen/arch/riscv/vaplic.c                     | 447 +++++++++++-
 xen/arch/riscv/vmid.c                       |   4 +-
 48 files changed, 3600 insertions(+), 157 deletions(-)
 create mode 100644 xen/arch/riscv/emulate.c
 create mode 100644 xen/arch/riscv/include/asm/emulate.h
 create mode 100644 xen/arch/riscv/include/asm/gpr-num.h
 create mode 100644 xen/arch/riscv/include/asm/mmio.h
 create mode 100644 xen/arch/riscv/mmio.c

-- 
2.55.0


