Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02851C79FA1
	for <xen-devel@archiver.kernel.org>; Mon,  7 Sep 2026 15:57:47 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1410963.1641781 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x3bit-0007dV-ER; Mon, 07 Sep 2026 15:57:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1410963.1641781; Mon, 07 Sep 2026 15:57:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x3bit-0007dK-BW; Mon, 07 Sep 2026 15:57:31 +0000
Received: by outflank-mailman (input) for mailman id 1410963;
 Mon, 07 Sep 2026 15:57:30 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1x3bis-0007cj-OE
 for xen-devel@lists.xenproject.org; Mon, 07 Sep 2026 15:57:30 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x3bis-001pMF-4s
 for xen-devel@lists.xenproject.org; Mon, 07 Sep 2026 17:57:30 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a07c96862b000c4f3@swg.vates.tech>)
 id 6a9ededc-2eae-0a2a0a5409dd-0a2a45078e0a-18
 for <xen-devel@lists.xenproject.org>; Mon, 07 Sep 2026 17:57:30 +0200
Received: from [185.255.28.35] (helo=prod-mta-13-02.swg-srv.net)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a07c96862b000c4f3@swg.vates.tech>)
 id 6a9edee9-b4ea-0a2a45070019-b9ff1c239fa7-3
 for <xen-devel@lists.xenproject.org>; Mon, 07 Sep 2026 17:57:29 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a07c96862b000c4f3.007 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 07 Sep 2026 15:57:14 +0000
Received: from [192.168.1.46] (areims-651-1-80-194.w90-18.abo.wanadoo.fr
 [90.18.187.194]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id F3C4E81DF0;
 Mon,  7 Sep 2026 17:57:13 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=EWlbJfshw55uOAtF/lqi8vCOopbWc+B9Iv25xVsQaY0=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=o7lh3/cukCYaiA4wxliVN0p1yXiJYg2LCe7OgcVSF5fyG6Iuxl/cqxyKpupVx69eKegH9VNxx
 wf3c3NcOB2kb2YXye5WVF5p0DasVqT7cK4HXbPzfd9+vepyph+Ej2me2CZCqqvdBLto4Cusvcgl
 V/CVF+gvkWGFxqzeXtMlDjxHK2QMf82hqcU5HuLkye1JnGRhBucZMXN7mb/ufAXWi/Ut5SilzyC
 nwwHtu5y957IBDtW7YWVugOOzZes5ZZgcYah7yzT0mz4g1W+hQTjJh0FhnuxpsJjqkJVnLzYf+7
 wApbZGx1WvN8wafaLDZ0WmPtkObqilMZ/ovJQt96a2PA==
X-Zone-Loop: 38dfda20ee6743df597ca2b3ba95d0217b8d82321e48
x-campaign-type: default
x-transaction-id: f860a4da-45dd-4b5f-a178-e88cdd492f28
x-swg-uid: 01-cdd55ba7-6d08-45c6-9f53-001683d25b1f
X-Mailer: Sweego
Message-ID:
 <1788796634.8631fc262581453bbf619ec5b2062170.1a07c96862b000c4f3@vates.tech>
x-swg-bid: 1788796634.8631fc262581453bbf619ec5b2062170.1a07c96862b000c4f3
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 19/39] xen/riscv: implement trap redirection to a
 guest
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
In-Reply-To: <583b0a190bad7121eae9bc99bd1e13dc1743efe4.1787838835.git.oleksii.kurochko@gmail.com>
References: <cover.1787838835.git.oleksii.kurochko@gmail.com>
 <583b0a190bad7121eae9bc99bd1e13dc1743efe4.1787838835.git.oleksii.kurochko@gmail.com>
Date: Mon, 07 Sep 2026 17:57:03 +0200
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788796632; l=3605;
 i=baptiste.le-duc@vates.tech; s=20260810; h=from:subject:message-id;
 bh=7bOpoYd/1VwkJ+AJmm/i+QnhYspYB5cPzUp5yLYwH18=;
 b=Sop5BUipDbpPp7eL3rtauUTaWRDiG4Jkhyg0oG23EKxS2VBKxX1f76pgZ1T47JmNlPVmWk/5d
 iuqal0cKQw0CW5OaLvEQcAcRNTkaWiKHSGccwuKDe1ufx1TndOXRiFX
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=ed25519;
 pk=N+BbdvMXRzrCuX/ieh4RWodiAKcLNvI+KjflcZ0oXCo=
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1788796634260
X-purgate-ID: tlsNG-ef75cf/1788796649-3C817AE4-504CC69C/10/73395122804
X-purgate-type: spam
X-purgate-size: 3605

