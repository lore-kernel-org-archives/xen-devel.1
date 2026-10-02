Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB251CA5FC4
	for <xen-devel@archiver.kernel.org>; Fri,  2 Oct 2026 09:35:56 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1438984.1657509 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xCZg9-0004uW-U9; Fri, 02 Oct 2026 09:35:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1438984.1657509; Fri, 02 Oct 2026 09:35:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xCZg9-0004uO-Qf; Fri, 02 Oct 2026 09:35:45 +0000
Received: by outflank-mailman (input) for mailman id 1438984;
 Fri, 02 Oct 2026 09:35:44 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xCZg8-0004uG-CN
 for xen-devel@lists.xenproject.org; Fri, 02 Oct 2026 09:35:44 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xCZg7-00BsMu-PU
 for xen-devel@lists.xenproject.org; Fri, 02 Oct 2026 11:35:43 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6abf7aee-e002-0a2a0a5209dd-0a2a450ba39e-8
 for <xen-devel@lists.xenproject.org>; Fri, 02 Oct 2026 11:35:43 +0200
Received: from [74.125.225.141] (helo=mail-wm2-f13.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6abf7aef-b7e8-0a2a450b0019-4a7de18d9d2e-3
 for <xen-devel@lists.xenproject.org>; Fri, 02 Oct 2026 11:35:43 +0200
Received: by mail-wm2-f13.google.com with SMTP id
 5b1f17b1804b1-49e7d2bb404so15689655e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 02 Oct 2026 02:35:43 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a0276f92d9sm68484375e9.4.2026.10.02.02.35.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 Oct 2026 02:35:41 -0700 (PDT)
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
        d=suse.com; s=google; t=1790933743; x=1791538543; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ALf/05Xs/WcvJ/weuu2xekTsOp4EceD5pur5DkQi6Rc=;
        b=bP6sGTIvGrXcLWBSG/ZaDcgYyov4mgrfs+Kj3l29V+Dnd67iXkDVRORuNcaHbUhnSA
         NHKzBICj3XBvsKAU8kNTaGgtio9Gp/arrRgPxDIeqZ7FcEWeh+iQkRkpSTdIL8rr/GoV
         nMgsDZ7JWyfMPwIO1aig1cMb21rcKINhrXfYkGhsERIjHcOhMhtmGuHA29rJfFzg/+3q
         JbfU9Ln0ovSbKBZVgiX8RRkduVzdhG46VdXG28RAew1au1iCoOjgUDf2+KyKRhU6J85n
         oLkA965TmIJxaJIGWg3U12R6VZYodQ2uozWYu9j1qEWq9CuPrcAAC/aTvn/wf2Q/1E1d
         nxzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790933743; x=1791538543;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ALf/05Xs/WcvJ/weuu2xekTsOp4EceD5pur5DkQi6Rc=;
        b=nR6Ma53h3TC0OboUJNGEBYJd0I/aijXApkRLdLie2lo6m59czQIIx6Tj9SWJSURtFe
         Nx8TBM+KxVYLmrqFh40vY5i8xu+TZUTNcc1RGrzvbKzPV+DBREnYcWEJs2Yo1daI87my
         kqGfJgBYyQlDc1DbiXGNC5eXa7Z41667qpYybtLDwUSsKBoFmjg13QDMFJY/sH1LDqLH
         Fam6AmAsfluVQGlgAiNDPw4e26EapkQJkaxhMU6ZlXU4eaWm2OJC2VpU0rIl2Gfnd8oh
         tIVuknMY277JpxyPNFx1eNBVG5I3+DVmeLamvllMssEeubqpEKMtQOS+kvPEn+XQJ1i4
         PWkg==
X-Forwarded-Encrypted: i=1; AKwUvBwdSsvhwhcUaoaRLnyp25ZJShvg7r+HqmsNhE8caeigy3EiJ/t0cQxni8PdLiYEfq2osnBedtiMowg=@lists.xenproject.org
X-Gm-Message-State: AFuF++lKhJTOzKgOAwkc9bKrrSCN1Zqz3beavDeOVpcXQWrmoOLGvDuu
	Q5U/xas09cfRMfAp1KU/dW5xIm0m5nP0sa6pZU++bH97s55bagOzoCHjIJkGxUPMAztnBELBArO
	dM2wLCA==
X-Gm-Gg: AYBFou0SfmsSmSO63IwnF8w4XMDeeADpwbl2KDYy5i1fXMw9rbckTpPcmCodoQTw7GW
	wqVYn21bfxrdeeSw+P+7q0mxj3Jydy+WrFHnAOZQUaVMGauLI44QZQisiy+HpNETTBQHLV0ZoWQ
	PeNWxASgTtvOZFccQcQZzzI0kuqB9IXetEmcbNndx4IYWa2iCthmfuN+XBmCrKi2k7wlBJeN3bQ
	TMbNPONWud4tnoO1I1hHasS5702ukDd845s++ZlBI2gLJTkZBFXfscT/1I3Qnm55aqY8YZcR5yo
	XrrVlxplMI+oTFca8ky+0Qk++sEY91kfvVHcFSUjy3d10Y0kB8oEI1jQ0e+xUfD0lqUFqCyqi2n
	lSOv+TwTASCLi87RuX/GEbGkEwGo2rK+gOWKaKZSQhT9afZyqr8WsdMgwWFp2abryuEPI6Q2jXt
	+wMFoirkBtNzyee9WiuQDKbquym/q7D+UGEO9SHmOrMngyViFe3Y7yB2rGaNy7KFoN0EBLP/nb1
	XmRNOvdNJJcDHFDGwL+kKNWfIKKQhQVDdlUInZfGyRLNz9ECFB5CyI8FqW+mD4=
X-Received: by 2002:a05:600c:a10b:b0:49e:6865:904e with SMTP id 5b1f17b1804b1-4a02754fcddmr29772325e9.12.1790933741969;
        Fri, 02 Oct 2026 02:35:41 -0700 (PDT)
Message-ID: <e8c21a28-508a-4cf5-b983-4983b2c0081c@suse.com>
Date: Fri, 2 Oct 2026 11:35:40 +0200
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
 <1226702d-5bb4-4e7a-8e6a-6534002cfd8c@suse.com> <ar94BX2_scfSZReQ@Mac.lan>
 <ar95cgbuoYYJzl0f@Mac.lan>
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
In-Reply-To: <ar95cgbuoYYJzl0f@Mac.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-42698a/1790933743-1BED69EA-A4747CE4/10/78276251493
X-purgate-type: spam
X-purgate-size: 2308

On 02.10.2026 11:29, Roger Pau Monné wrote:
> On Fri, Oct 02, 2026 at 11:23:17AM +0200, Roger Pau Monné wrote:
>> On Fri, Oct 02, 2026 at 10:09:02AM +0200, Jan Beulich wrote:
>>> On 02.10.2026 10:05, Roger Pau Monné wrote:
>>>> On Fri, Oct 02, 2026 at 09:55:09AM +0200, Jan Beulich wrote:
>>>>> On 02.10.2026 09:48, Roger Pau Monné wrote:
>>>>>> On Fri, Oct 02, 2026 at 07:45:07AM +0200, Jan Beulich wrote:
>>>>>>> On 01.10.2026 16:27, Roger Pau Monne wrote:
>>>>>>>> --- a/xen/arch/x86/domain.c
>>>>>>>> +++ b/xen/arch/x86/domain.c
>>>>>>>> @@ -813,8 +813,6 @@ static bool emulation_flags_ok(const struct domain *d, uint32_t emflags)
>>>>>>>>  void __init arch_init_idle_domain(struct domain *d)
>>>>>>>>  {
>>>>>>>>      static const struct arch_csw idle_csw = {
>>>>>>>> -        .from = paravirt_ctxt_switch_from,
>>>>>>>> -        .to   = paravirt_ctxt_switch_to,
>>>>>>>>          .tail = idle_loop,
>>>>>>>>      };
>>>>>>>
>>>>>>> Leaving NULL pointers around isn't a good thing, though. May I suggest to
>>>>>>> at least poison the pointers then?
>>>>>>
>>>>>> I don't mind doing so, but I don't think we usually do that for other
>>>>>> hook structures, ie: hvm_function_table for example doesn't poison
>>>>>> unset hooks (and it possibly can't, because there are .hook != NULL
>>>>>> checks).
>>>>>>
>>>>>> TBH I'm missing a benefit of the poisoning here.  Using NULL or a
>>>>>> poisoned value will both trigger a page-fault, and NULL has the
>>>>>> benefit of callers easily checking whether the hook is set.
>>>>>
>>>>> NULL in the context of a HVM vCPU will #PF. NULL in the context of a PV
>>>>> one may not, depending on what the guest may have put there.
>>>>
>>>> It still feels a bit arbitrary to do here but not in other places,
>>>
>>> We should imo resolve this by replacing NULLs wherever hooks could, due
>>> to other issues, end up "in sight" on paths reachable for PV guests. This
>>> would then also cover potential speculation along such paths.
>>
>> FTAOD, I plan to introduce a poison value using a non-canonical
>> address, ie:
>>
>> #define POINTER_POISON ((void *)0xDEAD0000DEAD0000UL)
> 
> s/POINTER_POISON/FUNCTION_POISON/

Sure, if you think none of the present poisoning values we have is good to
reuse here.

Jan

