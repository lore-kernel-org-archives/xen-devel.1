Return-Path: <SRS0=4R9G=IO=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4D5EC433E0
	for <xen-devel@archiver.kernel.org>; Tue, 16 Mar 2021 14:35:17 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 560D26507B
	for <xen-devel@archiver.kernel.org>; Tue, 16 Mar 2021 14:35:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 560D26507B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.98313.186398 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lMAmp-0008V5-LZ; Tue, 16 Mar 2021 14:35:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 98313.186398; Tue, 16 Mar 2021 14:35:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lMAmp-0008Uy-Hm; Tue, 16 Mar 2021 14:35:07 +0000
Received: by outflank-mailman (input) for mailman id 98313;
 Tue, 16 Mar 2021 14:35:06 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lMAmo-0008Ut-MR
 for xen-devel@lists.xenproject.org; Tue, 16 Mar 2021 14:35:06 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lMAmm-0004nP-KJ; Tue, 16 Mar 2021 14:35:04 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lMAmm-0001NL-Bi; Tue, 16 Mar 2021 14:35:04 +0000
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
	bh=1JgT5H2OswUF1HRhz3gQ0+ex4CQvD4/YhzhA6QiIwlM=; b=btTiuOLpn8Q8zeg6E5QAV+ejC4
	YOfc+AsUNfX5o5YlnXhyRf4OzptfiRZLRWXY4EMPUg1UUp/+2V8KLVCJGYMTFJ8ek82cr+APw6W9R
	ai/Y9FV2pq6t0jSl9WZ3BvpeccpGpvIrtAL8ocFeJRocerKnKj1is80NR0E52jN7wCi8=;
Subject: Re: [PATCH for-4.15] SUPPORT.MD: Mark C XenStored LiveUpdate as Tech
 Preview
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Julien Grall <jgrall@amazon.com>, George Dunlap
 <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Juergen Gross <jgross@suse.com>
References: <20210313135500.27241-1-julien@xen.org>
 <43d6d118-308d-6bb0-3b91-7dc0f8a38d56@citrix.com>
From: Julien Grall <julien@xen.org>
Message-ID: <663f08cf-a7cb-2e53-fe22-69d232e6aa07@xen.org>
Date: Tue, 16 Mar 2021 14:35:02 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <43d6d118-308d-6bb0-3b91-7dc0f8a38d56@citrix.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

Hi,

On 15/03/2021 12:17, Andrew Cooper wrote:
> On 13/03/2021 13:55, Julien Grall wrote:
>> From: Julien Grall <jgrall@amazon.com>
>>
>> Support to liveupdate C XenStored was adding during the 4.15
>> development cycle. Add a section in SUPPORT.MD to explain what is the
>> support state.
>>
>> For now, it is a tech preview.
>>
>> Signed-off-by: Julien Grall <jgrall@amazon.com>
>>
>> ---
>>
>> CC: Juergen Gross <jgross@suse.com>
>>
>> It looks like the OCaml side was not merged in 4.15.
> 
> Yes it was.
> 
>> So I have only
>> described the support state for C XenStored.
> 
> What about stub-cxenstored?  I think it wants pointing out specifically,
> whatever its status, to avoid confusion.

Is it even working? @Juergen?

Cheers,

-- 
Julien Grall

