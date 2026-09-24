Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94A58C9830D
	for <xen-devel@archiver.kernel.org>; Thu, 24 Sep 2026 02:30:25 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1431574.1653511 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9ZDd-0007od-W5; Thu, 24 Sep 2026 02:29:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1431574.1653511; Thu, 24 Sep 2026 02:29:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9ZDd-0007oV-T8; Thu, 24 Sep 2026 02:29:53 +0000
Received: by outflank-mailman (input) for mailman id 1431574;
 Thu, 24 Sep 2026 02:29:52 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <lin.liu01@citrix.com>) id 1x9ZDc-0007oM-Jb
 for xen-devel@lists.xenproject.org; Thu, 24 Sep 2026 02:29:52 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x9ZDb-009Qo5-6F
 for xen-devel@lists.xenproject.org; Thu, 24 Sep 2026 04:29:51 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <lin.liu01@citrix.com>)
 id 6ab48a78-e002-0a2a0a5209dd-0a2a4504c8ba-42
 for <xen-devel@lists.xenproject.org>; Thu, 24 Sep 2026 04:29:51 +0200
Received: from [160.101.131.8] (helo=na1pdmzitismtp01.tibco.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <lin.liu01@citrix.com>)
 id 6ab48b1e-b57f-0a2a45040019-a0658308987a-3
 for <xen-devel@lists.xenproject.org>; Thu, 24 Sep 2026 04:29:50 +0200
Received: from xenrt10716048 (unknown [10.113.40.46])
 by na1pdmzitismtp01.tibco.com (Postfix) with ESMTP id 596FD4644A00;
 Wed, 23 Sep 2026 22:27:46 -0400 (EDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; none
From: Lin Liu <lin.liu01@citrix.com>
To: ross.lagerwall@citrix.com
Cc: andrew.cooper3@citrix.com,
	jason.andryuk@amd.com,
	jbeulich@suse.com,
	lin.liu01@citrix.com,
	roger@xenproject.org,
	teddy.astie@vates.tech,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH] x86/nSVM: Save L2's CR4 on #VMEXIT, not Xen's
Date: Thu, 24 Sep 2026 02:29:48 +0000
Message-ID: <20260924022948.1399293-1-lin.liu01@citrix.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <38c41bfb-48c6-4408-8da1-2b7d730a6c9e@citrix.com>
References: <38c41bfb-48c6-4408-8da1-2b7d730a6c9e@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ebf023/1790216991-C0EDEB50-3D44657F/0/0
X-purgate-type: clean
X-purgate-size: 226

Yeah, I think this is a good idea.
I do think of other similar fields as well, but prefer the one-liner patch
so it can be merged easly.  I will follow up the proposal soon in new patches.
Thanks for the nice help.

Lin

