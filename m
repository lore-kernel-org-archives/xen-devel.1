Return-Path: <SRS0=a6zz=KF=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 149BDC433B4
	for <xen-devel@archiver.kernel.org>; Mon, 10 May 2021 17:30:19 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B3FFB61469
	for <xen-devel@archiver.kernel.org>; Mon, 10 May 2021 17:30:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B3FFB61469
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.125410.236081 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lg9jO-0004GC-Fk; Mon, 10 May 2021 17:30:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 125410.236081; Mon, 10 May 2021 17:30:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lg9jO-0004G5-CZ; Mon, 10 May 2021 17:30:10 +0000
Received: by outflank-mailman (input) for mailman id 125410;
 Mon, 10 May 2021 17:30:08 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lg9jM-0004Fj-C9
 for xen-devel@lists.xenproject.org; Mon, 10 May 2021 17:30:08 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lg9jK-0002AM-Ev; Mon, 10 May 2021 17:30:06 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lg9jK-0000Ve-96; Mon, 10 May 2021 17:30:06 +0000
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
	bh=yr+ZS+izYvu7Pfvv95PU5vmf3YJm9+MekIOLXwfIbag=; b=I8BsQQmfMKq+DeP+o6LMh5xIWU
	piw2UAPHCUeMF/Vce9HfF45Pu6xqmUrlgTl232K7x3XgGmYdrJWLfQUhzsagmppjJWzJE3wagwTxf
	N+oWLvJX5Z02fPdOtkD9BaYxUiQrBGPF+zB0AoSfDFwQUdHk6RTGVvhPPImYq4zz5H+c=;
Subject: Re: [PATCH] tools/xenstore: Fix indentation in the header of
 xenstored_control.c
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Julien Grall <jgrall@amazon.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>
References: <20210510150728.6263-1-julien@xen.org>
 <37c4fadc-c177-e07f-1026-748a1caa943d@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <73e2732f-166e-fa9d-5f32-905fde92cc47@xen.org>
Date: Mon, 10 May 2021 18:30:04 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <37c4fadc-c177-e07f-1026-748a1caa943d@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 10/05/2021 16:12, Juergen Gross wrote:
> On 10.05.21 17:07, Julien Grall wrote:
>> From: Julien Grall <jgrall@amazon.com>
>>
>> Commit e867af081d94 "tools/xenstore: save new binary for live update"
>> seemed to have spuriously changed the indentation of the first line of
>> the copyright header.
>>
>> The previous indentation is re-instated so all the lines are indented
>> the same.
>>
>> Reported-by: Bjoern Doebel <doebel@amazon.com>
>> Signed-off-by: Julien Grall <jgrall@amazon.com>
> 
> Reviewed-by: Juergen Gross <jgross@suse.com>

Committed.

Cheers,

-- 
Julien Grall

