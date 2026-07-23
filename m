Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AA2AC531F7
	for <xen-devel@archiver.kernel.org>; Thu, 23 Jul 2026 14:36:47 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1369255.1618110 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wmuXF-00055G-9w; Thu, 23 Jul 2026 14:36:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1369255.1618110; Thu, 23 Jul 2026 14:36:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wmuXF-000559-7F; Thu, 23 Jul 2026 14:36:29 +0000
Received: by outflank-mailman (input) for mailman id 1369255;
 Thu, 23 Jul 2026 14:36:28 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wmuXD-000551-SG
 for xen-devel@lists.xenproject.org; Thu, 23 Jul 2026 14:36:27 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wmuXD-0049y0-8r
 for xen-devel@lists.xenproject.org; Thu, 23 Jul 2026 16:36:27 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a6226df-2eae-0a2a0a5409dd-0a2a450a8906-40
 for <xen-devel@lists.xenproject.org>; Thu, 23 Jul 2026 16:36:27 +0200
Received: from [209.85.221.46] (helo=mail-wr1-f46.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a6226eb-f2d2-0a2a450a0019-d155dd2ed4cb-3
 for <xen-devel@lists.xenproject.org>; Thu, 23 Jul 2026 16:36:27 +0200
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-47f93b2fe4cso266593f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 23 Jul 2026 07:36:27 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-495653c9d99sm228385865e9.12.2026.07.23.07.36.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Jul 2026 07:36:25 -0700 (PDT)
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
        d=suse.com; s=google; t=1784817387; x=1785422187; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nER6+fszNpRb0dqePPmSfFaJqau7v8SSgi5J5pliadE=;
        b=WwEeXd+tM0bDdMLC2aIgMMfs5eOagfw9rKLbhFJH4UHHadTb/op40V1uKVKGcmAg3l
         QRJUe6qfGYYTrOc5VF5McFhZnOzyfTh8h+67PVQ36NGtts0/mFU+feaqo4BeKlpiy1gq
         zTLDNQ7vXylDBzzt8OBu7mz+siX0eCbDwDGJc+3aZn7rbxCjABVt5MSHWCan7k5pXoEh
         +E39UU1t3YwyrQWDxZLaPPaPVloTZMGkektgjjs3JPVXDevn34SNYOC7mAk58fQMMXbS
         FhrRYJ7w8fqF9Eg4fLM/FtES/d2yo4RNVzKNiiTkHZahf1mHLku3CAQDNza0rJfbOHq3
         irfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784817387; x=1785422187;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nER6+fszNpRb0dqePPmSfFaJqau7v8SSgi5J5pliadE=;
        b=EB+FkK1tRbeOik8sKmeFmC6vniP3mDuoG2pviTfSQ0Oq63IpX2y2S8YsqS0OqBxhSV
         a91AIYdLT+O20WEQxDqDp0sPaZZPebovRLlqXiVI2Ikpvrxx6MDsMI3I5gj3ppsRr5x4
         FbX8QPS3aAtP6TdJygpVYRArAJPN/4B4aj10UplrkL4mdMBktgMHQSEZrX5q8o4DW6jh
         FyK5ATK66dWYH3FldChj/xY1iRCZj3sp3ncbFYuqLIAL5QObaJlHR8lSX9ebQD1/qMLY
         X3yi5JbMjzsd019gcTw96vXZryqDNIIo8Z7qW3XjmrhFR0zPHNzVTA+krnrLgripbYsr
         G2lw==
X-Forwarded-Encrypted: i=1; AHgh+RoAo3Dd0sf6DcfYhjr3tVDbRKXb0dWrYIno5bSxqRuSNgrG98fZ4grG0xngBJ/vltMHxtrFY+4AI18=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxVoSuVYbouP4tcJhWWNbpVQyr3wJlPHpItKB76Tj03zeI18ORa
	Ah8cVyT/Ke1AabWKZN/qn4yG1JC/vvaL7cV6pzCjQFJW8QHc0jBMKvxKi/ESNUQkDw==
X-Gm-Gg: AR+sD11aEPjsouRztPHTPdXyGhFY7Pmd1r5punOMHq3PoMEYZbi+AiKSTvNXNHY6Awd
	kxcolmldWkqmObEJ/1eBE0RBBoFATgkyKnrM3j6mKXjx84EPc0aGDM7P4972gXpiMpQyusV/wnG
	XnRJIJmhWwS/4acgUWYQrDxo5USPUIMjbHwnaJMY9AHfBsb7Hav+bynzcoy0BW7bIFC5+ugZ3ki
	xKZP8df7GZwg6CvCAfhhgELWLACLmNaI0BXPKVvYeOS8tdPtd8PtI5ds3a2V1lecQldGScGZiSE
	dOrY6Z1TBgLS0mLSQzi/iLmH8sw7r4SzhOy7Xxu7KdsEbbqoF46fwkAa2iAChEka11HIf6g9jE9
	6yh3j5LZuTZT/Ehh1VqE4Ygut5gJU+ZPw+PRJ1H2Hz/PrvZkH3PsTdUA6+A8sxzqHG+5W70ahQH
	eYYdhXKEnFhXAEyp4EGrYPcM/cLWlpIbCrAZMUqp9QxEs77Omi4x10DkKOVCP4k/iQNA==
X-Received: by 2002:a05:600c:c084:b0:493:fa66:4861 with SMTP id 5b1f17b1804b1-49573cfa044mr32124015e9.25.1784817386595;
        Thu, 23 Jul 2026 07:36:26 -0700 (PDT)
Message-ID: <60128094-5cf5-4fce-89ba-646e9790b27f@suse.com>
Date: Thu, 23 Jul 2026 16:36:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 5/5] xen/acpi: Parse PPTT to initialize CPU topology
To: Hirokazu Takahashi <taka@valinux.co.jp>
Cc: Mykyta_Poturai@epam.com, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 xen-devel@lists.xenproject.org
References: <20260720162819.308326-1-taka@valinux.co.jp>
 <20260720162819.308326-6-taka@valinux.co.jp>
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
In-Reply-To: <20260720162819.308326-6-taka@valinux.co.jp>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-4011c0/1784817387-53CD3CFC-1F8ABE19/0/0
X-purgate-type: clean
X-purgate-size: 7427

