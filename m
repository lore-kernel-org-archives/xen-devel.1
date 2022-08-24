Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17205C00140
	for <xen-devel@archiver.kernel.org>; Wed, 24 Aug 2022 10:29:49 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.392374.630681 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQndc-0003qE-8n; Wed, 24 Aug 2022 10:29:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 392374.630681; Wed, 24 Aug 2022 10:29:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQndc-0003q7-65; Wed, 24 Aug 2022 10:29:32 +0000
Received: by outflank-mailman (input) for mailman id 392374;
 Wed, 24 Aug 2022 10:29:30 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oQnda-0003q1-HR
 for xen-devel@lists.xenproject.org; Wed, 24 Aug 2022 10:29:30 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oQnda-0001nw-48; Wed, 24 Aug 2022 10:29:30 +0000
Received: from [54.239.6.185] (helo=[192.168.29.89])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oQndZ-0003xd-Sv; Wed, 24 Aug 2022 10:29:30 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=Xqq2fO9bEitK8GTSQry/JgnqyDwqpytyHuhXSLfrUQ0=; b=oeyNu4xFqiAvU32bMVLaPg6UcI
	wo+MFlsn+mJX3TNsrr7FrNFqoCl8xMeArUH0yXD6RCiK9RJRnMUC5OQYy9R2kRHaRMbur49bzi/or
	DPEX9Ks/UcahQkCM/T1UwZkM1nu4rtQTx3GnjU0rdkO/eQda0ZnZbmgy1RCAxS9Mj0D8=;
Message-ID: <384d4ac1-9652-390c-2750-1cf628b887f0@xen.org>
Date: Wed, 24 Aug 2022 11:29:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.1.2
Subject: Re: [PATCH] xen: let ASSERT_UNREACHABLE() WARN() in non-debug builds
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Henry.Wang@arm.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20220824102225.11431-1-jgross@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220824102225.11431-1-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Juergen,

Thanks for sending the patch quickly :).

On 24/08/2022 11:22, Juergen Gross wrote:
> Hitting an ASSERT_UNREACHABLE() is always wrong, so even in production
> builds a warning seems to be appropriate when hitting one.
> 
> In order not to flood the console in reproducible cases, introduce
> WARN_ONCE() to be used in this case.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

