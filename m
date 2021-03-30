Return-Path: <SRS0=ZQjX=I4=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5008C433C1
	for <xen-devel@archiver.kernel.org>; Tue, 30 Mar 2021 10:14:30 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3BB5561864
	for <xen-devel@archiver.kernel.org>; Tue, 30 Mar 2021 10:14:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3BB5561864
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.103383.197263 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRBNu-0002cq-0b; Tue, 30 Mar 2021 10:14:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 103383.197263; Tue, 30 Mar 2021 10:14:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRBNt-0002cj-Tv; Tue, 30 Mar 2021 10:14:05 +0000
Received: by outflank-mailman (input) for mailman id 103383;
 Tue, 30 Mar 2021 10:14:04 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lRBNs-0002ce-FH
 for xen-devel@lists.xenproject.org; Tue, 30 Mar 2021 10:14:04 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lRBNs-0001mG-8w; Tue, 30 Mar 2021 10:14:04 +0000
Received: from [54.239.6.177] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lRBNs-0006Nk-2V; Tue, 30 Mar 2021 10:14:04 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=wGOvvFS7oL2RTpJn6wu6DZnoKHUTw6iywo9DO8TrGp4=; b=WS8jHiAvs788KDiickJKtfi2MP
	VXsOTmFSlpHIAqHMx+Kae5Z9Mtjg8TH73N3IlNi7xN6gNIiiHqXDtsEAP6gdfXz3FyTMv4xdLkUlS
	BAnYepbx3B5lQeXMhN2lctm9fYRCAGawtmoQ8HqnXmT+Wr3MsWLk4u9dToneWzJVKQJI=;
Subject: Re: [PATCH v2 for-4.15 3/7] CHANGELOG.md: Add dom0/domU zstd
 compression support
To: George Dunlap <George.Dunlap@citrix.com>,
 Julien Grall <julien.grall.oss@gmail.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Ian Jackson <Ian.Jackson@citrix.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>
References: <20210329161457.345360-1-george.dunlap@citrix.com>
 <20210329161457.345360-3-george.dunlap@citrix.com>
 <CAJ=z9a0DxKKkLGMDK1nisVsefwE=8RQcD8M4vpOO1QopjzZtjw@mail.gmail.com>
 <87E259CB-2BB4-4BAE-9916-BE46584E0EF4@citrix.com>
From: Julien Grall <julien@xen.org>
Message-ID: <c2610906-bae2-520d-a8c3-da37849d96aa@xen.org>
Date: Tue, 30 Mar 2021 11:14:02 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <87E259CB-2BB4-4BAE-9916-BE46584E0EF4@citrix.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 30/03/2021 11:08, George Dunlap wrote:
> 
> 
>> On Mar 29, 2021, at 7:54 PM, Julien Grall <julien.grall.oss@gmail.com> wrote:
>>
>> Hi George,
>>
>> On Mon, 29 Mar 2021 at 17:15, George Dunlap <george.dunlap@citrix.com> wrote:
>>> diff --git a/CHANGELOG.md b/CHANGELOG.md
>>> index 8c89212f14..538eae611c 100644
>>> --- a/CHANGELOG.md
>>> +++ b/CHANGELOG.md
>>> @@ -12,6 +12,7 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>>>   - ARM SMMUv3 (Tech Preview)
>>>   - Intel Processor Trace support (Tech Preview)
>>>   - Named PCI devices for xl/libxl
>>> + - Support for zstd-compressed dom0 and domU kernels
>>
>> Looking at the log, the feature looks x86 only (at least the dom0 part).
> 
> Oh, interesting.  So what about the following?
> 
> - Support for zstd-compressed dom0 (x86) and domU kernels

Sounds fine to me. Note that I haven't tried zstd-compressed for domu 
Kernel on Arm.

Maybe the author (Jan) can confirm whether this was plumbed in common 
libxc code?

Cheers,

-- 
Julien Grall

