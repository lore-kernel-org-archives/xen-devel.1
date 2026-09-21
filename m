Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C336CC982EE
	for <xen-devel@archiver.kernel.org>; Mon, 21 Sep 2026 12:16:08 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1427410.1650108 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8cw5-0005b3-Lm; Mon, 21 Sep 2026 12:15:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1427410.1650108; Mon, 21 Sep 2026 12:15:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8cw5-0005aw-HS; Mon, 21 Sep 2026 12:15:53 +0000
Received: by outflank-mailman (input) for mailman id 1427410;
 Mon, 21 Sep 2026 12:15:52 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x8cw4-0005aq-8P
 for xen-devel@lists.xenproject.org; Mon, 21 Sep 2026 12:15:52 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x8cw3-002G81-LV
 for xen-devel@lists.xenproject.org; Mon, 21 Sep 2026 14:15:51 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ab11ff5-e002-0a2a0a5209dd-0a2a4503cc42-10
 for <xen-devel@lists.xenproject.org>; Mon, 21 Sep 2026 14:15:51 +0200
Received: from [74.125.225.76] (helo=mail-wr2-f12.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ab11ff7-fae8-0a2a45030019-4a7de14c858c-3
 for <xen-devel@lists.xenproject.org>; Mon, 21 Sep 2026 14:15:51 +0200
Received: by mail-wr2-f12.google.com with SMTP id
 ffacd0b85a97d-484366874b0so1675841f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 21 Sep 2026 05:15:51 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48854e5a2c1sm15791661f8f.34.2026.09.21.05.15.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Sep 2026 05:15:50 -0700 (PDT)
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
        d=suse.com; s=google; t=1789992951; x=1790597751; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+/dM4Ux0dkSickL/pOo7+kU1nYl1BV/rrNnYgFUfD74=;
        b=SYNipcO617gaChA9SYbQdZ3ApwhLet5/QxBwmnBd4CkDDitPh9db/1rI1qnuSQuoqe
         /Msjh6pYvS4SExakRNxTcGsNY0hu6BuVFjUH/fpo/NGXgds3FO2GH7mBYOOHJSpJIHD6
         +repXHQU7jKudQ9wTtxWKEDRK0wBQlskiatdEESE7Ppft4DNDbUv+vByUYrRo3JGkei1
         VSOy9nUSQHn7dqFy/Zi8GjoxMTlwNrZDTbr8P26ASrSEs55yYjuG1CnK2T/dQursIjuR
         xVdhq/G+p80Ob8rga/MeABjoT6SWSBXI6Q5KnsvKf5ZJCXJv57PrplAtKmMLv/H0tASL
         DZiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789992951; x=1790597751;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+/dM4Ux0dkSickL/pOo7+kU1nYl1BV/rrNnYgFUfD74=;
        b=t18suZcUY59dQTRLsjhOpFM0EpcdwxD9tfx+jab0WtvZ8DPS8FocRW1QPQ1IwV6lB0
         oA+hQ9DcPNdERACMGzIUK8SGgQMM48DCv0Ko8NoZ19r9wQcs7AhJxqqLTRQsg+BH5WyR
         TXdSE5wRK5X5WCUyIV2ZfbW8jr7QJmY2+6H9MoxuIv2RArm2p4IwBOunCzqS3QdYUv5D
         Zr/2UEfVWsTJVN2UYvybknDuP40xX4t0wVCpqUP8lVL1JYaANzA2dKR8EfmqqpuEOrO3
         tMw3M2LT5VAp6xetjQ0EkJ3TRLrPPkqo78zKX54ybBSIgXXHvWZCeCRj4wb0eUBya5fb
         7kew==
X-Gm-Message-State: AFuF++mBmM5CN9z+bBMn6xEoFj5yxuPM5QgzW6J8ZrMHwCDEz9qUgz00
	DdHy0oAx0716CgfE5CeoUM1h5geroJLJ8cz6Z3jHk4FbPvYNLon1IpdYHEO9b4eogw==
X-Gm-Gg: AYBFou1hDLvNAaou5h7pB2R4i0YTNCtz+zT/W5hwSiUm0bySzT7lYRRiFKDU9gW2PW8
	EAYRx8ZfGZEPtuweiSeFyZ8ToStMOq8fO8k+R3PRvZPTPKm18ZlK2kEiOiY4icmDAJCB2BuFBdk
	9ZW/Ypu2+RWjXGL9y8GYdwXSUuzx/yZbglfKsuC5Cc2E4fKO2kWMq3N6Yvi4ju+q3tTgo04UeSx
	o/bS4hz89Y/efpRQ1cd8CuDcB5syByTKoRQSYgVWrOo7Me6wAs2MP/RyjIZF/r8AeA3JOYoNevy
	AIqEZ0K7rRJFSLRG9LxqIRWsgF0JwPufECAfS6qrL/hz4P5QqfBsrTnVUNMe3SnbKv7X/Xkz0rN
	l6OYcIQ3Y7Mzq4IY20RFVHTPOrL2XsCSWrNilXEHvuvHcpyoHfYkheYiU42Ota+vwOc6GIEVME3
	BwfNXszTi7gQ1T7l7IioXKeD+XvQoHrkF9u5jjJLS7QDDYzRLFxorjOTqKxZxx1y7qlNjWmtG0d
	TrBPJVJxfc+bHaIsyXbNePZ7CCyIiHzXtTij1znB+1AAUeenec1nb9N8MQ6dkQ=
X-Received: by 2002:a5d:64c6:0:b0:487:27f6:a4d4 with SMTP id ffacd0b85a97d-48727f6a6f2mr10176191f8f.36.1789992951024;
        Mon, 21 Sep 2026 05:15:51 -0700 (PDT)
Message-ID: <14f72d9b-56f8-49a4-9795-d8e25ae269cd@suse.com>
Date: Mon, 21 Sep 2026 14:15:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/14] Arm/guestcopy: deviate copy_guest() uses just like
 their x86 counterparts
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: xen-devel@lists.xenproject.org, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>
References: <0ff5676d-2ad3-49e3-a94b-90e7c3edb55f@suse.com>
 <a581e503-f1cc-4ae9-80ee-6b32653e8084@suse.com>
 <c3494c6086c6b49131e488ac5083cf9e@bugseng.com>
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
In-Reply-To: <c3494c6086c6b49131e488ac5083cf9e@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-33051d/1789992951-6E6CE4E9-7179B077/0/0
X-purgate-type: clean
X-purgate-size: 1106

On 21.09.2026 13:46, Nicola Vetrini wrote:
> On 2026-09-02 08:33, Jan Beulich wrote:
>> Like x86/HVM's __hvm_copy(), Arm's copy_guest() is used for both 
>> to-guest
>> and from-guest copying. Naturally in the latter case the hypervisor 
>> buffer
>> needs writing to, hence the function parameter cannot be 
>> pointer-to-const.
>>
>> No functional change intended.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Reviewed-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

Thanks.

> See comment below, but I can do as a follow-up if you'd like.
> 
>> ---
>> Of course for both the pre-existing x86 deviation and the new Arm one 
>> it
>> might be more robust if the deviation was also limited to the 
>> respective
>> source file. Can this be expressed together with the needed regex?
> 
> Yes, e.g.
> 
> -config=MC3A2.R11.8,reports+={safe,"any_area(any_loc(file(^xen/arch/arm/...$)&&text(^.*copy_guest.*COPY_to_guest 
> doesn't modify.*$)))"}
> 
> not compile-tested, so YMMV.

Yes, please make this a follow-up, then also covering the x86 counterpart.

Jan

