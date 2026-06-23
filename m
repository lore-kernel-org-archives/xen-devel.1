Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB805CDB470
	for <xen-devel@archiver.kernel.org>; Tue, 23 Jun 2026 07:38:47 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1344098.1603233 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wbvi8-0008JZ-M8; Tue, 23 Jun 2026 07:38:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1344098.1603233; Tue, 23 Jun 2026 07:38:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wbvi8-0008JS-JJ; Tue, 23 Jun 2026 07:38:20 +0000
Received: by outflank-mailman (input) for mailman id 1344098;
 Tue, 23 Jun 2026 07:38:18 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wbvi6-0008JJ-LI
 for xen-devel@lists.xenproject.org; Tue, 23 Jun 2026 07:38:18 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wbvi4-008yy9-MR
 for xen-devel@lists.xenproject.org; Tue, 23 Jun 2026 09:38:16 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a3a37e0-e002-0a2a0a5209dd-0a2a4508ec3e-14
 for <xen-devel@lists.xenproject.org>; Tue, 23 Jun 2026 09:38:16 +0200
Received: from [209.85.221.51] (helo=mail-wr1-f51.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from <jbeulich@suse.com>)
 id 6a3a37e8-9ee7-0a2a45080019-d155dd33a5da-3
 for <xen-devel@lists.xenproject.org>; Tue, 23 Jun 2026 09:38:16 +0200
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-4629051c946so463607f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 23 Jun 2026 00:38:16 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-46666788302sm29219705f8f.20.2026.06.23.00.38.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Jun 2026 00:38:15 -0700 (PDT)
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
        d=suse.com; s=google; t=1782200296; x=1782805096; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=1JKxJy6imkEXzhQowX/sDEJimum+Ir5Lisn9D9Tqpmw=;
        b=Ujp5Cf6i2yPaaYRWLpyepPLi1ASD93t/vhgxQ9skFAJtx9FKnLWXZes1Ak0bEngdsd
         2Bs9+nPAZ+pALoY+QmRQOciDr93JXwaiqM+r8k57hxBrtPEHeGkl0fJZn3DeYIiVqVHN
         DCsUByLHbzKZRIudsybffwVLZomn2aopG5pVBLmqqb55diBA4Y8fmlfwQ2kKp65haUbo
         eVfIBGOC6R1Zj0TspiNjDNmY+5xm7HK/+TtjQmNsIphGzZChazwGpBrwxLb2VU3RvepU
         hYVxUv0dTAzhNMLf15ibD2KJ9WfXS8JunCqKKtrBqzWLtEgYJzCv1x/tEthPDyeyKASc
         /7IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782200296; x=1782805096;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1JKxJy6imkEXzhQowX/sDEJimum+Ir5Lisn9D9Tqpmw=;
        b=G1yUjsgShvepbKQw7f4Or2XOMMqa5h0u5FJ/kqWdA0l2ptwrh5Hyr0AMWM/lBEeUKQ
         PP0HVcOVwt68hYgDUaAhdy5D3PjmcoMo3SR+GVfp+eSnSjwKymoJLr/XNOU6W9VH42mW
         KewvNV+r3jGQXJA//Sh5vrCrlICroWP+3uO41WKngmc1SNHmnD5wwxy8FdEO4R2UZDKc
         iPX4IPlMMaBch/RNjmvRrmx+FWcLUPsNwFWfYyuLNUU/oHd01L7RBXZDL0UAefQog6No
         L86sBbT8Kofu4E7NSxqpc3VRuFtKpesy3ndrx/LlVj5Aq5oceT1QQF/dafDZIk/eeqzk
         hDtA==
X-Forwarded-Encrypted: i=1; AHgh+Rr2fJ5BUbeJwec2pNj8ZUtYZkvsByMzRve3VDSe8KvzgkQVWF8iFF3eXpU8Vlx3JfjBTVG3Pb7qYBc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwCA9NN9XVCb9DhMceryDifvtPhwbH+FM7a188hZPdcLvmSaRDr
	KVVIeJzZFVUMVc0RVkRQ0VNG1B+9w7AqMmqK8k7LX4RyKvRsR8qWl01XTNDRDbrYJg==
