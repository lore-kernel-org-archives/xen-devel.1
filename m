Return-Path: <SRS0=xDB7=64=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A717AC433DF
	for <xen-devel@archiver.kernel.org>; Thu, 14 May 2020 15:51:08 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7D6772065F
	for <xen-devel@archiver.kernel.org>; Thu, 14 May 2020 15:51:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7D6772065F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jZG80-0000rZ-PW; Thu, 14 May 2020 15:50:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ezST=64=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jZG7z-0000rU-OT
 for xen-devel@lists.xenproject.org; Thu, 14 May 2020 15:50:31 +0000
X-Inumbo-ID: a3966b92-95fa-11ea-b07b-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a3966b92-95fa-11ea-b07b-bc764e2007e4;
 Thu, 14 May 2020 15:50:31 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id E1703AEF1;
 Thu, 14 May 2020 15:50:32 +0000 (UTC)
Subject: Re: [PATCH] x86: retrieve and log CPU frequency information
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <1fd091d2-30e2-0691-0485-3f5142bd457f@suse.com>
 <20200514131021.GB54375@Air-de-Roger>
 <2e9c7c05-e42c-52d4-f48c-9ecc8b14a1a7@suse.com>
 <20200514153252.GE54375@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d166968f-23da-6065-3a90-e0fb0c4f6dcf@suse.com>
Date: Thu, 14 May 2020 17:50:29 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200514153252.GE54375@Air-de-Roger>
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 14.05.2020 17:32, Roger Pau Monné wrote:
> On Thu, May 14, 2020 at 03:38:18PM +0200, Jan Beulich wrote:
>> On 14.05.2020 15:10, Roger Pau Monné wrote:
>>> On Wed, Apr 15, 2020 at 01:55:24PM +0200, Jan Beulich wrote:
>>>> While from just a single Skylake system it is already clear that we
>>>> can't base any of our logic on CPUID leaf 15 [1] (leaf 16 is
>>>> documented to be used for display purposes only anyway), logging this
>>>> information may still give us some reference in case of problems as well
>>>> as for future work. Additionally on the AMD side it is unclear whether
>>>> the deviation between reported and measured frequencies is because of us
>>>> not doing well, or because of nominal and actual frequencies being quite
>>>> far apart.
>>>
>>> Can you add some reference to the AMD implementation? I've looked at
>>> the PMs and haven't been able to find a description of some of the
>>> MSRs, like 0xC0010064.
>>
>> Take a look at
>>
>> https://developer.amd.com/resources/developer-guides-manuals/
>>
>> I'm unconvinced a reference needs adding here.
> 
> Do you think it would be sensible to introduce some defines for at
> least 0xC0010064? (ie: MSR_AMD_PSTATE_DEF_BASE)
> 
> I think it would make it easier to find on the manuals.

I did consider doing so at the time, but dropped the idea as we have
a few more examples where we use bare MSR numbers when they're used
just once or very rarely. What I'm not sure about is whether the
name would help finding the doc - the doc is organized by MSR number
after all.

Jan

