Return-Path: <SRS0=2fhb=FG=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7710C64E7C
	for <xen-devel@archiver.kernel.org>; Wed,  2 Dec 2020 13:45:24 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 62174221FB
	for <xen-devel@archiver.kernel.org>; Wed,  2 Dec 2020 13:45:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 62174221FB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.42732.76892 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkSRD-0005VV-0D; Wed, 02 Dec 2020 13:44:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 42732.76892; Wed, 02 Dec 2020 13:44:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkSRC-0005VO-TC; Wed, 02 Dec 2020 13:44:54 +0000
Received: by outflank-mailman (input) for mailman id 42732;
 Wed, 02 Dec 2020 13:44:53 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1kkSRB-0005VD-Ca
 for xen-devel@lists.xenproject.org; Wed, 02 Dec 2020 13:44:53 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kkSR9-0001vV-WD; Wed, 02 Dec 2020 13:44:52 +0000
Received: from [54.239.6.187] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kkSR9-0007Jk-QY; Wed, 02 Dec 2020 13:44:51 +0000
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
	bh=CUjdfLZFOHaD7kprNnefbGcLGRXfJc7JyVO7qhIJrUc=; b=7Nb5ACfpFlhbGWk7pCeqaylrMX
	ON7CC9R+GuRUDH0vEVtvMfH9SBtkSzcdMvbOP7HCzmORubkj2KtZet1wmK+3LXElYxPNg2PD2KEWD
	1ZEiqAlMx9hpgo53KYk7uDKyjWjSyzfqZVJw228Wqmm67eZJPfRTYNbRpOXIMrrCjFsE=;
Subject: Re: [PATCH v2 2/8] xen/arm: revert atomic operation related
 command-queue insertion patch
To: Rahul Singh <rahul.singh@arm.com>, xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1606406359.git.rahul.singh@arm.com>
 <4a0ca6d03b5f1f5b30c4cdbdff0688cea84d9e91.1606406359.git.rahul.singh@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <39a9c619-d7b2-eca0-688c-5f35546e59fa@xen.org>
Date: Wed, 2 Dec 2020 13:44:49 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <4a0ca6d03b5f1f5b30c4cdbdff0688cea84d9e91.1606406359.git.rahul.singh@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Rahul,

On 26/11/2020 17:02, Rahul Singh wrote:
> Linux SMMUv3 code implements the commands-queue insertion based on
> atomic operations implemented in Linux. Atomic functions used by the
> commands-queue insertion is not implemented in XEN therefore revert the
> patch that implemented the commands-queue insertion based on atomic
> operations.

This commit message explains why we revert but not the consequence of 
the revert. Can outline if there are any and why they are fine?

I am also interested to have a list of *must* have for the driver to be 
out of the tech preview.

Cheers,

-- 
Julien Grall

