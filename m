Return-Path: <SRS0=exI2=BB=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FFDDC433E2
	for <xen-devel@archiver.kernel.org>; Wed, 22 Jul 2020 11:54:39 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EF523206F5
	for <xen-devel@archiver.kernel.org>; Wed, 22 Jul 2020 11:54:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EF523206F5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jyDKJ-00031Z-IN; Wed, 22 Jul 2020 11:54:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mY6V=BB=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jyDKH-00031U-Vm
 for xen-devel@lists.xenproject.org; Wed, 22 Jul 2020 11:54:22 +0000
X-Inumbo-ID: 142c80ce-cc12-11ea-a197-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 142c80ce-cc12-11ea-a197-12813bfff9fa;
 Wed, 22 Jul 2020 11:54:21 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D2D71ABE2;
 Wed, 22 Jul 2020 11:54:27 +0000 (UTC)
Subject: Re: [PATCH] x86/svm: Fold nsvm_{wr,rd}msr() into
 svm_msr_{read,write}_intercept()
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200721172208.12176-1-andrew.cooper3@citrix.com>
 <b3c3dfa9-d2b8-1042-ecf1-8f51351807e1@suse.com>
 <96e0cb7b-c597-075c-f142-6b35aae1a881@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <37c1a0d2-e19c-88b9-cac3-5977b3951d25@suse.com>
Date: Wed, 22 Jul 2020 13:54:21 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <96e0cb7b-c597-075c-f142-6b35aae1a881@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 22.07.2020 12:10, Andrew Cooper wrote:
> On 22/07/2020 10:16, Jan Beulich wrote:
>> On 21.07.2020 19:22, Andrew Cooper wrote:
>>> ... to simplify the default cases.
>>>
>>> There are multiple errors with the handling of these three MSRs, but they are
>>> deliberately not addressed this point.
>>>
>>> This removes the dance converting -1/0/1 into X86EMUL_*, allowing for the
>>> removal of the 'ret' variable.
>>>
>>> While cleaning this up, drop the gdprintk()'s for #GP conditions, and the
>>> 'result' variable from svm_msr_write_intercept() is it is never modified.
>>>
>>> No functional change.
>>>
>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>>
>> However, ...
>>
>>> @@ -2085,6 +2091,22 @@ static int svm_msr_write_intercept(unsigned int msr, uint64_t msr_content)
>>>              goto gpf;
>>>          break;
>>>  
>>> +    case MSR_K8_VM_CR:
>>> +        /* ignore write. handle all bits as read-only. */
>>> +        break;
>>> +
>>> +    case MSR_K8_VM_HSAVE_PA:
>>> +        if ( (msr_content & ~PAGE_MASK) || msr_content > 0xfd00000000ULL )
>> ... while you're moving this code here, wouldn't it be worthwhile
>> to at least fix the > to be >= ?
> 
> I'd prefer not to, to avoid breaking the "No Functional Change" aspect.

Well, so be it then.

> In reality, this needs to be a path which takes an extra ref on the
> nominated frame and globally maps it, seeing as we memcpy to/from it on
> every virtual vmentry/exit.  The check against the HT range is quite bogus.

I agree; I merely found the > so very obviously off-by-one that I
thought I'd at least inquire.

Jan

