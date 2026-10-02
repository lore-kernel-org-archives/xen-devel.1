Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE67ECA5FD9
	for <xen-devel@archiver.kernel.org>; Fri,  2 Oct 2026 08:09:15 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1438914.1657437 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xCYKI-0006rt-Ea; Fri, 02 Oct 2026 08:09:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1438914.1657437; Fri, 02 Oct 2026 08:09:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xCYKI-0006rm-Bg; Fri, 02 Oct 2026 08:09:06 +0000
Received: by outflank-mailman (input) for mailman id 1438914;
 Fri, 02 Oct 2026 08:09:05 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xCYKH-0006rg-0A
 for xen-devel@lists.xenproject.org; Fri, 02 Oct 2026 08:09:05 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xCYKG-00FQHM-DG
 for xen-devel@lists.xenproject.org; Fri, 02 Oct 2026 10:09:04 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6abf6699-2eae-0a2a0a5409dd-0a2a4509cd42-42
 for <xen-devel@lists.xenproject.org>; Fri, 02 Oct 2026 10:09:04 +0200
Received: from [74.125.225.141] (helo=mail-wm2-f13.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6abf66a0-be1a-0a2a45090019-4a7de18da4de-3
 for <xen-devel@lists.xenproject.org>; Fri, 02 Oct 2026 10:09:04 +0200
Received: by mail-wm2-f13.google.com with SMTP id
 5b1f17b1804b1-49e7bcb94d3so55825805e9.2
 for <xen-devel@lists.xenproject.org>; Fri, 02 Oct 2026 01:09:04 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a027734b49sm64020455e9.10.2026.10.02.01.09.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 Oct 2026 01:09:03 -0700 (PDT)
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
        d=suse.com; s=google; t=1790928544; x=1791533344; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MwvkEj/TS31JfS5RSjKTLCVJrQdmgPv68p4D/s3l3eo=;
        b=Js8+8xcVRToXZR7X4uitsukzOLx/t7QMs/KQXM+F8gxSydCGBwcci1FfMoOk39L8EG
         6DiaHkM7JrNdXOXxYDUwM0GEa7bWxXvx9ciCWsA7sRhc8SvIUn8CzkXvuXrcSalfdzuR
         SPGGtwvBt2BenKFTnUossy+yswEODU+MTGHowSQd6nbSqvq5rdTxGAL5u6kDzlaMIhYv
         X0YvPNt2DUxTo2CvBTGB1+fDusJWDerVrjxc/eQLRO+nBmQ59r8AkaD4XC9etRblEh54
         QrEOCfFgfrtofqSfw5d0whj8pROPGoWHBM7IE6b5zuxtgxg2OjLhVeEO22Pg7efOdwfH
         QH5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790928544; x=1791533344;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MwvkEj/TS31JfS5RSjKTLCVJrQdmgPv68p4D/s3l3eo=;
        b=mKPFYOIPhHmPcTUpt81DmjGYmuOeriWauGV6yOY5yWlxEJbsVmpZFPZOZ11rnKEwlF
         1swJgkMDl1Mtffrll8h0w0Rts0iHZuRfXDTRX20wS8btwAfJRpHewfGtmCd5JNwsm+68
         8e6xtdRigsaeBX+ZrRFrTfpekNijf+lUAhhcmHd0ko6vkGWo4OVpenr39X2C5/BVW3bo
         jKSQJv36ouzod7C9Ka9PiOp9R5rw+4iUTYOGe6MmeycBvP3sERz8RMEWLogqTkxvEnD/
         M6+D0dr8V+QawL+k1FnGCvuZ6ormnJWo29RdqQ4GPQmHY6InMLu2wTwRROpHlREVU9UH
         ktqQ==
X-Forwarded-Encrypted: i=1; AKwUvBxtEkNOa96L59ci3SfZSdUvhMArhwmIdgFnrrfDsiWYCTJsmdIKXSn2tewcQH79qZkpWTsPXpbDAXo=@lists.xenproject.org
X-Gm-Message-State: AFuF++nHchXwivMh6PZpfXDom2KOsVbY4MmYAjT57l4wXeyjgKTWqGBZ
	1Ygf3ytFhaOxH489BAJ7C6ItelFFD0IsLwBbq7j7X6Ti2G8P6EaKiknI0E5DgOJ5Qc9ukVZwtjp
	w+ipbBg==
X-Gm-Gg: AYBFou2ijFXTvL9a8o1wq7zwYh1Eax06AWpD3c+a4NWztPXlhmU+Tm29ngbIoAR+HZq
	A8HWmrm+E6GSZoArIaaR1GjYkq4y4HqNrdk24UD2glrczjTXkafdpk0fzyTXyHz5enW1mizRzvB
	VC4Ok3jSfYLHvcvBWkeT7HYqNkXihtfA/YfR+XHKpQf+xO7zUAkOr2gGrR8tVaHILcpBej+FUa1
	FbiwOH9W+K2SRdEVkk/ZA3FlSMYRHa3hm1mtoMuad4noZD4zqwfpTDBRYRwAW6bZb4c66V+qnka
	JDYcWqNjwUA+qTqCn8y4KZzL0ZoDCFqFBeQSuwc2e/4dKnqem/cusx7p9Bt7cu+8PFwqf0OFg5x
	rD9PQIiZbjggXtxzNhL9W9u3HCpJTsXW6kU2uGhjYM3UgU7y0EK6OWdLqzH+9SeZyz8BBwtjVgZ
	q7anIP8IyY29/oA3DwjlZV0UUIEjEJRDt65zFizjQ9tNdNYiOZdCRuu+aFRw6FP+baKFCTVNduO
	UWEaHOUOBe1VZ3CIrWQ2sUjaOKrKaacLyp68BfoheEyuAltsabf85OBcvQ0xQ==
X-Received: by 2002:a05:600c:34cb:b0:4a0:1fe2:d4c8 with SMTP id 5b1f17b1804b1-4a02754224amr36092125e9.5.1790928543491;
        Fri, 02 Oct 2026 01:09:03 -0700 (PDT)
Message-ID: <1226702d-5bb4-4e7a-8e6a-6534002cfd8c@suse.com>
Date: Fri, 2 Oct 2026 10:09:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/domain: restrict context switch hooks for the idle
 domain
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>
Cc: Grygorii Strashko <grygorii_strashko@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
References: <20261001142757.98255-1-roger@xenproject.org>
 <f3754c45-7899-4e76-bb29-dc8deca0903b@suse.com> <ar9htQD7BC6dRCRS@Mac.lan>
 <4eb32155-1b04-4f04-ab9b-f30e584cb033@suse.com> <ar9l3GKKZtIjfgaP@Mac.lan>
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
In-Reply-To: <ar9l3GKKZtIjfgaP@Mac.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-bad1c0/1790928544-BFCD7034-2B9CC734/10/78276251493
X-purgate-type: spam
X-purgate-size: 1793

On 02.10.2026 10:05, Roger Pau Monné wrote:
> On Fri, Oct 02, 2026 at 09:55:09AM +0200, Jan Beulich wrote:
>> On 02.10.2026 09:48, Roger Pau Monné wrote:
>>> On Fri, Oct 02, 2026 at 07:45:07AM +0200, Jan Beulich wrote:
>>>> On 01.10.2026 16:27, Roger Pau Monne wrote:
>>>>> --- a/xen/arch/x86/domain.c
>>>>> +++ b/xen/arch/x86/domain.c
>>>>> @@ -813,8 +813,6 @@ static bool emulation_flags_ok(const struct domain *d, uint32_t emflags)
>>>>>  void __init arch_init_idle_domain(struct domain *d)
>>>>>  {
>>>>>      static const struct arch_csw idle_csw = {
>>>>> -        .from = paravirt_ctxt_switch_from,
>>>>> -        .to   = paravirt_ctxt_switch_to,
>>>>>          .tail = idle_loop,
>>>>>      };
>>>>
>>>> Leaving NULL pointers around isn't a good thing, though. May I suggest to
>>>> at least poison the pointers then?
>>>
>>> I don't mind doing so, but I don't think we usually do that for other
>>> hook structures, ie: hvm_function_table for example doesn't poison
>>> unset hooks (and it possibly can't, because there are .hook != NULL
>>> checks).
>>>
>>> TBH I'm missing a benefit of the poisoning here.  Using NULL or a
>>> poisoned value will both trigger a page-fault, and NULL has the
>>> benefit of callers easily checking whether the hook is set.
>>
>> NULL in the context of a HVM vCPU will #PF. NULL in the context of a PV
>> one may not, depending on what the guest may have put there.
> 
> It still feels a bit arbitrary to do here but not in other places,

We should imo resolve this by replacing NULLs wherever hooks could, due
to other issues, end up "in sight" on paths reachable for PV guests. This
would then also cover potential speculation along such paths.

> but never mind, I will adjust and send v2.

Thanks.

Jan

