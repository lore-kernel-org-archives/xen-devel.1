Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 266EDC5B56A
	for <xen-devel@archiver.kernel.org>; Wed, 12 Aug 2026 13:44:00 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1389085.1630012 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wu9FF-0000w3-Ip; Wed, 12 Aug 2026 13:43:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1389085.1630012; Wed, 12 Aug 2026 13:43:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wu9FF-0000vw-GA; Wed, 12 Aug 2026 13:43:49 +0000
Received: by outflank-mailman (input) for mailman id 1389085;
 Wed, 12 Aug 2026 13:43:48 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wu9FD-0000vq-Rx
 for xen-devel@lists.xenproject.org; Wed, 12 Aug 2026 13:43:47 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wu9FD-006LHw-8p
 for xen-devel@lists.xenproject.org; Wed, 12 Aug 2026 15:43:47 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a7c788c-2eae-0a2a0a5409dd-0a2a4504bc7a-8
 for <xen-devel@lists.xenproject.org>; Wed, 12 Aug 2026 15:43:47 +0200
Received: from [209.85.221.50] (helo=mail-wr1-f50.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a7c7892-b57f-0a2a45040019-d155dd32c515-3
 for <xen-devel@lists.xenproject.org>; Wed, 12 Aug 2026 15:43:47 +0200
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-47fe2d179e2so552589f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 12 Aug 2026 06:43:47 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48150bf5f27sm7281740f8f.1.2026.08.12.06.43.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Aug 2026 06:43:46 -0700 (PDT)
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
        d=suse.com; s=google; t=1786542226; x=1787147026; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M+i8+ViEsC5vpwz0JKveI/HXy+OJAib0U0kJsEmdazc=;
        b=HWnuaQ5NHk3l+zMkl1NybQxuchlBrlgCNEi1EqzWSpEDF4as6tnc86LbuxX9gL5M6U
         i6cjhZYs6XU5Jcb+EVqrKeaHQIBozT1Ce5kod/7fGxzJm9zXaEyjGI2H3G5EK0ycX8oh
         URB45ZapAEUs/m1DqJn/N4vXk76Bl2q3AsN9o9SfSx4Yf1CcKtuKElUNR8yDWbKIHwxp
         A9J7Yc2X8gL0qS7yAnMAGvhhlGdzO6G1U5CMpwfbSjBev1iH2ltJppvjLQNpmvhVLPPm
         jb8jEzXjGyFZjjWWObPKA7i+5Mc3A5dVFLlwBQ403wdlrHXIiPs0rE7DND0TXrVYLelx
         BjXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786542226; x=1787147026;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M+i8+ViEsC5vpwz0JKveI/HXy+OJAib0U0kJsEmdazc=;
        b=POIDKvqQuORTzfkM7Q0pFCm+NWa9jX1+vmxay0UbF9gQEB4qZHflYsFbYeC90N9Q0Q
         xo1P1SLQn/rnOnIAwRpUz4E2p1E5M4MmwcG/45a3MbvTuplews3OeUF3G20r9nQ83zJv
         DuOiNE880hAMyg4Q1/hE0Q03TXsJt2Kfvu2kcrV/liY13Pq0LShP4RZ/oxrOy91Hc5Ii
         yhQUaPdya2onuTmWnGHQzIftCOcF/fGjFliMRxLI+ZX4aQmTsTVbznZFClylaNaNaikQ
         IKYAajITNH2oKWodQYYGQ5u6+w/7J57zgvj7KEia1UxTI518IjEu++FH4KtwMDVgH5UQ
         FgVw==
X-Forwarded-Encrypted: i=1; AHgh+RqGj58DjeEP5uoQSf+82h9oYyploxxZVkgWRlsDr34OC4XfZHHsprpZcApbaJgv0op6IRJThZcDSgI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxeDcqsqi8xLT9sN5pidPBoaqooLdgAN8h+InhsZV5vVp2r1i2t
	pAqI7Rly4CMixAbEo9Iaughca7+aZ8sBOKr4b5PmKMW1UeOVNN7mb7ZcPafv7INcRw==
X-Gm-Gg: AR+sD13Q/1hF7NRwP+USiwK2siudfvKlsl7383Z9ZQbwUqyKEBRYiG9gEfPYIsSk1xd
	byXYeEhuoRLu64sSD3vNZJfmFgjEQRBsKwqHYBAizp0Di1lvhrbXsI/xuucBBtbE2JRCod5FmvH
	JBtzwhCbX5zHiuO78SRBxcAmn2CDwbDiklDn+DrRlWrRUpp53eryf26upMzLnpw6f3Lj7zg707j
	5X8xAq6jE6zvwTEYVYnZMGUxEYLyW8pxQaQOnOYnEAuegis04Hh3/Fz3NAHFlqMpWv6YGP48Z3g
	k00MFHywmYMF1docBdIYMLt0cdJGOUWbX852yLhed58TfGjV0UiSKhmTER8MvpYGsgKNqxWUzkf
	Q2KwZYDx3PlSFhMlIIx2y+PmJlb9xxrPLbVhrg7B+jcosEP61Abbt7d+JDS+SprtK3LsMEflDRo
	NKV7bqCBJl361V7uxLetpZqo789zeoVB13Ny8Bgf3O9XMsdedhs0NbEhRoTWyG7jVG3o7KKc8Rv
	6atYV/fHO5WOwiFx+kXDY0t+EVAxnytja4VKoaH9gVk0yl5K0JB
X-Received: by 2002:a05:6000:40cb:b0:45e:e1a4:c4c3 with SMTP id ffacd0b85a97d-48152913c78mr7454500f8f.15.1786542226601;
        Wed, 12 Aug 2026 06:43:46 -0700 (PDT)
Message-ID: <81cdb854-54ac-440b-9459-68f5b61cfe41@suse.com>
Date: Wed, 12 Aug 2026 15:43:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] x86: reduce dependencies on x86_emulate/x86_emulate.h
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Teddy Astie <teddy.astie@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <f6f7eded-b6a3-49b4-8c68-38d263c3b58e@suse.com>
 <652379aa-dce2-4891-96c6-f9785cb19318@citrix.com>
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
In-Reply-To: <652379aa-dce2-4891-96c6-f9785cb19318@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ebf023/1786542227-52AC8B50-175D19D0/0/0
X-purgate-type: clean
X-purgate-size: 1934

