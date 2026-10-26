Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E9C0606A31B
	for <xen-devel@archiver.kernel.org>; Mon, 26 Oct 2026 09:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=U1hmuSog
Received: from list by lists.xenproject.org with outflank-mailman.1461021.1671952 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLHN7-0003cx-2i; Mon, 26 Oct 2026 09:52:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1461021.1671952; Mon, 26 Oct 2026 09:52:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLHN7-0003cq-04; Mon, 26 Oct 2026 09:52:05 +0000
Received: by outflank-mailman (input) for mailman id 1461021;
 Mon, 26 Oct 2026 09:52:04 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xLHN6-0003ck-6I
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2026 09:52:04 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xLHN5-00DSJ4-Is
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2026 10:52:03 +0100
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6adf22b9-2eae-0a2a0a5409dd-0a2a450bea3a-24
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 10:52:03 +0100
Received: from [209.85.221.50] (helo=mail-wr1-f50.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6adf22c3-b7e8-0a2a450b0019-d155dd32bd8f-3
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 10:52:03 +0100
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-48e0d1c095dso1602254f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 02:52:03 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e3ecde7easm15709315f8f.52.2026.10.26.02.52.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Oct 2026 02:52:02 -0700 (PDT)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:Autocrypt:From:Cc:Content-Language:References:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793008323; x=1793613123; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :cc:content-language:references:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sM7mexgU8u63/2C0FKJMWIK3SPvQk+d8wiFjNOgEY3Q=;
        b=U1hmuSogX8murpiMLQO/jm627+7fPnGJ130HnKe+PUxjZalYRbRUYeF43Lr5V8kZE9
         eT1aA7PS5M5ZNtSdXz/gZAopY45iu4SkYKuUrhB5e/nmThFI9sssssocxVyx6I26oEkV
         ipO5w+ELe8WJC2rGLl7APQbfyBL5V0q61D6uxx6BJNXVmtf88OBAVj+G9QmsQNp+L1jk
         LbQWlj7YzSCSQaVuy4z4vUK7nyA7HYNvOmcu/bM/b7DK8FwvsExm2XcgvizqldP03dpq
         yJ9nwANYnWQJga5920JTzFGxqQ4AqdakaIr0Q+40I7gWoCTiEWhdE/NUUFiDPs+m3sP0
         Ii0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793008323; x=1793613123;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :cc:content-language:references:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sM7mexgU8u63/2C0FKJMWIK3SPvQk+d8wiFjNOgEY3Q=;
        b=mPQrGstb5pzQrd5VWEmjfAoIm9MMlZbLAQN6wkpK14Awd2dBT24NYfAgOu3Ao4KZ17
         d1/9o83iNFOMSPpp/aX2zD1C8MQo73W+R7JmB1Mk8iGgJMAJCJtmqLQAIZRU8n9VTjf7
         08I0kGoeiTVDwJMolZC1CDwj791hFDvUjQLtvpaVARw9uACEQ+U1uVAmUXasw3KRwVuD
         Z/Ss+8XfbaHJ5bRiQX7NpOEyc95N8AMeLisV2ByqKf5JZzRhDtq6UjL+ARrPdHF/Mqm/
         Ofn/UHfPHCXo4CisUkJcjnjtDEnEHqidiPMjbfPECn0wgOjzbZmc6l+8KFB72yg1e3TH
         Ncxg==
X-Gm-Message-State: AFq9FYIokkiNpb6s2TvnEl9ws7MeJfVkyFEne+LpbGQ1TiMuJXLdES4Z
	WMoOggwCbTC75QM4q6pXK3IUnl9Ye+CXYTNJIxnahXiB1oIheNK4fJFF0iC6W36hlTnyvK7L/pr
	mkYzGSA==
X-Gm-Gg: AYBFou1k1srZUGPFZ90CQBpolYiz2eejdMHSavVV1g8HE2R7cx3rkvXE7XPUHS/x2iu
	lTuWyiN0o08UtMWaucL2V2oEUC+aYRhsswvmXR5WthA5UVRy8Zq/bDz4+dMvX6wrke+E1IqzqXv
	m1nrlms269vV3p5WF0sGq1gyUP9ptNULLeIxYbUienD4DobSzQSc7OiqpvD5jSFnI+iJr2jfpj4
	rTMA426hXXZREBUKTUhgnCX3Vj+V0kCbx92TGgU7u+zje/6/UKCLcxG69Q/lTiIQ0h0j5pa9cG7
	aaMDN5viHVV8sIc/+L/RxKgNRYiRX5nuqhC6mo0sPXTx09ySGvB7btTkyEp3nuj6rAOmInnSujj
	zh/rYCHrygJE3/najJ8KuGybEyDhVRamZmiNZwd95hzLC+/dV1SH5MApnyk/abwpBkprJSoLVRS
	gvm1UabVYAQg/dWzNzu8cPcl5sur8nlLBSmIJ4qGc7ahrS0XvLITnHrN+9JmqaU22NYQqdsyoy3
	rkjmrk9cSFic/bl0nzYR12vXbecwMjoEs4p3PBABKVD2pei6jpJh+92g1GIkbL169JU90BtIVlV
	mEBIpAYUaCjcvcPe9ws5BPEPbZHpPnHA4l3dNQC0A3Yz
X-Received: by 2002:a5d:452a:0:b0:48e:21f7:79ff with SMTP id ffacd0b85a97d-48e3eb97396mr8140147f8f.33.1793008322762;
        Mon, 26 Oct 2026 02:52:02 -0700 (PDT)
Message-ID: <32dc00b1-f91c-43a1-a1fe-f0bebbb76d3b@suse.com>
Date: Mon, 26 Oct 2026 10:52:01 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 3/4] xen/riscv: panic if the device tree advertises
 neither Svade nor Svadu
