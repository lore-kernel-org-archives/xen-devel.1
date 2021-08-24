Return-Path: <SRS0=P/U6=NP=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16425C4338F
	for <xen-devel@archiver.kernel.org>; Tue, 24 Aug 2021 10:24:29 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CFD106127B
	for <xen-devel@archiver.kernel.org>; Tue, 24 Aug 2021 10:24:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CFD106127B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.170848.311801 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mITbJ-0002NB-C9; Tue, 24 Aug 2021 10:24:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 170848.311801; Tue, 24 Aug 2021 10:24:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mITbJ-0002N4-7f; Tue, 24 Aug 2021 10:24:13 +0000
Received: by outflank-mailman (input) for mailman id 170848;
 Tue, 24 Aug 2021 10:24:12 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mITbI-0002My-7Q
 for xen-devel@lists.xenproject.org; Tue, 24 Aug 2021 10:24:12 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mITbH-0000OM-5P; Tue, 24 Aug 2021 10:24:11 +0000
Received: from [54.239.6.177] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mITbG-0005xJ-V0; Tue, 24 Aug 2021 10:24:11 +0000
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
	bh=ZvSrbHeCwtixDAJXHxoOiRy04AP9GIFE0YY3/y7MfR0=; b=i+wNQpZFp95iFRtQp+pT+U+39G
	KpaPQ32WzabM4KWGl2t9U7JB2VYwAwLuhj4r1XHaUc5cftD71rZun5ZQrhjXEwk/vl0FBDko/yUB/
	ORgR8M64z+QA6mGBbU/Cz8iSedHOLUeX1AVVXZLmE8yo/jD3DbBAj8s5E1q63BvM30Lk=;
Subject: Re: [PATCH] xen/public: arch-arm: Add mention of argo_op hypercall
To: Christopher Clark <christopher.w.clark@gmail.com>,
 Michal Orzel <michal.orzel@arm.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>
References: <20210820093924.9991-1-michal.orzel@arm.com>
 <CACMJ4Ga6DqVmX5wyheFJTnxaKEnVCs7ezDhYxO=7qmC2UEhVyg@mail.gmail.com>
From: Julien Grall <julien@xen.org>
Message-ID: <2d1309f5-1186-6e67-94c9-779c2093bca2@xen.org>
Date: Tue, 24 Aug 2021 11:24:09 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CACMJ4Ga6DqVmX5wyheFJTnxaKEnVCs7ezDhYxO=7qmC2UEhVyg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi,

On 20/08/2021 18:33, Christopher Clark wrote:
> On Fri, Aug 20, 2021 at 2:39 AM Michal Orzel <michal.orzel@arm.com 
> <mailto:michal.orzel@arm.com>> wrote:
> 
>     Commit 1ddc0d43c20cb1c1125d4d6cefc78624b2a9ccb7 introducing
>     argo_op hypercall forgot to add a mention of it in the
>     comment listing supported hypercalls. Fix that.
> 
>     Signed-off-by: Michal Orzel <michal.orzel@arm.com
>     <mailto:michal.orzel@arm.com>>
> 
> 
> Thanks, Michal.
> Reviewed-by: Christopher Clark <christopher.w.clark@gmail.com 
> <mailto:christopher.w.clark@gmail.com>>

Acked-by: Julien Grall <jgrall@amazon.com>

And committed.

Cheers,

-- 
Julien Grall

