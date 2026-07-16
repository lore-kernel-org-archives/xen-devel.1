Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A26FC44511
	for <xen-devel@archiver.kernel.org>; Thu, 16 Jul 2026 15:09:25 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1364235.1615548 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wkNhx-0007xF-Je; Thu, 16 Jul 2026 15:09:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1364235.1615548; Thu, 16 Jul 2026 15:09:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wkNhx-0007x8-GD; Thu, 16 Jul 2026 15:09:05 +0000
Received: by outflank-mailman (input) for mailman id 1364235;
 Thu, 16 Jul 2026 15:09:04 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wkNhw-0007wj-H1
 for xen-devel@lists.xenproject.org; Thu, 16 Jul 2026 15:09:04 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wkNhv-006GOF-Tw
 for xen-devel@lists.xenproject.org; Thu, 16 Jul 2026 17:09:03 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a58f40f-5cb7-0a2a0a5109dd-0a2a4507d91c-2
 for <xen-devel@lists.xenproject.org>; Thu, 16 Jul 2026 17:09:03 +0200
Received: from [209.85.221.50] (helo=mail-wr1-f50.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a58f40f-b4ea-0a2a45070019-d155dd32e543-3
 for <xen-devel@lists.xenproject.org>; Thu, 16 Jul 2026 17:09:03 +0200
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-4759b4f0897so1962610f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 16 Jul 2026 08:09:03 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47f464c9cc3sm25924071f8f.35.2026.07.16.08.08.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Jul 2026 08:08:54 -0700 (PDT)
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
        d=suse.com; s=google; t=1784214543; x=1784819343; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Cx70gH2MgKHZwRLflvs3GO6NJjep4WZnLq4N2n2/ogw=;
        b=AxbNnR6W4W/+/CCkuJIpn3IoQbfxn+jpLwo8y8BeXCZVY1qF8bAjJouY7G4B61FfoM
         LL3/o8Up2+tv43eYAAHlKycVfQxwv4o991T0OsR2Xq43owXvTrF3odtdgNWRrrBfUZrZ
         R9b2j59zti0qg/DMD9MYteoMyDSoRoaTeUhVkbLv2ruH1Vrp/F2uqytA9yVHhyCec0Rg
         a25V+XxkGwHNKUuadt4D6MkLWvo6pax+ULWI7BiScf4VxqlTDoeLxngizHmst4kniQlj
         zB4LX6Ykktq7Ffe1C6QvpKrxZTFtR50ZQg1xswvo1A7ayqAl5MN1yo4B7CwTmKx4NsQb
         g13g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784214543; x=1784819343;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Cx70gH2MgKHZwRLflvs3GO6NJjep4WZnLq4N2n2/ogw=;
        b=DRfuOBVuEqPYlxckAPNSNcLRLMk4E3/9xQpNJMJ34pJ6BDBQcdEfrCjYQGYTJ5s5wo
         bF/ficIcSPtS+/f6KgijmMSOWBSXLQgUB39s2hRCI3xMwT0tXHWF00AsdFehYela8mhq
         qXQg6q6x/Fbk1m8EQ6kQw+eyQZLSOc90PXPthQRglFQICogggJ3XaK6vAeSy/4dl6x7Y
         yIpvVVeV/PJJ45/QczXLdnB7d6Q28rQK0Ph6j4FIeuikplHL5h26YN8QPsjX1OzTP787
         JLm0BBqz6PCcZgNUqE4U8M9yUjyAI/GF9wZXFRZrNuQUNo2qVagX4CooSg0Ao2QteIvo
         BJZw==
X-Forwarded-Encrypted: i=1; AHgh+RosL6Kofr32KPOKbEOoWt6L8/5torMV61ZZ3yRXrwTN0f46I71HhUq+M3oW+kGGNQpirZ6Y/ubuLE8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxnmW40hjrpII99om6X/9OTrWEPybXg4DwZJCFP3RIn6lHRMC27
	8VdCX8jUi4VZukyJqBqDaysAeoZDo9dmS6ZApuILzp8Wo2bhE4s6IkD10JGKyD49Fw==
X-Gm-Gg: AfdE7cnIw+nOUw3fw9m5M+ZRNeAvN8XeP4UUWHXfszYyS/jnlFYUKXQtQHmBAx5Im+A
	GbBbvJwYgjRyNP/X8wcZo/+YG8+yEoI+9ZspGLL+gAc1D+nsjJk2c5AAt1+VjmVytpuBvFBj0it
	OnZo0oIHkWDMIrvXMJccrB6ki8s7OZtGhLwuGj+ExfNZC3o2s2kON0rhbJOI2d6nsaHRXJU6U8A
	Tve3U5pJEag5YsLgAgcDbLTbEt0bvmYdLmG8p/n2ATBEO5SGTQ8SnjpeM5CNzSJ++Ir81MYydxW
	9ct7HSBAGU8k8oCM1r89J+mHcJnZZghlcJAN/IQWvlcMIq6z18mnf5pGlzyNlXwLzh3Vn6RrV4w
	NMQCzw4Fv3KBpJWI3IgoIimuS857jqnExuVMCyA+7YuBZ1ZMLcxf2R3OvVXR2VYubMDpG6WbWrY
	a1y/Sb98QPYb47/KhHfogXxl8bWbK9DX5sbhusdmKnrEVpYg50w3EyrS+fCKP6yEd2HQ==
X-Received: by 2002:a5d:5f88:0:b0:475:f0f0:9ec5 with SMTP id ffacd0b85a97d-47f2dce39f8mr25370851f8f.48.1784214542554;
        Thu, 16 Jul 2026 08:09:02 -0700 (PDT)
Message-ID: <df837a87-7cab-4da6-94e1-cf017960209e@suse.com>
Date: Thu, 16 Jul 2026 17:08:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 5/5] xen/acpi: Parse PPTT to initialize CPU topology
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
 <20260714104445.919830-6-taka@valinux.co.jp>
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
In-Reply-To: <20260714104445.919830-6-taka@valinux.co.jp>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ef75cf/1784214543-A66DAAE4-D0F92E4F/0/0
X-purgate-type: clean
X-purgate-size: 9733

