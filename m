Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 552A6C43327
	for <xen-devel@archiver.kernel.org>; Mon, 29 Jun 2026 08:31:23 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1347322.1605177 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1we7OQ-0003wa-KZ; Mon, 29 Jun 2026 08:31:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1347322.1605177; Mon, 29 Jun 2026 08:31:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1we7OQ-0003wT-Go; Mon, 29 Jun 2026 08:31:02 +0000
Received: by outflank-mailman (input) for mailman id 1347322;
 Mon, 29 Jun 2026 08:31:00 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1we7OO-0003wM-CQ
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2026 08:31:00 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1we7ON-00D5Zo-1k
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2026 10:30:59 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a422d3c-e002-0a2a0a5209dd-0a2a4507b32e-14
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 10:30:58 +0200
Received: from [209.85.128.53] (helo=mail-wm1-f53.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a422d42-9c8e-0a2a45070019-d1558035a5be-3
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 10:30:58 +0200
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-4938d5f86f3so10401425e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 01:30:58 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493b2766da1sm31255735e9.15.2026.06.29.01.30.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Jun 2026 01:30:57 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1782721858; x=1783326658; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=BA+u9CpPPjUF1UCVGNn066kQfShNOOb5bEBVq77CtFQ=;
        b=HxgjlOyagfzADP4kIr4ceUJGcp1VwDrK9RHknGKNUKwFojkQCxBIvjXFx5y2KFFzYn
         pqCP4ERdBZPlVmsQD68B73k9G3qJRR3yq1vBe2MSngd9HeKeK8nqx2iMaeuyfeljuTyk
         ShO9JvXuM/s70vAIDZeQe7RnY953ifkPumDSl+Y77b7T3uQLd//cli287OHVQD9Pmtd1
         8nvZeKM+69kO2EiuOGZdW4o4TkB6IkrUEsiQFnRdFLithIj6EF7K4Ql04MAY5lwn1eQa
         J0/xfxeM8RRp0OQSb4ygVrGjgMpZw9quuIIUsfPGzTwXfLTpA+3C8/ak2VOuMcy/MOIv
         Z/fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782721858; x=1783326658;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BA+u9CpPPjUF1UCVGNn066kQfShNOOb5bEBVq77CtFQ=;
        b=OuEpENSt9pISH9Riff801WXKnhruKQXRGWeRJpPo86rx7ZBYopCwtKDVrM7CQ8D7zY
         nE3msqY3NmILFMPwFymceOiK4kG+Oet1FbBwkN9Y+cIp7+BxzaDkGbp53SDjkcZtijHZ
         +QaV+dP163oQCvpGUZVhlRbLJddPHOCMFdtA96NNuuhvYoHW5Clo+q3EHFzeMObGAwqu
         oMtyAu+L7i2Rods8HFt9tSF3XJLMBIzPux+dXMsAoZgRX/LuDdmEkrT3v2pAIN4mUKYS
         osoMyqocjNAttJBgxmKTGVA5j/ghuFjuZLQlrlz6IlO8yEMeypj9sA4AulbPE4YZ9xYf
         RO4w==
X-Forwarded-Encrypted: i=1; AFNElJ9z5ys/4NPviunqBuWeRlEsJTW2Aa3xTYwXuMFfEACwBX6tmYKZoTSZAkMswdxq+j8aLodle/tFm28=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzMh5j687Bp1zlOjzTyeAWLWKc238vb1+r8l0uOi05B5Z9jqUA9
	JKRAsCbSQ6lkWG5UB3mn3TEXAv1fIYuNJkMOkxYrw0A19bSvA1yj+GQwUk/s53zjmg==
X-Gm-Gg: AfdE7clUTqGy0hl9WaDfh/YuFOOLygMgRWCY28HQ2eOVZcc/IZ/qyUNPmvnV8wSQGqg
	TapfIg1R+o7FGkcHUcVgy9HA3iuCKx8LfKMXe/tUIkB6oPvGErsy6bIed3uDIiFI8iU1PbDVOTP
	80d3I/HVYZdpl5gubWpNYrt1bR9JM4/UVNo7R2WBpR9CNJXlW+J80+NrNSKRT+J7v+f24dlMp5j
	aEyQ2JHZHa6R3+bIRDx/tSBFeIxpXF6MeF/Mj4L9XDlIIBYwBP62GL0ZEVddywtTupKk9Wi3iaH
	Ydbc6tI1HwYgxbZMD1xuuazQSXy07xtMc5zjjeWMV5RU4iCpzdoWVf7NQCnU2+wfnqfUmsdzUi3
	cIWB/q/z9zKu6Nd8wDkrUfsuEQYoDQ3QZ1DSY1K6fXcCH3CMvHL/ZREp5+0RkBTSjLPCfJXP68w
	NMJDgQggD2k60v3eBa2yQjPH3MrwqJFfcEg+nn6modD/9SmAY68bDElaPKPPSBp3rkeAyjRz+Z8
	x+/
X-Received: by 2002:a05:600c:350f:b0:492:7025:13fd with SMTP id 5b1f17b1804b1-49270251449mr135447415e9.0.1782721858142;
        Mon, 29 Jun 2026 01:30:58 -0700 (PDT)
Message-ID: <c26465c5-77d6-4da4-911c-d8f407501fe9@suse.com>
Date: Mon, 29 Jun 2026 10:30:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/32] x86/msr: Drop 32-bit MSR interfaces
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 "lukasz.luba@arm.com" <lukasz.luba@arm.com>, Jason Baron
 <jbaron@akamai.com>, Borislav Petkov <bp@alien8.de>,
 Tony Luck <tony.luck@intel.com>, Yazen Ghannam <yazen.ghannam@amd.com>,
 Len Brown <lenb@kernel.org>, Pavel Machek <pavel@kernel.org>,
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>,
 Sean Christopherson <seanjc@google.com>, Paolo Bonzini
 <pbonzini@redhat.com>, "Kirill A. Shutemov" <kas@kernel.org>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>, Pu Wen <puwen@hygon.cn>,
 Bjorn Helgaas <bhelgaas@google.com>, Ajay Kaher <ajay.kaher@broadcom.com>,
 Alexey Makhalov <alexey.makhalov@broadcom.com>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Reinette Chatre <reinette.chatre@intel.com>,
 Dave Martin <Dave.Martin@arm.com>, James Morse <james.morse@arm.com>,
 Babu Moger <babu.moger@amd.com>, Tony W Wang-oc <TonyWWang-oc@zhaoxin.com>,
 Damien Le Moal <dlemoal@kernel.org>, Niklas Cassel <cassel@kernel.org>,
 Dave Airlie <airlied@redhat.com>, Helge Deller <deller@gmx.de>,
 linux-geode@lists.infradead.org, Olivia Mackall <olivia@selenic.com>,
 Herbert Xu <herbert@gondor.apana.org.au>, Linus Walleij <linusw@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "K. Y. Srinivasan" <kys@microsoft.com>,
 Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>,
 Dexuan Cui <decui@microsoft.com>, Long Li <longli@microsoft.com>,
 Guenter Roeck <linux@roeck-us.net>, Peter Zijlstra <peterz@infradead.org>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
 Adrian Hunter <adrian.hunter@intel.com>, James Clark
 <james.clark@linaro.org>, Josh Poimboeuf <jpoimboe@kernel.org>,
 Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Andy Lutomirski <luto@kernel.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Huang Rui <ray.huang@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Perry Yuan <perry.yuan@amd.com>, K Prateek Nayak <kprateek.nayak@amd.com>,
 "srinivas.pandruvada@linux.intel.com" <srinivas.pandruvada@linux.intel.com>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Artem Bityutskiy <dedekind1@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Ashok Raj <ashok.raj.linux@gmail.com>, Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>,
 David E Box <david.e.box@intel.com>, xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, x86@kernel.org
