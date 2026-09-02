Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFC6FC61DFD
	for <xen-devel@archiver.kernel.org>; Wed,  2 Sep 2026 09:20:36 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1405415.1638909 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1h8l-00063n-DE; Wed, 02 Sep 2026 09:20:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1405415.1638909; Wed, 02 Sep 2026 09:20:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1h8l-00063g-Ai; Wed, 02 Sep 2026 09:20:19 +0000
Received: by outflank-mailman (input) for mailman id 1405415;
 Wed, 02 Sep 2026 09:20:18 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x1h8k-00063a-AN
 for xen-devel@lists.xenproject.org; Wed, 02 Sep 2026 09:20:18 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x1h8j-00FxsO-NN
 for xen-devel@lists.xenproject.org; Wed, 02 Sep 2026 11:20:17 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a97ea49-8faa-0a2a0a5109dd-0a2a450aa3e2-28
 for <xen-devel@lists.xenproject.org>; Wed, 02 Sep 2026 11:20:17 +0200
Received: from [209.85.128.42] (helo=mail-wm1-f42.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a97ea51-f2d2-0a2a450a0019-d155802abca9-3
 for <xen-devel@lists.xenproject.org>; Wed, 02 Sep 2026 11:20:17 +0200
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-4921eed3fa2so7111795e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 02 Sep 2026 02:20:17 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49ce4776131sm61402465e9.11.2026.09.02.02.20.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Sep 2026 02:20:16 -0700 (PDT)
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
        d=suse.com; s=google; t=1788340817; x=1788945617; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BcSdzFWN5hy7t+0qz12q73oRPE9SgY3maDTcQf5uGqU=;
        b=JWPaSdRbWuQd+iEFbNgtO3GPoBtud7Zn1jwFqoVqenyB92L/NLJBsklcSpI27s7gqD
         +rbWEthwPLe9gKJJ3L+78BZxJzgUbT4nQa5TFhP5gVwbbHLEX674v6+f1/JXRAlxaWJz
         QDdtT73NJJmKeGgWIvBVeP1ymczHX790Mxqfz7R5fM6L/QrHxnxe3nx+y+EdkoqLYf3y
         HSpYY/ym+vePQpkIXwTZ8avOzVxTVVGlXpB64GqEBOwShjoaHf1sh2w9AzuV8cq2JVeI
         g4FmDN2UjC7hgSl5YzDo2GiGxWO3WofRKCBjHprWZMGv4Dzq2Zb9SWs7zPi7nmK186hq
         ROUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788340817; x=1788945617;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BcSdzFWN5hy7t+0qz12q73oRPE9SgY3maDTcQf5uGqU=;
        b=mD/mzKmNnwgXq7OwjTvgK9+4RiZ5/LsbU4DbiizB6r9WLV0K8TZe5w0ZHHNl8gPtfo
         N1+yqxVQc9z46FYdREHg7vCUt/YhAopVqGMa5Nwjadla8l7NOoSgRBRTsokmmWa1QPol
         X4qQrfCt/Kn9FTTW+QpxeZxW9MR28tSZQ9TT9VC+huzOeMgqT5hLsFgtebhtmSf2/5nz
         lzp+hfoxWWtPI7falU3YMXtp54H8WNDz7TYRNSy+n7rECo2dS6ysH4kdLMBogELssPUG
         P20sKSluRiCDzFz2YFMVX6qPg5PtRK5kQf9FWYglAjvxDXab43sNKd5ZcuhWN2/qXOQF
         FnHA==
X-Gm-Message-State: AFuF++nRafpql8gQojRppYOJnDAwv5W0IhBG8UF5PCi3/Y23DL56deLj
	N/O8A3nJEs5FsI5ID6rQ/g6WsL1K1iif3s0ZwOkK2TYv+IGxygjF1dVDe1p1JeDRFEA+AZGwnbr
	+OOfKJQ==
X-Gm-Gg: AR+sD11cjD1D2yoqx7V02Z2jgvnQpfZz6YJLQMggZSzgknq/qNZlfh3m8uvMEHvhL5R
	VE7PeSWuFUvi8vdUm6LPtSKdIoGoCnYEpontEgYuoxMFEcKz165T4MRTVr6+ub0D1PJY+awLLCM
	+AwNro75eNYtTJvIK5womxnzzcWC5zJ0iasXdedP+jDrVUfdEXCXtg71qrZtFDPt2EQpXc8glGO
	aQTuBaD4UcF9VylZ6oIRbgi+jGLVbSJURzwSGMlwEfgeyZYWc9G9pwkNJgWWJ0rTg5W4gf6tjuW
	KCyy0nU5zTs43VRnyE2SKulBMrq9ZGe1TmjoLFsy/WlowNipXd9OkQpgVq6ZlI//Dc87z1BveOA
	c8pCPskaE/FL4+DxwyVESE6O/WmRnCgBkmzbOwdRCSZWc1Es+vPMN91cHNNOtOvhnQvbi5qSNVw
	Y3cfAccWEffvt8n5DwnbIq/xjeoK7+um6YCrWpVkkyPM+Og//53OoYUrr4/vYETPc3xLe738slW
	iSfq5gcx7EWvl9Yb4ram84/6/gPg+KapVyJJkkT1+1lvLvq/Jdj
X-Received: by 2002:a05:600c:45c4:b0:49c:e1df:79a4 with SMTP id 5b1f17b1804b1-49ce57fdd1emr58575165e9.5.1788340816846;
        Wed, 02 Sep 2026 02:20:16 -0700 (PDT)
Message-ID: <d3f8da73-b556-4f1d-9c89-3f3fd5bfab7a@suse.com>
Date: Wed, 2 Sep 2026 11:20:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] x86/vRTC: support century field
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>
References: <apfZSRg6Ee7V2mDB@macbook.local>
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
In-Reply-To: <apfZSRg6Ee7V2mDB@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-4011c0/1788340817-587CACFC-1E6F2BDB/0/0
X-purgate-type: clean
X-purgate-size: 4179

