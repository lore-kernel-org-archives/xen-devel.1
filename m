Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5738ECD98E4
	for <xen-devel@archiver.kernel.org>; Tue, 16 Jun 2026 20:08:56 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1339631.1600832 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZa5U-0008Fl-TS; Tue, 16 Jun 2026 20:08:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1339631.1600832; Tue, 16 Jun 2026 20:08:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZa5U-0008Fe-Qp; Tue, 16 Jun 2026 20:08:44 +0000
Received: by outflank-mailman (input) for mailman id 1339631;
 Tue, 16 Jun 2026 20:08:43 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1wZa5T-0008FY-3m
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2026 20:08:43 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1wZa5S-00CmqW-3B;
 Tue, 16 Jun 2026 20:08:42 +0000
Received: from [2a02:8012:3a1:0:adbb:f4c5:7acb:2fe1]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1wZa5S-00FiTY-0Q;
 Tue, 16 Jun 2026 20:08:42 +0000
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
	bh=/5DcLrw5CPiPKYC02EBhMGKYmAng3/TlgnzmnutznYI=; b=2XPKEdUF+TiBSEpJdvsYxjmShf
	aO59RRFa0ET05HaFZPzgiyMG7rpqq71qYgJA0gCvDZ2hGItJSOLQH0unDu0InSpYXDl7u4qYj0HOP
	EqX7PfPH5vct00K2ubyqGKQeRJNH94zfemtudaooSUKbyNi8qzsp3B+tunDIX1nrvHBo=;
Message-ID: <6e2d0f83-fcb2-41b4-b04f-99c2d3fefcae@xen.org>
Date: Tue, 16 Jun 2026 21:08:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/23] xen/arm: smmuv3: Add support for stage-1 and
 nested stage translation
Content-Language: en-GB
To: Milan Djokic <milan_djokic@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Rahul Singh <rahul.singh@arm.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1774305918.git.milan_djokic@epam.com>
 <cb8a2cb5df50128f4c49d34a7ab8faa4e73f83c6.1774305918.git.milan_djokic@epam.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <cb8a2cb5df50128f4c49d34a7ab8faa4e73f83c6.1774305918.git.milan_djokic@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Milan,

On 23/03/2026 22:51, Milan Djokic wrote:
> From: Rahul Singh <rahul.singh@arm.com>
> 
> Xen SMMUv3 driver only supports stage-2 translation. Add support for
> Stage-1 translation that is required to support nested stage
> translation.
> 
> In true nested mode, both s1_cfg and s2_cfg will coexist.
> Let's remove the union. When nested stage translation is setup, both
> s1_cfg and s2_cfg are valid.

I am not entirely sure where to comment. Looking at Linux [1], it seems 
some SMMU variant have errata for the nesting mode. Should we at least 
prevent nested on both variant for now?

Cheers,

[1] 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=0bfbfc526c70606bf0fad302e4821087cbecfaf4

-- 
Julien Grall


