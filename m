Return-Path: <SRS0=2fhb=FG=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CE8AC64E7C
	for <xen-devel@archiver.kernel.org>; Wed,  2 Dec 2020 13:58:14 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 19203208FE
	for <xen-devel@archiver.kernel.org>; Wed,  2 Dec 2020 13:58:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 19203208FE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.42753.76930 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkSdn-0006oC-S2; Wed, 02 Dec 2020 13:57:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 42753.76930; Wed, 02 Dec 2020 13:57:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkSdn-0006o5-P8; Wed, 02 Dec 2020 13:57:55 +0000
Received: by outflank-mailman (input) for mailman id 42753;
 Wed, 02 Dec 2020 13:57:54 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1kkSdm-0006o0-Bh
 for xen-devel@lists.xenproject.org; Wed, 02 Dec 2020 13:57:54 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kkSdl-0002Dg-2d; Wed, 02 Dec 2020 13:57:53 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kkSdk-0008MR-Qq; Wed, 02 Dec 2020 13:57:52 +0000
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
	bh=91dOSfOWzqw82XPyEpn2waOosAi1g4ire86s59vJbzE=; b=iTGm2lOGrwcJA0B1xt23KGsLdE
	+Zv8WJmiOP3qEpiFoE5cAPC/xcsEoU8n998b9MMcedZ407D7CQVPGZKOmFcGj3+w5bffFKcGa84c2
	ET8PcFNJn8TwdHKFQlllLMSlQvePMmYm/fVsROScGW2o6Gbl88ZmuWVK9UZtxR6OEN9s=;
Subject: Re: [PATCH v2 5/8] xen/arm: Remove support for PCI ATS on SMMUv3
To: Rahul Singh <rahul.singh@arm.com>, xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1606406359.git.rahul.singh@arm.com>
 <78079d1d6e9d2e7e87125da131e9bdb5809b838a.1606406359.git.rahul.singh@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <0c831595-0ee6-2cd1-cc20-18329cae6b7b@xen.org>
Date: Wed, 2 Dec 2020 13:57:51 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <78079d1d6e9d2e7e87125da131e9bdb5809b838a.1606406359.git.rahul.singh@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Rahul,

On 26/11/2020 17:02, Rahul Singh wrote:
> PCI ATS functionality is not implemented and tested on ARM. 

I agree that short term, this is not going to be implemented. However, I 
do expect this feature to be used medium term (mostly likely before the 
driver is out of tech preview).

So I think it would be best to keep the code around.

Cheers,

-- 
Julien Grall

