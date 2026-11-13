Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02F2C606A327
	for <xen-devel@archiver.kernel.org>; Fri, 13 Nov 2026 15:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AfpYVS5w
Received: from list by lists.xenproject.org with outflank-mailman.1487708.1689929 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRtWX-00006G-88; Fri, 13 Nov 2026 15:49:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1487708.1689929; Fri, 13 Nov 2026 15:49:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRtWX-000068-33; Fri, 13 Nov 2026 15:49:09 +0000
Received: by outflank-mailman (input) for mailman id 1487708;
 Fri, 13 Nov 2026 15:49:08 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xRtWW-000060-5m
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2026 15:49:08 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xRtWV-004Su0-IZ
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2026 16:49:07 +0100
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6af7315d-2eae-0a2a0a5409dd-0a2a4506aa28-26
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 16:49:07 +0100
Received: from [209.85.221.49] (helo=mail-wr1-f49.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6af73173-195a-0a2a45060019-d155dd31d05c-3
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 16:49:07 +0100
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-48e20ed3b9dso1548645f8f.2
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 07:49:07 -0800 (PST)
Received: from fedora (user-109-243-65-71.play-internet.pl. [109.243.65.71])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-49c5f1c0e0dsm5786493f8f.15.2026.11.13.07.49.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Nov 2026 07:49:06 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20260707 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794584947; x=1795189747; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5oXhHLpaXHMsiRo1OYi92nLYnTLoBzbh+x5iqwmrHzM=;
        b=AfpYVS5wEAF+Rq2aTkCF3AGlzX7CB9pNAUuJHdJRp0g4DWkKtIVXa5X65k2FC4wnpr
         ajsf4uq8rbXLplvGSruA976x+hDTW6RLEmwb8ceg12XpfvBYuZdyJ8ScGEEUYUFOra9Y
         3ZlNZB+pWfIoZmmMyU9o8rNBO+9OwJQV1SSI+CEhvVOkXZZDZAIDCtiqnHwlrsgag8jb
         5jZX3ZAje4lqE5w/iGmtbFMwq3kBR49sPoRDpZUuKOSMpJKFMHtOYsnITio5I+vkIiS/
         7ZsryArrs2Wsa4SnTgPsmYREehh4HJEUnkct8rKxbtudWbP8orJdYO8gF04E8B/ZiQuQ
         7ZHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794584947; x=1795189747;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5oXhHLpaXHMsiRo1OYi92nLYnTLoBzbh+x5iqwmrHzM=;
        b=jTRes/CWtj2PvORrtjUKPTuZVR2xB42XE5AwH16y4MBLoX8350f6anLUNpLwwZaDwo
         /mVtCkKagwxf5d9pNw1O1Wvb3dQusUzrY7a8Q5BGS4KeOIqvDGTm67EjbkMD5FwB33Xy
         80x/9IDRX9WAShWWDnr7IXGeCiIr4T0YiJcYYhJlzsNaB2COSybdiRHbcgsGpmPMz1ma
         p93UgS4x9JMFvab1cnhvG6mQG4vJ704ZEdAw+EQlmRd+h1lBudnFfNqY6kye4USQlCPf
         Tap+NzXEgElWpmHJkA6Q9nHaSpJ6dB3A6NupnBKguKUEdomQgeG4mncs6cAMY3I8dK0d
         YthQ==
X-Gm-Message-State: APuU4Z+/jElT4fnh7lD3LQYdXyUv7DhU/nVsfaqRdkg0VkWo66/cMT5X
	GTY3OD39bOjfcZEahNTWWAIUsAqWmOenaJyUvNbB2OKinb24e69BW13fxfusSQ==
X-Gm-Gg: AYBFou0TG9VYRtFZAtzI3nkkvIAU4joFYfyCtf0p05TPF6Tw2YUnDqg+eND9aGpKwzw
	N7i1+hoVbIBZ0WemmDtRm18drfY8iZ7Uwyqrs6e55bw4y7fgqZ7fdAiviS3LfgGbZlR2oMX6s0n
	4eIZbaY+Z8d27BgO3OECTVtNP1mjVqb2GbLQPYs059/bwBrSHHX114X5qnUWsNUP59Itrpv65Mx
	fyJN4QCDnypOq6hcy9P/e9Nunk7MqAhSz2Ti5po8baXAASVzWhWjQcoFxAkKzp1dJpikBOk7iBr
	8wrFNofPaucCky9YfFCwxJfYX5ESTSu6/IovTqkJZDlRYUbtaUbn8w0UoCjz39zcxFzcLyq3Eah
	NL7cQsNWcjG9QnHEdpCCpmviw4z5CxVhYRsCXbYefBVFrahvMNxyZ5BOWqyadTI0fSpcyq9KPwc
	G857TlCX1fw4axZGEh81egD5Kw6tySrC0bEJThrLXYlJ5qbQ0a4hSfb0nYZr4bO8RJqReyjVdZu
	+JzFLq3FPf8v2T+scEb3s7TV/TcdWwr4NPiTjouzM+46ish8uwx+bCJohPtfnApJ9JoBu7d67l9
	paYXiUN1ClDXXiBqWvICW8nopdrLjEC+StXvs4GuEsFvyLB6UBacLTPzzZ1Yc3gnBVY6
X-Received: by 2002:a05:6000:220d:b0:48e:1299:c00f with SMTP id ffacd0b85a97d-49c6d453a61mr7301352f8f.3.1794584946561;
        Fri, 13 Nov 2026 07:49:06 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Baptiste Le Duc <baptiste.le-duc@vates.tech>
Subject: [PATCH v4 00/42] [RISC-V] virtual interrupt controller (vAPLIC/vIMSIC) support
Date: Fri, 13 Nov 2026 16:48:21 +0100
Message-ID: <cover.1794487770.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.56.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-16d1c6/1794584947-F540B77B-B250539E/10/73395122804
X-purgate-type: spam
X-purgate-size: 14184
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

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
delivery itself stays in hardware. Interrupts of devices emulated by Xen
itself (virtual sources) are supported as well: vAPLIC keeps their state
and Xen injects their MSIs into the vCPU's guest interrupt file.

The work breaks down into a few logical blocks:

Self-contained preparatory patches (patches 1-6)
  - A helper to test for APLIC MSI mode.
  - Make csr_write64() take the CSR name without the CSR_ prefix
    (MISRA C Rule 20.12), and add csr_volatile_read64() as its
    counterpart, used for CSR_TIME so that get_cycles() no longer
    truncates the time counter on RV32.
  - Define the IPRIO field of the APLIC target register, and build the
    physical APLIC's target hart index with aplic_hart_index(), dropping
    the last in-tree duplicate of the AIA hart index formula.
  - CPU_NONE as an explicit "no pCPU" marker instead of NR_CPUS.
  None of these depends on the rest of the series, so they can go in
  ahead of it.

MMIO emulation and vAPLIC (patches 7-10)
  - A per-domain MMIO handler table modelled on Arm's framework, so
    emulated devices self-register their GPA ranges and the fault path
    stays agnostic via a single try_handle_mmio() entry point.
  - Tell h/w vINTC sources (a physical IRQ is routed to them) from
    virtual ones (driven by a device emulator in Xen) with a new
    hw_irqs bitmap.
  - vAPLIC MMIO read/write emulation for the h/w sources of the domain.
    Writes are limited to the sources the domain owns, and target[]
    writes are translated from virtual to physical hart/guest-file
    indices. Only MSI delivery mode is emulated, and delegation
    (sourcecfg.D) is not supported.
  - Leave the h/w source of an IRQ routed to a guest Inactive, as the
    guest configures it itself.

vCPU context switching (patches 11-13)
  - context_switch() and the helpers it needs: save/restore of H/VS CSRs,
    the virtual timer and P2M context, and __context_switch() in assembly.
    The VMID is claimed in p2m_ctxt_switch_to() rather than at the next
    guest entry.
  - Save and restore the AIA CSRs a guest can change (vsiselect and
    hviprio{1,2}), gated by hstateen0 where Smstateen is implemented.
  - vintc_ctxt_switch_{from,to}() wrappers over new ctxt_switch_{from,to}
    hooks in struct vintc_ops, called from the context switch path.

Trap and instruction emulation infrastructure (patches 14-22)
  - Extend the exception-table format with type/data fields and add
    EX_TYPE_TRAP_INFO so fixups can capture sepc/scause/stval.
  - A guest page-fault handler, and trap_redirect() to forward a
    synchronous trap back into the guest's VS-mode handler for the faults
    which can never become an emulated access.
  - Resolve the faulting guest physical address from htval and stval,
    which first needs Shtvala to be detected.
  - read_guest() (HLV/HLVX) to read guest memory and instructions
    safely, the decoding helpers shared by both access types, and the load
    and store emulation which dispatches the access through
    try_handle_mmio().

vCPU bring-up (patches 23-29)
  - Program hstatus.VSXL explicitly, as decoding a trapped instruction
    depends on the effective XLEN of the guest.
  - continue_new_vcpu(): switch to the idle vCPU's own stack for the idle
    vCPU, and enter the guest through the new return_to_new_vcpu() path in
    entry.S for a guest one.
  - Per-pCPU VGEIN (guest interrupt file) allocator: a bitmap of the files
    a hart implements (up to GEILEN) with helpers to assign and release
    one, and an owners[] map so a file reported pending in HGEIP can be
    traced back to the vCPU it belongs to.
  - Stage-2 map a vCPU's physical guest interrupt file to the fixed
    per-vCPU GPA page the guest expects, and vaplic_reconfigure_target()
    to retarget the domain's h/w sources at a new file.
  - imsic_vsfile_attach(), called once the pCPU a vCPU will run on is
    known: it assigns a VGEIN, clears and maps the guest interrupt file
    and records the IMSIC state as a consistent unit.
  - Watch a descheduled vCPU's guest interrupt file through HGEIE, so that
    a guest blocked on an external interrupt is woken up instead of
    waiting for an unrelated event to schedule it again.

vCPU migration between pCPUs (patches 30-35)
  - An APLIC-IMSIC-hart sync barrier, using an interrupt identity
    reserved for Xen.
  - The move of a vCPU's IMSIC guest interrupt file, following the
    sequence the AIA spec prescribes: take, zero and G-stage map the new
    file, retarget the domain's APLIC interrupts at it and fence off
    straggler MSIs with the barrier, save and clear the old file (in a
    single IPI to the pCPU owning it), then restore that state into the
    new file and update the vCPU's hstatus.VGEIN.
  - The move is done by the vCPU itself on its way back to the guest,
    from check_for_pcpu_work() through a new vintc_ops.enter_guest hook,
    rather than from arch_move_irqs() (see "Changes in v4" below).

Virtual interrupt sources (patches 36-42)
  - vcpu_imsic_inject() to make an identity pending in a vCPU's guest
    interrupt file from any pCPU, through its SETIPNUM_LE register, and
    the synchronisation of such injections with a migration of the file.
  - Emulate genmsi.
  - Keep the guest's view of sourcecfg[], setie[]/clrie[] and
    domaincfg.IE, which can now be cleared, for both kinds of source.
  - Emulate target[], the pending bits and the MSIs of virtual sources,
    and vintc_set_irq_level(), through which a device emulator drives
    the line of its virtual source.

CI tests: https://gitlab.com/xen-project/people/olkur/xen/-/pipelines/3063920059

---
Changes in v4:
 - Add support for virtual interrupts, i.e. interrupts of devices
   emulated by Xen (patches 36-42). Could go separately as we don't really use
   now virtual interrupts. It was tested based on Denis M's vuart framework +
   some extra patch to make it work for RISC-V.
 - Fix a race between the vCPU migration and the vCPU entering the guest
   with a stale hstatus.VGEIN: the vCPU's guest interrupt file is now
   moved by the vCPU itself right before entering the guest, rather than
   from arch_move_irqs(). See "xen/riscv: move a vCPU's guest interrupt
   file on its way to the guest" for details.
 - Reorder the series: self-contained patches are moved to the beginning
   (patches 1-6) to make them easier to merge, and vCPU bring-up now
   comes before vCPU migration.
 - Drop the patches which are already in staging.
 - Address the comments from ML.
 - The remaining changes are described in the per-patch changelogs.
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

Oleksii Kurochko (42):
  xen/riscv: add helper to check APLIC MSI mode
  xen/riscv: address violation of MISRA C Rule 20.12 in csr_write64()
  xen/riscv: introduce csr_volatile_read64()
  xen/riscv: define the IPRIO field of the APLIC target register
  xen/riscv: build the target hart index via aplic_hart_index()
  xen/riscv: introduce CPU_NONE
  xen/riscv: introduce device-agnostic MMIO emulation dispatch
  xen/riscv: distinguish h/w and virtual vINTC sources
  xen/riscv: implement virtual APLIC MMIO emulation
  xen/riscv: leave the h/w source of an IRQ routed to a guest inactive
  xen/riscv: implement vCPU context switching
  xen/riscv: save and restore vsiselect on vCPU context switch
  xen/riscv: introduce vintc_ctxt_switch_{from,to}()
  xen/riscv: extend exception tables with type and data fields
  xen/riscv: add guest page fault handling stub
  xen/riscv: implement trap redirection to a guest
  xen/riscv: detect Shtvala
  xen/riscv: resolve the faulting guest physical address
  xen/riscv: add guest memory read helper
  xen/riscv: add helpers for decoding a trapped load or store
  xen/riscv: add guest load emulation for trapped MMIO accesses
  xen/riscv: add guest store emulation for trapped MMIO accesses
  xen/riscv: set the guest's XLEN explicitly in hstatus.VSXL
  xen/riscv: implement continue_new_vcpu()
  xen/riscv: add basic VGEIN management for AIA guests
  xen/riscv: map IMSIC interrupt file for vCPUs
  xen/riscv: introduce vaplic_reconfigure_target()
  xen/riscv: introduce IMSIC h/w interrupt file attaching to vcpu
  xen/riscv: wake up a descheduled vCPU on a guest external interrupt
  xen/riscv: implement APLIC-IMSIC-hart sync barrier for vCPU migration
  xen/riscv: introduce imsic_migrate_vcpu()
  xen/riscv: remap interrupts to new IMSIC VS-file
  xen/riscv: save and clear the old IMSIC VS-file on vCPU migration
  xen/riscv: restore register state in the new IMSIC VS-file
  xen/riscv: move a vCPU's guest interrupt file on its way to the guest
  xen/riscv: send MSIs to a vCPU's guest interrupt file
  xen/riscv: sync with IMSIC VS-file injections on vCPU migration
  xen/riscv: emulate the vAPLIC genmsi register
  xen/riscv: emulate vAPLIC sourcecfg[], setie[] and domaincfg.IE
  xen/riscv: emulate target[] of virtual vAPLIC sources
  xen/riscv: emulate the pending bits and MSIs of virtual vAPLIC sources
  xen/riscv: drive the line of a virtual vAPLIC source

 docs/misc/riscv/booting.txt                 |   11 +
 xen/arch/riscv/Makefile                     |    2 +
 xen/arch/riscv/aia.c                        |  180 +++
 xen/arch/riscv/aplic-priv.h                 |    2 +
 xen/arch/riscv/aplic.c                      |  243 +++-
 xen/arch/riscv/cpufeature.c                 |    1 +
 xen/arch/riscv/device.c                     |   17 +-
 xen/arch/riscv/domain-build.c               |    8 +
 xen/arch/riscv/domain.c                     |  341 +++++-
 xen/arch/riscv/emulate.c                    |  582 +++++++++
 xen/arch/riscv/entry.S                      |   87 ++
 xen/arch/riscv/extable.c                    |   48 +-
 xen/arch/riscv/guestcopy.c                  |   68 ++
 xen/arch/riscv/imsic.c                      |  900 +++++++++++++-
 xen/arch/riscv/include/asm/aia.h            |    7 +
 xen/arch/riscv/include/asm/aplic.h          |   47 +-
 xen/arch/riscv/include/asm/config.h         |    3 +
 xen/arch/riscv/include/asm/cpufeature.h     |    1 +
 xen/arch/riscv/include/asm/csr.h            |   47 +-
 xen/arch/riscv/include/asm/current.h        |    6 +
 xen/arch/riscv/include/asm/domain.h         |   22 +-
 xen/arch/riscv/include/asm/emulate.h        |   10 +
 xen/arch/riscv/include/asm/extable.h        |   61 +-
 xen/arch/riscv/include/asm/gpr-num.h        |   53 +
 xen/arch/riscv/include/asm/guest_access.h   |   28 +
 xen/arch/riscv/include/asm/imsic.h          |   58 +-
 xen/arch/riscv/include/asm/intc.h           |   34 +-
 xen/arch/riscv/include/asm/irq.h            |    5 +-
 xen/arch/riscv/include/asm/mmio.h           |   48 +
 xen/arch/riscv/include/asm/p2m.h            |    1 -
 xen/arch/riscv/include/asm/processor.h      |   14 +-
 xen/arch/riscv/include/asm/regs.h           |   23 +-
 xen/arch/riscv/include/asm/riscv_encoding.h |   28 +-
 xen/arch/riscv/include/asm/setup.h          |    2 +
 xen/arch/riscv/include/asm/smp.h            |    2 +-
 xen/arch/riscv/include/asm/system.h         |    3 +
 xen/arch/riscv/include/asm/time.h           |    4 +-
 xen/arch/riscv/include/asm/traps.h          |    9 +
 xen/arch/riscv/include/asm/vaplic.h         |   66 +
 xen/arch/riscv/intc.c                       |   76 +-
 xen/arch/riscv/irq.c                        |    2 +-
 xen/arch/riscv/mmio.c                       |  205 ++++
 xen/arch/riscv/p2m.c                        |  157 ++-
 xen/arch/riscv/riscv64/asm-offsets.c        |   19 +-
 xen/arch/riscv/setup.c                      |    2 +
 xen/arch/riscv/smp.c                        |    4 +-
 xen/arch/riscv/stubs.c                      |    5 -
 xen/arch/riscv/time.c                       |    4 +-
 xen/arch/riscv/traps.c                      |   91 +-
 xen/arch/riscv/vaplic.c                     | 1201 ++++++++++++++++++-
 50 files changed, 4659 insertions(+), 179 deletions(-)
 create mode 100644 xen/arch/riscv/emulate.c
 create mode 100644 xen/arch/riscv/include/asm/emulate.h
 create mode 100644 xen/arch/riscv/include/asm/gpr-num.h
 create mode 100644 xen/arch/riscv/include/asm/mmio.h
 create mode 100644 xen/arch/riscv/mmio.c

-- 
2.56.0


