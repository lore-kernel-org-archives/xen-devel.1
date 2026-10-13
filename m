Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FDC8CC6B03
	for <xen-devel@archiver.kernel.org>; Tue, 13 Oct 2026 10:49:16 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1446972.1663116 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGa46-0000Hh-Cd; Tue, 13 Oct 2026 10:49:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1446972.1663116; Tue, 13 Oct 2026 10:49:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGa46-0000Ha-9w; Tue, 13 Oct 2026 10:49:02 +0000
Received: by outflank-mailman (input) for mailman id 1446972;
 Tue, 13 Oct 2026 10:49:00 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xGa44-0000HS-Fn
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2026 10:49:00 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xGa43-00F2Y9-C9
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2026 12:48:59 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ace0c9a-8faa-0a2a0a5109dd-0a2a4506cb4c-4
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2026 12:48:59 +0200
Received: from [209.85.128.47] (helo=mail-wm1-f47.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ace0c9b-195a-0a2a45060019-d155802fa84e-3
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2026 12:48:59 +0200
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-4980fe6b3beso25280465e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2026 03:48:59 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a190344032sm363410835e9.15.2026.10.13.03.48.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Oct 2026 03:48:58 -0700 (PDT)
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
        d=suse.com; s=google; t=1791888539; x=1792493339; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pO4q+8e8JSz4afh1YyM0E7DeZAMGnTAzQ14XBEXPBjQ=;
        b=PM37JDaBmD6RBYrNrzQaZoRbkaaFb4VOKjvAwLCdH5Pa0d+EU4Ai/Y8ROicTRkKONZ
         6dDBUnIUop6/l8y2xsqGc48gQwbZoNfFM4leSNnlTmZ8wx1H8o1uFth5JDWqTPgJ4iM+
         kdTjtF5FIqIIx+eAYf6hHTNqi1z2P46XG/ak5S5cfxAEZPG9rdPQb8B95ziPSdVUkYdo
         UddRjbfxxOcy8itqRZhAvUS4FhbRaQQNaGKD2G6u8a6yTD1dg4FdutX08+AecTyJ8WK2
         7BZW049cNsbo8uLcgyHuYaMFt0OnLqjxGtuLv2gRjNJOZxcYN9rcESdrbeWRekdhEkOY
         RMMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791888539; x=1792493339;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pO4q+8e8JSz4afh1YyM0E7DeZAMGnTAzQ14XBEXPBjQ=;
        b=gye84zWVY7MhqvqUFEdSlwDcsWqyz623XIK/rQjmax9k0azFkzbmPhxeFh2Fh29Mj2
         m+pQjXh+RpjIzJCp0NXTDa0KIVRyTV62/vmUKRlZBI7o9OixhXyyNRxBCt/Ye4acLCa5
         njm+5PgrxVTDuQextJHKWw0sTxAjEpyVGxf99PePSXhmOwPWLG65oOvr0JFnC5vNhcsn
         FjKmwz6hrXJOAq2k43/S3yH+v5bPY2Q0yqxOn8+ayuEr2eiXJJJiMprW+y0awOqFHJMe
         guOcXCzXHEdkn6Br2eWDIjnA9UnjVEVFhxm1ZRLvZbhtLCEpvAzZuGMfgTFExCmeqHsE
         iyAg==
X-Forwarded-Encrypted: i=1; AKwUvBw/bCRhdc38uhBsQtM1S9Ro/E+wr4xTkRbTkyWIQnZIr6a9eR1CTdAF6ovRIg5ax7LQKOEWQgbip3U=@lists.xenproject.org
X-Gm-Message-State: AFq9FYLfejDZ6+ePyRQqF+VvuEwO+ZVTPG3rXUMzYMZ+nxjVTw8NXLsA
	2vfkIK1DlfEfjQrghJZGwhrMlAdHl14OhcB+WcKCIs6+ad+5WQrctzEbpNvWEixfyw==
X-Gm-Gg: AYBFou3qg3Q+TYJfQQAD2M6nugh+DrA3bx90B4a2qLGQKwog+yX+agJhywZGSmFqlrW
	v2Wk1XDupyJjV2qcwvjBG7ivbiiajTe4vykjpXD042rm0IBLHf0myzCAoB4GkGC+OKlDcmSejfS
	TdvMhrRrWB8S9obxStre8A2QFLm7ih/WHlCygyaW1jgALhwpmoEEhHjCIox9K5aiyFwOGA/WW9D
	uIB5gC4QEeLxcw3RBFwZJPOF1kKhs5TM7YU/s3aRUUTIA3S4DE2exMV+cNNTjyg9+ys3LNU9C+R
	tbgwrT03mb2APT+dFEgR2Fd15/dEKg95iOu6KuAUSqccBhdSHdmeoLCrQ9KDuNnNL4GqzrIZ+J7
	0VYZmSz8vNxkcKbQdVYTEX7Mc6ke4DbhDGVunVpEZyjyjyHaA+P5eHzgyFLWEmxjvmSD22vLOsR
	C3HkahLPOt14gWGjtbUkytOF7B9w3IH4AmhstKY6uAVoj04VNMVCylRSzfXLqZyQWxAyF4KGjkb
	jpnzzmF0eA2//pjcc3qwUbw7MB9K0HxcxqJqdY63Bo+U0oJT2ajhYKTSLzWbMY=
X-Received: by 2002:a05:600c:4708:b0:4a1:88df:8a2a with SMTP id 5b1f17b1804b1-4a18e4a6ea5mr242851675e9.13.1791888538657;
        Tue, 13 Oct 2026 03:48:58 -0700 (PDT)
Message-ID: <cdbbff27-f3c5-4859-8b64-955f4ce02825@suse.com>
Date: Tue, 13 Oct 2026 12:48:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 1/4] xen/device-tree: Parse 'cpu-map' node for CPU
 topology exploration