X-Gm-Gg: AfdE7cmnSP7s7s2Yk2K0CLGDi9YguIfRCuv4NJMzmPOz2RriVYoagTLOVcscl6jSZj+
	aDxt+LETP6b3LGtroqu9n6cdAr25+UodUFKMRUKOtBPK6ZojFeA7avhBc6d/Qcny8Wwzo5GLAy4
	J37YBXg3nvm3o2i8/0awWpTTz43Ahhbuu2Cj9rI2kEbpquRYW4c9O1LVvnoiM2nQdnlGF/Q7zrZ
	QC43FYJgUTD/EfZE1BnotvKw4jPcP1RJaSBiWZJs+1iaTM31RSPFDgtcyCKc0a2/kniPcmdLoeG
	9Ogkd3NJsD3KxezHMjKJqahNFzIzZY4NZB7euTNPiLkW9APBD33MUpzfeFMjlgG7d9XoSlryG5l
	X6bpUy8NJMwyCwDsrltP5mXW3lYRhgdL1P2+lMiaaGPCLBJbCW7PS2R+sUiL+ny6KawSeZ992pq
	q/Ubmpzksimyv1WqMuN70RentkdroU1tFedSNd6Eq8o0hfAmx7+jNUw0YZpCzD9z6k0odu/FYIg
	REz
X-Received: by 2002:a05:6000:26d1:b0:464:1462:227c with SMTP id ffacd0b85a97d-46a7f578300mr3811933f8f.13.1782200295810;
        Tue, 23 Jun 2026 00:38:15 -0700 (PDT)
Message-ID: <a221a500-d399-45c4-b333-99e119d40dd6@suse.com>
Date: Tue, 23 Jun 2026 09:38:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.22] x86/kexec: Check for a good per-cpu area before
 accessing IDTs
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Lin Liu <Lin.Liu01@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Teddy Astie <teddy.astie@vates.tech>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20260622172054.504778-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20260622172054.504778-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c1860d/1782200296-5D9F20FA-FFD2B664/0/0
X-purgate-type: clean
X-purgate-size: 1602

On 22.06.2026 19:20, Andrew Cooper wrote:
> Prior to commit 9c20d3c5915d ("x86/IDT: Make idt_tables[] be per_cpu(idt)"),
> the global idt_tables[] was always safe to use for CPUs in any state.
> 
> However, not-yet-onlined CPUs (e.g. MADT with more entries than exist in
> practice) or offlined CPUs (e.g. xen-hptool) have their per-cpu pointer
> poisoned to detect incorrect uses.  machine_kexec() trips over the posion when
> clobbering #MC entry paths.
> 
> This fixes a fatal #GP (non-canonical memory reference) when trying to enter
> the crash kernel.
> 
> Fixes: 9c20d3c5915d ("x86/IDT: Make idt_tables[] be per_cpu(idt)")
> Reported-by: Lin Liu <Lin.Liu01@citrix.com>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
albeit preferably, because of ...

> The fix here is a bit ugly.  nmi_shootdown_cpus() uses the cpu_online_map but
> this is wrong too; it misses parked CPUs, which do want to be captured.

... this, ...

> @@ -171,7 +172,12 @@ void machine_kexec(struct kexec_image *image)
>       */
>      for ( i = 0; i < nr_cpu_ids; i++ )
>      {
> -        idt_entry_t *idt = per_cpu(idt, i);
> +        idt_entry_t *idt;
> +
> +        if ( __per_cpu_offset[i] == INVALID_PERCPU_AREA )
> +            continue;
> +
> +        idt = per_cpu(idt, i);
>  
>          if ( !idt )
>              continue;

... with the comment ahead of the for() also adjusted to at least briefly
mention why cpu_online() cannot be used, and why hence this (seemingly)
awkward check is needed instead.

Jan

