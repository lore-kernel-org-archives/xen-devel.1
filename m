Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D42ECD4F52
	for <xen-devel@archiver.kernel.org>; Tue, 19 May 2026 08:05:29 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1312554.1582642 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPFS0-0005Yl-9n; Tue, 19 May 2026 08:05:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1312554.1582642; Tue, 19 May 2026 08:05:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPFS0-0005Ye-6o; Tue, 19 May 2026 08:05:16 +0000
Received: by outflank-mailman (input) for mailman id 1312554;
 Tue, 19 May 2026 08:05:15 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1wPFRz-0005YY-1D
 for xen-devel@lists.xenproject.org; Tue, 19 May 2026 08:05:15 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1wPFRy-00D4zz-23;
 Tue, 19 May 2026 08:05:14 +0000
Received: from [2a02:8012:3a1:0:f5d8:254d:983d:8dea]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1wPFRy-00DjE2-1C;
 Tue, 19 May 2026 08:05:14 +0000
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
	bh=ADc5/F5SW02jKw3O+12IEV33qq97n+QupUWW2H0ph9U=; b=gOBtdpJ/AvfWP0NgQomiE146a7
	gSDF9DTtww/Gxad4YmdfymFRKOVQf8WXascrfGZTx3tBTY6RCIUSspBoKR7JXJ+ad0X6CAOkG1Tr+
	QTCckLnBLfUxVZeUjGD3jCkDzQBoWpLask3YpY9f0mDxdMDW04MeK0Kk2B6T7hESWCag=;
Message-ID: <3783f629-c658-4f04-a1c0-f1429b84726e@xen.org>
Date: Tue, 19 May 2026 09:05:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] arm: Fix PT_PT table descriptor value and comment
Content-Language: en-GB
To: =?UTF-8?Q?Gabriel_Quint=C3=A1ns_Souto?= <gabi.qs.mail@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, bertrand.marquis@arm.com, michal.orzel@amd.com
References: <b0a7dbdf-775a-45e2-bee4-d234ca21c002@amd.com>
 <20260518210340.81347-1-gabi.qs.mail@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20260518210340.81347-1-gabi.qs.mail@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Gabriel,

For the future, when sending a new version, please create a new thread 
rather than in reply to the latest response.

On 18/05/2026 22:00, Gabriel Quintáns Souto wrote:
> Per ARMv7-A/ARMv8-A ARM, bits [11:2] of table descriptors are
> ignored by hardware. The original comment incorrectly described
> block/page descriptor fields which are not present in table
> descriptors.

Do you have more details why this change? Is this to strictly follow the 
Arm Arm?

In the ideal situation we should have the page table descriptors 
consistent between the assembly and the C version (see 
mfn_to_xen_entry()). They were diverging before and this is still 
diverging. If we are concerned about setting AF here, then we ought to 
modify the C versions as well.

It could be done separately though.

> 
> Use the minimal valid encoding for table descriptors by setting
> PT_PT to 0x3.
> 
> This updates both arm32 and arm64 for consistency.
 > > Signed-off-by: Gabriel Quintáns Souto <gabi.qs.mail@gmail.com>

Reviewed-by: Julien Grall <julien@xen.org>

Cheers,

-- 
Julien Grall


