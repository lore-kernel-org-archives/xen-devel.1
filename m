Return-Path: <SRS0=HZRB=CF=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CF32C433DF
	for <xen-devel@archiver.kernel.org>; Thu, 27 Aug 2020 15:14:17 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 423F22177B
	for <xen-devel@archiver.kernel.org>; Thu, 27 Aug 2020 15:14:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 423F22177B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kBJbC-0000Ga-4I; Thu, 27 Aug 2020 15:13:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=o8NI=CF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kBJbA-0000GS-Jf
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2020 15:13:56 +0000
X-Inumbo-ID: 327406e1-3da4-4025-bd94-4d6b80dbccc2
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 327406e1-3da4-4025-bd94-4d6b80dbccc2;
 Thu, 27 Aug 2020 15:13:52 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id DEB71AC2B;
 Thu, 27 Aug 2020 15:14:23 +0000 (UTC)
Subject: Re: [PATCH 2/8] x86/svm: silently drop writes to SYSCFG and related
 MSRs
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org,
 Wei Liu <wl@xen.org>
References: <20200817155757.3372-1-roger.pau@citrix.com>
 <20200817155757.3372-3-roger.pau@citrix.com>
 <667ecceb-e111-5da5-74f9-9b1cc8628a6a@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <88d10cb8-2850-522a-6be6-828a0caebae2@suse.com>
Date: Thu, 27 Aug 2020 17:13:53 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <667ecceb-e111-5da5-74f9-9b1cc8628a6a@citrix.com>
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 18.08.2020 16:53, Andrew Cooper wrote:
> On 17/08/2020 16:57, Roger Pau Monne wrote:
>> diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
>> index ca3bbfcbb3..671cdcb724 100644
>> --- a/xen/arch/x86/hvm/svm/svm.c
>> +++ b/xen/arch/x86/hvm/svm/svm.c
>> @@ -1917,6 +1917,13 @@ static int svm_msr_read_intercept(unsigned int msr, uint64_t *msr_content)
>>              goto gpf;
>>          break;
>>  
>> +    case MSR_K8_TOP_MEM1:
>> +    case MSR_K8_TOP_MEM2:
>> +    case MSR_K8_SYSCFG:
>> +        /* Return all 0s. */
>> +        *msr_content = 0;
> 
> On a Rome box, these are the normal values:
> 
> 0xc0010010 (SYSCFG) 0x740000
> 0xc001001a (MEM1) 0xb0000000
> 0xc001001d (MEM2) 0x3c50000000
> 
> The SYSCFG bits are MtrrFixDramEn[18], MtrrVarDramEn[20], MtrrTom2En[21]
> and Tom2ForceMemTypeWB[22].  In particular, bits 18 and 20 are expected
> to be set by the system firmware.
> 
> Clearly we shouldn't be leaking TOP_MEM{1,2} into guests, but Xen also
> doesn't have enough information to set these correctly yet either.
> 
> At a minimum, I think SYSCFG wants to report 0x40000 which means "the
> fixed MTRRs behave as expected",

How do you derive that meaning? The bit tells us whether in the
individual fixed range MTRR bytes bits 3 and 4 have an AMD-
specific meaning. Guests reading these will get back zero for
the bits in all cases right now, and hence the meaning would be
"MMIO" for all of them, despite there being some RAM ranges
covered as well. Imo the bit needs to be zero to be compatible
with the rest of our code.

Jan

> and the other bits being clear should mean that TOP_MEM{1,2} aren't enabled.
> 
> ~Andrew
> 


