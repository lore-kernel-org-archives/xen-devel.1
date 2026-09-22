Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6674CC982F1
	for <xen-devel@archiver.kernel.org>; Tue, 22 Sep 2026 06:36:39 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1428164.1650869 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8u79-0002pq-M0; Tue, 22 Sep 2026 06:36:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1428164.1650869; Tue, 22 Sep 2026 06:36:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8u79-0002pj-JC; Tue, 22 Sep 2026 06:36:27 +0000
Received: by outflank-mailman (input) for mailman id 1428164;
 Tue, 22 Sep 2026 06:36:25 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x8u77-0002pd-Ir
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 06:36:25 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x8u76-008hhd-Vv
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 08:36:25 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ab221e0-e002-0a2a0a5209dd-0a2a4505eb56-28
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 08:36:24 +0200
Received: from [74.125.225.140] (helo=mail-wm2-f12.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ab221e8-4cb1-0a2a45050019-4a7de18caa3b-3
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 08:36:24 +0200
Received: by mail-wm2-f12.google.com with SMTP id
 5b1f17b1804b1-49cd5462b69so19934965e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 21 Sep 2026 23:36:24 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49fdaa4e47csm55392655e9.1.2026.09.21.23.36.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Sep 2026 23:36:24 -0700 (PDT)
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
        d=suse.com; s=google; t=1790058984; x=1790663784; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ySpO8zLkhZzTz7pj7WmyA9l3Ff2FfjURPFQzBaa68ek=;
        b=GdunEhu1vU3n75UwkIGmuD8vcmKK4ls+zJN8GC2q/ToJE8DdMWhTKZ69Spt9NyDrxW
         8ACNbSaB2CgCmCdt2s84y8a4XZRVh176a6+OSmUHlBXir+xK+V7r9WI9tdxaomih7eAe
         k9WmMADpgoSKk0KVLq0k4j2f9I1vcjkOo4AurG+KOgltj0+JJcBwWg4oeWIVaLD/5eJY
         bN5yMmvKmEk0rYzAF/SWOft2NP1zuNElAosworX8i01j5xCdINW93rgXvxWmI2WnnO4R
         yZPkYq3Mg6xpiWyw8WAHpIKIdWdJiaXc3OErqz6VLcL6unGsJ4ptNJskMgea5QKEcpW0
         niHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790058984; x=1790663784;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ySpO8zLkhZzTz7pj7WmyA9l3Ff2FfjURPFQzBaa68ek=;
        b=TerB9tzxDEr9Zm/NcVX9MIyNPwwCNHc7DwrLywfjSsnCcIn66wioocEKsx7UxBDatQ
         z6pzxBg5cp0rUL7AFLsuQN2lc3Vrw3cKYcaQ0QM8aveZVNfCOF43Uy8ekunNxLj0sZLT
         aNhnG+EGzTkRoZZswPKYM8DEOGYN0lLztR2DkFsHJaa19XVnsdflFqUjBFVJamMX28PQ
         99CInQRBfkqyYwwinYyNGg46RC2IoUNZy4LyDSoUPobS5nsJRvf9w8HgrCz3WRU4zpcb
         jjokmbtEXaMuShvaJewac2brE15mzQ5iiEy+5lsaWcHEIGNZf9/Kb2yDTdXXoyQrBtfH
         eAkQ==
X-Gm-Message-State: AFuF++mDOq/dwYk7wdzN8jdyS6/P5mZN1++nSpjVtvlUsuB7TqCpinTf
	XRNdJ3ex78qmnUgwU4THNZSvIyekGsa5x0fcfoyAjFx3CUcQ/tILTsU+HhKzVd3Yuw==
X-Gm-Gg: AYBFou1HpIFPPB3LBeG3GIWmV4lu+1+cXpUEC4QZMsLUDRqMxFNw/TyGm+ccYWfGRPt
	3rnhQxEOsjABsKu6WgbydsqcKYXsdP4ZNEIrVLoUTQhbxKOdczjy//nIahGLimEaZufzhIJUt8I
	yUjnF4NwLdRau8yCbelOWPiYFhODp6HLORAb5Cp/5QVadn9JzISPz72k9m3MPyDpakznmOuJpMk
	WY/lYdseGeyFoS96urqJj/4jFJq3pd6nyXvo1AN7qvoZ43bG4NxqBR5FZfBVC5Phe6NyYrDp/hX
	fNcY5q77Beklv1cR/20ZUERS1PbpCqZ8ESu+NUQIonr3K1I8EGYz42vnRXDL2UuvPjQqRxGY77W
	i7xNQ4jsBn33LVjelDqZAnLIVJMBQEBUZ0PYYn/KvnnCTogto2eUqcVF8O5zk2lMASx2JNINJAj
	F0mv/105BSlsVN5hJHccEYTdT2iTXD1rqzgwfmfCctx8XpnpiMdHPH/0Hi3PQSDqoVKUXGaBmkm
	WKeyDO+qeV6E4qHM2JxQziw3oMChpLt/O7WNCrhL6a3RStSGPdoS/J85DMxLU2aF7rolUKngw==
X-Received: by 2002:a05:600c:5489:b0:49c:dca4:94c with SMTP id 5b1f17b1804b1-49fc573579amr236387705e9.13.1790058984379;
        Mon, 21 Sep 2026 23:36:24 -0700 (PDT)
Message-ID: <162997df-6c5f-4f1c-b01f-16f6c2e4e0c6@suse.com>
Date: Tue, 22 Sep 2026 08:36:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/14] ELF/notes: use pointer-to-const by default in
 ELFNOTE_...()
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>
References: <0ff5676d-2ad3-49e3-a94b-90e7c3edb55f@suse.com>
 <8fe86787-7590-44f1-be4f-461b61d7669b@suse.com> <87fqz26otq.fsf@epam.com>
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
In-Reply-To: <87fqz26otq.fsf@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c201ff/1790058984-F5EA92A1-BEB482D9/0/0
X-purgate-type: clean
X-purgate-size: 1296

On 22.09.2026 03:45, Volodymyr Babchuk wrote:
> Jan Beulich <jbeulich@suse.com> writes:
>> Not doing so results in a number of Misra rule 11.8 (casting away of
>> const-ness) violations. We need to allow kexec to use pointer to non-
>> const though, so provide a means to override the default.
>>
>> For ELFNOTE_NEXT() we can do better and simply re-apply the type of the
>> incoming pointer.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>
>> --- a/xen/common/kexec.c
>> +++ b/xen/common/kexec.c
>> @@ -6,6 +6,9 @@
>>   * - Magnus Damm <magnus@valinux.co.jp>
>>   */
>>  
>> +/* We're producing ELF notes here. */
>> +#define ELFNOTE_CONST
> 
> Frankly, it feels backwards. When reading this line of code I am
> assuming that you are adding constness to ELF notes because you are
> defining ELFNOTE_CONST. And I had to check the elf.h to understand that
> you are doing exactly opposite. I am pretty sure that other people will
> confused by this as well.

Well, that's certainly possible. Yet then you or them are asked to make
an alternative suggestion. An option I could think of would be to merely
rename what is ELFNOTE_CONST right now, to no longer have the word
"CONST" in it. ELFNOTE_MODIFIER maybe, albeit that reads a little clumsy
to me.

Jan

