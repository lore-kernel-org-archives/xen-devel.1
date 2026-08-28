Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E993C61DB9
	for <xen-devel@archiver.kernel.org>; Fri, 28 Aug 2026 09:22:29 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1401816.1637331 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzsmp-0004ce-32; Fri, 28 Aug 2026 09:22:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1401816.1637331; Fri, 28 Aug 2026 09:22:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzsmo-0004cX-VP; Fri, 28 Aug 2026 09:22:10 +0000
Received: by outflank-mailman (input) for mailman id 1401816;
 Fri, 28 Aug 2026 09:22:10 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wzsmo-0004aH-4t
 for xen-devel@lists.xenproject.org; Fri, 28 Aug 2026 09:22:10 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wzsmm-001WyR-Vc
 for xen-devel@lists.xenproject.org; Fri, 28 Aug 2026 11:22:08 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a91533c-2eae-0a2a0a5409dd-0a2a4504893e-18
 for <xen-devel@lists.xenproject.org>; Fri, 28 Aug 2026 11:22:08 +0200
Received: from [209.85.221.47] (helo=mail-wr1-f47.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a91533e-b57f-0a2a45040019-d155dd2fb4f7-3
 for <xen-devel@lists.xenproject.org>; Fri, 28 Aug 2026 11:22:06 +0200
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-482c58a8683so595198f8f.0
 for <xen-devel@lists.xenproject.org>; Fri, 28 Aug 2026 02:22:06 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-482fbb2005esm2531975f8f.24.2026.08.28.02.22.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Aug 2026 02:22:05 -0700 (PDT)
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
        d=suse.com; s=google; t=1787908926; x=1788513726; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J8x0DPP9PsuPB3T5rQ9y6Mu33wB98PnoVbClKkkZ+C0=;
        b=InfXA/c3m9fzVmh1SLGR1wJkKIU1rurYL18XbQNEjKWq+3WDET1UI1nCPaL+PxWzta
         8S5DPEAeuK0YjXXdmoEsUcfWwjhhmuKoazD3k4smG+Trc/6sDt9+FAOFgc7on8FoEG7N
         qwUYMDwWQp2EvVZISyzoe6u3fsW6Fi+NsdPECVVlIMtJw4tj433BkmyPZY7kFzoo3HUL
         l9oJaBSIVVCxeq1gK/ZhtrXeHatA//BYiIcJtRJSfS6EoVsVrBoSSmWJBY9CJ5f9Tdyd
         lfsc/II11L1k+If9L5Agoz9LJpJKtz8IDUX+SaxS5flAyQJH47T61RO70jE7pyyo2f8A
         2wIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787908926; x=1788513726;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J8x0DPP9PsuPB3T5rQ9y6Mu33wB98PnoVbClKkkZ+C0=;
        b=dFcP4afOL3Afi/0e9XKwsZ0WkrwCTnIxg1fu4E2/H5AhCK3OsLxaGj1TMQ0EJsSBqK
         kaSIXUXdSZfzEK/XZVx3PgNL2m1X+7QalLTtzOXaZ3bW1t/lILcBrmJ/1L4U4PpINQrn
         7hfq1zvokoaeWEeOmf53jYuQkNWQ0Yqj3pmgy6MagvL7MJu3DZ9N0qbI6neNArgUBu2X
         469fu6mH3PLIV97D5x8wKFIRa9HYdcOyOnGOH/NGEvKjL1Xeqo6K+TPjrpLghENrTwzo
         3QqXvzUPPwMrjPyztvPEXefUHTmCOd+/B7+PGe9g9bwphYWj0I8ntNIKs4eyvnaRC5GI
         CkqA==
X-Forwarded-Encrypted: i=1; AHgh+Rq9gIWNHjY2ESPNo7Zi96yM11K/hFc7mykpqyxm3VXwwhrVKtisXr3rwhyRmWTTjd86RF7fBQcMVU4=@lists.xenproject.org
X-Gm-Message-State: AFuF++lqSWJoeY0iceiK3x/wvJhBzNiU0X3T8D15qLT354VX3CV26kV8
	DclEYP0NMDy49A9Yvr3eTOaaeMnOA3p1rQrOwfLjqa9oOEL5lkJmFEvWFaniCI9+dA==
X-Gm-Gg: AR+sD11VdR6OjbirBmxPEyOALnc7p0u/zdtHpMGn01nFbVVNdhaQKy7PVJG6/bTkU7k
	fzUm/mFx37n8oN4c0MhKi4NGpHRGPjAq2qApk11OrjiPWqDZCaAk0UKoQYbwSRjTadi4doy56W+
	CmTASyClEIED1AfMD37QL2VMyWTm5IyF0dDb7qF5X9PbFqHYnZzCie4HVdrC8163+INcXYc+Rgs
	GcGsUVmVsxm9gBoz9nt/H0a2NQdDjxCBcWQLNvCdXOqEUoCMG2AO6hcwFjjcwUOXFk7gMT5Bisi
	Y6+hQfS3xMss7Dl7HUs9ULdfFvf8NS1hv8eGwmVErjWcZdzGAR8kA8AzCBw2ylS4Xgkmhq2lQUy
	Mlxl9VYFFXR6E+SXy7watw0k/xXSMOaF5k30e7Du6pGUo0iCWRGWk76UHbAxm1M9kM54YP8rorg
	eTubr/8UeY5dqqT+sWv1b8+A0B03QfIUOxq+jdeXHuhnoMrlYwGSVIDdvn0fm1Uh8NJjr7wom2u
	6jxCS3YppfTVx3WuHS9vOeaII58mEJiZuQmA0VuRanIt9dIEcBu/jSbWQN2PhY=
X-Received: by 2002:a05:6000:4701:b0:482:f930:9524 with SMTP id ffacd0b85a97d-482f9309980mr5744841f8f.10.1787908926230;
        Fri, 28 Aug 2026 02:22:06 -0700 (PDT)
Message-ID: <17c4ad74-6108-452d-923b-755fd37e4381@suse.com>
Date: Fri, 28 Aug 2026 11:22:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 8/9] hvm/ioreq: Negotiate extended destination ID
 support per ioreq server
