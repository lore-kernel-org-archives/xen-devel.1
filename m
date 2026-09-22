Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 128DCC982FE
	for <xen-devel@archiver.kernel.org>; Tue, 22 Sep 2026 15:11:13 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1429117.1652052 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9292-0004Vr-JT; Tue, 22 Sep 2026 15:10:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1429117.1652052; Tue, 22 Sep 2026 15:10:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9292-0004Vj-GC; Tue, 22 Sep 2026 15:10:56 +0000
Received: by outflank-mailman (input) for mailman id 1429117;
 Tue, 22 Sep 2026 15:10:54 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x9290-0004Ty-GJ
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 15:10:54 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x928y-0009nq-PH
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 17:10:52 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ab29a72-e002-0a2a0a5209dd-0a2a4507e460-30
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 17:10:48 +0200
Received: from [74.125.225.141] (helo=mail-wm2-f13.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ab29a78-b4ea-0a2a45070019-4a7de18dba37-3
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 17:10:48 +0200
Received: by mail-wm2-f13.google.com with SMTP id
 5b1f17b1804b1-49b912d8239so30652435e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 08:10:48 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49fdaa4e47csm110344655e9.1.2026.09.22.08.10.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Sep 2026 08:10:47 -0700 (PDT)
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
        d=suse.com; s=google; t=1790089848; x=1790694648; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8jfV5Zs9qAdGqOsefDfzrCrrfCsilXB5G5oCWhUPhqY=;
        b=Xf6fgc/lOQbV3Fv04mhSU9SwzPuN8TaXk5oFN+qGRPkg56NZeZHEDLDg1U1RMSPLQB
         wq4DkVfJ/6Fqs2Q7E4cPfsWFZWIqwe96iWl7MSPFpsrJpIgVieAxvVRjbBdIdrgqNceI
         z6OhMSWmGZB9wbF7r4rwxJXm7rnm16EAxbjQvi7fmDOIY3gV0BURX7eY2YcFAiMNzQWC
         f2M62uLiFJsvE9/+OywWzGF8O6ryku4PZwdCLUatl9zv9BSiwO/nlZkrwuKfcu5vvpB+
         5XWGRPHk/W2WpAVyW1gXeqLlHzzlthKXdniPj0nlaZVWy9F1l32NDEwUzp2MbfbjP7TJ
         AF4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790089848; x=1790694648;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8jfV5Zs9qAdGqOsefDfzrCrrfCsilXB5G5oCWhUPhqY=;
        b=R6/nr50NG9fz3IC5e50IkMSIpV6MpBeglqOrB/nQzW3nlsQx7jf5AlpHvXM8C9ZamN
         inS/sWXuiqRMng9mL0PMVkljBOfgkpJxj5arzNxSBXIcPAoMiOWVx6rpSpomgHA5+5TT
         MfzlpQmawfLsFfcgBJYQg0lWh3UbOLFoy8nGpNH8SHtv74JSZWIcelet/LhxfiS6byEc
         SYwmFlYwRCteLqx1bCnaYsHdLtIXknpgVfaawnPF77m8v7T8omvHLik7tzXEZFZHhceE
         iGpwSu44yyvUiuEE4uEx6JqHmL2hY08gmozi29jMAVNI4EKbjs2JbHewcRWb4VasOp+j
         cmWw==
X-Gm-Message-State: AFuF++nIln+F7ExmKPigZUb/r5N/NAOh/U/Pq9E1KromMIp2bMGLmkxC
	icpY8THooLclFU4ErBoT+9Ijebn8b7dUeeWtAu+eHv+q0ZG3wF0RL0YXRpKLTDEf7A==
X-Gm-Gg: AYBFou2UZbi3VNhGbd2gMOcr+GT8ay/dtz1VfNhB0q1ruPQddlCHSdZ5/1NVIqhmlW3
	nW3y8WaeyGbKN4k7jYEWDcPsO/VVjNIcjX2uV4MHIyGbgZozBjivPe5mCtjT214AupmNfpkur94
	IMC8aLUEJVas729U1lutm2Woi2u6MrKyg2pheYSYG7sbYsPUV0wyQcReAsfrb8zCQ+G9da4gU4R
	JlZvRqq4bePus35+Jdkdt620l57UhD8l37oxHb2ty9nCFClOS+WlKM+vprlho+9HbgQutDk+4HH
	A0BybWZYXEpp+Mpo+//NHd9zk6V1kgjJtgJcd1rEAx5GpLRFqsxHlbj5edhnrehDKQPQPl8iGQg
	a3UN4gio0T+z9GKGzxqKqr7ylQJTMEykUckfmgY3Wi4Uc2yKVj5VtCC+uGWKgGGFBok/vPEpMH/
	LTNAtpzwsdQWvG+9W6LdjoNkc6z6JYzHkIz7vnhv88boUUnOctfquQkdYFj4b5HcFCkQq/KaHVk
	ZFpn3y6NVP7bf8MZyBW4XyKFy0txQ9oP0t8vHFge89IAykTplUxEeqgUH7EP2Y=
X-Received: by 2002:a05:600c:4695:b0:49c:d019:70c5 with SMTP id 5b1f17b1804b1-49fc55ac96emr214042675e9.0.1790089848006;
        Tue, 22 Sep 2026 08:10:48 -0700 (PDT)
Message-ID: <7d374a65-9786-415b-b869-9899cb05bbae@suse.com>
Date: Tue, 22 Sep 2026 17:10:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/6] xen/riscv: make Zihintpause no longer a required
 extension
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: xen-devel@lists.xenproject.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>
References: <1789032657.8631fc262581453bbf619ec5b2062170.1a08aa7f23b000c4f3@vates.tech>
 <1789032898.8631fc262581453bbf619ec5b2062170.1a08aaba10f000c4f3@vates.tech>
 <20c2003f-910b-4e9b-92f4-5298f11f58df@suse.com>
 <66104177-def7-419e-b6c6-55c3cbc04ddc@gmail.com>
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
In-Reply-To: <66104177-def7-419e-b6c6-55c3cbc04ddc@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ef75cf/1790089848-3C411AE4-E0ED3276/0/0
X-purgate-type: clean
X-purgate-size: 2381

