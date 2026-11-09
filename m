Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CF83606D803
	for <xen-devel@archiver.kernel.org>; Mon,  9 Nov 2026 13:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=M4kZldO2
Received: from list by lists.xenproject.org with outflank-mailman.1480063.1683997 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQPB1-0003ZF-A6; Mon, 09 Nov 2026 13:12:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1480063.1683997; Mon, 09 Nov 2026 13:12:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQPB1-0003Z8-7X; Mon, 09 Nov 2026 13:12:47 +0000
Received: by outflank-mailman (input) for mailman id 1480063;
 Mon, 09 Nov 2026 13:12:45 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xQPAz-0003Z0-RH
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2026 13:12:45 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xQPAy-009YOa-P9
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2026 14:12:44 +0100
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af1c6c8-2eae-0a2a0a5409dd-0a2a4506ac54-18
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2026 14:12:44 +0100
Received: from [209.85.128.41] (helo=mail-wm1-f41.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af1c6cc-195a-0a2a45060019-d1558029b5d9-3
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2026 14:12:44 +0100
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-4a215e64962so9960015e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2026 05:12:44 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4b90ee1ddc7sm190113985e9.4.2026.11.09.05.12.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Nov 2026 05:12:43 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1794229964; x=1794834764; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=136uhxPk379z7YDVnl2+yXJHtB0apmVaFro3g56GSGo=;
        b=M4kZldO2GTx+9ymbXgouJ37yYY/geq5r+gS3HVh+mlWP8rkZsjzYrNMr94ArJSC/1b
         RCbGKApYYJtNuVnJMi059PCqBBpeyYSwC+g+f83Fv9AW/Nr9eRiacc0G7xLj+VFw8sXt
         WLg+LNpMTSuiz/5zhtUHMCsPME2h/h+t+hwRDl8Yj/xAkzvONsH3MOaaNczYgTuPJgE+
         VZor88ZRFErdj+3yLE6+Zl2qfaS1F7dCk2NXU7FoO4Y12OdEmby/J1ITTObeIplXOWa8
         Gp49o76E+55Yr1h7v9hADxrNfAmPCSV1tQSHyoRUk6bB9fiEEo7eBIjEvOotFs79QJ6k
         i+Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794229964; x=1794834764;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=136uhxPk379z7YDVnl2+yXJHtB0apmVaFro3g56GSGo=;
        b=kBrqGAOvjL4Ubcb2sLgO7lxeG221h/4+5extasoND9RPSvppWVOdIqLelZhpKlJmrc
         Ojg0YdFTmbgXzXqmbRpeefPWnEJk/8Bj7Mk6nvnvSR37wceN3UfYXj1uJ7zd+mM+eAju
         zkvgneiAlaBY4Wcd9cvcBFpSdWKP49xCf2ovFfPyuF4pr8W6cKtek8VexHZksS10Qr1W
         505YYc+LKTm24DUcW3G7K1ivm7nTZEJdGfk6WHXVLPy81jQ7y41HSP6WmtwEbFTP/leZ
         qw1p9RdBjYoCuBqyLtDU/pMxqtZoFzDWkxiaIPfKf6ByAYl8ZENgHArfOdzV8bJ18zpk
         ZTjw==
X-Forwarded-Encrypted: i=1; AL+hErEX9ApMA59p+wNfL1jLYmKcEDDi++b3KEGnamt+kVuyFEGD8/gaeoER45W+Q723FqPtXnPnB6hOKmo=@lists.xenproject.org
X-Gm-Message-State: APuU4Z+1lxFV8ygBzvAVxT/veg7xtUwNALXqfuInV3qlba0Jdwb4s97o
	JSZs5CbOR0g7RPK6sbVtpYfqJAbUpLyzrIrwOwdOWrNteb9ZpqbBr8Az3RkVGKwy4Rut1P5lXQz
	I7QM/AQ==
X-Gm-Gg: AYBFou2/VkYTxrLTkQeox8Bx8diMNB31FbuUwd7yeWuKlRNRzO+H62QYEUySLbb/UEg
	vJVoBOio4jhpeZLyZNqqG8zuj6C8yvHIEHnYP/qz+d7LrPb3ZmSe+r1h7D1404gifJ7b8Pl9SL6
	5zHDhHxGJnUgS0mn/81DsOurEfD+ZEbwep8BZDJj6eZ2nQ2AZf6jBgmuesaBIGCPSL1LSss35Zm
	SBXeUOif/ypPbHYbUD2Z+pSqomIIgRUyJNRysKdbUFvVU36DJIlHRNmZsYnUc1hQ0qf2dPtwxsA
	kuZ784J2JMbyaxfPbiologycJX/lf9RbVX85Uc458HqpyXEOWktuC3U/SZ2qphisyWHIF39hnU1
	k4B1h6qVJTxZYLg7mqAxl9Cy5HGJ1G/bVT5Z0tGt/KrVZQO0qNFdenCgN1G9bhql/vsoC7bFaBD
	kwFOexzC1CPrurzwNAv+PzS9rXwdNRO1D//sxtGPCPXxcsx8I3SdlztMruWlG0o44xitDbOHRwS
	7mLSZpP9z70m2BKnV5WoT8NJZPHcgCA7FiBxUcRLhG1rHue5gs6H8en1Hcofdef7uw8of6jsV6q
	K5nv9IBYQfpruPOh8wwGz68AaZzERtRx0g60tmpfLWlBuJGp3J4SvTY9eMBI+3pgJ94SbpL2amd
	/7Yea8HLjQfN7DtTnr+YAR3rU+91rlcGslXCROQ==
X-Received: by 2002:a05:600c:37c3:b0:4a3:5991:718 with SMTP id 5b1f17b1804b1-4b963c87b5cmr70865915e9.16.1794229964125;
        Mon, 09 Nov 2026 05:12:44 -0800 (PST)
Message-ID: <cffe924b-031d-48af-926d-47d57777e079@suse.com>
Date: Mon, 9 Nov 2026 14:12:43 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] xen/riscv: align header inclusion guards with
 CODING_STYLE
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Connor Davis <connojdavis@gmail.com>, Tamas K Lengyel <tamas@tklengyel.com>,
 xen-devel@lists.xenproject.org
