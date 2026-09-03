Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2859C624A4
	for <xen-devel@archiver.kernel.org>; Thu,  3 Sep 2026 07:36:10 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1406487.1639765 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x21zN-0008Jh-P0; Thu, 03 Sep 2026 07:36:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1406487.1639765; Thu, 03 Sep 2026 07:36:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x21zN-0008Ja-M3; Thu, 03 Sep 2026 07:36:01 +0000
Received: by outflank-mailman (input) for mailman id 1406487;
 Thu, 03 Sep 2026 07:36:00 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x21zM-0008JS-7A
 for xen-devel@lists.xenproject.org; Thu, 03 Sep 2026 07:36:00 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x21zL-001Oi7-K5
 for xen-devel@lists.xenproject.org; Thu, 03 Sep 2026 09:35:59 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a99235a-2eae-0a2a0a5409dd-0a2a4503dbfe-10
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2026 09:35:59 +0200
Received: from [209.85.221.46] (helo=mail-wr1-f46.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a99235f-fae8-0a2a45030019-d155dd2eb91b-3
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2026 09:35:59 +0200
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-484362f5c4aso2064535f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2026 00:35:59 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49cee3b0af8sm50660085e9.0.2026.09.03.00.35.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Sep 2026 00:35:58 -0700 (PDT)
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
        d=suse.com; s=google; t=1788420959; x=1789025759; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/AU8SzDIvkFSshla1OxAULChwrjiUZCrKjwpmU7v8hM=;
        b=NntvTifWgWVGbBHNePPZuXzt8okGt7jQr/mbArVisjTldvUaQ6TZyXl85m2hA7j31n
         G9kcf6hPEaRd5/VV2x0jHTKDuyPjSSF4l+aHvoWZi7uhAPrp+Sw0X1l82ZoCut00imjS
         8+Bk34RCdvQJFGnYIMm3l5/3m9WRXpXsiju5JuNRUaeE2mH9cdkbe4UioGn2CfQBmhY7
         X//PuXFqzAybZ1yuQKIbiP7V4OKMAxm3akXMTdQ5VntjUIDWNZ8UE8sPZtQ5Yh5Murm2
         9DY/GVGAJCvBEQtkxRPhtJHky5j4DvaYDcia9DWJgy/AzL3ahYrTZY90c/BoxdDgS+hg
         c9pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788420959; x=1789025759;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/AU8SzDIvkFSshla1OxAULChwrjiUZCrKjwpmU7v8hM=;
        b=rO5TU47n4rrbxSlCml2ls/vX3lDttCtNdJoAswDA4Y+LaEixOt9IJI2mBUzvJY7/ur
         9jJmhxZ2Q9mfxQXURL6RDEmjN2rgln1H/IEgZqmiTAHBlIcaCPGTNAnhhrLdJOcZ64Un
         T+Dao7NGxulQxR3wFOwsWkpjLz0FV3t2JPQArbA0/dA8njmwwg5sVSbREradaCd1gxOR
         iv65SHG0/cC1Nb54KksseT1EZh8fb17leDrkq742l/X9repvHdDq8cdlWwCkVKR26rvQ
         u2irEI5yICu5Lm5aUD4Ei3D3ruNO/JiWAFEhqLwtkctnvvmjYPLU4PkQqXDsWEDpVLzp
         1AQA==
X-Gm-Message-State: AFuF++lt28IeW+Fhn/jh7Xvo9XE07IuUcxem2RQVLeLyU2g3tUxvySot
	ClAbs4Hb1xCxNtFR4dP+L8+J9KYXcmfNUQpGLNAoltMeUyDV/Va71CVZUefKShGWYOVEaXTYQWm
	jPmhp7w==
X-Gm-Gg: AYBFou1CYTkmFg1pEgkZ7QazZy3MJ2u6mLvU/bGL04nDIJsb8Z3URFN06AoQiCITUYC
	EN0j+TtEyyeJ16lamv5HSsF5ZBBoDQ9FmKApfrHamEGjWUKa8JXbquyIF1JFFJdpeSn2PqCMLk/
	gROoVtseA2LR7c3jjByXDj4lQHxM9MDODaNW0HXh7bgmBGE1M4iRG5ni0EUvyl9rk2SKmZTUWrC
	3+T9VLQfxQla9OrgnNMDt3OAPJzYX63UpN6RhuN9PbEbRgu/S2ogItkQ+L6L/xj3N1R6q7T74OM
	ZyagdfoSw5fH8mhytGxqQ0GwXWUY5vLLzZwb4sBzeusId59GgTa1zb3CE2TwHt4amm8/b9U/h2V
	93MvjgYDnFzcwjcUEO71zhRrAO68L7DO3sDw/j1q6xO48jRAZW43tso0/w2ouPoe1jAoUeEhg8k
	2L6gbdHdCIBeYvnT1Tq06l1exmTRwJLxMqhpN8K+lIr4ZTA22JMSpkqgZkN/UV19M3Dg677yA9Z
	y9I7qRAewluVgeVFrksBcC6NFpsmbRT+DfkjBV2UjaAKXeTo/wAi1Ln3OQOwm9V
X-Received: by 2002:a05:600c:1d14:b0:499:b65e:49c9 with SMTP id 5b1f17b1804b1-49ce583e94cmr165699845e9.10.1788420958966;
        Thu, 03 Sep 2026 00:35:58 -0700 (PDT)
Message-ID: <0dffbc71-1822-4db7-a340-b7b9d0df6c6d@suse.com>
Date: Thu, 3 Sep 2026 09:35:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/7] Arm: split xen-syms linking rule
To: Anthony PERARD <anthony.perard@vates.tech>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>
References: <9a78fdea-08ba-4e04-bfa1-ba09730a300b@suse.com>
 <483052d4-b70e-4005-8b10-4ecf509bf40a@suse.com>
 <1788366735.8631fc262581453bbf619ec5b2062170.1a062f6c8bd000c4f3@vates.tech>
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
In-Reply-To: <1788366735.8631fc262581453bbf619ec5b2062170.1a062f6c8bd000c4f3@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-33051d/1788420959-76CF84E9-A679DFFC/0/0
X-purgate-type: clean
X-purgate-size: 1741

