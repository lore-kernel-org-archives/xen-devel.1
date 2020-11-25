Return-Path: <SRS0=CtBx=E7=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3F8FC5519F
	for <xen-devel@archiver.kernel.org>; Wed, 25 Nov 2020 11:27:23 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4BA3720679
	for <xen-devel@archiver.kernel.org>; Wed, 25 Nov 2020 11:27:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=xen.org header.i=@xen.org header.b="SXXplQM0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4BA3720679
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.37589.70024 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khswx-0002Gk-9a; Wed, 25 Nov 2020 11:27:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 37589.70024; Wed, 25 Nov 2020 11:27:03 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khswx-0002Gd-6J; Wed, 25 Nov 2020 11:27:03 +0000
Received: by outflank-mailman (input) for mailman id 37589;
 Wed, 25 Nov 2020 11:27:01 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1khswv-0002GY-79
 for xen-devel@lists.xenproject.org; Wed, 25 Nov 2020 11:27:01 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1khswu-0005Ko-UW; Wed, 25 Nov 2020 11:27:00 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1khswu-0007if-Ma; Wed, 25 Nov 2020 11:27:00 +0000
Received: from mail.xenproject.org ([104.130.215.37])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1khswv-0002GY-79
	for xen-devel@lists.xenproject.org; Wed, 25 Nov 2020 11:27:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=/KkqULJCMurogweMWLGS4Q/2SZryfCb+U3g2wAcQBLU=; b=SXXplQM07Y1/Zm7BHsbpLdLVwG
	6w0n1SLXOtyFbRos1HrMsy/hXB0SIaMXpE5LvUrE+qWe80i3l5P1lHHj9FeGCHgN4vcCI4rX/CM3/
	cM3YP6LmiBfzXMmlKAP8/0M7P3clMGjmKAAi7xOQDy3/c/czKwy8Vh+3eK36UURUS4AU=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1khswu-0005Ko-UW; Wed, 25 Nov 2020 11:27:00 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1khswu-0007if-Ma; Wed, 25 Nov 2020 11:27:00 +0000
Subject: Re: [PATCH] xen/arm: Add workaround for Cortex-A55 erratum #1530923
To: Stefano Stabellini <sstabellini@kernel.org>,
 Rahul Singh <Rahul.Singh@arm.com>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <61a105672650e7470710183f37351b821b818d1e.1606215998.git.bertrand.marquis@arm.com>
 <E5A460E5-7D10-4314-98B4-0D90CD173940@arm.com>
 <alpine.DEB.2.21.2011240944400.7979@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien@xen.org>
Message-ID: <7b05cb84-a9c3-10b2-5713-42259695e9b1@xen.org>
Date: Wed, 25 Nov 2020 11:26:59 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2011240944400.7979@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 24/11/2020 17:44, Stefano Stabellini wrote:
> On Tue, 24 Nov 2020, Rahul Singh wrote:
>>> On 24 Nov 2020, at 11:12 am, Bertrand Marquis <Bertrand.Marquis@arm.com> wrote:
>>>
>>> On the Cortex A55, TLB entries can be allocated by a speculative AT
>>> instruction. If this is happening during a guest context switch with an
>>> inconsistent page table state in the guest, TLBs with wrong values might
>>> be allocated.
>>> The ARM64_WORKAROUND_AT_SPECULATE workaround is used as for erratum
>>> 1165522 on Cortex A76 or Neoverse N1.
>>>
>>> This change is also introducing the MIDR identifier for the Cortex-A55.
>>>
>>> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
>>
>> Reviewed-by: Rahul Singh <rahul.singh@arm.com>
> 
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

Acked-by: Julien Grall <jgrall@amazon.com>

And committed.

Cheers,

-- 
Julien Grall

