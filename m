Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F3C9606A31B
	for <xen-devel@archiver.kernel.org>; Wed,  4 Nov 2026 14:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vates.tech header.i=@vates.tech header.a=rsa-sha256 header.s=selector1 header.b=CHtWPm5q
Received: from list by lists.xenproject.org with outflank-mailman.1471950.1680064 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xObY2-0006A6-Ri; Wed, 04 Nov 2026 14:01:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1471950.1680064; Wed, 04 Nov 2026 14:01:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xObY2-00069z-Or; Wed, 04 Nov 2026 14:01:06 +0000
Received: by outflank-mailman (input) for mailman id 1471950;
 Wed, 04 Nov 2026 14:01:05 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1a6dcf00e000403d@swg.vates.tech>)
 id 1xObY1-00069r-Co
 for xen-devel@lists.xenproject.org; Wed, 04 Nov 2026 14:01:05 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xObY0-00EYjg-JT
 for xen-devel@lists.xenproject.org; Wed, 04 Nov 2026 15:01:04 +0100
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1a6dcf00e000403d@swg.vates.tech>)
 id 6aeb3a98-e002-0a2a0a5209dd-0a2a4506bdee-18
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 15:01:04 +0100
Received: from [185.255.28.35] (helo=prod-mta-13-02.swg-srv.net)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1a6dcf00e000403d@swg.vates.tech>)
 id 6aeb3a9f-195a-0a2a45060019-b9ff1c23840b-3
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 15:01:03 +0100
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a1a6dcf00e000403d.007 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 04 Nov 2026 14:00:59 +0000
Received: from [192.168.1.52] (areims-651-1-80-194.w90-18.abo.wanadoo.fr
 [90.18.187.194]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id C61CC821D0;
 Wed,  4 Nov 2026 15:00:58 +0100 (CET)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=vates.tech header.i="@vates.tech" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:References:Feedback-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=hSvh9tIJZudOU7akmVf6d7si3GhoDN2Ygh0sY5giZ0s=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=CHtWPm5qQ7qhbWqO/x5FSIqFZam6X3+SZJJKKYO3iY+jlsU0c7kV4ak2vospG82P9+SQBmW8e
 1llibiF8PUNQJqUfUyWtsCE/2sXQL1Dunx/Ugr+9Ah2qwosPJ1ZCfbo23rzZHykb4+1PgOB3iGv
 kroYQmLovRYrlqg7zfm6XmTyA/o0hVwon3W5NS0hIUeTM/8uI2tPj/FeibKVCx2eOTT9ojcQ8w8
 ixL7OJwNIrX46PCJAahw5oMNuiD1w9jFX7mhbwuSFQZiXAQhBj396e1MwpdwI+RUwDTH2kT6WfO
 7H+x+1hqjfHHE41rzxe8r/z0/tULqJc2rrukhtNxEQnQ==
X-Zone-Loop: 844fcfab838b5d821057add834ab5cc9ade412b5e98f
x-campaign-type: default
x-transaction-id: 635ced06-c1d8-4989-9473-279cf7bc1871
x-swg-uid: 01-8c46f024-b652-42d7-9b7f-50ee49b5929e
X-Mailer: Sweego
Message-ID:
 <1793800859.8631fc262581453bbf619ec5b2062170.1a1a6dcf00e000403d@vates.tech>
x-swg-bid: 1793800859.8631fc262581453bbf619ec5b2062170.1a1a6dcf00e000403d
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v3 37/39] xen/riscv: implement continue_new_vcpu()
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
In-Reply-To: <0d254188c7f21c88ef1982dc9c5810f7b503e38e.1790779209.git.oleksii.kurochko@gmail.com>
References: <cover.1790779209.git.oleksii.kurochko@gmail.com>
 <0d254188c7f21c88ef1982dc9c5810f7b503e38e.1790779209.git.oleksii.kurochko@gmail.com>
Date: Wed, 04 Nov 2026 15:00:50 +0100
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793800853; l=2013;
 i=baptiste.le-duc@vates.tech; s=20260810; h=from:subject:message-id;
 bh=/knFn1VKfhNtR1yW6m3cyPzh9rzT7yTH+1/ivqer6G8=;
 b=BU3lTBHrU/K3BRx24WT1O1ig+mwJuF03kON/DZ4yoO6EyLet15ESYlaRNpsuj5OFRHJrKkPnK
 JxyjZvx6/cOCCL00QQSAlTJgn4Mz7rX0QnUtSpyw2c5l7M7NfRQfZEz
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=ed25519;
 pk=N+BbdvMXRzrCuX/ieh4RWodiAKcLNvI+KjflcZ0oXCo=
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1793800859044
X-purgate-ID: tlsNG-16d1c6/1793800863-FE67277B-C1A9AE69/0/0
X-purgate-type: clean
X-purgate-size: 2013
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> continue_new_vcpu() is the arch hook invoked the first time a freshly
> created vCPU is scheduled. Implement both cases it has to cover:
>  - for the idle vCPU, switch to its own stack and jump to idle_loop();
>  - for a guest vCPU, enter the guest through the new
>    return_to_new_vcpu() path in entry.S, which restores hstatus and
>    sepc, passes the hart id in a0 and, in a1, either the DTB address
>    (boot vCPU, as expected by the RISC-V boot protocol) or the opaque
>    value passed to SBI HSM hart_start() (secondary vCPUs), clears the
>    remaining GPRs, sets sstatus.SPP and sstatus.SPIE and executes sret.
> 
Nit: the guest vCPU sentence is hard to follow in one go. Maybe split it:

  - for a guest vCPU, enter the guest through the new
    return_to_new_vcpu() path in entry.S. It restores hstatus and
    sepc and passes the hart id in a0. a1 holds the DTB address for
    the boot vCPU (as expected by the RISC-V boot protocol), or the
    opaque value passed to SBI HSM hart_start() for secondary vCPUs.
    It then clears the remaining GPRs, sets sstatus.SPP and
    sstatus.SPIE, and executes sret.

> [ ... 94 lines skipped ... ]
> --- a/xen/arch/riscv/entry.S
> +++ b/xen/arch/riscv/entry.S
> @@ -147,3 +147,42 @@ FUNC(__context_switch)
>  
>          ret
>  END(__context_switch)
> +
> +/*
> + * Enter a vCPU for the first time. Must be called with interrupts disabled,
> + * see continue_new_vcpu().
> + */
> +FUNC(return_to_new_vcpu)
> +        REG_L   t0, CPU_USER_REGS_HSTATUS(sp)
> +        csrw    CSR_HSTATUS, t0
> +
At this point regs->hstatus only has SPV | SPVP (arch_vcpu_create()), so
VSXL is written as 0, which is a reserved encoding. That only gets fixed
by "xen/riscv: set the guest's XLEN explicitly in hstatus.VSXL", which
comes later in the series. Wouldn't it be better to move that one ahead
of this patch?

Reviewed-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>

-- 
Baptiste Le Duc <baptiste.le-duc@vates.tech>

