Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0A14606A324
	for <xen-devel@archiver.kernel.org>; Thu, 19 Nov 2026 16:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vates.tech header.i=@vates.tech header.a=rsa-sha256 header.s=selector1 header.b=NCKBurla
Received: from list by lists.xenproject.org with outflank-mailman.1496700.1695120 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xU54F-00073i-Si; Thu, 19 Nov 2026 16:32:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1496700.1695120; Thu, 19 Nov 2026 16:32:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xU54F-00073X-Pq; Thu, 19 Nov 2026 16:32:59 +0000
Received: by outflank-mailman (input) for mailman id 1496700;
 Thu, 19 Nov 2026 16:32:58 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1f4a7711a000183d@swg.vates.tech>)
 id 1xU54E-00073M-NF
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2026 16:32:58 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xU54E-007on4-3b
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2026 17:32:58 +0100
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1f4a7711a000183d@swg.vates.tech>)
 id 6aff24b7-e002-0a2a0a5209dd-0a2a4506b6f2-8
 for <xen-devel@lists.xenproject.org>; Thu, 19 Nov 2026 17:32:58 +0100
Received: from [185.255.28.35] (helo=prod-mta-13-02.swg-srv.net)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1f4a7711a000183d@swg.vates.tech>)
 id 6aff24b9-195a-0a2a45060019-b9ff1c23a269-3
 for <xen-devel@lists.xenproject.org>; Thu, 19 Nov 2026 17:32:57 +0100
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a1f4a7711a000183d.008 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 19 Nov 2026 16:32:56 +0000
Received: from [100.68.94.6] (lfbn-gre-1-56-253.w92-157.abo.wanadoo.fr
 [92.157.33.253]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id 842FB82D01;
 Thu, 19 Nov 2026 17:32:55 +0100 (CET)
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
 q=dns/txt; s=selector1; bh=VknNxAeQfk9gKtSqrbhm8Vu9VtPn6v7a7gW51naOS2Q=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=NCKBurlaqZ86St1JM7BSfXTxfjFp9/enVDNHYDddLEYcsvuhMmnBzDpejRYd8z1FbO1lvg7Zi
 2ClmEmJQk/WS7YX/tJ9lrJP59+5i5rGXQqRn6rgs4e5PdWjaqrSMcYn07Zb96tXGCezIUqS05cI
 Y4MeESrGsy95lIvRqEzAFxAQbZKpy9Qe8/3E0OLLhhxuDeeZWzpkURVXxjVMn1MUBy5L7DCvtDs
 hBpXzbMkwE4u6d6Jq3n4M1OIoP10pqNsXYxllYdMsG/NOORdzahMvdW4/7hWM416Z6rIOieG+9V
 4KoxwDn8aLdUx8XfQxF8ITKZBmWarQsX7IGRuVHQFJ6Q==
X-Zone-Loop: ee7f49208adbc578bdc4ee823a2b00948609f9c78b3d
x-campaign-type: default
x-transaction-id: a379d699-c688-434d-8e8a-83762a9489ef
x-swg-uid: 01-88e27790-7a87-4a4a-9e4e-940cd8c594d0
X-Mailer: Sweego
Message-ID:
 <1795105976.8631fc262581453bbf619ec5b2062170.1a1f4a7711a000183d@vates.tech>
x-swg-bid: 1795105976.8631fc262581453bbf619ec5b2062170.1a1f4a7711a000183d
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] xen/riscv: vsbi: add SBI TIME extension
From: Baptiste Le Duc <baptiste.le-duc@vates.tech>
To: Hiago De Franco <hfranco@baylibre.com>
Cc: xen-devel@lists.xenproject.org, 
 Alistair Francis <alistair.francis@wdc.com>, 
 Baptiste Le Duc <baptiste.le-duc@vates.tech>, 
 Connor Davis <connojdavis@gmail.com>, 
 Oleksii Kurochko <oleksii.kurochko@gmail.com>, 
 Ronaldo Nunez <rnunez@baylibre.com>, 
 Andrew Cooper <andrew.cooper3@citrix.com>, 
 Anthony PERARD <anthony.perard@vates.tech>, 
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, 
 Julien Grall <julien@xen.org>, 
 =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>, 
 Stefano Stabellini <sstabellini@kernel.org>
In-Reply-To: <20261119-riscv-vsbi-time-ext-v1-1-1d5813a883e6@baylibre.com>
References: <20261119-riscv-vsbi-time-ext-v1-1-1d5813a883e6@baylibre.com>
Date: Thu, 19 Nov 2026 17:32:48 +0100
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795105970; l=1997;
 i=baptiste.le-duc@vates.tech; s=20260810; h=from:subject:message-id;
 bh=G4WHKdo2Wi7m6NytMKbqKNx6BK9AiP1NLGY9fioofEw=;
 b=1Mac5YqAMk2oFQxvNmjEbLekytjXN4utNTT7YjzTcnWSayO3EVgQlF2RbjlH7J+2ep1f2jCuf
 FdModue3DKgAGQlL+Hj5eNSSeok4yMTyQEoJjnCTJaJNbd4lxRZ3IAJ
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=ed25519;
 pk=N+BbdvMXRzrCuX/ieh4RWodiAKcLNvI+KjflcZ0oXCo=
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1795105975747
X-purgate-ID: tlsNG-16d1c6/1795105978-F687577B-99F63A40/0/0
X-purgate-type: clean
X-purgate-size: 1997
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The commit's name is kind of weird with this two `:` next to each other.
Here is suggestion based on previous patches (xen/riscv: implement SBI legacy SET_TIMER support for guests (647542cdf1)...)
    ```
    xen/riscv: implement SBI TIME extension for guests
    ```

> [ ... 8 lines skipped ... ]
> Implement the TIME extension and handle SET_TIMER() by programming the
> vCPU virtual timer through vtimer_set_timer(). With the extension
> registered, SBI_EXT_BASE_PROBE_EXT reports TIME as available and Linux
> selects the v0.2 path.
> 
> Assisted-by: DeepSeek:v4.1-flash
Uncommon to see DeepSeek model used :)
> [ ... 46 lines skipped ... ]
> +static int vsbi_time_ecall_handler(unsigned long eid, unsigned long fid,
> +                                   struct cpu_user_regs *regs)
> +{
> +    ASSERT(eid == SBI_EXT_TIME);
> +
> +    if ( fid != SBI_EXT_TIME_SET_TIMER )
> +        return SBI_ERR_NOT_SUPPORTED;
> +
> +    vtimer_set_timer(&current->arch.vtimer, regs->a0);
>
Nit: this assumes VSXLEN == 64, i.e. that stime_value fits in a0. The
SBI spec (binary-encoding.adoc) says:

    Parameters that are 2×XLEN bits wide are passed in a pair of
    argument registers, with the low-order XLEN bits in the
    lower-numbered register and the high-order XLEN bits in the
    higher-numbered register.

and sbi_set_timer() takes a uint64_t stime_value, so an RV32 guest
passes it in a0 (low) and a1 (high).

That's fine today, as both Xen and its guests are RV64 only, and the
legacy SET_TIMER path makes the same assumption. But nothing in the
tree enforces it for guests, so it might be worth stating it somewhere.

Oleksii, any opinion on that point?


> +
> +    return SBI_SUCCESS;
> +}
> +
> +VSBI_EXT(time, SBI_EXT_TIME, SBI_EXT_TIME, vsbi_time_ecall_handler);
With Nits fixed, it lgtm.
Thanks for your contribution!

Reviewed-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>

-- 
Baptiste Le Duc <baptiste.le-duc@vates.tech>

