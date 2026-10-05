Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E99F2CA5FF0
	for <xen-devel@archiver.kernel.org>; Mon,  5 Oct 2026 08:52:51 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1440617.1658021 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xDeR6-0003v6-IM; Mon, 05 Oct 2026 08:52:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1440617.1658021; Mon, 05 Oct 2026 08:52:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xDeR6-0003uz-FH; Mon, 05 Oct 2026 08:52:40 +0000
Received: by outflank-mailman (input) for mailman id 1440617;
 Mon, 05 Oct 2026 08:52:38 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xDeR4-0003ut-LI
 for xen-devel@lists.xenproject.org; Mon, 05 Oct 2026 08:52:38 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xDeR4-006cYv-2B
 for xen-devel@lists.xenproject.org; Mon, 05 Oct 2026 10:52:38 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ac36542-8faa-0a2a0a5109dd-0a2a4507df6a-46
 for <xen-devel@lists.xenproject.org>; Mon, 05 Oct 2026 10:52:37 +0200
Received: from [74.125.225.141] (helo=mail-wm2-f13.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ac36550-b4ea-0a2a45070019-4a7de18ddf5f-3
 for <xen-devel@lists.xenproject.org>; Mon, 05 Oct 2026 10:52:32 +0200
Received: by mail-wm2-f13.google.com with SMTP id
 5b1f17b1804b1-4a169d33ef6so8106395e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 05 Oct 2026 01:52:32 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48c622b4685sm2024732f8f.41.2026.10.05.01.52.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Oct 2026 01:52:31 -0700 (PDT)
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
        d=suse.com; s=google; t=1791190352; x=1791795152; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OXgn4LN+fUFt+j3H44lAfs5EywG2H9SYDThHvTcTME8=;
        b=AMI0qfRVf8wDFqVxuXh424MxAZjO2QQdkMWlDxYbL1d0PUAp1qvbDwHoz4LJvfQJpd
         A3Bh1CDyGFb9D1XrDXHlRlh6FHKrvk3t3hVIUm4YaVOqwcLaL6oNFgxfodFSl9ksFx6i
         yQ7V7ZIjzX2LHWTDMK67LbUVQp8+QZNvCy8gUJtZLhNrQJfh0nPPVQzAOywEyg2wYEyt
         XOuYc3l83wwnRMmQanRrs+ywujoLet0PDk77tUrK3h9hd1FAwT0wc4IM+kdjLphKMDZs
         nBda9Ll3xT6phEQdREiMY1ksrDojef1NGIdleRD53xG1111i4UqM+UoLIHvLKR4ZHt4W
         C0lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791190352; x=1791795152;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OXgn4LN+fUFt+j3H44lAfs5EywG2H9SYDThHvTcTME8=;
        b=rN8n6zNWq9LMBIrhNy/Q2x6TEaL+IAch8Gf+pzjVD8lTb1SR0N0bY/oa9TUe+Lh8Zk
         O/R3TvjRk6QLCY/DmvBIApsnHm6vM6oJxDDqlavTXsBgMurbjizkvazy2JpMOscFvU5A
         xHMkMLJrr5pi7TuZPpTpHFTE7M+BRyEjPqrcdrhdJoTq026sPv5P0BC7A4jmyShDUZoO
         cMB5mcZEQD0lghFtVk7A8tdfF+GofWKJl0Gmcb7fIl0ljjfDX+b8RcqJIfi7lrrfQKkg
         fY9IcBztSUNaiikyldWuBgbeGBmlm5aLo3huluMZZeEe19rGjAUOmQF7EEWD8IIFbpF0
         BeFg==
X-Forwarded-Encrypted: i=1; AKwUvBy/Tvi4Bj5k4hLXzEmmBS1/ljsnljehFe48SlVa9QA5/xLAnavfONd3QiO1J9fhFJd3hFln9hpW1sc=@lists.xenproject.org
X-Gm-Message-State: AFuF++kjc62wO7kXK+lkmMBYa8YlDe94h+VgI5k/iROE4xXryWjoI/p4
	pp19X3+bkT3e9QNgctqUCPxQDW+SyDewAKW5PeqQFnzzYtfAakXs7JjGg5IzLodaCA==
X-Gm-Gg: AYBFou00iE9hq0A+IcBc2kAasl7kyVwvd1M/UXxZejJzN2Nh3DVX5rdCCCeWGumjUqQ
	pZjkh6TaCFRSb1bWxe/fmHm6fg3QBx/PwOTTP2tQlU36TFqvjS0b03eJzpH+pJ8mrivmDN5Yp++
	kxfWUDJT0WT16lGD3zu+W69mE9BcNlKqs+KteekK0MxK4vFw8sNDHat6wl3s/cIltQpABpfnvom
	rjVUsLDAd/AMIHSS8GuQ5uvfc+uOjNAncOvYqwJQG/EHKpF2LLqiM3sSQGHnfh94UmkTUTGAIMj
	yhNnFJ+7UlY4bm15llTvC+V99WQxAWFVkaxnhp+T1RR5vqMY5wt5bDrK9oj07R104g9oPuMqOYn
	/waTLU6a0kzs/ZbW+Mxz4BpT2bfXi+SpmasOf1KHEvSr++oEvHYxeAzrHRt1iwZ87UXgkVt5zv8
	m8f+pZuFSLwrs6EUsSmW67xybIU7pQ05WnGXdME2lQjfsYvu9NGv5tJ9Pd4skDOV29YdJs+cbXi
	O2z1fSNBdsWxyfFRhEE5w8VxQmOLC/6LDwX0kqMnQBiEdGfvhyhUckpGwazmro=
X-Received: by 2002:a05:600c:6089:b0:49e:6c27:d093 with SMTP id 5b1f17b1804b1-4a02757a74dmr149635695e9.15.1791190352187;
        Mon, 05 Oct 2026 01:52:32 -0700 (PDT)
Message-ID: <abf320fd-daa0-4057-a6c4-b56c4e336ee6@suse.com>
Date: Mon, 5 Oct 2026 10:52:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] xen/arm, xen/common: Add Kconfig option to control
 Dom0 boot
