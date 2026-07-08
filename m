Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7DFFC43458
	for <xen-devel@archiver.kernel.org>; Wed,  8 Jul 2026 14:07:45 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1357078.1611579 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whSw0-0007lA-H0; Wed, 08 Jul 2026 14:07:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1357078.1611579; Wed, 08 Jul 2026 14:07:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whSw0-0007l3-EE; Wed, 08 Jul 2026 14:07:32 +0000
Received: by outflank-mailman (input) for mailman id 1357078;
 Wed, 08 Jul 2026 14:07:31 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1whSvz-0007kx-1Y
 for xen-devel@lists.xenproject.org; Wed, 08 Jul 2026 14:07:31 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1whSvy-00Dbs6-1a;
 Wed, 08 Jul 2026 14:07:30 +0000
Received: from [2a02:8012:3a1:0:8c05:5c60:25dd:367e]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1whSvx-005EPb-2s;
 Wed, 08 Jul 2026 14:07:30 +0000
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
	bh=rIajY9mjw1217N7ZCuPIB3B+DsndKOj4VOhpBBS6xOQ=; b=vWj0dRy5GHxnxUE8c+TLgD/nx2
	7K1NihX49tlO3+Ia/m6dysYLSY1kCkrQ+1/0eG9WeZ/m2qkaeu25uCufKHXtbD2iCYr9YsLUk1d7T
	x/i+Zg0DH63I5jL1wZDrQa04u4GD78RBt6PViJcS34zhIqXiP5LxnXHzK/E72Y6n2d3Q=;
Message-ID: <175a17d2-64b3-4a68-bfc2-ee36c665d3c1@xen.org>
Date: Wed, 8 Jul 2026 15:07:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm/vgic-v3: Fix data abort in get_vcpu_from_rdist()
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Michal Orzel <michal.orzel@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <20260708121753.1428271-1-andrew.cooper3@citrix.com>
Content-Language: en-GB
From: Julien Grall <julien@xen.org>
In-Reply-To: <20260708121753.1428271-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Andrew,

On 08/07/2026 13:17, Andrew Cooper wrote:
> Just because vcpu_id is within d->max_vcpus doesn't mean d->vcpu[vcpu_id] is
> non-NULL.  Use the proper accessor to look up a vcpu object.
> 
> Reported-by: Michal Orzel <michal.orzel@amd.com>
> Fixes: acf65e5a25a7 ("xen/arm: vgic-v3: Emulate correctly the re-distributor")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Julien Grall <julien@xen.org>

Cheers,

-- 
Julien Grall


