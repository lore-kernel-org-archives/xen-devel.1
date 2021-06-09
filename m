Return-Path: <SRS0=5TPE=LD=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3418CC48BCD
	for <xen-devel@archiver.kernel.org>; Wed,  9 Jun 2021 17:53:23 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EAF2F613CB
	for <xen-devel@archiver.kernel.org>; Wed,  9 Jun 2021 17:53:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EAF2F613CB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.139511.257946 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lr2O3-0001Qd-8K; Wed, 09 Jun 2021 17:53:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 139511.257946; Wed, 09 Jun 2021 17:53:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lr2O3-0001QV-4v; Wed, 09 Jun 2021 17:53:07 +0000
Received: by outflank-mailman (input) for mailman id 139511;
 Wed, 09 Jun 2021 17:53:05 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lr2O1-0001QP-RL
 for xen-devel@lists.xenproject.org; Wed, 09 Jun 2021 17:53:05 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lr2O0-0004yL-KW; Wed, 09 Jun 2021 17:53:04 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lr2O0-000368-E9; Wed, 09 Jun 2021 17:53:04 +0000
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
	bh=N7fqOEJI6vy3tiWAIRn0BxUEzWFvHVPSCYtJGaFrZBg=; b=RElgDiIz73+mm9sODkKxqyyOjm
	AVNFG42+Dtuis6eIqq8p3GCcvZN2FRp27L49Do1BacUoUyXOLriYH551mJ0xGdrO9+qtDRg8TGAe0
	2IaRlcx09m2Nqg7YCqzFq7VgAS4f8/WVPD+mnJ0wyreTvmyR7N4kX31pZ8qMIS4GcA2A=;
Subject: Re: [PATCH] xen/arm32: SPSR_hyp/SPSR
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Volodymyr_Babchuk@epam.com, xen-devel@lists.xenproject.org,
 Bertrand.Marquis@arm.com, Michal.Orzel@arm.com, edgar.iglesias@xilinx.com,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
References: <20210609174324.6621-1-sstabellini@kernel.org>
From: Julien Grall <julien@xen.org>
Message-ID: <712da7a7-2c1f-fd24-398d-27966335618a@xen.org>
Date: Wed, 9 Jun 2021 18:53:02 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210609174324.6621-1-sstabellini@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 09/06/2021 18:43, Stefano Stabellini wrote:
> SPSR_hyp is not meant to be accessed from Hyp mode (EL2); accesses
> trigger UNPREDICTABLE behaviour. Xen should read/write SPSR instead.

Please provide a reference to the spec. This helps reviewer and/or 
future developper to figure out quickly where this comes from.

> 
> This fixes booting Xen/arm32 on QEMU.
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>

With the reference added:

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

