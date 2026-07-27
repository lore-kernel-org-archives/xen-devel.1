Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF3F6C531D0
	for <xen-devel@archiver.kernel.org>; Mon, 27 Jul 2026 12:57:46 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1371684.1619163 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1woKtV-0002sU-41; Mon, 27 Jul 2026 12:57:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1371684.1619163; Mon, 27 Jul 2026 12:57:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1woKtV-0002sN-0U; Mon, 27 Jul 2026 12:57:21 +0000
Received: by outflank-mailman (input) for mailman id 1371684;
 Mon, 27 Jul 2026 12:57:20 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1woKtT-0002sG-UP
 for xen-devel@lists.xenproject.org; Mon, 27 Jul 2026 12:57:20 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1woKtS-00BCp6-UG
 for xen-devel@lists.xenproject.org; Mon, 27 Jul 2026 14:57:18 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a6755ab-bab6-0a2a0a5309dd-0a2a4507b3b0-10
 for <xen-devel@lists.xenproject.org>; Mon, 27 Jul 2026 14:57:18 +0200
Received: from [209.85.221.54] (helo=mail-wr1-f54.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a6755ae-b4ea-0a2a45070019-d155dd36c8ea-3
 for <xen-devel@lists.xenproject.org>; Mon, 27 Jul 2026 14:57:18 +0200
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-47f9ab7ee38so1261410f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 27 Jul 2026 05:57:18 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47f85c63bd3sm48627561f8f.27.2026.07.27.05.57.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Jul 2026 05:57:17 -0700 (PDT)
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
        d=suse.com; s=google; t=1785157038; x=1785761838; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LjvJMdEsL/tmczx/mQuGwvM9Ym3CMVdLSg16r/d1pe4=;
        b=ZIuSOTKnjPATx1nBIcc5CeuPn54+yIfVUMjpPItjza7o4x7jt/xPOuBolZubxWSO73
         KGZIdrbYxF4pGgiMQYJojllTJEnXY13lSbI9bTan9jDYrThyxLB7hSiSCq1+UsViKJHH
         Y2TkLCh+Dky3l7JJmOWUjUybiAYLfozuDOcsfur3w5fxT1n4FihnRnEaA2UDBdyMIYPk
         Jd+U/NkuAraUjCTzLFtHuPhlMqaIbs+9+Amkia085vk0fmKkBWj88IlxwRaJyQl7pRQ1
         sUnOL6vmQcznIy8R3RSwik1HjFSEkGnWbFK0qAAY7A5dZg9i8wS0eXR+EeRrICC8uUdK
         wohg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785157038; x=1785761838;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LjvJMdEsL/tmczx/mQuGwvM9Ym3CMVdLSg16r/d1pe4=;
        b=fAHTpNRwOELPrYnDyv6khY3FbpvGSGnF0JbBKqr5bG8FI5TSUQEbsW5Nwd61lLeZS3
         3aPQZtnYAVkYX5A7UXFj8QZITg/vqxF7KdYJGLVOj+WpV7FW6pWFMEw1PJ8PLIi5m3iy
         Uptyy7r7cgcIU2O5tkSgsm+5huX4plMdO8s6twtkHznKutKcGQWLhCj1W2neX3iMiprM
         A9wh93aHE7XuxwU+XgQgszVy2DF2NUvN704nugbaU5gucDSoiWC4dVfdtBgmrx7q2Eso
         EAS2SrQO7C3pdGGPxq6pL/kxj6xR0vSqlOBkkt4OZomKSZLrTkJ/7BGX91NpVfaE3UTy
         m+KQ==
X-Forwarded-Encrypted: i=1; AHgh+RrCwIqcyo8Dwn2CdxOL7+y68lk5R8wV0iQhfQxggQKk20+GNuGjGK3FvdP8d5XOACIV7Fsg7BogbXI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwxH91Blag7d7TRnBI793Ih1oi0jWTqMMdvcp7JJXq4wEAW4Lju
	pT/SZejwR80RCiICy4z/2gZh73KJFoaiIroNTU/YIG7AeCSGDo0YWhaNLnOAJfJzOA==
X-Gm-Gg: AR+sD10GBABG1MCNPRHR0o+Yzai4maNjguJEREQ/i1Vam0BE8KoJLXJkIepGVZT/nSU
	9c85rlmr2OqFYuI4g/+A+ZkB+a/MrCMztEU/OwLeAJmD+7uo0CJUDSb23Pc5Y4pl9E7AoUYHr7J
	NUfy3aUxXHQeG8CTfvMuY2hVXERhOxb2gpKUFQ2fD1eoEQZNzcT5CmMlNIwNU/AazeYKPsDdv37
	jtNZAPZV/hIW676v2ty+dSMBmlsj9ypSrdPgDm6XY+jIGqJwIlXy0NxN6AruayqwoYFkKHckUx5
	8xkFHh3dgw/tumwzH2uff6ro34HveWC85eUiwyj9HDMPlSEdTy2YHDxv53nunhq+5FIUTOvTcy6
	4nEEDUrZ3lKPiNCgDRXxdeb74f0OEIyGP/mYrPfH576wZzxuox3njbOIH05rjsd/fjpqPGtke4P
	ySu3LgLxKNBNUjw+oZlE4BxWdJGRpoEWRA2O7/P3dnItY5Kjfv+XNmhLfgMbAqUT2POw==
X-Received: by 2002:a05:6000:982:b0:47f:7f28:a5e4 with SMTP id ffacd0b85a97d-47f9feb3c43mr9611764f8f.33.1785157038236;
        Mon, 27 Jul 2026 05:57:18 -0700 (PDT)
Message-ID: <7b7eec76-2d9d-4a08-8f63-4b3da321d5fa@suse.com>
Date: Mon, 27 Jul 2026 14:57:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 4/4] xen/acpi: Parse PPTT to initialize CPU topology
To: Hirokazu Takahashi <taka@valinux.co.jp>
Cc: Mykyta_Poturai@epam.com, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
References: <20260726005517.379267-1-taka@valinux.co.jp>
 <20260726005517.379267-5-taka@valinux.co.jp>
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
In-Reply-To: <20260726005517.379267-5-taka@valinux.co.jp>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ef75cf/1785157038-370DDAE4-A23771D9/0/0
X-purgate-type: clean
X-purgate-size: 9034

