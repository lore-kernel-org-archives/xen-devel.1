Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54C5CC61DB9
	for <xen-devel@archiver.kernel.org>; Thu, 27 Aug 2026 16:54:02 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1401293.1637026 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzdM7-0001FX-Vz; Thu, 27 Aug 2026 16:53:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1401293.1637026; Thu, 27 Aug 2026 16:53:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzdM7-0001FQ-SW; Thu, 27 Aug 2026 16:53:35 +0000
Received: by outflank-mailman (input) for mailman id 1401293;
 Thu, 27 Aug 2026 16:53:35 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wzdM6-0001FK-WC
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2026 16:53:35 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wzdM6-003agK-9j
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2026 18:53:34 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a906b70-bab6-0a2a0a5309dd-0a2a4502a972-28
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 18:53:34 +0200
Received: from [209.85.128.46] (helo=mail-wm1-f46.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a906b8e-6ca4-0a2a45020019-d155802ea52a-3
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 18:53:34 +0200
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-495437bb891so10097475e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 09:53:34 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49b91c57943sm1813135e9.2.2026.08.27.09.53.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Aug 2026 09:53:33 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787849614; x=1788454414; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uuqSeC9ghPFHhz7Q9l65GkJHNKdcETa7fStrF9vwBX0=;
        b=ZVetvZP5cvpMnbFGx6vMRbBnGYQy36wZEVsKDa4azXO6goTdDLyomb15z7qIOECGgN
         5a3gtcxBUiHeQlCLRxyYWAcLDEq7MAQ/B2wVagFcSiRmg07hO+f38LxWV3NEEqw7v25G
         1qE6Ipm6Vl+KwndGuQS3MLZVYECwFvY35ecYjM4PfS7dFJ0CP8o+hFvEwSZlp2XbX5bi
         gxux8UoNHqdSKGSHW/M9MOQj4H1TUfkmwfn2FeViltRd7j5VTc/djnC5JgOgT9zOkTQ+
         0p5czkk4Q3zFIYwUX3MZ54wXcRg86nfAw6NMSY2co4ne5QnYW0RJh7wg5jlOcUErf1ZW
         /iHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787849614; x=1788454414;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uuqSeC9ghPFHhz7Q9l65GkJHNKdcETa7fStrF9vwBX0=;
        b=CNBHZD4exccn9EAAmMpkZw+wphZ/q5T7N3uvFrvw5/jZMQ5in6CzIl/c58SdXDxrkj
         nY37Wj1Xntpm0gXuiIMPZsVAPII+m+/f6zr6fEVa45GL9OXg/Baz8GjauJPYumFJksfy
         vBrKZs8gu5LYmQTgEYdS0c8uTPGvw2H44UPC8d+IWmoBl97kD3+ydXEecJ7z90vHxYxu
         2mvILmcXTxKadixvFsM/hrm4/XCAh6s3lFoEIFr3Rn+e66wc4vu2ZCejDPrzhe+mEYEx
         7YBAa/NZHlTJGgsQFexPejYOVxbAs1WRSIPYawoffVFdFAiTNEmfEXQv8BmQxjLrDnt1
         6Kqw==
X-Forwarded-Encrypted: i=1; AHgh+Rpn7EkKrWu7+YtERM2Gk+tuRIRPNp+SW/5VA+/f/PifXVuj9KaA/hcGiAo2R1HGz56p6X+6dKGl+kM=@lists.xenproject.org
X-Gm-Message-State: AFuF++koHtL5p5w5fr4l6uxeT20GXtuAjv7Mu1ZUCHbRGpr+kFdBQCC5
	D3QGIijgsgAbSuV6r19NKnikx7e4VmQC8JEYj5qJcX3ONTsRNSN91C9O
X-Gm-Gg: AR+sD10x/v5vT8fSWLMXkYswNbUCjz6et94bRxcVigJF2p4MlyekqX5Yfq1GJHzqBaK
	MqbSEcbyosb83Dmc6OS/gON31tqCNh6ium6S86WYd/3zp8eqHYrNXbRDV4WM54nO+ycLwUMnX5o
	OZdlg9X6k3Z2QoKPVUVS/NyNsV7C4fy6s7ET0kO8ehXVazB7Z2gJmVtHf0FfjMJpoTdfO4lXTFr
	1dSI7Y0oSYffrJ19cgqapI1ebVX+2MkWzysv7qKuv+uDWlu44IwWzp6hpeAHKwHgJ2mp8AueTY4
	XU1aAw5+PxqPMZHSIFliIuPdmjWDRMACQf9jspLWcrptgP7n5i5RloNochb5Rt2k6M713W7zEhe
	RD4u3+ckWVEKPxdysTyEsWafYYcEtgwbPp6WdzdVuFs0ctpdSPw0RObcce9KHvIkMZIv8+rpDzR
	/xYAKRU++JP8V2FbvEhWeuOJxX49S7izvXZqfRDVbuCMF0Ei2d3gUJDmBTobVG8bbeI0AW4eEHY
	NbbIYWqlMwYT6KLEW8LuvpHZc4rbbfoFzVpd9aYRg==
X-Received: by 2002:a05:600c:1e24:b0:499:5f80:83ac with SMTP id 5b1f17b1804b1-49b91a6d41emr8112645e9.7.1787849613616;
        Thu, 27 Aug 2026 09:53:33 -0700 (PDT)
Message-ID: <9e4778fa-3164-49bc-a921-ce6b251b5db5@gmail.com>
Date: Thu, 27 Aug 2026 18:53:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] xen/riscv: add SFENCE.VMA after enabling paging
To: Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 xen-devel@lists.xenproject.org
Cc: zhangzheng@iscas.ac.cn, Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <1787844438.8631fc262581453bbf619ec5b2062170.1a043d52a06000c4f3@vates.tech>
 <1787844810.8631fc262581453bbf619ec5b2062170.1a043dad5be000c4f3@vates.tech>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <1787844810.8631fc262581453bbf619ec5b2062170.1a043dad5be000c4f3@vates.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-720697/1787849614-670B02AC-9605C51D/10/73395122804
