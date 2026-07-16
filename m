Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 894C6C4450A
	for <xen-devel@archiver.kernel.org>; Thu, 16 Jul 2026 13:27:25 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1364034.1615404 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wkM71-0003pO-2g; Thu, 16 Jul 2026 13:26:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1364034.1615404; Thu, 16 Jul 2026 13:26:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wkM70-0003pH-WA; Thu, 16 Jul 2026 13:26:50 +0000
Received: by outflank-mailman (input) for mailman id 1364034;
 Thu, 16 Jul 2026 13:26:49 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wkM6z-0003pB-EA
 for xen-devel@lists.xenproject.org; Thu, 16 Jul 2026 13:26:49 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wkM6y-000mze-N1
 for xen-devel@lists.xenproject.org; Thu, 16 Jul 2026 15:26:48 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a58dc10-e002-0a2a0a5209dd-0a2a4509d73e-26
 for <xen-devel@lists.xenproject.org>; Thu, 16 Jul 2026 15:26:48 +0200
Received: from [209.85.128.46] (helo=mail-wm1-f46.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a58dc18-be1a-0a2a45090019-d155802ee5fa-3
 for <xen-devel@lists.xenproject.org>; Thu, 16 Jul 2026 15:26:48 +0200
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-493ae59eca6so17566705e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 16 Jul 2026 06:26:48 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49541eb7372sm79477175e9.13.2026.07.16.06.26.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Jul 2026 06:26:47 -0700 (PDT)
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
        d=suse.com; s=google; t=1784208408; x=1784813208; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HTvK4TPKg2ozyQ9fdUuBYzC4rP8XNTi2PY1dx0Crvpk=;
        b=JUeCYmcp5JYbxUquneh6ihM2rS9onetw3gS+G0gzOqdqd5GGx6Pv+neIthY522y9BA
         FHAx2RfJmXKBU+scO9Ke31FIWEvNnmbP5V24H5URX8MjDlnoX1o3RVewe73bdJXObkK+
         +Ex2pq2821/pwsKrwklptLmr1vTHCHt7ieNAyXtHoWuR28xhfJFaEdfKfX/FTp3tcLVF
         MQlc0t54bCqE4JmwQbH3GUX8cL70PIs8bO/0wURoiPCMktHEVENJhjuWdqqU7Dm1QEQ4
         saisN1fzYvwEgCSHZINqqNWd3l3rgNb+Ok0a4uyk+i993CsZ4swdsx6JvzYgOyVz2qYs
         kT2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784208408; x=1784813208;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HTvK4TPKg2ozyQ9fdUuBYzC4rP8XNTi2PY1dx0Crvpk=;
        b=pfblWN2DyVsSFS+O6q97TmnNWu9ztvLb3XrBpDDobM3nk/nvpVgtqKJWImps6zXyi+
         Zr7DncBLzqoUHu2WxXxG4VYTJEOFvhxNf5G/pM4WyPaZGoyk6AsTkf+u/akNMy6Hy1ii
         4LxeduN3i5cIJ1CMuOnFEOuwARnkiRv6qSRjZV2DM3Ik1t83w2MNNIAr+p6HdtPZkGKh
         Jc5cjx09MrZ16faw/NvTwgqrD+tViwHXSvIo50aYJHCkY8ctPGYEYan0VVk+On8B0oj/
         2MdNCv2oFJLfXu4whyaXcQHl4jbVXwVC1VNuLwgzwREkuzramPhoz9FkF74TZbFwz1BI
         sdPQ==
X-Forwarded-Encrypted: i=1; AHgh+RrMMyJnWPQG5WOh9eTFeRmF2z6r8ugesHs1yIn3PhwsclM3tW5NY0ypDxYw9DGZsUL3u2iXC6Jj9Es=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzEuw/izD01SzUSSsgNhTGM//MX/kOlEikbB+3KsN7Hf8mqfZ6P
	cEcVYLVNTXXdqeTsA+iK1Q86baqAkiyOf8e0b/UwupddvUl78JvXcXYIaDpha72xLw==
X-Gm-Gg: AfdE7cmCdKBPj/fJG2KzQbr6GNvVnwtJLqQ4SFNgsdaZUOO8yW7QedToelX4ejxhbIz
	ugaaENXISy7BrqWXB+ZGyzopyYjMg1An2Yj1CX52O80q9kg6wRQm1fnfP0wyGu2a+4e/VkzL2/+
	P+D/uWZ0Cfi51GNuKDVqJHfQEcnY82Fw8syjxhixnQ43CiJJMnsq3jq0hCYjKMiiyN50u4LHDQK
	HWO4eT2mQq2dcEJ81VNtWevThtSZTZug0f0IhB8ooDifV7kDdwDb4b9yu0zueWC7CAdEbi7OmhG
	Pu78GhxsKH/LB5vJX0hxVpN7MrM7XGxwmEE0DoY1+8RZtmGWZOxO+ijrOJD5VMmiCG87Bxgtq9b
	snSgKz3sFJD57B4oyrsQCsS15Z5eIlLVZWh1Y4GZzad7lVGsM/LOxEb7ENtvo0fKswaETF/1Xl+
	tnVlJ8TMNJIlyNdgGdrBSJ5/stZ1T972gbcgsT6K7Lh01AXoN45GzxUv70ZtgFu621uA==
X-Received: by 2002:a05:600c:5292:b0:493:e6f7:ad75 with SMTP id 5b1f17b1804b1-493f87e6d4cmr239514855e9.11.1784208407797;
        Thu, 16 Jul 2026 06:26:47 -0700 (PDT)
Message-ID: <f4c13b73-719f-4d3f-be60-803fff8d0893@suse.com>
Date: Thu, 16 Jul 2026 15:26:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/5] xen/sched: Link CPU topology to scheduler
To: Hirokazu Takahashi <taka@valinux.co.jp>
Cc: Mykyta_Poturai@epam.com, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Timothy Pearson <tpearson@raptorengineering.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Dario Faggioli <dfaggioli@suse.com>, Juergen Gross <jgross@suse.com>,
 George Dunlap <gwd@xenproject.org>, xen-devel@lists.xenproject.org
