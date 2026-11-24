Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B391606A31E
	for <xen-devel@archiver.kernel.org>; Tue, 24 Nov 2026 14:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=d46sLfuH
Received: from list by lists.xenproject.org with outflank-mailman.1501158.1697199 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xVrvG-0001qW-Nm; Tue, 24 Nov 2026 14:55:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1501158.1697199; Tue, 24 Nov 2026 14:55:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xVrvG-0001qP-KT; Tue, 24 Nov 2026 14:55:06 +0000
Received: by outflank-mailman (input) for mailman id 1501158;
 Tue, 24 Nov 2026 14:55:06 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xVrvF-0001qJ-Ri
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2026 14:55:05 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xVrvF-002DFZ-0g
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2026 15:55:05 +0100
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6b05a547-8faa-0a2a0a5109dd-0a2a45028408-10
 for <xen-devel@lists.xenproject.org>; Tue, 24 Nov 2026 15:55:04 +0100
Received: from [209.85.221.48] (helo=mail-wr1-f48.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6b05a548-4900-0a2a45020019-d155dd30b1dc-3
 for <xen-devel@lists.xenproject.org>; Tue, 24 Nov 2026 15:55:04 +0100
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-4a357b1c649so2721438f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 24 Nov 2026 06:55:04 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb884911e3sm528892685e9.6.2026.11.24.06.55.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Nov 2026 06:55:03 -0800 (PST)
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
        d=suse.com; s=google; t=1795532104; x=1796136904; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jTIAuIiDENoKTgbB9NSCQz7tv1j8q/ffn0/egovDW5g=;
        b=d46sLfuHjQjcCI+s619Qkt/7r1e39pYvSDwu8vG2ZDZeuHaONdqQGby/xSVg8my94w
         GUj8+8rETfBXiBDeVjYC99bs0ZAxbEGoMfMj1/yDfo/FKjp122TV1ROMzQlLYxadYNEs
         z13/gkjDAsT1h4hwiPCVZBfk8hL+KeL3juCfVFODnkZX1ENGT64PJ7RssFGItE11/ca3
         blzLjyE6c6BOc3HzC9ym9F4uExI7Gf8s0W5QvDLXXcuIFhjqFLh5Y8oebXA7oN/S2IFt
         SNC/mJhB/J50yX2c6uJ4p1sh+G/ykwQhQfn57S13O8BmEWLyHXu/uNhpUG1ddKVWcBfw
         IpGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795532104; x=1796136904;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jTIAuIiDENoKTgbB9NSCQz7tv1j8q/ffn0/egovDW5g=;
        b=kmoaW9wM6MBHifGPoYejEpgzQgsM0sXGIcq8BnCL0iMfkJwXmMqDiN/TOkdmaPTA4J
         kPLlDPACV41suVpwab7u8donpCI5Z12/2NJ8WKnNUhF6DHidWRLtsbcXGL3whrM+XIbG
         vV10nrEDOQRpD2Lv1i6+to394eLK+LVjQTaFMO95OvRl8BoWTnx1mMF2izZ2qRJbUzZS
         kRLMzt6u3E2mdibRPPS4gL8h23k6sSCXOiXcuA7AH08LycI9DTUrz0tUQzpO93TvDCaG
         jgHRkmPkPjKu7/ENktnMXyYOLebNXeFTgWMmObZ1Cg8Pak3RFTJIqjE6o/jygCrX7Mbv
         oWkA==
X-Forwarded-Encrypted: i=1; AL+hErGr3bBFKu6c/2NSK/BuBNy5qQ0FYL+bwQqpGv3FktYJa14kRTU/F7XM3WVUcCGEeGMNXPL17RPDoM4=@lists.xenproject.org
X-Gm-Message-State: APuU4Z8YzUJd8lEMngO2Z5WGv0TT/pDddPssMAL9z4qeH+Qn53iobVqF
	xn3nbeIq/Cn17KG3TPd3Al7s/Ftn4vkeyJzM8ur/v/5qUCwLBVjUBMe6h/fZPSvDwQ==
X-Gm-Gg: AZFdTZdyXnUtx/zEBu/s2qSjlTg85Xkv6RxKOigvVSohIAuwYneU8LW3n7IAfkYbfkH
	qiHc7VI4aab12b/F0tF1HHf0DifB7sbNVEln5BzsGT38pw6r5XhgxoJiDRSs2GAPIy04WJPhXHE
	1ACZNhr3IGGr4e0IeAmUc+DABENsH2WuZQyrTlVE6EBYQJHiZQozC+NSc6EYISCiWbliRdoRfp/
	Wexclqh2Kepj3PbX0YT4UPv3o5Kbaapr/+ulmgfy4CWNT+BDuvUxHw9kaiUlqh+ARaf7Gr2QXRL
	sdqOcn89kmVhPaihCJ6F/oz/N9PpH0LOaLNNj+3ZZKH7a8qzkih4iSRq6vLE06NV317dzDg0T20
	IAIULYTQ8VfIyhgpzjB8TiVeiioE61C/IF0CbzwmYUh+0qwgdz5vCKaiw03FplpULDITWiPTzQW
	xWBsE51iilZm4A0s7EIpawraOp6ykoBsnuivLdhIMGbrDgyQmEm40U8o4G6WTdehyG+uxmpfkiy
	Ihenuw5S5/h0ErRmAnQuOlKR1BM1KqYNirnetpuzdwERijiwbsbyQ8zg0cUK3vE8/fhUME/Zg+L
	S0SDw82yHJ2gLqakgj4p2w1nXEElPpCPfxiDlzATz2njPVSe4+5fMcGzgMEENNtCubg/nzgvTDM
	dqBchmda+NDQ6RW3z
X-Received: by 2002:a05:600c:4e02:b0:4bb:5d39:95fa with SMTP id 5b1f17b1804b1-4bb88811c82mr296088155e9.12.1795532104277;
        Tue, 24 Nov 2026 06:55:04 -0800 (PST)
Message-ID: <fdb46c25-f30b-4c4d-8d34-794b3249be7a@suse.com>
Date: Tue, 24 Nov 2026 15:55:03 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/sched: fix potential NULL dereference in
 sched_move_domain()
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: Dario Faggioli <dfaggioli@suse.com>, George Dunlap <gwd@xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@amd.com>,
 xen-devel@lists.xenproject.org
References: <20261124122004.2487366-1-jgross@suse.com>
 <52e2c84f-2e14-40cf-a515-d59bf32a3b5a@suse.com>
 <01f14efb-5c70-40a3-b362-66c99d2c699d@suse.com>
 <baddd6ac-5aa7-468f-947a-65dcc24963e0@suse.com>
 <507dd641-dde2-4eca-91e1-9c3dfbc2dfc6@suse.com>
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
In-Reply-To: <507dd641-dde2-4eca-91e1-9c3dfbc2dfc6@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-720697/1795532104-FA12B6C6-67560C20/10/78276251493
X-purgate-type: spam
X-purgate-size: 2408
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 24.11.2026 15:45, Jürgen Groß wrote:
> On 24.11.26 15:37, Jan Beulich wrote:
>> On 24.11.2026 15:07, Jürgen Groß wrote:
>>> On 24.11.26 14:57, Jan Beulich wrote:
>>>> On 24.11.2026 13:20, Juergen Gross wrote:
>>>>> If a dying domain has not all of its vcpus filled and it is moved from
>>>>> a cpupool with gran=socket to one with gran=core,
>>>>
>>>> Why would a dying domain need moving in this way in the first place?
>>>
>>> This is for avoiding a zombie domain blocking removal of a cpupool.
>>
>> Ah, I see. Maybe say "zombie" then in place of just "dying"?
> 
> But the moving is done for all dying domains as part of the domain's destroy
> process.

Then I guess I'm lost. It's hard to see why for something which is to go
away a complex operation needs doing, always.

>>>> Possibly connected to this, ...
>>>>
>>>>> --- a/xen/common/sched/core.c
>>>>> +++ b/xen/common/sched/core.c
>>>>> @@ -830,10 +830,13 @@ int sched_move_domain(struct domain *d, struct cpupool *c)
>>>>>            if ( unit->unit_id + gran == v->vcpu_id )
>>>>>                unit = unit->next_in_list;
>>>>>    
>>>>> -        unit->state_entry_time = old_unit->state_entry_time;
>>>>> -        unit->runstate_cnt[v->runstate.state]++;
>>>>> -        /* Temporarily use old resource assignment */
>>>>> -        unit->res = get_sched_res(new_cpu);
>>>>> +        if ( unit )
>>>>> +        {
>>>>> +            unit->state_entry_time = old_unit->state_entry_time;
>>>>> +            unit->runstate_cnt[v->runstate.state]++;
>>>>> +            /* Temporarily use old resource assignment */
>>>>> +            unit->res = get_sched_res(new_cpu);
>>>>> +        }
>>>>>    
>>>>>            v->sched_unit = unit;
>>>>
>>>> ... is this field becoming NULL really okay? Perhaps just for dying domains
>>>> it is, but then the original question remains why they would need moving in
>>>> the first place.
>>>
>>> Not setting it would leave a potential UAF, as the old unit will be freed.
>>
>> Sure, it needs setting, but setting to NULL when NULL may not work everywhere
>> wouldn't be much better than leaving a dangling pointer.
> 
> If the domain is not dying, the function will return with a negative return
> value as soon as the missing vcpu is detected.

But the vCPU / domain / system is in a bad state then, isn't it? Won't this
hit us (hard) later?

Jan

