Return-Path: <SRS0=eRfX=IF=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E906C433DB
	for <xen-devel@archiver.kernel.org>; Sun,  7 Mar 2021 12:37:54 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2AD9B64E31
	for <xen-devel@archiver.kernel.org>; Sun,  7 Mar 2021 12:37:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2AD9B64E31
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.94506.178082 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lIsf2-0008TL-96; Sun, 07 Mar 2021 12:37:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 94506.178082; Sun, 07 Mar 2021 12:37:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lIsf2-0008TE-5J; Sun, 07 Mar 2021 12:37:28 +0000
Received: by outflank-mailman (input) for mailman id 94506;
 Sun, 07 Mar 2021 12:37:27 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lIsf1-0008T9-1T
 for xen-devel@lists.xenproject.org; Sun, 07 Mar 2021 12:37:27 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lIsex-0002jp-V4; Sun, 07 Mar 2021 12:37:23 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lIsex-0003sS-Jj; Sun, 07 Mar 2021 12:37:23 +0000
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
	bh=AMIkYuHXp74v7qOiZccjjE6wmpie7IJ3DHDShXxqeTc=; b=hV+Q3xhlfjLM0K6LbqIxjSKWtK
	tMebSMjz+WwIK7viiuz3qTzQ95jBSV9vKNuPU+Xz2f9wFTwgLsG8uUILwo31z3MHNRzHEMNuhNjfb
	oICMj0BLNtr9VmBTYj3QWek33ZbY8uFComFJHOz4ao2j3HFdHaz9N7YV9FhspNrBENgA=;
Subject: Re: [PATCH for-4.15] xen: Bump the minimum version of GCC supported
 to 4.9 (5.1 on arm64)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Julien Grall <jgrall@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20210306214148.27021-1-julien@xen.org>
 <YESxpOByQ+7gXeI0@Air-de-Roger>
From: Julien Grall <julien@xen.org>
Message-ID: <6d312453-a949-143b-f4a6-e7fac7ef6486@xen.org>
Date: Sun, 7 Mar 2021 12:37:21 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <YESxpOByQ+7gXeI0@Air-de-Roger>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

Hi Roger,

On 07/03/2021 10:57, Roger Pau Monné wrote:
> On Sat, Mar 06, 2021 at 09:41:48PM +0000, Julien Grall wrote:
>> From: Julien Grall <jgrall@amazon.com>
>>
>> Compilers older than 4.8 have known codegen issues which can lead to
>> silent miscompilation:
>>
>> https://gcc.gnu.org/bugzilla/show_bug.cgi?id=58145
>>
>> Furthermore, pre-4.9 GCC have known bugs (including things like
>> internal compiler errors on Arm) which would require workaround (I
>> haven't checked if we have any in Xen).
>>
>> The minimum version of GCC to build the hypervisor is now raised to 4.9.
> 
> The README entry doesn't differentiate between tools and hypervisor
> GCC version, can the bug above also manifest in toolstack code?

I guess it can manifest in the firmware (e.g. hvmloader, rombios). It 
looks rather unlikely in the userspace tools as we seem to barely use 
volatile.

For the Arm64 bug [1], I think it can also show up when receiving a signal.

> 
> I don't think it makes much sense to have diverging requirements for
> tools vs hypervisor builds, but if the bug(s) can also manifest in
> toolstack code we might want to add a GCC version check to
> tools/configure.ac.

Agree. I can add check in ./configure for the toolstack.

Cheers,

[1] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=63293

-- 
Julien Grall

