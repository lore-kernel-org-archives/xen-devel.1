Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D008AC61DD6
	for <xen-devel@archiver.kernel.org>; Tue,  1 Sep 2026 06:40:39 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1404454.1638131 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1IAS-0002u5-FC; Tue, 01 Sep 2026 06:40:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1404454.1638131; Tue, 01 Sep 2026 06:40:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1IAS-0002ty-CK; Tue, 01 Sep 2026 06:40:24 +0000
Received: by outflank-mailman (input) for mailman id 1404454;
 Tue, 01 Sep 2026 06:40:22 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x1IAQ-0002ts-Gl
 for xen-devel@lists.xenproject.org; Tue, 01 Sep 2026 06:40:22 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x1IAP-004wr1-Th
 for xen-devel@lists.xenproject.org; Tue, 01 Sep 2026 08:40:21 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a967352-8faa-0a2a0a5109dd-0a2a450cce94-18
 for <xen-devel@lists.xenproject.org>; Tue, 01 Sep 2026 08:40:21 +0200
Received: from [209.85.221.54] (helo=mail-wr1-f54.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a967355-f479-0a2a450c0019-d155dd36ed2f-3
 for <xen-devel@lists.xenproject.org>; Tue, 01 Sep 2026 08:40:21 +0200
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-47ddf7b09e5so494788f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 31 Aug 2026 23:40:21 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49cdce171c3sm46925365e9.8.2026.08.31.23.31.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Aug 2026 23:31:16 -0700 (PDT)
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
        d=suse.com; s=google; t=1788244821; x=1788849621; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OiPWX8IPpLtRRTCWw+Y69aOZxYBxv2bn93Gvyq1POyE=;
        b=IrYRuVtGJPlRa3SJa4lh/5q3uvH25TmSQFL+9T7KTS1mLLXS0d0HpG6f0CMVadDUI9
         WCWGgDbFHUbQK0MDLV207cYKBo3B5SuFqzRNlPlFtKMfJ82iwwbkQE9gl3a7G+4K97za
         bBXRQsDCAbZct/Dd9MlTjiPYwZFmAe9FhQA+fKtMaeYi/F3miMk3FNOSYASSXrfm9E7O
         8ZTydU9naENdw7i+YSyP9eEBiUpKNdK/cPTxxsbXMHD40nRZbcxENkOP5XIr1TyTZmem
         3b37hzyudh8QfbmfLaI3IK2GwtKXADi44ce1P8Bc2Ha2GfNShoLV9eP3ma2aJfCO5cU1
         JvaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788244821; x=1788849621;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OiPWX8IPpLtRRTCWw+Y69aOZxYBxv2bn93Gvyq1POyE=;
        b=LftOOWdo01jXaauvuuTEi51fV7uw/UEAbvYtHEXyoUf8mzPmRcQeSEMGYPfU/I0mt8
         p6S+IfLjUSjEZ5m3u1URGoxa3bt1w/4Tioe8r2hO91irUrQHmG0uSNQnmLYh8dqMOrw6
         +QCePXlfsscgPXAqWqwWYoQNQGCtERv6T85mNV2zIkQoqF0/1cmZB6gso4VguAOUYdSa
         KSK3ZS4+h8v7BQqX8xXh0xx+iwRXnvdr4oBlle/17WT9S/eCqRtJnWH7w3ysTgg3krPV
         xO+0ntzcBBNdq0kb9y9Fo6XQAA0FO0+7uAhKT+eq2ifdJNz7UrWoO9DuOjaZmk8LxboR
         cs1g==
X-Forwarded-Encrypted: i=1; AKwUvBzTjK5UzoDT+3AsuA9PKLjiWu/1RmV7GjGbajklDR7mSNTlG5iEIhyr3dXVGNEutQiTMg39NUhzHvw=@lists.xenproject.org
X-Gm-Message-State: AFuF++ktvxZknVxAC05ZZnFn8J7fxIaWlcgSFUUcVhOulkHq4o1XKfm5
	ZmXpZlnujbHzyf+nXKdWQyvNo6Vx6b9Uwginkr+tAWS2V8wuU6ePZWVc8x9sXOs+HMfHbFXQ9/I
	0fR8wWg==
X-Gm-Gg: AYBFou1ArRmC4uErMlW1ttrkykZVMaMa9hyZdfRk9KXffT7tEWMxeOUp9ahDerbGSHO
	UUi656p1LjUHn4/0g9TImTvMx+r2/iS9MymWBn/czoW2SkHJx+/SEjkhGlOqStOQNL5u3VhbOlC
	+U41l5daFkCQmju3z/qCYTluYxMenteDBYXj8k/ZhpO7wCxxF2uFzvlEK2OkrU5vlQ4yY8FKZp4
	cYzanc3mfJjjcm5OXqBTbis+WZJpXRm6sNQYtI7BfRe6tFNCYbQjTJw7YtEg3iyx72Sw3r2wQum
	M7TLVStPqeBwM+Y95OlVvLd0bGJ12Em+b3EJ1gd1r+m87wXElwUstN+Rjgb8NX93NEzQ9ivAFOI
	25uwR55ZdFH3YCHY/9tQyMownsSBy25C+19GD9HCy6ybYD3OvewoN71QUiQ9P9COoAneNl57kGL
	mDarqQ0OGbIYhYOnX5DR+6lyDEnPJx36BnxH0Kb9AfSZ2zMFGT9mdyQiXFPvnQ2BlfSiT7wAfNE
	jGuzpYWsWRS14HiS6dVFW+zJA3X2Yoc8+FdrgxFhlRUIIic34UF
X-Received: by 2002:a05:600c:1d1d:b0:49b:d45:703e with SMTP id 5b1f17b1804b1-49b91c2dfecmr475085015e9.8.1788244276473;
        Mon, 31 Aug 2026 23:31:16 -0700 (PDT)
Message-ID: <c06d1619-b86d-4a07-9fd7-16db2583b287@suse.com>
Date: Tue, 1 Sep 2026 08:31:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/12] x86: add noreturn in a few more places
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Teddy Astie <teddy.astie@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <90d0e3d6-2e12-43f1-815d-7936ca4c5fc6@suse.com>
 <d0f991de-db67-4f49-aef0-25c590b3889e@suse.com>
 <66fc1415-df9e-41c2-b3ae-78305814cbfc@citrix.com>
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
In-Reply-To: <66fc1415-df9e-41c2-b3ae-78305814cbfc@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d25034/1788244821-00CCBA5B-32ACC2AF/0/0
X-purgate-type: clean
X-purgate-size: 1841

