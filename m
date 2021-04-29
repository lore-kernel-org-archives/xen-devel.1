Return-Path: <SRS0=6BBm=J2=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39B38C433B4
	for <xen-devel@archiver.kernel.org>; Thu, 29 Apr 2021 19:12:10 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C21746143E
	for <xen-devel@archiver.kernel.org>; Thu, 29 Apr 2021 19:12:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C21746143E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=thesusis.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.120181.227278 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lcC4Y-0001HY-K1; Thu, 29 Apr 2021 19:11:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 120181.227278; Thu, 29 Apr 2021 19:11:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lcC4Y-0001HR-Gr; Thu, 29 Apr 2021 19:11:38 +0000
Received: by outflank-mailman (input) for mailman id 120181;
 Thu, 29 Apr 2021 19:11:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yMpM=J2=vps.thesusis.net=psusi@srs-us1.protection.inumbo.net>)
 id 1lcC4W-0001HM-SA
 for xen-devel@lists.xenproject.org; Thu, 29 Apr 2021 19:11:36 +0000
Received: from vps.thesusis.net (unknown [34.202.238.73])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0e5ded02-895d-494b-9fb0-a88929ff5ed2;
 Thu, 29 Apr 2021 19:11:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by vps.thesusis.net (Postfix) with ESMTP id AB69F2ECA5
 for <xen-devel@lists.xenproject.org>; Thu, 29 Apr 2021 15:11:35 -0400 (EDT)
Received: from vps.thesusis.net ([IPv6:::1])
 by localhost (vps.thesusis.net [IPv6:::1]) (amavisd-new, port 10024)
 with ESMTP id zsHz4GR4vlWB for <xen-devel@lists.xenproject.org>;
 Thu, 29 Apr 2021 15:11:35 -0400 (EDT)
Received: by vps.thesusis.net (Postfix, from userid 1000)
 id 7BC0D2ECA3; Thu, 29 Apr 2021 15:11:35 -0400 (EDT)
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
X-Inumbo-ID: 0e5ded02-895d-494b-9fb0-a88929ff5ed2
User-agent: mu4e 1.5.7; emacs 26.3
From: Phillip Susi <phill@thesusis.net>
To: xen-devel@lists.xenproject.org
Subject: Xen Virtual Keyboard modalias breaking uevents
Date: Thu, 29 Apr 2021 15:08:21 -0400
Message-ID: <87o8dw52jc.fsf@vps.thesusis.net>
MIME-Version: 1.0
Content-Type: text/plain

So I have finally drilled down to the modalias for the Xen Virtual
Keyboard driver being so long ( over 2KB ) that it causes an -ENOMEM
when trying to add it to the environment for uevents.  This causes
coldplug to fail, which causes the script doing coldplug as part of the
debian-installer init to fail, which causes a kernel panic when init
exits, which then for reasons I have yet to understand, causes the Xen
domU to reboot.

Why is this modalias so huge?  Can we pare it down, or or is there
another solution to get uevents working on this device again?  Maybe the
environment block size needs to be increased?  I don't know.