On 14.07.2026 12:44, Hirokazu Takahashi wrote:
> --- a/xen/drivers/acpi/topology.c
> +++ b/xen/drivers/acpi/topology.c
> @@ -5,32 +5,257 @@
>  #include <xen/cpumask.h>
>  #include <xen/init.h>
>  
> +#define ACPI_PPTT_MAX_LEVELS 16
> +
> +static uint32_t __initdata map_cpu_acpiid[NR_CPUS] = {
> +    [0 ... NR_CPUS - 1] = INVALID_ACPIID
> +};
> +
> +/*
> + * The first argument `cpu` is the logical CPU ID assigned by Xen,
> + * and the second argument `acpi_id` is passed the `uid` field from
> + * the ACPI MADT Generic Interrupt subtable.
> + */
> +void __init acpi_map_cpu_acpiid(unsigned int cpu, uint32_t acpi_id)
> +{
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
> +static const struct acpi_pptt_processor *__init find_pptt_node(
> +    const struct acpi_table_pptt *pptt, uint32_t acpi_id)
> +{
> +    const struct acpi_subtable_header *entry;
> +    unsigned long table_end;
> +    const void *ptr;
> +
> +    BUG_ON(!pptt);

This being a static helper, I don't see a need for such a check.

> +    table_end = (unsigned long)pptt + pptt->header.length;
> +
> +    ptr = pptt + 1;
> +
> +    while ( (unsigned long)ptr + sizeof(struct acpi_subtable_header)

Please prefer sizeof(<expression>) over sizeof(<type>) whenever there's a
connection to an expression in use (e.g. sizeof(*entry) here).

> +            <= table_end )
> +    {
> +        entry = ptr;
> +
> +        if ( entry->length == 0 )
> +        {
> +            printk(XENLOG_ERR
> +                   "ACPI: PPTT has an invalid zero-length subtable.\n");
> +            break;
> +        }
> +
> +        if ( (unsigned long)ptr + entry->length > table_end )
> +        {
> +            printk(XENLOG_ERR
> +                   "ACPI: PPTT subtable extends beyond table end.\n");
> +            break;
> +        }
> +
> +        if ( entry->type == ACPI_PPTT_TYPE_PROCESSOR &&
> +             entry->length >= sizeof(struct acpi_pptt_processor) )
> +        {
> +            const struct acpi_pptt_processor *proc =
> +                container_of(entry, const struct acpi_pptt_processor, header);
> +
> +            if ( (proc->flags & ACPI_PPTT_ACPI_PROCESSOR_ID_VALID) &&
> +                 proc->acpi_processor_id == acpi_id )
> +                return proc;
> +        }
> +
> +        ptr += entry->length;
> +    }
> +
> +    return NULL;
> +}
> +
>  /*
> - * TODO: Populate the topology information by scanning the ACPI
> - *       PPTT (Processor Properties Topology Table).
> + * Populate the topology information by scanning the ACPI PPTT
> + * (Processor Properties Topology Table).
>   */
>  int __init acpi_init_cpu_topology(void)
>  {
> +    acpi_status status;
> +    struct acpi_table_header *table_header;
> +    const struct acpi_table_pptt *pptt;
> +    unsigned int num_sockets = 0;
> +    unsigned int num_clusters = 0;
> +    unsigned int num_cores = 0;
> +    unsigned int *socket_map = xmalloc_array(unsigned int, nr_cpu_ids);
> +    unsigned int *cluster_map = xmalloc_array(unsigned int, nr_cpu_ids);
> +    unsigned int *core_map = xmalloc_array(unsigned int, nr_cpu_ids);
>      unsigned int cpu;
> +    int ret = 0;
> +
> +    if ( !socket_map || !cluster_map || !core_map )
> +    {
> +        printk(XENLOG_ERR
> +               "ACPI: Failed to allocate memory for topology parsing.\n");
> +        ret = -ENOMEM;
> +        goto out;
> +    }
> +
> +    status = acpi_get_table(ACPI_SIG_PPTT, 0, &table_header);
> +    if ( ACPI_FAILURE(status) )
> +    {
> +        printk(XENLOG_WARNING
> +               "ACPI: PPTT table not found. Topology fallback will be used.\n");
> +        ret = -ENODEV;
> +        goto out;
> +    }
> +
> +    pptt = container_of(table_header, const struct acpi_table_pptt, header);
>  
> -    /*
> -     * Generate temporary cpu topology information for now.
> -     * It assumes that the cpu doesn't have SMT and all CPUs
> -     * belong to the same socket.
> -     */
>      for_each_possible_cpu(cpu)
>      {
> +        uint32_t acpi_id = map_cpu_acpiid[cpu];
>          struct cpu_topology *topo = &cpu_topology[cpu];
> +        const struct acpi_pptt_processor *proc;
> +        unsigned int level;
> +        unsigned int core_group_key = 0;
> +        unsigned int cluster_group_key = 0;
> +        unsigned int socket_group_key = 0;
> +        bool threading = false;
> +
> +        proc = find_pptt_node(pptt, acpi_id);
> +        if ( !proc )
> +        {
> +            printk(XENLOG_WARNING
> +                   "ACPI: No PPTT leaf node for CPU %u (ACPI ID 0x%u)\n",
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
> +            if ( proc->flags & ACPI_PPTT_PHYSICAL_PACKAGE )
> +            {
> +                socket_group_key = offset;
> +
> +                /*
> +                 * If cluster/core info is absent upon reaching the physical
> +                 * package, assume one cluster per socket and one core per
> +                 * cluster.
> +                 */
> +                if ( cluster_group_key == 0 )
> +                    cluster_group_key = socket_group_key;
> +
> +                if ( core_group_key == 0 )
> +                    core_group_key = cluster_group_key;
> +
> +                break;
> +            }
> +            else if ( level == 0 )
> +            {
> +                /*
> +                 * ACPI_PPTT_PROCESSOR_IS_THREAD is supported in PPTT
> +                 * revision 2 and later. Assume no threading support when
> +                 * PPTT revision is 1.
> +                 */
> +                if ( proc->flags & ACPI_PPTT_ACPI_PROCESSOR_IS_THREAD )
> +                    threading = true;
> +                else
> +                    core_group_key = offset;
> +            }
> +            else if ( level == 1 )
> +            {
> +                if ( threading )
> +                    core_group_key = offset;
> +                else
> +                    cluster_group_key = offset;

Mich like you're omitting braces here, you can also ...

> +            }
> +            else if ( level == 2 && threading )
> +            {
> +                cluster_group_key = offset;
> +            }

... omit them here.

> +            if ( !proc->parent )
> +                break;
>  
> -        topo->phys_core_id = cpu;
> -        topo->num_siblings = 1;
> +            proc = (const struct acpi_pptt_processor *)
> +                   ((const void *)pptt + proc->parent);

No need for the outer cast?

And then - how do you know proc->parent points inside the table?

> +        }
>  
> -        cpumask_set_cpu(cpu, topo->thread_sibling);
> -        cpumask_copy(topo->core_sibling, &cpu_possible_map);
> -        cpumask_copy(topo->cluster_sibling, &cpu_possible_map);
> +        if ( socket_group_key == 0 )
> +        {
> +            printk(XENLOG_WARNING
> +                   "ACPI: Could not reach the physical package node for CPU %u (ACPI ID 0x%u)\n",
> +                   cpu, acpi_id);
> +            ret = -ENOENT;
> +            goto out;
> +        }
> +
> +        topo->phys_socket_id =
> +            get_logical_id(socket_group_key, socket_map, &num_sockets);
> +        topo->phys_cluster_id =
> +            get_logical_id(cluster_group_key, cluster_map, &num_clusters);
> +        topo->phys_core_id =
> +            get_logical_id(core_group_key, core_map, &num_cores);
>      }
>  
> -    return 0;
> +    for_each_possible_cpu(cpu)
> +    {
> +        struct cpu_topology *topo = &cpu_topology[cpu];
> +        unsigned int tcpu;
> +
> +        for_each_possible_cpu(tcpu)
> +        {
> +            struct cpu_topology *ttopo = &cpu_topology[tcpu];
> +
> +            if ( cpu > tcpu )
> +                continue;
> +
> +            if ( topo->phys_core_id == ttopo->phys_core_id )
> +            {
> +                cpumask_set_cpu(tcpu, topo->thread_sibling);
> +                cpumask_set_cpu(cpu, ttopo->thread_sibling);
> +            }
> +
> +            if ( topo->phys_cluster_id == ttopo->phys_cluster_id )
> +            {
> +                cpumask_set_cpu(tcpu, topo->cluster_sibling);
> +                cpumask_set_cpu(cpu, ttopo->cluster_sibling);
> +            }
> +
> +            if ( topo->phys_socket_id == ttopo->phys_socket_id )
> +            {
> +                cpumask_set_cpu(tcpu, topo->core_sibling);
> +                cpumask_set_cpu(cpu, ttopo->core_sibling);
> +            }
> +        }
> +
> +        topo->num_siblings = cpumask_weight(topo->thread_sibling);
> +    }
> +
> +out:

Nit: Labels indented by at least one blank please. See ./CODING_STYLE.

Other comments (of the more general kind) given on earlier patches may also
apply here.

Jan

