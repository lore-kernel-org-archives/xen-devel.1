Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99D54C61DC4
	for <xen-devel@archiver.kernel.org>; Thu, 27 Aug 2026 15:21:51 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1400919.1636540 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzbvC-00063H-KN; Thu, 27 Aug 2026 15:21:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1400919.1636540; Thu, 27 Aug 2026 15:21:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzbvC-00063A-Gw; Thu, 27 Aug 2026 15:21:42 +0000
Received: by outflank-mailman (input) for mailman id 1400919;
 Thu, 27 Aug 2026 15:21:41 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wzbvA-00060j-SL
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2026 15:21:40 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wzbv9-009ksf-OI
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2026 17:21:39 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a905601-2eae-0a2a0a5409dd-0a2a4504ba94-8
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 17:21:39 +0200
Received: from [209.85.128.42] (helo=mail-wm1-f42.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a905603-b57f-0a2a45040019-d155802ad095-3
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 17:21:39 +0200
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-49b392ccaacso11898515e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 08:21:39 -0700 (PDT)
Received: from fedora (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49b4b2d6b30sm57441155e9.14.2026.08.27.08.21.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Aug 2026 08:21:38 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1787844099; x=1788448899; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CBrU03USIPoQ/ePxJIOS375Vmn7ZObWJdkc5XcTcpQ8=;
        b=LieF0W/8qz841+4ydookV3pxrEidoLymCzDn8jN2shMoiVLDzXWaWZMA3P+rtNHoQt
         ZTstdvUYvvQ6fK5C/XMX7UF9/mAPt08VMb9JgetgWxgFrArWb+YmZard1YaefbtK9it8
         8+oJmFPac6DT3+PNZtqZkaRamqEujNec9FXvAzQeRm0WA6wMIArPu6xUkaP3gU+4GcuP
         g5/dYepgl3oima6jGpERVdnzYNwM2Rcmu+Pg7gh2gP15YAClXeU4PchaYQfgSdlUP6+e
         hQZQ2xbN6+AjO0t29rWQhnDZtr8U3axemh2MQ/NNCKYO9B7nN8zdZiStfJRXWZiadusQ
         w7Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787844099; x=1788448899;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CBrU03USIPoQ/ePxJIOS375Vmn7ZObWJdkc5XcTcpQ8=;
        b=W79N6gL73aOskMU2qmUts99pQGY1hyQ/hBprugOwv261Ey1DFE8zXpBh35I4DZOSLW
         7TGDB3Wswyay5RfVRsXrfLz9S0C7E4R3blF83EuYQffhAch7zdwVV+0n0yUWwP/NtbmG
         CGOR6pu+/V01C1n+zxp6q0cq6Fe7TBHcZO2//rOxmzquIsKhCTS29drl06+fGgEH5fDX
         3x19f/kirx62J0r1msHiZKJVIPNqji3SQia+0oIOAQtCOWsti7n07OQ50XJj9HeuIpfv
         xrAKtxyerKAnzXgwj3YoCMgaCpPXDOmHwxCqhoLOIVGac2u2yz1q85LJiWY5zeX/D3RH
         S+gA==
X-Gm-Message-State: AFuF++m1tbHOZQRSDQrTru65WOUEGhtGTH8S3mc9cy/8zv1oV+5elQiD
	s2qiRYUixM9jG3jKff4sp8SJGAa4XbYH6we7lmq0d+VkSj49MHjV0mu6C0gsXg==
X-Gm-Gg: AR+sD120Y44/n3cixcgtl8VYNSA3WcX3Zn7PkDyJWXnf259rM7gN5fJ+pp84s6RtoCe
	y+gBcRK+rRSp7j2HMghtsPUS7kiHmnV6uOC1xr86HzYJ103j7TP3lmQNIwbRcRu7kTJ3rDXrAOq
	us1oq+wxNhZtmxB0wy+Al6RkiDji4qnuTzSe2Tks2JDtMsCmM2ph/27ehib81GtAIUDBa++qFKm
	4OyNyypziRruiEzKZNTCx418bk8Qu3DDNOn3m6DHzKVwd3LLHtEQMQ/MqFMcPGPGQmVfQsnoPvB
	COgzis3ql5CYh9ZKRXOlIRMtktypLrC+YNXF21jaAIqsjNAt8i5coZuNHAsa3NT5tJDI72/SbBj
	D2QkwZYiyZ+Xwm93Mav28CjPK6MitKRz7y91WE0sAN1w8ab0Us3w5W0t3pLSgIaCxLzvVUxLL91
	qhigR/dj+daBB2ZiKoeZj3en/pHg3Lga/DuXx+XLZb5BwfhvXDN1JLFj/LyUwckzcdtoEV6gEoS
	1+Ppxb+let2c8RVOylEKd+eOcuYBBSS
X-Received: by 2002:a05:600c:3f08:b0:499:d513:e507 with SMTP id 5b1f17b1804b1-499dc6efdf9mr218483915e9.2.1787844099025;
        Thu, 27 Aug 2026 08:21:39 -0700 (PDT)
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
Subject: [PATCH v2 00/39] [RISC-V] virtual interrupt controller (vAPLIC/vIMSIC) support
Date: Thu, 27 Aug 2026 17:20:44 +0200
Message-ID: <cover.1787838835.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ebf023/1787844099-520D5B50-07880D69/10/73395122804
X-purgate-type: spam
X-purgate-size: 12149

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

CI tests: https://gitlab.com/xen-project/people/olkur/xen/-/pipelines/2796779115

The series depends on [1].

[1] https://lore.kernel.org/xen-devel/cover.1787836900.git.oleksii.kurochko@gmail.com/T/#t

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
  xen/riscv: drop pregs from struct cpu_user_regs
  xen/riscv: drop bug.h's duplicate instruction length helpers
  xen/riscv: set the guest's XLEN explicitly in hstatus.VSXL
  xen/riscv: introduce csr_read64()
  xen/riscv: request a G-stage flush on vmenter when VMIDs are disabled
  xen/riscv: use UINT64_MAX to disable the VS-timer
  xen/riscv: add missing APLIC register offsets, masks to asm/aplic.h
  xen/riscv: introduce device-agnostic MMIO emulation dispatch
  xen/riscv: implement virtual APLIC MMIO emulation
  xen/riscv: build the target hart index via aplic_hart_field()
  xen/riscv: add helper to check APLIC MSI mode
  xen/riscv: implement vCPU context switching
  xen/riscv: save and restore AIA state on vCPU context switch
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
  xen/riscv: introduce aplic_reconfigure_target()
  xen/riscv: prepare new IMSIC VS-file
  xen/riscv: implement APLIC-hart sync barrier for vCPU migration
  xen/riscv: remap interrupts to new IMSIC VS-file
  xen/riscv: dump old interrupt file to memory
  xen/riscv: restore register state in the new IMSIC VS-file
  xen/riscv: add basic VGEIN management for AIA guests
  xen/riscv: wake up a descheduled vCPU on a guest external interrupt
  xen/riscv: map IMSIC interrupt file for vCPUs
  xen/riscv: implement continue_new_vcpu()
  xen/riscv: introduce IMSIC h/w interrupt file attaching to vcpu

 xen/arch/riscv/Makefile                     |   2 +
 xen/arch/riscv/aia.c                        | 193 ++++++
 xen/arch/riscv/aplic-priv.h                 |   3 +
 xen/arch/riscv/aplic.c                      | 235 ++++++-
 xen/arch/riscv/cpufeature.c                 |   1 +
 xen/arch/riscv/domain.c                     | 271 +++++++-
 xen/arch/riscv/emulate.c                    | 578 ++++++++++++++++
 xen/arch/riscv/entry.S                      |  67 ++
 xen/arch/riscv/extable.c                    |  70 +-
 xen/arch/riscv/guestcopy.c                  |  87 +++
 xen/arch/riscv/imsic.c                      | 691 ++++++++++++++++++++
 xen/arch/riscv/include/asm/aia.h            |   7 +
 xen/arch/riscv/include/asm/aplic.h          | 130 +++-
 xen/arch/riscv/include/asm/bug.h            |  19 -
 xen/arch/riscv/include/asm/cpufeature.h     |   1 +
 xen/arch/riscv/include/asm/csr.h            |  24 +
 xen/arch/riscv/include/asm/current.h        |   4 +
 xen/arch/riscv/include/asm/domain.h         |  23 +-
 xen/arch/riscv/include/asm/emulate.h        |  10 +
 xen/arch/riscv/include/asm/extable.h        |  64 +-
 xen/arch/riscv/include/asm/gpr-num.h        |  37 ++
 xen/arch/riscv/include/asm/guest_access.h   |   4 +
 xen/arch/riscv/include/asm/imsic.h          |  31 +
 xen/arch/riscv/include/asm/intc.h           |  12 +
 xen/arch/riscv/include/asm/irq.h            |   5 +-
 xen/arch/riscv/include/asm/mmio.h           |  63 ++
 xen/arch/riscv/include/asm/p2m.h            |   1 -
 xen/arch/riscv/include/asm/processor.h      |  16 +-
 xen/arch/riscv/include/asm/riscv_encoding.h |  34 +-
 xen/arch/riscv/include/asm/system.h         |   4 +
 xen/arch/riscv/include/asm/time.h           |   4 +-
 xen/arch/riscv/include/asm/traps.h          |   9 +
 xen/arch/riscv/include/asm/vaplic.h         |   5 +
 xen/arch/riscv/intc.c                       |  22 +
 xen/arch/riscv/mmio.c                       | 176 +++++
 xen/arch/riscv/p2m.c                        |  55 +-
 xen/arch/riscv/riscv64/asm-offsets.c        |  20 +-
 xen/arch/riscv/stubs.c                      |   5 -
 xen/arch/riscv/time.c                       |   4 +-
 xen/arch/riscv/traps.c                      | 110 +++-
 xen/arch/riscv/vaplic.c                     | 358 +++++++++-
 xen/arch/riscv/vmid.c                       |   4 +-
 xen/include/xen/config.h                    |   1 +
 43 files changed, 3281 insertions(+), 179 deletions(-)
 create mode 100644 xen/arch/riscv/emulate.c
 create mode 100644 xen/arch/riscv/include/asm/emulate.h
 create mode 100644 xen/arch/riscv/include/asm/gpr-num.h
 create mode 100644 xen/arch/riscv/include/asm/mmio.h
 create mode 100644 xen/arch/riscv/mmio.c

-- 
2.55.0


