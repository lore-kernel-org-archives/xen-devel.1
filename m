Return-Path: <SRS0=QCGW=QC=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FEEEC433F5
	for <xen-devel@archiver.kernel.org>; Mon, 15 Nov 2021 13:59:02 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C01BB61A7D
	for <xen-devel@archiver.kernel.org>; Mon, 15 Nov 2021 13:59:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C01BB61A7D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.225923.390262 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mmcVX-0004ni-R5; Mon, 15 Nov 2021 13:58:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 225923.390262; Mon, 15 Nov 2021 13:58:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mmcVX-0004nb-O9; Mon, 15 Nov 2021 13:58:51 +0000
Received: by outflank-mailman (input) for mailman id 225923;
 Mon, 15 Nov 2021 13:58:50 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mmcVW-0004nH-Mx
 for xen-devel@lists.xenproject.org; Mon, 15 Nov 2021 13:58:50 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mmcVU-00014K-S4; Mon, 15 Nov 2021 13:58:48 +0000
Received: from [54.239.6.189] (helo=[192.168.10.237])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mmcVU-0003q2-Kt; Mon, 15 Nov 2021 13:58:48 +0000
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
	bh=5jqfuqFnrb6yksJvZDUB1kYLYdF3gqOd7ePf+phWYnw=; b=1+O0u+xEo+XKPy5kpXoI0BoqDl
	XD1de/p4gimcq2/w7Z2xrqP0V5jP6qBHMPHMhuEXKg2Bpw2x9StQ6pxJ/kZo4tdYcPOlv4lTis1ty
	Q3BGdGmW/DUtyREN+AycxaYT91mFjB3u9hJEgBghMnaX3KK3qaepwT/O8L2/Xc5Enoho=;
Message-ID: <7a8b5bd1-6b34-eb32-72e4-f55cee5905ed@xen.org>
Date: Mon, 15 Nov 2021 13:58:45 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.0
Subject: Re: [PATCH for-4.16 1/4] domctl: introduce a macro to set the grant
 table max version
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>,
 Christian Lindig <christian.lindig@citrix.com>, David Scott
 <dave@recoil.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Ian Jackson <iwj@xenproject.org>
References: <20211115121741.3719-1-roger.pau@citrix.com>
 <20211115121741.3719-2-roger.pau@citrix.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20211115121741.3719-2-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Roger,

On 15/11/2021 12:17, Roger Pau Monne wrote:
> Such macro just clamps the passed version to fit in the designated
> bits of the domctl field. The main purpose is to make it clearer in
> the code when max grant version is being set in the grant_opts field.
> 
> Existing users that where setting the version in the grant_opts field
> are switched to use the macro.
> 
> No functional change intended.
> 
> Requested-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

