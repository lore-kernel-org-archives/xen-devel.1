Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0271FCCA464
	for <xen-devel@archiver.kernel.org>; Fri, 16 Oct 2026 09:12:51 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1451442.1666508 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHdzT-00006i-1g; Fri, 16 Oct 2026 09:12:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1451442.1666508; Fri, 16 Oct 2026 09:12:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHdzS-00006b-VD; Fri, 16 Oct 2026 09:12:38 +0000
Received: by outflank-mailman (input) for mailman id 1451442;
 Fri, 16 Oct 2026 09:12:38 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xHdzR-00006V-UE
 for xen-devel@lists.xenproject.org; Fri, 16 Oct 2026 09:12:38 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xHdzR-007oQA-An
 for xen-devel@lists.xenproject.org; Fri, 16 Oct 2026 11:12:37 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ad1ea7b-bab6-0a2a0a5309dd-0a2a45059cdc-28
 for <xen-devel@lists.xenproject.org>; Fri, 16 Oct 2026 11:12:37 +0200
Received: from [209.85.221.44] (helo=mail-wr1-f44.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ad1ea85-4cb1-0a2a45050019-d155dd2ced98-3
 for <xen-devel@lists.xenproject.org>; Fri, 16 Oct 2026 11:12:37 +0200
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-48afcfc4bf5so1114251f8f.1
 for <xen-devel@lists.xenproject.org>; Fri, 16 Oct 2026 02:12:37 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48dfd4f9c41sm3991412f8f.38.2026.10.16.02.12.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Oct 2026 02:12:35 -0700 (PDT)
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
        d=suse.com; s=google; t=1792141957; x=1792746757; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f8h6BSo7sSt2Nw41p0ugsO5choButV3zT6uwUEHEcd0=;
        b=LACCQHTtEaf3WMvkgxjKrRPJqGibMJF6WepfpHo/jHZ1cOJxNznsRwSZiLYoZT4FR1
         ihkuF5PxiIOZorQHosxSQVn+SwlNBxRnkMbR4Q66PSA16dbTTbNmAXndLN9aY8YsA8oi
         TS4ilr3MsBJNnjzQwHE7quinExC/miaNB8vC57Cengkrd16NzAIVEvu2ZdTD4LRDRLd8
         LLRxbap2pF0Blwk1wPWhu+Ni6s9VntClKBUnGdrS46hahBQNeY9L9AWy3WbMi+PN3s7J
         Tgl0ARJklP7hrg06sbIdzkoanyMvv1v4trPAkutWYzzVuBelvRC4B6Eoz3Ze2dOLd1mB
         +TLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792141957; x=1792746757;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f8h6BSo7sSt2Nw41p0ugsO5choButV3zT6uwUEHEcd0=;
        b=H8HKb1qCR1z0wj888tWnM6r798p12Mpn+yi3l6c3MvnpTfyeLhUrQYU7wM2gWbqHUl
         t/+MgWugRpu0vSj1tPphX3Xl7VPLiAW+GmDkCJGXCjBpU1yHYJX1jt4qupBJFUXapOQD
         T2c4ovmanr/+IwkaMVv6Bg5F62M64WIjwK0ZIjI+amU8e0i0gYGPAEhm21l81/XOUIhD
         4E/Xh6DO5ppAxg6eNdQa0LaxC5je9VR0K8+CTH3Y9iJHAGXJT2NwfJeCWEEgw74cUfWR
         I3eT4cO76yTuM7e+m9Bzzxq729RyAn8jwJ4oNrVXpdX1+gU6wPO7+KaAVXsXhVWiTbiU
         XsuA==
X-Gm-Message-State: AFq9FYIIB+bU21fkQ9oTqMxzQyrkayKRhPBI4lYEURuJoSqXtAApHmEO
	4rWqQaFxZH9mZCMgwQrHb6VQ4/jJdZfLG2mf0DMtq+DqlgQd5qyyrCVxz4x+3GqeDA==
X-Gm-Gg: AYBFou0yJo6xRkgFZF0QOYgAqPyoIH8Is+luG6mdp2E0H03ecUi2sCTRIpnA1amDhrQ
	UgeVIqgysnptbnbboLTvK7d8sGt0LJnHI9cIA+SNOqRNpzSGHJtIzeZ2JXjpINkGdXieIjWhXt8
	PEq6vTnMljk7G+Vpb+2F+qo57TjR8hed5JSzvKWrnWlptcPnIDJwoDJCHompszMBAAxp4yT2ORH
	u8D5auEuzztfPu5BcLcv+5XkfC74dzv3yUgIoyd6MC2YOmmoGDrl3zJ9CglTseTF/EQbYmCGC2F
	tYLUBDbFdrHAX/3XvMSrepm0M/ib4N5j3hDdFAemInSl9nlC3/jdxmWez4cPPTLdb9Cl/aNHElD
	Og1r/RD+Fd4gCsWCpKuIV6eFpnTqOQ8RUQRC+WIlKqLhEZ2kuKb05HwTHt4Mhzc49KLOTpIfyq/
	LBgNGDFKIAZa637/GYdFEO82a/eViMnCqemFU9wccNLEmJRT6a4Ox7aQcW6A0/mOKMcPo37hOYZ
	pbH6LM6gISott98vddalOU2dMF3Lr1GALP8pzAfq/kKC0/n5DwyA1VasK4Xpg==
X-Received: by 2002:a05:6000:178f:b0:48e:223:ab06 with SMTP id ffacd0b85a97d-48e0223accemr1014876f8f.31.1792141956691;
        Fri, 16 Oct 2026 02:12:36 -0700 (PDT)
Message-ID: <764b7c0b-1a1e-4d0a-bded-28b5e9f9e703@suse.com>
Date: Fri, 16 Oct 2026 11:12:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/15] x86/PVH: try to map initrd directly into Dom0
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 Marek Marczykowski <marmarek@invisiblethingslab.com>
References: <1b4c2bb4-118d-497c-8d7d-f3824fd61a73@suse.com>
 <78cd46cc-84ed-46df-96c9-26ce97ed0da0@suse.com> <atEQPq2zvmxxEgIY@Mac.lan>
 <acbbec65-3435-4869-ab71-090afd751083@suse.com> <atHn-f8lBH0pfPEn@Mac.lan>
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
In-Reply-To: <atHn-f8lBH0pfPEn@Mac.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c201ff/1792141957-247132A1-9CB8035B/10/78276251493
X-purgate-type: spam
X-purgate-size: 1547

