Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4907C61DD3
	for <xen-devel@archiver.kernel.org>; Thu,  3 Sep 2026 13:03:03 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1407125.1640246 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x275S-00071A-DS; Thu, 03 Sep 2026 13:02:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1407125.1640246; Thu, 03 Sep 2026 13:02:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x275S-000713-AI; Thu, 03 Sep 2026 13:02:38 +0000
Received: by outflank-mailman (input) for mailman id 1407125;
 Thu, 03 Sep 2026 13:02:37 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x275R-00070w-8f
 for xen-devel@lists.xenproject.org; Thu, 03 Sep 2026 13:02:37 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x275Q-007WDM-0p
 for xen-devel@lists.xenproject.org; Thu, 03 Sep 2026 15:02:36 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a996fe2-2eae-0a2a0a5409dd-0a2a4502c792-22
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2026 15:02:35 +0200
Received: from [209.85.128.54] (helo=mail-wm1-f54.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a996feb-6ca4-0a2a45020019-d1558036b4b1-3
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2026 15:02:35 +0200
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-49b9320423cso23547695e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2026 06:02:35 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49cee5d476esm78160895e9.1.2026.09.03.06.02.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Sep 2026 06:02:33 -0700 (PDT)
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
        d=suse.com; s=google; t=1788440555; x=1789045355; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Fr9c2bcVH3YZkNHK8y6Ezrb7ww0KyfIezCyd8AC+rh4=;
        b=ZA3RJSGGb/OF0tpM4QwLCK9Mc4QAmHKdlS8Ed5vbOVQZFU5LvNdUuozjzC3oRA4sm9
         5w/ums5JZB5EvtgEtChFCsIEdbC4ogfw6t+tDU54nvFOS5Vs4ttHQzCDqtFAlTEdKOIp
         ywFSWbuDICJJotg1EG/RuXuFRyXeyqYJpZvNv9+HHEepNyGST/VKxSFYqfaWRxmrkPD4
         O8eHQyR5hv7hSc1aNjo9Npd7YFCfAU72zm4YmVXj6ZYs7qEnfA8+cUb30qbtFKSar2tj
         HGu29SAyS3RiWhFQDuwuI3/gk1/06VP/Vby8KYYkniSVMo5eSRRhOmsqLOADsInMRwGu
         zyyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788440555; x=1789045355;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Fr9c2bcVH3YZkNHK8y6Ezrb7ww0KyfIezCyd8AC+rh4=;
        b=Mt98pqNTsAGjMVRPWH6FOot/Kg16+PyKNuiwEzr8LACtvVTjf1JfTm3kvxk6WBlSlh
         DwnqW3jlU2xVfUxrFaMMa/0SqQqxs31d9LWaI+6+RSXFF9PSHeUNdOtFYA+k8dEOTffa
         2CBSStj9uzE0lrh2Rd+YUjGtBq2Rj8mcXPMBqItQfJ+FJ0U8RGiP41e6V07WAQqyjObG
         B8rjauLuNTQjp/i3DmC1MvniUwc5jJ0PB1ENR5rLrIpQAsTpDEpeky2DaQhQZtQVk7zL
         BCysqKxxoa2CfAvOeA81ojHSxyC5ootTdxyFV65SamzotsfnaHfSAzSWBromN41JzGBB
         otCw==
X-Forwarded-Encrypted: i=1; AKwUvBwTUXPqgM3vtp57RinIqvo0d0zNJ+ktH0HONJn9r7PjcZmCISwHjgOLzoEMKffrnIxyFtUSKO1pbuQ=@lists.xenproject.org
X-Gm-Message-State: AFuF++nK8UwRoWH7yf4TZf/HsMzbgBMdqm7ppFHlBXPjbGdkyvPW73lc
	8m1RoMVJ1D5B40m3lc9qhOyEvl1V5SOskeY+ZB3ESJilpx8GdYdikATOloqZpSIXLw==
X-Gm-Gg: AYBFou3zb8gqCspGfZ2P86g4N1OBqmAJTs/CkbkESiRYaEyB41tpCcN1IphX/2She5s
	hZT25VwOhlCKXu4G0CoAYlTjGTEHwMZx5kBrd1TjbN0V3Eicv0bVIMctp21+/7NgsORP4T3eI67
	bpwhjaNVmL0ChHmdEqnExvZW/FF2aS4IXQNyTo3qRdH5BufLz1xYimRX+29ntjDk44BanmP/2Y/
	A8vGlqeztVqpXEW4tNhwoBLJuSz7o3onBm/dpbijlnE6/fcfJA17My53Vp6LEr/7e8BiS9C60Mt
	eXJRQxn+xGzwX9I81u0X08cUngf1g8ixEV7+2ooygyrBB+VUdVEYiBF44Gg8ZdTJbpFOa7NrNDb
	UI7ITPa+o42sVOnPc0+60d72tyUPa/7c446MxelKKAvnsk+h4erqSHe4fpfakn7rwWBRXX18e1P
	vdlwVtY0RKASQYn41yham1IRnnhuPgFEzId0d8kOh8wxSxqdzhzJbRXhLKqc2wPrCHdz7cqURAv
	5PpprrRkYm458vogvyO75Y7N+N4A8Vg6HI7TDBhzSib7JyYaMcI
X-Received: by 2002:a05:600c:4693:b0:499:dbba:9859 with SMTP id 5b1f17b1804b1-49ce5817c57mr198966205e9.5.1788440553759;
        Thu, 03 Sep 2026 06:02:33 -0700 (PDT)
Message-ID: <514b9ad4-912c-45fa-9450-3c85adaef483@suse.com>
Date: Thu, 3 Sep 2026 15:02:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] x86/svm: Intercept CR0 writes selectively
To: Ross Lagerwall <ross.lagerwall@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Jason Andryuk <jason.andryuk@amd.com>, Teddy Astie <teddy.astie@vates.tech>,
 xen-devel@lists.xenproject.org
