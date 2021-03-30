Return-Path: <SRS0=ZQjX=I4=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD66AC433DB
	for <xen-devel@archiver.kernel.org>; Tue, 30 Mar 2021 10:56:58 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 42BA361983
	for <xen-devel@archiver.kernel.org>; Tue, 30 Mar 2021 10:56:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 42BA361983
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.103402.197303 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRC30-000736-OK; Tue, 30 Mar 2021 10:56:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 103402.197303; Tue, 30 Mar 2021 10:56:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRC30-00072z-KK; Tue, 30 Mar 2021 10:56:34 +0000
Received: by outflank-mailman (input) for mailman id 103402;
 Tue, 30 Mar 2021 10:56:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2mYN=I4=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lRC2z-00072u-VX
 for xen-devel@lists.xenproject.org; Tue, 30 Mar 2021 10:56:34 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id eb895427-854f-4026-ada9-e70496317459;
 Tue, 30 Mar 2021 10:56:33 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 60747B270;
 Tue, 30 Mar 2021 10:56:32 +0000 (UTC)
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
X-Inumbo-ID: eb895427-854f-4026-ada9-e70496317459
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1617101792; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Mzh4AUS2vZ+qPPfhiYoXdNt2AuTRm1PP69Kf/uH5ll4=;
	b=fkTb009PyvjW0A7KUA/obWkpdn+Ux80/T9SfVAxH+kZ50suOAH7xfIDH+9I4riqgP5GKuc
	jXu2MGCB4pNrosdaFgLHox4PGhOnAtj1NTFV9mL+LFWqxsU/Hn97CWAtPPnxQIRA7uG/Tb
	WJQECx0mW1mTtiy+3QIjlmQ+A3mcOEQ=
Subject: Re: [PATCH v2 for-4.15 3/7] CHANGELOG.md: Add dom0/domU zstd
 compression support
To: Julien Grall <julien@xen.org>, Julien Grall <julien.grall.oss@gmail.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Ian Jackson <Ian.Jackson@citrix.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>,
 George Dunlap <George.Dunlap@citrix.com>
References: <20210329161457.345360-1-george.dunlap@citrix.com>
 <20210329161457.345360-3-george.dunlap@citrix.com>
 <CAJ=z9a0DxKKkLGMDK1nisVsefwE=8RQcD8M4vpOO1QopjzZtjw@mail.gmail.com>
 <87E259CB-2BB4-4BAE-9916-BE46584E0EF4@citrix.com>
 <c2610906-bae2-520d-a8c3-da37849d96aa@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <672c88ac-8373-6629-4d2f-0d1e86c103cd@suse.com>
Date: Tue, 30 Mar 2021 12:56:31 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <c2610906-bae2-520d-a8c3-da37849d96aa@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 30.03.2021 12:14, Julien Grall wrote:
> 
> 
> On 30/03/2021 11:08, George Dunlap wrote:
>>
>>
>>> On Mar 29, 2021, at 7:54 PM, Julien Grall <julien.grall.oss@gmail.com> wrote:
>>>
>>> Hi George,
>>>
>>> On Mon, 29 Mar 2021 at 17:15, George Dunlap <george.dunlap@citrix.com> wrote:
>>>> diff --git a/CHANGELOG.md b/CHANGELOG.md
>>>> index 8c89212f14..538eae611c 100644
>>>> --- a/CHANGELOG.md
>>>> +++ b/CHANGELOG.md
>>>> @@ -12,6 +12,7 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>>>>   - ARM SMMUv3 (Tech Preview)
>>>>   - Intel Processor Trace support (Tech Preview)
>>>>   - Named PCI devices for xl/libxl
>>>> + - Support for zstd-compressed dom0 and domU kernels
>>>
>>> Looking at the log, the feature looks x86 only (at least the dom0 part).
>>
>> Oh, interesting.  So what about the following?
>>
>> - Support for zstd-compressed dom0 (x86) and domU kernels
> 
> Sounds fine to me. Note that I haven't tried zstd-compressed for domu 
> Kernel on Arm.
> 
> Maybe the author (Jan) can confirm whether this was plumbed in common 
> libxc code?

Well, I've followed the model used for other compression methods. I have
no idea what this means or does not mean for Arm; in fact so far I was
under the impression that like in the hypervisor decompression support
was an x86-only feature, but from what you say I conclude I have been
wrong with this.

Jan

