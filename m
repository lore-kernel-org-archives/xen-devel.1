Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8895CC44501
	for <xen-devel@archiver.kernel.org>; Thu, 16 Jul 2026 13:11:51 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1364010.1615395 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wkLs8-00021e-NF; Thu, 16 Jul 2026 13:11:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1364010.1615395; Thu, 16 Jul 2026 13:11:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wkLs8-00021X-KX; Thu, 16 Jul 2026 13:11:28 +0000
Received: by outflank-mailman (input) for mailman id 1364010;
 Thu, 16 Jul 2026 13:11:27 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wkLs7-00021R-MS
 for xen-devel@lists.xenproject.org; Thu, 16 Jul 2026 13:11:27 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wkLs7-006OY9-37
 for xen-devel@lists.xenproject.org; Thu, 16 Jul 2026 15:11:27 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a58d874-5cb7-0a2a0a5109dd-0a2a450abdb4-28
 for <xen-devel@lists.xenproject.org>; Thu, 16 Jul 2026 15:11:27 +0200
Received: from [209.85.128.51] (helo=mail-wm1-f51.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a58d87e-f2d2-0a2a450a0019-d1558033b09d-3
 for <xen-devel@lists.xenproject.org>; Thu, 16 Jul 2026 15:11:26 +0200
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-493b1710405so36550145e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 16 Jul 2026 06:11:26 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49543e3afc2sm29591345e9.0.2026.07.16.06.11.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Jul 2026 06:11:25 -0700 (PDT)
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
        d=suse.com; s=google; t=1784207486; x=1784812286; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zSaROcgkG6cj0208m9y/ywOsRXnd7IcrIZPbCgAXH30=;
        b=FAnuHCwibFykkalDdXz/lQMf6muNisWfl0u+XFPOnDd8JqyhDN2/3wEF82xHcAIVXx
         grLhqQCmtKA03OZojJIJC6ztgy+q0Jcb0hgFEFBgyeu80ONHsUUU4/SogqJ7yzEfa/B7
         NUlCZHaxGaGnJREnwm87kcpshOMrABudcYThA0C1oJcr+93DlBh96R2ovhsA3CZ+ZAZA
         z6SRsYbMj941ofAmRm/+B4xZcnv79N1bYSiQR/yFWJOo0XDD4E7makf1N7lo5Ghil0fG
         QG3tq0SWE0r3cE4dUUa/4Fs9SzALIUwPp5a0B2HDzGixA8HZ1t9Gc2cEKW2xLu8ajMIj
         L8wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784207486; x=1784812286;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zSaROcgkG6cj0208m9y/ywOsRXnd7IcrIZPbCgAXH30=;
        b=XPtGCJtVcx0SIRagurDX3Yoc9nA6+Sf7tskdbi0kOyLVkE6HdUpMGHn9HJmg+UTy17
         hKlZFRh1s80klHUNf1/cs1SYK1n6JSTtcolONd58oOKFlrRfaHcVDEAG6/rRYCvolgJO
         +kpiYubI181D+OmVp6inGauezB9PUb+rElZz/2o75VGtb9hAt/tIRAKTSTX0jUQS/+44
         0v2njMMpSaO15dlWhWza3jBVoUR9ceSiciBtZ9n+hxmmuf8Kz3aB3sio1m4BAVnh5bF9
         bLNBTGOGrlw0Aq2Mf7M6lUWZHInbAt25MHN/OAEOzAFoAwfT0RTgfhPO0ubHJ4rFO1gl
         FGCA==
X-Forwarded-Encrypted: i=1; AHgh+Rp4IY5Tc5hzYcjYkTlhsX0DCVJQIUDMg6ZmDbfjjY5AfJcew9VmL+X9C0rqC4Hlk7tvNMkbXZ5fRv8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxXhFxv8eAdNbUz1KiqdsmQMzp48BeHVu3uFOEGV178CfdF7uxv
	piiiKWOH4IOC03LQbF9UYypArKQoCYHXvSTiNkQX57mfirhpMqLWUAOgZMSQHtmQ6w==
X-Gm-Gg: AfdE7cnx0osAgt8rwkJKjv9lBtsxKYaFPw5b2IkgwC6xq2RYcHsEmtGsxBRANPrK1GG
	iH+pk72R8QsVgm6i0cDe071lmlyUl/EAk7N2G47SbmSTHaV1sVopGgGUzPcpZTtdtjOhSSz3Dgd
	3Esf70JeZ4NNXYpUbNMe6xXgYBApfOk8AbGE2Ln+I3Q5mhBI7wBjqHWCh5x5gLFRUvP27WPTkVw
	jZJZ9g9Wx/iFe4b7veYP9Tqv9Sk2F6V5gmgnCBgRtL6A0tHSVr3+taymimGRaLsrllpO4RW7PK2
	fvpb23u5guxPJZeYxvoB+7NruZOSuaBcZeSD/URUDWdd7I1ZAl9XmbgMYkL3SjolSkeeqRucofW
	FArYtzMJOOEk9FUCJDJ5AJlHCLs2SwFWSWlKrtFeaxbKbpetM+zOJ59fZEBb9/UJXBdqMTb2AEk
	4cRUWtJuyWPn8q9BE/26Vz3rvI2Bn7ZlGgNkD2dVU2onusp1kloV/9o5A9fekjvGtfgw==
X-Received: by 2002:a05:600c:1d9a:b0:493:c535:3934 with SMTP id 5b1f17b1804b1-495384a43aemr134954275e9.36.1784207486092;
        Thu, 16 Jul 2026 06:11:26 -0700 (PDT)
Message-ID: <e7eeeebc-5829-47db-96d0-2f804dcd4356@suse.com>
Date: Thu, 16 Jul 2026 15:11:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/5] xen/device-tree: Parse 'cpu-map' node for CPU
 topology exploration
