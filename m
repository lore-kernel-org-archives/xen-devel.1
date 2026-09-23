Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB857C9830B
	for <xen-devel@archiver.kernel.org>; Wed, 23 Sep 2026 14:43:04 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1430822.1653268 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9OBR-00010W-3M; Wed, 23 Sep 2026 14:42:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1430822.1653268; Wed, 23 Sep 2026 14:42:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9OBR-00010P-0m; Wed, 23 Sep 2026 14:42:53 +0000
Received: by outflank-mailman (input) for mailman id 1430822;
 Wed, 23 Sep 2026 14:42:51 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x9OBP-0000z7-68
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2026 14:42:51 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x9OBN-008CEH-Gp
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2026 16:42:49 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ab3e559-bab6-0a2a0a5309dd-0a2a4503cfd8-28
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 16:42:49 +0200
Received: from [74.125.225.76] (helo=mail-wr2-f12.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ab3e569-fae8-0a2a45030019-4a7de14cc6f1-3
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 16:42:49 +0200
Received: by mail-wr2-f12.google.com with SMTP id
 ffacd0b85a97d-485933b24c3so721368f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 07:42:49 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-488682668e7sm8645448f8f.4.2026.09.23.07.42.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Sep 2026 07:42:45 -0700 (PDT)
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
        d=suse.com; s=google; t=1790174569; x=1790779369; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Xf/8F/jpH1WySL88611CaOE19J/J3pLNy+jbpjItYu8=;
        b=NXBxIAzaxwRUSgWML3uS2KygM9Bd/YY35PoGfpuV0hc2gfIacxBVAVyu3RCSwTEz7r
         EoAfnR5df5+VosbgERnqtIq/XEFK7psCWzmwe21ZKm7FHQ9l+gGtGC71k338RL9QZann
         zCWwt7OqLktarV0NUjGJMNnq/gcG4XsPAgqNKpFP2XZEC4Jy7WWQsmvGqtpJo7rFHi7s
         xJzOqAeDKRFjSLxFzzYsl/0P2wkvz+2FGIPBBku/a4CXbIF1inpIcc/6jSBB865VTNyd
         VnFpdInbYrB0wOqCsVYaRVJDo3FKsKz+AkqOA2h8wtVeGBiTfWG1BMrblc8K2hGVeTDL
         AJCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790174569; x=1790779369;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Xf/8F/jpH1WySL88611CaOE19J/J3pLNy+jbpjItYu8=;
        b=oFAyIYzihGfrrpw3pC6Trw43kSZOVbG85YMEoMHixZ9L/R46xx47p6MZ77YGckAF1C
         JJmz0yL7i3mHTjgKePf6afsrPhosoOId9MvlDSV7gpHjNMOht6HvvJtsHxfKFE/w0slM
         Sf+J0fvLhFgRkqBAV0IrxifPETGcg3eN9u9coqurylIDHJwBmMejxNlmwF9/W321iIXx
         48v3pvBV2ClTaBkeqacLkBJJhWR6mUtXWVTuXlBQhlyMpQ1E1JnuQV1oit6ukg4Y6Lt+
         +6QQv2MiNEx3lQzdCpWn2vc8FsNY/SbV91rckVOHvnqgPxmeL/JAdKhmou8BA0AH4h6U
         VQZA==
X-Forwarded-Encrypted: i=1; AKwUvBzGXfZZqBiXUEv6G7GR20FORtVGwViu77LbQsD/h697+PsI6EHlhBkfM7bn7aEv0oK4SFvME9cv3fk=@lists.xenproject.org
X-Gm-Message-State: AFuF++k8IcYGdpkhSK0aKYBk5hp6wVd9PBnJZEAzIdcJW/gxzfXvuK3W
	mwwGwQe+QEN+UI+AP0vr4/fAKA/yqxJkz94WR+57feMBHr6e/wxzUPquNElUkC0eIg==
X-Gm-Gg: AYBFou23AYseghCdBntfwhzQ+qq5HrKesuBOraHDQFeN8htvys9z95hMLRuZOym77fX
	dEhsIJNqzlL/5jozi4mUl/RvZ3SMq0HUoLuuBCE4tqTekeJg88WkT//eTUiLXNS/PQ0jRDdWoAB
	tN+zY5lD6pPUlcYYrFbKYyZFjd3SuAlH9FAZxcXyVPOOcdTmZWcqLOjcADGRi26tt7wFNQt2np1
	Ppf4BEjunBNjjDjbdWakw8a2Gk8WtzDozCfH0IiDq6qck/4nsjC0VTcA4gXu+2jtGaIJ4S9DsfB
	pgyYy7xgOSW9SIOWoMGVp+/26dkuJUcBB6we5mda8bVyTsrzMX7lVC3EfwLA3YPnXe3+L4E1fgv
	ob9s4WpmbKbdWXzBpyQCChyOt0eQghVn86DV7SYHWwtzHTCS95mbEJFdqbpd7XbP85BH2j8u8Tq
	QviZtmwzGNbfVJNxcGW8JoMdqiDqTzAJqyOXYuk80s6337Ue9pfDTsyUws4V3POQkaIQX65TvKw
	4b+EDQ45+XzOGjIsBeQkHX6ywuO6suGvSumSrZHWG9vSpcIHL3YXqPuUQTh0IA=
X-Received: by 2002:a05:6000:3105:b0:485:8c16:a357 with SMTP id ffacd0b85a97d-488670b46d8mr5521116f8f.47.1790174568744;
        Wed, 23 Sep 2026 07:42:48 -0700 (PDT)
Message-ID: <f9a2b5f1-b746-4f86-8247-3bed14ce1d44@suse.com>
Date: Wed, 23 Sep 2026 16:42:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] x86/svm: Fix VMLOAD/VMSAVE state handling when using
 nested virt
