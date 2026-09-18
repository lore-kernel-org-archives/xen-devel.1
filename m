Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3C3CC982D7
	for <xen-devel@archiver.kernel.org>; Fri, 18 Sep 2026 09:17:10 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1425015.1649175 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x7UiG-0000CN-A5; Fri, 18 Sep 2026 09:16:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1425015.1649175; Fri, 18 Sep 2026 09:16:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x7UiG-0000CG-6S; Fri, 18 Sep 2026 09:16:56 +0000
Received: by outflank-mailman (input) for mailman id 1425015;
 Fri, 18 Sep 2026 09:16:55 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1x7UiF-0000C9-Dm
 for xen-devel@lists.xenproject.org; Fri, 18 Sep 2026 09:16:55 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x7UiE-00GHMU-K3
 for xen-devel@lists.xenproject.org; Fri, 18 Sep 2026 11:16:54 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0b3cde12700072c4@swg.vates.tech>)
 id 6aad0186-8faa-0a2a0a5109dd-0a2a450c86f2-2
 for <xen-devel@lists.xenproject.org>; Fri, 18 Sep 2026 11:16:54 +0200
Received: from [185.255.28.35] (helo=prod-mta-13-02.swg-srv.net)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0b3cde12700072c4@swg.vates.tech>)
 id 6aad0186-f479-0a2a450c0019-b9ff1c23ae03-3
 for <xen-devel@lists.xenproject.org>; Fri, 18 Sep 2026 11:16:54 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a0b3cde12700072c4.007 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 18 Sep 2026 09:16:49 +0000
Received: from [192.168.1.46] (areims-651-1-80-194.w90-18.abo.wanadoo.fr
 [90.18.187.194]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id A20C78224D;
 Fri, 18 Sep 2026 11:16:48 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=RsgrKGQ7K/SkL1SaY4LmgOlRzzi05DdCQVjWzygGJMM=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=nhz0zw3fPin6lW4M2p2m94xFDMP7KSREZ197ySLYv1poMDNtkUnvYweKhB03XSpRk5SxK4mDv
 xkkE9/Lr5Hvf3RTtSo/7N/VNftGWK8pC5xT5303TnIQIie+F2iKvRw0mUGItkoefBMxgytncnIe
 gbGRgVRbBchkN5e1gRav0iETpFymaV+1u72cIyTkmkgeAe/DvltVx0Z2tHjdRWuMf9XY2gmk42Y
 tLVwQXT/OO24vNvItjNXSDEYhw7t37pYz1i5vjizJ0p1o10TW7jToUQDr75d+lJNuaxqdieTT8c
 Dddf2Swe4vZL7OF5iQ3IgCM5qJoclPMjJj0djCrLJ37A==
X-Zone-Loop: 206898d69f5ad650ab3547d4d51c28b1c791970ea0e5
x-campaign-type: default
x-transaction-id: 9062a508-4d17-411c-ac67-f3f954d61b42
x-swg-uid: 01-ae25bea2-ff1b-463c-bd4a-f25c08ffb89a
X-Mailer: Sweego
Message-ID:
 <1789723009.8631fc262581453bbf619ec5b2062170.1a0b3cde12700072c4@vates.tech>
x-swg-bid: 1789723009.8631fc262581453bbf619ec5b2062170.1a0b3cde12700072c4
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 25/39] xen/riscv: add guest load emulation for
 trapped MMIO accesses
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
In-Reply-To: <7cf3203f8f826eefa1b24bb2dedbd76c0b611dc1.1787838835.git.oleksii.kurochko@gmail.com>
References: <cover.1787838835.git.oleksii.kurochko@gmail.com>
 <7cf3203f8f826eefa1b24bb2dedbd76c0b611dc1.1787838835.git.oleksii.kurochko@gmail.com>
