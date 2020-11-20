Return-Path: <SRS0=Yd2Y=E2=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC037C5519F
	for <xen-devel@archiver.kernel.org>; Fri, 20 Nov 2020 15:16:04 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 557232222F
	for <xen-devel@archiver.kernel.org>; Fri, 20 Nov 2020 15:16:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="W3kDFSgw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 557232222F
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.32331.63373 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kg88d-0007bz-9H; Fri, 20 Nov 2020 15:15:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 32331.63373; Fri, 20 Nov 2020 15:15:51 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kg88d-0007bs-69; Fri, 20 Nov 2020 15:15:51 +0000
Received: by outflank-mailman (input) for mailman id 32331;
 Fri, 20 Nov 2020 15:15:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xyTX=E2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kg88c-0007bn-GC
 for xen-devel@lists.xenproject.org; Fri, 20 Nov 2020 15:15:50 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 37a59104-6263-4f0d-8205-db936b0564f0;
 Fri, 20 Nov 2020 15:15:49 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E04B7AA4F;
 Fri, 20 Nov 2020 15:15:48 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=xyTX=E2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kg88c-0007bn-GC
	for xen-devel@lists.xenproject.org; Fri, 20 Nov 2020 15:15:50 +0000
X-Inumbo-ID: 37a59104-6263-4f0d-8205-db936b0564f0
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 37a59104-6263-4f0d-8205-db936b0564f0;
	Fri, 20 Nov 2020 15:15:49 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1605885349; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AiHwbjLr5XvuI1n19K/8MnCFK+bMLxPzoLHD9sDQuWw=;
	b=W3kDFSgwxeK0VousTZKG40JMln/OPUZV5xjWiOG1vSl1NhA6US1Mn2XiHVvccvMyHzlOZC
	AgWWxEVRX8JOSz5DJsgSzutJf5CdvJ9VL5lbaECifE0OcLd3DaqbQ1cPiom5hkaXKYHonv
	x85kjffZyE7opFC/lVBNdQiAbx/9MwE=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id E04B7AA4F;
	Fri, 20 Nov 2020 15:15:48 +0000 (UTC)
Subject: Re: [PATCH v2 07/12] xen/include: import sizeof_field() macro from
 Linux stddef.h
To: Paul Durrant <paul@xen.org>
Cc: Paul Durrant <pdurrant@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20201120094900.1489-1-paul@xen.org>
 <20201120094900.1489-8-paul@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <8ea259ed-0ebb-f0fb-9be1-cd0271a25bd4@suse.com>
Date: Fri, 20 Nov 2020 16:15:49 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201120094900.1489-8-paul@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 20.11.2020 10:48, Paul Durrant wrote:
> From: Paul Durrant <pdurrant@amazon.com>
> 
> Co-locate it with the definition of offsetof() (since this is also in stddef.h
> in the Linux kernel source). This macro will be needed in a subsequent patch.
> 
> Signed-off-by: Paul Durrant <pdurrant@amazon.com>

Acked-by: Jan Beulich <jbeulich@suse.com>

You don't fancy replacing in the tree what is now effectively
open-coding this construct, I guess? I'll try to remember to
do so once this has gone in...

Jan