On 02.09.2026 18:32, Anthony PERARD wrote:
> On Wed, Aug 26, 2026 at 02:00:55PM +0200, Jan Beulich wrote:
>> Doing so, besides (hopefully) adding clarity (not the least by way of
>> [re-]using pattern rules where possible), also avoids explicit recursive
>> $(MAKE) invocations.
>>
>> By re-using the generic rules introduced when the respective x86 rule was
>> split,
>> - the .map file now isn't created after the final binary anymore,
>> - --strip-debug is passed to $(LD) during early linking passes (for
>>   consistency the option is also explicitly added to the optional linking
>>   pass rule),
>> - CONFIG_{SUPPRESS_DUPLICATE_SYMBOL_WARNINGS,ENFORCE_UNIQUE_SYMBOLS} are
>>   now properly respected.
>> Orphan section checking, otoh, is getting suppressed for now, until the
>> about a dozen warnings which would result have been taken care of.
>>
>> While the 4th linking step continues to be avoided when possible, a
>> redundant invocation of $(NM) and tools/symbols (plus the assembling of
>> the resulting .S file) is hopefully deemed acceptable.
> 
> So with this patch, if .xen-syms.1.o and .xen-syms.2.o are the same
> (compare-symbols-tables), we through away .xen-syms.2.o, and build
> .xen-syms.3.o from .xen-syms.1 (nm|symbols + as). I guess the resulting
> .xen-syms.3.o would be the same as .xen-syms.2.o,

Anything else would be a significant problem: nm, tools/symbols, and gas
would better produce the same output from the same input.

> so it's probably fine.
> 
> 
> I think this patch is fine, I didn't find other difference in command
> executed beside the one described in the patch description:
> 
> Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>

Thanks.

Jan

