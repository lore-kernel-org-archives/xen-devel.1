Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4266606A321
	for <xen-devel@archiver.kernel.org>; Tue, 10 Nov 2026 15:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=ZBJcp2iY
Received: from list by lists.xenproject.org with outflank-mailman.1481988.1685878 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQnaf-0005lv-EX; Tue, 10 Nov 2026 15:16:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1481988.1685878; Tue, 10 Nov 2026 15:16:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQnaf-0005lo-Br; Tue, 10 Nov 2026 15:16:53 +0000
Received: by outflank-mailman (input) for mailman id 1481988;
 Tue, 10 Nov 2026 15:16:51 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xQnad-0005le-NA
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2026 15:16:51 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xQnad-000Q39-3m
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2026 16:16:51 +0100
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af33551-bab6-0a2a0a5309dd-0a2a4504ba44-40
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 16:16:51 +0100
Received: from [209.85.221.48] (helo=mail-wr1-f48.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af33562-b57f-0a2a45040019-d155dd30bd0b-3
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 16:16:50 +0100
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-490d59c3f0aso1146819f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 07:16:50 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4988f5b1ce3sm3983777f8f.14.2026.11.10.07.16.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Nov 2026 07:16:49 -0800 (PST)
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
        d=suse.com; s=google; t=1794323810; x=1794928610; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=i9YujgrsExE6UVnJZFmC2FRQ+FtVwE24II9k3D0+gGM=;
        b=ZBJcp2iYQSfVEJm5in2OpP5yhq5t7GkTmR4u2d+Tm4Q3Stmzmh78muFTsgUFOMFzO4
         M7uIYVmrbbcqWq76P0wFRprdpSFIml7CUyeWDqMKPrpSG6twmX7eh7y/UPP6GrwQVqcd
         VTRiHkW9co0JMOWS7l0cUNYfqr6lLiND+sVwMvxS9SfsAaLOOoeLsTysJbgdLNop9TGg
         mGGTfT7a+Fceu5xM1L2CLTGTlRuwCHGxjpQ8n9nO+27MQOZp3bGWuuKFyXHi50rVWPdF
         j133eQj3lfZmp32mluASyxf98gLATuQtQduQbaE5/csX7DDQsdt8176pJmKJJok0qqQ8
         DbwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794323810; x=1794928610;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=i9YujgrsExE6UVnJZFmC2FRQ+FtVwE24II9k3D0+gGM=;
        b=YpJkiBnytmBsh4W0XO+8FuP35nfRtj35ybyAt3nxzNTF8OduMi0cgwY3vn6UI6f+dT
         r4/6Szj2UUCndx5Qw0bkwG0O4zluk9FjsC9G891JxsqCTMlU/I607FbXr/4FvTTNeT+9
         NvJYIj0XO0X3PvTVTOAqRPzkc2R/5Dwh3NNT1xH70tcdyoMSRWfYTNNs0OIv5sj5rrNK
         LseCuHrfrMxuOrJNN5osk+pN4AB+zI6c8fIgY5T9u7nEg5fypfiULIngvHtB/i1PEO0k
         F7CpppO9v6oHFn22YoKUJqO/DgxtJ/VdvN6RgFsBTjhYWUPkqGS2i/nuxT98NK5F3lT4
         yvDg==
X-Forwarded-Encrypted: i=1; AL+hErEcECrf+YufkZyCvkOu4UIyxDQnQFSP3NlEXnS1BgnvhLumQa1TPFNYvqL3M/+EV2sUtQMfG9Jzoj0=@lists.xenproject.org
X-Gm-Message-State: APuU4Z+XkXbyhRU3GbiqRPMWZJFVyZ2JcO+qJJ/c+VciZ+vLFMEU2nMK
	r6CGAfiHc14wDPd+DFZXqy7XZrYyNI9vc7+KZh0Qm4Ep20G5Y5GrC4aPOt/Aj/YaBw==
X-Gm-Gg: AYBFou0qaE0Q5t1XHnNejHDwBkfVs3T4Djeu6qmH/edPfuhhgcku9SRgme4gygy+knx
	2NtzbjpVVx5OeiTdcwdOEDcTRxhnh4NhL3FeIPqS50lSbrjtM7urwCIWpBQ5y/KNyIz5lLqcSI2
	cTpHaD2n2SMwWxPnC4Kj3Ilf8ZSQw+R9kxiGgh40/QKgt7b08aeZNQQrh7XMm5hgOddECTFzcZq
	J1dsJpeUbndIuhY82Rp+a2fuLNDWd8k4aiMTagCXcLgYxxeIhZM+iXLRS9EVCCWj7rnY9esV2rt
	erAu8hd19E+h0pyAMbUyuboCpSAs6MC7ZVfcIMEl7yAOem2GzeefA6cjQDDUWMdJp90ovYVmUMm
	D5tn4erRltwpp82KPhceKExglz6nBZuPsCWMY91pkm66ZsFullANfi0pikCO3js8jjvnxV2Kyg5
	0nhLu/L5LvQrfLU5w2S9KED2xpMUgjq8217nMi0AgKdjULvIDXZcem6bq9r3rQFQQSbmrq+ESTI
	JUsTCCEZjVnI8ze/IJJlHAJThm1UOR/mIifMD9ElVNTaMD5mk1EAHgXFlKBkmPP/Bo8X237j/x2
	xd0vEAnnQLi4g+zOpP7Emxig7F+GTy3+YcH53beQTEjlboEA2y9O0lj2iH6qs9gCzuCKxmIfdQ0
	UtXNh1rIflb06UPTJ0A==
X-Received: by 2002:a05:6000:22ca:b0:48f:bcbf:26f8 with SMTP id ffacd0b85a97d-498318070a2mr5447634f8f.48.1794323810161;
        Tue, 10 Nov 2026 07:16:50 -0800 (PST)
Message-ID: <81193399-c673-464a-b58a-979c3bae4691@suse.com>
Date: Tue, 10 Nov 2026 16:16:49 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/efi: Handle efi_memmap with Xen relocating itself
From: Jan Beulich <jbeulich@suse.com>
To: Jason Andryuk <jason.andryuk@amd.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
References: <20261106231818.482564-1-jason.andryuk@amd.com>
 <d15b8c70-840c-4de7-a047-823a31952567@suse.com>
 <864762ac-64c4-499c-aacf-5527390bd95d@amd.com>
 <f48effca-510a-4ec3-8e2d-cd6c879aa182@suse.com>
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
In-Reply-To: <f48effca-510a-4ec3-8e2d-cd6c879aa182@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ebf023/1794323810-526CAB50-3B1037B2/10/78276251493
X-purgate-type: spam
X-purgate-size: 1801
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10.11.2026 16:14, Jan Beulich wrote:
> On 10.11.2026 15:42, Jason Andryuk wrote:
>> On 2026-11-10 03:42, Jan Beulich wrote:
>>> On 07.11.2026 00:18, Jason Andryuk wrote:
>>>> --- a/xen/arch/x86/efi/efi-boot.h
>>>> +++ b/xen/arch/x86/efi/efi-boot.h
>>>> @@ -224,6 +224,16 @@ static void *__init efi_arch_allocate_mmap_buffer(UINTN map_size)
>>>>       return ebmalloc(map_size);
>>>>   }
>>>>   
>>>> +static void *__init efi_arch_mmap_buffer_virt(void *ptr)
>>>> +{
>>>> +    unsigned long load_base;
>>>> +
>>>> +    /* RIP-relative address is the current Xen load address. */
>>>> +    asm("lea __image_base__(%%rip), %0" : "=r" (load_base));
>>>> +
>>>> +    return ptr - load_base + XEN_VIRT_START;
>>>> +}
>>>
>>> There's nothing specific to the mmap in this function, hence it's name is
>>> a little odd.
>>
>> It is paired with efi_arch_allocate_mmap_buffer() above, so I wanted the 
>> name to indicate that it is converting mmap_buffer to a virt address. 
> 
> Hmm, right. And this is entirely different between x86 and Arm. So common
> code wants to call a function of this name, but on x86 this may then want
> to be a thin wrapper around ...
> 
>> Having said that, I am open to renaming if that is desired. 
>> Alternatives could be:
>> efi_arch_xen_phys_to_virt()
>> or
>> efi_arch_image_phys_to_virt()
>> or
>> efi_arch_xen_image_to_virt()
> 
> ... a function of any of these names (which in turn would be possible to
> use for other purposes). Marek - thoughts?
> 
> With this constraint on the x86 side, wouldn't you then better add an
> ASSERT()-like construct to the actual translation function?

Or use the existing (and Arm) logic when the pointer isn't within the Xen
image. (There can be ambiguous cases, though, I fear.)

Jan