On 12.08.2026 15:39, Andrew Cooper wrote:
> On 12/08/2026 2:24 pm, Jan Beulich wrote:
>> Split out struct x86_event to an entirely separate header, and move a few
>> other items describing the architecture to a new x86-types.h. With a few
>> forward decls of structures and with a fair number of new #include-s in
>> .c files, the inclusion of x86_emulate.h (and hence
>> x86_emulate/x86_emulate.h) can be dropped from all header files except
>> hvm/emulate.h; it needs additionally adding to hvm/ioreq.h though.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

Thanks.

>> --- /dev/null
>> +++ b/xen/arch/x86/include/asm/x86-event.h
>> @@ -0,0 +1,31 @@
>> +/* SPDX-License-Identifier: GPL-2.0-or-later */
>> +/*
>> + * x86-event.h
>> + *
>> + * Helper definitions for event handling, which aren't prescribed by the
>> + * architecture itself.
>> + */
>> +
>> +#ifndef X86_X86_EVENT_H
>> +#define X86_X86_EVENT_H
>> +
>> +#ifdef __XEN__
>> +# include <xen/types.h>
>> +#else
>> +# include <stdint.h>
>> +#endif
>> +
>> +#define X86_EVENT_NO_EC (-1)        /* No error code. */
>> +
>> +struct x86_event {
>> +    int16_t       vector;
>> +    uint8_t       type;         /* X86_ET_* */
>> +    uint8_t       insn_len;     /* Instruction length */
>> +    int32_t       error_code;   /* X86_EVENT_NO_EC if n/a */
>> +    union {
>> +        unsigned long cr2;         /* #PF */
>> +        unsigned long pending_dbg; /* #DB (new DR6 bits, positive polarity) */
> 
> With the advent of FRED, this probably wants to become event_data (or
> just data) and drop the union.
> 
> It's also the XFD_ERR mask for #NM, and the NMI Source Bitmap (on
> capable hardware), and I think we're better off pointing to the FRED
> spec than keeping an out-of-date list of what's in it.

Yes, perhaps that's going to be better.

Jan