On 31.08.2026 21:13, Andrew Cooper wrote:
> On 28/08/2026 8:01 am, Jan Beulich wrote:
>> --- a/xen/arch/x86/traps.c
>> +++ b/xen/arch/x86/traps.c
>> @@ -2304,7 +2304,7 @@ void asmlinkage entry_from_pv(struct cpu
>>      case X86_ET_HW_EXC:
>>          switch ( vec )
>>          {
>> -        case X86_EXC_DF: return do_double_fault(regs);
>> +        case X86_EXC_DF: do_double_fault(regs); /* noreturn */
>>          case X86_EXC_MC: return do_machine_check(regs);
>>          }
>>          break;
>> @@ -2615,7 +2615,7 @@ void asmlinkage entry_from_xen(struct cp
>>      case X86_ET_HW_EXC:
>>          switch ( regs->fred_ss.vector )
>>          {
>> -        case X86_EXC_DF: return do_double_fault(regs);
>> +        case X86_EXC_DF: do_double_fault(regs); /* noreturn */
>>          case X86_EXC_MC: return do_machine_check(regs);
>>          }
>>          break;
> 
> For starters you're missing a break, and the only reason this isn't a
> compile error is the trailing comment.  Second, it's a tailcall anyway. 
> There really is nothing unreachable anywhere in this construct.
> 
> But by far the most important, it the singular noreturn attribute on
> do_double_fault() (elsewhere, and not visible when reading these two
> functions) which is preventing #DF falling into #MC.   This introduces
> fragility which did not exist previously.
> 
> do_double_fault() would conditionally return if we ever got around to
> fixing espfix64.
> 
> So no - I'm going to insist that Eclair is taught to accept "return
> some_noreturn_fn();" as intentional.  It is objectively less fragile
> than the MISRA-preferred option.

Oh, also: For a v2, how much of this change do you demand dropping /
splitting off? Just the two hunks above, or also the one adding noreturn
to do_double_fault()?

Jan

