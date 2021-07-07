Return-Path: <SRS0=E0OE=L7=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50F9BC07E95
	for <xen-devel@archiver.kernel.org>; Wed,  7 Jul 2021 13:08:59 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0EB6661A24
	for <xen-devel@archiver.kernel.org>; Wed,  7 Jul 2021 13:08:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0EB6661A24
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.152201.281195 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m17II-0003Ut-6t; Wed, 07 Jul 2021 13:08:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 152201.281195; Wed, 07 Jul 2021 13:08:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m17II-0003Um-44; Wed, 07 Jul 2021 13:08:50 +0000
Received: by outflank-mailman (input) for mailman id 152201;
 Wed, 07 Jul 2021 13:08:48 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1m17IG-0003Ue-PR
 for xen-devel@lists.xenproject.org; Wed, 07 Jul 2021 13:08:48 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1m17IF-000427-2o; Wed, 07 Jul 2021 13:08:47 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1m17IE-0007o4-Tt; Wed, 07 Jul 2021 13:08:47 +0000
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
	MIME-Version:Date:Message-ID:References:Cc:To:From:Subject;
	bh=OrLD2pOmHbJxSzYkuiC+feOyiqiWerP7s26qMjwK/HI=; b=RaFelctTNmhb3IoZwR+PtuXCVD
	mFofCyfMicv9WW+xPat1bci+l5Y7oJNFfhNjVDrBHnOhKATnirRGv5U9MPi96Kgc8Ib4cRMwyIJTR
	7m0t5VFXUUqJQt1UgWoZLGv8SA272oZmkWqFPu+ydEyzVQ0o52GLiii6OdBChNexHkio=;
Subject: Re: [PATCH] xen/arm: smmuv1: Switch from kzalloc_array(..) to
 devm_kcalloc(..)
From: Julien Grall <julien@xen.org>
To: Rahul Singh <rahul.singh@arm.com>, xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <2c611dec5f1dbd6040d7a37d2d72ad2fc66e113f.1625568432.git.rahul.singh@arm.com>
 <d30b4c93-f45d-86cf-5966-3ff0f8788cca@xen.org>
Message-ID: <62ad240a-02b1-43eb-0d1f-ec14fc1b390f@xen.org>
Date: Wed, 7 Jul 2021 14:08:44 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <d30b4c93-f45d-86cf-5966-3ff0f8788cca@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 07/07/2021 14:07, Julien Grall wrote:
> Hi Rahul,
> 
> On 06/07/2021 11:53, Rahul Singh wrote:
>> Switch from kzalloc_array(..) to devm_kcalloc(..) when allocating the
>> SMR to make code coherent.
>>
>> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
> 
> Acked-by: Julien Grall <jgrall@amazon.com>

And committed.

Cheers,

-- 
Julien Grall

