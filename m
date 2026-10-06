Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C540CA5FED
	for <xen-devel@archiver.kernel.org>; Tue,  6 Oct 2026 09:02:47 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1441305.1658889 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xE140-00059i-Uh; Tue, 06 Oct 2026 09:02:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1441305.1658889; Tue, 06 Oct 2026 09:02:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xE140-00059b-Rs; Tue, 06 Oct 2026 09:02:20 +0000
Received: by outflank-mailman (input) for mailman id 1441305;
 Tue, 06 Oct 2026 09:02:20 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xE13z-00059V-F6
 for xen-devel@lists.xenproject.org; Tue, 06 Oct 2026 09:02:20 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xE13y-00F6ps-4m
 for xen-devel@lists.xenproject.org; Tue, 06 Oct 2026 11:02:18 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a11072f6480003f66@swg.vates.tech>)
 id 6ac4b913-bab6-0a2a0a5309dd-0a2a4505b2a0-32
 for <xen-devel@lists.xenproject.org>; Tue, 06 Oct 2026 11:02:17 +0200
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a11072f6480003f66@swg.vates.tech>)
 id 6ac4b918-4cb1-0a2a45050019-b9ff1c12ac2b-3
 for <xen-devel@lists.xenproject.org>; Tue, 06 Oct 2026 11:02:17 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a11072f6480003f66.007 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 06 Oct 2026 09:02:12 +0000
Received: from [192.168.1.46] (areims-651-1-80-194.w90-18.abo.wanadoo.fr
 [90.18.187.194]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id ED6BA8224B;
 Tue,  6 Oct 2026 11:02:07 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=ScTG0hoPu5b923bw3Z6Hfhc4fJ7rIEZ+GS5P0X03y1w=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=AeTv3n5bMEBjq5dlCnZs+wvQ10/WsiVYqhyQ8yr0n2H5o3CLKZitkx7IlYNWdMZQv8nxq0+FW
 u9gluygW7zcOygyoglV8JR4BBaoSCNwhKXOXQmrK6tOAs5qyogN+SIYnTFrvjmeBEFSAON04FvN
 80WJ0wydsliwbECfa0UoNnGnk2JWDzkUAxyYC8zEeTaMXEJU2+3GNUof+afHt3d/wF97BFZTbsx
 htXUywT1wpc+TpxEXBlZfrh/c9n87xj61emp0eP7nTGZgRIV94aOh7PT+dvGI2XrT3yrXR7EW5i
 ooX4lXJc1WKaB9evTIIs/96HA1RpdTCTzPv5TVK8qBFA==
X-Zone-Loop: 895ed95f7bd589920a1f2627f87d0489c82eababb627
x-campaign-type: default
x-transaction-id: 23f87be5-0668-4473-bc5a-7a550e45a0e4
x-swg-uid: 01-80278138-664a-4fd2-a1e6-71692f0028b8
X-Mailer: Sweego
Message-ID:
 <1791277332.8631fc262581453bbf619ec5b2062170.1a11072f6480003f66@vates.tech>
x-swg-bid: 1791277332.8631fc262581453bbf619ec5b2062170.1a11072f6480003f66
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v3 09/39] xen/riscv: build the target hart index via
 aplic_hart_index()
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
In-Reply-To: <ba71bd0de931eab1205a1139e160f40b72bda421.1790779209.git.oleksii.kurochko@gmail.com>
References: <cover.1790779209.git.oleksii.kurochko@gmail.com>
 <ba71bd0de931eab1205a1139e160f40b72bda421.1790779209.git.oleksii.kurochko@gmail.com>
Date: Tue, 06 Oct 2026 11:02:00 +0200
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791277322; l=6674;
 i=baptiste.le-duc@vates.tech; s=20260810; h=from:subject:message-id;
 bh=MzfEkg1wiZPKhC5DxX3t1NBoZMdFK9U99h6hc9urFes=;
 b=KS6dfqxQX3da1hQgFf6Q9MGsXtF2so417JmbchIMLGaNXjGTaj2OBPzIIimgTwiT8O4RauKOz
 OyB5FX7x4zZBRUkmT+PcIV5mxCMam4LUqrOVh3qcwRL+XBJYe5HgeAW
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=ed25519;
 pk=N+BbdvMXRzrCuX/ieh4RWodiAKcLNvI+KjflcZ0oXCo=
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1791277328184
X-purgate-ID: tlsNG-c201ff/1791277337-F76BD2A1-52C81980/10/73395122804
X-purgate-type: spam
X-purgate-size: 6674