To: Baptiste Le Duc <baptiste.le-duc@vates.tech>
References: <1792164706.8631fc262581453bbf619ec5b2062170.1a14557373c0008425@vates.tech>
 <1792164867.8631fc262581453bbf619ec5b2062170.1a14559ab900008425@vates.tech>
 <4526ac23-ca7c-40e2-a9d6-9d366369d3bb@suse.com>
 <1793007897.8631fc262581453bbf619ec5b2062170.1a177994ca9000f79f@vates.tech>
Content-Language: en-US
Cc: xen-devel@lists.xenproject.org
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
In-Reply-To: <1793007897.8631fc262581453bbf619ec5b2062170.1a177994ca9000f79f@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-42698a/1793008323-ABED69EA-0B36E5ED/10/78276251493
X-purgate-type: spam
X-purgate-size: 1132
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 26.10.2026 10:44, Baptiste Le Duc wrote:
> 
> On 26.10.2026 10:32, Jan Beulich wrote:
>> On 16.10.2026 17:34, Baptiste Le Duc wrote:
>>> Suggested-by: Jan Beulich <jbeulich@suse.com>
>>
>> Did I, really? Iirc I left open whether to go the panic() route or the
>> alternative one. Based on Andrew's clarification as to pre-Svad{e,u}
>> behavior, I think I further tried to indicate that synthesizing the
>> correct extension may be preferable, to allow older systems' DTs to be
>> used as-is. In any event ...
> 
> No, you didn't, sorry. I misread your "The outlier is when DT lacks any
> information" as "panic when DT lacks any information", while you had just
> agreed to probing in exactly that case. I'll drop the tag.
> 
> For v8 I plan to:
> - trust the DT whenever it advertises Svade and/or Svadu, without probing.
> - probe only when it advertises neither, set the probed extension in
>    riscv_isa, and print a warning asking for the DT to be updated.
> 
> Does that match what you had in mind?

Yes. (Optionally probing unconditionally and panic()ing upon mismatch between
HW and DT.)

Jan