To: Ross Lagerwall <ross.lagerwall@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Jason Andryuk <jason.andryuk@amd.com>, Teddy Astie <teddy.astie@vates.tech>,
 xen-devel@lists.xenproject.org
References: <20260911151250.1232332-1-ross.lagerwall@citrix.com>
 <f7e45d61-1232-413a-806f-5e041d7b67ea@suse.com>
 <66aba455-6005-45f7-b01b-ad0e58ff7579@citrix.com>
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
In-Reply-To: <66aba455-6005-45f7-b01b-ad0e58ff7579@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-33051d/1790174569-77EC24E9-5EA15E96/0/0
X-purgate-type: clean
X-purgate-size: 1565

On 23.09.2026 16:37, Ross Lagerwall wrote:
> On 9/21/26 12:21 PM, Jan Beulich wrote:
>> On 11.09.2026 17:12, Ross Lagerwall wrote:
>>> --- a/xen/arch/x86/hvm/svm/svm.c
>>> +++ b/xen/arch/x86/hvm/svm/svm.c
>>> @@ -444,30 +444,30 @@ static int svm_vmcb_restore(struct vcpu *v, struct hvm_hw_cpu *c)
>>>   
>>>   static void svm_save_cpu_state(struct vcpu *v, struct hvm_hw_cpu *data)
>>>   {
>>> -    struct vmcb_struct *vmcb = v->arch.hvm.svm.vmcb;
>>> +    struct vmcb_struct *n1_vmcb = vcpu_nestedhvm(v).nv_n1vmcx;
>>
>> Here and elsewhere you assume that vcpu_nestedhvm() is legitimate to use
>> even in the non-nested case. I think that's heading in the wrong direction;
>> I think that a hypothetical mode with CONFIG_NESTED=n and the entire
>> struct nestedvcpu wrapped in #ifdef CONFIG_NESTED should still be possible
>> to put in place, without meaningful rearrangements or renaming besides the
>> adding of the respective #if{,n}def.
> 
> This assumption already exists, e.g. see svm_create_vmcb(), svm_destroy_vmcb(),
> svm_dr_access().

Hmm, I see. That's not very nice, but then of course you're okay to follow
this model.

> If you would prefer not to introduce any new cases like this, I could introduce
> a new macro, e.g.
> 
> #define vcpu_n1vmcx(v) (vcpu_nestedhvm((v)).nv_n1vmcb)
> 
> and then for the hypothetical CONFIG_NESTED=n, it would resolve to:
> 
> #define vcpu_n1vmcx(v) ((v)->arch.hvm.svm.vmcb)

May be worthwhile independently, but as per above I wouldn't insist on you
doing this right here.

Jan

