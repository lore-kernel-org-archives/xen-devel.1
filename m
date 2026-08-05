Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39BA8C55ABA
	for <xen-devel@archiver.kernel.org>; Wed,  5 Aug 2026 14:02:29 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1383537.1626814 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrcCB-0007rJ-Jn; Wed, 05 Aug 2026 14:02:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1383537.1626814; Wed, 05 Aug 2026 14:02:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrcCB-0007rC-Gh; Wed, 05 Aug 2026 14:02:11 +0000
Received: by outflank-mailman (input) for mailman id 1383537;
 Wed, 05 Aug 2026 14:02:10 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wrcCA-0007r3-Ik
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2026 14:02:10 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wrcC9-000nzY-Hq
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2026 16:02:09 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a734257-bab6-0a2a0a5309dd-0a2a45028bae-40
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 16:02:09 +0200
Received: from [209.85.208.45] (helo=mail-ed1-f45.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a734261-6ca4-0a2a45020019-d155d02dd484-3
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 16:02:09 +0200
Received: by mail-ed1-f45.google.com with SMTP id
 4fb4d7f45d1cf-6a144c8eea2so1184316a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 07:02:09 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47ff34da5c4sm888240f8f.5.2026.08.05.07.02.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Aug 2026 07:02:07 -0700 (PDT)
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
        d=suse.com; s=google; t=1785938529; x=1786543329; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UWqyquH56toU5J0j8tnzTyZp4IECkHmUybItXJUtOtc=;
        b=M9sZVGnhRQC4dmFZQPUgxSbo+54VMdcdVLVEdb3p2z66gG9IhilIneQetjz+UDkru8
         cZGGVhHTYDczbq9x+BL1ztYurFNewo2i9OM5yy3NTzEMBWb/6Se8EvGZK7AIJPDaUNV1
         /DcMrf8rsxYVjr1torrfNOjGUvWxqEmPAI8JHaFOcOLvOJGq+ZOY04njgsYjNV1epFp4
         hGhF4fC+BdTDfCfr8Ch/QVehLJPJuDsKd/19W20/6siWfFYt5kxP2gwpZCrH/htWKe8Y
         RQleUAaupVKczsvOIVaIsWrGhhp/zR57YoQpSIVAj04X+M4l/7E8oYd9p1NLBtaRJ5rU
         ONoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785938529; x=1786543329;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UWqyquH56toU5J0j8tnzTyZp4IECkHmUybItXJUtOtc=;
        b=tB2TAPtNO5htYWdXpisGdkzrsA4LDQCs6WvVuzvzx5SP8ibYnAkv1kgPMGfPz46dKF
         Hs028Irk5bfMNV+iTGWyQwWIQgFiF876vjMVvVPAZse3SIDs86Mr7a6mFEg16CTaSFlQ
         slXnA4k4oB9Y+vRVggzWysDONisLo6RklUer3GW+qjeiHFb4aioCICA8DbtQbI4lxPz7
         J9CvmQm9nN79xSv7IMd/1cMZCoGDHFd0NvHCV5SF9aXYj+0jd6m1kANu9t+dK5srZjM/
         2282jzNAPiRQ+G8Qkj061tpEC7TONEwz43koBT+fevGGDKVS8wOLeIXgHq00+MAshIf9
         VHRw==
X-Forwarded-Encrypted: i=1; AHgh+RrXSWL2uTgGbQTcEv4MYASRtCsbVeduYE6m/gN37cnmrWl75LGCDjiBA5c7cHHCEayVkuD/N5uXR/M=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzeSUqxxkth2S/k2oOKpe/y1H3NAl3DmOpMg0/8ZlWBNKJH+jnD
	y6aHQMcsW4faF8Fxj7mNVVDHPzGt55ljXlw3Z/Lqfd5J1dL1Y40+/+jmqGO2HbboMg==
X-Gm-Gg: AR+sD138xgcpd5XqEmssjJfHf0nMMBh8oiuOtVFI6hOMCPKWx0kwFQVUfGw5Sal3Ip1
	0708zlL4dLAEAxunOCpFy/I9zP8rSbdRBzqiv0uDLeIwSgmGXl1BuawNOmyjTtqXfuXFG/X/9KQ
	GAH7eiQW2gC2dmKDY9ZFE16RWrwf6Boju7YW+q75CQdox4u7Ht1BKHucnJsksbCsX4vEEzB41T7
	ci2T9ZVhbKFbpzxh90ermlza0KXTuknM/6j2S12nHNvJPf5U2JL80q2SPr7MA6eEx7RjRWPcSqI
	fnRf3wa8wmsb2PHf4NAtPYkHSLx/pPtElEmb0sRWxTleDZ0N+Len/gvq3sgw6u17djdkKWLuz+8
	M3VW3N8i2C9d9ikEzpGfHEWa8otan+F34nRVK1brU2M+lES/OtiRANRUJouaMPOWmHM+h1FxAeT
	dUwk+1Wn4iz2nn7/g7EC4iCF29q2yKcVX9wQNo2F/Cb/Kb/gZVqwStffPh/UlfhcYijOYL7hTvS
	UVYIoQ4KkOXJM1BMKKgzoX1esnjV8pnavIK1tJAZsPJv628XoEYBsGepiAWI7g=
X-Received: by 2002:a17:907:961a:b0:c15:b67b:523e with SMTP id a640c23a62f3a-c2039e67177mr309632566b.19.1785938527924;
        Wed, 05 Aug 2026 07:02:07 -0700 (PDT)
Message-ID: <13568d23-b742-4a38-89d1-d49b761fd88c@suse.com>
Date: Wed, 5 Aug 2026 16:02:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] x86/nmi: Check MSR_MISC_ENABLE for all Intel
 platforms
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
References: <20260805124525.105457-1-andrew.cooper3@citrix.com>
 <20260805124525.105457-5-andrew.cooper3@citrix.com>
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
In-Reply-To: <20260805124525.105457-5-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-720697/1785938529-305C52AC-BFDF0866/0/0
X-purgate-type: clean
X-purgate-size: 1296

On 05.08.2026 14:45, Andrew Cooper wrote:
> @@ -347,6 +343,14 @@ void setup_apic_nmi_watchdog(void)
>          break;
>  
>      case X86_VENDOR_INTEL:
> +        misc = rdmsr(MSR_IA32_MISC_ENABLE);
> +
> +        if ( !(misc & MSR_IA32_MISC_ENABLE_PERF_AVAIL) )
> +        {
> +            printk(XENLOG_WARNING "Intel Perfmon unavailable\n");
> +            goto disable;
> +        }

Please can we avoid "goto" when that's easily possible? You can use
"break" here instead, and ...

>          switch ( boot_cpu_data.family )
>          {
>          case 6:
> @@ -355,7 +359,7 @@ void setup_apic_nmi_watchdog(void)
>                                : CORE_EVENT_CPU_CLOCKS_NOT_HALTED);
>              break;
>          case 15:
> -            setup_p4_watchdog();
> +            setup_p4_watchdog(misc);
>              break;
>          }
>          break;
> @@ -363,6 +367,7 @@ void setup_apic_nmi_watchdog(void)
>  
>      if ( nmi_perfctr_msr == 0 )
>      {
> +    disable:
>          printk(XENLOG_WARNING "Failed to configure NMI watchdog\n");
>          nmi_watchdog = NMI_NONE;
>          return;

... we'll still end up here, as nmi_perfctr_msr won't be written.
Preferably with that change:
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

