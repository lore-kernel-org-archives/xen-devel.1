Return-Path: <SRS0=UsJP=GQ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7398BC433E0
	for <xen-devel@archiver.kernel.org>; Wed, 13 Jan 2021 18:48:50 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1562720780
	for <xen-devel@archiver.kernel.org>; Wed, 13 Jan 2021 18:48:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1562720780
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.66708.118587 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzlCE-00035a-44; Wed, 13 Jan 2021 18:48:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 66708.118587; Wed, 13 Jan 2021 18:48:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzlCE-00035T-17; Wed, 13 Jan 2021 18:48:42 +0000
Received: by outflank-mailman (input) for mailman id 66708;
 Wed, 13 Jan 2021 18:48:41 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1kzlCD-00035O-4X
 for xen-devel@lists.xenproject.org; Wed, 13 Jan 2021 18:48:41 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kzlCB-0002HJ-OZ; Wed, 13 Jan 2021 18:48:39 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kzlCB-0006jE-H8; Wed, 13 Jan 2021 18:48:39 +0000
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
	bh=4sgmY+Gfgow/UnOmhrs0LRc7dn+lywmp+AP9KF0EhpM=; b=5+7cxzxBkWo8lHcxUtWg7VkkyY
	xxKTlUeGAW5w+L9JnqXFkDpi8DEhZ0Xz2xebrDXWv9DyfiUpNNlkL7VRPhigYs+V7m7U9XB+P9X0d
	76HubFa60qtWEaZExIJipO9wEDOx7JF6VpQLEaY1eINP3z0ud9kL59B+hmYV857epuEY=;
Subject: Re: [PATCH v2 2/2] mm: split out mfn_t / gfn_t / pfn_t definitions
 and helpers
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Hongyan Xia <hx242@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
References: <b2368cb9-5c9a-3e85-c048-383825cc5efe@suse.com>
 <53312a94-91c5-2cf5-47f0-6c3b130d2e47@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <c169e67d-0e56-4879-8089-d915f07c401c@xen.org>
Date: Wed, 13 Jan 2021 18:48:37 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <53312a94-91c5-2cf5-47f0-6c3b130d2e47@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Jan,

On 05/01/2021 12:38, Jan Beulich wrote:
> xen/mm.h has heavy dependencies, while in a number of cases only these
> type definitions are needed. This separation then also allows pulling in
> these definitions when including xen/mm.h would cause cyclic
> dependencies.
> 
> Replace xen/mm.h inclusion where possible in include/xen/. (In
> xen/iommu.h also take the opportunity and correct the few remaining
> sorting issues.)
> 
> While the change could be dropped, remove an unnecessary asm/io.h
> inclusion from xen/arch/x86/acpi/power.c. This was the initial attempt
> to address build issues with it, until it became clear that the header
> itself needs adjustment.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

