Return-Path: <SRS0=yIgx=N7=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41E63C433EF
	for <xen-devel@archiver.kernel.org>; Thu,  9 Sep 2021 17:19:27 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F3FD061104
	for <xen-devel@archiver.kernel.org>; Thu,  9 Sep 2021 17:19:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F3FD061104
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.183438.331617 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mONhe-0003FT-Uh; Thu, 09 Sep 2021 17:19:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 183438.331617; Thu, 09 Sep 2021 17:19:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mONhe-0003FM-RG; Thu, 09 Sep 2021 17:19:10 +0000
Received: by outflank-mailman (input) for mailman id 183438;
 Thu, 09 Sep 2021 17:19:09 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mONhd-0003FG-OH
 for xen-devel@lists.xenproject.org; Thu, 09 Sep 2021 17:19:09 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mONhb-0002xR-2E; Thu, 09 Sep 2021 17:19:07 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mONha-0008Fx-Rx; Thu, 09 Sep 2021 17:19:06 +0000
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
	bh=DSXntFz1K6MMSBxiwjqUnifCkDzWAFsf49MNV7vK8WI=; b=KoQ9pphil1aCm0O0mSFqlVLMH2
	EBerKzE3ezYFlElJ8RvYLRDseiIgwwMSvv1g2pxvvu+7h40HaQllQm9PaU4Lw8eCraciGLrLV8cM7
	Wkps7de0vxejnGqCA0us+4Yx3lDa/6udY4eKJRmfz3ZKXKREafyIW+KM+Ts1zKY1Sqiw=;
Subject: Re: [PATCH 01/11] xen/arm: Add new device type for PCI
To: Oleksandr Andrushchenko <andr2000@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, oleksandr_tyshchenko@epam.com,
 volodymyr_babchuk@epam.com, Artem_Mygaiev@epam.com, roger.pau@citrix.com,
 bertrand.marquis@arm.com, rahul.singh@arm.com,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
References: <20210903083347.131786-1-andr2000@gmail.com>
 <20210903083347.131786-2-andr2000@gmail.com>
From: Julien Grall <julien@xen.org>
Message-ID: <5a32422f-0782-342d-911b-116af2c85859@xen.org>
Date: Thu, 9 Sep 2021 18:19:04 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20210903083347.131786-2-andr2000@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Oleksandr,

On 03/09/2021 09:33, Oleksandr Andrushchenko wrote:
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> 
> Add new device type (DEV_PCI) to distinguish PCI devices from platform
> DT devices, so some drivers, like IOMMU, can handle PCI devices
> differently.

I think it would be better to fold this change in the next patch as this 
is where you add all the helpers for converting dev to PCI.

> 
> While at it fix dev_is_dt macro.

I would keep this change separate. It also needs an explanation of 
what's the problem and mention it is a latent bug because no-one use it 
(so we know this doesn't require a backport).

Cheers,

-- 
Julien Grall

