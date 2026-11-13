Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70D98606A331
	for <xen-devel@archiver.kernel.org>; Fri, 13 Nov 2026 15:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=p0Ja2P2q
Received: from list by lists.xenproject.org with outflank-mailman.1487719.1690009 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRtWi-0002Dk-A6; Fri, 13 Nov 2026 15:49:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1487719.1690009; Fri, 13 Nov 2026 15:49:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRtWi-0002DK-4W; Fri, 13 Nov 2026 15:49:20 +0000
Received: by outflank-mailman (input) for mailman id 1487719;
 Fri, 13 Nov 2026 15:49:18 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xRtWf-0001my-UR
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2026 15:49:18 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xRtWf-004Sxq-BO
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2026 16:49:17 +0100
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6af7316c-2eae-0a2a0a5409dd-0a2a450abfba-32
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 16:49:17 +0100
Received: from [209.85.221.49] (helo=mail-wr1-f49.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6af7317d-f2d2-0a2a450a0019-d155dd31f138-3
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 16:49:17 +0100
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-492f563d1c6so781095f8f.3
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 07:49:17 -0800 (PST)
Received: from fedora (user-109-243-65-71.play-internet.pl. [109.243.65.71])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-49c5f1c0e0dsm5786493f8f.15.2026.11.13.07.49.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Nov 2026 07:49:15 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20260707 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794584957; x=1795189757; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wbZ25+VoKaaV7qnPyVDlQn3gP5b3NvB2ZMaNYVvtdFY=;
        b=p0Ja2P2qSavn7QZ5GRdgpJZzOTXD/BZCaJslBPFEF4ez6Oa8H891rUxE/hyz6ZdNLt
         dnKAteYob58x43M5shjjivI8tTnkHt4yVT+FKWSW5kJzuV3LLrY6mpqrbA08JzVifho6
         QVydVC6+PediD1JznbWubevwFAN/wTa9V/85uPwE2jlcIW02ZZxva3ziSYyqjxtvIBP/
         09GXxk7PRptSbeUWTHBIIbjyHK5txNbtxajbmtIVXrOjSg+tb+Qzz9JKy34acU/v+V1A
         /f7YF4IeOqAB84+f0B4rTZOHqF8jJ2S/ZVuKNHEB5+CkW+dxMf1uXDKz+F2K5+qm/u2B
         T2uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794584957; x=1795189757;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wbZ25+VoKaaV7qnPyVDlQn3gP5b3NvB2ZMaNYVvtdFY=;
        b=CrG94aIbxaRR2oyublsHe8213ybVC+ytZAWAlg44jPFt1/XpY7dnvUwrYnqPC3s7dp
         hRDtRZxbV5nRAADkRQBUGcYOGOqrGrXTidr9HLcTsmgxwe4pUWpWhYD5Nk8VIVvEhod+
         a32X8v5Mv2BUxjsq4y0MuECs6XwfDgyxrXQhc3hk+PsSs4vTVVvLBV5ClywCJziefiYa
         92Z0+Kd9DtKc2gaCCNywlrylxAptZXXmpROkJ040Kph49l1/l6DLsPGpv4C4FXmXRtnj
         NxQW5k8OeWgz2XqrYDXtwrKAC6Gv4WUAMrCufzpxDUClvd8Zf5x7Vss54gKEYMgcImsb
         cgwQ==
X-Gm-Message-State: APuU4Z/3XgWJRJpqTr475EvAuIg1yHVVXCRiwV0wF9P8VEjMze8OvpT6
	SdGVApOX3oAwElD7zMul3iZtt1x73JYR923y2Agd4Q6F8Cs6h+UImLAdH2wfHQ==
X-Gm-Gg: AYBFou386NkvgtmhubOdknzaK/U+dVBJnQR3DgJNh1QEAdap46+fqNy7ympaFFKcJj5
	LtG+0bcXCqFwtFN/0ODkkNHj/P9XTS1WrCb3jhdYWbQftl7DKrSTjLfIqmdYc7EdVEI/s+fUXY/
	SoEhIC2g5mfvdzUBmpzZ4roVJU0a2gjH427ShQHCQsslhO9M+zZHa16Sj93OiPp6gHxHCOxTEP9
	kJixLfy3Uqt3bR94skfqeyKJUR1UZfRd5fVpGF9jKOrwnnNSgjAU1869eqt58WQW7DUlslSPPjv
	JN8ljnBW3bvD9huBiZXigJIFDos/PVTwbRTJ7AlA0kBVc85cAF8HD1Ju7vkFUFBPvoaUWvw6nJ2
	vFHopkzuekOsZtDsO37GiatUQaKz9lWKttBxYeJEZB50dhWBced7uCd5WMtlNPfQ4NTMmzGYvRz
	24b7tgyKGt5J+yx3xCKRQtqgi58aH+TBtHX5ZiuA2vn7ML4G9/7Oa9TorFZCLopOvFbbToo4dfb
	2/1GHh2o5mlXQ9fGCeSdOAlhgK+Lnz1Mh98QA87qxLeklP9Ejz3yV1TyTJWk9N5rbBtBbDi+iwf
	CVXzseTK64BnYEUEnQwDEqWCYe+ywSpijgENy4lzrVqbRfsSMWXrEhO1ZrVL2XVEEtcm
X-Received: by 2002:adf:e00d:0:10b0:490:6fbc:9457 with SMTP id ffacd0b85a97d-49c72c9c6f6mr4954052f8f.41.1794584956088;
        Fri, 13 Nov 2026 07:49:16 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Baptiste Le Duc <baptiste.le-duc@vates.tech>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v4 09/42] xen/riscv: implement virtual APLIC MMIO emulation
Date: Fri, 13 Nov 2026 16:48:30 +0100
Message-ID: <9e6fbb0f0b4f5584ba7c71f4a84b726749267041.1794562488.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <cover.1794562488.git.oleksii.kurochko@gmail.com>
References: <cover.1794562488.git.oleksii.kurochko@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-4011c0/1794584957-50ECACFC-60DB642C/10/73395122804
X-purgate-type: spam
X-purgate-size: 38667
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FORGED_GMAIL_RCVD,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Guests running under Xen program interrupt routing by writing to APLIC
MMIO registers. Xen must intercept these accesses to enforce interrupt
isolation between domains and to translate guest routing intent into the
underlying physical MSI topology.

