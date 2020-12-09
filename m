Return-Path: <SRS0=Zv5g=FN=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B1A9C433FE
	for <xen-devel@archiver.kernel.org>; Wed,  9 Dec 2020 23:22:58 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0C861238EB
	for <xen-devel@archiver.kernel.org>; Wed,  9 Dec 2020 23:22:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0C861238EB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.48860.86441 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kn8nB-0000rO-NR; Wed, 09 Dec 2020 23:22:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 48860.86441; Wed, 09 Dec 2020 23:22:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kn8nB-0000rH-Ii; Wed, 09 Dec 2020 23:22:41 +0000
Received: by outflank-mailman (input) for mailman id 48860;
 Wed, 09 Dec 2020 23:22:40 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1kn8nA-0000rC-Kx
 for xen-devel@lists.xenproject.org; Wed, 09 Dec 2020 23:22:40 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kn8n9-0004xM-6D; Wed, 09 Dec 2020 23:22:39 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kn8n8-0001YV-V4; Wed, 09 Dec 2020 23:22:39 +0000
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
	bh=JjyjhzTWaMwnycOk0aOS8NcMq+XcL2vXe5foY/m4WHc=; b=Yi7zwWKSKoV3Oi7WP70/WQFdwA
	2ktS6ubIMJ4q1OZNJcwh8r6vG5FLVqOX243tHjFTKeDU3kzZmX23FEUx3DzICfUjXYHRnJLvfXdRG
	+Llc6Eg+++3yv8CN67lEe9qYUKUJQfZD+GcUBIhP0U9IQZmGKa4/tqgyx1Gl/sTbmIWI=;
Subject: Re: [PATCH v3 3/7] xen/arm: create a cpuinfo structure for guest
To: Bertrand Marquis <bertrand.marquis@arm.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1607524536.git.bertrand.marquis@arm.com>
 <33f39e7f521e6f73a0dba57a8be9fb50656e1807.1607524536.git.bertrand.marquis@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <6cf80971-e9aa-f9e4-cb9b-4f102b84a99b@xen.org>
Date: Wed, 9 Dec 2020 23:22:37 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <33f39e7f521e6f73a0dba57a8be9fb50656e1807.1607524536.git.bertrand.marquis@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi,

On 09/12/2020 16:30, Bertrand Marquis wrote:
> +    /* Disable MPAM as xen does not support it */

I am going to be picky :). I think we want to say "hide" rather than 
"disable" because the latter is done differently via the HCR_EL2.

Cheers,

-- 
Julien Grall

