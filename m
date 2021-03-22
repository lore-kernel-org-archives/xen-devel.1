Return-Path: <SRS0=cl0r=IU=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84F57C433C1
	for <xen-devel@archiver.kernel.org>; Mon, 22 Mar 2021 10:38:43 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2C66D60200
	for <xen-devel@archiver.kernel.org>; Mon, 22 Mar 2021 10:38:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2C66D60200
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.100125.190559 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lOHx8-0000iI-10; Mon, 22 Mar 2021 10:38:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 100125.190559; Mon, 22 Mar 2021 10:38:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lOHx7-0000iB-U9; Mon, 22 Mar 2021 10:38:29 +0000
Received: by outflank-mailman (input) for mailman id 100125;
 Mon, 22 Mar 2021 10:38:29 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lOHx7-0000i6-1j
 for xen-devel@lists.xenproject.org; Mon, 22 Mar 2021 10:38:29 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lOHx3-0001IY-L0; Mon, 22 Mar 2021 10:38:25 +0000
Received: from [54.239.6.177] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lOHx3-00039v-B7; Mon, 22 Mar 2021 10:38:25 +0000
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
	bh=QCoak+ANm+NEE5qZKDNlUXJHy9E+KUH97l9vkmQOqUM=; b=as+49ftfqwa7Nhj6+PY+fBo6Mp
	fq7lTwKodhbt7itkbQo9JgS9BwA+JLBD4EL0LD4yebor8TaUgDE/p2J7hqgSr8P8+lrE6BLGlJeHU
	UuTA1CxOX/MbWihV9R1weVFhQjVhNcTGL8L1GzV/ej/373vZOeFtmFKUUBaexPxby+I0=;
Subject: Re: [PATCH for-4.15 v3] SUPPORT.MD: Mark LiveUpdate of C/OCaml
 XenStored daemon as Tech Preview
To: Ian Jackson <iwj@xenproject.org>
Cc: xen-devel@lists.xenproject.org, Julien Grall <jgrall@amazon.com>,
 Juergen Gross <jgross@suse.com>
References: <20210317120854.19903-1-julien@xen.org>
 <abaa77f4-3375-44c3-bab4-4b286ca42d35@xen.org>
 <24664.29268.129126.416099@mariner.uk.xensource.com>
From: Julien Grall <julien@xen.org>
Message-ID: <0d43dbe3-9ed6-6b54-2aac-2be185283de0@xen.org>
Date: Mon, 22 Mar 2021 10:38:23 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <24664.29268.129126.416099@mariner.uk.xensource.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Ian,

On 22/03/2021 10:32, Ian Jackson wrote:
> Julien Grall writes ("Re: [PATCH for-4.15 v3] SUPPORT.MD: Mark LiveUpdate of C/OCaml XenStored daemon as Tech Preview"):
>> Sorry I forgot to CC you on the original Ian. Would it be possible to
>> give an R-A for the patch below?
> 
> Sure,
> 
> Release-Acked-by: Ian Jackson <iwj@xenproject.org>

Thanks! I will also s/XenStored/xenstored/ as you pointed out on IRC.

Cheers,

> 

-- 
Julien Grall

