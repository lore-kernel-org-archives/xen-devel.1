Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C366C55174
	for <xen-devel@archiver.kernel.org>; Wed,  5 Aug 2026 09:55:34 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1383229.1626493 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrYLJ-0007J1-8j; Wed, 05 Aug 2026 09:55:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1383229.1626493; Wed, 05 Aug 2026 09:55:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrYLJ-0007Iu-5e; Wed, 05 Aug 2026 09:55:21 +0000
Received: by outflank-mailman (input) for mailman id 1383229;
 Wed, 05 Aug 2026 09:55:19 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wrYLH-0007IQ-AR
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2026 09:55:19 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wrYLG-00ESqr-6z
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2026 11:55:18 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a73087d-bab6-0a2a0a5309dd-0a2a4505ae3a-24
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 11:55:18 +0200
Received: from [209.85.128.51] (helo=mail-wm1-f51.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a730885-4cb1-0a2a45050019-d1558033c1ae-3
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 11:55:17 +0200
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-4954aff6088so7909135e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 02:55:17 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47fec24a24fsm8080783f8f.36.2026.08.05.02.55.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Aug 2026 02:55:15 -0700 (PDT)
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
        d=suse.com; s=google; t=1785923717; x=1786528517; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7k23JfBGtG8w8FZKJzglvJRq6dDsmFwVnAzVqjhZ8JM=;
        b=FZulFFenbwbAp/KQsRasxbwl3tEHwsOECEkaj4GBZwykcRfSWb7ie5GACUHQR1Y/pe
         MbRFChmSboUTcG0lhjIXGK/Mt30ya8wWIIx/pd2P5667CVz6f7UdWtzDJxE2ezfvAIXd
         v9EMiP+iYMSZBaahRoGQeQ0K0S3UJ3FnYNd5r9k3n/+i+Z/R3pMF+cht/caYtQQtfgFB
         /OvPtB3d1nJFWVM7x9oPRmqB6LbrsA1vlYf6YxFpv4qHOAsI5GTM5qX5Ltci5iGGsw7D
         GZF6TuwXdgDXCjMcLjfBoGQI+5gAUANaGQDO4KUjQuHnpKvXKI7U2xHOzvn6ubu8pxpM
         ucNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785923717; x=1786528517;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7k23JfBGtG8w8FZKJzglvJRq6dDsmFwVnAzVqjhZ8JM=;
        b=NSQl5ikGlkRzvlfT/1QbtXtLnwRVqbAZK3fNtsSnLOCE0KBRPO9hNGEeig+LN6I3SC
         d4FsCUI+XXK6R/dFQZRcqDKXxVuVDOE8DVRi8uZqV7HwSbBnfYzWQ+XI+jhcIJJYPQHF
         DLRyinTgmXshSoDEih9OqE223Nq6vA1jIJNDSw81EVgC7tOsh0GhS44FvKd4DdNr0ECF
         9HzSzieD8Ahy+ZWZ6B2I4ipdQawFp1MmtdOmNqrCysGFjQMr8dak8hJ9kow7Xvrz4uU6
         2fyd3LZv7wwLMIbBUrtQ/vSeDVe8Zje4R2lQ+Ms2nrI9SR64OvgA5MXGrD+obOMsvzu8
         nA6A==
X-Forwarded-Encrypted: i=1; AHgh+RqV5UnCzqYJ8nN6zhxlWBaASS7+cqZdEGiLUTve0hNz5Nja+GQNuE0J+gqocBq7qQSdfr0Zq47FIv0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyavtesLQeqznFbugux04G/u/Iiy7beZMAFuKQXLdlkQGfX2O/2
	bHRBNMqgS+OsOhX00Q9YV5wYXyakALo3Xbo2DHMU/GmnpmvE4h39EEieYhhdYvTBB2pzD0EJlN+
	saWlOGA==
X-Gm-Gg: AR+sD12fkEUFoURY4bAk9o7jyF4wjwbzre/6ZHlm7Oig/953uYdelv6PBXfrk+y4EyD
	5CDMHIxArb8JAYZXbpZgsKmmWyZOJiEAglKem13yw+vErxUzTzFMFV47LLKlgy97XOoV5Vrtzpz
	Q1gQi0URn1YeV1GYZVV5Bvlsf4TRQDgIfobhK9iCV5FDk5NJ3+fO8GAJDNZLMjZ5IuuOVIyWCEl
	h7C6WrNmXPpMqSm9dQ6BoLUOJiVchOH/MYJ9z0epcEwYqPU+sfKb1/vv43UGUnw0Z5eLA7+RRVG
	egjyaev8NZOUcavXxUdQzvWqhtaH8IToWcrEPMFqrkxYHzu/CX/DycC2bBCUsleUFOJW1b1sVeg
	0oh9eaq9LL/byDHraUmjEqjoKf47cNqaX2/o26jTyYcsCH89GyN6asuFiY7twR2kQl3NGe9/cdw
	OhdAjKyMUmT18JUzo/hNYCPyWxxCBfStljLmZVbfY5YAOon0Hzh0Z33I59SknqugLje4GfXYpFj
	wZFZfBU9AANU05Ifta20wh3NW5Bb1xTj+cxNPQWutr3MOzqAJLn
X-Received: by 2002:a05:600c:1383:b0:493:bfad:9d99 with SMTP id 5b1f17b1804b1-4994e7caf7cmr55828995e9.13.1785923716237;
        Wed, 05 Aug 2026 02:55:16 -0700 (PDT)
Message-ID: <38863d15-c6d3-426d-b09c-3dbed9f2f0b0@suse.com>
Date: Wed, 5 Aug 2026 11:55:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] x86/xen: Drop CONFIG_XEN_PVHVM_SMP
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 xen-devel@lists.xenproject.org, Thomas Gleixner <tglx@kernel.org>,
 IngoMolnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>,
 lkml <linux-kernel@vger.kernel.org>, X86 ML <x86@kernel.org>
