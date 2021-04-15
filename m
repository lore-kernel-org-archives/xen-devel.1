Return-Path: <SRS0=iyTO=JM=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1619C433B4
	for <xen-devel@archiver.kernel.org>; Thu, 15 Apr 2021 14:11:04 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 93A69611AD
	for <xen-devel@archiver.kernel.org>; Thu, 15 Apr 2021 14:11:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 93A69611AD
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.111232.212702 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lX2hn-0006Tz-MA; Thu, 15 Apr 2021 14:10:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 111232.212702; Thu, 15 Apr 2021 14:10:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lX2hn-0006Ts-IK; Thu, 15 Apr 2021 14:10:51 +0000
Received: by outflank-mailman (input) for mailman id 111232;
 Thu, 15 Apr 2021 14:10:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=x7n8=JM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lX2hl-0006Tn-RV
 for xen-devel@lists.xenproject.org; Thu, 15 Apr 2021 14:10:49 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1a2d2088-5e3a-4a74-b685-c5522fe8416b;
 Thu, 15 Apr 2021 14:10:48 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D421EAEF8;
 Thu, 15 Apr 2021 14:10:47 +0000 (UTC)
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
X-Inumbo-ID: 1a2d2088-5e3a-4a74-b685-c5522fe8416b
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1618495847; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0TTFh9Dr2yyhOlKHTxLwq9LZ9NWKFoQiijCwiK7xK3o=;
	b=hC+kwsmsJcsUaN/OFNxAFYc+oPiN4pNAoVhnMnUILTsJtTjiLikaWzJ5y1wgQjychrv3ht
	s8IwfX3ZJv2LcGShxCC1Nmt7Z20k2w/8KoiuORypmN8EzDnX7OSAc1RcrlrMUEM8U7Jg4z
	Lqt3hqTONirGQEsw0n+42IDhOxLhiR0=
Subject: Re: [PATCH v2 12/17] x86/CPUID: shrink max_{,sub}leaf fields
 according to actual leaf contents
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>
References: <255f466c-3c95-88c5-3e55-0f04c9ae1b12@suse.com>
 <2aaffa0e-e17f-6581-6003-e58d2c9fc1d7@suse.com>
 <YHgM6eTT2OJY89aU@Air-de-Roger>
 <1862ca8d-c16c-8f47-1999-15809fcacdfe@suse.com>
 <YHgx8M06ZC1+MpEK@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <61be9da8-943e-81b7-e198-481e76255574@suse.com>
Date: Thu, 15 Apr 2021 16:10:47 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <YHgx8M06ZC1+MpEK@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 15.04.2021 14:30, Roger Pau Monné wrote:
> On Thu, Apr 15, 2021 at 12:37:20PM +0200, Jan Beulich wrote:
>> On 15.04.2021 11:52, Roger Pau Monné wrote:
>>> On Mon, Nov 23, 2020 at 03:33:03PM +0100, Jan Beulich wrote:
>>>> --- a/tools/tests/cpu-policy/test-cpu-policy.c
>>>> +++ b/tools/tests/cpu-policy/test-cpu-policy.c
>>>> @@ -8,10 +8,13 @@
>>>>  #include <err.h>
>>>>  
>>>>  #include <xen-tools/libs.h>
>>>> +#include <xen/asm/x86-defns.h>
>>>>  #include <xen/asm/x86-vendors.h>
>>>>  #include <xen/lib/x86/cpu-policy.h>
>>>>  #include <xen/domctl.h>
>>>>  
>>>> +#define XSTATE_FP_SSE  (X86_XCR0_FP | X86_XCR0_SSE)
>>>
>>> This gets used only once...
>>>
>>>> +
>>>>  static unsigned int nr_failures;
>>>>  #define fail(fmt, ...)                          \
>>>>  ({                                              \
>>>> @@ -564,6 +567,103 @@ static void test_cpuid_out_of_range_clea
>>>>      }
>>>>  }
>>>>  
>>>> +static void test_cpuid_maximum_leaf_shrinking(void)
>>>> +{
>>>> +    static const struct test {
>>>> +        const char *name;
>>>> +        struct cpuid_policy p;
>>>> +    } tests[] = {
>>>> +        {
>>>> +            .name = "basic",
>>>> +            .p = {
>>>> +                /* Very basic information only. */
>>>> +                .basic.max_leaf = 1,
>>>> +                .basic.raw_fms = 0xc2,
>>>> +            },
>>>> +        },
>>>> +        {
>>>> +            .name = "cache",
>>>> +            .p = {
>>>> +                /* Cache subleaves present. */
>>>> +                .basic.max_leaf = 4,
>>>> +                .cache.subleaf[0].type = 1,
>>>> +            },
>>>> +        },
>>>> +        {
>>>> +            .name = "feat#0",
>>>> +            .p = {
>>>> +                /* Subleaf 0 only with some valid bit. */
>>>> +                .basic.max_leaf = 7,
>>>> +                .feat.max_subleaf = 0,
>>>> +                .feat.fsgsbase = 1,
>>>> +            },
>>>> +        },
>>>> +        {
>>>> +            .name = "feat#1",
>>>> +            .p = {
>>>> +                /* Subleaf 1 only with some valid bit. */
>>>> +                .basic.max_leaf = 7,
>>>> +                .feat.max_subleaf = 1,
>>>> +                .feat.avx_vnni = 1,
>>>> +            },
>>>> +        },
>>>> +        {
>>>> +            .name = "topo",
>>>> +            .p = {
>>>> +                /* Topology subleaves present. */
>>>> +                .basic.max_leaf = 0xb,
>>>> +                .topo.subleaf[0].type = 1,
>>>> +            },
>>>> +        },
>>>> +        {
>>>> +            .name = "xstate",
>>>> +            .p = {
>>>> +                /* First subleaf always valid (and then non-zero). */
>>>> +                .basic.max_leaf = 0xd,
>>>> +                .xstate.xcr0_low = XSTATE_FP_SSE,
>>>
>>> ...here.
>>
>> For now, yes. I'm introducing the constant because I think it wants
>> using in other places too, to avoid using literal numbers. See e.g.
>>
>>                 .xstate.xcr0_low = 7,
>>
>> in test_cpuid_serialise_success().
>>
>>> And then I also wonder whether this requires having any
>>> specific values rather than just using ~0 or any random non-0 value.
>>
>> I'm afraid I don't understand: There's no ~0 here and no random
>> non-zero value - all other structure elements are left default-
>> initialized.
> 
> Oh, I've worded that sentence wrongly I think. What I meant to say is
> that for the purposes of the test here you could just fill the fields
> with ~0 instead of using things like XSTATE_FP_SSE?

The test would perhaps be fine, at least right now. But ~0 is not
really a legitimate value, especially if - for consistency - also
putting it in .xcr0_high. I wanted to have a well-defined, always
valid value here, avoiding the risk of needing to change the value
again later on.

Jan