> aplic_set_irq_affinity() open-coded the packing of the group and hart
> indices into the target register, and got two things wrong along the
> way:
> 
>  - imsic_config.msi[] is indexed by logical CPU id, but the index was
>    run through cpuid_to_hartid() first. On any platform where the two
>    spaces differ this picks another CPU's interrupt file, or reads past
>    the array;
> 
>  - the same hart id was then used verbatim as the low hart index, and
>    the group index was derived from msi[].base_addr alone. The hart
>    index bits live in msi[].offset, the base address only covers the
>    MMIO regset, which may hold the files of several harts. Both indices
>    have to come out of base_addr + offset.
> 
> aplic_hart_index() already extracts them that way, and is what the vAPLIC
> target path uses, so call it here as well and insert the result with
> MASK_INSR(APLIC_TARGET_HART_IDX) instead of a bare shift, which keeps the
> value from spilling out of the 14-bit field. This drops the last in-tree
> duplicate of the AIA hart index formula, and with it the last user of
> APLIC_TARGET_HART_IDX_SHIFT, which is removed.
> 
> desc->irq is used as the EIID as is. Assert that it is a valid APLIC
> source, which also guarantees that it fits the EIID field.
> 
> No functional change on a single-group platform whose hart ids match
> their CPU ids and whose IMSIC regset holds one file per hart.
> 
Nit: The message is hard to follow because it describes the old code and
its bugs in the same sentences, so you never see a plain picture of what
the code did before. I would propose this:
    ```
    aplic_set_irq_affinity() computes the target register value by hand:

        cpu         = cpuid_to_hartid(<cpu picked from mask>);
        group_index = <bits taken from msi[cpu].base_addr>;
        hart_index  = cpu;

    This is wrong in three ways:

    - msi[] is indexed by logical CPU id, not by hart id. When the two
      differ, the wrong CPU's interrupt file is used, or msi[] is read
      out of bounds.

    - The hart id is used as the low hart index. The AIA spec defines
      the low hart index as bits of the IMSIC interrupt file address,
      and the two are not guaranteed to be equal.

    - The group index is taken from msi[].base_addr only. base_addr is
      the start of the IMSIC MMIO region, which may hold the interrupt
      files of several harts; the file of this CPU is at base_addr +
      msi[].offset, and both indexes must be extracted from that
      address.

    aplic_hart_index() already does this correctly and is used by the
    vAPLIC target path. Use it here as well, and insert the result with
    MASK_INSR(APLIC_TARGET_HART_IDX) rather than a plain shift, so it
    cannot overflow the 14-bit field. APLIC_TARGET_HART_IDX_SHIFT has no
    users left and is removed.

    desc->irq is written as the EIID unchanged. Assert that it is a
    valid APLIC source number, which also ensures it fits in the EIID
    field.

    No functional change on platforms with a single group, hart ids
    equal to CPU ids, and one interrupt file per IMSIC MMIO region.
    ```
> Fixes: d4676a1398bc ("xen/riscv: implementation of aplic and imsic operations")
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
> Changes in v3:
>  - s/aplic_hart_field/aplic_hart_index/ (in the subject too) following the
>    rename of the helper in "xen/riscv: implement virtual APLIC MMIO
>    emulation".
>  - Don't mask desc->irq with APLIC_TARGET_EIID. Instead, bound it by
>    the APLIC source range rather than NR_IRQS, which will also have to
>    cover device MSIs: add a BUILD_BUG_ON() that ARRAY_SIZE(target) fits
>    the EIID field and an ASSERT() that desc->irq is a valid APLIC source
>    (1..num_irqs), which also covers the target[desc->irq - 1] index.
> ---
> Changes in v2:
>  - New patch.
> ---
> ---
>  xen/arch/riscv/aplic.c             | 33 ++++++++++--------------------
>  xen/arch/riscv/include/asm/aplic.h |  1 -
>  2 files changed, 11 insertions(+), 23 deletions(-)
>
> diff --git a/xen/arch/riscv/aplic.c b/xen/arch/riscv/aplic.c
> index febc451760..62bbcc9afa 100644
> --- a/xen/arch/riscv/aplic.c
> +++ b/xen/arch/riscv/aplic.c
> @@ -335,9 +335,7 @@ static unsigned int aplic_get_cpu_from_mask(const cpumask_t *cpumask)
>  static void cf_check aplic_set_irq_affinity(struct irq_desc *desc, const cpumask_t *mask)
>  {
>      unsigned int cpu;
> -    uint64_t group_index, base_ppn;
> -    uint32_t hhxw, lhxw, hhxs, value;
> -    const struct imsic_config *imsic = aplic.imsic_cfg;
> +    uint32_t value;
>  
>      /*
>       * TODO: Currently, APLIC is supported only with MSI interrupts.
> @@ -350,27 +348,18 @@ static void cf_check aplic_set_irq_affinity(struct irq_desc *desc, const cpumask
>  
>      ASSERT(spin_is_locked(&desc->lock));
>  
> -    cpu = cpuid_to_hartid(aplic_get_cpu_from_mask(mask));
> -    hhxw = imsic->group_index_bits;
> -    lhxw = imsic->hart_index_bits;
> +    cpu = aplic_get_cpu_from_mask(mask);
> +
>      /*
> -     * Although this variable is used only once in the calculation of
> -     * group_index, and it might seem that hhxs could be defined as:
> -     *   hhxs = imsic->group_index_shift - IMSIC_MMIO_PAGE_SHIFT;
> -     * and then the addition of IMSIC_MMIO_PAGE_SHIFT could be omitted
> -     * when calculating the group index.
> -     * It was done intentionally this way to follow the formula from
> -     * the AIA specification for calculating the MSI address.
> +     * desc->irq is used as the EIID as-is, which is only valid for APLIC
> +     * sources: they are numbered 1..num_irqs, with at most ARRAY_SIZE(target).
>       */
> -    hhxs = imsic->group_index_shift - IMSIC_MMIO_PAGE_SHIFT * 2;
> -    base_ppn = imsic->msi[cpu].base_addr >> IMSIC_MMIO_PAGE_SHIFT;
> -
> -    /* Update hart and EEID in the target register */
> -    group_index = (base_ppn >> (hhxs + IMSIC_MMIO_PAGE_SHIFT)) &
> -                  (BIT(hhxw, UL) - 1);
> -    value = desc->irq;
> -    value |= cpu << APLIC_TARGET_HART_IDX_SHIFT;
> -    value |= group_index << (lhxw + APLIC_TARGET_HART_IDX_SHIFT);
> +    BUILD_BUG_ON(ARRAY_SIZE(aplic.regs->target) >
> +                 MASK_EXTR(~0U, APLIC_TARGET_EIID));
Shouldn't this function belong to aplic_init() or at least in a __init
function? Moreover, this check is only relevant in case of MSI delivery
mode but I agree it worth checking as we couldn't know at build time in
which delivery we would be.

-- 
Baptiste Le Duc <baptiste.le-duc@vates.tech>