Only the h/w (passed-through) sources of a domain, the ones a h/w IRQ is
routed to (see vintc->hw_irqs), are emulated, by passing the accesses to
their registers through to the physical APLIC. A virtual source has
nothing in the h/w, so it reads as zero and ignores writes, like a
source which isn't assigned to the domain.

Register the vAPLIC range with the MMIO dispatch and emulate the accesses:
 - reads and writes are masked with the domain's h/w sources, so that a
   guest can neither observe nor affect interrupts it does not own;
 - target registers are shadowed per source, so that a guest reads back
   what it wrote, or zero while the source is inactive, as target[i] is
   then read-only zero. Of a value written, only Hart Index and EIID are
   kept: Guest Index is read-only zero, as a guest's harts don't
   implement the H extension, and bit 11 is reserved. The h/w register
   instead gets the hart index and guest interrupt file of the pCPU the
   target vCPU's interrupt file lives on, as the APLIC uses these fields
   directly to compute the MSI address. As long as the target vCPU has
   no h/w guest interrupt file, only the shadow copy is updated;
 - vAPLIC is a leaf interrupt domain, so a source can't be delegated: a
   write to sourcecfg[] with D (bit 10) set zeroes the whole register,
   as the AIA spec requires for a leaf domain;
 - the registers a supervisor-level domain with domaincfg.BE hardwired
   to 0 doesn't implement, i.e. the MSI address configuration ones and
   setipnum_be, read as zero and ignore writes, as the AIA spec makes
   the bytes of a register which isn't implemented read-only zero;
 - only MSI delivery mode is emulated, so domaincfg.DM is hardwired to 1
   and the region holds no IDC structures;
 - domaincfg.IE isn't honoured: the h/w forwards the MSIs of the h/w
   sources whatever its value is. Linux as a guest sets IE before it
   enables any source and never clears it, so a write may set IE, but
   not clear it. This is temporary: honouring IE needs the guest's view
   of the enable bits of the h/w sources to be kept, which is left to a
   separate patch.

Co-developed-by: Romain Caritey <Romain.Caritey@microchip.com>
Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
The state of virtual sources, which devices emulated by Xen need, isn't
emulated here. It is introduced at the end of this series, by
"xen/riscv: emulate vAPLIC sourcecfg[], setie[] and domaincfg.IE",
"xen/riscv: emulate target[] of virtual vAPLIC sources",
"xen/riscv: emulate the pending bits and MSIs of virtual vAPLIC
sources" and "xen/riscv: drive the line of a virtual vAPLIC source".

All the patches connected to virtual interrupts support for vAPLIC/vIMSIC
were tested on [1]. This branch is based on Denis M's framework which should
be soon sent to ML. Note that in [1] RISC-V is only draft version and
it has been ported in a quick way just to verify virtual interrupts are
working.

[1] https://gitlab.com/xen-project/people/olkur/xen/-/tree/riscv-vuart-support-wip?ref_type=heads
---
Changes in v4:
- Turn AUTH_IRQ_BIT() into a function, vaplic_is_hw_source(), as it
  now tells whether a source is a h/w one.
- Emulate only the h/w sources of the domain, the ones in
  vintc->hw_irqs: a virtual source reads as zero and ignores writes.
- Zero sourcecfg[] on a write with D set, as the AIA spec requires for a
  leaf domain, instead of crashing the domain, and log it at debug level.
  Drop APLIC_SOURCECFG_WMASK, as SM is then the only field a write may
  change.
- Emulate a read of sourcecfg[] instead of crashing the domain on it: a
  h/w source reads the h/w register, which a write goes to, and any other
  source reads as zero.
- Make mmsiaddrcfg, mmsiaddrcfgh, smsiaddrcfg, smsiaddrcfgh and
  setipnum_be read-only zero instead of crashing the domain on an access
  to them, and add APLIC_MMSICFGADDR{,H} and APLIC_SETIPNUM_BE.
- Make Guest Index of a target register read-only zero and drop the
  reserved bit 11, keeping Hart Index and EIID of the value written,
  instead of ignoring a write with a non-zero Guest Index as a whole.
- Sort <xen/sched.h> before <xen/sections.h>.
- Drop inline from generate_auth_mask().
- Compute the register offset as addr - regs_start: masking addr with
  APLIC_CTRL_REGION_OFFSET_MASK aliased the accesses beyond the first
  16 KiB onto its registers and relied on GUEST_APLIC_S_BASE being
  16 KiB aligned. Drop APLIC_CTRL_REGION_OFFSET_MASK.
- Hardwire domaincfg.DM to 1, as only MSI delivery mode is emulated, and
  drop the handling of a target register write in direct delivery mode.
- Let a write to domaincfg set IE, but not clear it, as IE isn't
  honoured.
- Size the vAPLIC region with no IDC structures, as an interrupt domain
  which supports only MSI delivery mode needs none, and rename the
  parameter of APLIC_SIZE() to nr_idcs to make that clear.
- Make target[i] read-only zero while source i is inactive.
- Use array_index_nospec() for the guest-controlled indexes into
  hw_irqs[] and sources[] after they are bounds-checked.
- Add a comment on why the writes passed through to the h/w can affect
  only the h/w sources of the domain.
- Drop the comment claiming that the value read is zero-extended to the
  guest register width: it is the load emulation which extends it, as the
  instruction requires.
- Constify target_vcpu in the target register emulation.
- Put the arguments of the "Unhandled APLIC write" message on one line.
- Rename the vCPU parameter of vaplic_mmio_{read,write}() to curr, as it
  is always current.
- Drop the "VAPLIC:" prefix of the gdprintk() messages in
  vaplic_mmio_{read,write}() and add a blank line before the return
  following them.
- Add a TODO comment about genmsi, which isn't emulated yet.
- Don't claim in the comment on writing the h/w target register that the
  stored copy reaches the h/w later, as nothing in this patch does that.
- Update the commit message for the changes above.
- Move the definitions of APLIC_TARGET_IPRIO{,_DEFAULT}, and the
  switch of aplic_init_hw_interrupts() to them, to a separate patch.
