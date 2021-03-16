Return-Path: <SRS0=4R9G=IO=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61783C433DB
	for <xen-devel@archiver.kernel.org>; Tue, 16 Mar 2021 15:17:06 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1A5936508F
	for <xen-devel@archiver.kernel.org>; Tue, 16 Mar 2021 15:17:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1A5936508F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.98361.186554 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lMBRE-00052E-C5; Tue, 16 Mar 2021 15:16:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 98361.186554; Tue, 16 Mar 2021 15:16:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lMBRE-000527-8u; Tue, 16 Mar 2021 15:16:52 +0000
Received: by outflank-mailman (input) for mailman id 98361;
 Tue, 16 Mar 2021 15:16:50 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lMBRC-000522-Cw
 for xen-devel@lists.xenproject.org; Tue, 16 Mar 2021 15:16:50 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lMBRB-0005Xp-Bm; Tue, 16 Mar 2021 15:16:49 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lMBRB-0004oa-15; Tue, 16 Mar 2021 15:16:49 +0000
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
	bh=AJCtys3Ycj9+nYGl0ckgjrzm8wyybxIJBMYSMKkBcyI=; b=ldsethmlSM0HcyQbj9dr8Bcwwr
	gM4OsmJ6D/pv7HLf0RMA2QNe7WvumLMSTdrCfcs6ARnl5a239tOQByaO0Wc5b9MYfij7LMFJAnGwT
	uTRI6okO5vOPu1ezy1OqqM80BtDm/WLgQbDBW8lbXRBFYid9Gty241jXr8Y1eDJ39tY8=;
Subject: Re: [PATCH 1/5] xen/arm: smmuv1: Handle stream IDs more dynamically
To: Rahul Singh <rahul.singh@arm.com>, xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1615312254.git.rahul.singh@arm.com>
 <7775719c50c56b801e69d952e4ce255b8da1481c.1615312254.git.rahul.singh@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <0ff580cf-0e06-ae17-32c9-bf8dce26aead@xen.org>
Date: Tue, 16 Mar 2021 15:16:47 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <7775719c50c56b801e69d952e4ce255b8da1481c.1615312254.git.rahul.singh@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Rahul,

On 09/03/2021 18:19, Rahul Singh wrote:
> Backport commit 21174240e4f4439bb8ed6c116cdbdc03eba2126e
> "iommu/arm-smmu: Handle stream IDs more dynamically" from the Linux
> ernel.
> 
> This patch is the preparatory work to fix the stream match conflict
> when two devices have the same stream-id.
> 
> Original commit message:
> 
> Rather than assuming fixed worst-case values for stream IDs and SMR
> masks, keep track of whatever implemented bits the hardware actually
> reports. This also obviates the slightly questionable validation of SMR
> fields in isolation - rather than aborting the whole SMMU probe for a
> hardware configuration which is still architecturally valid, we can
> simply refuse masters later if they try to claim an unrepresentable ID
> or mask (which almost certainly implies a DT error anyway).

For single backported and verbatim commit, it is common to keep the 
origin tags (I usually indent them) to show who is the original author 
of the patch.

Since 7936671da9fbf645d6bb207608f7b81c27f992de from Wei Chen as an example.

Cheers,

-- 
Julien Grall