References: <20260828141955.4009939-1-ross.lagerwall@citrix.com>
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
In-Reply-To: <20260828141955.4009939-1-ross.lagerwall@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-720697/1788440555-31BC82AC-ADF1AC3E/0/0
X-purgate-type: clean
X-purgate-size: 2828

On 28.08.2026 16:19, Ross Lagerwall wrote:
> Xen does not need to track when the TS or MP bits change so opt to
> intercept CR0 writes selectively.

Not anymore, which may want expressing here (or else it looks as if this
would have been possible from the start).

> Aside from potentially reducing a few
> VMEXITs, this fixes a nested virt bug where L1 intercepts CR0_SEL_WRITE
> and L0 intercepts CR0_WRITE. The hardware prioritizes CR0_WRITE and so
> L1 never sees any CR0 writes.

Yet if L1 sets CR0_WRITE, since intercept masks are ORed together (if
I'm not mistaken), ...

> @@ -2882,7 +2884,8 @@ void asmlinkage svm_vmexit_handler(void)
>          break;
>  
>      case VMEXIT_CR0_READ ... VMEXIT_CR15_READ:
> -    case VMEXIT_CR0_WRITE ... VMEXIT_CR15_WRITE:
> +    case VMEXIT_CR1_WRITE ... VMEXIT_CR15_WRITE:
> +    case VMEXIT_CR0_SEL_WRITE:
>          if ( cpu_has_svm_decode && vmcb->ei.mov_cr.mov_insn )
>              svm_vmexit_do_cr_access(vmcb, regs);
>          else if ( !hvm_emulate_one_insn(x86_insn_is_cr_access, "CR access") )

... we may still see VMEXIT_CR0_WRITE here (i.e. its handling cannot be
removed).

> --- a/xen/arch/x86/hvm/svm/vmcb.c
> +++ b/xen/arch/x86/hvm/svm/vmcb.c
> @@ -56,7 +56,7 @@ static int construct_vmcb(struct vcpu *v)
>          GENERAL1_INTERCEPT_HLT         | GENERAL1_INTERCEPT_INVLPG      |
>          GENERAL1_INTERCEPT_INVLPGA     | GENERAL1_INTERCEPT_IOIO_PROT   |
>          GENERAL1_INTERCEPT_MSR_PROT    | GENERAL1_INTERCEPT_SHUTDOWN_EVT|
> -        GENERAL1_INTERCEPT_TASK_SWITCH;
> +        GENERAL1_INTERCEPT_TASK_SWITCH | GENERAL1_INTERCEPT_CR0_SEL_WRITE;

I understand GENERAL1_INTERCEPT_SHUTDOWN_EVT is an existing outlier here,
but can we please not add more? This expression is sorted by bit position,
with said exception. (Yes, that'll be more churn, but I think that's
acceptable here.)

> @@ -76,11 +76,13 @@ static int construct_vmcb(struct vcpu *v)
>      /* Intercept all debug-register writes. */
>      vmcb->_dr_intercepts = ~0u;
>  
> -    /* Intercept all control-register accesses except for CR2 and CR8. */
> +    /* Intercept all control-register accesses except for CR2, CR8 and
> +     * CR0 (covered by selective write). */
>      vmcb->_cr_intercepts = ~(CR_INTERCEPT_CR2_READ |
>                               CR_INTERCEPT_CR2_WRITE |
>                               CR_INTERCEPT_CR8_READ |
> -                             CR_INTERCEPT_CR8_WRITE);
> +                             CR_INTERCEPT_CR8_WRITE |
> +                             CR_INTERCEPT_CR0_WRITE);

In both comment and code I think it would be nice if numeric sorting was
retained. In the comment you also want to mirror what the code does (it
only excludes writes, not reads). Finally - nit: Comment style.

Jan

