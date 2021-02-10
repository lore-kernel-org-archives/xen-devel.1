Return-Path: <SRS0=BMSw=HM=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EC0BC433E0
	for <xen-devel@archiver.kernel.org>; Wed, 10 Feb 2021 08:37:35 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 31DB364E08
	for <xen-devel@archiver.kernel.org>; Wed, 10 Feb 2021 08:37:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 31DB364E08
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.83491.155512 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9kzy-0000bV-L0; Wed, 10 Feb 2021 08:37:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 83491.155512; Wed, 10 Feb 2021 08:37:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9kzy-0000bO-HW; Wed, 10 Feb 2021 08:37:22 +0000
Received: by outflank-mailman (input) for mailman id 83491;
 Wed, 10 Feb 2021 08:37:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jO30=HM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l9kzx-0000bJ-O3
 for xen-devel@lists.xenproject.org; Wed, 10 Feb 2021 08:37:21 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 13318f3e-d536-47bb-9605-87b57fcd3774;
 Wed, 10 Feb 2021 08:37:20 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id AAC53AB71;
 Wed, 10 Feb 2021 08:37:19 +0000 (UTC)
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
X-Inumbo-ID: 13318f3e-d536-47bb-9605-87b57fcd3774
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1612946239; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AcDjXdURlVn6QUZXRLyz4HTGC4SkraH3h0dv/G8ZZVs=;
	b=ZFYBlzOi8VsYv9fCLOo1gdelGPFvD9JZDHvyJnrW0Vu04IHTE22jc9GgmyfyrjNLdz8DLd
	HXHeRNVCrUagFGeT0HM5Ke5vtzs2jusBY9yIfzoMs2c/1Yr/VHCnOp5XTQUBR2NeRjTFfh
	5eSqHtwmz5Mo0sOt11yEIlL5HGApKHM=
Subject: Re: [PATCH for-4.15] x86/ucode: Fix microcode payload size for Fam19
 processors
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>,
 Ian Jackson <iwj@xenproject.org>
References: <20210209153336.4016-1-andrew.cooper3@citrix.com>
 <c09110f7-6459-e1f7-2175-09d535ad03ce@suse.com>
 <24610.50089.887907.573064@mariner.uk.xensource.com>
 <6f44ae66-9956-3312-c4c8-b0f1e4b568bb@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <a0da7d15-d0a2-62c6-0551-f62a09780e16@suse.com>
Date: Wed, 10 Feb 2021 09:37:15 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <6f44ae66-9956-3312-c4c8-b0f1e4b568bb@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 09.02.2021 18:39, Andrew Cooper wrote:
> On 09/02/2021 17:17, Ian Jackson wrote:
>> Jan Beulich writes ("Re: [PATCH for-4.15] x86/ucode: Fix microcode payload size for Fam19 processors"):
>>> On 09.02.2021 16:33, Andrew Cooper wrote:
>>>> The original limit provided wasn't accurate.  Blobs are in fact rather larger.
>>>>
>>>> Fixes: fe36a173d1 ("x86/amd: Initial support for Fam19h processors")
>>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>> Acked-by: Jan Beulich <jbeulich@suse.com>
>>>
>>>> --- a/xen/arch/x86/cpu/microcode/amd.c
>>>> +++ b/xen/arch/x86/cpu/microcode/amd.c
>>>> @@ -111,7 +111,7 @@ static bool verify_patch_size(uint32_t patch_size)
>>>>  #define F15H_MPB_MAX_SIZE 4096
>>>>  #define F16H_MPB_MAX_SIZE 3458
>>>>  #define F17H_MPB_MAX_SIZE 3200
>>>> -#define F19H_MPB_MAX_SIZE 4800
>>>> +#define F19H_MPB_MAX_SIZE 5568
>>> How certain is it that there's not going to be another increase?
>>> And in comparison, how bad would it be if we pulled this upper
>>> limit to something that's at least slightly less of an "odd"
>>> number, e.g. 0x1800, and thus provide some headroom?
>> 5568 does seem really an excessively magic number...
> 
> It reads better in hex - 0x15c0.  It is exactly the header,
> match/patch-ram, and the digital signature of a fixed algorithm.

And I realize it's less odd than Fam16's 3458 (0xd82).

> Its far simpler than Intel's format which contains multiple embedded
> blobs, and support for minor platform variations within the same blob.
> 
> There are a lot of problems with how we do patch verification on AMD
> right now, but its all a consequence of the header not containing a
> length field.
> 
> This number wont change now.  Zen3 processors are out in the world.

Given history on earlier families, where in some cases sizes
also vary by model, how can this fact guarantee anything?

Jan

