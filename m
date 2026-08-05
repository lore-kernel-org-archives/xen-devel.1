Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2CA6C55822
	for <xen-devel@archiver.kernel.org>; Wed,  5 Aug 2026 09:04:34 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1383095.1626351 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrXXt-0000RX-8i; Wed, 05 Aug 2026 09:04:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1383095.1626351; Wed, 05 Aug 2026 09:04:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrXXt-0000RQ-5P; Wed, 05 Aug 2026 09:04:17 +0000
Received: by outflank-mailman (input) for mailman id 1383095;
 Wed, 05 Aug 2026 09:04:15 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wrXXr-0000RJ-RQ
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2026 09:04:15 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wrXXq-003Ex0-JW
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2026 11:04:14 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a72fc89-e002-0a2a0a5209dd-0a2a450499a2-18
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 11:04:14 +0200
Received: from [209.85.128.47] (helo=mail-wm1-f47.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a72fc8e-b57f-0a2a45040019-d155802fbd04-3
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 11:04:14 +0200
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-49556f97a9dso4591765e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 02:04:14 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47fec23ede6sm7230911f8f.30.2026.08.05.02.04.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Aug 2026 02:04:13 -0700 (PDT)
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
        d=suse.com; s=google; t=1785920654; x=1786525454; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CcWPV/2C/noLJiB/mvTSLtIwjRvaHYyVNz5lIaVixS4=;
        b=eLL9tBzCCsDqDeWiq93199XJ/U6NjXuklWLUBNSM7IkY4ZoE91vjibio8JheXKXHiD
         /8YO4KtdbOy9h5zkuL+NJtLEQgHn1Ux5SYrEvmMX/eKgq5nDy//RfubH/+d+Ft6TOMv4
         7aNx5F1oyYM2CO+KGp+169Onj5AZ9OCE315LhN1ccr7vK+mKbw3DFJO7MDy9JWpkdIu1
         SWOe/6SZPY1Gwh5v/tBlsLGnsS9BD7oQfLb+unCDtORxv+rLHceaWokXRa51SvdUffKv
         EKnHBPtSvjyEhO8TvTJXB2xK8nKkkuRoLZcmb+nqvZI+1zbnRLwuPOsh2juhbqOUEG7g
         Cuug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785920654; x=1786525454;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CcWPV/2C/noLJiB/mvTSLtIwjRvaHYyVNz5lIaVixS4=;
        b=ZxYsjU/m8QhPtsU2upPsb7tL9iw3NT1//QnQt9QrerlLzuMutIrs5xiMFdjunobSSe
         BtCXHT+gBNjIIfog+3NnNCv8Xnoh9BrjDGH0zcsj+CejxL8i1BYvMnZt6oQnDQutPXlT
         DdD8Sy7ehreywAERocrj5GHzazG54R0GMLugOWrgHA08ttlCIRQITKWH7bn9l+2kDzU1
         Vjnr1l+pAslVeAiLRC2gt2ZfVrhsUETip5FBefTPtFRDwWTd15Dh8SifsgS8cq41X8aC
         lbwfDggmgFKTcbFoY9Iwg8i/IflOl58HuHW5bzwI9PlNGq28qXZj+gBqWQ5SAFnTPyso
         qkkA==
X-Forwarded-Encrypted: i=1; AHgh+RqpexKbYGAMql7ShjY0WTRcPPAountQP4gUFc4ePY8NnqVkxVZZhRlnO7NrNgdRxKEx4XEhId17bvo=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yye18rfQNRSpt8U3YoSjWAFMgU8uI+FiuOOXcu2v73cTRFqjWg0
	t76dJgnQp29qOkXYrDOtKBWVWFo8106rlXDtl5xXtNn/bNwBuxNkaO7sH2nsYJVtuw==
X-Gm-Gg: AR+sD11z+sGvQv408WCvZrvsOw4/f7oNP97NDcRJPI6zDfh9hMFrGcaZjdC5YMNju4D
	pVaFGPeI0/JdKNo0sKBGMmVkAtip7C2L/v5bA6fze/3wuIBJZj8kROQwPzsPFgsrDeyg+Ja8zSD
	SpR71W8Naa1JvnzF2ieNCmaRcrgzfN0AUxZNe5oHJIVA55u6fnzbajSMkusRlxp84UrW9vZjz8j
	yy6RqMQnfM2izz8aTK0kZv9pAjftzhAXrNUTFr1Z6Quqt46mnrGbQADItXiYwyOrWsN9IuO/dzZ
	JTnrqgK3ascCU2nutqF5AAJ1YDTVJ29MPyFqJC++VM8xka++uGi2CrFi8gMNvMzowtrXZ2W3gym
	xCZPtJehNe+/LsG7HEY8JYpy4f8sR/312lzOctw+gZlquccdxysOqPWeUPrCv/p7vQYGTX5tm+M
	GHLFqnfAbB1nKmaKXn0P1wzOR1LsqlnWU3ja5yb46UYhJS1J2J62mvJSIsL6Ao5OxREpIr3P0h4
	Hz4vGM1Vp8PaYkajrZnpjpxx0XCAYphgQ+bLNOogayoaN2tStNh
X-Received: by 2002:a05:600c:4688:b0:495:6bc9:62b0 with SMTP id 5b1f17b1804b1-4994e7d1487mr55628955e9.17.1785920653939;
        Wed, 05 Aug 2026 02:04:13 -0700 (PDT)
Message-ID: <bbae3eb9-6d1e-4caf-a647-25ca9ca8a61c@suse.com>
Date: Wed, 5 Aug 2026 11:04:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] x86/xen: Drop CONFIG_XEN_PVHVM_SMP
To: Juergen Gross <jgross@suse.com>
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org, x86@kernel.org
References: <20260805082137.1214967-1-jgross@suse.com>
 <20260805082137.1214967-5-jgross@suse.com>
 <f06ccf87-c244-44a1-af82-52da3b01c334@suse.com>
 <5febc2c0-4355-48d9-9342-52d590041500@suse.com>
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
In-Reply-To: <5febc2c0-4355-48d9-9342-52d590041500@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ebf023/1785920654-520D5B50-1A0B19E4/0/0
X-purgate-type: clean
X-purgate-size: 1558

