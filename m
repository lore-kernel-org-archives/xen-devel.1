Return-Path: <SRS0=hRpO=EZ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CF79C2D0E4
	for <xen-devel@archiver.kernel.org>; Thu, 19 Nov 2020 08:55:27 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7D6BA24655
	for <xen-devel@archiver.kernel.org>; Thu, 19 Nov 2020 08:55:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="bqcJkwNt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7D6BA24655
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.30467.60481 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kffiY-0006N1-LI; Thu, 19 Nov 2020 08:55:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 30467.60481; Thu, 19 Nov 2020 08:55:02 +0000
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
	id 1kffiY-0006Mu-Hq; Thu, 19 Nov 2020 08:55:02 +0000
Received: by outflank-mailman (input) for mailman id 30467;
 Thu, 19 Nov 2020 08:55:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PWQs=EZ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kffiX-0006Mp-6B
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2020 08:55:01 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 36683ab6-c5d4-44db-af1c-a241ac70e219;
 Thu, 19 Nov 2020 08:55:00 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 338FDAA4F;
 Thu, 19 Nov 2020 08:54:59 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=PWQs=EZ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kffiX-0006Mp-6B
	for xen-devel@lists.xenproject.org; Thu, 19 Nov 2020 08:55:01 +0000
X-Inumbo-ID: 36683ab6-c5d4-44db-af1c-a241ac70e219
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 36683ab6-c5d4-44db-af1c-a241ac70e219;
	Thu, 19 Nov 2020 08:55:00 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1605776099; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ZCsZVMJKA3QWFiBtUMP/V6L6DiwzwyFl2FBdn72rle0=;
	b=bqcJkwNtFF7enc2Gz/9e13bixw229sHlYveJt+iZpqyG0SpJ3jHTOKYC3Q8wJCHJSlQ1pB
	O4kCcYlf2axk1w2ldYStK7nMt6RT8w/hw6CWpFsmHcBXkPqGuuCoRuCc8WPHn84zsRlRXz
	T4Rgbt8LvS/p2FFBGvs+edZ1QRFLyik=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 338FDAA4F;
	Thu, 19 Nov 2020 08:54:59 +0000 (UTC)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 0/2] ns16550: #ifdef-ary
Message-ID: <b74ba81a-da34-1e9a-9a15-f9dbb6005de8@suse.com>
Date: Thu, 19 Nov 2020 09:54:58 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.3
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

1: "com<N>=" command line options are x86-specific
2: drop stray "#ifdef CONFIG_HAS_PCI"

Jan