References: <20260714104445.919830-1-taka@valinux.co.jp>
 <20260714104445.919830-3-taka@valinux.co.jp>
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
In-Reply-To: <20260714104445.919830-3-taka@valinux.co.jp>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-bad1c0/1784208408-FD668034-6FA1C4E0/0/0
X-purgate-type: clean
X-purgate-size: 2493

On 14.07.2026 12:44, Hirokazu Takahashi wrote:
> @@ -35,7 +36,9 @@
>   */
>  static unsigned int cpu_nr_siblings(unsigned int cpu)
>  {
> -#ifdef CONFIG_X86
> +#if defined(CONFIG_GENERIC_CPU_TOPOLOGY)
> +    return cpu_topology ? cpu_topology[cpu].num_siblings : 1;
> +#elif defined(CONFIG_X86)
>      return cpu_data[cpu].x86_num_siblings;
>  #else
>      return 1;

Now that this is ordered more sensibly, an issue is becoming apparent: If and
when x86 also supports GENERIC_CPU_TOPOLOGY, the present x86 logic should also
be engaged when !cpu_topology. By re-arranging accordingly, you also avoid the
need to duplicate the literal 1.

> @@ -11,15 +22,48 @@ struct cpu_topology {
>      cpumask_var_t thread_sibling;
>      cpumask_var_t core_sibling;
>      cpumask_var_t cluster_sibling;
> +    unsigned int phys_core_id;
> +    unsigned int phys_cluster_id;
> +    unsigned int phys_socket_id;
> +    unsigned int num_siblings;
>  };
>  
>  extern struct cpu_topology *cpu_topology;
>  void init_cpu_topology(void);
>  
> +static inline void init_cpu_sibling_map(unsigned int cpu)
> +{
> +    if ( cpu_topology )
> +    {
> +        cpumask_copy(per_cpu(cpu_sibling_mask, cpu),
> +                     cpu_topology[cpu].thread_sibling);
> +        cpumask_copy(per_cpu(cpu_core_mask, cpu),
> +                     cpu_topology[cpu].core_sibling);
> +    }
> +    else
> +        init_cpu_sibling_map_default(cpu);
> +}

Personally I consider this already being too redundant with ...

> +#define cpu_to_core(cpu) (cpu_topology ? cpu_topology[cpu].phys_core_id : 0)
> +#define cpu_to_socket(cpu) (cpu_topology ? cpu_topology[cpu].phys_socket_id : 0)
> +
>  #else /* CONFIG_GENERIC_CPU_TOPOLOGY */
>  
>  static inline void init_cpu_topology(void) {}
>  
> +static inline void init_cpu_sibling_map(unsigned int cpu)
> +{
> +    init_cpu_sibling_map_default(cpu);
> +}

... this. Imo it would better be

static inline void init_cpu_sibling_map(unsigned int cpu)
{
    if ( IS_ENABLED(CONFIG_GENERIC_CPU_TOPOLOGY) && cpu_topology )
    {
        cpumask_copy(per_cpu(cpu_sibling_mask, cpu),
                     cpu_topology[cpu].thread_sibling);
        cpumask_copy(per_cpu(cpu_core_mask, cpu),
                     cpu_topology[cpu].core_sibling);
    }
    else
        init_cpu_sibling_map_default(cpu);
}

Which then of course requires the decl of cpu_topology (not its definition) to
always be visible.

Jan

