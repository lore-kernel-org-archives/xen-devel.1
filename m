Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8298C531D2
	for <xen-devel@archiver.kernel.org>; Thu, 23 Jul 2026 14:07:56 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1369208.1618075 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wmu5J-0007v8-Iy; Thu, 23 Jul 2026 14:07:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1369208.1618075; Thu, 23 Jul 2026 14:07:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wmu5J-0007v0-Dm; Thu, 23 Jul 2026 14:07:37 +0000
Received: by outflank-mailman (input) for mailman id 1369208;
 Thu, 23 Jul 2026 14:07:36 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wmu5I-0007u9-LB
 for xen-devel@lists.xenproject.org; Thu, 23 Jul 2026 14:07:36 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wmu5I-0045Tz-25
 for xen-devel@lists.xenproject.org; Thu, 23 Jul 2026 16:07:36 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a622024-2eae-0a2a0a5409dd-0a2a4504bdae-14
 for <xen-devel@lists.xenproject.org>; Thu, 23 Jul 2026 16:07:35 +0200
Received: from [209.85.128.42] (helo=mail-wm1-f42.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a622027-b57f-0a2a45040019-d155802ae89e-3
 for <xen-devel@lists.xenproject.org>; Thu, 23 Jul 2026 16:07:35 +0200
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-4954f5e8020so3609455e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 23 Jul 2026 07:07:35 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47f85c63bd3sm14982041f8f.27.2026.07.23.07.07.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Jul 2026 07:07:34 -0700 (PDT)
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
        d=suse.com; s=google; t=1784815655; x=1785420455; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t2Z39gjDljzmghj0wBYM46+uVXypWWsuVv1ytjgC4ik=;
        b=MCxGtXU6AVdbc3L0+Fqr9fzwwscACv0lkyfJHMPEi82QODuwW3pxlMf9o+d0zrcJml
         2kFCwGJPR0BZ57AJHnSfLtjE8ufKXvyBj61810UZ/7INqBCxGVsiVUguy3gfMn+YquhB
         YI5205xzQEZGvRJmxxUFzVRxcjQZwiNh469tHOhtCvrtkBd3Gzg9m1K2QR/eumXtcEH9
         YPjT4gDMK29vGahoKN/NAbHs7CMxG5oF6KVXMiOJcm87Cn/q+5L/1PGEsutvYdugqKJi
         rZ+uyagl+CwZZoQL1TOlW7Orc50DABlltYq2H82LHUCUblb19KwiV1pBUxL07r2CaRqy
         8KCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784815655; x=1785420455;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t2Z39gjDljzmghj0wBYM46+uVXypWWsuVv1ytjgC4ik=;
        b=m4EN3w4Awj2d36BtsfKlcMBDDIGZiCQ6z+84nNiWLMYDwB0H3h0oq1Jvze+T0ybZ+T
         sLhro1IpE5KaFvAoSG87py0YdLd/VsY4v4/pL8QTLNwmbuVuuicJxpTpDSmYF6Ftsapb
         KGucUIVDnXlNXDL6l4lj0gyTRybUwPAO+kEtqQfxr2qXU2qxyLM49Y4tg4Qre0QYQDlj
         6QnLK+oeO4QJXN4yY6Pv39vejpd22JhTLgHyKLbVGNz0vadeuFVfcyIhseOAfEja/lWn
         P+fghixARLCIMR9rxqwxzuYXnuqFA6ySkMDAhhv5xu+ok/t/D1aIQu+EKVuZyH+BxhIQ
         DraQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqa/X28FmGAH9+fFboyxTxUKO6a0C7/0512mLdUoEG8uC2C7rfUy/vdi+I6VeV0SHw8W8cNvrlIvMU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwOxCsWSUPA1+lDOch7ih1PyDcN5etmW4HWKMSXmzxJUhWrOWgu
	S6pLG6TSNjKHPHqid28pegkQaI+QOscPCRx7dWXPaZ80QGmF1BZcuWPUEJqjkTo/Vw==
X-Gm-Gg: AR+sD13e1UO3bSIDuSWcsLa03oP5gwZ0LlDPmFiPzbqPyQs9fvrnf7I22jdYcbD6GKA
	O+L5E4/XsXIeZfBxgUpQeLsZkmu1eNR2skYGnP1O/ZEk/YjpBJI7vgbM+R4uqUeU9sfzfk+LFrG
	yplMFcS4Rm/5DJhE1zSPNmJFvkG8NESVXSUIrUMN/qqrHLZytm+6pTVaHrS92jgV+1qQEf/A1Kn
	AuKxEIprqr9AT+50JQUUV5yaW1u5p19ImQlvEsVsiSwyqyCcF20zdmkoUQnZPtt6ZYec6s82/M2
	FysUKXTesqYR32dJVoGXQouvBgGiCr4jKKlgQfeLokrz2rRMm2gprhyATY6Zuh12UTzjb0Ap1vD
	m0bCJOujokSz2fLCsfAm/NWWHftnpI9TRuU3My2S1fQm/CwDtwGOeZMwv1sDcaPysvAJl5UpiEh
	en4IvIpikkf2JgcKYmXRH4wpbFaS45cx963a6IvfcYsxAsjNj2YIEYvnijscTwD/mm8w==
X-Received: by 2002:a05:600c:8b63:b0:495:7990:a1d0 with SMTP id 5b1f17b1804b1-4957990a215mr4516475e9.19.1784815655444;
        Thu, 23 Jul 2026 07:07:35 -0700 (PDT)
Message-ID: <88b09f24-13c6-427b-b7a9-aa631e59420a@suse.com>
Date: Thu, 23 Jul 2026 16:07:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/5] xen/device-tree: Parse 'cpu-map' node for CPU
 topology exploration
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
 <20260720162819.308326-2-taka@valinux.co.jp>
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
In-Reply-To: <20260720162819.308326-2-taka@valinux.co.jp>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ebf023/1784815655-C1AD0B50-3005842B/0/0
X-purgate-type: clean
X-purgate-size: 2134

