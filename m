Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74140606A32A
	for <xen-devel@archiver.kernel.org>; Mon, 16 Nov 2026 10:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=bVE1knFf
Received: from list by lists.xenproject.org with outflank-mailman.1490348.1691295 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xSuAv-0000Le-0j; Mon, 16 Nov 2026 10:43:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1490348.1691295; Mon, 16 Nov 2026 10:43:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xSuAu-0000LX-UP; Mon, 16 Nov 2026 10:43:00 +0000
Received: by outflank-mailman (input) for mailman id 1490348;
 Mon, 16 Nov 2026 10:42:59 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xSuAt-0000Kq-QM
 for xen-devel@lists.xenproject.org; Mon, 16 Nov 2026 10:42:59 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xSuAt-000FSf-6Z
 for xen-devel@lists.xenproject.org; Mon, 16 Nov 2026 11:42:59 +0100
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6afade2f-bab6-0a2a0a5309dd-0a2a4507d676-10
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2026 11:42:58 +0100
Received: from [209.85.128.48] (helo=mail-wm1-f48.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6afade32-b4ea-0a2a45070019-d1558030d116-3
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2026 11:42:58 +0100
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-4a214c5c4c0so32990235e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2026 02:42:58 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb4e252f7fsm385622505e9.2.2026.11.16.02.42.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Nov 2026 02:42:58 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:Autocrypt:Content-Language:References:Cc:To:From:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1794825778; x=1795430578; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=IMDIl7IvFSLH6ugmLYJHgGhkqfzt+9T+2QkVdjjrGVw=;
        b=bVE1knFf07Q7m+h2PUeEJuIGv7EvQ0BJqBWut/o+aM69l4nmolZRe7cNsxFp56s9mY
         ZtzFk14BiAxuoAHMlrafi6Jw7w9n+P6YxNsZ2SwiitjrCcVI9zxWf89kbyyLrfJq2RGs
         PTd93cEBH/JgxC3nycQitB683wN2SXeJaFFoNZAP/jjtquRhg78c0pwt3lHSH5V5bktm
         vUNchUGDfxk9RThNtv6AU86zVfrVV3RtfCbHpf44ROnvDQC+Q/aPyVq2ObHRXhoWlwNu
         eji6bEHKkmbM/RX/Mc1x6SLG6aYSqOxAgo65oLBCjK94Uy2DestRAVqDgTsl/Ych9UgB
         Ol8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794825778; x=1795430578;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=IMDIl7IvFSLH6ugmLYJHgGhkqfzt+9T+2QkVdjjrGVw=;
        b=aquybJpznFOLxGn5QbMOMPoo2Mh0F1+A57i5ajftKBDbGOfjnKBQCs/plyKH4rLKmS
         ot8EMlIR5YrneDPeRf6Ogbth8uh3jcnI9J3IsDcpRfvHpEAlXpynqO3BGJTAB3xDzig6
         CRMAHBT8mVTTyoo/ND4c1vWOW26toGoAAF0a2VLMSbLbfaKJ0Z01+z/8F1sUljkHmfKp
         4cPrUPFSboGmFHx/wOLZOS/wmJNF3Z6dtggI+uCMkxLNVeYYZLTVYvm3YiRTFhJT8DhZ
         WpuTS7LHLf00q86P7AmU4AF/7N4oViSazD9gCZLRsBCPWkJjee4LWIJ7G1tdzbpUz24y
         oAQw==
X-Forwarded-Encrypted: i=1; AL+hErFf7MPoqD/KIjFqkECqbiD1Xol8WM2DFeRI+Meuoo3i634Hti24vuq0ynuHSPk6Qaaqk7yJKGCgzZo=@lists.xenproject.org
X-Gm-Message-State: APuU4Z8IdErYyca+/uVuYPEZqRoXE7EMnVnhmLDsI2Iaa1OyYNEpMADw
	rZBAsuhHAdXPZ5MdNJl8xu/6uB+Y9jlTy/eYANNHVKYzZhhKjLC0Bd3IpvFTAj1I6i2h0/s8kPf
	U3tjsMQ==
X-Gm-Gg: AYBFou3A6Ygnb68YeKr4Y8KUeD9q04U2Loubp22i/AEEjJjsxB9Hcj6hd5z3CGSLeNl
	iB9VsjMoGHQqkKT1y+MBqzQzDQguGx8/pSJQKDJ5o2DyQmvTyD9KSafwtz/I+xEk+RbEPxq0HFX
	tma2xWmQ71JQ+QdcKsuYCmKjgqkArsz7aSGfAmIKdEBGoCzY1kTv3bokcWsBEkdlkoaKbtx3EOf
	zY7FUsMbFz5CagEacDFLqZzKZ0bGvEdHdtcA3Bu66CzsDXfyafVE+qRGsLuLsluJUoaUjpsXJpc
	UoYwgyJCgFw7JllmJi4Fhc2fbawTiJNCluBBh9nmYt0/l9U9wTg4V/QUUaWUSg+qlI1tDMrAfMF
	pqoMSk66mTF1NieVAiYdSHZEL3BjHGT4NKj/lyUMwvDq9znBt2hoNAyQHnaYqZkXbQpC+wKAw30
	36Hl0cwWY9rSNkM1HObcRp5wE9ylv4uG31+GdnR4QwgeDVAsPSsIEjA3BFv5NjX6lDVwScIMLzw
	jYOypPQs4Pa+l10N7py4S4oDpXxPdexP45fCeqWW8omtFeNQrGZw9FiRZ3lTSzj0oFAdKsUytdL
	YfOpM+P6Y/g8c0Ug0uym2hwnPDouOVg/T08xz35owXWtomOul3J4P4v4s1iO+C5colCcm6lZrfO
	1zvasvktXkRone6iz
X-Received: by 2002:a05:600c:1daa:b0:4a1:9663:7633 with SMTP id 5b1f17b1804b1-4bb55a47625mr212609765e9.11.1794825778394;
        Mon, 16 Nov 2026 02:42:58 -0800 (PST)
Message-ID: <500d7369-bc32-4745-a83d-e6b0ba50239b@suse.com>
Date: Mon, 16 Nov 2026 11:42:57 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/4] x86: prefer shadow stack for producing call traces
From: Jan Beulich <jbeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Teddy Astie <teddy.astie@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <d0de0425-a0fd-4ced-9768-ff102b953a22@suse.com>
 <bfec463b-a4dd-4a4a-bafb-c596f83630a1@suse.com>
 <f9ffba74-3b4a-49a7-abaf-1c062993a531@citrix.com>
 <699227cb-3cc3-40d4-affd-8648e71aa9a4@suse.com>
