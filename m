Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC018C5DF70
	for <xen-devel@archiver.kernel.org>; Mon, 17 Aug 2026 08:30:33 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1392589.1631548 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wvsjV-0003t3-Vz; Mon, 17 Aug 2026 08:30:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1392589.1631548; Mon, 17 Aug 2026 08:30:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wvsjV-0003sw-TQ; Mon, 17 Aug 2026 08:30:13 +0000
Received: by outflank-mailman (input) for mailman id 1392589;
 Mon, 17 Aug 2026 08:30:12 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wvsjU-0003sq-Cp
 for xen-devel@lists.xenproject.org; Mon, 17 Aug 2026 08:30:12 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wvsjT-00B6Bw-Kk
 for xen-devel@lists.xenproject.org; Mon, 17 Aug 2026 10:30:11 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a82c68c-e002-0a2a0a5209dd-0a2a45039626-36
 for <xen-devel@lists.xenproject.org>; Mon, 17 Aug 2026 10:30:11 +0200
Received: from [209.85.221.53] (helo=mail-wr1-f53.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a82c693-fae8-0a2a45030019-d155dd35e4c1-3
 for <xen-devel@lists.xenproject.org>; Mon, 17 Aug 2026 10:30:11 +0200
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-47f703a9d05so2026001f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 17 Aug 2026 01:30:11 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-482a5a3b572sm2042703f8f.13.2026.08.17.01.30.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Aug 2026 01:30:10 -0700 (PDT)
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
        d=suse.com; s=google; t=1786955411; x=1787560211; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LH92ElShDin2r1KuNlfB+hn91KLMq+rpk5+sB/ghXic=;
        b=Tnz2wxXPzQhLIYNfY/0i9uVb99HmUK9sy3MquQwz6bPH8ZYjY6MOioH4dlPJ1HT1Sv
         MtiuoeQSKm/pOGPi4mwK2vsFlBt6ke0iCjJ0dNmpaIdXXIDEr7VDoxuMt08L5Ia1/Lpr
         FepUoP+UtXZ79I/1b6kaMrQP1I85OZqUECr1d8XUMPELZdBPzUuEr7mJStkD1yY+2ZMp
         XzVb+jMxd5eOh56TXWr4GciOp5THBF+2mG1oE1WNlkaavLYMRKpjKSEgKtqo1B3G39mS
         abEm4whAOKP6atLpFzg1qoysSvcyC4FI2p45ezZ0773Xbe3GHF/Dy3IfgtW+7dG+rGrA
         mbEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786955411; x=1787560211;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LH92ElShDin2r1KuNlfB+hn91KLMq+rpk5+sB/ghXic=;
        b=ZGW688oGu5ANi1fMDd1eUFDxKwKteP0BffRXM33aMtnpmtM+OdP2LISLELfQmaiRCt
         38hnuJ6Cc53EkBwBrC56ZEH0d/z+CnJvMFiRoFfAsmDZ7QT5mXYOHZMuL4/FnH5LL+5+
         ovE0wb0SBVjmHvXKFuJBqdFAcuOwi92RBfgHgHWp8lPAHHdgEJjX8I2DEBgLJoUighgA
         o8/puexAzEOEpj8CUitILmcR3b87qL0F8lggt/De2JAi4WI6cp6YzUk03+Vor0S1rpAM
         /MvL0gB3lG+Gi4sCjxz5oYk3kSmJBXTxULdHAXLvLozDvXU0xqxJg0mH4hMTUSZpiHSl
         XsVg==
X-Forwarded-Encrypted: i=1; AHgh+RoWmpeaL/CpO3rc0/JHtjLpNkmXPZqfSznb7y1m+2Ubz3NiBPc0UASFU1/OfudC4pz3ol7cuO2A7rA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzvocUuginxruPIiVktvVkV5jm8xkoc4prvI/LjylmKCJWQGfYt
	SaHHby+SdcizRSuQPuN2Jwh/C7sARhxirNU50LqDdNZ+vNg1mFhE6bBBuI8N60b8Ig==
X-Gm-Gg: AR+sD10D/p1LAejemjM80eu6175YmQ1W87KsplclU+dp36Z/H3bfAdvnL8Jk67TgHX7
	jhKocD+tTBOC7wPqQ657Y8AB1nTNV9/27n3zxoPFU9o0IC0oUq0tHtugpTdiGL8J775e+OBd60r
	91c4MU5sV8/6qlkToXACQkj5FRwdNad0jX3NF2MQYZ1umOGMSOn5l3h8xvHHC0kOimEmI8sx4wt
	ED6+aWHTscNRiSJpfmQj2FjjkldzmR8ehwDOcvEDc92/DnC42+PSpjg+tMefpnqTdgSGS3r8Iq3
	ALNkJU8CYMO6wYECoZoIsgzNb3owlBk2x4kjfXTSTF7R/oqLPVDrWp8cXVTpJn18xjHMqUYl/43
	iMZbNrq2npFCGQTDxacjZ/R44nhfiR+4hMeUBUDnAkjdPYByuZhVNFMpu1gzW5hO6bas5Yz8lH1
	6q0QJoJHgSWA5UwymmKUtwMNfFst8XlwMJeW90EABvW6mUlkE8YvFfPde0mQ12rhQGIAPTB+7D8
	Ocif7F2DdxTdGz6yhCVE+lu3bFygzHZsg1ntZ9KzrjyZQ0bumuZq+neBUxg/2c=
X-Received: by 2002:a05:6000:98d:b0:47f:d072:87d7 with SMTP id ffacd0b85a97d-4816073a090mr41468130f8f.9.1786955410833;
        Mon, 17 Aug 2026 01:30:10 -0700 (PDT)
Message-ID: <4f58e236-c40b-4fcc-82e8-5b6f3eafe656@suse.com>
Date: Mon, 17 Aug 2026 10:30:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/nmi: Fix mis-classification of watchdog NMIs
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20260813174319.1682009-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20260813174319.1682009-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-33051d/1786955411-74C884E9-903F39FC/0/0
X-purgate-type: clean
X-purgate-size: 2288

On 13.08.2026 19:43, Andrew Cooper wrote:
> It used to be the case that cpu_data[] inherited the BSP's cpuid_level until
> the AP had calculated it itself.  Following the rework, cpuid_level has a
> placeholder 1 until it is caluclated propely.
> 
> setup_apic_nmi_watchdog() happens to be called on the BSP after SMP bringup,
> meaning that the first call is on CPU1.  It is also positioned in the window
> where cpu_data[] is garbage.
> 
> As a result, setup_p6_watchdog()'s one-time calculation of the performance
> counter width falls back into Pentium compatibility mode assuming 32bit
> counters.  This causes a watchdog NMI which is delayed a little (e.g. from an
> SMI), to appear as if it hadn't overflowed, and therefore be (mis)classifed as
> not a watchdog NMI.  On systems where unknown NMIs are treated as fatal, this
> results in a spurious crash.
> 
> Switch setup_p6_watchdog() to use boot_cpu_data.cpuid_level, which is how this
> is checked almost everywhere else.
> 
> core2_vpmu_init() used the same pattern to look at leaf 0xa.  Despite being
> init code and only running on the BSP, {boot,current}_cpu_data are different
> objects, so switch it over to checking boot_cpu_data.cpuid_level too.
> 
> Fixes: 7126b7f806d5 ("x86/CPU: re-work populating of cpu_data[]")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

> I hate this fix, but it's the only thing which I consider remotely safe to
> backport.  Recent attempts to alter CPUID ordering have 0 success at being
> bug-free.

How that? Collecting CPUID output should be doable almost first thing. There
are no (or in case of doubt: there should not be any) dependencies on about
anything else. Of course re-collecting may still be necessary after ucode
loading. Yet from what you say I must be missing something crucial.

With that in mind, I'm also questioning the Fixes: tag (without this being a
request to drop or change it): Using another CPU's data isn't much better
than using partially unset data. Unless we assumed full symmetry, at which
point re-obtaining of most data on the APs would be entirely useless. Hence
the issue was pre-existing, with one bug there hiding the issue addressed
here.

Jan

