Return-Path: <SRS0=eaQF=F2=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3529DC433DB
	for <xen-devel@archiver.kernel.org>; Tue, 22 Dec 2020 08:14:13 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E2CE523124
	for <xen-devel@archiver.kernel.org>; Tue, 22 Dec 2020 08:14:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E2CE523124
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.57675.100993 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1krcni-000694-F5; Tue, 22 Dec 2020 08:13:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 57675.100993; Tue, 22 Dec 2020 08:13:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1krcni-00068x-Bw; Tue, 22 Dec 2020 08:13:46 +0000
Received: by outflank-mailman (input) for mailman id 57675;
 Tue, 22 Dec 2020 08:13:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9/vU=F2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1krcnh-00068s-7v
 for xen-devel@lists.xenproject.org; Tue, 22 Dec 2020 08:13:45 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4dd99585-8d75-4191-9b08-ac32f98505b3;
 Tue, 22 Dec 2020 08:13:44 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 2A8F7ABA1;
 Tue, 22 Dec 2020 08:13:43 +0000 (UTC)
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
X-Inumbo-ID: 4dd99585-8d75-4191-9b08-ac32f98505b3
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1608624823; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=x6z1IFuX4L22qrzsCB5/FNdV5KaYk6ubpLlPAwLHpfg=;
	b=OfnRaJGzL3qX6ClB2nS+VTPHPXzbkAggjelrFNH4z85FMW2ST5Jn/UqDOLTnTeD6KIJbI+
	kHnV/kKe87lWFsVUBfdRoMbKfqi4sBHerbleM9B/Lkn8qRsO8Wi668UmhTs+fq3pcsY5gI
	qawRH0XgbbPfO2ZwfCaoQrQ1m9UuKh4=
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2 0/2] common: XSA-327 follow-up
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Message-ID: <2a08aa31-fdbf-89ee-cd49-813f818b709a@suse.com>
Date: Tue, 22 Dec 2020 09:13:42 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

There are a few largely cosmetic things that were discussed in the
context of the XSA, but which weren't really XSA material.

1: common: map_vcpu_info() cosmetics
2: evtchn/fifo: don't enforce higher than necessary alignment

I realize both changes are controversial. For the first one
discussion was about the choice of error code. Neither EINVAL nor
EFAULT represent the fact that it is a choice of implementation
to not support mis-aligned structures. If ENXIO isn't liked, the
best I can suggest are EOPNOTSUPP or (as previously suggested)
EPERM. I think it ought to be possible to settle on an error
code everyone can live with.

For the second one the question was whether the relaxation is
useful to do. The original reason for wanting to make the change
remains: The original code here should not be used as an excuse
to introduce similar over-alignment requirements elsewhere. I
can live with the change getting rejected, but if so I'd like to
request that some alternative be submitted to ensure that the
immediate goal can still be reached.

Jan

