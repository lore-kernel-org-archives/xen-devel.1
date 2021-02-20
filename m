Return-Path: <SRS0=IDzz=HW=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCB70C433E6
	for <xen-devel@archiver.kernel.org>; Sat, 20 Feb 2021 12:12:28 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 744AD64ED7
	for <xen-devel@archiver.kernel.org>; Sat, 20 Feb 2021 12:12:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 744AD64ED7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.87203.164339 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lDR7T-0007la-6H; Sat, 20 Feb 2021 12:12:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 87203.164339; Sat, 20 Feb 2021 12:12:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lDR7T-0007lT-2Z; Sat, 20 Feb 2021 12:12:19 +0000
Received: by outflank-mailman (input) for mailman id 87203;
 Sat, 20 Feb 2021 12:12:18 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lDR7S-0007lO-F4
 for xen-devel@lists.xenproject.org; Sat, 20 Feb 2021 12:12:18 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lDR7Q-0002Ad-Ue; Sat, 20 Feb 2021 12:12:16 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lDR7Q-0008An-I2; Sat, 20 Feb 2021 12:12:16 +0000
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
	bh=bQI3Ccup6yTIKmHa56nvcajDRXzkAB6HThNzesI2iXU=; b=lB2ygTAnJokH5Xh2dCOi/z2iZo
	gJEn36BjiNPpV/WPhRsJ1hbLzvpOxpIgdFONvx94OiQG5YIh8DqilRSb/6q3f2OzzHcyOycYs8AXm
	W6OQIhbdXauznCSyDbuErPjDa6qK7iSxYdS3yTFhyu9OSKi3zQFE85Qc9FEG5lvUmFWw=;
Subject: Re: [PATCH v3 3/8] xen/events: avoid handling the same event on two
 cpus at the same time
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>, stable@vger.kernel.org
References: <20210219154030.10892-1-jgross@suse.com>
 <20210219154030.10892-4-jgross@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <495a12e4-d54b-0841-07b2-5b0a0cea5d10@xen.org>
Date: Sat, 20 Feb 2021 12:12:14 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210219154030.10892-4-jgross@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 19/02/2021 15:40, Juergen Gross wrote:
> When changing the cpu affinity of an event it can happen today that
> (with some unlucky timing) the same event will be handled on the old
> and the new cpu at the same time.
> 
> Avoid that by adding an "event active" flag to the per-event data and
> call the handler only if this flag isn't set.
> 
> Cc: stable@vger.kernel.org
> Reported-by: Julien Grall <julien@xen.org>
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

