Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 197F2CD37AA
	for <xen-devel@archiver.kernel.org>; Fri,  8 May 2026 05:52:35 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1303187.1576678 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wLE8A-0001qi-00; Fri, 08 May 2026 05:52:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1303187.1576678; Fri, 08 May 2026 05:52:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wLE89-0001qa-QW; Fri, 08 May 2026 05:52:09 +0000
Received: by outflank-mailman (input) for mailman id 1303187;
 Fri, 08 May 2026 05:52:09 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wLE88-0001qO-Vp
 for xen-devel@lists.xenproject.org; Fri, 08 May 2026 05:52:09 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wLE87-005pz7-Sk
 for xen-devel@lists.xenproject.org; Fri, 08 May 2026 07:52:07 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69fd79fe-e002-0a2a0a5209dd-0a2a4506ba88-12
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2026 07:52:07 +0200
Received: from [209.85.128.53] (helo=mail-wm1-f53.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 69fd7a07-7371-0a2a45060019-d1558035e5aa-3
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2026 07:52:07 +0200
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-48334ee0aeaso11698255e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 07 May 2026 22:52:07 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48e642e2b29sm17617545e9.1.2026.05.07.22.52.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 May 2026 22:52:06 -0700 (PDT)
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
        d=suse.com; s=google; t=1778219527; x=1778824327; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=QiUDegGJK2Q/CSkBpiVME5VeFHxmVrExfgV9xxQPMFo=;
        b=MVcancLcVb5+GuExsoM5FaertqdRglL5JHAL0UE+A+zcIssAJUebCQQ0vX/m9CuTaA
         Pb0gKPg/mo3VWNXvKqDBpfh0lKIFZatHFMOtl9xpmdBwiqFUuPEhghGcQ9YQEJxZ75Qn
         /JV5kan07pUKBjY1puowsrcuiwJrGGlardbqffEkm+tu4bgYH9XhxmVzR6NSG78xVwPP
         5Kk9Xbjxvq9tcw88ILoU3JONjRIvNWhAvRECCAEFCzTN7G9eYXgAzMH738HDNWIwoDL/
         L7eE52R3nJb8pt4wT9wbsu7IafbeWR5+6G4iz6lcwzJiGxa6Efw1qeXrgtTLo81NlhJY
         J9Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778219527; x=1778824327;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QiUDegGJK2Q/CSkBpiVME5VeFHxmVrExfgV9xxQPMFo=;
        b=KpJu+0/N3EdDrGxqPEsGUX4qaCWIY/wcsk+s8LSabR0JfpSs0OHYp4SyZSJJL/0Gxm
         rTfq5c328hddZhhoRA8AgjNdIhEXcBB5KtENp/pVIxUcF8okOKhCYn8kWy/pyz1+dvi/
         bUWGEyqRP71sD3xQztFEmysRZRqd+SrtyKXYbBQ4MmdoZe/lSaYtbTzEvqE/LGhiLE4x
         sA0uB/t3R8CXe/PYfLn2cWIZT0RFIW9k10sF58Yh8+9TfJjpvtrdJmza+qgbsXOL2L+A
         /L5c/rYX3vGvopwgV+OmYmeliRQ+Prqk3uK9cnnNuKIGOFrdpi6Lt7Qqwy/R0DOOBCjH
         elUQ==
X-Forwarded-Encrypted: i=1; AFNElJ+pM1ohouR93Op1lmp7egIx48Vf8Z6ZZkAdY7FsnasyQ9FxFo6gPauNT/zJ55PKGiLbtmeBKqMZgzk=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw+TE4SORGkVxXntUXoDQwI72x15og+S92m/RoZlsrgv/ZyVGou
	j8nu0hiPywx60MOHyn97W5rwBJygqNMjPyT2siuP4QuPNCcnfAej9mnonrYR2JzXUg==
X-Gm-Gg: AeBDietheBYQkQMmPDTCj6Ochgbeo44g/e7FSgcUePLWAi2nfuDCClCtCZdUMXvSxt+
	Vo9RMB+4TJxUCc6IgIDwjkf5N+/jAjsFGGd/u42gvC5ZqJVVGr4RqDfE+UJiaioW++sHuxGZ1B6
	R9mrAalo2sbACcbWt89J1jnUuJcWsKaTzY4kHSh3upHcNxR47RMfecHx/Z6LI9Dc8yuubhYNjVP
	PYWuQap20YAdZmZTs9GTAc9l+TPwSo36o5rKrrTeivCIKKLLV2x5pqb1EkuDt8cPx9iJAhbfRWG
	UtCUgRH95gmR19q/zUG+mrRtvfIttATal7I9RQZXwuKgIMx1VnnXkyjKrIikPr2RDoPzOqoG/Lq
	JmScGZfGa2svNgZ0gYYVGvsAmHHHRbzbTF9rhvhWIGJQACG5GPLLWXIom4PDOWyR1zmV462yO6Y
	lt2DI0NLVgLKt/uFfh6jUKL5C136VJSXojFOGnC5fIZL4M8BiAeIJ2WutRsHJ+s870Lrg349VvT
	HhCtTn5sLrfpkI=
X-Received: by 2002:a05:600c:1d18:b0:48a:8cb6:88b9 with SMTP id 5b1f17b1804b1-48e51f44621mr169130445e9.22.1778219526625;
        Thu, 07 May 2026 22:52:06 -0700 (PDT)
Message-ID: <e9610f70-85b8-44d9-8e13-da26d506d5b7@suse.com>
Date: Fri, 8 May 2026 07:52:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/7] vpci: add SR-IOV support for PVH Dom0
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: Mykyta Poturai <Mykyta_Poturai@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stewart Hildebrand <stewart.hildebrand@amd.com>
References: <cover.1775742115.git.mykyta_poturai@epam.com>
 <a0abd984989237d2f36e1628db577fb25af1cdbe.1775742115.git.mykyta_poturai@epam.com>
 <5efddecc-3665-4a53-9eaa-b117370cc0e4@suse.com>
 <5168207f-33ed-4fc4-918e-6c3b454b0efa@epam.com>
 <efb254c2-f52a-408d-b225-e4e03935d05e@suse.com>
 <d0916f22-b5c0-4c93-935c-4cbe17e626d4@epam.com>
 <e5844c28-aa68-4bf6-8287-a4ceeda3a1d2@suse.com> <878q9vt0lg.fsf@epam.com>
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
In-Reply-To: <878q9vt0lg.fsf@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-16d1c6/1778219527-85B6DD75-5E4E99F6/0/0
X-purgate-type: clean
X-purgate-size: 3575

