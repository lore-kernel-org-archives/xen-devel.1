Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62241C98324
	for <xen-devel@archiver.kernel.org>; Fri, 25 Sep 2026 09:22:39 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1433558.1654060 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xA28V-0000pz-7y; Fri, 25 Sep 2026 09:22:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1433558.1654060; Fri, 25 Sep 2026 09:22:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xA28V-0000ps-59; Fri, 25 Sep 2026 09:22:31 +0000
Received: by outflank-mailman (input) for mailman id 1433558;
 Fri, 25 Sep 2026 09:22:30 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xA28T-0000p7-Uk
 for xen-devel@lists.xenproject.org; Fri, 25 Sep 2026 09:22:30 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xA28T-008DbT-BO
 for xen-devel@lists.xenproject.org; Fri, 25 Sep 2026 11:22:29 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0d7df725e00072c4@swg.vates.tech>)
 id 6ab63d55-bab6-0a2a0a5309dd-0a2a450ad48a-4
 for <xen-devel@lists.xenproject.org>; Fri, 25 Sep 2026 11:22:29 +0200
Received: from [185.255.28.35] (helo=prod-mta-13-02.swg-srv.net)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0d7df725e00072c4@swg.vates.tech>)
 id 6ab63d55-f2d2-0a2a450a0019-b9ff1c23a845-3
 for <xen-devel@lists.xenproject.org>; Fri, 25 Sep 2026 11:22:29 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a0d7df725e00072c4.007 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 25 Sep 2026 09:22:20 +0000
Received: from [192.168.1.37] (lfbn-gre-1-371-96.w90-112.abo.wanadoo.fr
 [90.112.87.96]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id 9DD4881F57;
 Fri, 25 Sep 2026 11:22:19 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=yMkgpgjoPO5Zwne+U57iuasthQXgXPsJZONhP6yrplI=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=J/Q0OyK0hm/EwCfqTOOS59m/o3A9NaMwsPxl3jv8j0j3Ba2MnQPqvSnOGxUGQd45jlSI6EfA4
 Jjtx4xZ/nirzWa3C3ZBmRuxhubIQfVzwNs/6f2j3CPuHTVYE1xADQJS64S4yu4ChtH6CXdMJKEA
 fgVHTnvpQcINawAaUwQAODTuQQ3DzEnS5uPhcizOhz+aHIGvo3zHl9iypo5ao4sRBtLX7sVe4PG
 vFBMwxktW0xYbg64FyLagZMKP1M5MCxqYn8Z15d4NdUeXAT2Rn/uUSqGWDGnlQpS62GIXnY8tH/
 u+SFwOqPt332wXuY3AWbv2vU427zQ3uZBoklo1v9DF1g==
X-Zone-Loop: c956adb237c4396ec341af446ca9b513621539f8049b
x-campaign-type: default
x-transaction-id: c3b19550-973f-4d80-b0c6-5b32e5aa9db3
x-swg-uid: 01-10f32111-2741-4796-aa4a-980fafcd225b
X-Mailer: Sweego
Message-ID:
 <1790328140.8631fc262581453bbf619ec5b2062170.1a0d7df725e00072c4@vates.tech>
x-swg-bid: 1790328140.8631fc262581453bbf619ec5b2062170.1a0d7df725e00072c4
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 38/39] xen/riscv: implement continue_new_vcpu()
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
In-Reply-To: <a282887cc08cd9b05f59d46cab9377915e83c61d.1787838835.git.oleksii.kurochko@gmail.com>
References: <cover.1787838835.git.oleksii.kurochko@gmail.com>
 <a282887cc08cd9b05f59d46cab9377915e83c61d.1787838835.git.oleksii.kurochko@gmail.com>
Date: Fri, 25 Sep 2026 11:22:11 +0200
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790328132; l=4790;
 i=baptiste.le-duc@vates.tech; s=20260810; h=from:subject:message-id;
 bh=RgdpzRTfxh87IHWx3Zc6PKiXzVKdXezeQqS5BeLk8Gc=;
 b=SoSho3XMk1U+ppWucrSnCeuPSk2MRZg1FgiXnQtWx9oY+wKFfcW0q6IEDunREEfjGLWuNEVFf
 6fhx94CJ4vQBw/KnBvn/Mze5+8UHhjTxYmiDnMvtWUafb88wzYtMvzI
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=ed25519;
 pk=N+BbdvMXRzrCuX/ieh4RWodiAKcLNvI+KjflcZ0oXCo=
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1790328139847
X-purgate-ID: tlsNG-4011c0/1790328149-53CD3CFC-A299344D/10/73395122804
X-purgate-type: spam
X-purgate-size: 4790

> continue_new_vcpu() is the arch hook invoked the first time a freshly
> created vCPU is scheduled. Implement both cases it has to cover:
>  - for the idle vCPU, switch to its own stack and jump to idle_loop();
>  - for a guest vCPU, restore hstatus and enter the guest through the new
>    return_to_new_vcpu() path in entry.S, which loads sepc, passes the
>    hart id in a0 and the DTB address in a1 as expected by the RISC-V
>    boot protocol, sets sstatus.SPP and executes sret.


