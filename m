Return-Path: <SRS0=VkMt=LS=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64C5AC48BDF
	for <xen-devel@archiver.kernel.org>; Thu, 24 Jun 2021 10:46:04 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 32444613FF
	for <xen-devel@archiver.kernel.org>; Thu, 24 Jun 2021 10:46:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 32444613FF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.146684.270045 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lwMrt-0004Vo-DA; Thu, 24 Jun 2021 10:45:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 146684.270045; Thu, 24 Jun 2021 10:45:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lwMrt-0004Vh-AG; Thu, 24 Jun 2021 10:45:57 +0000
Received: by outflank-mailman (input) for mailman id 146684;
 Thu, 24 Jun 2021 10:45:56 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lwMrs-0004VZ-TE
 for xen-devel@lists.xenproject.org; Thu, 24 Jun 2021 10:45:56 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lwMrr-0006Wc-Hy; Thu, 24 Jun 2021 10:45:55 +0000
Received: from [54.239.6.182] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lwMrr-0000S3-BS; Thu, 24 Jun 2021 10:45:55 +0000
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
	bh=pe2WkScqUSNzasT0QYQWtMKT3duB1hhvHM8kZVK5rrU=; b=RE0ck0LzKC0RLRIHw/5L3jijwg
	PpYDoURqDVMER2GZ3TLSEllUVJ1NaR8rDLxAJQV36TGwVUA6b6S2aE1oVm0QBM7444o1GCAIvzzsF
	r64x5JJ8Weo6HeBZTkMEyfQZVY7ecFe53YcoFkcs0c+gVDS98C75OZMnfkBEsAdUMeu8=;
Subject: Re: [PATCH] maintainers: adding new reviewer for xsm
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: xen-devel@lists.xenproject.org, George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>
References: <20210617234955.18489-1-dpsmith@apertussolutions.com>
 <alpine.DEB.2.21.2106171712010.24906@sstabellini-ThinkPad-T480s>
 <635b99e9-815f-edbb-52bf-dd6465bf16c9@citrix.com>
From: Julien Grall <julien@xen.org>
Message-ID: <674fbd6b-784c-5617-364d-9b9c441b60c2@xen.org>
Date: Thu, 24 Jun 2021 12:45:52 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <635b99e9-815f-edbb-52bf-dd6465bf16c9@citrix.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi,

On 18/06/2021 11:59, Andrew Cooper wrote:
> On 18/06/2021 01:12, Stefano Stabellini wrote:
>> On Thu, 17 Jun 2021, Daniel P. Smith wrote:
>>> Would like to add myself as a reviewer for XSM.
>>>
>>> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
>> Acked-by: Stefano Stabellini <sstabellini@kernel.org>
> 
> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

I have committed it.

Cheers,

-- 
Julien Grall

