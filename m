Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FBD8F531E4
	for <xen-devel@archiver.kernel.org>; Tue, 14 Apr 2026 01:47:15 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1281385.1564294 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wCSrY-0003k0-AA; Tue, 14 Apr 2026 01:46:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1281385.1564294; Tue, 14 Apr 2026 01:46:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wCSrY-0003jt-7L; Tue, 14 Apr 2026 01:46:48 +0000
Received: by outflank-mailman (input) for mailman id 1281385;
 Tue, 14 Apr 2026 01:46:47 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1wCSrX-0003jn-8K
 for xen-devel@lists.xenproject.org; Tue, 14 Apr 2026 01:46:47 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1wCSrV-001QkU-2P;
 Tue, 14 Apr 2026 01:46:45 +0000
Received: from [116.84.110.196] (helo=[10.158.125.74])
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1wCSrV-001UUQ-14;
 Tue, 14 Apr 2026 01:46:45 +0000
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
	bh=hn/ObxAnxTNEf0U8zXIaExFL3p9yj5z4expNS+0guuA=; b=Tr375Fbn7RH6XLG3nob3qGod/x
	LHEXzMiWx6iB50ckfTXVdif9fO89Fape8rmqBhrtdd19r8nHa9c8UAvsQ6YFcBVUfIDSoweQ3CvL5
	QCeaLUvFiYXykgn0lvzIRgqMSijq4MC2EbW1DZEwcY3EGlqGMK/JCjKL2wVK0P6k/yx4=;
Message-ID: <cfe8b6ae-2f52-47c4-862d-52d648d41895@xen.org>
Date: Tue, 14 Apr 2026 10:46:41 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH] xen/common: validate shared memory guest address
 overlap with guest RAM
Content-Language: en-GB
To: Joan Bae <joan.bae@boeing.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>
References: <59dcd094173791926fff212f3f2b86df50b0dc12.1776060772.git.joan.bae@boeing.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <59dcd094173791926fff212f3f2b86df50b0dc12.1776060772.git.joan.bae@boeing.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Joan,

Thank you for the patch.

On 14/04/2026 09:59, Joan Bae wrote:
> Currently, process_shm() does not check whether the guest physical
> address of a shared memory region overlaps with the domain's allocated RAM banks.
> Neither process_shm() nor p2m_set_entry() checks for existing
> mappings, so the RAM mapping is silently overwritten if a user
> specifies a guest physical address that falls within the guest RAM
> range. Since construct_domain() loads the kernel after process_shm(),
> the kernel can end up in shared memory pages. This can cause:
> - Another domain corrupting the kernel via shared memory write
> - Silent guest crash with no error message from Xen

This seems to be solving one specific issue (RAM clashing with shared 
memory) but I believe this could also happen with other kind of mappings 
because, as you said, p2m_set_entry() doesn't check any overlap.

So I would rather prefer if we solve the problem once and for all. This 
would mean modifying p2m_set_entry() (or one of its top caller). 
Although, we would need to be careful to not break memory hypercalls 
which may rely on overwriting existing mappings.

Cheers,

-- 
Julien Grall