To: Julian Vetter <julian.vetter@vates.tech>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
References: <20260427135406.1281424-1-julian.vetter@vates.tech>
 <1777298081.8631fc262581453bbf619ec5b2062170.19dcf3886cc000f373@vates.tech>
 <a9510f21-b7a8-4323-a64d-0f33e44cd8b0@suse.com>
 <1787907132.8631fc262581453bbf619ec5b2062170.1a04791cd47000c4f3@vates.tech>
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
In-Reply-To: <1787907132.8631fc262581453bbf619ec5b2062170.1a04791cd47000c4f3@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ebf023/1787908926-538C1B50-F8CD378D/0/0
X-purgate-type: clean
X-purgate-size: 3757

On 28.08.2026 10:52, Julian Vetter wrote:
> On 8/19/26 16:38, Jan Beulich wrote:
>> On 27.04.2026 15:54, Julian Vetter wrote:
>>> @@ -1106,7 +1107,16 @@ int arch_domain_soft_reset(struct domain *d)
>>>   void arch_domain_creation_finished(struct domain *d)
>>>   {
>>>       if ( is_hvm_domain(d) )
>>> +    {
>>> +        /*
>>> +         * Lock the extended destination ID state. OR preserves any value
>>> +         * already restored from an HVM save record (migration path). For a
>>> +         * fresh domain, ext_dest_id starts false and the dynamic check
>>> +         * supplies the levelled result across all registered ioreq servers.
>>> +         */
>>> +        d->arch.hvm.ext_dest_id |= hvm_ext_dest_id_enabled(d);
>>
>> For an unaware guest, after migration it'll suddenly get the flag set
>> if all servers are capable. That can't be right. It looks pretty much
>> unavoidable for the field to become tristate (unset / false / true).
> 
> Thank you Jan. You're right true/false is not enough, but there's one 
> migration case left where even a tristate doesn't give a clear answer, I 
> believe and I'd like your opinion on that.
> 
> Scenario: a domain is migrated (or saved/restored) from a Xen that 
> predates this series, onto a new Xen where every registered ioreq server 
> has XEN_DMOP_IOREQ_SERVER_EXT_DEST_ID set.
> 
> So, the incoming stream would not carry a EXT_DEST_ID record, so 
> ext_dest_id_load() never runs and the field would still be 
> EXT_DEST_ID_UNSET when arch_domain_creation_finished() runs on the 
> destination. The latch then takes the "fresh domain" path and recomputes 
> the levelled value, which here comes out ENABLED.

Well - I thought it was clear that by the time the domain is actually
launched, the 3rd ("unset") value would need resolving.

>  From that point Xen would interpret the extended destination ID bits 
> for this guest. But before the guest ran under a Xen that never 
> advertised XEN_HVM_CPUID_EXT_DEST_ID, so it never used those reserved 
> bits deliberately, but might have written garbage into them accidentaly.
> 
> I see two ways to handle this:
> 
> 1. Accept it. Document that migrating in from a pre-feature Xen onto an 
> all-opted-in host may turn the feature on, and might now treat non-zero 
> reserved bits as extended destionation ID bits.
> 2. Distinguish "fresh domain" from "restored without the record" and 
> force the latter to DISABLED. A feature-aware guest then picks the 
> feature up on its next reboot on the new host, which matches how every 
> other creation-time-levelled property behaves.

Imo 2 is the only viable option.

> The stream is parsed by Xen (the toolstack hands the HVM-context blob to 
> XEN_DOMCTL_sethvmcontext -> hvm_load()), so this stays entirely in the 
> hypervisor: add a 'bool context_loaded' to 'struct hvm_domain', set it 
> in the hvm_load(), and in the latch do
> 
> if ( d->arch.hvm.ext_dest_id == EXT_DEST_ID_UNSET )
>       d->arch.hvm.ext_dest_id =
>          (!d->arch.hvm.context_loaded && hvm_ext_dest_id_enabled(d))
>          ? EXT_DEST_ID_ENABLED : EXT_DEST_ID_DISABLED;
> 
> This would mean one new bool in 'struct hvm_domain' which covers both 
> live migration and xl restore of an old image. What do you think? Would 
> this be acceptable?

I don't quite get why that's better than converting the boolean to a
tristate.

Also may I please remind you again to trim your replies? Below here,
for example, there was only reply quoting. That serves no purpose in
your reply. Yet I still needed to scroll through all of it to see
whether there was some other comment of yours. And every other reader
likely will also end up doing so.

Jan