To: Hirokazu Takahashi <taka@valinux.co.jp>
Cc: Mykyta_Poturai@epam.com, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20260714104445.919830-1-taka@valinux.co.jp>
 <20260714104445.919830-2-taka@valinux.co.jp>
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
In-Reply-To: <20260714104445.919830-2-taka@valinux.co.jp>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-4011c0/1784207486-583CCCFC-63136C51/0/0
X-purgate-type: clean
X-purgate-size: 5233

On 14.07.2026 12:44, Hirokazu Takahashi wrote:
> --- a/xen/common/Kconfig
> +++ b/xen/common/Kconfig
> @@ -140,6 +140,9 @@ config HAS_EX_TABLE
>  config HAS_FAST_MULTIPLY
>  	bool
>  
> +config HAS_GENERIC_CPU_TOPOLOGY
> +	bool

You've got indentation right here and ...

> @@ -191,6 +194,25 @@ config VM_EVENT
>  config NEEDS_LIBELF
>  	bool
>  
> +config GENERIC_CPU_TOPOLOGY
> +	bool

... here. Why not ...

> +config DT_CPU_TOPOLOGY
> +    bool "Device tree based CPU topology support (UNSUPPORTED)" if UNSUPPORTED
> +    depends on HAS_GENERIC_CPU_TOPOLOGY && DEVICE_TREE_PARSE
> +    select GENERIC_CPU_TOPOLOGY
> +    help
> +      Retrieve CPU topology information from the device tree to optimize
> +      virtual CPU scheduling.
> +
> +config ACPI_CPU_TOPOLOGY
> +    bool "ACPI based CPU topology support (UNSUPPORTED)" if UNSUPPORTED
> +    depends on HAS_GENERIC_CPU_TOPOLOGY && ACPI
> +    select GENERIC_CPU_TOPOLOGY
> +    help
> +      Retrieve CPU topology information from the ACPI PPTT to optimize
> +      virtual CPU scheduling.

... throughout here?

I'm also a little puzzled by the "if UNSUPPORTED" on the prompts. Imo that
would better be normal "depends on UNSUPPORTED". The situation is different
in e.g. common/sched/Kconfig, where the default value may be Y (with the
prompt being invisible making it impossible to turn off the option).

Also may I suggest s/virtual CPU/vCPU/ ?

