Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14365C624D0
	for <xen-devel@archiver.kernel.org>; Wed,  2 Sep 2026 12:35:50 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1405813.1639261 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1kBn-0002hi-Lh; Wed, 02 Sep 2026 12:35:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1405813.1639261; Wed, 02 Sep 2026 12:35:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1kBn-0002hb-J4; Wed, 02 Sep 2026 12:35:39 +0000
Received: by outflank-mailman (input) for mailman id 1405813;
 Wed, 02 Sep 2026 12:35:38 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x1kBm-0002hU-2Y
 for xen-devel@lists.xenproject.org; Wed, 02 Sep 2026 12:35:38 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x1kBl-00FB8g-Bk
 for xen-devel@lists.xenproject.org; Wed, 02 Sep 2026 14:35:37 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a981815-e002-0a2a0a5209dd-0a2a4505ea34-10
 for <xen-devel@lists.xenproject.org>; Wed, 02 Sep 2026 14:35:37 +0200
Received: from [209.85.128.44] (helo=mail-wm1-f44.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a981819-4cb1-0a2a45050019-d155802ce110-3
 for <xen-devel@lists.xenproject.org>; Wed, 02 Sep 2026 14:35:37 +0200
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-49cd9add88aso6191785e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 02 Sep 2026 05:35:37 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48448e7315bsm6326896f8f.7.2026.09.02.05.35.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Sep 2026 05:35:35 -0700 (PDT)
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
        d=suse.com; s=google; t=1788352536; x=1788957336; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0ulDrxF237n8zka1LHEyq3hqJNDaanyFzVSvEb6TOjc=;
        b=YCFcdhIb5D+a7bZjEfAfgMU2dQUIcIpEdjXfYItUycB1RNjPv/kYMzXAczuczuid7p
         KF4MzYmWhwmB2INpqrqt9oBLEOT3kx+bPTIltHE3e4lqBL94gJhjtR5GAjTVZo/HOr5I
         XpeB0djt3Fg1G+6P2DCXfNvdrMyHtbAeWWs9n1pIRVBoXNMbgkQ7cmqCxaED/9c3fBCw
         QM0BXXwdYf1jUeG+OkBCpxwfiXkwzsgWlHM7zAOCrmHEHtdLP4IIp1TwYgIqj7vSMfxd
         Alp3UApMr/E1An3x17F25QxGX9hHXOIZojddHRUCs5MAaaMgXZpUO5vcWrcVpC/tjw6c
         Wfog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788352536; x=1788957336;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0ulDrxF237n8zka1LHEyq3hqJNDaanyFzVSvEb6TOjc=;
        b=soZ0sMnf23BFlI1/74Lu9y2DX+lA7jrL3LcfSZz5RFsBypEYgGHewZpiF5DdlygHNu
         mqoBt7ZZH+5UsndkNqYhGSrFHtMkDZeQxTXOVcJUGwfNVh5JhegGf7W9L3iBpj4qmVOQ
         u/W7SNEZAfLxoWMxvYArf9iSR5UIDtpjFzaUZN8EgLiduITuL1KkGX/Xafzj7kueD9ad
         wHlyXr7+S3z4u1of03jG3+mfM4CxfpnKHywcJT8L9IFrPmTJ51+V24/N4l5pj9SEXU68
         JAQpA9iMHyXcIjqqYxVmoFo3FK2W78Fu4Sf9ZQ/rKy+4QU3Yj3PKuaXxkrj79fgj3huJ
         8n6Q==
X-Forwarded-Encrypted: i=1; AHgh+Rob8IlfdhR6aMapwS4UhQo/ueheuOMVqGmO2/z8fp7ANVVDwRszKxa8FyIEYNBa2wImgaJTFFlfmzY=@lists.xenproject.org
X-Gm-Message-State: AFuF++nW7jziuO1kZ3OH36EuzUXDq3fwHbxQ7JkwWoxAYiK5MXJBNTKS
	p+bId6TA/EWeCU8jCb7T9ZlZvUnhoHcZZtle3NcqbdBR47Nvd3nNdMzV2XMddoLzC5dDqd6DM34
	+QLTV7A==
X-Gm-Gg: AR+sD11m+xDaaTxePrSIpiy7wjfKmckHengJG2v6inT+R7uok71AVKN8P+cjjW1N7iu
	MkSqYj5uUyeFKwYxJ2X6viVW0SckXryI79n/EzjkNT/91RQp7EmTTu4gBfJ5lnF5b+hx6aCLEk8
	q7eNkd27SdI16cgWaGLGwFPcMUjX17ENqmwjMUDyCCrnlSd3S/dOSFKhbd+LSLDN44ZuB2v1U9u
	f24ZwhxjaQkNy17dy2vXu1n9Tdc9FqI0XR2qUKAgn/wypTfjeEU8uzsvXz3OPQXqvotB7uSIsL3
	s7SQ56cep7avvUeiX0dTgod83zg7X9oc8nvzXOQJ2RCwzDAkjvWtAZZyAH4MJQwf0u42kuDYzGq
	DVV3Xd1zvdJgIAsdwUJCaLIig4Akc2JUTp05oITbd6sfcsSNL/7zVhSRElivOlOlWIpktCpp6fn
	Ar4CR0OMMBVhMIn8KqQoZVSpwY08E8Z1KiY8t65ScAzLiTXVLfbevJga6Fyc4a8xSmSi2st27Fw
	4LHcNSPkAujk38qsC+AV3IMRRKXIn4/yqx8XYKTdsUEy+x+OVqV
X-Received: by 2002:a7b:ca42:0:b0:49b:92df:87be with SMTP id 5b1f17b1804b1-49ce55fbdbemr54857245e9.4.1788352536571;
        Wed, 02 Sep 2026 05:35:36 -0700 (PDT)
Message-ID: <3269b251-f5ae-4ee5-88fc-642c93ae5170@suse.com>
Date: Wed, 2 Sep 2026 14:35:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/14] Arm/alternative: hide casting away of const
To: "Orzel, Michal" <michal.orzel@amd.com>
Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>, Julien Grall
 <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <0ff5676d-2ad3-49e3-a94b-90e7c3edb55f@suse.com>
 <6b3a3849-304f-423b-a3c3-a614d83858c0@suse.com>
 <f4b94f5a-d78f-4cad-9165-a92bc8111da5@amd.com>
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
In-Reply-To: <f4b94f5a-d78f-4cad-9165-a92bc8111da5@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c201ff/1788352537-251182A1-DADF08C2/0/0
X-purgate-type: clean
X-purgate-size: 979

On 02.09.2026 13:47, Orzel, Michal wrote:
> On 02-Sep-26 08:32, Jan Beulich wrote:
>> We want to patch the original call site, which memory-wise is unrelated
>> to the struct alt_instr * that we start from.
>>
>> No functional change intended.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>
>> --- a/xen/arch/arm/alternative.c
>> +++ b/xen/arch/arm/alternative.c
>> @@ -134,7 +134,7 @@ static int __apply_alternatives(const st
>>              BUG_ON(alt->repl_len != alt->orig_len);
>>  
>>          origptr = ALT_ORIG_PTR(alt);
>> -        updptr = (void *)origptr + update_offset;
>> +        updptr = (void *)(long)origptr + update_offset;
> NIT: Why long and not unsigned long like other places in this file?

Hmm, that was inherited from "x86/altcall: hide casting away of const",
yet apparently wrongly so: update_offset is of unsigned type here. I've
switched locally.

> Reviewed-by: Michal Orzel <michal.orzel@amd.com>

Thanks.

Jan

