Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3AB8D46C04
	for <xen-devel@archiver.kernel.org>; Wed, 28 Jan 2026 21:50:44 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1215984.1525994 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vlDQU-00085w-QI; Wed, 28 Jan 2026 21:50:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1215984.1525994; Wed, 28 Jan 2026 21:50:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vlDQU-00085p-Nd; Wed, 28 Jan 2026 21:50:14 +0000
Received: by outflank-mailman (input) for mailman id 1215984;
 Wed, 28 Jan 2026 21:50:14 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1vlDQU-00085j-F6
 for xen-devel@lists.xenproject.org; Wed, 28 Jan 2026 21:50:14 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1vlDQP-0084hH-2i;
 Wed, 28 Jan 2026 21:50:09 +0000
Received: from [2a02:8012:3a1:0:2517:2769:8ea2:3b28]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1vlDQP-006SEr-0s;
 Wed, 28 Jan 2026 21:50:09 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=Bsk0ZDM69YZO3I61sWSAnNnyY/rgvcUD62fIs1uKveE=; b=rlIJYf4AJQQXrzRL4wEkvppdvZ
	8yqp3h+5rR3OKgc0JFrlJc9U8MIJ1F3+lP4SQjFpGemPoKSwJU5/rVxhWanUbgQ++Y7qUkEFPUbL/
	3wYCPYcsZeiVDHGDE0qih/PWkDNey5Rx9xfNYRy05N3bR1vPPRokEwjxPP5SZ2uksf/M=;
Message-ID: <afac8ebf-71cb-411b-b821-72d82b24ef7f@xen.org>
Date: Wed, 28 Jan 2026 21:50:07 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/12] xen/arm: ffa: FF-A v1.2 support
Content-Language: en-GB
To: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>
Cc: "jens.wiklander@linaro.org" <jens.wiklander@linaro.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1765807707.git.bertrand.marquis@arm.com>
 <2FA52A4C-98F2-4066-8BE7-36F37093FCD6@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <2FA52A4C-98F2-4066-8BE7-36F37093FCD6@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Bertrand,

On 08/01/2026 07:59, Bertrand Marquis wrote:
> Gentle ping: This serie has been fully reviewed by Jens and would need a maintainer ack or review.

As we discussed during the last Arm maintainer call, as you maintain TEE 
with Volodymyr, you technically only need a reviewed-by from someone 
from the community with suitable stature to review.

I think in this case, you meet all the requirements with Jen's acked-by. 
So I will commit the series as-is.

Cheers,

-- 
Julien Grall