On 20.07.2026 18:28, Hirokazu Takahashi wrote:
> --- a/xen/arch/arm/include/asm/acpi.h
> +++ b/xen/arch/arm/include/asm/acpi.h
> @@ -61,6 +61,8 @@ paddr_t acpi_get_table_offset(struct membank tbl_add[], EFI_MEM_RES index);
>      (!(entry) || (unsigned long)(entry) + sizeof(*(entry)) > (end) ||	\
>       (entry)->header.length != ACPI_MADT_GICC_LENGTH)
>  
> +#define INVALID_ACPIID		(-1U)

This way the constant is becoming available only on Arm, but ...

> --- a/xen/drivers/acpi/topology.c
> +++ b/xen/drivers/acpi/topology.c
> @@ -4,33 +4,319 @@
>  #include <xen/cpu-topology.h>
>  #include <xen/cpumask.h>
>  #include <xen/init.h>
> +#include <xen/xvmalloc.h>
> +
> +#define ACPI_PPTT_MAX_LEVELS 16
> +
> +static uint32_t __initdata map_cpu_acpiid[NR_CPUS] = {
> +    [0 ... NR_CPUS - 1] = INVALID_ACPIID

... you use it in code which (in principle) isn't Arm-specific (it only
happens to be right now).

> +};
>  
>  /*
> - * TODO: Populate the topology information by scanning the ACPI
> - *       PPTT (Processor Properties Topology Table).
> + * The first argument 'cpu' is the logical CPU ID assigned by Xen,
> + * and the second argument 'acpi_id' is passed the 'uid' field from
> + * the ACPI MADT Generic Interrupt subtable.

This comment also looks to be (in part) Arm-specific, which it shouldn't be
here.

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
> +    if ( entry->length < sizeof(*entry) || entry->length & 3 )

Parentheses please around & or alike within || or alike.

> +    {
> +        printk(XENLOG_ERR "ACPI: PPTT subtable length is invalid\n");

Like you have it here, ...

> +        return false;
> +    }
> +
> +    if ( (unsigned long)entry + entry->length > table_end )
> +    {
> +        printk(XENLOG_ERR "ACPI: PPTT subtable extends beyond table end.\n");

... no full stop please in log messages (applies elsewhere as well).

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
> +        printk(XENLOG_ERR "ACPI: PPTT processor node length is too small.\n");
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
> +
> +    if ( proc->header.length != table_size )

Isn't != overly strict?

> +    {
> +        printk(XENLOG_ERR "ACPI: PPTT processor node length invalid.\n");
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
> +    unsigned long table_end;
> +    const void *ptr;
> +
> +    table_end = (unsigned long)pptt + pptt->header.length;
> +
> +    ptr = pptt + 1;

Make these the initializers of their variables?

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
> +
> +            if ( !verify_proc(proc) )
> +                break;
> +
> +            /*
> +             * Leaf node verification is only required for ACPI 6.3
> +             * (PPTT revision 2) or later.
> +             */
> +            if ( (proc->flags & ACPI_PPTT_ACPI_PROCESSOR_ID_VALID)
> +                 && proc->acpi_processor_id == acpi_id
> +                 && (pptt->header.revision < 2
> +                     || (proc->flags & ACPI_PPTT_ACPI_LEAF_NODE)) )

Misplaced binary operators (also elsewhere). On continued lines they go at
the end of the earlier line.

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
> +               "ACPI: Failed to allocate memory for topology parsing.\n");
> +        ret = -ENOMEM;
> +        goto out;
> +    }
> +
> +    pptt = container_of(table_header, const struct acpi_table_pptt, header);
> +
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

Please prefer the slightly shorter %#x (and definitely please don't mix a 0x
prefix with %u). Again applies elsewhere as well.

Jan