References: <20260805082137.1214967-1-jgross@suse.com>
 <20260805082137.1214967-5-jgross@suse.com>
 <f06ccf87-c244-44a1-af82-52da3b01c334@suse.com>
 <5febc2c0-4355-48d9-9342-52d590041500@suse.com>
 <bbae3eb9-6d1e-4caf-a647-25ca9ca8a61c@suse.com>
 <a5cce538-87d2-40e5-8a8c-21102fb37a52@suse.com>
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
In-Reply-To: <a5cce538-87d2-40e5-8a8c-21102fb37a52@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c201ff/1785923717-732B32A1-0584B9CF/0/0
X-purgate-type: clean
X-purgate-size: 2699

On 05.08.2026 11:44, Jürgen Groß wrote:
> On 05.08.26 11:04, Jan Beulich wrote:
>> On 05.08.2026 10:55, Juergen Gross wrote:
>>> On 05.08.26 10:44, Jan Beulich wrote:
>>>> On 05.08.2026 10:21, Juergen Gross wrote:
>>>>> --- a/arch/x86/xen/Makefile
>>>>> +++ b/arch/x86/xen/Makefile
>>>>> @@ -37,8 +37,8 @@ obj-$(CONFIG_XEN_PVH)		+= enlighten_pvh.o
>>>>>    obj-$(CONFIG_EVENT_TRACING)	+= trace.o
>>>>>    
>>>>>    obj-$(CONFIG_SMP)		+= smp.o
>>>>> +obj-$(CONFIG_SMP)		+= smp_hvm.o
>>>>>    obj-$(CONFIG_XEN_PV_SMP)  	+= smp_pv.o
>>>>> -obj-$(CONFIG_XEN_PVHVM_SMP)  	+= smp_hvm.o
>>>>
>>>> Similar issue here - in a PV-only config smp_hvm.o doesn't want / shouldn't
>>>> need building.
>>>
>>> Note that I didn't change any functionality.
>>>
>>> I agree that it seems a little bit strange, but in the end I believe
>>> the current status is okay-ish. PV-only hasn't been something in upstream
>>> Linux since Xen support was added, as PV was always meant to be an
>>> alternative to bare metal support via paravirt patching. It might have
>>> been possible to build a kernel not really functional on bare metal, but
>>> this was more like the ability to build a x86 kernel not working on any
>>> existing machine.
>>>
>>> IMO the Xen kernel config options should allow for adding Xen-specific
>>> features, but minimum Xen support should always have basic HVM support,
>>> which includes the Xen specific performance enhancements.
>>
>> I fear I don't understand this. If I want a kernel just to run as PV Dom0,
>> why would it need to carry anything HVM-ish? That is (or should be)
>> entirely unrelated to being able to also run this same kernel on baremetal
>> then.
> 
> The fact is that Xen PV-mode was always a feature not really liked especially
> by x86 maintainers (this is the polite way to phrase it).
> 
> Changing something outside of xen-specific parts of the kernel in favor of PV is
> nearly always a fight and I'm pretty sure I only get changes in by playing nice
> (not changing more than absolutely necessary and cleaning up constantly). I will
> certainly not try to push for a "PV-only" kernel while the hope of the x86
> maintainers is more "PV will go away some time in future".
> 
> The capability to configure the kernel without HVM stuff but with Xen support
> is the way it has been since many years now. Nobody has missed a PV-only kernel,
> so I conclude there is no need for that.

Just FTR - I did, even if maybe I never said so explicitly. But as it's just
me ...

Jan

> The closest we will get here is a PVH
> only kernel, and this is possible by not enabling CONFIG_XEN_PVHVM_GUEST.
> 
> 
> Juergen