On 16.10.2026 11:01, Roger Pau Monné wrote:
> On Fri, Oct 16, 2026 at 10:58:09AM +0200, Jan Beulich wrote:
>> On 15.10.2026 19:41, Roger Pau Monné wrote:
>>> On Mon, Oct 12, 2026 at 10:25:11AM +0200, Jan Beulich wrote:
>>>> @@ -867,7 +1078,7 @@ static int __init pvh_load_kernel(
>>>>          }
>>>>          start_info.modlist_paddr = last_addr;
>>>>          start_info.nr_modules = 1;
>>>> -        last_addr += sizeof(mod);
>>>> +        last_addr += sizeof(*mod);
>>>>      }
>>>>  
>>>>      start_info.magic = XEN_HVM_START_MAGIC_VALUE;
>>>
>>> Isn't this still not properly ordered, as start_info address must
>>> strictly be below 4GB (as is passed in a CPU register with the CPU in
>>> 32bit mode), yet it is allocated last in pvh_load_kernel()?
>>
>> Well. For one, this is pre-existing. With the size of the region that
>> find_memory() needs to find greatly reduced when the initrd isn't
>> included there, there's about zero chance that it won't find a suitable
>> region below 4G. Once we have find_memory() go downwards from 4G, the
>> remaining little bit of a risk will also go away.
> 
> Might be worth mentioning then, so it doesn't look like an oversight
> since you adjust the ACPI allocations.  No strong opinion, just
> noticed it was left behind.

I've added mention of this, but only in the remark of the patch. Really
pvh_setup_cpus() may want to check for no truncation? Or the parameter
type may want to change to uint32_t, with the no-truncation check then
living elsewhere?

Jan

