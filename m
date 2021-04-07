Return-Path: <SRS0=v/14=JE=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82029C433ED
	for <xen-devel@archiver.kernel.org>; Wed,  7 Apr 2021 18:18:31 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2FDE4601FE
	for <xen-devel@archiver.kernel.org>; Wed,  7 Apr 2021 18:18:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2FDE4601FE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.106890.204354 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lUCko-0005rS-Pe; Wed, 07 Apr 2021 18:18:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 106890.204354; Wed, 07 Apr 2021 18:18:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lUCko-0005rL-MN; Wed, 07 Apr 2021 18:18:14 +0000
Received: by outflank-mailman (input) for mailman id 106890;
 Wed, 07 Apr 2021 18:18:13 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lUCkn-0005rG-76
 for xen-devel@lists.xenproject.org; Wed, 07 Apr 2021 18:18:13 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lUCkl-00033A-Nc; Wed, 07 Apr 2021 18:18:11 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lUCkl-0007KG-De; Wed, 07 Apr 2021 18:18:11 +0000
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
	bh=VXVYu3Y20NlIZqA2sOvrBQ3YXhMqU2scmRniSTf3EgQ=; b=4EE0hSgl6nsFgkPBkxlFFbDLNs
	2qctr019Igj0tXQ3sHwumeGyEmLlhFe6Jp4zpWhiNDUrsZTpD/RAEXWnCE7hOS0660XupYVh4vA5v
	/Q+KmyK7sV7NI2QX4IK9PnAXweyb2CJN2yZCdxZdfYX27WYeO8PfONQXpQ451swDI9Ik=;
Subject: Re: [PATCH 2/2] xen/gunzip: Allow perform_gunzip() to be called
 multiple times
To: Jan Beulich <jbeulich@suse.com>
Cc: bertrand.marquis@arm.com, Julien Grall <jgrall@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20210402152105.29387-1-julien@xen.org>
 <20210402152105.29387-3-julien@xen.org>
 <2caf0bed-9a31-64a8-e764-2ed222f2e828@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <e6a9bcc4-14c7-7f5f-ee13-f2e45742aef5@xen.org>
Date: Wed, 7 Apr 2021 19:18:09 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <2caf0bed-9a31-64a8-e764-2ed222f2e828@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Jan,

On 07/04/2021 11:39, Jan Beulich wrote:
> On 02.04.2021 17:21, Julien Grall wrote:
>> --- a/xen/common/inflate.c
>> +++ b/xen/common/inflate.c
>> @@ -238,6 +238,12 @@ STATIC const ush mask_bits[] = {
>>   static unsigned long INITDATA malloc_ptr;
>>   static int INITDATA malloc_count;
>>   
>> +static void init_allocator(void)
>> +{
>> +    malloc_ptr = free_mem_ptr;
>> +    malloc_count = 0;
>> +}
>> +
>>   static void *INIT malloc(int size)
>>   {
>>       void *p;
> 
> I'm sorry for noticing this only now, but I'm afraid this may break
> the build in certain environments / configurations.

You actually mentioned it on the original thread that reported the bug. 
But I forgot to add INIT. Sorry for that :(.

> Iirc clang is
> relatively likely to not inline functions in debug builds even when
> they're used just once. Yet when the new function doesn't end up
> getting inlined, it needs INIT added or else the cmd_obj_init_o
> checking would find a non-empty .text section. (If there's no actual
> build breakage anywhere, I can also address this in my to-be-re-based
> "gunzip: drop INIT{,DATA} and STATIC", which is intended to go in as
> soon as the tree is fully open again.)

The pipeline actually reported some failure. But I initially didn't 
notice them. I think we want to fix it because your rework, so I will 
send a patch.

Sorry for the breakage.

Cheers,

-- 
Julien Grall