On 20.07.2026 18:28, Hirokazu Takahashi wrote:
> --- /dev/null
> +++ b/xen/common/cpu-topology.c
> @@ -0,0 +1,62 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
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
> +    cpu_topology = xvzalloc_array(struct cpu_topology, nr_cpu_ids);
> +    if ( !cpu_topology )
> +        return;
> +
> +    for ( cpu = 0; cpu < nr_cpu_ids; cpu++ )
> +    {
> +        if ( !zalloc_cpumask_var(&cpu_topology[cpu].thread_sibling)
> +             || !zalloc_cpumask_var(&cpu_topology[cpu].core_sibling)
> +             || !zalloc_cpumask_var(&cpu_topology[cpu].cluster_sibling) )

In v6 the || here were correctly placed. Why did they move?

> --- a/xen/common/cpu.c
> +++ b/xen/common/cpu.c
> @@ -46,6 +46,10 @@ const unsigned long cpu_bit_bitmap[BITS_PER_LONG+1][BITS_TO_LONGS(NR_CPUS)] = {
>  #undef MASK_DECLARE_2
>  #undef MASK_DECLARE_1
>  
> +#ifdef CONFIG_GENERIC_CPU_TOPOLOGY
> +struct cpu_topology *__ro_after_init cpu_topology;
> +#endif /* CONFIG_GENERIC_CPU_TOPOLOGY */

Looks like you also need to include xen/cpu-topology.h here. I can't see
it being included implicitly.

> --- a/xen/drivers/acpi/Kconfig
> +++ b/xen/drivers/acpi/Kconfig
> @@ -2,6 +2,9 @@
>  config ACPI
>  	bool
>  
> +config ACPI_CPU_TOPOLOGY
> +	bool
> +
>  config ACPI_LEGACY_TABLES_LOOKUP
>  	bool
>  

Did you forget to undo this change?

With all three adjustments:
Reviewed-by: Jan Beulich <jbeulich@suse.com> # common, acpi

Jan