Content-Language: en-US
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
In-Reply-To: <699227cb-3cc3-40d4-affd-8648e71aa9a4@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ef75cf/1794825778-356C2AE4-8B6E41DC/10/78276251493
X-purgate-type: spam
X-purgate-size: 2744
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 16.11.2026 11:32, Jan Beulich wrote:
> On 10.11.2026 14:15, Andrew Cooper wrote:
>> On 09/11/2026 1:09 pm, Jan Beulich wrote:
>>> +        for ( n = 0; (unsigned long)ptr & (PAGE_SIZE - sizeof(*ptr)); ++n )
>>> +        {
>>> +            unsigned long val = *ptr;
>>> +
>>> +            if ( is_active_kernel_text(val) || in_stub(val) )
>>> +            {
>>> +                /* Normal return address entry.  */
>>> +                printk("   [<%p>] C %pS\n", _p(val), _p(val));
>>> +                ++ptr;
>>> +            }
>>> +            else if ( !((val ^ (unsigned long)ptr) >>
>>> +                        (PAGE_SHIFT + STACK_ORDER)) )
>>> +            {
>>> +                if ( val & (sizeof(val) - 1) )
>>> +                {
>>> +                    /* Most likely a supervisor token. */
>>> +                    break;
>>> +                }
>>> +
>>> +                /*
>>> +                 * Ought to be a hypervisor interruption frame.  But don't
>>> +                 * (re)log the current frame's %rip.
>>> +                 */
>>> +                if ( n || ptr[1] != regs->rip )
>>> +                    printk("   [<%p>] E %pS\n", _p(ptr[1]), _p(ptr[1]));
>>
>> Ah - this n is the thing covering the fact that you didn't move to the
>> outer context originally.  Please do that and drop this.
> 
> Why would I duplicate the move-to-outer-context code (just below)? We may
> need to move between contexts more than once, after all.
> 
>> If we're going to start using E here, we should make the FRAME_POINTER
>> side match.
> 
> Perhaps, but not in this patch.
> 
>>   When printing something we've identified as a stub, we
>> ought to say "in stub" rather than leaving it as a raw number.
> 
> Can do, albeit like you said for the use of E above this then likely wants
> mirroring to normal frames as well, again not in this patch though. (At
> which point the #ifdef you complained about above would simply go away.)
> Will you be okay with
> 
>             if ( is_active_kernel_text(val) )
>             {
>                 /* Normal return address entry.  */
>                 printk("   [<%p>] C %pS\n", _p(val), _p(val));
>                 ++ptr;
>             }
>             else if ( in_stub(val) )
>             {
>                 /* Stub return address entry.  */
>                 printk("   [<%p>] C <stub>\n", _p(val));
>                 ++ptr;
>             }
>             else if ( ... )
> 
> ?

Hmm, something similar would then be needed for the E case as well. (In
fact the above should be extremely unlikely to take effect, as in the
middle of a stub there shouldn't normally occur anything other than
exceptions.)

Jan