References: <20260629060526.3638272-1-jgross@suse.com>
 <d7c1db52-529a-43cc-ac7d-38b52627e8bc@app.fastmail.com>
 <c1608c48-13c2-4290-826b-28b5ca51eaf7@suse.com>
 <7332feff-2649-496c-8e49-b0a19eb54a32@app.fastmail.com>
 <9acced19-573d-4923-9329-8be408d2e555@suse.com>
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
In-Reply-To: <9acced19-573d-4923-9329-8be408d2e555@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ef75cf/1782721858-7EB3B25E-972EBB2B/0/0
X-purgate-type: clean
X-purgate-size: 1325

On 29.06.2026 10:15, Jürgen Groß wrote:
> On 29.06.26 10:06, Arnd Bergmann wrote:
>> On Mon, Jun 29, 2026, at 09:01, Jürgen Groß wrote:
>>> On 29.06.26 08:52, Arnd Bergmann wrote:
>>>> On Mon, Jun 29, 2026, at 08:04, Juergen Gross wrote:
>>>>
>>>> I assume this is fine, but since you don't mention it explicitly here,
>>>> please clarify what this means for 32-bit CPUs without the rdmsrq
>>>> instruction. Those will continue using the same instructions as before
>>>> and just change the calling conventions, right?
>>>
>>> Yes. I thought this would be clear from the following:
>>>
>>>     - They are based on primitives using 64-bit sized values anyway.
>>
>> Right, that was my reading of it as well, but it's not entirely
>> clear when the function name is the same as the mnemonic of an
>> instruction that only exists on newer CPUs and the later patch
> 
> There is no RDMSRQ instruction on any x86 CPU.

And perhaps wrongly so. On the binutils side I did argue previously that it
is in the spirit of the original AT&T assembler language to permit, but not
require, suffixes matching the size of (uniform) register operands. Even for
insns not allowing for memory operands, simply for overall consistency.

(I took the liberty to at least limit the number of Cc-ed lists some.)

Jan

