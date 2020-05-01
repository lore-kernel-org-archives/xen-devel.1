Return-Path: <SRS0=QTwr=6P=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FBC1C47253
	for <xen-devel@archiver.kernel.org>; Fri,  1 May 2020 16:00:41 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 62F0B208DB
	for <xen-devel@archiver.kernel.org>; Fri,  1 May 2020 16:00:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=xen.org header.i=@xen.org header.b="D/9tPbQJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 62F0B208DB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jUY56-0006bO-O4; Fri, 01 May 2020 16:00:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=s7FD=6P=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jUY55-0006YB-JG
 for xen-devel@lists.xenproject.org; Fri, 01 May 2020 16:00:03 +0000
X-Inumbo-ID: d0bf27f2-8bc4-11ea-9b30-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d0bf27f2-8bc4-11ea-9b30-12813bfff9fa;
 Fri, 01 May 2020 16:00:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WNnYilYnao2Mg/ANUwAtRPY0twuuz+bXUxBM0mapFzE=; b=D/9tPbQJ5CQmkT3GzluB1LE8Mu
 roDrQCuu9WGpGh3sUq3hpU3oNwCfmhZx/1QFgwH8PrOumay/EAK08YBPgmV1c9xzMjH9TJL0bOu/5
 YE9vtUmUhfN81suoa5SBOu5QM6ZzSVeieITrjJ694oyQyLHLPVmBHfWdDXMQZU+wIHzg=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jUY4z-0004pI-Gy; Fri, 01 May 2020 15:59:57 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jUY4z-0007QB-7n; Fri, 01 May 2020 15:59:57 +0000
Subject: Re: [PATCH 11/16] x86: add a boot option to enable and disable the
 direct map
To: Wei Liu <wl@xen.org>, Hongyan Xia <hx242@xen.org>
References: <cover.1588278317.git.hongyxia@amazon.com>
 <7360b59e8fd39796fee56430a437b20c948d08c2.1588278317.git.hongyxia@amazon.com>
 <20200501121132.kzhu7u2vmpoeju2x@liuwe-devbox-debian-v2.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net>
 <2235f884b65c9f20cf55637f91ddab6924f53ca1.camel@xen.org>
 <20200501131158.utexymcn3lnt65qp@liuwe-devbox-debian-v2.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net>
From: Julien Grall <julien@xen.org>
Message-ID: <ce1e64f5-bcd7-096d-4973-5cd7f105d42f@xen.org>
Date: Fri, 1 May 2020 16:59:54 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200501131158.utexymcn3lnt65qp@liuwe-devbox-debian-v2.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi,

On 01/05/2020 14:11, Wei Liu wrote:
> On Fri, May 01, 2020 at 01:59:24PM +0100, Hongyan Xia wrote:
>> On Fri, 2020-05-01 at 12:11 +0000, Wei Liu wrote:
>>> On Thu, Apr 30, 2020 at 09:44:20PM +0100, Hongyan Xia wrote:
>>>> From: Hongyan Xia <hongyxia@amazon.com>
>>>>
>>>> Also add a helper function to retrieve it. Change
>>>> arch_mfn_in_direct_map
>>>> to check this option before returning.
>>>>
>>>> This is added as a boot command line option, not a Kconfig. We do
>>>> not
>>>> produce different builds for EC2 so this is not introduced as a
>>>> compile-time configuration.
>>>
>>> Having a Kconfig will probably allow the compiler to eliminate dead
>>> code.
>>>
>>> This is not asking you to do the work, someone can come along and
>>> adjust
>>> arch_has_directmap easily.
>>
>> My original code added this as a CONFIG option, but I converted it into
>> a boot-time switch, so I can just dig out history and convert it back.
>> I wonder if we should get more opinions on this to make a decision.
> 
> Form my perspective, you as a contributor has done the work to scratch
> your own itch, hence I said "not asking you to do the work". I don't
> want to turn every comment into a formal ask and eventually lead to
> feature creep.
> 
>>
>> I would love Xen to have static key support though so that a boot-time
>> switch costs no run-time performance.
>>
> 
> Yes that would be great.

 From my understanding static key is very powerful as you could modify 
the value even at runtime.

On Arm, I wrote a version that I would call static key for the poor. We 
are using alternative to select between 0 and 1 as an immediate value.

#define CHECK_WORKAROUND_HELPER(erratum, feature, arch)         \
static inline bool check_workaround_##erratum(void)             \
{                                                               \
     if ( !IS_ENABLED(arch) )                                    \
         return false;                                           \
     else                                                        \
     {                                                           \
         register_t ret;                                         \
                                                                 \
         asm volatile (ALTERNATIVE("mov %0, #0",                 \
                                   "mov %0, #1",                 \
                                   feature)                      \
                       : "=r" (ret));                            \
                                                                 \
         return unlikely(ret);                                   \
     }                                                           \
}

The code generated will still be using a conditional branch, but the 
processor should be able to always infer correctly whether the condition 
is true or not.

The implementation is also very tailored to Arm as we consider 
workaround are not enabled by default. But I think this can be improved 
and made more generic.

Cheers,

-- 
Julien Grall

