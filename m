Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63880C79FB6
	for <xen-devel@archiver.kernel.org>; Wed,  9 Sep 2026 12:05:20 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1412898.1643196 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4H37-0002Fc-MY; Wed, 09 Sep 2026 12:05:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1412898.1643196; Wed, 09 Sep 2026 12:05:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4H37-0002FV-IQ; Wed, 09 Sep 2026 12:05:09 +0000
Received: by outflank-mailman (input) for mailman id 1412898;
 Wed, 09 Sep 2026 12:05:08 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1x4H36-0002F4-PF
 for xen-devel@lists.xenproject.org; Wed, 09 Sep 2026 12:05:08 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x4H36-002AsR-1x
 for xen-devel@lists.xenproject.org; Wed, 09 Sep 2026 14:05:08 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0860e9b57000c4f3@swg.vates.tech>)
 id 6aa14b72-e002-0a2a0a5209dd-0a2a450b8218-18
 for <xen-devel@lists.xenproject.org>; Wed, 09 Sep 2026 14:05:08 +0200
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0860e9b57000c4f3@swg.vates.tech>)
 id 6aa14b73-b7e8-0a2a450b0019-b9ff1c12acb3-3
 for <xen-devel@lists.xenproject.org>; Wed, 09 Sep 2026 14:05:07 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a0860e9b57000c4f3.007 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 09 Sep 2026 12:04:59 +0000
Received: from [192.168.1.37] (lfbn-gre-1-371-96.w90-112.abo.wanadoo.fr
 [90.112.87.96]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id B11CD81D29;
 Wed,  9 Sep 2026 14:04:58 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=P1Fan9ahgx2VBI8jliJ5LQtzmgAzErGHYFISr9EhURY=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=WwIno9lwwYlYHntYi869ckVap9ge2VS3F9+ps2AMEMhXd7taM+hs/r0G3hMJ29lZl5kVewOE2
 bnupksPVZ01+fNJ8nIIlKemzsNH2qBCp/w4/4i7UYL2jM+/t6CqEbpicWavHMHK85v91fnDV3Q0
 lwYAhS8+neCyrvpiIUFTEs3TzFnMCmGhJq+yfotBBf5ZWsGh0pquIgt8DPJ+McmJ6cNiIr9F8L2
 R97+YTtp8F0tSi1iuIuw5yNZDVBYQCXQRIFOaOqeBtaK5i21tBuiNV92E0adptQNdlz3v7J3gcZ
 ljAHwYKA/HKHw0N6Y8cDIjIb1U1tL6tcC9Zyokb8psxA==
X-Zone-Loop: 880373e9f02c3b0fbfc057b49853be444a6872c7ee59
x-campaign-type: default
x-transaction-id: 1ad97e21-e073-4d3d-8d05-868ff0f91f71
x-swg-uid: 01-481fe253-67e6-491c-a2ca-1b27c86c6acb
X-Mailer: Sweego
Message-ID:
 <1788955499.8631fc262581453bbf619ec5b2062170.1a0860e9b57000c4f3@vates.tech>
x-swg-bid: 1788955499.8631fc262581453bbf619ec5b2062170.1a0860e9b57000c4f3
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 22/39] xen/riscv: add guest memory read helper
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
In-Reply-To: <b68a29b7ef5b2cb83fde405b3854c94a2f44f4d0.1787838835.git.oleksii.kurochko@gmail.com>
References: <cover.1787838835.git.oleksii.kurochko@gmail.com>
 <b68a29b7ef5b2cb83fde405b3854c94a2f44f4d0.1787838835.git.oleksii.kurochko@gmail.com>
Date: Wed, 09 Sep 2026 14:04:50 +0200
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788955498; l=3931;
 i=baptiste.le-duc@vates.tech; s=20260810; h=from:subject:message-id;
 bh=FYp7Yp+6NxVDJREZj+5tCvCL3vAYifXWUEp4s3gGLPw=;
 b=LIwZlhpleQKZI4wVaJNHF7QVE4PBFm1mLXeNd9hPdj2/BBWxWa86NMQ6OO2fFg1OwAAGyz9Aq
 2cbVhznTfKyAqOLBRxikXAuBvXACfK8J/DTy0ZxTWYvvcmRfS36B/V7
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=ed25519;
 pk=N+BbdvMXRzrCuX/ieh4RWodiAKcLNvI+KjflcZ0oXCo=
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1788955498924
X-purgate-ID: tlsNG-42698a/1788955508-AA0C59EA-0CED9A1D/10/73395122804
X-purgate-type: spam
X-purgate-size: 3931