To: Hirokazu Takahashi <taka@valinux.co.jp>
Cc: michal.orzel@amd.com, Mykyta_Poturai@epam.com,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 xen-devel@lists.xenproject.org
References: <20261013103616.121916-1-taka@valinux.co.jp>
 <20261013103616.121916-2-taka@valinux.co.jp>
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
In-Reply-To: <20261013103616.121916-2-taka@valinux.co.jp>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-16d1c6/1791888539-F647377B-447D29FE/10/78276251493
X-purgate-type: spam
X-purgate-size: 2530

On 13.10.2026 12:36, Hirokazu Takahashi wrote:
> Parse the 'cpu-map' node in the Device Tree to extract CPU topology
> information. If the 'cpu-map' node is absent, simply ignore it.
> 
> Signed-off-by: Hirokazu Takahashi <taka@valinux.co.jp>
> Reviewed-by: Jan Beulich <jbeulich@suse.com> # common, acpi

Imo this should have been dropped, when the covered code ...

> ---
> Changes in v11:
>  - When parsing the Device Tree, ignore CPU nodes if the corresponding
>    physical CPU failed to boot, rather than treating it as an error.
>  - Drop the dependency on UNSUPPORTED for CPU topology support.
>  - Print an error message if memory allocation fails in init_cpu_topology().

... was touched at least for this change. Specifically ...

> --- /dev/null
> +++ b/xen/common/cpu-topology.c
> @@ -0,0 +1,69 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#include <xen/acpi.h>
> +#include <xen/cpu-topology.h>
> +#include <xen/cpumask.h>
> +#include <xen/dt-cpu-topology.h>
> +#include <xen/init.h>
> +#include <xen/xvmalloc.h>
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
> +    XVFREE(cpu_topology);
> +}
> +
> +void __init init_cpu_topology(void)
> +{
> +    unsigned int cpu;
> +    int ret;
> +
> +    if ( num_possible_cpus() == 1 )
> +        return;
> +
> +    cpu_topology = xvzalloc_array(struct cpu_topology, nr_cpu_ids);
> +    if ( !cpu_topology )
> +    {
> +        printk(XENLOG_WARNING "CPU topology table allocation failed.\n");

... for one, nit: No full stops please in log messages. And then, how can
a reader of the log tell this message from ...

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
> +            printk(XENLOG_WARNING "CPU topology table allocation failed.\n");

... this one? Or if the message is meant to be the same, perhaps you want
to fold both printk()s (likely by way of using goto)?

Jan

