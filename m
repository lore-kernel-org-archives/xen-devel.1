Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34FBFCC6B34
	for <xen-devel@archiver.kernel.org>; Thu, 15 Oct 2026 08:58:39 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1450064.1665569 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHHHz-0003TH-89; Thu, 15 Oct 2026 08:58:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1450064.1665569; Thu, 15 Oct 2026 08:58:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHHHz-0003TA-56; Thu, 15 Oct 2026 08:58:15 +0000
Received: by outflank-mailman (input) for mailman id 1450064;
 Thu, 15 Oct 2026 08:58:13 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xHHHx-0003Ry-KD
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2026 08:58:13 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xHHHw-008Bb1-QU
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2026 10:58:12 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ad09596-bab6-0a2a0a5309dd-0a2a4509af6c-38
 for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2026 10:58:12 +0200
Received: from [209.85.128.45] (helo=mail-wm1-f45.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ad095a4-be1a-0a2a45090019-d155802da577-3
 for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2026 10:58:12 +0200
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-4a1af482519so21896065e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2026 01:58:12 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48defca4013sm7523858f8f.9.2026.10.15.01.58.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Oct 2026 01:58:11 -0700 (PDT)
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
        d=suse.com; s=google; t=1792054692; x=1792659492; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=svpR+ifPquhooBA3NqazjI5lv4fVAP9vS9RJs4wRSD0=;
        b=BzxnH3yDhCM+KdnfDPG5TpteqNy9VMf2ntW05L0rjILXQt0g2EVjc9kVujD4RmaenM
         Tmx5bynZhG0v8IFqb592UEJTJ8eKIsfjFKxhUeihkzKTLVCD94VwUlz1Xpu62usgZ76d
         83PYSZvRylHaXfLwewq0Q3PdjRm2SpQWmABH2kAmkSkbNkcExW/ui/EzbkQP8Y6Ddbit
         17W/fFrMwKxYAUXT/w2CLZeeCtg7jjW7jAmmIF4VD3vy0ZC51YclKVbmSVG5WAD8f1R3
         5hROBpoo0RgFRBlk1kaujd33BTaoaLlsuGt/1D0n38siGbANYuxE3vk9NAG4wA5qVBB/
         dGbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792054692; x=1792659492;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=svpR+ifPquhooBA3NqazjI5lv4fVAP9vS9RJs4wRSD0=;
        b=DzW6tibCiZ3d72Q3Rc4MXGOPml2R9sXB7XgEoNfNt2qtbapwvj1LdqrkTiNwCF45CC
         Q4PcrWo5sFW6m03q7nSILdMJwrHgIThWq0IL7QvEN+eQQSQrKYdyKq0SG90RVqeOotWk
         FTeeJwf2DeGCcd2xM1nLE50jfhH/r72GPPeyHKPk0bk4Hcxi195Sr/EtzZI3jcHV5fV3
         G7GzP+xb4xPxk/O+8cOL8LmgF0Zoe2nrin7EtCeFxrneazFo7WPuCveKBq8OkJ4ac50g
         7LdO4ycYfhjzG1VI+J6w3hVbsfSJC/T79Kigrf4/QnCoSdvShFaXccNR+c2fvRsjEQJ7
         D+2A==
X-Forwarded-Encrypted: i=1; AKwUvByEriBhg63GfWdl3n2sIEuNp+PfjvdWJg4inQIKx1mkM620edPbb+kBrVOzimZ0nBM5RC+SKNFco88=@lists.xenproject.org
X-Gm-Message-State: AFq9FYJYIGpC3uVpLL9bhTaYwiNm8bvLYlcsry7aUQGWelR3bqTlohWZ
	bU1VfNziiDxJHNeFaltOwQwKHGOssNN5Sn12BtRtY3yBtCBWarVTLe4Kep+SCdC+hw==
X-Gm-Gg: AYBFou3Tt5O+sqKKt5rsHOOvgiksi8NKuEQeVcZ3vWR1arTLCXcNlfTli5cH71TNXlS
	N5aqIifIFp2wOr4JN7wv8I8FHPe0lG3x06PhkeDyn/zDx5aKzDrxXXZObQkwSCZkkLO8Pzes337
	VgzMqCIEaSZ9sPE2WhXQbpX/F1bykPPPi1F3zoWbXnVrlHkSVS8iGdUFGNNbsiMPIyLnPJt3Kij
	s0+LQWNKES36um7GlmUGmL7HuKlnd5YpFTw0hYP1CAk8BL41o7phOubwW/qLTSOBuYCQVus4jia
	/nMSaw7GAzVi1F57ZE6ZClEfsAEEe7TUEmnRrENqVsQfLP/3pGyVsKfts9mTbB76XQrZ5SCxAHL
	vXw31rtZEdxtDvF/VC/yqtI0Uxl82xu2DHY5InrYqfgsvjzO+xL/f6JF9b29L1hdWBonHkYoCIT
	HEeViXUQkRllCocP4jD3A9xsy2BKI4T25V4egZ14s5MdZnUeLuZ8bfTWTc42slr8Ifg3GXHo2+X
	TrOSLlg0Bl5O/cYZpxALMXRKq1ohZqZOJ/XvdV7cLAx33LEkpu7/0UcfR/EVyU=
X-Received: by 2002:a05:600c:58d3:b0:4a1:9388:7f40 with SMTP id 5b1f17b1804b1-4a193888295mr235604665e9.4.1792054691754;
        Thu, 15 Oct 2026 01:58:11 -0700 (PDT)
Message-ID: <310eb5cc-cf04-42df-9005-84f1e3496156@suse.com>
Date: Thu, 15 Oct 2026 10:58:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/atomic: Fix UB on various atomic helpers
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
References: <20261014133551.622462-1-alejandro.garciavallejo@amd.com>
 <bfc959d3-fa71-4296-a984-4af85edaf770@suse.com>
 <DM4O9C5SOTWE.2DFLIY2LI9TQQ@amd.com>
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
In-Reply-To: <DM4O9C5SOTWE.2DFLIY2LI9TQQ@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-bad1c0/1792054692-3AAD8034-BD1AC574/10/78276251493
X-purgate-type: spam
X-purgate-size: 1885

On 14.10.2026 17:38, Alejandro Vallejo wrote:
> On Wed Oct 14, 2026 at 4:33 PM CEST, Jan Beulich wrote:
>> On 14.10.2026 15:35, Alejandro Vallejo wrote:
>>> --- a/xen/arch/x86/include/asm/atomic.h
>>> +++ b/xen/arch/x86/include/asm/atomic.h
>>> @@ -122,7 +122,7 @@ static inline void atomic_add(int i, atomic_t *v)
>>>  
>>>  static inline int atomic_add_return(int i, atomic_t *v)
>>>  {
>>> -    return i + arch_fetch_and_add(&v->counter, i);
>>> +    return (unsigned int)i + arch_fetch_and_add(&v->counter, i);
>>>  }
>>
>> I'm concerned seeing this kind of change: It's merely papering over an
>> issue in the caller. There's not going to be UB if the caller passes
>> suitable values. And the atomic types hardly are meant to be used in
>> contexts where overflow could occur.
>>
>> Furthermore different parts of the C spec say different things here [1],
>> [2]. Hence whether overflow in signed calculations is undefined or
>> implementation-defined doesn't become entirely clear, according to my
>> reading.
> 
> I won't dwell on interpreting the standard, because I only care how
> GCC and Clang developers interpreted it; and that's a hard trap on
> signed overflow with sanitisers enabled.
> 
> I can live without this patch (it's just paranoia), but thinking about
> it some more, perhaps we ought to pass -fno-strict-overflow, like Linux
> does, to the compiler. This brings forward post-C23 overflow semantics
> and removes this whole class of UB wholesale. Here and elsewhere.
> 
> Thoughts?

Doing so sounds dangerous for an existing code base, as in risking to hide
real issues. As said in the earlier reply, atomic_t uses very likely are
intended to never overflow. If there were use cases, we may need to
introduce uatomic_t (the unsigned counterpart that you mentioned as an
option to _convert_ to), to be used there.

Jan