- Emulate a write to target[] in vaplic_target_write() instead of in
  vaplic_emulate_store(), and drop the comments repeating the code or
  struct vaplic_source.
- Read target[] under the lock of the source, so that a write is seen
  only once the h/w register follows it.
- Move aplic_hart_index() and the APLIC_xMSICFGADDR_PPN_* macros to
  "xen/riscv: build the target hart index via aplic_hart_index()", which
  now comes first.
---
Changes in v3:
- sourcecfg store emulation: mask the guest value with the new
  APLIC_SOURCECFG_WMASK (D and SM are the only implemented fields, all the
  other bits are reserved and read as zero) instead of rejecting the write
  when the value is above APLIC_SOURCECFG_SM_LEVEL_LOW. The dropped check
  compared the whole value against 7 rather than the SM field, so a legal
  SM with anything set in the reserved bits 9:3 was rejected. SM is WARL
  and vAPLIC keeps no shadow copy of sourcecfg[], so a reserved SM value
  is left to the h/w to normalize; add a TODO covering what will have to be
  emulated here once sourcecfg[] is shadowed.
- Introduce APLIC_SOURCECFG_WMASK in asm/aplic.h.
- target store emulation: reword the comment about a non-zero guest index
  to say that such a write is illegal and is therefore ignored as a whole,
  that the shadow copy keeps the zero it was allocated with, and that
  aplic_msi_target_gen() overwrites the field with vcpu_guest_file_id()
  anyway. Drop the now-redundant "Ignore such writes ..." comment.
- s/aplic_hart_field/aplic_hart_index/ (and the local variable with it):
  the value is the APLIC "Hart Index", not a field of it.
- Clarify the MSI target address documentation above aplic_hart_index():
  name the Guest Index in the address formula, say that the APLIC computes
  the MSI target address itself in MSI delivery mode, and label the two
  parts of the 14-bit Hart Index field as g and h to match the surrounding
  text.
- Don't add the MSI target address scheme diagram to asm/imsic.h: it
  would duplicate the one documented above aplic_hart_index().
- Fix the comment on APLIC_TARGET_IPRIO: the field exists when the target
  is in direct delivery mode (domaincfg.DM = 0), not "in DM mode".
- Rearrange the case blocks of vaplic_emulate_load() and
  vaplic_emulate_store() primarily by register offset: APLIC_DOMAINCFG
  comes first and APLIC_SOURCECFG handling directly follows it; the
  set/clr-num registers are also listed in offset order. No functional
  change.
- Rename the first parameter of aplic_msi_target_gen() from target_vcpu
  to v.
- Use a const-qualified pointer in aplic_hw_read_reg()'s cast to match
  readl()'s prototype.
- Put APLIC_xMSICFGADDR_PPN_HHX_MASK(), APLIC_xMSICFGADDR_PPN_LHX_MASK()
  and APLIC_xMSICFGADDR_PPN_LHX_SHIFT() on a single line each.
- Use gdprintk() instead of dprintk() for guest-triggered messages in
  vaplic.c and drop the redundant "is passed" from the word_idx message.
- Call domain_vaplic_deinit() in both failure paths of
  domain_vaplic_init() instead of open-coding the clean-up.
- aplic_msi_target_gen() takes the hart index from the pCPU the vCPU's
  interrupt file lives on (vsfile_cpu) instead of v->processor, which may
  already name the new pCPU while the vCPU is being migrated. Callers
  have to hold vsfile_lock until the value is written to the h/w, which
  the vAPLIC target write path now does.
- A target register write for a vCPU which has no h/w guest interrupt file
  yet (its vsfile_cpu is CPU_NONE) only updates the stored copy; the h/w
  register isn't programmed, as there is neither a hart nor a guest
  interrupt file to point it at. Add a TODO about s/w guest interrupt
  files, for which the h/w register will have to be written too.
- Turn vaplic_regs.target[] into vaplic_regs.sources[], an array of
  struct vaplic_source holding the guest's view of the target register
  together with a per-source lock which keeps the stored copy and the h/w
  target register updated as a pair. Document how many elements it holds
  and why index 0 is unused.
- Drop the emulation of target register writes in direct delivery mode:
  such writes are ignored with a one-time warning. Resolve the target
  vCPU only in the MSI delivery mode path, where it is used.
---
Changes in v2:
 - Shadow the guest-written target registers in a per-domain array and
   serve reads of APLIC_TARGET_* from it: the hardware register holds the
   value produced by aplic_msi_target_gen() (physical hart field, VS-file
   id), so reading it back would expose the host layout and return
   something the guest never wrote. A non-zero guest index is dropped with
   a one-time warning instead of being echoed back.
 - aplic_hart_field(): take a CPU id instead of a hartid and derive both
   the group and the hart index from msi->base_addr + msi->offset - the
   hart index bits are a part of that offset, so the hartid can't be used
   as the hart index. Add APLIC_xMSICFGADDR_PPN_LHX_{MASK,SHIFT} for that.
 - Document the IMSIC MSI target address layout and the APLIC hart index
   packing above aplic_hart_field(), and correct the corresponding diagram
   in asm/imsic.h.
 - Drop the mask parameter of aplic_hw_read_reg() and apply the
   authorization mask in vaplic_emulate_load() instead.
 - vaplic_emulate_{load,store}(): return bool instead of int, rename v/d to
   curr/currd and add ASSERT(curr == current).
 - Use domain_vcpu() instead of open-coded d->vcpu[] indexing when
   resolving the target hart index.
 - s/APLIC_REG_OFFSET_MASK/APLIC_CTRL_REGION_OFFSET_MASK/.
 - Update store emulation handling for target register to be able to deal
   with target format in both cases (MSI and Direct).
 - Update store emulation handling of domaincfg. There is no need to force
   DM/IE mode here (it will be forced/checked on Xen irq handler side).
 - Rename APLIC_DEFAULT_PRIORITY and move to aplic.h as default prioity
   value is used in vaplic code too now.
---
---
 xen/arch/riscv/aplic-priv.h         |   2 +
 xen/arch/riscv/aplic.c              |  49 +++
 xen/arch/riscv/include/asm/aplic.h  |  28 +-
 xen/arch/riscv/include/asm/vaplic.h |  19 ++
 xen/arch/riscv/vaplic.c             | 504 +++++++++++++++++++++++++++-
 5 files changed, 591 insertions(+), 11 deletions(-)

