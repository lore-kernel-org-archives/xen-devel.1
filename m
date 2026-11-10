Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA8A6606A321
	for <xen-devel@archiver.kernel.org>; Tue, 10 Nov 2026 08:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=NZ8Wht/K
Received: from list by lists.xenproject.org with outflank-mailman.1480921.1684694 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQhBx-0003R2-4n; Tue, 10 Nov 2026 08:26:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1480921.1684694; Tue, 10 Nov 2026 08:26:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQhBx-0003Qv-21; Tue, 10 Nov 2026 08:26:57 +0000
Received: by outflank-mailman (input) for mailman id 1480921;
 Tue, 10 Nov 2026 08:26:55 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xQhBv-0003Qp-NE
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2026 08:26:55 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xQhBv-005CO9-3q
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2026 09:26:55 +0100
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af2d543-8faa-0a2a0a5109dd-0a2a4504b7e0-42
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 09:26:55 +0100
Received: from [209.85.221.53] (helo=mail-wr1-f53.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af2d54e-b57f-0a2a45040019-d155dd35e1f8-3
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 09:26:54 +0100
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-48dee593f18so1075151f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 00:26:54 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-49836a9951csm3423226f8f.56.2026.11.10.00.26.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Nov 2026 00:26:54 -0800 (PST)
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
        d=suse.com; s=google; t=1794299214; x=1794904014; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1ukbCx+fVGu6oVTOG88Y8XCwdZEcoEGl4PveirCyzuI=;
        b=NZ8Wht/K3QCRVu7W/9x6zSvvDEi3H0VEOrQYdS2eks1o+mjv4UmzZEvZtGzsx7afDw
         IXO/7o0pJz+PzOX+k9E7k2LvAOc1aIedR8ZAdyxhalDsR+OmKiicdTZ6iQi0Q7mDStn8
         57F9cja0sgkT1a0d5qPSFtbsal8fXH5xvXi8OkGP9NlykL1bzOhxDfuEYLqhL8z5uWMO
         3Hr8WiP0I786YqJDvpcH/gz/6LH/Hij4Sn4bZw94Byy5pICSjBtTKntqr3wxCPiTVrgR
         v1jhXPCjMXIRnWS98PTdrhV7JehgO4YGYWWBjxXhijsLaFKRrkIQwFbzL45r014crWR1
         6BdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794299214; x=1794904014;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1ukbCx+fVGu6oVTOG88Y8XCwdZEcoEGl4PveirCyzuI=;
        b=UBSehlxepq17zPoCKx9QBANujm3ozM2MDTW6d0ST+Wg5ryONXDeiPn3cziA9vLbeRY
         lO6JpiV5hRfP9DNh0iPzvwBiWh1h0ZG8fGQXNr3QatKy6+niwI8bkhFrkXI5CIlEJDAg
         rX/G644W4JfBpB3yq/4Al77hH1QndjTR0FIx0QZYI1Shet7yYY+LJlc/DeFXP8MPudQx
         cMnsB3S5eK+w8F+OfuI8cly1kU7uXIyuxZTnVaAX+Ql8xQavDvINU/mhJer1b9exQ74X
         6xPQQ1KBqM77GWdDbBtenzG5JZ84KRdpT8xabY1kguQJ3fRC4EqDVOPhgLWMyFXr/sQ1
         QNQA==
X-Forwarded-Encrypted: i=1; AL+hErEudFHvODlVQ6LC9t6XmYPJ+m1U/gi/OZCwNgdizbfsWGyJHdObXeacjyVoLRxIJ7tM9STuzyeGQXI=@lists.xenproject.org
X-Gm-Message-State: APuU4Z/R70D00dZfUFaNjtBa55fmZW554rsSu8K/dVOUiDYT1BtXcvCc
	S4AXvAORstyx1oxlSgIkkW8WK3Xj6XNalRYetlQPvGP9wEk9Ph2lz0z3Bk1neQtDn1sK4SnPNHL
	aBEXivA==
X-Gm-Gg: AYBFou0/RQzPIZhrkc8DhFVMZvk30Y2v2NL23PxvNqkj/DYhA0b2WVrtURTwwGKkcXP
	IEi0qJkFzIuZ3zPNPfK8swGeJ2rgJ1iGr9pWrXs8k06WYX09I6LBJg41rYV17n9zK0AoHhk3wgp
	qS9kkEEcHgYdiWnwSRJ+SOAKUIzLCKQnyiOBBD6ea5vMj5cC9SWV729lrnTnpwQgD/H9SO4laR5
	NlRL3aujdCjr9LgAwUyK+UN2KKzbHMoVJX/Mk/zomzNjIwFjUu/xa+qdg8BFrTGx2T4AiM5oL+C
	sSNes5KxZZYQR5QgBGqDfs+lK7d4ITCFjbKvmbcZfP5zdS0sW+Voaly3qv74GxXt7abKicv5LnT
	GxB13qVNkU+bwamXI9sjNkcKRD3saalT24/oQaWC282vcB3DiG3A3MxViwDGKy3UR2SZfZ6DcrN
	gJoSDrwk4jm9+BchN8ntAGOdLOCzT5ljmKYgqPqXkm2q/B9rBLGk2kjbiDXg/bcV8HuIscBIiMk
	iQRiEmMTZsg8VpiOvSMJOMen6ZyIaQ+tbb4/VsycC3HLhzL0TJVlK1bLX5BD2gKGppOu2Fmyttc
	CH9W9G568YMtfCJELq2PfPdHuUF19FkoxCg4uHliOxxJALzM8e5dvJgJlP+hMmFj3rzg2bA6iKK
	IcVMwZunx6TArJPIc
X-Received: by 2002:adf:e193:0:b0:493:8847:841e with SMTP id ffacd0b85a97d-4982e641e32mr2664949f8f.16.1794299214385;
        Tue, 10 Nov 2026 00:26:54 -0800 (PST)
Message-ID: <f0b06f4d-1d42-4604-9a0a-0e2528dfe7ee@suse.com>
Date: Tue, 10 Nov 2026 09:26:53 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/4] x86: record SSP at non-guest entry points
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Teddy Astie <teddy.astie@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <d0de0425-a0fd-4ced-9768-ff102b953a22@suse.com>
 <2b348885-fb2d-420f-8f71-81e3a9c836af@suse.com>
 <bcf961ee-f947-4115-bf92-716b4b2bf9e3@citrix.com>
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
In-Reply-To: <bcf961ee-f947-4115-bf92-716b4b2bf9e3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ebf023/1794299214-518D1B50-6CB4DB54/10/78276251493
X-purgate-type: spam
X-purgate-size: 1828
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 09.11.2026 19:30, Andrew Cooper wrote:
> On 09/11/2026 1:08 pm, Jan Beulich wrote:
>> We will want to use that value for call trace generation, and likely
>> also to eliminate the somewhat fragile shadow stack searching done in
>> fixup_exception_return(). For those purposes, guest-only entry points do
>> not need to record that value.
>>
>> To keep the saving code simple, record our own SSP that corresponds to
>> an exception frame, pointing to the top of the shadow stack counterpart
>> of what the CPU has saved on the regular stack. Consuming code can then
>> work its way from there.
>>
>> In SAVE_ALL / RESTORE_ALL simply drop the use of UREGS_r15. We want the
>> full size in all cases, so what exactly the top-of-stack field is going
>> to be (whose UREGS_* is 0 anyway) doesn't matter this much there. This
>> way we don't need to distinguish between XEN_SHSTK=y and XEN_SHSTK=n.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> The code is now fine, but the commit message is quite stale.
> 
> You need to drop "non-guest" in at least two places, and change
> SAVE_ALL/RESTORE_ALL.  In fact that whole final paragraph can go.

Oh, indeed. Dropped / adjusted.

> With the commit message suitably adjusted, Reviewed-by: Andrew Cooper
> <andrew.cooper3@citrix.com>

Thanks.

>> --- a/xen/arch/x86/include/asm/asm_defns.h
>> +++ b/xen/arch/x86/include/asm/asm_defns.h
>> @@ -259,12 +259,19 @@ static always_inline void stac(void)
>>          xor   %r14d, %r14d
>>          push  %r15
>>          xor   %r15d, %r15d
>> +#ifdef CONFIG_XEN_SHSTK
>> +        rdsspq %rcx
>> +        push  %rcx
>> +#endif
> 
> It might be worth having /* Zero (from above) if CET-SS is not enabled
> */ on the push here to make it clear what value is stored.

Sure, added.

Jan