> Introduce riscv_read_guest() to allow Xen to safely read guest memory
> using HLV/HLVX instructions while reliably capturing trap context.

> This is required for instruction fetch emulation and MMIO decoding, where
> Xen must inspect guest memory that may not be directly accessible and may
> fault.
> 
> The implementation is based on kvm_riscv_vcpu_unpriv_read() from Linux,
> with one deviation: the hlv/hlvx instructions translate the guest address
> through the live vsatp/hgatp CSRs, i.e. through the address space of the
> currently running vCPU, so the function can only be called safely for
> current. Instead of taking a struct vcpu argument, it always operates on
> current directly.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>
> diff --git a/xen/arch/riscv/guestcopy.c b/xen/arch/riscv/guestcopy.c
> index 8a89212e0b..b2327822ac 100644
> --- a/xen/arch/riscv/guestcopy.c
> +++ b/xen/arch/riscv/guestcopy.c
> @@ -6,6 +6,7 @@
>  #include <xen/string.h>
>  
>  #include <asm/guest_access.h>
> +#include <asm/traps.h>
>  
>  #define COPY_from_guest     0U
>  #define COPY_to_guest       BIT(0, U)
> @@ -114,3 +115,89 @@ unsigned long copy_to_guest_phys(struct domain *d, paddr_t gpa, void *buf,
>      return copy_guest(buf, gpa, len, GPA_INFO(d),
>                        COPY_to_guest | COPY_gpa);
>  }
> +
> +/*
> + * Read machine word from guest memory
> + *
> + * @guest_addr: Guest address to read
> + * @read_insn: Flag representing whether we are reading instruction
> + * @trap: Output pointer to trap details if something went wrong during read
> + *
> + * The hlv/hlvx instructions translate guest_addr through the live
> + * vsatp/hgatp CSRs, so the read is only meaningful for the address
> + * space of the currently running vCPU.
> + *
> + * At most two halfwords are fetched when @read_insn is true, i.e. encodings
> + * wider than 32 bits are not supported. Such an encoding cannot be completed
> + * by calling this function again at @guest_addr + 4: the length check is
> + * applied to the first halfword read, which would then be a continuation of
> + * the instruction rather than its opcode. It is up to the caller to reject
> + * anything that is neither a 16- nor a 32-bit encoding.
> + */
> +unsigned long riscv_read_guest(unsigned long guest_addr, bool read_insn,
> +                               struct trap_info *trap)
Nit: every other function in this file / declared in this header
(raw_copy_from_guest, copy_to_guest_phys, ...) has no riscv_ prefix. Why
does this one get it?
> +{
> +    /*
> +     * Poison the result: if the very first access faults, the fixup skips
> +     * over the loads without writing it. Callers must check trap->scause.
> +     */
> +    unsigned long val = ~0UL, tmp;
>
The actual "did a trap happen" contract callers rely on is
trap->scause == 0. If the very first access faults, fixup_exception() will
write scause accordingly to a non-zero value, but nothing in this function
clears trap->scause on the success path.
> +
> +    /*
> +     * hlv/hlvx use hstatus.SPVP for the privilege of the access, and the
> +     * live vsatp/hgatp for the translation. Xen never installs a value of
> +     * its own in hstatus (it is only saved on trap entry and restored
> +     * before sret) and it doesn't reschedule before returning to the
> +     * guest, so all three still belong to the vCPU which trapped.
> +     *
> +     * Check the saved copy rather than the live CSR: a nested trap taken
> +     * from HS-mode clears hstatus.SPV in the CSR (but leaves SPVP alone).
> +     */
> +    ASSERT(vcpu_guest_cpu_user_regs(current)->hstatus & HSTATUS_SPV);
Just to understand, what is the aim of this check? Is it to be sure this
function has been called during a guest fault and not a nested HS fault?

-- 
Baptiste Le Duc <baptiste.le-duc@vates.tech>