Date: Fri, 18 Sep 2026 11:16:41 +0200
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789723003; l=2973;
 i=baptiste.le-duc@vates.tech; s=20260810; h=from:subject:message-id;
 bh=7M53VUWqG8Pa5m8oDt0++Lpm1slYVlSiB31RvmnHOPE=;
 b=FStnODzc25STTxD55J3bUhSeAGc4Ym/SyzYB5XXvRuwjmWw0e/bRMmbkdBYLWpBsp2SRb0i27
 n81FhLS0Hm5Br6JAj8srcdEoBWaZAOk9QT2xBRYmj2K++pb9aOIYbdJ
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=ed25519;
 pk=N+BbdvMXRzrCuX/ieh4RWodiAKcLNvI+KjflcZ0oXCo=
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1789723008882
X-purgate-ID: tlsNG-d25034/1789723014-00ECAA5B-126267E9/10/73395122804
X-purgate-type: spam
X-purgate-size: 2973

> Implement emulate_load() on top of the decoding interface introduced by
> the previous patch: fetch the trapped instruction, decode it, dispatch
> the access to a registered MMIO handler via do_mmio(), write the result
> back into the destination register and step over the instruction.
> 
> Xen dispatches MMIO synchronously to an in-hypervisor handler, so unlike
> KVM RISC-V there is no userspace exit/return step and no equivalent of
> the kvm_io_bus_read() / KVM_EXIT_MMIO / kvm_riscv_vcpu_mmio_return()
> split; the result is consumed in place.
> 
> Sign extension is done here rather than in the handlers: a signed load
> is normalized by a shift pair, so a handler need only report the value
> it read.
> 
> At the moment vINTC is the only backend registered with the MMIO
> dispatch, so in practice this only covers vINTC traps. An access which
> no handler claims currently crashes the domain; injecting an access
> fault into the guest instead is left for later.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>
> diff --git a/xen/arch/riscv/emulate.c b/xen/arch/riscv/emulate.c
> index 81a50643a5..e52f285180 100644
> --- a/xen/arch/riscv/emulate.c
> +++ b/xen/arch/riscv/emulate.c
> @@ -5,7 +5,6 @@
>   */
>  
>  #include <xen/bug.h>
> -#include <xen/compiler.h>
>  #include <xen/errno.h>
>  #include <xen/sched.h>
>  #include <xen/types.h>
> @@ -15,6 +14,7 @@
>  #include <asm/current.h>
>  #include <asm/emulate.h>
>  #include <asm/guest_access.h>
> +#include <asm/mmio.h>
>  #include <asm/processor.h>
>  #include <asm/riscv_encoding.h>
>  #include <asm/traps.h>
> @@ -65,8 +65,7 @@ static bool is_load_guest_page_fault(unsigned long scause)
>      return scause == CAUSE_LOAD_GUEST_PAGE_FAULT;
>  }
>  
> -static __maybe_unused void advance_pc(struct cpu_user_regs *regs,
> -                                      unsigned int step)
> +static void advance_pc(struct cpu_user_regs *regs, unsigned int step)
>  {
>      regs->sepc += step;
>  }
> @@ -88,7 +87,7 @@ static __maybe_unused void advance_pc(struct cpu_user_regs *regs,
>   * IS_ENABLED() can't be used here as HSTATUS_VSXL is defined for
>   * __riscv_xlen == 64 only, the field not existing on RV32 in the first place.
>   */
> -static __maybe_unused unsigned int guest_xlen(const struct cpu_user_regs *regs)
> +static unsigned int guest_xlen(const struct cpu_user_regs *regs)
>  {
>  #ifdef CONFIG_RISCV_32
>      return 32;
> @@ -179,8 +178,7 @@ static void resolve_faulting_gpa(struct guest_fault *gf)
>   * Relies on x0..x31 being laid out at the start of struct cpu_user_regs in
>   * architectural register-number order; see the comment there.
>   */
> -static __maybe_unused unsigned long *guest_gpr(struct cpu_user_regs *regs,
> -                                               unsigned int reg)
Could we unified this function with regs_get_gpr()?

-- 
Baptiste Le Duc <baptiste.le-duc@vates.tech>

