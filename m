Return-Path: <SRS0=GDwr=LT=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06EDFC2B9F4
	for <xen-devel@archiver.kernel.org>; Fri, 25 Jun 2021 09:43:43 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B52C06142B
	for <xen-devel@archiver.kernel.org>; Fri, 25 Jun 2021 09:43:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B52C06142B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.147087.270864 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lwiMr-0005ep-1Y; Fri, 25 Jun 2021 09:43:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 147087.270864; Fri, 25 Jun 2021 09:43:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lwiMq-0005ei-Um; Fri, 25 Jun 2021 09:43:20 +0000
Received: by outflank-mailman (input) for mailman id 147087;
 Fri, 25 Jun 2021 09:43:19 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lwiMp-0005ec-MP
 for xen-devel@lists.xenproject.org; Fri, 25 Jun 2021 09:43:19 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lwiMo-0007hf-7t; Fri, 25 Jun 2021 09:43:18 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lwiMl-0002dV-Oi; Fri, 25 Jun 2021 09:43:18 +0000
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
	bh=mSEBjiVaiQFjxMTj7LDSpISaPw+OdYsQprFIQFHf2/k=; b=Zb8KFsfvCysZJcbpoD5Da+sZQT
	vXhpi9V/LX9L0nzsacQzfTkRDj+5mq03/kXXeqlJ1Mjh5SMixKX+oaOav/I4nONJgDHkBF3pgsf4T
	KqB9k9NtQ5EHzCQ2kgcYpRHd+Y3tYeHnqYVTw8y5lZacwhDlVHNTjg2sm6pjxua4NSg4=;
Subject: Re: [PATCH] tools/xenstored: Correctly read the requests header from
 the stream
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: raphning@amazon.co.uk, doebel@amazon.de, Julien Grall
 <jgrall@amazon.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
References: <20210625064522.24919-1-julien@xen.org>
 <8ae5d765-e5a8-26ef-e2d2-8ada29661aa6@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <e42901d4-1aa9-b46b-2ff0-ab0b5f405baa@xen.org>
Date: Fri, 25 Jun 2021 11:43:00 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <8ae5d765-e5a8-26ef-e2d2-8ada29661aa6@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi,

On 25/06/2021 08:58, Juergen Gross wrote:
> On 25.06.21 08:45, Julien Grall wrote:
>> From: Julien Grall <jgrall@amazon.com>
>>
>> Commit c0fe360f42 ("tools/xenstored: Extend restore code to handle
>> multiple input buffer") extend the read_buffered_state() to support
>> multiple input buffers. Unfortunately, the commit didn't go far
>> enough and still used sc->data (start of the buffers) for retrieving
>> the header. This would lead to read the wrong headers for second and
>> follow-up commands.
>>
>> Use data in place for sc->data for the source of the memcpy()s.
>>
>> Fixes: c0fe360f42 ("tools/xenstored: Extend restore code to handle 
>> multiple input buffer")
>> Reported-by: Raphael Ning <raphning@amazon.com>
>> Signed-off-by: Julien Grall <jgrall@amazon.com>
> 
> Reviewed-by: Juergen Gross <jgross@suse.com>

Thank you! I have committed the patch.

Cheers,

> 
> 
> Juergen

-- 
Julien Grall