To: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Julien Grall <julien@xen.org>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Teddy Astie <teddy.astie@vates.tech>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <41d073a1c07e10f0d86da4a31e7a91b7ffadd8d3.1790947567.git.oleksii_moisieiev@epam.com>
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
In-Reply-To: <41d073a1c07e10f0d86da4a31e7a91b7ffadd8d3.1790947567.git.oleksii_moisieiev@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ef75cf/1791190357-A78D1AE4-C4E9903D/10/78276251493
X-purgate-type: spam
X-purgate-size: 5201

On 02.10.2026 15:26, Oleksii Moisieiev wrote:
> This commit introduces a new Kconfig option, `CONFIG_DOM0_BOOT`, to
> allow for building Xen without support for booting a regular domain (Dom0).
> This functionality is primarily intended for the ARM architecture.

I (still) wonder why this would be, but well ...

> A new Kconfig symbol, `HAS_DOM0`, has been added and is selected by
> default for ARM and X86 architecture. This symbol signifies that an
> architecture has the capability to support a Dom0.

Oleksii - what's your take towards RISC-V here? Should it select the new
symbol right away as well?

> The `DOM0_BOOT` option depends on `HAS_DOM0` and defaults to 'y'. For
> expert users, this option can be disabled (`CONFIG_EXPERT=y` and no
> `CONFIG_DOM0_BOOT` in the config), which will compile out the Dom0
> creation code on ARM. This is useful for embedded or dom0less-only
> scenarios to reduce binary size and complexity.
> 
> The ARM boot path has been updated to panic if it detects a non-dom0less
> configuration while `CONFIG_DOM0_BOOT` is disabled, preventing an invalid
> boot.
> 
> Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
> Acked-by: Jan Beulich <jbeulich@suse.com>

Notwithstanding the ack, a few further comments.

> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -43,8 +43,10 @@
>  #include <asm/grant_table.h>
>  #include <xen/serial.h>
>  
> +#ifdef CONFIG_DOM0_BOOT
>  static unsigned int __initdata opt_dom0_max_vcpus;
>  integer_param("dom0_max_vcpus", opt_dom0_max_vcpus);
> +#endif
>  
>  /*
>   * If true, the extended regions support is enabled for dom0 and
> @@ -123,6 +125,7 @@ paddr_t __init hwdom_get_fdt_alloc_size(void)
>      return ACPI_DOM0_FDT_MIN_SIZE;
>  }
>  
> +#ifdef CONFIG_DOM0_BOOT
>  unsigned int __init dom0_max_vcpus(void)
>  {
>      if ( opt_dom0_max_vcpus == 0 )
> @@ -135,6 +138,7 @@ unsigned int __init dom0_max_vcpus(void)
>  
>      return opt_dom0_max_vcpus;
>  }
> +#endif
>  
>  /*
>   * Insert the given pages into a memory bank, banks are ordered by address.
> @@ -1862,6 +1866,7 @@ int __init construct_domain(struct domain *d, struct kernel_info *kinfo)
>      return 0;
>  }
>  
> +#ifdef CONFIG_DOM0_BOOT
>  static int __init construct_dom0(struct domain *d)
>  {
>      struct kernel_info kinfo = KERNEL_INFO_INIT;
> @@ -1893,6 +1898,7 @@ static int __init construct_dom0(struct domain *d)
>  
>      return construct_hwdom(&kinfo, NULL);
>  }
> +#endif
>  
>  int __init construct_hwdom(struct kernel_info *kinfo,
>                             const struct dt_device_node *node)
> @@ -1944,6 +1950,7 @@ int __init construct_hwdom(struct kernel_info *kinfo,
>      return construct_domain(d, kinfo);
>  }
>  
> +#ifdef CONFIG_DOM0_BOOT
>  void __init create_dom0(void)
>  {
>      struct domain *dom0;
> @@ -2001,6 +2008,7 @@ void __init create_dom0(void)
>  
>      set_xs_domain(dom0);
>  }
> +#endif /* CONFIG_DOM0_BOOT */

It's not really a lot of code which is being removed, which may suggest this
is getting too fine-grained. (Primarily, for now) Arm maintainers will need
to judge.

I further wonder how much unreachable code is newly introduced by this, when
the new option is enabled. set_xs_domain() (visible in patch context above)
is possibly only the first example.

> --- a/xen/arch/arm/setup.c
> +++ b/xen/arch/arm/setup.c
> @@ -491,11 +491,18 @@ void asmlinkage __init noreturn start_xen(unsigned long fdt_paddr)
>  
>      do_init_boottests();
>  
> -    /* Create initial domain 0. */
> -    if ( !is_dom0less_mode() )
> +    if ( IS_ENABLED(CONFIG_DOM0_BOOT) && !is_dom0less_mode() )
> +    {
> +        /* Create initial domain 0. */
>          create_dom0();
> +    }
>      else
> -        printk(XENLOG_INFO "Xen dom0less mode detected\n");
> +    {
> +        if ( is_dom0less_mode())
> +            printk(XENLOG_INFO "Xen dom0less mode detected\n");
> +        else
> +            panic("Neither dom0 nor dom0less mode was detected, aborting\n");
> +    }

If I was maintainer of this code, I would ask for the figure braces to be
omitted - the inner if() can easily be "else if".

> --- a/xen/common/Kconfig
> +++ b/xen/common/Kconfig
> @@ -26,6 +26,15 @@ config DOM0LESS_BOOT
>  	  Xen boot without the need of a control domain (Dom0), which could be
>  	  present anyway.
>  
> +config DOM0_BOOT
> +	bool "Dom0 boot support" if EXPERT && !X86

Like already indicated in reply to v3 I'm irritated by this: What use is
the select of HAS_DOM0 on x86 when then you exclude x86 here? I think it
needs to be clarified whether, as the commit message says, this is going
to be Arm-only or of broader use. In the latter case the !X86 here would
want leaving out; the description then would want to clarify that making
x86 respect the option is a TODO item (possibly part of the hyperlaunch
effort).

In the former case more questions arise, like why this wants to be a
common option in the first place. (But since from an abstract pov this is
a common choice, this case likely doesn't want pursuing anyway.)

Jan

