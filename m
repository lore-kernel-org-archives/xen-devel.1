Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80B39EB48F2
	for <xen-devel@archiver.kernel.org>; Thu, 12 Feb 2026 10:00:56 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1228608.1534745 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqTV2-0001o2-E3; Thu, 12 Feb 2026 10:00:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1228608.1534745; Thu, 12 Feb 2026 10:00:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqTV2-0001nv-BF; Thu, 12 Feb 2026 10:00:40 +0000
Received: by outflank-mailman (input) for mailman id 1228608;
 Thu, 12 Feb 2026 10:00:39 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1vqTV1-0001np-Gj
 for xen-devel@lists.xenproject.org; Thu, 12 Feb 2026 10:00:39 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1vqTV0-00582X-0d;
 Thu, 12 Feb 2026 10:00:38 +0000
Received: from [2a02:8012:3a1:0:d806:4714:c0a1:503]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1vqTUz-004Zzw-1p;
 Thu, 12 Feb 2026 10:00:38 +0000
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
	bh=LAraM9FbaqgpzVLu/F2xQuDHOm+Kipv9M4WRzVzuWL0=; b=jUVqgnCDl06dM6joor4HOpFwQ0
	25guDIgnWY40UUtuiFMBIaUXfQvPkMSu7vyV+1VR2Ha1N/kTgpGNaSVWEM65jHCyoO5s3Yskmec/N
	I9KHfjkp+txJk7tZf2HpHtS9OJuds5ITbHJ218reJHTghUf49z0UA/eaFw2Uwn/bYEsM=;
Message-ID: <eacaca01-e43c-4ee0-8c7c-8225ff98f59a@xen.org>
Date: Thu, 12 Feb 2026 10:00:34 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] sched: move vCPU exec state barriers
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>, Juergen Gross <jgross@suse.com>,
 Dario Faggioli <dfaggioli@suse.com>, George Dunlap <gwd@xenproject.org>
References: <1e2df446-b116-4861-a396-b87895a96c67@suse.com>
Content-Language: en-US
From: Julien Grall <julien@xen.org>
In-Reply-To: <1e2df446-b116-4861-a396-b87895a96c67@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 05/02/2026 11:33, Jan Beulich wrote:
> The barrier in vcpu_context_saved() is specifically about the clearing of
> ->is_running. It isn't needed when we don't clear the flag.
> 
> Furthermore, one side of the barrier being in common code, the other would
> better be, too. This way, all architectures are covered (beyond any
> specific needs they may have).
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Julien Grall <julien@xen.org>

Cheers,

-- 
Julien Grall


