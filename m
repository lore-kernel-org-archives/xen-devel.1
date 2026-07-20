Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7703EC44520
	for <xen-devel@archiver.kernel.org>; Mon, 20 Jul 2026 16:02:37 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1367138.1616944 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wlqRp-0007IO-Kp; Mon, 20 Jul 2026 16:02:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1367138.1616944; Mon, 20 Jul 2026 16:02:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wlqRp-0007IH-Hu; Mon, 20 Jul 2026 16:02:29 +0000
Received: by outflank-mailman (input) for mailman id 1367138;
 Mon, 20 Jul 2026 16:02:28 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wlqRo-0007Hb-JY
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2026 16:02:28 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wlqRn-00CH1I-PR
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2026 18:02:27 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a5e4689-bab6-0a2a0a5309dd-0a2a4509c2b8-28
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 18:02:27 +0200
Received: from [209.85.128.47] (helo=mail-wm1-f47.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a5e4693-be1a-0a2a45090019-d155802fb0ea-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 18:02:27 +0200
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-4954d29264cso13154365e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 09:02:27 -0700 (PDT)
Received: from fedora (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49563eee22esm31331765e9.1.2026.07.20.09.02.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jul 2026 09:02:26 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1784563347; x=1785168147; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2xa6+dQ11deO/ZHG6Wg1wVnwIRhJcIvRdzhiY0swYLs=;
        b=kBVhjvl/VwziSMXBxz0Qdft7dsOoCg5lcREzg7mjllpoTRY/LqOGizOHUhxuqkOpkd
         k+yGxOW2fX7Sroy2iKG0UzyZgI2npAgD5XyoZPCpd/qW2L6vkIsuSh+lf/3jOhtXJNGo
         rL13RAGdmqmPEdbk00GPsoBI5WUCjIFUF3Lf+BdbRdDqOpxBhWxAwF8xUbnGr5hjFRd/
         KrYT/ev+8IB8I+9nXziFAwzk0y6es/ilXowkRyWKpgM/KQxksUSXT/d2f7qGUJ0rK+Qx
         WdkpPCmzpQ2Q3nAyCf4KA1D4NonCEqKjobwIjPGgr0dRyB0TE+W7rAXTe9kgha+vuMLj
         dgXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784563347; x=1785168147;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2xa6+dQ11deO/ZHG6Wg1wVnwIRhJcIvRdzhiY0swYLs=;
        b=Y102Tn0X9bsKf3Fv0+CHTc+xzScOIC7R25VW12K8mRtaqCQjVkt2mV5KZpwDq7cuNT
         P5mIcqZIca6MBlv8kfBa6zmivsiQjVneJo7IhOUswcc41Urc+3vX2OH3V+vz+l6BYoL+
         K3L9v1Mcg7DR84ldqEDAMXATlnIKBUiLAZ9u+pW0ArdCYGWae2U5tNzVNerdnTwtwChW
         ToueClawE3hrxd8D7l//iJc0valjo/T3pomqAntCdTslH0bJn2xEmSGYJL5WMXeKsBay
         RhXDIG5+dDi1SAHLx95Ia/q2QGmJ2WvbksNx6l3sSqkz74HcPhpw/gshNQGLAUf8l2sq
         QuDQ==
X-Gm-Message-State: AOJu0YwnOMtYd2UYImW4iLADfGO0ayXkhnM/MmTADyuHzvlm4v47i8qp
	zMaXtlTVxsFhhbFCKV/QHK1VywOkexnoThkS+bKz1L8SI+blRDVP4uNfRG+wwQ==
X-Gm-Gg: AfdE7cnYqHRs8u/9z2WrWK0CSxdvNbbIUGpyzIGtFCqZGsDyu60Nnjmuwe68PnpmzUv
	TLFRbsO7ZvTyIu0B+3ffqaRFzH8knHYcnxreAzMF7lDLRswXYUVaQghzB8iNyEmyfDH/19oE/8+
	2TAFusoCkw0acCHQlC8LHsyV2aRGmiigIWzWpMuBmGB6kGeIybjef1cp8oKQaP8gAQUJOWhtnUG
	vLH/08kKU1aWCHI50QFpULlCEXVWElK9MIDFPtkfNoBYWvETQ+rvS/Vv/Hyfgu9XYpjAGoBjreZ
	OF4C6PDLnBEej4tK9+uihBBpS1MB4KbqjB+u8U98jep9ZYY4Xv1QC1euXeGzkNGnr0ZywlfQ0em
	2QJmGZaSxktVqXDG1zy8b1hsI9jyFSsY1KEHNxW4DBGNGRorAtAdcA9/AFMfkkwHDmdmMvflQtW
	5q4MQgbcoDm2/1exufBYa13kQWPGLCKxJk48JUyCDLIHnDSw8=
X-Received: by 2002:a05:600c:4c2a:b0:493:c535:3934 with SMTP id 5b1f17b1804b1-4954a51fc5fmr126136265e9.36.1784563346894;
        Mon, 20 Jul 2026 09:02:26 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
	Baptiste Le Duc <baptiste.le-duc@vates.tech>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v1 00/17] [RISC-V] virtual interrupt controller (vAPLIC/vIMSIC) support
Date: Mon, 20 Jul 2026 18:01:58 +0200
Message-ID: <cover.1784560663.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-bad1c0/1784563347-3AEDE034-1F00645B/10/73395122804
X-purgate-type: spam
X-purgate-size: 6285

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

Physical APLIC/AIA groundwork (patches 1-3)
  - Correctly track IRQ_DISABLED across runtime enable/disable and order
    the ->status update against the IMSIC CSR write.
  - Per-pCPU VGEIN (guest interrupt file) allocator: assign/release a
    hardware guest file to a vCPU and program hstatus.VGEIN.
  - Add the missing APLIC register offsets/masks needed by both the
    physical and virtual APLIC code (no functional change).

Device-agnostic MMIO dispatch + vAPLIC emulation (patches 4-5)
  - A per-domain MMIO handler table modelled on Arm's framework, so
    emulated devices self-register their GPA ranges and the fault path
    stays agnostic via a single try_handle_mmio() entry point.
  - vAPLIC MMIO read/write emulation. Writes are gated by the domain's
    authorised-IRQ bitmap so a guest cannot touch interrupts it does not
    own, and TARGET writes are translated from virtual to physical
    hart/guest-file indices. Delegation (SOURCECFG.D) is not yet
    supported.

vIMSIC guest interrupt files and state (patches 6-9)
  - Stage-2 map a vCPU's physical guest interrupt file to the fixed
    per-vCPU GPA page the guest expects at offset 0.
  - vcpu_aia_init(): assign a VGEIN, map its guest file and record the
    IMSIC state as a consistent unit.
  - IMSIC state save/restore (currently tracking which pCPU owns the
    guest file, needed because the pCPU id is part of the MSI address).
  - has_msi_support() helper to decide whether IMSIC state has to be
    saved/restored.

vINTC state save/restore plumbing (patches 10-11)
  - vintc_state_{save,restore}() wrappers over new store/restore hooks in
    struct vintc_ops, and the vAPLIC implementation of those hooks. No
    callers are wired up yet; the context-switch calls arrive with vCPU
    context switch support.

Trap and instruction emulation infrastructure (patches 12-17)
  - Extend the exception-table format with type/data fields and add
    EX_TYPE_TRAP_INFO so fixups can capture sepc/scause/stval.
  - riscv_vcpu_unpriv_read() (HLV/HLVX) to read guest memory/instructions
    safely, and riscv_vcpu_trap_redirect() to forward a synchronous trap
    back into the guest's VS-mode handler.
  - A guest page-fault handler that decodes the trapped load/store
    instruction (HTINST, or an unprivileged fetch as a fallback) and
    dispatches the MMIO access through try_handle_mmio().

Note on versioning: the series is posted as v1 as a freshly split-out
series, but several patches carry v2/v3 changelogs because they were
previously circulated as part of a larger another patches [1] from which the
current depends.

CI tests: https://gitlab.com/xen-project/people/olkur/xen/-/pipelines/2690874319

[1] https://lore.kernel.org/xen-devel/cover.1784559209.git.oleksii.kurochko@gmail.com/T/#t

Oleksii Kurochko (17):
  xen/riscv: manage IRQ_DISABLED flag in APLIC irq enable/disable
    callbacks
  xen/riscv: add basic VGEIN management for AIA guests
  xen/riscv: add missing APLIC register offsets, masks to asm/aplic.h
  xen/riscv: introduce device-agnostic MMIO emulation dispatch
  xen/riscv: implement virtual APLIC MMIO emulation
  xen/riscv: map IMSIC interrupt file for vCPUs
  xen/riscv: introduce vCPU AIA initialization
  xen/riscv: add IMSIC state save/restore
  xen/riscv: add helper to check APLIC MSI mode
  xen/riscv: introduce vintc_state_{save,restore}()
  xen/riscv: add vAPLIC state save/restore hooks
  xen/riscv: extend exception tables with type and data fields
  xen/riscv: add unprivileged guest memory read helper
  xen/riscv: add guest page fault handling stub
  xen/riscv: implement trap redirection to a guest
  xen/riscv: add guest load emulation for trapped MMIO accesses
  xen/riscv: add guest store emulation for trapped MMIO accesses

 xen/arch/riscv/Makefile                   |   1 +
 xen/arch/riscv/aia.c                      | 175 ++++++++++++
 xen/arch/riscv/aplic-priv.h               |   2 +
 xen/arch/riscv/aplic.c                    |  83 +++++-
 xen/arch/riscv/domain.c                   |   4 +
 xen/arch/riscv/extable.c                  |  60 +++-
 xen/arch/riscv/guestcopy.c                | 145 ++++++++++
 xen/arch/riscv/imsic.c                    |  99 +++++++
 xen/arch/riscv/include/asm/aia.h          |  10 +
 xen/arch/riscv/include/asm/aplic.h        |  61 +++++
 xen/arch/riscv/include/asm/domain.h       |   3 +
 xen/arch/riscv/include/asm/extable.h      |  62 +++--
 xen/arch/riscv/include/asm/gpr-num.h      |  33 +++
 xen/arch/riscv/include/asm/guest_access.h |   8 +
 xen/arch/riscv/include/asm/imsic.h        |  17 ++
 xen/arch/riscv/include/asm/intc.h         |   9 +
 xen/arch/riscv/include/asm/mmio.h         |  63 +++++
 xen/arch/riscv/include/asm/processor.h    |   2 +
 xen/arch/riscv/include/asm/traps.h        |  12 +
 xen/arch/riscv/include/asm/vaplic.h       |   6 +
 xen/arch/riscv/intc.c                     |  14 +
 xen/arch/riscv/mmio.c                     | 145 ++++++++++
 xen/arch/riscv/traps.c                    | 279 +++++++++++++++++++
 xen/arch/riscv/vaplic.c                   | 319 ++++++++++++++++++++++
 24 files changed, 1590 insertions(+), 22 deletions(-)
 create mode 100644 xen/arch/riscv/include/asm/gpr-num.h
 create mode 100644 xen/arch/riscv/include/asm/mmio.h
 create mode 100644 xen/arch/riscv/mmio.c

-- 
2.54.0


