Return-Path: <SRS0=6BBm=J2=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BD06C433ED
	for <xen-devel@archiver.kernel.org>; Thu, 29 Apr 2021 12:53:46 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E6242613FF
	for <xen-devel@archiver.kernel.org>; Thu, 29 Apr 2021 12:53:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E6242613FF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.119974.226836 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lc6Ah-0007ZH-TQ; Thu, 29 Apr 2021 12:53:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 119974.226836; Thu, 29 Apr 2021 12:53:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lc6Ah-0007Z6-Ps; Thu, 29 Apr 2021 12:53:35 +0000
Received: by outflank-mailman (input) for mailman id 119974;
 Thu, 29 Apr 2021 12:53:34 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lc6Ag-0007Yn-12
 for xen-devel@lists.xenproject.org; Thu, 29 Apr 2021 12:53:34 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lc6Af-0004SZ-30; Thu, 29 Apr 2021 12:53:33 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lc6Ae-0007Kw-Pk; Thu, 29 Apr 2021 12:53:32 +0000
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
	bh=E3fgMWl9QSkClW5gK51nPnACc7/dVNVArBj9SnXr0z0=; b=No4y2rxKxxbi2L4AUp72bKs+QX
	0GIv+Avcn2iDfa1R14WDSAK7ue14rF3brTwhgCTFaBEIPjbI3VJKrxDDxuS8KNaFDyV4d22uR8Moi
	iH1Y4NiGmhYQEhgwtCIan/X9NVEwfrVlGYjBY8X/qPXx0XXBcUMZczcpvstPYa2glcfI=;
Subject: Re: Ping: [PATCH v3] gnttab: defer allocation of status frame
 tracking array
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <george.dunlap@citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <d2397cd4-040e-3cc0-22d8-3f65d01f9326@suse.com>
 <bea459c9-32ed-a800-40ea-456b465cd38a@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <cb700031-2e7e-51e8-50d5-89fdc76b036e@xen.org>
Date: Thu, 29 Apr 2021 13:53:30 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <bea459c9-32ed-a800-40ea-456b465cd38a@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Jan,

On 29/04/2021 10:31, Jan Beulich wrote:
> On 15.04.2021 11:41, Jan Beulich wrote:
>> This array can be large when many grant frames are permitted; avoid
>> allocating it when it's not going to be used anyway, by doing this only
>> in gnttab_populate_status_frames().
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> I know there has been controversy here. Julien - you seemed to agree,
> and iirc you partly drove how the patch is looking now. May I ask for
> an ack? Andrew - you disagreed for reasons that neither Julien nor I
> could really understand. Would you firmly nack the change and suggest
> a way out, or would you allow this to go in with someone else's ack?

I was mostly waiting on the discussion with Andrew to settle before 
reviewing. I can have a look now.

Cheers,

-- 
Julien Grall

