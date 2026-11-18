Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D76C5606A31C
	for <xen-devel@archiver.kernel.org>; Wed, 18 Nov 2026 07:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=LmUmDRZ4
Received: from list by lists.xenproject.org with outflank-mailman.1493904.1693625 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTaSP-0002A5-7p; Wed, 18 Nov 2026 07:51:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1493904.1693625; Wed, 18 Nov 2026 07:51:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTaSP-00029y-4M; Wed, 18 Nov 2026 07:51:53 +0000
Received: by outflank-mailman (input) for mailman id 1493904;
 Wed, 18 Nov 2026 07:51:52 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xTaSN-00029Z-SD
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2026 07:51:51 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xTaSN-007EOR-8Z
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2026 08:51:51 +0100
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6afd5913-2eae-0a2a0a5409dd-0a2a45098534-20
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2026 08:51:51 +0100
Received: from [209.85.128.44] (helo=mail-wm1-f44.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6afd5917-be1a-0a2a45090019-d155802ce4ae-3
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2026 08:51:51 +0100
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-4a35a60499eso4904805e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 17 Nov 2026 23:51:51 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4a650d2ec62sm3020110f8f.3.2026.11.17.23.51.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Nov 2026 23:51:50 -0800 (PST)
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
        d=suse.com; s=google; t=1794988310; x=1795593110; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XzH9NUBSOXTRlrWJEBQEj41TnMLarXcxBMszBkvkaE8=;
        b=LmUmDRZ4CRZEUQvsGjuhLgmUWtlQ14naMq4oq9qNZ8B963m/r3otCcgm8869r3mJvK
         VaaPC3DNPHhUjbJqiFEj/h6sFBl4Frcfjnc9UenDBAYT5I82alLjm5r6HuEg0v9r7L54
         9kSVZd/vxGj4w0j2XCDzqSostWW7V8085d0iIDicOKT8GTzPu7nCidAER4ONImAS/G+8
         G+zg08MUiejHCYSJEtBKxRaAx02SJ15sY/+kUmKriFwsVP4rBCg9tnxdsYeJQPN/c3Ll
         2PzNTbr+XJtfkgD9WUQAxyO2un+SV4YJWYxPUEaIaMt9QrPiKoLrBTD9oeYyc3nXGo9j
         9U0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794988310; x=1795593110;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XzH9NUBSOXTRlrWJEBQEj41TnMLarXcxBMszBkvkaE8=;
        b=nQYzMAPOPnuCqJTv6LQAE4wZVDeFTz3DWIr960KGXBkwHX6//F/maHT5d6wS3W2jvx
         Lx5feWsQo+sT5edl7ZzdAJCvE9nt3uNtIUCecnP0swKvvFfC9pHHKxDMTKu1VKY/tR+t
         9IFnEHoZLBKMLmIG43G4x7xxSOjJsp66SMV51iAAPUhuCPQsTreM7LVLtcfsI3szV1Tq
         gNduXxZeJBGep4HrpOpVGNfJFYPVsEVLxHV9eVbNbRuwu6g0AUepLALuwYZ6Lc5G4w0s
         Rg8jjOY3ENx+6580FYMpUuexUlNEFe4StQLzMrmeSgs4TPkK8UMZ8iT6+UTjuCI7g3mE
         nHzQ==
X-Forwarded-Encrypted: i=1; AL+hErHK8lbzK/PQS1AgYPA/qLQbWisTLMvqu9fVAGYcxg0ewBA8EOQjuj8fb4ODWdIUc6xIhK8f9EC90AY=@lists.xenproject.org
X-Gm-Message-State: APuU4Z8wlIUDJBakXyfob+z+TtjqC6KYUVnb/a9qi6iCzekxc/RSBJiS
	AQIbsUbIdzZJOEaPSxiZpAOmVdPvpwDuFSWxu+oOcDc2Uy8s1x6yxB3Ikgd5m/xbYA==
X-Gm-Gg: AYBFou1G74axnDqZ0EkNZ4uJFffMRc0vOPB/afxkOnvqzueqdjtK5SISGBomqdC7mRB
	6TUvtDTbABjB2S/SafH/ppkNogDQ5A0w0/9vIMKLVZkCAdsE/xWvqp8zPBoOxdK7DQp0frAD1Nd
	6Dh65iFoh7R8DubCjlORuJuSKKrAzXWQpIXUd9OXCLmR9qbbzToKUqKtSjesv40hb5/W6qfko6M
	hbxD9xG5KLVC0oqu2E+WhWhV+52YNJgDOW+roK6/82KcvftH3ugHUfDeV09jLQc5t9SQJemcToK
	Y6l03fUcWr11M3yPn4othvX0ZFHMBS6ogTmyINP8K0g0wnjL/DE2gee9st4fJmCumkkjAHKC9ho
	CevMo3nHBz1TzRfxWFBzp095OakOUUdqwB9eVFnu1vUjZHT3XQgkj0OAGDNyrVLGRxUekr7S22a
	uU0XQV3Btxzcufktt1E+4UFZIeacKCYoXmMAu8nMWJhsBraMGEHreTOq8xIXf+L9rF3vhbt09hJ
	cLzZcH5OzNjq01E/91N3WYVMm3cpBq0y1+JGrNzG378U3TCMnQFceSKl1Wb6tEf7E+BRTh5bQ6C
	89pEhepC/cLA5Wl7JuVC1f6F+YMfNslf+t8TCPsZ0JUKj8SCN7l2K0nAueSW2GMZ752vwOrw5g+
	FkmTabaPO/0WQIcNe
X-Received: by 2002:a05:600c:3b17:b0:4a2:a6e:80f5 with SMTP id 5b1f17b1804b1-4bb7da139d3mr32129105e9.11.1794988310566;
        Tue, 17 Nov 2026 23:51:50 -0800 (PST)
Message-ID: <2a38c5a4-f71a-4375-9c23-722179168700@suse.com>
Date: Wed, 18 Nov 2026 08:51:49 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] automation/eclair: deviate R2.6 for the x86 emulator
To: "Chen, Shuaidong" <Shuaidong.Chen@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
 xen-devel@lists.xenproject.org
