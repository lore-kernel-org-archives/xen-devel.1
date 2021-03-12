Return-Path: <SRS0=dPyG=IK=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97137C433E0
	for <xen-devel@archiver.kernel.org>; Fri, 12 Mar 2021 11:05:13 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5D22564FE0
	for <xen-devel@archiver.kernel.org>; Fri, 12 Mar 2021 11:05:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5D22564FE0
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.97011.184091 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKfbJ-0003v1-OZ; Fri, 12 Mar 2021 11:05:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 97011.184091; Fri, 12 Mar 2021 11:05:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKfbJ-0003uu-LM; Fri, 12 Mar 2021 11:05:01 +0000
Received: by outflank-mailman (input) for mailman id 97011;
 Fri, 12 Mar 2021 11:05:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=F/Rg=IK=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lKfbI-0003up-TO
 for xen-devel@lists.xenproject.org; Fri, 12 Mar 2021 11:05:00 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5175d7d0-84de-4ead-a8bb-57d6e9e0f2b4;
 Fri, 12 Mar 2021 11:05:00 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 649ABB02F;
 Fri, 12 Mar 2021 11:04:59 +0000 (UTC)
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
X-Inumbo-ID: 5175d7d0-84de-4ead-a8bb-57d6e9e0f2b4
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1615547099; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JKglwgQmrxKqE+Kz3RJoIaxWXHhvamIhs7u/l9kSWak=;
	b=u+Cy2RrTqc+a2Mhv6PAOK/xOIbFgRtcXAmIUUTXcdCzUVmQ4yE1HpeJy0t7WKWrOcH79cZ
	RBwd081coB4qd+y7Ds5Lif0j24vNpBF40STJyiNNKhphRmLhAva3Vnwqjt/H5gQK+omEKn
	z8RThY/sNFp6CWkmVTOKlW174Agq324=
Subject: Re: [PATCH][4.15] gnttab: work around "may be used uninitialized"
 warning
To: Ian Jackson <iwj@xenproject.org>
Cc: Julien Grall <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <a6b73c54-3010-6716-cac3-8f3b462a4dc7@suse.com>
 <ec2b85b6-072d-481d-3b02-c8dedf043dac@xen.org>
 <6bd14438-7dec-2176-eab5-5898f190c4d8@suse.com>
 <e45ef012-22c6-b480-d987-dd951ae36948@xen.org>
 <24651.15544.142804.468744@mariner.uk.xensource.com>
 <7185c052-3e66-6202-f820-76568b2b1228@suse.com>
 <24651.17027.10811.145589@mariner.uk.xensource.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <07d34ad4-65b6-31f5-b4ae-ee4ed18e8baa@suse.com>
Date: Fri, 12 Mar 2021 12:05:00 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <24651.17027.10811.145589@mariner.uk.xensource.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 12.03.2021 11:29, Ian Jackson wrote:
> I am sympathetic to Julien's desire to try to limit the set of
> supported compilers.

Yes, and I agree we're long overdue with raising the baseline. It's
just that it's not straightforward to establish a good new one.

Jan