On 26.07.2026 02:55, Hirokazu Takahashi wrote:
> Parse the ACPI PPTT (Processor Properties Topology Table) to
> initialize the CPU topology.
> 
> For ACPI 6.3 and later, the ACPI_PPTT_ACPI_PROCESSOR_IS_THREAD flag
> is checked to determine the presence of threading. For ACPI 6.2 and
> earlier, CPUs are assumed not to support threading.
> 
> Signed-off-by: Hirokazu Takahashi <taka@valinux.co.jp>
> ---
> Changes in v8:
>   * Relaxed processor node length check to allow
>     proc->header.length >= table_size.
>   * Treated root nodes (nodes with parent == 0) as equivalent to
>     ACPI_PPTT_PHYSICAL_PACKAGE nodes.
>   * Moved INVALID_ACPIID definition to xen/acpi.h to make it available
>     cross-architecture.
>   * Removed ARM-specific references from comments in
>     architecture-agnostic code.
>   * Added explicit parentheses around bitwise operations in logical
>     expressions.
>   * Placed binary logical operators (||, &&) at the end of lines when
>     splitting conditional statements.

This rule, however, ...

> --- a/xen/drivers/acpi/topology.c
> +++ b/xen/drivers/acpi/topology.c
> @@ -4,33 +4,315 @@
>  #include <xen/cpu-topology.h>
>  #include <xen/cpumask.h>
>  #include <xen/init.h>
> +#include <xen/xvmalloc.h>
> +
> +#define ACPI_PPTT_MAX_LEVELS 16
> +
> +static uint32_t __initdata map_cpu_acpiid[NR_CPUS] = {
> +    [0 ... NR_CPUS - 1] = INVALID_ACPIID
> +};
>  
>  /*
> - * TODO: Populate the topology information by scanning the ACPI
> - *       PPTT (Processor Properties Topology Table).
> + * The first argument 'cpu' is the logical CPU ID assigned by Xen,
> + * and the second argument 'acpi_id' the 32-bit ACPI processor ID.
>   */
> -int __init acpi_init_cpu_topology(void)
> +void __init acpi_map_cpu_acpiid(unsigned int cpu, uint32_t acpi_id)
>  {
> -    unsigned int cpu;
> +    map_cpu_acpiid[cpu] = acpi_id;
> +}
> +
> +static unsigned int __init get_logical_id(unsigned int key,
> +                                          unsigned int *map,
> +                                          unsigned int *count)
> +{
> +    unsigned int id;
> +
> +    for ( id = 0; id < *count; id++ )
> +        if ( map[id] == key )
> +            return id;
> +
> +    map[*count] = key;
> +
> +    return (*count)++;
> +}
> +
> +static bool __init verify_subtable(const struct acpi_subtable_header *entry,
> +                                   const struct acpi_table_pptt *pptt)
> +{
> +    unsigned long table_end = (unsigned long)pptt + pptt->header.length;
> +
> +    if ( entry->length < sizeof(*entry) || (entry->length & 3) )
> +    {
> +        printk(XENLOG_ERR "ACPI: PPTT subtable length is invalid\n");
> +        return false;
> +    }
> +
> +    if ( (unsigned long)entry + entry->length > table_end )
> +    {
> +        printk(XENLOG_ERR "ACPI: PPTT subtable extends beyond table end\n");
> +        return false;
> +    }
> +
> +    return true;
> +}
> +
> +static bool __init verify_proc(const struct acpi_pptt_processor *proc)
> +{
> +    unsigned long table_size;
> +
> +    if ( proc->header.length < sizeof(*proc) )
> +    {
> +        printk(XENLOG_ERR "ACPI: PPTT processor node length is too small\n");
> +        return false;
> +    }
>  
>      /*
> -     * Generate temporary cpu topology information for now.
> -     * It assumes that the cpu doesn't have SMT and all CPUs
> -     * belong to the same socket.
> +     * Each private resource is represented by a 32-bit resource ID.
> +     * Ensure the structure length accurately accounts for the trailing array.
>       */
> +    table_size = sizeof(*proc)
> +        + (unsigned long)proc->number_of_priv_resources * sizeof(uint32_t);

... holds for all binary operators, i.e. also the + here. Indentation of the
continuing line would also better be

    table_size = sizeof(*proc) +
                 (unsigned long)proc->number_of_priv_resources * sizeof(uint32_t);

Where I'd then still question the need for the cast: The operation is, afaict,
the same with it dropped, both in ILP32 and LP64 models. With one exception -
there is an overflow potentially getting in the way, but the cast helps with
that only in LP64. Question is whether too large a ->number_of_priv_resources
wouldn't better be rejected uniformly as presumably bogus.

> +
> +    if ( proc->header.length < table_size )
> +    {
> +        printk(XENLOG_ERR "ACPI: PPTT processor node length invalid\n");
> +        return false;
> +    }
> +
> +    return true;
> +}
> +
> +static const struct acpi_pptt_processor *__init find_pptt_node(
> +    const struct acpi_table_pptt *pptt, uint32_t acpi_id)
> +{
> +    const struct acpi_subtable_header *entry;
> +    unsigned long table_end = (unsigned long)pptt + pptt->header.length;
> +    const void *ptr = pptt + 1;
> +
> +    while ( (unsigned long)ptr + sizeof(*entry) <= table_end )
> +    {
> +        entry = ptr;
> +
> +        if ( !verify_subtable(entry, pptt) )
> +            break;
> +
> +        if ( entry->type == ACPI_PPTT_TYPE_PROCESSOR )
> +        {
> +            const struct acpi_pptt_processor *proc;
> +
> +            proc = container_of(entry, const struct acpi_pptt_processor,
> +                                header);

Have this be the initializer of the variable:

            const struct acpi_pptt_processor *proc =
                container_of(entry, const struct acpi_pptt_processor, header);

?

> +            if ( !verify_proc(proc) )
> +                break;
> +
> +            /*
> +             * Leaf node verification is only required for ACPI 6.3
> +             * (PPTT revision 2) or later.
> +             */
> +            if ( (proc->flags & ACPI_PPTT_ACPI_PROCESSOR_ID_VALID) &&
> +                 proc->acpi_processor_id == acpi_id &&
> +                 (pptt->header.revision < 2 ||
> +                  (proc->flags & ACPI_PPTT_ACPI_LEAF_NODE)) )
> +                return proc;
> +        }
> +
> +        ptr += entry->length;
> +    }
> +
> +    return NULL;
> +}
> +
> +/*
> + * Populate the topology information by scanning the ACPI PPTT
> + * (Processor Properties Topology Table).
> + */
> +int __init acpi_init_cpu_topology(void)
> +{
> +    acpi_status status;
> +    struct acpi_table_header *table_header;
> +    const struct acpi_table_pptt *pptt;
> +    unsigned int num_sockets = 0;
> +    unsigned int num_clusters = 0;
> +    unsigned int num_cores = 0;
> +    unsigned int *socket_map = xvzalloc_array(unsigned int, nr_cpu_ids);
> +    unsigned int *cluster_map = xvzalloc_array(unsigned int, nr_cpu_ids);
> +    unsigned int *core_map = xvzalloc_array(unsigned int, nr_cpu_ids);
> +    unsigned int cpu;
> +    int ret = 0;
> +
> +    status = acpi_get_table(ACPI_SIG_PPTT, 0, &table_header);
> +    if ( ACPI_FAILURE(status) )
> +    {
> +        /* A missing PPTT is benign; fall back to the default topology. */
> +        ret = -ENODEV;
> +        goto out;
> +    }
> +
> +    if ( !socket_map || !cluster_map || !core_map )
> +    {
> +        printk(XENLOG_ERR
> +               "ACPI: Failed to allocate memory for topology parsing\n");
> +        ret = -ENOMEM;
> +        goto out;
> +    }
> +
> +    pptt = container_of(table_header, const struct acpi_table_pptt, header);
> +
> +    for_each_possible_cpu(cpu)
> +    {
> +        uint32_t acpi_id = map_cpu_acpiid[cpu];

You may end up reading INVALID_ACPIID here. Then ...

> +        struct cpu_topology *topo = &cpu_topology[cpu];
> +        const struct acpi_pptt_processor *proc;
> +        unsigned int level;
> +        unsigned int core_group_key = 0;
> +        unsigned int cluster_group_key = 0;
> +        unsigned int socket_group_key = 0;
> +        bool threading = false;
> +
> +        proc = find_pptt_node(pptt, acpi_id);

... a bogus table entry with that ID would be found here, potentially for
multiple values of "cpu".

> +        if ( !proc )
> +        {
> +            printk(XENLOG_WARNING
> +                   "ACPI: No PPTT leaf node for CPU %u (ACPI ID %#x)\n",
> +                   cpu, acpi_id);
> +            ret = -ENOENT;
> +            goto out;
> +        }
> +
> +        /*
> +         * Limit the maximum loop depth to prevent an infinite loop in case
> +         * the PPTT is corrupted or contains cyclic references.
> +         */
> +        for ( level = 0; level < ACPI_PPTT_MAX_LEVELS; level++ )
> +        {
> +            const unsigned int offset = (const void *)proc - (const void *)pptt;
> +
> +            /*
> +             * If this proc has no parent node, it is the root node. Treat it
> +             * as equivalent to an ACPI_PPTT_PHYSICAL_PACKAGE node.
> +             */
> +            if ( proc->flags & ACPI_PPTT_PHYSICAL_PACKAGE || !proc->parent )

You say in the revlog that you added parentheses, but at least here you
didn't.

Jan

