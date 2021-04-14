Return-Path: <SRS0=ZRtW=JL=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E92A6C433B4
	for <xen-devel@archiver.kernel.org>; Wed, 14 Apr 2021 11:17:02 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 97F8B600D4
	for <xen-devel@archiver.kernel.org>; Wed, 14 Apr 2021 11:17:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 97F8B600D4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.110515.210943 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWdVg-0005uF-5Y; Wed, 14 Apr 2021 11:16:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 110515.210943; Wed, 14 Apr 2021 11:16:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWdVg-0005u8-1U; Wed, 14 Apr 2021 11:16:40 +0000
Received: by outflank-mailman (input) for mailman id 110515;
 Wed, 14 Apr 2021 11:16:39 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lWdVe-0005u2-VU
 for xen-devel@lists.xenproject.org; Wed, 14 Apr 2021 11:16:38 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lWdVd-00005W-UU; Wed, 14 Apr 2021 11:16:37 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lWdVd-00024V-LZ; Wed, 14 Apr 2021 11:16:37 +0000
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
	bh=Rm62n9DiP9EhMnVewb6N71g2+kOXxGxLy3nrnbCI3Yg=; b=0BgOy+d/RJyxABYUqIpSziDHih
	KMO6zZRn7Ntq1idYqrjS7O5E1VJFFJ+QRzwjL9/7OTpdBfv2Thm06N1Rg1sc0Suz+OCmhLIVSwA8P
	odUKtXNHYpjrjM2IPaEHcC3ZvQAf7/Iq2+18fZc4B1sFzVuf1rUuLFeNTCIwditJLfZ4=;
Subject: Re: [PATCH v4 2/4] xen/arm: Handle cases when hardware_domain is NULL
To: Luca Fancellu <luca.fancellu@arm.com>, xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com, wei.chen@arm.com,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Rahul Singh <rahul.singh@arm.com>
References: <20210414091404.14215-1-luca.fancellu@arm.com>
 <20210414091404.14215-3-luca.fancellu@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <3424d24f-b189-c125-7b84-96848bbdcfd7@xen.org>
Date: Wed, 14 Apr 2021 12:16:35 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <20210414091404.14215-3-luca.fancellu@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Luca,

On 14/04/2021 10:14, Luca Fancellu wrote:
> Among the common and arm codebase there are few cases where
> the hardware_domain variable is checked to see if the current
> domain is equal to the hardware_domain, change this cases to
> use is_hardware_domain() function instead. >
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> ---
> v4 changes:
> - removed unneeded check for domain NULL from is_hardware_domain
>    introduced in v3

After this change, this patch is only avoid to open-code 
is_hardware_domain(). Although, it adds an extra speculation barrier.

I am not against the change, however I think the commit message needs to 
updated to match what the patch is doing.

Can you propose a new commit message?

Cheers,

-- 
Julien Grall

