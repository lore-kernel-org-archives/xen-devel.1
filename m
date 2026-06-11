Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3083DCD98CE
	for <xen-devel@archiver.kernel.org>; Thu, 11 Jun 2026 14:12:48 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1335603.1597790 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXg94-0000mm-Sq; Thu, 11 Jun 2026 14:12:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1335603.1597790; Thu, 11 Jun 2026 14:12:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXg94-0000mf-Pj; Thu, 11 Jun 2026 14:12:34 +0000
Received: by outflank-mailman (input) for mailman id 1335603;
 Thu, 11 Jun 2026 14:12:33 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wXg93-0000mZ-CX
 for xen-devel@lists.xenproject.org; Thu, 11 Jun 2026 14:12:33 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wXg92-004hwz-Ol
 for xen-devel@lists.xenproject.org; Thu, 11 Jun 2026 16:12:32 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a2ac236-bab6-0a2a0a5309dd-0a2a450ab05e-42
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jun 2026 16:12:32 +0200
Received: from [209.85.128.45] (helo=mail-wm1-f45.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a2ac250-56b3-0a2a450a0019-d155802db430-3
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jun 2026 16:12:32 +0200
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-4908b92904fso91381795e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jun 2026 07:12:32 -0700 (PDT)
Received: from ?IPV6:2003:ca:b70d:3054:345c:e2ed:ca23:72c4?
 (p200300cab70d3054345ce2edca2372c4.dip0.t-ipconnect.de.
 [2003:ca:b70d:3054:345c:e2ed:ca23:72c4])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490e52b3970sm53755545e9.8.2026.06.11.07.12.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Jun 2026 07:12:31 -0700 (PDT)
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
        d=suse.com; s=google; t=1781187152; x=1781791952; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/o+lYOvK+T5TelkpZQ6ctHctNpCXL6IBhBGS8VvO/AU=;
        b=MZenZbwe70aeV/rwy7Q7iQfWym5s43rYpyH7rZTAZL9DR3re8nY+NhWFvZczSTa4lI
         0P5LMBYoD8a+XSjl0Uk+EEaDFRy41pCh5G2RwOf8sukuucrl7d9l+PSqxZpNEdKFSdLu
         ILyOrvehL4ed3RddsJOMzjVEy+yAobKhS8t2HRQ9QYpCwfW9uRpa8eZIXDMIoRxfwvmY
         SGU4ozD2VkqOeW+MczJL5jfik41fVaNnBYc2qpviNNA1DoCkNvcWL39/sBTOv/JqbdVJ
         qU7r2OcVbdka/b36SwFE6hiEieNXf97Q6oOAQrz7KZt4F0ZGD+MHIR/fHwg2Pyljlh0d
         V3+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781187152; x=1781791952;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/o+lYOvK+T5TelkpZQ6ctHctNpCXL6IBhBGS8VvO/AU=;
        b=EhybkYTfchy6tjxDejmpSzsdL+lmIiBEP4y25i8Xw6FATQm1PGQsBjmssodWjmZj39
         NwQeVH/sryW0ngE8zfyvuLmwYFzGcoIwBfMBOkyOXB2vFb+ZcW6uMdp7xpH6jxvg1ozN
         FW6D+TFewr5j2aS86RgfQWP0ZXmH2A1dvvtQzakTHFGef6Kl8hbgdkKk0u/ohxHtVVke
         een+0t2WghNUxoM94L0c5a3VAqetg2LhFILbBNs7/OIjd0mxIj4im/afkX+Y3SNQLfh4
         g33yY1LvJZqec7SvPTCUaSnJBsMVZWd5Q2uoAOX5PdSS0j3+uEijT0TeK4s0C3Pz2Sdl
         75Fw==
X-Forwarded-Encrypted: i=1; AFNElJ8kMBtWcQLY1SuBQL2nS+/iaycff37wNAv0hB9zxIfJnIPPLv1QczDUKYF1najq9XJ4zZLzwZI99tw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwmexW7qUvXgmN/OcCDz6v/DkQSgSe14gw0vn6wtuy+Xx2R4s9C
	jmFxQBThMKaZHfPAdIk5xOl366DZwPwenRzw4nKtA2mOPYc0yuOiZOVgNBChmUgZMNWqAAeVDPH
	5Jic=
X-Gm-Gg: Acq92OFHa8zmVxiMReVukp9JurI70k4pPU0GSq+we5YbmyK48guTVtHpfdxbjgsSXay
	6UKryiW4MTqCaV0unwTny9cgH5U3+3c0daBIlAwnk62kHjD4yxnaYdE/ol6HnirFH9qf4CzsAa0
	ZzNEUlqGequ7hn0FlFVGjVtQzvsTr3F/tu6HtTFoGTjISHOxG2xzfHcr8Tk5L5GZdwWtxYYM1yi
	2zjrv/XpZRo9LXlYeV2zihk33Ece2gCQ1zftl/xmKfhlOB2CJ6LNAIi55LoafvGYrGqiTnmo1Lj
	YCXw7uCx9hP/UbmF9C/7Wm8McldqVy1v22a6/7sNX1A51lSZ+TPEvGvNt3tfxy3lD3DM5sWAfUd
	UhYrhDHOf4N/bgL4V2geaxH/JZK7WX1UvMhU9FBW2WS0ruC6cxYBmo2++zA4/vjey8kieIfqNWV
	3hnwRVM+Ly6F0elLqhCLueD3XEjM9hrxr7xQny7NKtF197dRKw14znMjZTcuPu9EeC7WRYdYFBS
	agboG531wviel9fP/nYogWeTRjVZXIbDJpbfvDzTv5+lCQ3LYDTM7hEjoPNXstJjttKIic=
X-Received: by 2002:a05:600c:8b85:b0:490:cdb2:fb5e with SMTP id 5b1f17b1804b1-490e5636650mr38803455e9.22.1781187151896;
        Thu, 11 Jun 2026 07:12:31 -0700 (PDT)
Message-ID: <4ad6cce2-c15d-4614-9d73-5ed1354047b8@suse.com>
Date: Thu, 11 Jun 2026 16:12:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] xen/sched: Link CPU topology to scheduler
To: Hirokazu Takahashi <taka@valinux.co.jp>
Cc: Mykyta_Poturai@epam.com, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Dario Faggioli <dfaggioli@suse.com>, Juergen Gross <jgross@suse.com>,
 George Dunlap <gwd@xenproject.org>, xen-devel@lists.xenproject.org