References: <20261105150336.25751-1-oleksii.kurochko@gmail.com>
 <573590f0-1a94-4113-a76c-3ae644bebdff@suse.com>
 <8c2b7338-e65b-4d14-af62-9f300e2becb5@gmail.com>
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
In-Reply-To: <8c2b7338-e65b-4d14-af62-9f300e2becb5@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-16d1c6/1794229964-F78CB77B-F8B10D70/10/78276251493
X-purgate-type: spam
X-purgate-size: 2196
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 05.11.2026 16:56, Oleksii Kurochko wrote:
> 
> 
> On 11/5/26 4:44 PM, Jan Beulich wrote:
>> On 05.11.2026 16:03, Oleksii Kurochko wrote:
>>> Commit 7abea85c9f12 ("CODING_STYLE: Updated header guard
>>> recommendations") changed the recommended naming of inclusion guards
>>> for arch-specific headers to <arch>_<something>_H. Most RISC-V headers
>>> still use the ASM__RISCV__<FILENAME>_H form required by the previous
>>> rules, and a few use ASM_RISCV_<FILENAME>_H, which follows neither.
>>>
>>> Rename the guards to RISCV_<SOMETHING>_H. While doing so, also fix two
>>> guards which don't match their file names: extable.h used
>>> ASM__RISCV__ASM_EXTABLE_H and intc.h used the misspelt
>>> ASM__RISCV__INTERRUPT_CONTOLLER_H. For riscv_encoding.h, don't repeat
>>> the architecture name and use RISCV_ENCODING_H.
>>
>> I'd recommend against that. If you want this tag, renamed the file as
>> well. Otherwise stick to the naming rules.
>>
>>> No functional change.
>>>
>>> Assisted-by: Claude-Code:claude-opus-5-5
>>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>>
>> With the above (and possibly also the below) adjustment(s)
>> Acked-by: Jan Beulich <jbeulich@suse.com>
>> Which way to make the adjustment you will need to indicate. Changing the
>> tag identifier can be done while committing. If you want to rename the
>> file, I could drop that one hunk from here while committing. Please
>> indicate intentions.
> 
> I think I prefer then to follow the naming rules and name tag identifier 
> as RISCV_RISCV_ENCODING_H.
>>
>>> --- a/xen/arch/riscv/include/asm/vsbi.h
>>> +++ b/xen/arch/riscv/include/asm/vsbi.h
>>> @@ -1,7 +1,7 @@
>>>   /* SPDX-License-Identifier:  GPL-2.0-only */
>>>   
>>> -#ifndef ASM_RISCV_VSBI_H
>>> -#define ASM_RISCV_VSBI_H
>>> +#ifndef RISCV_VSBI_H
>>> +#define RISCV_VSBI_H
>>>   
>>>   struct cpu_user_regs;
>>>   
>>
>> I think at this occasion the #endif also wants to gain the usual comment.
> 
> Oh, missed that.
> 
> I will appreciate if it could be done during committing.

Done, including two further instances of the same kind that I had missed the
first time through.

Jan