X-purgate-type: spam
X-purgate-size: 3262



On 8/27/26 5:33 PM, Baptiste Le Duc wrote:
> turn_on_mmu() writes satp to switch on Sv39 paging but never fences
> afterwards.
> 
> Xen never allocates a non-zero ASID, so per the Privileged spec, sec.
> 12.2.1 "Supervisor Memory-Management Fence Instruction":
> 
>    "If the implementation does not provide ASIDs, or software chooses
>    to always use ASID 0, then after every satp write, software should
>    execute SFENCE.VMA with rs1=x0."
> 
> The spec text around this rule hedges with "may be necessary", but
> RISC-V spec co-author Andrew Waterman confirmed on the ISA manual
> issue tracker that the fence after a satp write is not optional in
> this case: "The SFENCE after the SATP write is definitely necessary
> ... In general, you need to SFENCE after you've recycled an ASID.
> Since we don't use ASIDs in the Linux kernel yet, every context
> switch is effectively an ASID reuse, hence the full TLB flush." [1]
> The same reasoning applies to Xen: with ASID always 0, this satp
> write is indistinguishable from an ASID reuse to the hart, so the
> fence is required for correctness.

But at the moment of execution of turn_on_mmu() we don't use any ASID, 
do we? It was used in check_pgtbl_mode_support() but at the end it is done:

     csr_write(CSR_SATP, 0);

     sfence_vma();

So basically Bare mode + flush all TLBs presented before and then up to

...

> 
> Add the missing SFENCE.VMA to order those page-table stores before
> the hart's first translation under the new mapping.
> 
> [1] https://github.com/riscv/riscv-isa-manual/issues/226
> 
> Fixes: f5035d480f7a ("xen: add files needed for minimal riscv build")
> Assisted-by: Claude:claude-opus-5
> Signed-off-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>
> ---
>   xen/arch/riscv/riscv64/head.S | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/xen/arch/riscv/riscv64/head.S b/xen/arch/riscv/riscv64/head.S
> index 9c40512e61..7f6edc972f 100644
> --- a/xen/arch/riscv/riscv64/head.S
> +++ b/xen/arch/riscv/riscv64/head.S
> @@ -98,6 +98,7 @@ FUNC(turn_on_mmu)
>           srli    t1, t1, PAGE_SHIFT
>           or      t1, t1, t0
>           csrw    CSR_SATP, t1

... ASID isn't used as we are in Bare mode.

What am I missing?

> +        sfence.vma

The one thing which possibly matters here, and could explain why 
sfence.vma is needed, is:
```
Implementations with virtual memory are permitted to perform address 
translations speculatively and earlier than required by an explicit 
memory access, and are permitted to cache them in address translation 
cache structures—including possibly caching the identity mappings from 
effective address to physical address used in Bare translation modes and 
M-mode.
```

So the TLB could potentially be populated with identity mappings, and I 
agree that it would be better to flush those.

I’m not entirely convinced, though, that the reason here is the ASID 
itself. Rather, it seems that we want to flush because of potentially 
cached speculative identity mappings.

If this reasoning looks correct to you, could we update the commit 
message to reflect this rationale for why sfence.vma is needed here?

Thanks.

~ Oleksii


