Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BF4BC55174
	for <xen-devel@archiver.kernel.org>; Wed,  5 Aug 2026 13:53:14 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1383519.1626796 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrc3J-0005Nc-G9; Wed, 05 Aug 2026 13:53:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1383519.1626796; Wed, 05 Aug 2026 13:53:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrc3J-0005NV-DD; Wed, 05 Aug 2026 13:53:01 +0000
Received: by outflank-mailman (input) for mailman id 1383519;
 Wed, 05 Aug 2026 13:53:00 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wrc3I-0005NO-HV
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2026 13:53:00 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wrc3H-004o6f-Cu
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2026 15:52:59 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a734010-2eae-0a2a0a5409dd-0a2a45098992-40
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 15:52:59 +0200
Received: from [209.85.128.47] (helo=mail-wm1-f47.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a73403b-be1a-0a2a45090019-d155802fb4e8-3
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 15:52:59 +0200
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-495635a85d2so8997825e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 06:52:59 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49949fc2da2sm202715925e9.3.2026.08.05.06.52.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Aug 2026 06:52:58 -0700 (PDT)
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
        d=suse.com; s=google; t=1785937979; x=1786542779; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yHYw2W3qf29n9rzSQDKJYEq1mbdZ//fm9YT20zpV35c=;
        b=GwAIAcdDKLNoKqP1HyjYvHRObLiCL2VaLm8NEuxniOu9J0oo3LY5otJUjdk+WXNtwc
         9KvAOdsdM6G+Ud64MNqV26vw0Apb+pm5CxH9TVwTpytIeazvbpmYFB7uS/8W35+dvM8C
         yJHCK6doo1pexFjGL7EJkszvQWR8aeZOg0fuqRC/RmyU4nJ1Ora5EW4C8DnoFDLoeQpm
         JwEjBk77ojm0Oj+IZn+U1zO2KthOkyEbxqrwlBL/eAcxRgZmzyMg5i0fNxgZFLCZJkjs
         +0mzLBcJ3m4WvoAtO1tYcc7SB5n0bNGNqVFbZVND4GKJvmll1GVfsW+VH2DHMmx3wDaK
         CucA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785937979; x=1786542779;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yHYw2W3qf29n9rzSQDKJYEq1mbdZ//fm9YT20zpV35c=;
        b=Ae9P19rUgt1LEurz7LanP9ouWeEcLULdDXOKP01UEp9mT9XSFWHi3zPaG+XCNPEPHo
         Zytsj5bmuk7Dn84fy/yM+B+jOPZH84qyYxNMIgAp97p5y67E9r7LYKs0xnQZYmuvgKEj
         NlqSf7UCT/qYNOD385GW+KLRXkUB690OpIRRdClVNK22r3KOEFqTePxAqGYtjx/gYjnf
         OjuFUirX25QXWy//r1lINtaCJbbG0nsn/3538BC+poG6svD3gR8896ONY3jclfN6C9j2
         eOLx+VK5EMhFwf0yYnI/2e7uM6lBfvaR9tJ6vTY6qjzWrGKHPkTSD3cT+sJoFHVciOES
         vtUg==
X-Forwarded-Encrypted: i=1; AHgh+RpKJS1Cd7ZjZBbF9KGlOFLRwJsf9YHADDvPZrXXI98j6BWC/ZwnahM7Mpg29YCufOOgWEXONf3xrYw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxUt/a5mlIOxDHJjpQB5xNzvV6LnJTo3eHn+zK32bNB6cO2chsE
	Ec5qL0y2L0bwK3F0GC+mNC+Oo2RwoK4s51S/CMMAVQ5h/AAqD5drhWmslb25ykRvVhZWkN0mvmi
	nQJuBZw==
X-Gm-Gg: AR+sD12O14tAEQm9n6aYRUqfbc8NnP9Z2/VAZoX2Zs6Jp8yq1kFqyMSxIQI0PJzKoC5
	BuKBLPiOBiLS6Rg6rGvCXFfn+xetVmm5wC3Z2dOTuo+4pEM0jramIK3iU6HmXGpysRcumzQoD5a
	DQl3x6bmDZ8KoOXvV4LP99WhYvplamK9+8PT6wxoZdXfMxUy8YO9jlM7xaJF03bGN5hfFdF5KCK
	dSe/qM/IFdnwVohHm9d9tFAcXefNk6S5pN1y/UJLRyB0qPTTh8TmbpGR/2bZLvAOq7Xz9kVREuE
	aS9D4bzgzEs25+lhOXvqo3ftpK1nksz6ayPT5d9vq2drEHJ9zb6jOJW1QIx6do6ORBtHECPFC6J
	MyufSguWrY77rgiirPuPcJ7E9mxCPD/Kz/80GrKGSnQRmqH9w8+I8ewmDfEjq8oIaF0myQGnCPN
	hIHiKKZq/Kix+IZnXtry836zUvGraNU83q5yqgSVzAie8NzlvFQB9Ph+tszHw5zkU5SWKbL01JU
	NMis2VrOCE3JKI8hOOE6fb5vIiEKVdnQ4rM5Bg0q/+RQcKRwHkK
X-Received: by 2002:a05:600c:1553:b0:495:5045:39e6 with SMTP id 5b1f17b1804b1-4994e7d3080mr65359155e9.17.1785937978687;
        Wed, 05 Aug 2026 06:52:58 -0700 (PDT)
Message-ID: <3e414c79-26cd-4fe4-a48e-73d80b02b4e2@suse.com>
Date: Wed, 5 Aug 2026 15:52:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] x86/nmi: Misc style fixes
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
References: <20260805124525.105457-1-andrew.cooper3@citrix.com>
 <20260805124525.105457-4-andrew.cooper3@citrix.com>
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
In-Reply-To: <20260805124525.105457-4-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-bad1c0/1785937979-3BED6034-15F8B057/0/0
X-purgate-type: clean
X-purgate-size: 1220

On 05.08.2026 14:45, Andrew Cooper wrote:
>  * Drop trailing whitespace
>  * Sort includes, dropping asm/mc146818rtc.h and asm/div64.h as unused
>  * Brace position, and types
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>
albeit I would have suggested ...

> @@ -310,15 +308,18 @@ static void setup_p4_watchdog(void)
>      if ( boot_cpu_data.x86_num_siblings == 2 )
>          nmi_p4_cccr_val |= P4_CCCR_OVF_PMI1;
>  
> -    if (!(misc_enable & MSR_IA32_MISC_ENABLE_PEBS_UNAVAIL))
> +    if ( !(misc_enable & MSR_IA32_MISC_ENABLE_PEBS_UNAVAIL) )
>          clear_msr_range(0x3F1, 2);
>      /* MSR 0x3F0 seems to have a default value of 0xFC00, but current
>         docs doesn't fully define it, so leave it alone for now. */
> -    if (boot_cpu_data.model >= 0x3) {
> +    if ( boot_cpu_data.model >= 0x3 )
> +    {
>          /* MSR_P4_IQ_ESCR0/1 (0x3ba/0x3bb) removed */
>          clear_msr_range(0x3A0, 26);
>          clear_msr_range(0x3BC, 3);
> -    } else {
> +    }
> +    else
> +    {
>          clear_msr_range(0x3A0, 31);
>      }

... to instead drop the figure braces here.

Jan

