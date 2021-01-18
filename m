Return-Path: <SRS0=uD1c=GV=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F54CC433E0
	for <xen-devel@archiver.kernel.org>; Mon, 18 Jan 2021 10:35:32 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CFEA822227
	for <xen-devel@archiver.kernel.org>; Mon, 18 Jan 2021 10:35:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CFEA822227
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.69560.124582 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1RsZ-0005Fi-VN; Mon, 18 Jan 2021 10:35:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 69560.124582; Mon, 18 Jan 2021 10:35:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1RsZ-0005Fb-RJ; Mon, 18 Jan 2021 10:35:23 +0000
Received: by outflank-mailman (input) for mailman id 69560;
 Mon, 18 Jan 2021 10:35:23 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1l1RsZ-0005FV-0f
 for xen-devel@lists.xenproject.org; Mon, 18 Jan 2021 10:35:23 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l1RsY-0007cD-0K; Mon, 18 Jan 2021 10:35:22 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l1RsX-0007nY-NO; Mon, 18 Jan 2021 10:35:21 +0000
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
	bh=xYTcohCCFM905X6AA+tAtBYhZvfxbmovRU4zl+nD7Ss=; b=R2YoVnUcmzToDTbGmwYHYjr78O
	5I5A8Be765g5CLOJwcVltHC0TwiJSk0QcTHgQeq7f4mi+Vdm5f8PBaXgYCllkbJiorupptjx6p0Za
	X8zZZVDevXWiIwiA5V3eyaSdeP9tMstkVG1uV7gVacgYT+CGkzjAXgBlEmY+4AOCAlkc=;
Subject: Re: [PATCH 1/3] introduce unaligned.h
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <george.dunlap@citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, M A Young <m.a.young@durham.ac.uk>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <0eba95b9-66eb-2692-1da1-c27784b9f51e@suse.com>
 <12f26ab9-8a8c-19f0-ea65-8b354bd326a6@suse.com>
 <8c459039-a27a-01e5-0143-7c9b6e019e42@citrix.com>
 <b4b4b02b-f6d0-06b5-d65b-3693e16f266d@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <c6e93a96-2b1e-5f6d-3726-dcac673bd5e9@xen.org>
Date: Mon, 18 Jan 2021 10:35:19 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <b4b4b02b-f6d0-06b5-d65b-3693e16f266d@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

Hi Jan,

On 15/01/2021 11:29, Jan Beulich wrote:
> On 15.01.2021 12:13, Andrew Cooper wrote:
>> On 15/01/2021 10:05, Jan Beulich wrote:
>>> Rather than open-coding commonly used constructs in yet more places when
>>> pulling in zstd decompression support (and its xxhash prereq), pull out
>>> the custom bits into a commonly used header (for the hypervisor build;
>>> the tool stack and stubdom builds of libxenguest will still remain in
>>> need of similarly taking care of). For now this is limited to x86, where
>>> custom logic isn't needed (considering this is going to be used in init
>>> code only, even using alternatives patching to use MOVBE doesn't seem
>>> worthwhile).
>>>
>>> No change in generated code.
>>>
>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>> ---
>>> Iirc use of include/asm-generic/ was disliked, hence the generic header
>>> goes into include/xen/.
>>
>> Really?  I think its going to be the only sane way of fixing up some of
>> our header tangle.
> 
> Should have responded here too: It was me to suggest to put some
> header there when reviewing some patches a while ago, and iirc it
> was Julien who pushed back.

We had the discussion when I consolidated guest_access.h.

IIRC, your definition of each directory was:
    - xen: Contain headers used by all the architectures
    - asm-generic: Contain headers used by most of the architectures

As we only have two architectures (Arm and x86) the split between the 
two would just end up in bikeshedding (who really know how RISCv, 
PowerPC will support Xen?). Hence my push back.

Cheers,

-- 
Julien Grall