diff --git a/xen/arch/riscv/aplic-priv.h b/xen/arch/riscv/aplic-priv.h
index 009020c83fb9..9e85343cce0f 100644
--- a/xen/arch/riscv/aplic-priv.h
+++ b/xen/arch/riscv/aplic-priv.h
@@ -47,4 +47,6 @@ struct aplic_priv {
  */
 extern unsigned int guest_aplic_num_sources;
 
+uint32_t aplic_msi_target_gen(const struct vcpu *v, uint32_t base_val);
+
 #endif /* RISCV_APLIC_PRIV_H */
diff --git a/xen/arch/riscv/aplic.c b/xen/arch/riscv/aplic.c
index 29663bc29b7b..51d7eae4617a 100644
--- a/xen/arch/riscv/aplic.c
+++ b/xen/arch/riscv/aplic.c
@@ -15,6 +15,7 @@
 #include <xen/init.h>
 #include <xen/irq.h>
 #include <xen/mm.h>
+#include <xen/sched.h>
 #include <xen/sections.h>
 #include <xen/spinlock.h>
 #include <xen/types.h>
@@ -125,6 +126,54 @@ static unsigned long aplic_hart_index(unsigned int cpu)
     return (g << lhxw) | h;
 }
 
+/*
+ * v->processor can't be used here: during a migration it names the new pCPU
+ * before the interrupt file is moved there. The caller has to hold
+ * vsfile_lock until the result is written to the h/w.
+ */
+uint32_t aplic_msi_target_gen(const struct vcpu *v, uint32_t base_val)
+{
+    const struct vimsic_state *vimsic_state = v->arch.vimsic_state;
+    unsigned int guest_id = vcpu_guest_file_id(v);
+    unsigned long hart_index;
+
+    ASSERT(rw_is_locked(&vimsic_state->vsfile_lock));
+    ASSERT(vimsic_state->vsfile_cpu < NR_CPUS);
+
+    hart_index = aplic_hart_index(vimsic_state->vsfile_cpu);
+
+    base_val &= APLIC_TARGET_EIID;
+    base_val |= MASK_INSR(guest_id, APLIC_TARGET_GUEST_IDX);
+    base_val |= MASK_INSR(hart_index, APLIC_TARGET_HART_IDX);
+
+    return base_val;
+}
+
+uint32_t aplic_hw_read_reg(unsigned int offset)
+{
+    unsigned long flags;
+    uint32_t val;
+
+    ASSERT((offset < aplic.size) && IS_ALIGNED(offset, sizeof(uint32_t)));
+
+    spin_lock_irqsave(&aplic.lock, flags);
+    val = readl((const volatile void __iomem *)aplic.regs + offset);
+    spin_unlock_irqrestore(&aplic.lock, flags);
+
+    return val;
+}
+
+void aplic_hw_write_reg(unsigned int offset, uint32_t value)
+{
+    unsigned long flags;
+
+    ASSERT((offset < aplic.size) && IS_ALIGNED(offset, sizeof(uint32_t)));
+
+    spin_lock_irqsave(&aplic.lock, flags);
+    writel(value, (volatile void __iomem *)aplic.regs + offset);
+    spin_unlock_irqrestore(&aplic.lock, flags);
+}
+
 static void __init aplic_init_hw_interrupts(void)
 {
     unsigned int i;
diff --git a/xen/arch/riscv/include/asm/aplic.h b/xen/arch/riscv/include/asm/aplic.h
index 93f0033b52d0..b2f1d140f6f8 100644
--- a/xen/arch/riscv/include/asm/aplic.h
+++ b/xen/arch/riscv/include/asm/aplic.h
@@ -27,8 +27,6 @@
  * Blocks of related constants are sorted by register offset.
  */
 
-#define APLIC_CTRL_REGION_OFFSET_MASK       0x3fff
-
 #define APLIC_DOMAINCFG                     0x0000
 /*
  * domaincfg read-only fields (AIA spec):
@@ -39,6 +37,13 @@
 #define  APLIC_DOMAINCFG_IE             BIT(8, U)
 #define  APLIC_DOMAINCFG_DM             BIT(2, U)
 #define  APLIC_DOMAINCFG_BE             BIT(0, U)
+/*
+ * The bits a write may change. DM is WARL and hardwired to 1 as only MSI
+ * delivery mode is emulated. Everything else, including the read-only zero
+ * bit 7 and the reserved bits, has to read back as zero, and BE is WARL and
+ * hardwired to 0 as Xen is little-endian only.
+ */
+#define  APLIC_DOMAINCFG_WMASK          APLIC_DOMAINCFG_IE
 
 #define APLIC_SOURCECFG_BASE            0x0004
 #define APLIC_SOURCECFG_LAST            0x0ffc
@@ -59,6 +64,8 @@
 #define   APLIC_SOURCECFG_SM_LEVEL_HIGH 0x6
 #define   APLIC_SOURCECFG_SM_LEVEL_LOW  0x7
 
+#define APLIC_MMSICFGADDR               0x1bc0
+#define APLIC_MMSICFGADDRH              0x1bc4
 #define APLIC_SMSICFGADDR               0x1bc8
 #define APLIC_SMSICFGADDRH              0x1bcc
 
@@ -79,6 +86,7 @@
 #define APLIC_CLRIENUM                  0x1fdc
 
 #define APLIC_SETIPNUM_LE               0x2000
+#define APLIC_SETIPNUM_BE               0x2004
 
 #define APLIC_GENMSI                    0x3000
 
@@ -98,8 +106,17 @@
 #define APLIC_MIN_SIZE                  0x4000
 #define APLIC_SIZE_ALIGN(x)             ROUNDUP(x, APLIC_MIN_SIZE)
 
-#define APLIC_SIZE(nr_cpus) \
-    (APLIC_MIN_SIZE + APLIC_SIZE_ALIGN(APLIC_IDC_SIZE * (nr_cpus)))
+#define APLIC_SIZE(nr_idcs) \
+    (APLIC_MIN_SIZE + APLIC_SIZE_ALIGN(APLIC_IDC_SIZE * (nr_idcs)))
+
+/*
+ * Using setip is fine here, as all SET* and CLR* register groups consist of 32
+ * registers and therefore have identical sizes.
+ *
+ * Lowest 2 bits are always zero for SET* and CLR* registers.
+ */
+#define APLIC_SETCLR_OFFSET_MASK \
+    (sizeof_field(struct aplic_regs, setip) - sizeof(uint32_t))
 
 #define APLIC_xMSICFGADDR_PPN_SHIFT IMSIC_MMIO_PAGE_SHIFT
 
@@ -153,4 +170,7 @@ struct aplic_regs {
     uint32_t target[1023];      /* 0x3004 */
 };
 
+uint32_t aplic_hw_read_reg(unsigned int offset);
+void aplic_hw_write_reg(unsigned int offset, uint32_t value);
+
 #endif /* RISCV_APLIC_H */
diff --git a/xen/arch/riscv/include/asm/vaplic.h b/xen/arch/riscv/include/asm/vaplic.h
index dcbe0d59a886..9a121904a346 100644
--- a/xen/arch/riscv/include/asm/vaplic.h
+++ b/xen/arch/riscv/include/asm/vaplic.h
@@ -11,6 +11,7 @@
 #define RISCV_VAPLIC_H
 
 #include <xen/kernel.h>
+#include <xen/spinlock.h>
 #include <xen/types.h>
 
 #include <asm/intc.h>
@@ -19,13 +20,31 @@ struct domain;
 
 #define to_vaplic(d) container_of((d)->arch.vintc, struct vaplic, vintc)
 
+/* State of one vAPLIC interrupt source. */
+struct vaplic_source {
+    /* Protects target together with the h/w target register of the source. */
+    spinlock_t lock;
+
+    /* Guest's view of the APLIC target register. */
+    uint32_t target;
+};
+
 struct vaplic_regs {
     uint32_t domaincfg;
+
+    /*
+     * Indexed by source number. The array holds d->arch.vintc->nr_virqs
+     * elements; sources[0] is unused as APLIC interrupt sources start from 1.
+     */
+    struct vaplic_source *sources;
 };
 
 struct vaplic {
     struct vintc vintc;
     struct vaplic_regs regs;
+
+    paddr_t regs_start;
+    unsigned int regs_size;
 };
 
 int domain_vaplic_init(struct domain *d);
diff --git a/xen/arch/riscv/vaplic.c b/xen/arch/riscv/vaplic.c
index 6fbdc07805fd..7898455b4934 100644
--- a/xen/arch/riscv/vaplic.c
+++ b/xen/arch/riscv/vaplic.c
@@ -11,12 +11,14 @@
 #include <xen/errno.h>
 #include <xen/fdt-kernel.h>
 #include <xen/libfdt/libfdt.h>
+#include <xen/nospec.h>
 #include <xen/sched.h>
 #include <xen/xvmalloc.h>
 
 #include <asm/aia.h>
 #include <asm/imsic.h>
 #include <asm/intc.h>
+#include <asm/mmio.h>
 #include <asm/vaplic.h>
 
 #include "aplic-priv.h"
@@ -27,23 +29,428 @@ unsigned int __ro_after_init guest_aplic_num_sources;
 
 #define FDT_VAPLIC_INT_CELLS 2
 
+/*
+ * Only a h/w source of a domain, one a h/w IRQ is routed to (see
+ * vintc.hw_irqs), may be accessed in the h/w. A virtual source has nothing
+ * there: until its state is emulated, it reads as zero and ignores writes,
+ * like a source not assigned to the domain.
+ */
+static bool vaplic_is_hw_source(const struct domain *d, unsigned int irqn)
+{
+    const struct vintc *vintc = d->arch.vintc;
+
+    return (irqn < vintc->nr_virqs) &&
+           test_bit(array_index_nospec(irqn, vintc->nr_virqs),
+                    vintc->hw_irqs);
+}
+
+/*
+ * Convert a byte offset (within a SETIP/CLRIP/SETIE/CLRIE register group) to
+ * a 32-bit word index into the hw_irqs bitmap. Each word covers 32
+ * interrupt sources. For SOURCECFG and TARGET groups the same division also
+ * yields the interrupt number directly, because those arrays store one 32-bit
+ * register per source.
+ */
+#define regoffset_to_word_idx(reg_val) ((reg_val) / sizeof(uint32_t))
+
+/*
+ * vAPLIC keeps no shadow copy of sourcecfg[], and a guest's writes to it go
+ * straight to the h/w register, so it is the h/w register which tells whether
+ * a source is active.
+ */
+static bool vaplic_source_is_active(unsigned int irqn)
+{
+    uint32_t sourcecfg = aplic_hw_read_reg(APLIC_SOURCECFG_BASE +
+                                           (irqn - 1) * sizeof(uint32_t));
+
+    /*
+     * A source is inactive if it is delegated to a child domain (D = 1), in
+     * which case the low bits hold the Child Index rather than SM, or if it
+     * isn't delegated and SM is Inactive.
+     */
+    return !(sourcecfg & APLIC_SOURCECFG_D) &&
+           (MASK_EXTR(sourcecfg, APLIC_SOURCECFG_SM) !=
+            APLIC_SOURCECFG_SM_INACTIVE);
+}
+
+static uint32_t vaplic_target_read(const struct domain *d, unsigned int irqn)
+{
+    struct vaplic *vaplic = to_vaplic(d);
+    struct vaplic_source *src;
+    unsigned long flags;
+    uint32_t val = 0;
+
+    /* target[0] doesn't exist so irqn == 0 should be impossible */
+    if ( !irqn || irqn >= vaplic->vintc.nr_virqs )
+        return 0;
+
+    irqn = array_index_nospec(irqn, vaplic->vintc.nr_virqs);
+    src = &vaplic->regs.sources[irqn];
+
+    /*
+     * src->lock makes the read atomic as a whole, against a write to
+     * target[] which changes both this copy and the h/w register.
+     */
+    spin_lock_irqsave(&src->lock, flags);
+
+    /* target[i] is read-only zero while source i is inactive. */
+    if ( vaplic_source_is_active(irqn) )
+        val = src->target;
+
+    spin_unlock_irqrestore(&src->lock, flags);
+
+    return val;
+}
+
+/* Emulate a write of @value to target[@irqn]. */
+static void vaplic_target_write(const struct domain *d, unsigned int irqn,
+                                uint32_t value)
+{
+    struct vaplic *vaplic = to_vaplic(d);
+    struct vimsic_state *vimsic_state;
+    const struct vcpu *target_vcpu;
+    struct vaplic_source *src;
+    unsigned long flags;
+
+    if ( !vaplic_is_hw_source(d, irqn) )
+        return;
+
+    irqn = array_index_nospec(irqn, d->arch.vintc->nr_virqs);
+
+    /* target[i] is read-only zero while source i is inactive. */
+    if ( !vaplic_source_is_active(irqn) )
+        return;
+
+    target_vcpu = domain_vcpu(d, MASK_EXTR(value, APLIC_TARGET_HART_IDX));
+    if ( !target_vcpu )
+    {
+        gdprintk(XENLOG_ERR, "Invalid vCPU id in target register\n");
+
+        return;
+    }
+
+    /*
+     * Guest Index names an interrupt file of a nested guest, and the AIA
+     * spec makes it read-only zero unless the domain's harts implement the
+     * H extension, which a guest's harts don't. Bit 11 is reserved and reads
+     * as zero, so only Hart Index and EIID are kept.
+     * What ends up in the h/w register is Xen's own value anyway:
+     * aplic_msi_target_gen() takes only EIID from it.
+     */
+    value &= APLIC_TARGET_HART_IDX | APLIC_TARGET_EIID;
+
+    src = &vaplic->regs.sources[irqn];
+    vimsic_state = target_vcpu->arch.vimsic_state;
+
+    spin_lock_irqsave(&src->lock, flags);
+
+    write_atomic(&src->target, value);
+
+    /* IRQs are already off under src->lock. */
+    read_lock(&vimsic_state->vsfile_lock);
+
+    /*
+     * The h/w register names the hart and the guest interrupt file MSIs are
+     * sent to, and there is none of either until the target vCPU is given a
+     * h/w guest interrupt file, so until then only the stored copy is
+     * updated.
+     *
+     * TODO: once s/w guest interrupt files are supported, a vCPU using one
+     * still needs its MSIs, so the h/w register will have to be written for
+     * it too, pointing at an interrupt file Xen receives them in on the
+     * vCPU's behalf.
+     */
+    if ( vimsic_state->vsfile_cpu != CPU_NONE )
+        aplic_hw_write_reg(offsetof(struct aplic_regs, target[irqn - 1]),
+                           aplic_msi_target_gen(target_vcpu, value));
+
+    read_unlock(&vimsic_state->vsfile_lock);
+
+    spin_unlock_irqrestore(&src->lock, flags);
+}
+
+static uint32_t generate_auth_mask(const struct domain *currd,
+                                   unsigned int word_idx)
+{
+    unsigned int nr_words = DIV_ROUND_UP(currd->arch.vintc->nr_virqs,
+                                         sizeof(uint32_t) * BITS_PER_BYTE);
+    unsigned int first_bit;
+
+    if ( word_idx >= nr_words )
+    {
+        gdprintk(XENLOG_DEBUG, "incorrect word_idx(%u)\n", word_idx);
+
+        return 0;
+    }
+
+    first_bit = array_index_nospec(word_idx, nr_words) *
+                sizeof(uint32_t) * BITS_PER_BYTE;
+
+    return currd->arch.vintc->hw_irqs[first_bit / BITS_PER_LONG] >>
+           (first_bit % BITS_PER_LONG);
+}
+
+static bool vaplic_emulate_load(const struct vcpu *curr, paddr_t addr,
+                                uint32_t *out)
+{
+    const struct domain *currd = curr->domain;
+    const struct vaplic *vaplic = to_vaplic(currd);
+    const unsigned int offset = addr - vaplic->regs_start;
+    uint32_t auth_mask;
+    unsigned int i;
+
+    ASSERT(curr == current);
+
+    switch ( offset )
+    {
+    case APLIC_DOMAINCFG:
+        *out = vaplic->regs.domaincfg;
+
+        return true;
+
+    case APLIC_SOURCECFG_BASE ... APLIC_SOURCECFG_LAST:
+        /*
+         * Look at vaplic_emulate_store() for explanation why APLIC_DOMAINCFG
+         * is subtracted.
+         */
+        i = regoffset_to_word_idx(offset - APLIC_DOMAINCFG);
+        *out = vaplic_is_hw_source(currd, i) ? aplic_hw_read_reg(offset) : 0;
+
+        return true;
+
+    case APLIC_SETIP_BASE ... APLIC_SETIP_LAST:
+    case APLIC_CLRIP_BASE ... APLIC_CLRIP_LAST:
+    case APLIC_SETIE_BASE ... APLIC_SETIE_LAST:
+        i = regoffset_to_word_idx(offset & APLIC_SETCLR_OFFSET_MASK);
+        auth_mask = generate_auth_mask(currd, i);
+
+        break;
+
+    case APLIC_SETIPNUM:
+    case APLIC_CLRIPNUM:
+    case APLIC_SETIENUM:
+    case APLIC_CLRIE_BASE ... APLIC_CLRIE_LAST:
+    case APLIC_CLRIENUM:
+    case APLIC_SETIPNUM_LE:
+        /*
+         * Based on the RISC-V AIA spec a read of these registers
+         * always returns zero
+         */
+        *out = 0;
+
+        return true;
+
+    /*
+     * vAPLIC is a supervisor-level domain with BE hardwired to 0, and such
+     * a domain doesn't implement these registers: the MSI address
+     * configuration ones exist in machine-level domains only, and
+     * setipnum_be isn't needed by a little-endian only domain. Bytes of a
+     * register which isn't implemented are read-only zero, like other
+     * reserved bytes.
+     */
+    case APLIC_MMSICFGADDR:
+    case APLIC_MMSICFGADDRH:
+    case APLIC_SMSICFGADDR:
+    case APLIC_SMSICFGADDRH:
+    case APLIC_SETIPNUM_BE:
+        *out = 0;
+
+        return true;
+
+    case APLIC_TARGET_BASE ... APLIC_TARGET_LAST:
+        /*
+         * As target registers start from 1:
+         *  0x3000 genmsi
+         *  0x3004 target[1]
+         *  0x3008 target[2]
+         *   ...
+         *  0x3FFC target[1023]
+         * It is necessary to calculate an interrupt number by subtracting
+         * APLIC_GENMSI instead of APLIC_TARGET_BASE.
+         */
+        i = regoffset_to_word_idx(offset - APLIC_GENMSI);
+
+        *out = vaplic_is_hw_source(currd, i) ? vaplic_target_read(currd, i) : 0;
+
+        return true;
+
+    /*
+     * TODO: emulate genmsi. A write to it has to send an extempore MSI to
+     * the target vCPU, and a guest typically waits for that MSI to become
+     * pending in its interrupt file. Just recording the written value would
+     * leave such a guest waiting forever, so until genmsi is emulated, an
+     * access to it is treated as an unhandled one, which gets the domain
+     * crashed.
+     */
+    case APLIC_GENMSI:
+    default:
+        gdprintk(XENLOG_WARNING, "Unhandled APLIC read at offset %#x\n",
+                 offset);
+
+        return false;
+    }
+
+    *out = aplic_hw_read_reg(offset) & auth_mask;
+
+    return true;
+}
+
+static bool vaplic_emulate_store(const struct vcpu *curr, paddr_t addr,
+                                 uint32_t value)
+{
+    const struct domain *currd = curr->domain;
+    struct vaplic *vaplic = to_vaplic(currd);
+    unsigned int offset = addr - vaplic->regs_start;
+
+    ASSERT(curr == current);
+
+    switch ( offset )
+    {
+    case APLIC_DOMAINCFG:
+        /*
+         * TODO: domaincfg.IE isn't honoured: the h/w forwards the MSIs of the
+         * h/w sources whatever its value is. Linux as a guest sets IE before
+         * it enables any source and never clears it, so a write may set IE,
+         * but not clear it.
+         */
+        vaplic->regs.domaincfg |= value & APLIC_DOMAINCFG_WMASK;
+
+        return true;
+
+    case APLIC_SOURCECFG_BASE ... APLIC_SOURCECFG_LAST:
+        /*
+         * vAPLIC is a leaf domain: it has no child domain a source could be
+         * delegated to. With D = 1, the low bits of the value would hold a
+         * Child Index rather than SM, and for a leaf domain the AIA spec
+         * makes such a write set the entire register to zero instead.
+         */
+        if ( value & APLIC_SOURCECFG_D )
+        {
+            gdprintk(XENLOG_DEBUG,
+                     "sourcecfg write with D set at offset %#x, zeroing it\n",
+                     offset);
+
+            value = 0;
+        }
+
+        /*
+         * SM is the only field left, the other bits are reserved and read as
+         * zero, so ignore what a guest writes to them.
+         */
+        value &= APLIC_SOURCECFG_SM;
+
+        /*
+         * SM is WARL, so the reserved values 0x2 and 0x3 need no handling
+         * here: vAPLIC keeps no shadow copy of sourcecfg[], the value is
+         * written straight to the h/w register and is read back from it, so
+         * it is the h/w which substitutes a legal value for an illegal one.
+         *
+         * TODO: when vAPLIC starts to shadow sourcecfg[], the WARL behaviour
+         * will have to be emulated here instead, e.g.:
+         *   if ( value == 0x2 || value == 0x3 )
+         *       value = APLIC_SOURCECFG_SM_INACTIVE;
+         */
+
+        /*
+         * As sourcecfg register starts from 1:
+         *   0x0000 domaincfg
+         *   0x0004 sourcecfg[1]
+         *   0x0008 sourcecfg[2]
+         *    ...
+         *   0x0FFC sourcecfg[1023]
+         * It is necessary to calculate an interrupt number by subtracting
+         * APLIC_DOMAINCFG instead of APLIC_SOURCECFG_BASE.
+         */
+        if ( !vaplic_is_hw_source(currd,
+                                  regoffset_to_word_idx(offset -
+                                                        APLIC_DOMAINCFG)) )
+            /* Interrupt not enabled, ignore it */
+            return true;
+
+        break;
+
+    case APLIC_SETIP_BASE ... APLIC_SETIP_LAST:
+    case APLIC_CLRIP_BASE ... APLIC_CLRIP_LAST:
+    case APLIC_SETIE_BASE ... APLIC_SETIE_LAST:
+    case APLIC_CLRIE_BASE ... APLIC_CLRIE_LAST:
+    {
+        unsigned int word_idx =
+            regoffset_to_word_idx(offset & APLIC_SETCLR_OFFSET_MASK);
+
+        value &= generate_auth_mask(currd, word_idx);
+
+        break;
+    }
+
+    case APLIC_SETIPNUM:
+    case APLIC_CLRIPNUM:
+    case APLIC_SETIENUM:
+    case APLIC_CLRIENUM:
+    case APLIC_SETIPNUM_LE:
+        if ( !value || !vaplic_is_hw_source(currd, value) )
+            return true;
+
+        break;
+
+    /* Not implemented by vAPLIC, see vaplic_emulate_load(). */
+    case APLIC_MMSICFGADDR:
+    case APLIC_MMSICFGADDRH:
+    case APLIC_SMSICFGADDR:
+    case APLIC_SMSICFGADDRH:
+    case APLIC_SETIPNUM_BE:
+        return true;
+
+    case APLIC_TARGET_BASE ... APLIC_TARGET_LAST:
+        /*
+         * Look at vaplic_emulate_load() for explanation why APLIC_GENMSI is
+         * subtracted.
+         */
+        vaplic_target_write(currd,
+                            regoffset_to_word_idx(offset - APLIC_GENMSI),
+                            value);
+
+        return true;
+
+    /* TODO: emulate genmsi, see vaplic_emulate_load(). */
+    case APLIC_GENMSI:
+    default:
+        gdprintk(XENLOG_WARNING,
+                 "Unhandled APLIC write at offset %#x (value %#x)\n",
+                 offset, value);
+
+        return false;
+    }
+
+    /*
+     * What is left is passed through to the h/w, which can affect only the
+     * h/w sources of currd:
+     *  - setip, clrip, setie and clrie are write-1-to-set/clear, and the
+     *    value was masked with currd's h/w sources above, so the bits of
+     *    the other sources are written as 0, which leaves them untouched;
+     *  - {set,clr}i{p,e}num, setipnum_le and sourcecfg[] name one source,
+     *    which was checked above to be a h/w source of currd.
+     * route_irq_to_guest() never assigns a source to more than one domain,
+     * or to both a domain and Xen, and as virq == pirq, no translation is
+     * needed either.
+     */
+    aplic_hw_write_reg(offset, value);
+
+    return true;
+}
+
 static int __init cf_check vaplic_make_domu_dt_node(struct kernel_info *kinfo)
 {
-    struct domain *d = kinfo->bd.d;
     int res;
     void *fdt = kinfo->fdt;
     unsigned int msi_parent_phandle;
     char vaplic_name[32];
-    unsigned int aplic_size = APLIC_SIZE(d->max_vcpus);
     const __be32 reg[] = {
         cpu_to_be32(GUEST_APLIC_S_BASE >> 32),
         cpu_to_be32(GUEST_APLIC_S_BASE),
         cpu_to_be32(0),
-        cpu_to_be32(aplic_size),
+        cpu_to_be32(APLIC_SIZE(0)),
     };
 
-    BUILD_BUG_ON(APLIC_SIZE(MAX_VIRT_CPUS) > UINT_MAX);
-
     res = snprintf(vaplic_name, ARRAY_SIZE(vaplic_name), "/soc/aplic@%lx",
                    GUEST_APLIC_S_BASE);
     if ( res >= sizeof(vaplic_name) )
@@ -95,6 +502,57 @@ static const struct vintc_init_ops __initconstrel init_ops = {
     .make_domu_dt_node = vaplic_make_domu_dt_node,
 };
 
+static enum io_state cf_check vaplic_mmio_read(struct vcpu *curr,
+                                               mmio_info_t *info)
+{
+    uint32_t val;
+
+    ASSERT(curr == current);
+
+    if ( info->len != sizeof(uint32_t) ||
+         !IS_ALIGNED(info->gpa, sizeof(uint32_t)) )
+    {
+        gdprintk(XENLOG_DEBUG,
+                 "unaligned/wrong-width read gpa=%"PRIpaddr" len=%u\n",
+                 info->gpa, info->len);
+
+        return IO_ABORT;
+    }
+
+    if ( !vaplic_emulate_load(curr, info->gpa, &val) )
+        return IO_ABORT;
+
+    info->data = val;
+
+    return IO_HANDLED;
+}
+
+static enum io_state cf_check vaplic_mmio_write(struct vcpu *curr,
+                                                const mmio_info_t *info)
+{
+    ASSERT(curr == current);
+
+    if ( info->len != sizeof(uint32_t) ||
+         !IS_ALIGNED(info->gpa, sizeof(uint32_t)) )
+    {
+        gdprintk(XENLOG_DEBUG,
+                 "unaligned/wrong-width write gpa=%"PRIpaddr" len=%u\n",
+                 info->gpa, info->len);
+
+        return IO_ABORT;
+    }
+
+    if ( !vaplic_emulate_store(curr, info->gpa, info->data) )
+        return IO_ABORT;
+
+    return IO_HANDLED;
+}
+
+static const struct mmio_handler_ops vaplic_mmio_ops = {
+    .read  = vaplic_mmio_read,
+    .write = vaplic_mmio_write,
+};
+
 static const struct vintc_ops vintc_ops = {
     .vcpu_init = vcpu_imsic_init,
     .vcpu_deinit = vcpu_imsic_deinit,
@@ -103,6 +561,8 @@ static const struct vintc_ops vintc_ops = {
 int domain_vaplic_init(struct domain *d)
 {
     struct vaplic *vaplic = xvzalloc(struct vaplic);
+    unsigned int i;
+    int rc;
 
     if ( !vaplic )
         return -ENOMEM;
@@ -111,7 +571,7 @@ int domain_vaplic_init(struct domain *d)
     d->arch.vintc->ops = &vintc_ops;
     d->arch.vintc->init_ops = &init_ops;
 
-    vaplic->regs.domaincfg = APLIC_DOMAINCFG_RO;
+    vaplic->regs.domaincfg = APLIC_DOMAINCFG_RO | APLIC_DOMAINCFG_DM;
 
     /*
      * APLIC source 0 is reserved; sources are numbered
@@ -123,7 +583,36 @@ int domain_vaplic_init(struct domain *d)
      */
     d->arch.vintc->nr_virqs = guest_aplic_num_sources + 1;
 
-    return 0;
+    /* Slot 0 is unused: APLIC source numbering starts at 1 (see used_irqs). */
+    vaplic->regs.sources = xvzalloc_array(struct vaplic_source,
+                                          d->arch.vintc->nr_virqs);
+    if ( !vaplic->regs.sources )
+    {
+        domain_vaplic_deinit(d);
+
+        return -ENOMEM;
+    }
+
+    for ( i = 0; i < d->arch.vintc->nr_virqs; i++ )
+        spin_lock_init(&vaplic->regs.sources[i].lock);
+
+    vaplic->regs_start = GUEST_APLIC_S_BASE;
+    /*
+     * IDC structures are used only in direct delivery mode, so the control
+     * region of vAPLIC, which supports MSI delivery mode only, holds none.
+     *
+     * TODO: should direct delivery mode ever be supported, the region will
+     * have to hold an IDC structure per vCPU, i.e. be APLIC_SIZE(d->max_vcpus)
+     * here and in vaplic_make_domu_dt_node().
+     */
+    vaplic->regs_size = APLIC_SIZE(0);
+
+    rc = register_mmio_handler(d, &vaplic_mmio_ops,
+                               vaplic->regs_start, vaplic->regs_size);
+    if ( rc )
+        domain_vaplic_deinit(d);
+
+    return rc;
 }
 
 void domain_vaplic_deinit(struct domain *d)
@@ -135,5 +624,6 @@ void domain_vaplic_deinit(struct domain *d)
 
     vaplic = to_vaplic(d);
     d->arch.vintc = NULL;
+    xvfree(vaplic->regs.sources);
     xvfree(vaplic);
 }
-- 
2.56.1


