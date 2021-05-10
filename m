Return-Path: <SRS0=a6zz=KF=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A3D8C43462
	for <xen-devel@archiver.kernel.org>; Mon, 10 May 2021 17:36:41 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 10D2D61042
	for <xen-devel@archiver.kernel.org>; Mon, 10 May 2021 17:36:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 10D2D61042
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.125419.236100 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lg9pW-00058P-9Z; Mon, 10 May 2021 17:36:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 125419.236100; Mon, 10 May 2021 17:36:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lg9pW-00058I-6V; Mon, 10 May 2021 17:36:30 +0000
Received: by outflank-mailman (input) for mailman id 125419;
 Mon, 10 May 2021 17:36:29 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lg9pV-00058C-GG
 for xen-devel@lists.xenproject.org; Mon, 10 May 2021 17:36:29 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lg9pU-0002IZ-Tp; Mon, 10 May 2021 17:36:28 +0000
Received: from [54.239.6.187] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lg9pU-0001GU-O9; Mon, 10 May 2021 17:36:28 +0000
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
	bh=sn6q8LNvcDLHLxZYDenaUjvQR2fRW69gHC7bj3GpUYc=; b=TY4Nj3Ttfri1kGXtsgVZDf8HJF
	VsPcXg/lcu4ofvTOToI16ZXbUUpACYeNEHqwo7GSLrOvE2gldXdTsBF0W1/7LQkm3AB5HUsyG0Sx1
	08h0Cbf45nxCaWft/+ZPs51FSnp4TmqJ+0KPqciUw+HnkAvaBIylBpcMC+ND/Wd5lEYw=;
Subject: Re: [PATCH] optee: enable OPTEE_SMC_SEC_CAP_MEMREF_NULL capability
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: "tee-dev@lists.linaro.org" <tee-dev@lists.linaro.org>
References: <20210507013938.676142-1-volodymyr_babchuk@epam.com>
From: Julien Grall <julien@xen.org>
Message-ID: <7d74e29f-08ec-a4fc-db39-4dbb14a8d89b@xen.org>
Date: Mon, 10 May 2021 18:36:27 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210507013938.676142-1-volodymyr_babchuk@epam.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Volodymyr,

On 07/05/2021 02:39, Volodymyr Babchuk wrote:
> OP-TEE mediator already have support for NULL memory references. It
> was added in patch 0dbed3ad336 ("optee: allow plain TMEM buffers with
> NULL address"). But it does not propagate
> OPTEE_SMC_SEC_CAP_MEMREF_NULL capability flag to a guest, so well
> behaving guest can't use this feature.
> 
> Note: linux optee driver honors this capability flag when handling
> buffers from userspace clients, but ignores it when working with
> internal calls. For instance, __optee_enumerate_devices() function
> uses NULL argument to get buffer size hint from OP-TEE. This was the
> reason, why "optee: allow plain TMEM buffers with NULL address" was
> introduced in the first place.
> 
> This patch adds the mentioned capability to list of known
> capabilities. From Linux point of view it means that userspace clients
> can use this feature, which is confirmed by OP-TEE test suite:
> 
> * regression_1025 Test memref NULL and/or 0 bytes size
> o regression_1025.1 Invalid NULL buffer memref registration
>    regression_1025.1 OK
> o regression_1025.2 Input/Output MEMREF Buffer NULL - Size 0 bytes
>    regression_1025.2 OK
> o regression_1025.3 Input MEMREF Buffer NULL - Size non 0 bytes
>    regression_1025.3 OK
> o regression_1025.4 Input MEMREF Buffer NULL over PTA invocation
>    regression_1025.4 OK
>    regression_1025 OK
> 
> Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>

Acked-by: Julien Grall <jgrall@amazon.com>

And committed.

Cheers,

-- 
Julien Grall

