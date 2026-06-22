Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E130FCDB46F
	for <xen-devel@archiver.kernel.org>; Mon, 22 Jun 2026 13:31:10 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1343741.1602961 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wbejh-0000sU-DM; Mon, 22 Jun 2026 13:30:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1343741.1602961; Mon, 22 Jun 2026 13:30:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wbejh-0000sN-Ah; Mon, 22 Jun 2026 13:30:49 +0000
Received: by outflank-mailman (input) for mailman id 1343741;
 Mon, 22 Jun 2026 13:30:47 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wbejf-0000sH-CC
 for xen-devel@lists.xenproject.org; Mon, 22 Jun 2026 13:30:47 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wbeje-00BCam-Gh
 for xen-devel@lists.xenproject.org; Mon, 22 Jun 2026 15:30:46 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a3938fc-2eae-0a2a0a5409dd-0a2a450ccce8-46
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jun 2026 15:30:46 +0200
Received: from [209.85.221.47] (helo=mail-wr1-f47.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from <jbeulich@suse.com>)
 id 6a393906-94a4-0a2a450c0019-d155dd2fb51b-3
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jun 2026 15:30:46 +0200
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-46019edc13dso1988474f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jun 2026 06:30:46 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-492494496d8sm215580795e9.9.2026.06.22.06.30.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Jun 2026 06:30:45 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1782135046; x=1782739846; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=KpUrppWwbQL48yZPIU7yCTtuCmY7iD2oSU4gRMTJ4rA=;
        b=dwMYYHi8J5KNRIC13QuHIDL/5fzA2/BLe6TwZJx+7GloVw2XvRVQoIT4/+U+PwwcED
         +dx5NIlOaNjmH0lvLUH7fmKMHMWQa9Kle/+N04yZgzwdw+5DC2U9FOn4f/5D4aD5/TFb
         r+cshM/SE+9TDsdaU3m/v0Q/AJgWFWgBjqBbcwZ+v5uxAJg75ZwvlKXeXwa5e2BhUEwR
         OxnEWQi0ZZ4Ik3YK5LAm4dAJ6H1qPGHP71Wlv8F3Eux9Ep7AOzh5ua38ihbkK+YXXuQe
         8Ufvtx86xq6OWDsBH4SMnuCrJpYFffj445XAnlolt9/4Etg790DuJIqbwzH/5bKWxnnO
         lR5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782135046; x=1782739846;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KpUrppWwbQL48yZPIU7yCTtuCmY7iD2oSU4gRMTJ4rA=;
        b=iP7dTlHQOVthpNvKONtIS24XMvwAmPw/qBFpcpzXMJtb1HdcJsDyaPj9Eq/mgKlUv/
         C30Nhx97HgFzdsu/rGQzaPHMOWGatiUQoeA0RDlWE/jPM46z3v4gGjVCmRDZC4ZGnYe0
         Wtm5P3T+vWV7CGeN0vm7k8geLKoJHV3lLZnBLnLlLG7lqrHstQdvxrHylLVwnO5r6dEF
         WKr4xPcVVt769zdYdfkEclZZ5yzPsNXTeidVwHSjw0aO7SuT1VwVUnnqIKdqo8wGEZPM
         3+XqsVnorimm5vNpvyUFN1ZZHeVsQlPiPmGee7yazyPgclfycFr2u1MNYsyNKRRtNkBJ
         B5Fg==
X-Forwarded-Encrypted: i=1; AFNElJ+GaOi/f5KJWvkTtqOn0dBatGwBHAQ3zXvSbOmk/B9W22DcC91A7sePL1zTr+GlQdluj+lp9BUt+tI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwqoN8APMQpOrrsFYoTs0rlR4GkJdxhkCkyBxJ7eLAANKgUR92h
	AWnmMcqCdF2r0LvpWqE8j9R5BdFgTnXXmYSCZNmyuv9ao+z5N5Gf+Lpmu2334OpPpg==