On 22.09.2026 16:26, Oleksii Kurochko wrote:
> On 9/22/26 2:27 PM, Jan Beulich wrote:
>> On 10.09.2026 11:34, Baptiste Le Duc wrote:
>>> required_extensions[] panics at boot if Zihintpause is missing, but Xen
>>> never actually depends on it: cpu_relax() only emits the "pause" hint when
>>> the extension is implemented, otherwise it emits `0x0100000F`, a legally
>>> valid FENCE instruction (`FENCE W, 0`) rather than a native NOP.
>>
>> Just that PAUSE's encoding is 0x0100000F. I.e. what is emitted is always
>> the same, and hence discussing the encoding aspect here doesn't help
>> justify the change. NOP or not also doesn't really matter here. The
>> specific hint encoding looks to fall into what prior to Zihintpause would
>> have been covered by "Designated for future standard use", and hence ...
>>
>>> FENCE is
>>> guaranteed by the RISC-V base ISA, so it never raises an illegal
>>> instruction fault. With an empty successor set, it enforces no
>>> memory-ordering constraints and thus architecturally behaves as a NOP.
>>
>> ... there indeed should be no concern for any platform playing by the
>> rules.
>>
>>> Drop it from required_extensions so hardware without Zihintpause
>>> still boots.
>>>
>>> Assisted-by: Claude:claude-opus-5
>>> Signed-off-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>
>>> ---
>>> Changes since v1:
>>> - rewrite commit message.
>>
>> I fear another round of re-writing is going to be necessary, sorry.
> 
> Would it be better:

Quite a bit, yes; just one thing ...

> required_extensions[] panics at boot if Zihintpause is missing, but Xen 
> does not strictly require hardware support for it.

... here: required_extensions[] isn't a function and hence cannot "panic".

Jan

> The PAUSE hint (Zihintpause extension) is encoded as FENCE W, 0 
> (0x0100000F). In accordance with the RISC-V Unprivileged ISA, HINTs are 
> encoded in the space of valid standard instructions. On platforms 
> without Zihintpause support, executing 0x0100000F is treated as a 
> standard FENCE with an empty successor set, which acts as a NOP and 
> never generates an illegal instruction trap.
> 
> Therefore, Zihintpause is purely an optimization hint. Drop it from 
> required_extensions[] so systems without explicit Zihintpause support 
> can boot Xen successfully.
> 
> ?
> 
> ~ Oleksii


