Return-Path: <SRS0=grGV=JG=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00DB3C433ED
	for <xen-devel@archiver.kernel.org>; Fri,  9 Apr 2021 08:44:12 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B6FCD61025
	for <xen-devel@archiver.kernel.org>; Fri,  9 Apr 2021 08:44:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B6FCD61025
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.107696.205840 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lUmk4-00024p-VZ; Fri, 09 Apr 2021 08:43:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 107696.205840; Fri, 09 Apr 2021 08:43:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lUmk4-00024i-R2; Fri, 09 Apr 2021 08:43:52 +0000
Received: by outflank-mailman (input) for mailman id 107696;
 Fri, 09 Apr 2021 08:43:51 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lUmk3-00024d-DO
 for xen-devel@lists.xenproject.org; Fri, 09 Apr 2021 08:43:51 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lUmk2-0005xP-52; Fri, 09 Apr 2021 08:43:50 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lUmk1-00020Q-Tm; Fri, 09 Apr 2021 08:43:50 +0000
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
	bh=yubUyvZwRQsay5LUZpeGW4b3i43ugNVTvUvaC/rbNoo=; b=5f91O3y1cRThRcg7aPye4jJjkO
	fMaSGSRvavOlzoSQVlDydp0zHmB5iSJ+8pWkf9PQ1LUQ2wu3SaLMfWja5dW4bbdexGtxaaZkD/BP3
	y71/+CpW1Qv1qTUtM4UAWF1IayHBmWeAbVfIpkqvK86Tcjk7GDA2nIxac4qQGR5/olkU=;
Subject: Re: [PATCH] xen/gunzip: Fix build with clang after 33bc2a8495f7
To: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <jgrall@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20210407182726.26603-1-julien@xen.org>
 <59afb632-f2c9-bf3d-ef97-bc9f5a95d0a6@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <1b4acc2d-f208-2bc1-cdcc-a09a46b78b45@xen.org>
Date: Fri, 9 Apr 2021 09:43:47 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <59afb632-f2c9-bf3d-ef97-bc9f5a95d0a6@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Jan,

On 08/04/2021 07:17, Jan Beulich wrote:
> On 07.04.2021 20:27, Julien Grall wrote:
>> From: Julien Grall <jgrall@amazon.com>
>>
>> The compilation will fail when building Xen with clang and
>> CONFIG_DEBUG=y:
>>
>> make[4]: Leaving directory '/oss/xen/xen/common/libelf'
>>    INIT_O  gunzip.init.o
>> Error: size of gunzip.o:.text is 0x00000019
>>
>> This is because the function init_allocator() will not be inlined
>> and is not part of the init section.
>>
>> Fix it by marking init_allocator() with INIT.
>>
>> Fixes: 33bc2a8495f7 ("xen/gunzip: Allow perform_gunzip() to be called multiple times")
>> Reported-by: Jan Beulich <jbeulich@suse.com>
>> Signed-off-by: Julien Grall <jgrall@amazon.com>
> 
> Acked-by: Jan Beulich <jbeulich@suse.com>

Thanks! I have committed the patch.

Cheers,

-- 
Julien Grall

