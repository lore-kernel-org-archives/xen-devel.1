Return-Path: <SRS0=5oJc=HV=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8D52C433E0
	for <xen-devel@archiver.kernel.org>; Fri, 19 Feb 2021 16:54:43 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4B10864E57
	for <xen-devel@archiver.kernel.org>; Fri, 19 Feb 2021 16:54:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4B10864E57
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.86995.163831 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lD92z-00047E-MR; Fri, 19 Feb 2021 16:54:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 86995.163831; Fri, 19 Feb 2021 16:54:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lD92z-000477-JS; Fri, 19 Feb 2021 16:54:29 +0000
Received: by outflank-mailman (input) for mailman id 86995;
 Fri, 19 Feb 2021 16:54:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TOKe=HV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lD92y-000472-Dc
 for xen-devel@lists.xenproject.org; Fri, 19 Feb 2021 16:54:28 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 94e6f463-90e6-4d11-a102-23012299aaf7;
 Fri, 19 Feb 2021 16:54:27 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id EAF9FAF30;
 Fri, 19 Feb 2021 16:54:26 +0000 (UTC)
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
X-Inumbo-ID: 94e6f463-90e6-4d11-a102-23012299aaf7
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1613753667; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HkcX+wckKjMLRGbBnQDECS84T554CBI5qL1tK459O6Y=;
	b=nyXX6VtymjZ1+J2uhgChDK0Q3qSsY5sRZMZum2dy9wShYMTUKvF4vMHfvCe+gHqpcXBBbf
	rCxqIvKahevkHi6zRG22WwEUAWc3COJT2jpUNeFfhWl6kzqS3QuOBDNChKcLuWEaSn/hZS
	m9TBmLnukOrCbmRzphCkK/8pCCKaajU=
Subject: Re: [ANNOUNCE] Xen 4.15 - hard codefreeze today
To: Ian Jackson <iwj@xenproject.org>
Cc: xen-devel@lists.xenproject.org, community.manager@xenproject.org,
 committers@xenproject.org
References: <24612.676.586372.372903@mariner.uk.xensource.com>
 <24623.60318.719046.601197@mariner.uk.xensource.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <4f04b710-bc3e-1b0d-f13c-becebc2b017f@suse.com>
Date: Fri, 19 Feb 2021 17:54:27 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <24623.60318.719046.601197@mariner.uk.xensource.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 19.02.2021 17:47, Ian Jackson wrote:
> J. x86/time: calibration rendezvous adjustments
> 
> Information from
>   Jan Beulich <jbeulich@suse.com>
> 
> Not entirely a regression.  But 3 out of the 4 patches have reviews
> and R-A and should be going in shortly.
> 
> Patch 4/ is RFC and it's not clear to e whether it's targeted at 4.15.

No, that's an intended optimization which can wait. I'm still
trying to determine a way how I could demonstrate it actually
makes a difference.

Jan

