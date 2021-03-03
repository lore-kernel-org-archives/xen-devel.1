Return-Path: <SRS0=XTf+=IB=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB6CCC433E0
	for <xen-devel@archiver.kernel.org>; Wed,  3 Mar 2021 18:33:24 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6F8F864DF4
	for <xen-devel@archiver.kernel.org>; Wed,  3 Mar 2021 18:33:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6F8F864DF4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.92964.175396 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lHWJ2-00072Q-F0; Wed, 03 Mar 2021 18:33:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 92964.175396; Wed, 03 Mar 2021 18:33:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lHWJ2-00072J-Bu; Wed, 03 Mar 2021 18:33:08 +0000
Received: by outflank-mailman (input) for mailman id 92964;
 Wed, 03 Mar 2021 18:33:06 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lHWJ0-00072E-P3
 for xen-devel@lists.xenproject.org; Wed, 03 Mar 2021 18:33:06 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lHWIz-0006UB-Hp; Wed, 03 Mar 2021 18:33:05 +0000
Received: from 54-240-197-227.amazon.com ([54.240.197.227]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lHWIz-00069j-9s; Wed, 03 Mar 2021 18:33:05 +0000
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
	bh=QIPtXw1boiCbdDdKjeLjR0PtcC97uD4XpZO1CKKrN04=; b=msPcxsAyG5aHv8JZX/yxna8/H6
	WqSSReoy9fs3H+YlQPSzyeW0u6q1GNHWDu+yLZItRPxc6oZYrry7WhfoPf447BFNNzw1KLq1CEyp7
	7Rh5HfV9pZeePra2cYbJ5ZZssUjlgenwnsKFAnCcwqOPNhjaikTE7j67zvh6Ev3QjrdQ=;
Subject: Re: [PATCH for-next] xen/arm: mm: flush_page_to_ram() only need to
 clean to PoC
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Julien Grall <jgrall@amazon.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20210220175413.14640-1-julien@xen.org>
 <FC521246-BD88-4D8C-82B7-6C3EFC8B00D0@arm.com>
 <45cd6455-3ad0-f052-65d8-37adb658f003@xen.org>
 <alpine.DEB.2.21.2102221220000.3234@sstabellini-ThinkPad-T480s>
 <ec608001-7663-961b-667c-bcf6397f1864@xen.org>
 <alpine.DEB.2.21.2102221344200.3234@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien@xen.org>
Message-ID: <551b09ec-cee1-767c-a7d7-9248e677d80b@xen.org>
Date: Wed, 3 Mar 2021 18:33:03 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2102221344200.3234@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 23/02/2021 01:22, Stefano Stabellini wrote:
>> Thanks! I am thinking to create a branch next again for queuing 4.15+ patches.
>> Would that be fine with you?
> 
> yes good idea

I have created the branch for-next/4.16 on my public tree and push the 
patch:

https://xenbits.xen.org/gitweb/?p=people/julieng/xen-unstable.git;a=shortlog;h=refs/heads/for-next/4.16

This will be merged once the tree is re-opened.

Cheers,

-- 
Julien Grall