References: <20261116031717.2958306-1-shuaidong.chen@amd.com>
 <3863be19-b5d2-4277-a550-2bc0235c7119@amd.com>
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
In-Reply-To: <3863be19-b5d2-4277-a550-2bc0235c7119@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-bad1c0/1794988311-FDC6D034-17ED39CB/10/78276251493
X-purgate-type: spam
X-purgate-size: 4237
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 18.11.2026 04:16, Chen, Shuaidong wrote:
> On 11/16/2026 11:17 AM, Shuaidong Chen wrote:
>> MISRA C:2012 Rule 2.6 (advisory) states that "a function should not
>> contain unused label declarations".
>>
>> Depending on which parts of the x86 emulator are compiled in, some of
>> its labels end up with no goto targeting them.  For example, with
>> CONFIG_HVM=n private.h defines X86EMUL_NO_FPU, X86EMUL_NO_MMX and
>> X86EMUL_NO_SIMD: the CASE_SIMD_* macros then expand to plain labels
>> instead of case labels, and the gotos to several hand-written simd_*
>> labels are preprocessed out, leaving 91 unused labels in
>> x86_emulate.c.  The build already acknowledges this by passing
>> -Wno-unused-label for that object.
>>
>> Annotating these labels would only add churn to the emulator.  As done
>> for Rule 16.2, deviate the rule for the emulator as a whole.
>>
>> Signed-off-by: Shuaidong Chen <shuaidong.chen@amd.com>
>> Acked-by: Jan Beulich <jbeulich@suse.com>
>> Acked-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
>> ---
>> v4:
>> - Reuse the existing x86_emulate file tag, moving its definition ahead
>>    of its first use.
>>
>> v3:
>> - Drop the CONFIG_HVM=n specifics from the deviation text, as the
>>    deviation itself isn't limited to that configuration.
>>
>> v2:
>> - Drop the __maybe_unused annotations (v1 patch 1) and the CASE_SIMD_*
>>    specific deviation (v1 patch 2) in favour of an emulator-wide
>>    deviation, following the existing one for Rule 16.2.
>> - Trim the Cc list.
>>
>>   automation/eclair_analysis/ECLAIR/deviations.ecl | 7 ++++++-
>>   docs/misra/deviations.rst                        | 8 ++++++++
>>   2 files changed, 14 insertions(+), 1 deletion(-)
>>
>> diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/eclair_analysis/ECLAIR/deviations.ecl
>> index 296340bb4c..d49af53055 100644
>> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
>> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
>> @@ -55,6 +55,12 @@ removed by the compiler, the resulting slowdown is negligible."
>>   -config=MC3A2.R2.6,reports+={deliberate, "any_area(text(^.*__maybe_unused.*$))"}
>>   -doc_end
>>   
>> +-doc_begin="Depending on which parts of the x86 emulator are compiled in, some of its labels, many of them generated by the CASE_SIMD_* macros, may end up with no goto targeting them.
>> +Annotating them would only add churn to the emulator, therefore it is deemed better to leave such files as is."
>> +-file_tag+={x86_emulate,"^xen/arch/x86/x86_emulate/.*$"}
>> +-config=MC3A2.R2.6,reports+={deliberate, "any_area(any_loc(file(x86_emulate)))"}
>> +-doc_end
>> +
>>   #
>>   # Series 3.
>>   #
>> @@ -531,7 +537,6 @@ therefore have the same behavior of a boolean"
>>   
>>   -doc_begin="Complying with the Rule would entail a lot of code duplication in the implementation of the x86 emulator,
>>   therefore it is deemed better to leave such files as is."
>> --file_tag+={x86_emulate,"^xen/arch/x86/x86_emulate/.*$"}
>>   -file_tag+={x86_svm_emulate,"^xen/arch/x86/hvm/svm/emulate\\.c$"}
>>   -config=MC3A2.R16.2,reports+={deliberate, "any_area(any_loc(file(x86_emulate||x86_svm_emulate)))"}
>>   -doc_end
>> diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
>> index bee4686675..7b983db264 100644
>> --- a/docs/misra/deviations.rst
>> +++ b/docs/misra/deviations.rst
>> @@ -116,6 +116,14 @@ Deviations related to MISRA C:2012 Rules:
>>          such labels poses no risks.
>>        - Tagged as `deliberate` for ECLAIR.
>>   
>> +   * - R2.6
>> +     - Depending on which parts of the x86 emulator are compiled in, some of
>> +       its labels, many of them generated by the CASE_SIMD_* macros, may end
>> +       up with no goto targeting them. Annotating them would only add churn
>> +       to the emulator, therefore it is deemed better to leave such files as
>> +       is.
>> +     - Tagged as `deliberate` for ECLAIR.
>> +
>>      * - R3.1
>>        - Comments starting with '/\*' and containing URLs are safe as they are
>>          not instances of commented-out code.
> 
> any other comments on this?

Before asking, did you check the tree?

Jan