> --- /dev/null
> +++ b/xen/common/cpu-topology.c
> @@ -0,0 +1,65 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +
> +#include <xen/acpi.h>
> +#include <xen/cpu-topology.h>
> +#include <xen/cpumask.h>
> +#include <xen/dt-cpu-topology.h>
> +#include <xen/init.h>
> +
> +static void __init free_topology_table(void)
> +{
> +    unsigned int cpu;
> +
> +    for ( cpu = 0; cpu < nr_cpu_ids; cpu++ )
> +    {
> +        free_cpumask_var(cpu_topology[cpu].thread_sibling);
> +        free_cpumask_var(cpu_topology[cpu].core_sibling);
> +        free_cpumask_var(cpu_topology[cpu].cluster_sibling);
> +    }
> +
> +    XFREE(cpu_topology);

XVFREE(), as it wants to be ...

> +}
> +
> +void __init init_cpu_topology(void)
> +{
> +    unsigned int cpu;
> +    int ret;
> +
> +    cpu_topology = xzalloc_array(struct cpu_topology, nr_cpu_ids);

--- xvzalloc_array() here.

> +    if ( !cpu_topology )
> +    {
> +        printk(XENLOG_ERR "Failed to allocate memory for cpu_topology table\n");

Is this really an error (irrespective of whether this then also needs
logging)? There may not be any topology information to retrieve, in which
case the allocation failure is benign.

> +        return;
> +    }
> +
> +    for ( cpu = 0; cpu < nr_cpu_ids; cpu++ )
> +    {
> +        if ( !zalloc_cpumask_var(&cpu_topology[cpu].thread_sibling) ||
> +             !zalloc_cpumask_var(&cpu_topology[cpu].core_sibling) ||
> +             !zalloc_cpumask_var(&cpu_topology[cpu].cluster_sibling) )
> +        {
> +            free_topology_table();
> +            printk(XENLOG_ERR "Failed to allocate memory for cpu_topology table\n");

Same here then obviously. Also please respect line length constraints. Don't
split format strings, but splitting XENLOG_* off the string literal is fine.

> --- a/xen/common/cpu.c
> +++ b/xen/common/cpu.c
> @@ -46,6 +46,11 @@ const unsigned long cpu_bit_bitmap[BITS_PER_LONG+1][BITS_TO_LONGS(NR_CPUS)] = {
>  #undef MASK_DECLARE_2
>  #undef MASK_DECLARE_1
>  
> +#ifdef CONFIG_GENERIC_CPU_TOPOLOGY
> +struct cpu_topology;

Why would this be needed?

> +struct cpu_topology *__ro_after_init cpu_topology;

This includes the same effect.

> --- /dev/null
> +++ b/xen/common/device-tree/cpu-topology.c
> @@ -0,0 +1,343 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/*
> + * Derived from Linux kernel 7.0's $drivers/base/arch_topology.c
> + * Parse cpu topology information.
> + */
> +
> +#include <xen/acpi.h>
> +#include <xen/cpu-topology.h>
> +#include <xen/cpumask.h>
> +#include <xen/device_tree.h>
> +#include <xen/errno.h>
> +#include <xen/init.h>
> +
> +#define INVALID_TOPO_ID (~0U)
> +
> +struct cpu_map {
> +    unsigned int thread_id;
> +    unsigned int core_id;
> +    unsigned int cluster_id;
> +    unsigned int package_id;
> +};
> +
> +static struct cpu_map __initdata cpu_map[NR_CPUS] = {
> +    [0 ... NR_CPUS - 1] = {INVALID_TOPO_ID, INVALID_TOPO_ID,
> +                           INVALID_TOPO_ID, INVALID_TOPO_ID}

I think it would be nice if this properly used designated initializers
throughout. A trailing comma (twice) would also be nice.

> +static struct dt_device_node *__init dt_find_child_node_by_name(
> +    const struct dt_device_node *dt,
> +    const char *name)
> +{
> +    struct dt_device_node *np;

Is there a reason this cannot be pointer-to-const?

> --- a/xen/drivers/acpi/Makefile
> +++ b/xen/drivers/acpi/Makefile
> @@ -10,3 +10,4 @@ obj-$(CONFIG_PM_OP) += pm-op.o
>  
>  obj-$(CONFIG_X86) += hwregs.o
>  obj-$(CONFIG_X86) += reboot.o
> +obj-$(CONFIG_ACPI_CPU_TOPOLOGY) += topology.init.o

As before, I'd prefer if this was appended to the earlier group of objects.

Jan

