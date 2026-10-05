Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA2D4CA5FF0
	for <xen-devel@archiver.kernel.org>; Mon,  5 Oct 2026 14:54:03 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1440927.1658467 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xDk4b-000512-BR; Mon, 05 Oct 2026 14:53:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1440927.1658467; Mon, 05 Oct 2026 14:53:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xDk4b-00050J-6f; Mon, 05 Oct 2026 14:53:49 +0000
Received: by outflank-mailman (input) for mailman id 1440927;
 Mon, 05 Oct 2026 14:53:47 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xDk4Z-0004xs-JM
 for xen-devel@lists.xenproject.org; Mon, 05 Oct 2026 14:53:47 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xDk4Y-002r38-Cb
 for xen-devel@lists.xenproject.org; Mon, 05 Oct 2026 16:53:46 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a10c8e58370003f66@swg.vates.tech>)
 id 6ac3b9ce-2eae-0a2a0a5409dd-0a2a4505eae2-40
 for <xen-devel@lists.xenproject.org>; Mon, 05 Oct 2026 16:53:46 +0200
Received: from [185.255.28.35] (helo=prod-mta-13-02.swg-srv.net)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a10c8e58370003f66@swg.vates.tech>)
 id 6ac3b9f9-4cb1-0a2a45050019-b9ff1c23a875-3
 for <xen-devel@lists.xenproject.org>; Mon, 05 Oct 2026 16:53:46 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a10c8e58370003f66.007 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 05 Oct 2026 14:53:37 +0000
Received: from [192.168.1.46] (areims-651-1-80-194.w90-18.abo.wanadoo.fr
 [90.18.187.194]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id DCC66822E7;
 Mon,  5 Oct 2026 16:53:36 +0200 (CEST)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=vates.tech header.i="@vates.tech" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:References:Feedback-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=dEs1DO6iBwGLd3lKy4Jju50N+3ZaDo1LeTi18JrvneQ=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=RcHh0dOkVaC2ux7YZ9LcKopfyim0ju1U8Q/8Y+/TGDhrYHYx2xSK2DF0aCPv61VJ63cYJJRhn
 4cnXq8bxDYRNhMwOOUqS1+z/frlZVHoBPPfscC6haW/d8czUcJWmywM7zOhQBqNIwvngORlAG/Y
 nGb7aERo20mZRytrZKbC6Odqg1a5t7jJVdYUkNoWNod70jaC56KlJMPYj6S+mutMqHPRHRy37Kl
 Y/Q5AboFZ8H8p/di7GwD0Ym3Hxg3/Vjl9rtVSDRxeQOF/WMqSWGHwZwNC2hK1F7TLQq+STmydq/
 tZD+M1E7L87H7vuLclck+lF7PYvx4Z8olxILkT+4CdFg==
X-Zone-Loop: 332918cd9e293d554ec36147713fc3f3ffbb25712c7d
x-campaign-type: default
x-transaction-id: 51d1a542-347d-449a-b184-643bb46f61b2
x-swg-uid: 01-d4e27ef3-bf9c-4f2a-a84f-22f329ad3e4a
X-Mailer: Sweego
Message-ID:
 <1791212017.8631fc262581453bbf619ec5b2062170.1a10c8e58370003f66@vates.tech>
x-swg-bid: 1791212017.8631fc262581453bbf619ec5b2062170.1a10c8e58370003f66
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v3 08/39] xen/riscv: implement virtual APLIC MMIO
 emulation
From: Baptiste Le Duc <baptiste.le-duc@vates.tech>
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: xen-devel@lists.xenproject.org, 
 Romain Caritey <Romain.Caritey@microchip.com>, 
 Baptiste Le Duc <baptiste.le-duc@vates.tech>, 
 Zheng Zhang <zhangzheng@iscas.ac.cn>, 
 Alistair Francis <alistair.francis@wdc.com>, 
 Connor Davis <connojdavis@gmail.com>, 
 Andrew Cooper <andrew.cooper3@citrix.com>, 
 Anthony PERARD <anthony.perard@vates.tech>, 
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, 
 Julien Grall <julien@xen.org>, 
 =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>, 
 Stefano Stabellini <sstabellini@kernel.org>
In-Reply-To: <bd546cae116c93c88706b49e7c24a125b4e5237c.1790779209.git.oleksii.kurochko@gmail.com>
References: <cover.1790779209.git.oleksii.kurochko@gmail.com>
 <bd546cae116c93c88706b49e7c24a125b4e5237c.1790779209.git.oleksii.kurochko@gmail.com>
Date: Mon, 05 Oct 2026 16:53:30 +0200
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791212011; l=38668;
 i=baptiste.le-duc@vates.tech; s=20260810; h=from:subject:message-id;
 bh=6ar0c/wvBKgkYrmU92rBAEwOb7qWr+QofQeydvv8nrA=;
 b=aiN50mULOSFR7MhIX0VB3qUaj0w52RA73NhhEbAk1pScHS8quyr0Eqv3rhfhxF/QWYt6Kcv53
 z684Fun4zPsDO9ckJUXw1hxg5q0/ncfjwCRL/KH8YdpSKV7KeCV0t+I
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=ed25519;
 pk=N+BbdvMXRzrCuX/ieh4RWodiAKcLNvI+KjflcZ0oXCo=
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1791212017107
X-purgate-ID: tlsNG-c201ff/1791212026-736BD2A1-5C2A79C0/10/73395122804
X-purgate-type: spam
X-purgate-size: 38668

> Guests running under Xen program interrupt routing by writing to APLIC
> MMIO registers. Xen must intercept these accesses to enforce interrupt
> isolation between domains and to translate guest routing intent into the
> underlying physical MSI topology.
> 
> Register the vAPLIC range with the MMIO dispatch and emulate the accesses:
>  - reads and writes are masked with the domain's authorised interrupt
>    bitmap, so that a guest can neither observe nor affect interrupts it
>    does not own;
>  - target registers are shadowed per source, so that a guest reads back
>    what it wrote. The h/w register instead gets the hart index and guest
>    interrupt file of the pCPU the target vCPU's interrupt file lives on,
>    as the APLIC uses these fields directly to compute the MSI address. As
>    long as the target vCPU has no h/w guest interrupt file, only the
>    shadow copy is updated;
>  - only MSI delivery mode is emulated: target writes made while the
>    guest's domaincfg.DM is clear are ignored.
> 
> Delegation (APLIC_SOURCECFG_D) is not yet supported.
> 
> Co-developed-by: Romain Caritey <Romain.Caritey@microchip.com>
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Co-developed-by: needs a matching Signed-off-by: from Romain right after
it.