On 05.08.2026 10:55, Juergen Gross wrote:
> On 05.08.26 10:44, Jan Beulich wrote:
>> On 05.08.2026 10:21, Juergen Gross wrote:
>>> --- a/arch/x86/xen/Makefile
>>> +++ b/arch/x86/xen/Makefile
>>> @@ -37,8 +37,8 @@ obj-$(CONFIG_XEN_PVH)		+= enlighten_pvh.o
>>>   obj-$(CONFIG_EVENT_TRACING)	+= trace.o
>>>   
>>>   obj-$(CONFIG_SMP)		+= smp.o
>>> +obj-$(CONFIG_SMP)		+= smp_hvm.o
>>>   obj-$(CONFIG_XEN_PV_SMP)  	+= smp_pv.o
>>> -obj-$(CONFIG_XEN_PVHVM_SMP)  	+= smp_hvm.o
>>
>> Similar issue here - in a PV-only config smp_hvm.o doesn't want / shouldn't
>> need building.
> 
> Note that I didn't change any functionality.
> 
> I agree that it seems a little bit strange, but in the end I believe
> the current status is okay-ish. PV-only hasn't been something in upstream
> Linux since Xen support was added, as PV was always meant to be an
> alternative to bare metal support via paravirt patching. It might have
> been possible to build a kernel not really functional on bare metal, but
> this was more like the ability to build a x86 kernel not working on any
> existing machine.
> 
> IMO the Xen kernel config options should allow for adding Xen-specific
> features, but minimum Xen support should always have basic HVM support,
> which includes the Xen specific performance enhancements.

I fear I don't understand this. If I want a kernel just to run as PV Dom0,
why would it need to carry anything HVM-ish? That is (or should be)
entirely unrelated to being able to also run this same kernel on baremetal
then.

Jan

