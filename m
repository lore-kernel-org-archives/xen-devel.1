Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A9CAC55ABF
	for <xen-devel@archiver.kernel.org>; Thu,  6 Aug 2026 06:14:41 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1384219.1627237 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrrMs-0001GA-Gs; Thu, 06 Aug 2026 06:14:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1384219.1627237; Thu, 06 Aug 2026 06:14:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrrMs-0001G3-Du; Thu, 06 Aug 2026 06:14:14 +0000
Received: by outflank-mailman (input) for mailman id 1384219;
 Thu, 06 Aug 2026 06:14:13 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wrrMr-0001Fx-AV
 for xen-devel@lists.xenproject.org; Thu, 06 Aug 2026 06:14:13 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wrrMq-005t37-3W
 for xen-devel@lists.xenproject.org; Thu, 06 Aug 2026 08:14:12 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a74262b-e002-0a2a0a5209dd-0a2a450890fe-24
 for <xen-devel@lists.xenproject.org>; Thu, 06 Aug 2026 08:14:11 +0200
Received: from [209.85.128.43] (helo=mail-wm1-f43.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a742633-f659-0a2a45080019-d155802bb831-3
 for <xen-devel@lists.xenproject.org>; Thu, 06 Aug 2026 08:14:11 +0200
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-496bb7cdf51so20017235e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 23:14:11 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47ff79a7302sm3526880f8f.1.2026.08.05.23.14.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Aug 2026 23:14:11 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1785996851; x=1786601651; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q3NsvjRiIBbs/lup0KuOeVPgWmqzORz6pTEhOcQJm1U=;
        b=G3Wz+skJIpa2GoqTT/D6h5xTGwjn65+Q0WakCCHDw0aPeeIki2FnB80Ifd/qIUoE6S
         t3q4vS1zPtZMFshQNhi1U64N4oJcG65zW/hjcZV1UMx2gXygZzvsW/Nhq7qruJEMZm/3
         BpUMn9NYLqB/GSTzBmomYCdYMFKISYbv8dLpA4iIj/T/eDkvCJVGbKCAKAi0aG/eXXNy
         jKM4yC3YmJeGnw55H4W81XwJd6XUC36CBtNQTnLdzBM5cQIr+DUtNVRvrSlYaVtT+vFy
         I4IFuDgkjbc/HJ8wPanwyFDZFGBIV+ooHfrGm3kHk137sNnREr4m8weCN4PM8Hx8Rwck
         CwcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785996851; x=1786601651;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q3NsvjRiIBbs/lup0KuOeVPgWmqzORz6pTEhOcQJm1U=;
        b=Y/XZ3Cc36NG6Qrdh7V2VQfjQ9+87l393oQbPqZiBzT5oFSYrgxpt8X6OLoJCi7UE9s
         iyXt005NVHxJOvHR08QFjkB4hi3Z8C9KZHzMfZ3R65Qsnk2KcBxsNXsCrt+NrVDfGKzS
         vxnzUCx3F76wMlfWSWWds/y+jqJVYgzaeSGXDCcAMLinaJB40EvAqwggBvuimexHw2yz
         0oDiIcPVgbruAxyZo/QmXSowAWoAh3u5KpoBAz0sAnW/pRFB+CRSYFB+KoBUaf0R3VgC
         XWMwBWnO1SlM1kstMStOM1EctlL/oroAq3Ey+/67C8rLX36wtwfIBNizw56gD4ue2AYB
         n/Fg==
X-Gm-Message-State: AOJu0YzL5B0LQFHT+OQ59BzsqWIUMFdCmsoSPYni05utBIvLVkxH8931
	uSSPiGyTrGnsr4vMX0ccaGjvGwfnD18suHqBjWlIl5ttBISNpZ2qo8Jeh8CWI1OsHQ==
X-Gm-Gg: AR+sD136Jcq8MC+hNYGgGfh9f6YiSqV+xfXm4pDQDQ4zTEEdi/t26RpQlUC/uuBnDEs
	IRfgfQxCrX3hEyFR/HtcQEAmblELY9ED+NgX2AuM/Un/O2C6ez1RDFtxiCARNzJqP8lHaSB2u9D
	6ppluiGOfSr3NCuiIIy9bjhkOMWc5w8aGa3uOcpR3Sj2f9f0X4g11fBYj3/kQON0k/PHv7kCfRY
	ciazOVB4aWtDf8sQLnbRewuDvDUU9V7JPutsUuBDE8nyIcj7xGiPrufLSvAmyOz/cDXeaqC2YaV
	CXkmcgL9LB0yqoqrF+1sHbbCb7QHhGgvm2wBRR572ypRZQxPZa0uU85vU0h8IPrQRMkLpcpEZd+
	tXlDgXsvzMKEKxWJH5ynj5MYKDjf6/J7EoV2jdtB9nU70ICVM8g8lHBagEyIXI9YBuYuR+43Ksp
	B+WbKRQ2QU1MnuKrJ1KwJRxE3d99f6G3hmMdZ+713Edq2MpmdtXvXJR2qGkQntLCiDH8lkiP2c1
	8zCpLE3ArRZmVq10xx1ve+kDeAT5KQJBh9NPR1MKlqqTFjAOJxA
X-Received: by 2002:a05:600c:8b75:b0:495:4fd4:619b with SMTP id 5b1f17b1804b1-4994e70a6eamr191952195e9.1.1785996851313;
        Wed, 05 Aug 2026 23:14:11 -0700 (PDT)
Message-ID: <27d57a69-360d-4247-a5c2-0fa2c3482b13@suse.com>
Date: Thu, 6 Aug 2026 08:14:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/svm: mandatory update VMCB nextrip for soft
 interrupts
To: Chunjie Zhu <chunjie.zhu@citrix.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Jason Andryuk <jason.andryuk@amd.com>,
 Teddy Astie <teddy.astie@vates.tech>
References: <20260806031732.10242-1-chunjie.zhu@citrix.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <20260806031732.10242-1-chunjie.zhu@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c1860d/1785996851-CC77387B-61A32AC0/0/0
X-purgate-type: clean
X-purgate-size: 1367

On 06.08.2026 05:17, Chunjie Zhu wrote:
> Signed-off-by: Chunjie Zhu <chunjie.zhu@citrix.com>
> ---
>  xen/arch/x86/hvm/svm/nestedsvm.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)

Several (formal) issues: First, please adhere to patch submission guidelines:
To: the list, with maintainers Cc:-ed.

> --- a/xen/arch/x86/hvm/svm/nestedsvm.c
> +++ b/xen/arch/x86/hvm/svm/nestedsvm.c
> @@ -449,7 +449,14 @@ static int nsvm_vmcb_prepare4vmrun(struct vcpu *v, struct cpu_user_regs *regs)
>      n2vmcb->virt_ext.bytes =
>          n1vmcb->virt_ext.bytes | ns_vmcb->virt_ext.bytes;
>  
> -    /* NextRIP - only evaluated on #VMEXIT. */
> +    /* next_rip is consumed on VMRUN as the return address pushed on the
> +     * stack·for·injected·soft·exceptions/interrupts. This assignment
> +     * statement must be enforced, otherwise, it might cause vcpu wedge.
> +     *
> +     * APM Vol.2 Event Injection does not specifies what happens if NEXTRIP
> +     * holds an invalid/garbage value.
> +     */
> +    n2vmcb->nextrip = ns_vmcb->nextrip;

Then, much of the comment looks like it wants to be the patch description
instead. Any remaining comment here then wants to follow style as set forth
by ./CODING_STYLE. And finally the unusual not-exactly-space characters
('·') likely aren't justified to use here.

Jan