> ---
> Changes in v3:
> - sourcecfg store emulation: mask the guest value with the new
>   APLIC_SOURCECFG_WMASK (D and SM are the only implemented fields, all the
>   other bits are reserved and read as zero) instead of rejecting the write
>   when the value is above APLIC_SOURCECFG_SM_LEVEL_LOW. The dropped check
>   compared the whole value against 7 rather than the SM field, so a legal
>   SM with anything set in the reserved bits 9:3 was rejected. SM is WARL
>   and vAPLIC keeps no shadow copy of sourcecfg[], so a reserved SM value
>   is left to the h/w to normalize; add a TODO covering what will have to be
>   emulated here once sourcecfg[] is shadowed.
> - Introduce APLIC_SOURCECFG_WMASK in asm/aplic.h.
> - target store emulation: reword the comment about a non-zero guest index
>   to say that such a write is illegal and is therefore ignored as a whole,
>   that the shadow copy keeps the zero it was allocated with, and that
>   aplic_msi_target_gen() overwrites the field with vcpu_guest_file_id()
>   anyway. Drop the now-redundant "Ignore such writes ..." comment.
> - s/aplic_hart_field/aplic_hart_index/ (and the local variable with it):
>   the value is the APLIC "Hart Index", not a field of it.
> - Clarify the MSI target address documentation above aplic_hart_index():
>   name the Guest Index in the address formula, say that the APLIC computes
>   the MSI target address itself in MSI delivery mode, and label the two
>   parts of the 14-bit Hart Index field as g and h to match the surrounding
>   text.
> - Don't add the MSI target address scheme diagram to asm/imsic.h: it
>   would duplicate the one documented above aplic_hart_index().
> - Fix the comment on APLIC_TARGET_IPRIO: the field exists when the target
>   is in direct delivery mode (domaincfg.DM = 0), not "in DM mode".
> - Rearrange the case blocks of vaplic_emulate_load() and
>   vaplic_emulate_store() primarily by register offset: APLIC_DOMAINCFG
>   comes first and APLIC_SOURCECFG handling directly follows it; the
>   set/clr-num registers are also listed in offset order. No functional
>   change.
> - Rename the first parameter of aplic_msi_target_gen() from target_vcpu
>   to v.
> - Use a const-qualified pointer in aplic_hw_read_reg()'s cast to match
>   readl()'s prototype.
> - Put APLIC_xMSICFGADDR_PPN_HHX_MASK(), APLIC_xMSICFGADDR_PPN_LHX_MASK()
>   and APLIC_xMSICFGADDR_PPN_LHX_SHIFT() on a single line each.
> - Use gdprintk() instead of dprintk() for guest-triggered messages in
>   vaplic.c and drop the redundant "is passed" from the word_idx message.
> - Call domain_vaplic_deinit() in both failure paths of
>   domain_vaplic_init() instead of open-coding the clean-up.
> - aplic_msi_target_gen() takes the hart index from the pCPU the vCPU's
>   interrupt file lives on (vsfile_cpu) instead of v->processor, which may
>   already name the new pCPU while the vCPU is being migrated. Callers
>   have to hold vsfile_lock until the value is written to the h/w, which
>   the vAPLIC target write path now does.
> - A target register write for a vCPU which has no h/w guest interrupt file
>   yet (its vsfile_cpu is CPU_NONE) only updates the stored copy; the h/w
>   register isn't programmed, as there is neither a hart nor a guest
>   interrupt file to point it at. Add a TODO about s/w guest interrupt
>   files, for which the h/w register will have to be written too.
> - Turn vaplic_regs.target[] into vaplic_regs.sources[], an array of
>   struct vaplic_source holding the guest's view of the target register
>   together with a per-source lock which keeps the stored copy and the h/w
>   target register updated as a pair. Document how many elements it holds
>   and why index 0 is unused.
> - Drop the emulation of target register writes in direct delivery mode:
>   such writes are ignored with a one-time warning. Resolve the target
>   vCPU only in the MSI delivery mode path, where it is used.
> ---
> Changes in v2:
>  - Shadow the guest-written target registers in a per-domain array and
>    serve reads of APLIC_TARGET_* from it: the hardware register holds the
>    value produced by aplic_msi_target_gen() (physical hart field, VS-file
>    id), so reading it back would expose the host layout and return
>    something the guest never wrote. A non-zero guest index is dropped with
>    a one-time warning instead of being echoed back.
>  - aplic_hart_field(): take a CPU id instead of a hartid and derive both
>    the group and the hart index from msi->base_addr + msi->offset - the
>    hart index bits are a part of that offset, so the hartid can't be used
>    as the hart index. Add APLIC_xMSICFGADDR_PPN_LHX_{MASK,SHIFT} for that.
>  - Document the IMSIC MSI target address layout and the APLIC hart index
>    packing above aplic_hart_field(), and correct the corresponding diagram
>    in asm/imsic.h.
>  - Drop the mask parameter of aplic_hw_read_reg() and apply the
>    authorization mask in vaplic_emulate_load() instead.
>  - vaplic_emulate_{load,store}(): return bool instead of int, rename v/d to
>    curr/currd and add ASSERT(curr == current).
>  - Use domain_vcpu() instead of open-coded d->vcpu[] indexing when
>    resolving the target hart index.
>  - s/APLIC_REG_OFFSET_MASK/APLIC_CTRL_REGION_OFFSET_MASK/.
>  - Update store emulation handling for target register to be able to deal
>    with target format in both cases (MSI and Direct).
>  - Update store emulation handling of domaincfg. There is no need to force
>    DM/IE mode here (it will be forced/checked on Xen irq handler side).
>  - Rename APLIC_DEFAULT_PRIORITY and move to aplic.h as default prioity
>    value is used in vaplic code too now.
> ---
> ---
>  xen/arch/riscv/aplic-priv.h         |   2 +
>  xen/arch/riscv/aplic.c              | 138 +++++++++-
>  xen/arch/riscv/include/asm/aplic.h  |  37 +++
>  xen/arch/riscv/include/asm/vaplic.h |  19 ++
>  xen/arch/riscv/vaplic.c             | 384 +++++++++++++++++++++++++++-
>  5 files changed, 575 insertions(+), 5 deletions(-)
>
> diff --git a/xen/arch/riscv/aplic-priv.h b/xen/arch/riscv/aplic-priv.h
> index 35100d3a64..2245029b10 100644
> --- a/xen/arch/riscv/aplic-priv.h
> +++ b/xen/arch/riscv/aplic-priv.h
> @@ -47,4 +47,6 @@ struct aplic_priv {
>   */
>  extern unsigned int guest_aplic_num_sources;
>  
> +uint32_t aplic_msi_target_gen(const struct vcpu *v, uint32_t base_val);
> +
>  #endif /* ASM_RISCV_APLIC_PRIV_H */
> diff --git a/xen/arch/riscv/aplic.c b/xen/arch/riscv/aplic.c
> index 17c96177a3..febc451760 100644
> --- a/xen/arch/riscv/aplic.c
> +++ b/xen/arch/riscv/aplic.c
> @@ -16,6 +16,7 @@
>  #include <xen/irq.h>
>  #include <xen/mm.h>
>  #include <xen/sections.h>
> +#include <xen/sched.h>
Nit: <xen/sched.h> sorts before <xen/sections.h>.

>  #include <xen/spinlock.h>
>  #include <xen/types.h>
>  #include <xen/vmap.h>
> @@ -28,8 +29,6 @@
>  #include <asm/io.h>
>  #include <asm/riscv_encoding.h>
>  
> -#define APLIC_DEFAULT_PRIORITY  1
> -
>  static struct aplic_priv aplic = {
>      .lock = SPIN_LOCK_UNLOCKED,
>  };
> @@ -38,6 +37,137 @@ static struct intc_info __ro_after_init aplic_info = {
>      .hw_variant = INTC_APLIC,
>  };
>  
> +/*
> + * The arrangement of IMSIC interrupt files in MMIO space follows a topology
> + * defined by the RISC-V AIA specification. An IMSIC group is a set of
> + * interrupt files (e.g., in a cluster or socket) co-located in memory.
> + *
> + * The physical address of an outgoing MSI is calculated by bitwise ORing a
> + * Base Physical Page Number (Base PPN) with the Group Index (g), the Hart
> + * Index (h) and, for a supervisor-level interrupt domain, the Guest Index:
Sorry but as I already mentioned before, Hart Index is equal to (g << lhxw) | h
I think it is a miss as you explained this later correctly ....

I would propose this:
    ```
    * The physical address of an outgoing MSI is calculated by bitwise ORing a
    * Base Physical Page Number (Base PPN) with the group number (g), the
    * hart number relative to the group (h) and, for a supervisor-level
    * interrupt domain, the Guest Index:
    ```

> + *
> + *   ( Base PPN | (g << (HHXS + 12)) | (h << LHXS) | Guest Index ) << 12
> + *
> + * where Base PPN, HHXS, LHXS, HHXW and LHXW come from the {m,s}msiaddrcfg[h]
> + * registers of the interrupt domain that sends the MSI:
> + *
> + * XLEN-1       HHXS+24          LHXS+12          12          0
> + * |            |                |                |           |
> + * ------------------------------------------------------------
> + * |xxxx|   g   |xxxxxxxx|   h   |xxxx|Guest Index|     0     |
> + * ------------------------------------------------------------
> + *
> + * - g: group number.
> + * - h: hart number relative to the group.
... here
> + * - xxxx: remaining Base PPN bits; each gap may be zero-width.
> + * - Guest Index: selects one of the 4 KiB pages right above the hart's own
> + *   supervisor-level file, i.e. it starts at bit 12; LHXS must therefore be
> + *   at least as large as the number of guest index bits.
> + * - Bits 11:0: always zero because IMSIC files are 4 KiB page-aligned.
> + *
> + * For wired interrupts in MSI delivery mode (domaincfg.DM = 1), the APLIC
> + * computes the MSI target address itself from the "Hart Index" field
> + * (bits 31:18) of the corresponding target[i] register. This 14-bit field
> + * holds both g and h:
> + *
> + * 13          lhxw+hhxw   lhxw       0
> + * |           |           |          |
> + * ------------------------------------
> + * |     0     |     g     |    h     |
> + * ------------------------------------
> + *
> + * - lhxw (Low Hart Index Width): the number of bits used for the hart number
> + *   within a group.
> + * - hhxw (High Hart Index Width): the number of bits used for the group
> + *   number; the remaining bits of the field must be zero.
> + *
> + * The Guest Index isn't a part of it: for a supervisor-level interrupt domain
> + * it has its own field (bits 17:12) in target[i].
> + *
> + * Because there are "xxxx" gaps (Base PPN bits) between the indices in the
> + * physical address (depending on HHXS and LHXS), software must extract the
> + * group and hart components separately and pack them into the APLIC-defined
> + * Hart Index format to ensure correct MSI targeting.
> + */
> +static unsigned long aplic_hart_index(unsigned int cpu)
> +{
> +    const struct imsic_config *imsic = imsic_get_config();
> +    const struct imsic_msi *msi = &imsic->msi[cpu];
> +    /* Low Hart Index Shift */
> +    unsigned int lhxs = imsic->guest_index_bits;
> +    /* Low Hart Index Width */
> +    unsigned int lhxw = imsic->hart_index_bits;
> +    /* High Hart Index Width */
> +    unsigned int hhxw = imsic->group_index_bits;
> +    /* High Hart Index Shift */
> +    unsigned int hhxs =
> +        imsic->group_index_shift - APLIC_xMSICFGADDR_PPN_SHIFT * 2;
> +    /*
> +     * msi->base_addr is the base of the MMIO regset this CPU's interrupt
> +     * files live in, and one regset can cover several harts; msi->offset
> +     * selects this CPU's block inside it. The hart index bits are part of
> +     * that offset, so both indexes have to be derived from the full address.
> +     */
> +    paddr_t target_addr = msi->base_addr + msi->offset;
> +    unsigned long tppn = target_addr >> APLIC_xMSICFGADDR_PPN_SHIFT;
> +    unsigned long g =
> +        (tppn >> APLIC_xMSICFGADDR_PPN_HHX_SHIFT(hhxs)) &
> +        APLIC_xMSICFGADDR_PPN_HHX_MASK(hhxw);
> +    unsigned long h =
> +        (tppn >> APLIC_xMSICFGADDR_PPN_LHX_SHIFT(lhxs)) &
> +        APLIC_xMSICFGADDR_PPN_LHX_MASK(lhxw);
> +
> +    return (g << lhxw) | h;
> +}
> +
> +/*
> + * v->processor can't be used here: during a migration it names the new pCPU
> + * before the interrupt file is moved there. The caller has to hold
> + * vsfile_lock until the result is written to the h/w.
> + */
> +uint32_t aplic_msi_target_gen(const struct vcpu *v, uint32_t base_val)
> +{
> +    const struct vimsic_state *vimsic_state = v->arch.vimsic_state;
> +    unsigned int guest_id = vcpu_guest_file_id(v);
> +    unsigned long hart_index;

My v2 remark about making hart_index const can be dropped: as Jan said
(<02cb695f-c827-4623-8f65-530bd7b740d6@suse.com>), const is wanted on
pointer targets, not on plain variables.

> +
> +    ASSERT(rw_is_locked(&vimsic_state->vsfile_lock));
> +    ASSERT(vimsic_state->vsfile_cpu < NR_CPUS);
> +
> +    hart_index = aplic_hart_index(vimsic_state->vsfile_cpu);
> +
> +    base_val &= APLIC_TARGET_EIID;
> +    base_val |= MASK_INSR(guest_id, APLIC_TARGET_GUEST_IDX);
> +    base_val |= MASK_INSR(hart_index, APLIC_TARGET_HART_IDX);
> +
> +    return base_val;
> +}
> +
> +uint32_t aplic_hw_read_reg(unsigned int offset)
> +{
> +    unsigned long flags;
> +    uint32_t val;
> +
> +    ASSERT((offset < aplic.size) && IS_ALIGNED(offset, sizeof(uint32_t)));
Nit: the parentheses around offset < aplic.size aren't needed:
        ASSERT(offset < aplic.size && IS_ALIGNED(offset, sizeof(uint32_t)));

> +
> +    spin_lock_irqsave(&aplic.lock, flags);
> +    val = readl((const volatile void __iomem *)aplic.regs + offset);
> +    spin_unlock_irqrestore(&aplic.lock, flags);
> +
> +    return val;
> +}
> +
> +void aplic_hw_write_reg(unsigned int offset, uint32_t value)
> +{
> +    unsigned long flags;
> +
> +    ASSERT((offset < aplic.size) && IS_ALIGNED(offset, sizeof(uint32_t)));
Same here.

> +
> +    spin_lock_irqsave(&aplic.lock, flags);
> +    writel(value, (volatile void __iomem *)aplic.regs + offset);
> +    spin_unlock_irqrestore(&aplic.lock, flags);
> +}
> +
>  static void __init aplic_init_hw_interrupts(void)
>  {
>      unsigned int i;
> @@ -53,9 +183,9 @@ static void __init aplic_init_hw_interrupts(void)
>          /*
>           * Low bits of target register contains Interrupt Priority bits which
>           * can't be zero according to AIA spec.
> -         * Thereby they are initialized to APLIC_DEFAULT_PRIORITY.
> +         * Thereby they are initialized to APLIC_TARGET_IPRIO_DEFAULT.
>           */
> -        writel(APLIC_DEFAULT_PRIORITY, &aplic.regs->target[i]);
> +        writel(APLIC_TARGET_IPRIO_DEFAULT, &aplic.regs->target[i]);
>      }
>  
>      writel(APLIC_DOMAINCFG_IE | APLIC_DOMAINCFG_DM, &aplic.regs->domaincfg);
> diff --git a/xen/arch/riscv/include/asm/aplic.h b/xen/arch/riscv/include/asm/aplic.h
> index a2af55d54f..664bda2cb7 100644
> --- a/xen/arch/riscv/include/asm/aplic.h
> +++ b/xen/arch/riscv/include/asm/aplic.h
> @@ -39,6 +39,13 @@
>  #define  APLIC_DOMAINCFG_IE             BIT(8, U)
>  #define  APLIC_DOMAINCFG_DM             BIT(2, U)
>  #define  APLIC_DOMAINCFG_BE             BIT(0, U)
> +/*
> + * The bits a write may change. Everything else, including the read-only zero
> + * bit 7 and the reserved bits, has to read back as zero, and BE is WARL and
> + * hardwired to 0 as Xen is little-endian only.
> + */
> +#define  APLIC_DOMAINCFG_WMASK          (APLIC_DOMAINCFG_IE | \
> +                                         APLIC_DOMAINCFG_DM)
>  
>  #define APLIC_SOURCECFG_BASE            0x0004
>  #define APLIC_SOURCECFG_LAST            0x0ffc
> @@ -58,6 +65,12 @@
>  #define   APLIC_SOURCECFG_SM_EDGE_FALL  0x5
>  #define   APLIC_SOURCECFG_SM_LEVEL_HIGH 0x6
>  #define   APLIC_SOURCECFG_SM_LEVEL_LOW  0x7
> +/*
> + * All other bits of sourcecfg[] are reserved and read as zero, so drop them
> + * on a write.
> + */
> +#define  APLIC_SOURCECFG_WMASK          (APLIC_SOURCECFG_D | \
> +                                         APLIC_SOURCECFG_SM)
>  
>  #define APLIC_SMSICFGADDR               0x1bc8
>  #define APLIC_SMSICFGADDRH              0x1bcc
> @@ -89,6 +102,9 @@
>  #define  APLIC_TARGET_GUEST_IDX         GENMASK(17, 12)
>  /* Bit 11 is reserved and reads as zero */
>  #define  APLIC_TARGET_EIID              GENMASK(10, 0)
> +/* If target is in direct delivery mode (domaincfg.DM = 0) */
> +#define  APLIC_TARGET_IPRIO             GENMASK(7, 0)
> +#define   APLIC_TARGET_IPRIO_DEFAULT    1U
>  
>  #define APLIC_IDC_SIZE                  32
>  
> @@ -98,6 +114,24 @@
>  #define APLIC_SIZE(nr_cpus) \
>      (APLIC_MIN_SIZE + APLIC_SIZE_ALIGN(APLIC_IDC_SIZE * (nr_cpus)))
>  
> +/*
> + * Using setip is fine here, as all SET* and CLR* register groups consist of 32
> + * registers and therefore have identical sizes.
> + *
> + * Lowest 2 bits are always zero for SET* and CLR* registers.
> + */
> +#define APLIC_SETCLR_OFFSET_MASK \
> +    (sizeof_field(struct aplic_regs, setip) - sizeof(uint32_t))
> +
> +#define APLIC_xMSICFGADDR_PPN_SHIFT IMSIC_MMIO_PAGE_SHIFT
> +
> +#define APLIC_xMSICFGADDR_PPN_HHX_MASK(hhxw) (BIT(hhxw, UL) - 1)
> +#define APLIC_xMSICFGADDR_PPN_HHX_SHIFT(hhxs) \
> +    ((hhxs) + APLIC_xMSICFGADDR_PPN_SHIFT)
> +
> +#define APLIC_xMSICFGADDR_PPN_LHX_MASK(lhxw) (BIT(lhxw, UL) - 1)
> +#define APLIC_xMSICFGADDR_PPN_LHX_SHIFT(lhxs) (lhxs)
> +
>  struct aplic_regs {
>      uint32_t domaincfg;         /* 0x0000 */
>      uint32_t sourcecfg[1023];   /* 0x0004 */
> @@ -141,4 +175,7 @@ struct aplic_regs {
>      uint32_t target[1023];      /* 0x3004 */
>  };
>  
> +uint32_t aplic_hw_read_reg(unsigned int offset);
> +void aplic_hw_write_reg(unsigned int offset, uint32_t value);
> +
>  #endif /* ASM_RISCV_APLIC_H */
> diff --git a/xen/arch/riscv/include/asm/vaplic.h b/xen/arch/riscv/include/asm/vaplic.h
> index 96080bfbc2..3a555742bb 100644
> --- a/xen/arch/riscv/include/asm/vaplic.h
> +++ b/xen/arch/riscv/include/asm/vaplic.h
> @@ -11,6 +11,7 @@
>  #define ASM__RISCV__VAPLIC_H
>  
>  #include <xen/kernel.h>
> +#include <xen/spinlock.h>
>  #include <xen/types.h>
>  
>  #include <asm/intc.h>
> @@ -19,13 +20,31 @@ struct domain;
>  
>  #define to_vaplic(d) container_of((d)->arch.vintc, struct vaplic, vintc)
>  
> +/* State of one vAPLIC interrupt source. */
> +struct vaplic_source {
> +    /* Protects target together with the h/w target register of the source. */
> +    spinlock_t lock;
> +
> +    /* Guest's view of the APLIC target register. */
> +    uint32_t target;
> +};
> +
>  struct vaplic_regs {
>      uint32_t domaincfg;
> +
> +    /*
> +     * Indexed by source number. The array holds d->arch.vintc->nr_virqs
> +     * elements; sources[0] is unused as APLIC interrupt sources start from 1.
> +     */
> +    struct vaplic_source *sources;
>  };
>  
>  struct vaplic {
>      struct vintc vintc;
>      struct vaplic_regs regs;
> +
> +    paddr_t regs_start;
> +    unsigned int regs_size;
>  };
>  
>  int domain_vaplic_init(struct domain *d);
> diff --git a/xen/arch/riscv/vaplic.c b/xen/arch/riscv/vaplic.c
> index 6fbdc07805..ea4b0dc889 100644
> --- a/xen/arch/riscv/vaplic.c
> +++ b/xen/arch/riscv/vaplic.c
> @@ -17,6 +17,7 @@
>  #include <asm/aia.h>
>  #include <asm/imsic.h>
>  #include <asm/intc.h>
> +#include <asm/mmio.h>
>  #include <asm/vaplic.h>
>  
>  #include "aplic-priv.h"
> @@ -27,6 +28,313 @@ unsigned int __ro_after_init guest_aplic_num_sources;
>  
>  #define FDT_VAPLIC_INT_CELLS 2
>  
> +#define AUTH_IRQ_BIT(d, irqn) \
> +    (((irqn) < (d)->arch.vintc->nr_virqs) && \
> +     test_bit(irqn, (d)->arch.vintc->used_irqs))
> +
> +/*
> + * Convert a byte offset (within a SETIP/CLRIP/SETIE/CLRIE register group) to
> + * a 32-bit word index into the used_irqs bitmap. Each word covers 32
> + * interrupt sources. For SOURCECFG and TARGET groups the same division also
> + * yields the interrupt number directly, because those arrays store one 32-bit
> + * register per source.
> + */
> +#define regoffset_to_word_idx(reg_val) ((reg_val) / sizeof(uint32_t))
> +
> +static uint32_t vaplic_target_read(const struct domain *d, unsigned int irqn)
> +{
> +    const struct vaplic *vaplic = to_vaplic(d);
> +
> +    /* target[0] doesn't exist so irqn == 0 should be impossible */
> +    if ( !irqn || irqn >= vaplic->vintc.nr_virqs )
> +        return 0;
> +
> +    return read_atomic(&vaplic->regs.sources[irqn].target);
> +}
> +
> +static inline uint32_t generate_auth_mask(const struct domain *currd,
Nit: inline in a .c file isn't needed, the compiler decides anyway.
> +                                          unsigned int word_idx)
> +{
> +    unsigned int first_bit = word_idx * sizeof(uint32_t) * BITS_PER_BYTE;
> +
> +    if ( word_idx >= DIV_ROUND_UP(currd->arch.vintc->nr_virqs,
> +                                  sizeof(uint32_t) * BITS_PER_BYTE) )
> +    {
> +        gdprintk(XENLOG_DEBUG, "incorrect word_idx(%u)\n", word_idx);
> +
> +        return 0;
> +    }
> +
> +    return currd->arch.vintc->used_irqs[first_bit / BITS_PER_LONG] >>
> +           (first_bit % BITS_PER_LONG);
> +}
> +
> +static bool vaplic_emulate_load(const struct vcpu *curr, paddr_t addr,
> +                                uint32_t *out)
> +{
> +    const struct domain *currd = curr->domain;
> +    const struct vaplic *vaplic = to_vaplic(currd);
> +    const unsigned int offset = addr & APLIC_CTRL_REGION_OFFSET_MASK;

With that, every access with addr >= APLIC_CTRL_REGION_OFFSET_MASK
aliases onto the same control region: e.g. an access to
GUEST_APLIC_S_BASE + 0x4000 (idelivery of IDC 0) ends up in the
APLIC_DOMAINCFG case, and a store there rewrites domaincfg.

It also silently relies on GUEST_APLIC_S_BASE being 16 KiB aligned.

The AIA spec ("Memory-mapped control region for an interrupt domain")
says IDC structures start at 0x4000 and are only needed for direct
delivery mode, and that all other bytes of the control region are
reserved and read-only zero, writes to them being ignored. So I'd expect
something like:

    const paddr_t offset = addr - vaplic->regs_start;

Then read/write out of control region would go to "default:" case.
and APLIC_CTRL_REGION_OFFSET_MASK could go away.

> +    uint32_t auth_mask;
> +    unsigned int i;
> +
> +    ASSERT(curr == current);
> +
> +    switch ( offset )
> +    {
> +    case APLIC_DOMAINCFG:
> +        *out = vaplic->regs.domaincfg;
> +
> +        return true;
> +
> +    case APLIC_SETIP_BASE ... APLIC_SETIP_LAST:
> +    case APLIC_CLRIP_BASE ... APLIC_CLRIP_LAST:
> +    case APLIC_SETIE_BASE ... APLIC_SETIE_LAST:
> +        i = regoffset_to_word_idx(offset & APLIC_SETCLR_OFFSET_MASK);
> +        auth_mask = generate_auth_mask(currd, i);
> +
> +        break;
> +
> +    case APLIC_SETIPNUM:
> +    case APLIC_CLRIPNUM:
> +    case APLIC_SETIENUM:
> +    case APLIC_CLRIE_BASE ... APLIC_CLRIE_LAST:
> +    case APLIC_CLRIENUM:
> +    case APLIC_SETIPNUM_LE:
> +        /*
> +         * Based on the RISC-V AIA spec a read of these registers
> +         * always returns zero
> +         */
> +        *out = 0;
> +
> +        return true;
> +
> +    case APLIC_TARGET_BASE ... APLIC_TARGET_LAST:
> +        /*
> +         * As target registers start from 1:
> +         *  0x3000 genmsi
> +         *  0x3004 target[1]
> +         *  0x3008 target[2]
> +         *   ...
> +         *  0x3FFC target[1023]
> +         * It is necessary to calculate an interrupt number by subtracting
> +         * APLIC_GENMSI instead of APLIC_TARGET_BASE.
> +         */
> +        i = regoffset_to_word_idx(offset - APLIC_GENMSI);
> +
> +        *out = AUTH_IRQ_BIT(currd, i) ? vaplic_target_read(currd, i) : 0;
> +
> +        return true;
  genmsi (0x3000) isn't covered by any case, so an access to it ends up
  in default: and faults while in MSI delivery mode it isn't read-only zero:
  Hart Index and EIID behave as in a target register, and Busy is
  read-only. I would suggest to add a dedicated switch case:
  
    ```
    case APLIC_GENMSI:
        *out = vaplic_is_msi_mode(currd) ? vaplic->regs.genmsi : 0;

        return true;
    ```
With a new helper vaplic_is_msi_mode -> bool that could also be used in
write counterpart and a new genmsi field in vaplic->regs.

If we assume the guest will never try to read genmsi then it is okay but
it might worth to at least mention it somewhere.

> +    default:
> +        gdprintk(XENLOG_WARNING, "Unhandled APLIC read at offset %#x\n",
> +                 offset);
> +
> +        return false;
> +    }
> +
> +    *out = aplic_hw_read_reg(offset) & auth_mask;
> +
> +    return true;
> +}
> +
> +static bool vaplic_emulate_store(const struct vcpu *curr, paddr_t addr,
> +                                 uint32_t value)
> +{
> +    const struct domain *currd = curr->domain;
> +    unsigned int offset = addr & APLIC_CTRL_REGION_OFFSET_MASK;

Same aliasing issue as in vaplic_emulate_load(), here with the write
going to the aliased register.

> +
> +    ASSERT(curr == current);
> +
> +    switch ( offset )
> +    {
> +    case APLIC_DOMAINCFG:
> +    {
> +        struct vaplic *vaplic = to_vaplic(currd);
> +
> +        vaplic->regs.domaincfg = APLIC_DOMAINCFG_RO |
> +                                 (value & APLIC_DOMAINCFG_WMASK);
APLIC_DOMAINCFG_WMASK includes DM, so a guest writing DM=0 reads 0 back
and assumes direct delivery mode is in effect. However, only MSI
delivery is emulated: there are no IDC structures, and with DM=0 the
target handling below drops the write, so the guest just stops getting
interrupts.

DM is WARL, so an MSI-only APLIC is expected to keep it at 1 whatever
is written, which is how software figures out that direct mode isn't
available. Can't we do the same here, as is already done for BE?
I.e. drop DM from APLIC_DOMAINCFG_WMASK, and OR APLIC_DOMAINCFG_DM in
here and in domain_vaplic_init(). That would also justify sizing the
region at APLIC_MIN_SIZE (see my comment on regs_size at the end).
> +
> +        return true;
> +    }
> +
> +    case APLIC_SOURCECFG_BASE ... APLIC_SOURCECFG_LAST:
> +        /*
> +         * Only D (bit 10) and SM (bits 2:0) are implemented, the rest of the
> +         * bits are reserved and read as zero, so ignore what a guest writes
> +         * to them.
> +         */
> +        value &= APLIC_SOURCECFG_WMASK;
> +
> +        if ( value & APLIC_SOURCECFG_D )
> +        {
> +            gdprintk(XENLOG_ERR, "APLIC_SOURCECFG_D isn't supported\n");
> +
> +            goto fail;
> +        }
> +
> +        /*
> +         * SM is WARL, so the reserved values 0x2 and 0x3 need no handling
> +         * here: vAPLIC keeps no shadow copy of sourcecfg[], the value is
> +         * written straight to the h/w register and is read back from it, so
> +         * it is the h/w which substitutes a legal value for an illegal one.
> +         *
> +         * TODO: when vAPLIC starts to shadow sourcecfg[], the WARL behaviour
> +         * will have to be emulated here instead, e.g.:
> +         *   if ( value == 0x2 || value == 0x3 )
> +         *       value = APLIC_SOURCECFG_SM_INACTIVE;
> +         */
> +
> +        /*
> +         * As sourcecfg register starts from 1:
> +         *   0x0000 domaincfg
> +         *   0x0004 sourcecfg[1]
> +         *   0x0008 sourcecfg[2]
> +         *    ...
> +         *   0x0FFC sourcecfg[1023]
> +         * It is necessary to calculate an interrupt number by subtracting
> +         * APLIC_DOMAINCFG instead of APLIC_SOURCECFG_BASE.
> +         */
> +        if ( !AUTH_IRQ_BIT(currd,
> +                           regoffset_to_word_idx(offset - APLIC_DOMAINCFG)) )
> +            /* Interrupt not enabled, ignore it */
> +            return true;
> +
> +        break;
> +
> +    case APLIC_SETIP_BASE ... APLIC_SETIP_LAST:
> +    case APLIC_CLRIP_BASE ... APLIC_CLRIP_LAST:
> +    case APLIC_SETIE_BASE ... APLIC_SETIE_LAST:
> +    case APLIC_CLRIE_BASE ... APLIC_CLRIE_LAST:
> +    {
> +        unsigned int word_idx =
> +            regoffset_to_word_idx(offset & APLIC_SETCLR_OFFSET_MASK);
> +
> +        value &= generate_auth_mask(currd, word_idx);
> +
> +        break;
> +    }
> +
> +    case APLIC_SETIPNUM:
> +    case APLIC_CLRIPNUM:
> +    case APLIC_SETIENUM:
> +    case APLIC_CLRIENUM:
> +    case APLIC_SETIPNUM_LE:
> +        if ( !value || !AUTH_IRQ_BIT(currd, value) )
> +            return true;
> +
> +        break;
> +
> +    case APLIC_TARGET_BASE ... APLIC_TARGET_LAST:
> +    {
> +        struct vaplic *vaplic = to_vaplic(currd);
> +        /*
> +         * Look at vaplic_emulate_load() for explanation why APLIC_GENMSI is
> +         * subtracted.
> +         */
> +        unsigned int srcn = regoffset_to_word_idx(offset - APLIC_GENMSI);
> +
> +        if ( !AUTH_IRQ_BIT(currd, srcn) )
> +            /* Interrupt not enabled, ignore it */
> +            return true;
> +
> +        if ( vaplic->regs.domaincfg & APLIC_DOMAINCFG_DM )
> +        {
> +            struct vaplic_source *src = &vaplic->regs.sources[srcn];
> +            struct vcpu *target_vcpu;
target_vcpu is only read, so this can be const struct vcpu *.

> +            unsigned int guest_hart_idx =
> +                MASK_EXTR(value, APLIC_TARGET_HART_IDX);
> +            unsigned long flags;
> +            struct vimsic_state *vimsic_state;
> +
> +            target_vcpu = domain_vcpu(currd, guest_hart_idx);
> +
> +            if ( !target_vcpu )
> +            {
> +                gdprintk(XENLOG_ERR, "Invalid vCPU id in target register\n");
> +
> +                /* Ignore such writings */
> +                return true;
> +            }
> +
> +            vimsic_state = target_vcpu->arch.vimsic_state;
> +
> +            /*
> +             * A non-zero guest index asks for delivery to an interrupt file
> +             * of a nested guest. The vIMSIC node has no riscv,guest-index-bits
> +             * property, so a guest is told its harts have no guest interrupt
> +             * files and the field reads as zero for them. Such a write is
> +             * illegal and is therefore ignored as a whole: the stored copy
> +             * keeps the zero it was allocated with, so the field never needs
> +             * to be masked out here.
> +             * What ends up in the h/w register is Xen's own value anyway:
> +             * aplic_msi_target_gen() overwrites the field with
> +             * vcpu_guest_file_id() of the target vCPU.
> +             */
> +            if ( MASK_EXTR(value, APLIC_TARGET_GUEST_IDX) )
> +            {
> +                printk_once(XENLOG_WARNING
> +                            "%pd: vAPLIC target guest index != 0 is unsupported\n",
> +                            currd);
> +
> +                return true;
> +            }
> +
> +            /*
> +             * src->lock keeps the stored copy and the h/w register updated
> +             * as a pair.
> +             */
> +            spin_lock_irqsave(&src->lock, flags);
> +
> +            write_atomic(&src->target, value);
> +
> +            /* IRQs are already off under src->lock. */
> +            read_lock(&vimsic_state->vsfile_lock);
> +
> +            /*
> +             * The h/w register names the hart and the guest interrupt file
> +             * MSIs are sent to, and there is none of either until the target
> +             * vCPU is given a h/w guest interrupt file. The stored copy
> +             * reaches the h/w at that point.
> +             *
> +             * TODO: once s/w guest interrupt files are supported, a vCPU using
> +             * one still needs its MSIs, so the h/w register will have to be
> +             * written for it too, pointing at an interrupt file Xen receives
> +             * them in on the vCPU's behalf.
> +             */
> +            if ( vimsic_state->vsfile_cpu != CPU_NONE )
> +                aplic_hw_write_reg(offset,
> +                                   aplic_msi_target_gen(target_vcpu, value));

The comment above says the stored copy reaches the h/w once the vCPU gets
a h/w guest interrupt file, but nothing in this patch does that: it only
happens with vaplic_reconfigure_target(), added by "xen/riscv: introduce
vaplic_reconfigure_target()" and called from imsic_vsfile_move() by
"xen/riscv: remap interrupts to new IMSIC VS-file". At this commit a
target written before the first attach never reaches the h/w. 

> +
> +            read_unlock(&vimsic_state->vsfile_lock);
> +
> +            spin_unlock_irqrestore(&src->lock, flags);
> +
> +            return true;
> +        }
> +
> +        /* printk_once(), as a guest could otherwise flood the log. */
> +        printk_once(XENLOG_WARNING
> +                    "%pd: vAPLIC direct delivery mode isn't supported\n",
> +                    currd);
> +
> +        return true;
> +    }
> +
> +    default:
> +    fail:
> +        gdprintk(XENLOG_WARNING,
> +                 "Unhandled APLIC write at offset %#x (value %#x)\n", offset,
> +                 value);
Nit: now that the arguments wrap, put offset on its own line as well.

> +
> +        return false;
So in this function you are assuming the guest will never try to write
genmsi. Is it expected? so a guest accessing it faults. Linux doesn't
use it today, but the spec defines it in MSI delivery mode. Could it at
least get an explicit case (reads as zero, writes ignored, with a TODO
about extempore MSI injection) rather than relying on guests never
touching it?

> +    }
> +
> +    aplic_hw_write_reg(offset, value);
> +
> +    return true;
> +}
> +
>  static int __init cf_check vaplic_make_domu_dt_node(struct kernel_info *kinfo)
>  {
>      struct domain *d = kinfo->bd.d;
> @@ -95,6 +403,56 @@ static const struct vintc_init_ops __initconstrel init_ops = {
>      .make_domu_dt_node = vaplic_make_domu_dt_node,
>  };
>  
> +static enum io_state cf_check vaplic_mmio_read(struct vcpu *v,
> +                                               mmio_info_t *info)

Jan asked in v1 to rename the parameter to curr once ASSERT(v ==
current) is added. Same for vaplic_mmio_write().

> +{
> +    uint32_t val;
> +
> +    ASSERT(v == current);
> +
> +    if ( info->len != sizeof(uint32_t) ||
> +         !IS_ALIGNED(info->gpa, sizeof(uint32_t)) )
> +    {
> +        gdprintk(XENLOG_DEBUG,
> +                 "VAPLIC: unaligned/wrong-width read gpa=%"PRIpaddr" len=%u\n",
> +                 info->gpa, info->len);
> +        return IO_ABORT;
Please drop the "VAPLIC:" prefix, gdprintk() already says where the
message comes from. Also a blank line before the return, as you do
elsewhere in the file.

> +    }
> +
> +    if ( !vaplic_emulate_load(v, info->gpa, &val) )
> +        return IO_ABORT;
> +
> +    /* APLIC registers are 32-bit; zero-extend to the guest register width. */
> +    info->data = val;
> +
> +    return IO_HANDLED;
> +}
> +
> +static enum io_state cf_check vaplic_mmio_write(struct vcpu *v,
> +                                                const mmio_info_t *info)
> +{
> +    ASSERT(v == current);
> +
> +    if ( info->len != sizeof(uint32_t) ||
> +         !IS_ALIGNED(info->gpa, sizeof(uint32_t)) )
> +    {
> +        gdprintk(XENLOG_DEBUG,
> +                 "VAPLIC: unaligned/wrong-width write gpa=%"PRIpaddr" len=%u\n",
> +                 info->gpa, info->len);
> +        return IO_ABORT;
Same here.

> +    }
> +
> +    if ( !vaplic_emulate_store(v, info->gpa, info->data) )
> +        return IO_ABORT;
> +
> +    return IO_HANDLED;
> +}
> +
> +static const struct mmio_handler_ops vaplic_mmio_ops = {
> +    .read  = vaplic_mmio_read,
> +    .write = vaplic_mmio_write,
> +};
> +
>  static const struct vintc_ops vintc_ops = {
>      .vcpu_init = vcpu_imsic_init,
>      .vcpu_deinit = vcpu_imsic_deinit,
> @@ -103,6 +461,8 @@ static const struct vintc_ops vintc_ops = {
>  int domain_vaplic_init(struct domain *d)
>  {
>      struct vaplic *vaplic = xvzalloc(struct vaplic);
> +    unsigned int i;
> +    int rc;
>  
>      if ( !vaplic )
>          return -ENOMEM;
> @@ -123,7 +483,28 @@ int domain_vaplic_init(struct domain *d)
>       */
>      d->arch.vintc->nr_virqs = guest_aplic_num_sources + 1;
>  
> -    return 0;
> +    /* Slot 0 is unused: APLIC source numbering starts at 1 (see used_irqs). */
> +    vaplic->regs.sources = xvzalloc_array(struct vaplic_source,
> +                                          d->arch.vintc->nr_virqs);
> +    if ( !vaplic->regs.sources )
> +    {
> +        domain_vaplic_deinit(d);
> +
> +        return -ENOMEM;
> +    }
> +
> +    for ( i = 0; i < d->arch.vintc->nr_virqs; i++ )
> +        spin_lock_init(&vaplic->regs.sources[i].lock);
> +
> +    vaplic->regs_start = GUEST_APLIC_S_BASE;
> +    vaplic->regs_size = APLIC_SIZE(d->max_vcpus);

The vAPLIC only supports MSI delivery (msi-parent → vIMSIC, no direct
mode emulated), so no IDC structures are needed and APLIC_MIN_SIZE is
enough. To make that explicit I'll also hardwire domaincfg.DM to 1
(WARL), so the guest can't select a mode the region doesn't back.

-- 
Baptiste Le Duc <baptiste.le-duc@vates.tech>