On 07.05.2026 22:40, Volodymyr Babchuk wrote:
> Jan Beulich <jbeulich@suse.com> writes:
>> On 06.05.2026 11:39, Mykyta Poturai wrote:
>>> On 5/4/26 08:37, Jan Beulich wrote:
>>>> On 23.04.2026 12:12, Mykyta Poturai wrote:
>>>>> On 4/21/26 17:43, Jan Beulich wrote:
>>>>>> On 09.04.2026 16:01, Mykyta Poturai wrote:
>>>>>>> From: Stewart Hildebrand <stewart.hildebrand@amd.com>
>>>>>>>
>>>>>>> This code is expected to only be used by privileged domains,
>>>>>>> unprivileged domains should not get access to the SR-IOV capability.
>>>>>>>
>>>>>>> Implement RW handlers for PCI_SRIOV_CTRL register to dynamically
>>>>>>> map/unmap VF BARS. Recalculate BAR sizes before mapping VFs to account
>>>>>>> for possible changes in the system page size register. Also force VFs to
>>>>>>> always use emulated reads for command register, this is needed to
>>>>>>> prevent some drivers accidentally unmapping BARs.
>>>>>>
>>>>>> This apparently refers to the change to vpci_init_header(). Writes are
>>>>>> already intercepted. How would a read lead to accidental BAR unmap? Even
>>>>>> for writes I don't see how a VF driver could accidentally unmap BARs, as
>>>>>> the memory decode bit there is hardwired to 0.
>>>>>>
>>>>>>> Discovery of VFs is
>>>>>>> done by Dom0, which must register them with Xen.
>>>>>>
>>>>>> If we intercept control register writes, why would we still require
>>>>>> Dom0 to report the VFs that appear?
>>>>>>
>>>>>
>>>>> Sorry, I don't understand this question. You specifically requested this
>>>>> to be done this way in V2. Quoting your reply from V2 below.
>>>>>
>>>>>   > Aren't you effectively busy-waiting for these 100ms, by simply
>>>>> returning "true"
>>>>>   > from vpci_process_pending() until the time has passed? This imo is a
>>>>> no-go. You
>>>>>   > want to set a timer and put the vCPU to sleep, to wake it up again
>>>>> when the
>>>>>   > timer has expired. That'll then eliminate the need for the
>>>>> not-so-nice patch 4.
>>>>>
>>>>>   > Question is whether we need to actually go this far (right away). I
>>>>> expect you
>>>>>   > don't mean to hand PFs to DomU-s. As long as we keep them in the hardware
>>>>>   > domain, can't we trust it to set things up correctly, just like we
>>>>> trust it in
>>>>>   > a number of other aspects?
>>>>
>>>> How's any of this related to the question I raised here, or your reply
>>>> thereto? If we intercept PCI_SRIOV_CTRL, we know when VFs are created.
>>>> Why still demand Dom0 to report them then?
>>>>
>>>
>>> The spec states that VFs can take up to 100ms after the VF_ENABLE bit is 
>>> set to become alive. We discussed in the V2 that it is not acceptable to 
>>> do a required 100ms wait in Xen while blocking a domain. And not doing 
>>> that blocking would require some mechanism to only allow a domain to run 
>>> for precisely 99(or more?)ms. You yourself suggested that we can trust 
>>> the hardware domain with registering VFs if we already trust it with 
>>> other PCI-related stuff. Did you change your mind, or am I completely 
>>> misunderstanding this question?
>>
>> No, I still think that we can trust hwdom enough. Nevertheless we should
>> aim at being independent of it where possible. And I seem to recall that
>> I had also outlined an approach how to avoid spin-waiting for 100ms in
>> the hypervisor.
> 
> I want to clarify: you are telling that Xen should not wait for hwdom to
> report VFs and instead create them by itself. Is this correct?

If that's technically possible, yes.

Jan