On 02.09.2026 10:07, Roger Pau Monné wrote:
> On Thu, Jul 02, 2026 at 11:31:14AM +0200, Jan Beulich wrote:
>> Both ROMBIOS and SeaBIOS (with CONFIG_QEMU=y, as we build it) blindly
>> assume availability of this field (at its conventional index 0x32); OVMF
>> at least has code to inspect FADT. Hence we ought to have supported it
>> virtually forever.
>>
>> As the index is beyond RTC_CMOS_SIZE, leverage the padding field in
>> struct hvm_hw_rtc to hold its value. Update the field only when involved
>> values are valid BCD century specifiers. Otherwise (for VMs migrated in
>> from an older hypervisor) leave handling to the DM.
>>
>> This makes the Linux rtc-cmos driver report y3k compatibility.
>>
>> In the new rtc_check(), besides checking the new fields also check the
>> pre-existing pad0 field.
>>
>> While extending xen-hvmctx.c:dump_rtc() also add RTC offset there.
>>
>> Fixes: 4ca161214355 ("[HVM] Move RTC emulation into the hypervisor")
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Acked-by: Roger Pau Monné <roger@xenproject.org>

Thanks.

>> Now that we extend struct hvm_hw_rtc, should we perhaps save not only the
>> century, but also its index?
> 
> Hm, possibly for correctness, albeit I think this is unlikely to cause
> issues.  Likely better done in a separate patch?

Possibly. Just that then we need to deal with two different cases of
backwards compatibility. (Not that I think that doing so would be overly
difficult, but still.)

>> Likely more sanity checking could be added to rtc_check(), but that's for
>> a separate patch imo.
>>
>> Isn't day-of-week handling flawed? If the field is brought out of sync
>> with the other values, shouldn't it stay respectively out-of-sync?
> 
> I don't know that much about the RTC TBH.
> 
>> And
>> isn't it excessive overhead to go through rtc_set_time() when the field
>> is updated while SET is clear?
> 
> I think this is done because we don't call rtc_set_time() when RTC_SET
> is activated in RTC_REG_B?  We would need to change the logic a bit.

I think you may have overlooked that my question was just for the day-of-
week field. When that field is changed, rtc_set_time() will call mktime(),
update_domain_wallclock_time(), and send_timeoffset_req() despite the
change not having any effect on the values used/calculated there. The only
actual change in that case is to s->current_tm.tm_wday.

> Is there a reason to propagate the changes to the DM even when SET is
> not active?

How does a DM come into play here? It's only accesses to non-time fields
of the CMOS which we forward to the DM.

>> @@ -760,6 +795,32 @@ static int cf_check rtc_save(struct vcpu
>>      return rc;
>>  }
>>  
>> +static int cf_check rtc_check(const struct domain *d, hvm_domain_context_t *h)
>> +{
>> +    const struct hvm_save_descriptor *desc =
>> +        (const struct hvm_save_descriptor *)&h->data[h->cur];
>> +    struct hvm_hw_rtc s;
>> +
>> +    if ( !has_vrtc(d) )
>> +        return -ENODEV;
>> +
>> +    if ( hvm_load_entry_zeroextend(RTC, h, &s) != 0 )
>> +        return -ENODATA;
>> +
>> +    if ( s.pad0 )
>> +        return -EINVAL;
>> +
>> +    for ( unsigned int i = 0; i < ARRAY_SIZE(s.pad1); ++i )
>> +        if ( s.pad1[i] )
>> +            return -EINVAL;
>> +
>> +    if ( desc->length >= endof_field(struct hvm_hw_rtc, century) &&
>> +         ((s.century & 0xf) >= 10 || (s.century >> 4) >= 10) )
>> +        return -EINVAL;
> 
> It would be nice to also set ->has_century here, but the s struct is
> a temporary stack allocation.

And deliberately so, as .check() hooks shouldn't alter state. (Hence
also why const struct domain * is passed in.)

>> @@ -793,12 +854,18 @@ static int cf_check rtc_load(struct doma
>>      check_update_timer(s);
>>      alarm_timer_update(s);
>>  
>> +    if ( !s->hw.century )
>> +    {
>> +        s->has_century = false;
>> +        s->hw.century = 0;
> 
> Isn't this last line pointless?  The if condition is !s->hw.century,
> and hence s->hw.century must be 0 here?

Oh, yes - insufficient pruning after the v2 adjustments.

Jan

