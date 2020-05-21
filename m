Return-Path: <SRS0=0mHu=7D=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41CFBC433DF
	for <xen-devel@archiver.kernel.org>; Thu, 21 May 2020 20:14:35 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1534B207D3
	for <xen-devel@archiver.kernel.org>; Thu, 21 May 2020 20:14:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="WlZTEqic"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1534B207D3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jbra9-0006NN-1N; Thu, 21 May 2020 20:14:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RqGm=7D=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1jbra7-0006NI-UK
 for xen-devel@lists.xenproject.org; Thu, 21 May 2020 20:14:19 +0000
X-Inumbo-ID: a703ad76-9b9f-11ea-9887-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a703ad76-9b9f-11ea-9887-bc764e2007e4;
 Thu, 21 May 2020 20:14:19 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9DF29207D3;
 Thu, 21 May 2020 20:14:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1590092058;
 bh=suEz0MB32IOGGNvUKp3xFnbJ4st9KmSvw9lfG5y2jOo=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=WlZTEqico2+j5W2o2v1gAmMgQWuOHXzbhkBt9WlqipMd8XnTSJOpUwAfQDMAkhnYs
 BeZhoWcOssLSSCVcIbnvr5xtnEY3JG4I9ynz7NmIQe5cx2t0tCQgox7+ient/cKZKo
 4ux4u+UDXvWH828O3t8s4bL2+8dSDoAtBUKZErgI=
Date: Thu, 21 May 2020 13:14:18 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
Subject: Re: [PATCH v2 for-4.14 0/3] Remove the 1GB limitation on Rasberry Pi 4
In-Reply-To: <20200519172028.31169-1-julien@xen.org>
Message-ID: <alpine.DEB.2.21.2005211312340.27502@sstabellini-ThinkPad-T480s>
References: <20200519172028.31169-1-julien@xen.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: minyard@acm.org, paul@xen.org, Julien Grall <jgrall@amazon.com>,
 roman@zededa.com, jeff.kubascik@dornerworks.com,
 xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tue, 19 May 2020, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> Hi all,
> 
> At the moment, a user who wants to boot Xen on the Raspberry Pi 4 can
> only use the first GB of memory.
> 
> This is because several devices cannot DMA above 1GB but Xen doesn't
> necessarily allocate memory for Dom0 below 1GB.
> 
> This small series is trying to address the problem by allowing a
> platform to restrict where Dom0 banks are allocated.
> 
> This is also a candidate for Xen 4.14. Without it, a user will not be
> able to use all the RAM on the Raspberry Pi 4.
> 
> This series has only be slighlty tested. I would appreciate more test on
> the Rasbperry Pi 4 to confirm this removing the restriction.

You can add my reviewed-by to all patches in the series.