> 
> Interrupts have to stay disabled across the restore. The trap entry
> logic implicitly clears hstatus.SPV, so an interrupt taken between the
> write of hstatus and sret would make sret return to HS-mode instead of
> VS-mode, and restoring SPV afterwards is non-trivial. Instead interrupts
> are simply kept off and sstatus.SPIE is set, so that SIE is restored from


> SPIE once sret has been executed. Also, it follows what hardware will do
> with real CPU which is also started with interrupts disabled.


> 
> Introduce get_cpu_info() and reset_stack_and_jump() in asm/current.h,
> needed by the above. get_cpu_info() is a macro rather than a static
> inline because asm/current.h is pulled in by <xen/percpu.h> before


> this_cpu() is defined and before <xen/sched.h> completes struct vcpu.
> 
> idle_loop() is added as a stub on purpose; its real implementation will
> come separately later.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>
> diff --git a/xen/arch/riscv/domain.c b/xen/arch/riscv/domain.c
> index 2918196822..0782148b72 100644
> --- a/xen/arch/riscv/domain.c
> +++ b/xen/arch/riscv/domain.c
> @@ -8,10 +8,13 @@
>  #include <xen/smp.h>
>  #include <xen/vmap.h>
>  
> +#include <asm/aia.h>
> +#include <asm/aplic.h>
>  #include <asm/bitops.h>
>  #include <asm/cpufeature.h>
>  #include <asm/csr.h>
>  #include <asm/current.h>
> +#include <asm/imsic.h>
>  #include <asm/intc.h>
>  #include <asm/mmio.h>
>  #include <asm/riscv_encoding.h>


> @@ -140,9 +143,43 @@ static void vcpu_csr_init(struct vcpu *v)
>      v->arch.hie = MIP_SGEIP;
>  }
>  
> +static void schedule_tail(struct vcpu *prev);
> +static void noreturn idle_loop(void);
> +void noreturn return_to_new_vcpu(void);


> +
>  static void continue_new_vcpu(struct vcpu *prev)
>  {
> -    BUG_ON("unimplemented\n");
> +    schedule_tail(prev);
> +
> +    if ( is_idle_vcpu(current) )
> +        reset_stack_and_jump(idle_loop);
> +    else


> +    {
> +        /*
> +         * During a context switch to a new vCPU, interrupts must be disabled
> +         * to guarantee that the vCPU's CSR state can be safely restored into
> +         * the hart without being clobbered by an interrupt trap.
> +         *
> +         * For example, when return_to_new_vcpu() finishes, it executes sret.
> +         * At that point, the hart checks hstatus.SPV=1 and sstatus.SPP=1 in
> +         * order to return from HS-mode into VS-mode. If an interrupt were to
> +         * arrive before sret, the trap entry logic would implicitly clear
> +         * hstatus.SPV to 0. Correctly restoring it afterwards is non-trivial,
> +         * and if left as 0, sret would incorrectly return to HS-mode instead
> +         * of VS-mode.
> +         *
> +         * To avoid this, interrupts are kept disabled during the restore.
> +         * Additionally, setting sstatus.SPIE=1 ensures that after sret is
> +         * executed (as sstatus.SIE will be loaded from SPIE), HS-mode will
> +         * continue to receive interrupts normally.
> +         */
> +        local_irq_disable();
> +        csr_set(CSR_SSTATUS, SSTATUS_SPIE);
> +
> +        csr_write(CSR_HSTATUS, vcpu_guest_cpu_user_regs(current)->hstatus);
> +
> +        reset_stack_and_jump(return_to_new_vcpu);


> +    }
>  }
>  
>  int arch_vcpu_create(struct vcpu *v)
> @@ -551,3 +588,8 @@ static void __init __maybe_unused build_assertions(void)
>       */
>      BUILD_BUG_ON(offsetof(struct cpu_info, guest_cpu_user_regs));
>  }
> +
> +static void noreturn idle_loop(void)
> +{
> +    BUG_ON("unimplemented");
> +}
> diff --git a/xen/arch/riscv/entry.S b/xen/arch/riscv/entry.S
> index 331446a238..bf1843dcea 100644
> --- a/xen/arch/riscv/entry.S
> +++ b/xen/arch/riscv/entry.S
> @@ -143,3 +143,26 @@ FUNC(__context_switch)
>  
>          ret
>  END(__context_switch)
> +
> +/* t0 is used as a temporary reg and is clobbered to oblivion */
> +FUNC(return_to_new_vcpu)
> +        /* Swap tp with sscratch */
> +        csrrw   tp, CSR_SSCRATCH, tp
Why do we need a swap? After it, tp will be equal to zero, but we won't
use it. Couldn't we do a basic csrw instead?

-- 
Baptiste Le Duc <baptiste.le-duc@vates.tech>