> Some traps taken by Xen on behalf of a guest can't or shouldn't be handled
> by the hypervisor and have to be reflected to the guest's own S-mode trap
> handler instead: the access faults which handle_guest_page_fault() injects
> for a fault that can never become an emulated access, and, later on, a
> fault taken by the hlv/hlvx sequences of riscv_read_guest() while
> accessing guest memory on a vCPU's behalf.
>
Access faults from handle_guest_page_fault() aren't "taken by Xen on
behalf of a guest" as those are guest-page faults taken directly from the
guest's own execution. Xen just decides they can't be emulated and
reflects them back as access faults. Only the hlv/hlvx case is Xen
trapping on the guest's behalf (Xen itself executes the faulting access).
Conflating the two under one description makes the paragraph confusing.

Suggest splitting into two:

    Two kinds of traps can't or shouldn't be handled by the hypervisor and
    have to be reflected to the guest's own S-mode trap handler instead:

    - Traps Xen takes on the guest's behalf: the hlv/hlvx sequences
    riscv_read_guest() uses to access guest memory.
    - Access faults handle_guest_page_fault() injects for a guest-page
    fault that can never become an emulated access.

> 
> Implement trap_redirect(), until now a BUG_ON() placeholder, for that
> purpose. It makes the trap appear to the guest as if it had been taken
> directly in VS-mode: the trap information is transferred to the guest's
> virtual supervisor CSRs and the vCPU is resumed at its exception vector in
> supervisor mode, following the trap entry rules of the RISC-V privileged
> specification.
> 
> Add the STVEC_* definitions needed to tell the BASE and MODE fields of
> vstvec apart.
> 
> The implementation is based on kvm_riscv_vcpu_trap_redirect() from Linux,
> with a few deviations:
>  - The function reads and writes physical VS-mode CSRs, so it is only
>    meaningful for the currently running vCPU. Instead of taking a
>    struct vcpu argument, it always operates on current.
>  - The MODE field of vstvec is masked off explicitly when computing the
>    exception target PC (exceptions always vector to BASE), rather than
>    relying on the hardwired zero bit of sepc to drop it on VM entry.
>  - Assertions document the preconditions: the trap must have been taken
>    from virtualized mode (hstatus.SPV set), and only synchronous
>    exceptions may be redirected - interrupts must be injected via hvip
>    instead, so that the hardware performs VS-mode trap entry itself,
>    respecting vsstatus.SIE and vectored vstvec dispatch.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>
> diff --git a/xen/arch/riscv/include/asm/riscv_encoding.h b/xen/arch/riscv/include/asm/riscv_encoding.h
> index 2d2e7e11b3..b2071f4758 100644
> --- a/xen/arch/riscv/include/asm/riscv_encoding.h
> +++ b/xen/arch/riscv/include/asm/riscv_encoding.h
> @@ -109,6 +109,12 @@
>  #define SIP_SSIP			MIP_SSIP
>  #define SIP_STIP			MIP_STIP
>  
> +/* stvec/vstvec: MODE is bits [1:0], BASE is bits [XLEN-1:2] */
> +#define STVEC_MODE_MASK			_UL(0x3)
> +#define STVEC_MODE_DIRECT		_UL(0x0)
> +#define STVEC_MODE_VECTORED		_UL(0x1)
> +#define STVEC_BASE_MASK			(~STVEC_MODE_MASK)
Nit: STVEC_MODE_DIRECT and STVEC_MODE_VECTORED aren't used anywhere in
this patch (only STVEC_BASE_MASK is). Either use them where you decide
exceptions always target BASE regardless of MODE, or drop them until a
patch that needs them.

-- 
Baptiste Le Duc <baptiste.le-duc@vates.tech>