References: <20260610111320.133784-1-taka@valinux.co.jp>
 <20260610111320.133784-3-taka@valinux.co.jp>
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
In-Reply-To: <20260610111320.133784-3-taka@valinux.co.jp>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-4011c0/1781187152-7CE7B8B7-52718AFB/0/0
X-purgate-type: clean
X-purgate-size: 2541

On 10.06.2026 13:13, Hirokazu Takahashi wrote:
> Make CPU topology information available to the Xen scheduler.
> Additionally, ensure that this topology information is displayed
> when executing the 'xl info -n' command.

Both in title and description you're pretty generic, yet then ...

>  xen/arch/arm/include/asm/processor.h  |  4 ---
>  xen/arch/arm/smpboot.c                | 10 ++++--
>  xen/common/device-tree/cpu-topology.c | 51 +++++++++++++++++++++++++++
>  xen/common/sched/credit2.c            |  3 ++
>  xen/common/sysctl.c                   |  1 +
>  xen/include/xen/cpu-topology.h        | 10 ++++++
>  6 files changed, 72 insertions(+), 7 deletions(-)

... only the credit2 scheduler is actually enabled.
> --- a/xen/common/device-tree/cpu-topology.c
> +++ b/xen/common/device-tree/cpu-topology.c
> @@ -325,6 +325,55 @@ int __init parse_dt_topology(void)
>      return parse_socket(map);
>  }
>  
> +static void __init setup_cpu_topology_ids(void)
> +{
> +    unsigned int cpu;
> +    unsigned int next_core_id = 0U;
> +    unsigned int next_cluster_id = 0U;
> +    unsigned int next_socket_id = 0U;
> +
> +    for_each_possible_cpu( cpu )

Nit (style): Either you deem for_each_possible_cpu a (pseudo-)keyword
(then there's a blank missing) or you don't (then there are excess
blanks).

> +    {
> +        unsigned int first_cpu;
> +        struct cpu_topology *topo = &cpu_topology[cpu];
> +
> +        first_cpu = cpumask_first(&topo->thread_sibling);
> +        if ( first_cpu == cpu )
> +        {
> +            topo->phys_core_id = next_core_id;
> +            next_core_id++;
> +        }
> +        else
> +        {
> +            topo->phys_core_id = cpu_topology[first_cpu].phys_core_id;
> +        }

Nit, here and below: Please omit unnecessary figure braces.

> @@ -339,4 +388,6 @@ void __init dt_init_cpu_topology(void)
>  
>      for_each_possible_cpu( cpu )
>          setup_siblings_masks(cpu);
As to the earlier remark: Bad pre-existing examples don't count.

> @@ -19,11 +23,17 @@ extern struct cpu_topology *cpu_topology;
>  void map_cpuid_to_node(unsigned int cpuid, struct dt_device_node *cpu_node);
>  void dt_init_cpu_topology(void);
>  
> +#define cpu_to_core(_cpu)   (cpu_topology[_cpu].phys_core_id)
> +#define cpu_to_socket(_cpu)   (cpu_topology[_cpu].phys_socket_id)

Please can you avoid introducing new name space violations (identifiers
with leading underscores should name file scope entities); also again
below.

Jan