X-Gm-Gg: AfdE7ck6w010qh/trW//oehkOmpX7PO6uClEMvL9kPR7GgcxShpQKErbzZu3m7mU9ah
	0Z/POdqVwQBl4hQyS1nuhwxuEiKb4r9LwNzw0kds+wpz9zeFPrJmxY/jd4h9E8Qn9M94WLJMuSI
	F+8KcerF7ia52usIggGi810BWCnkv5TypBhduNGcvlk73AKnWEWIwuCRWNCX0Yhe5dT7w5CTcBp
	iQK6IajEEBWGLgj2EFJuyLWHeOVNDI1iRA8DzJGf8uT9z1/9AikmyCgeklHj3l6KJAb40dlMg5/
	Y31jodAfZdICq2A2KP1+KNPlV8XfEKwi+2Sg9M8+AokHySAZMw52vw3WhH1zAnn8T7n/6rNGpHV
	gaNXCuTV+aQWNCa1eVmIyZ4/BO874vTqnmV6qZRlGiMtfSAbW1OqefeBLMILsIbHOqXHQZ7WQwK
	8bE6/A8/Ec0OcVPpd14OwthFZjQ0JQMNVvJ+p2xTTN+btgCi+UBULXekmWI/SzNnfNi+u0J9ZdL
	BeP
X-Received: by 2002:a05:600c:a40f:b0:492:432b:d78b with SMTP id 5b1f17b1804b1-492432bdad3mr177051865e9.15.1782135045570;
        Mon, 22 Jun 2026 06:30:45 -0700 (PDT)
Message-ID: <ec182f69-c5b2-481a-bb2f-cfd680036ac2@suse.com>
Date: Mon, 22 Jun 2026 15:30:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] xen/sched: Make cpu_nr_siblings()
 architecture-specific
To: Hirokazu Takahashi <taka@valinux.co.jp>
Cc: Mykyta_Poturai@epam.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Dario Faggioli <dfaggioli@suse.com>, Juergen Gross <jgross@suse.com>,
 George Dunlap <gwd@xenproject.org>, xen-devel@lists.xenproject.org
References: <20260617071206.265599-1-taka@valinux.co.jp>
 <20260617071206.265599-4-taka@valinux.co.jp>
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
In-Reply-To: <20260617071206.265599-4-taka@valinux.co.jp>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d25034/1782135046-537E1ABF-D3B9D34A/0/0
X-purgate-type: clean
X-purgate-size: 2133

On 17.06.2026 09:12, Hirokazu Takahashi wrote:
> --- a/xen/arch/x86/include/asm/processor.h
> +++ b/xen/arch/x86/include/asm/processor.h
> @@ -106,6 +106,7 @@ extern void intel_init_arat(void);
>  
>  #define cpu_to_core(_cpu)   (cpu_data[_cpu].cpu_core_id)
>  #define cpu_to_socket(_cpu) (cpu_data[_cpu].phys_proc_id)
> +#define cpu_nr_siblings(_cpu) (cpu_data[_cpu].x86_num_siblings)

This is uniformly available when building x86. An earlier patch adds an
#include of the new cpu-topology.h ...

> --- a/xen/common/sched/credit2.c
> +++ b/xen/common/sched/credit2.c
> @@ -29,22 +29,6 @@
>  /* #define d2printk printk */
>  #define d2printk(x...)
>  
> -/*
> - * TODO: Abstract this properly, and figure out what Credit2 wants to do with
> - *       the fact that x86_num_siblings doesn't even have the same meaning
> - *       between x86 vendors.
> - */
> -static unsigned int cpu_nr_siblings(unsigned int cpu)
> -{
> -#ifdef CONFIG_X86
> -    return cpu_data[cpu].x86_num_siblings;
> -#elif defined(CONFIG_CPU_TOPOLOGY)
> -    return cpu_topology[cpu].num_siblings;
> -#else
> -    return 1;
> -#endif
> -}

... to this file, thus allowing for the static function to be dropped. However,
...

> --- a/xen/include/xen/cpu-topology.h
> +++ b/xen/include/xen/cpu-topology.h
> @@ -24,6 +24,7 @@ void init_cpu_topology(void);
>  
>  #define cpu_to_core(cpu)   (cpu_topology[cpu].phys_core_id)
>  #define cpu_to_socket(cpu)   (cpu_topology[cpu].phys_socket_id)
> +#define cpu_nr_siblings(cpu) (cpu_topology[cpu].num_siblings)
>  
>  #else /* CONFIG_CPU_TOPOLOGY */
>  
> @@ -31,6 +32,7 @@ static inline void init_cpu_topology(void) {}
>  
>  #define cpu_to_core(cpu)   (0U)
>  #define cpu_to_socket(cpu) (0U)
> +#define cpu_nr_siblings(cpu) (1U)
>  
>  #endif /* CONFIG_CPU_TOPOLOGY */

... one of the two #define-s will take effect here. Whichever one it is, it'll
conflict with x86'es (when building for x86). Am I overlooking something here,
or did you simply not build-test x86? Looks like a problem of the same kind
may actually be introduced already by patch 2.

Jan

