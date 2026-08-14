Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93C98C5CFC1
	for <xen-devel@archiver.kernel.org>; Fri, 14 Aug 2026 06:05:25 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1390742.1630906 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wul2E-0006l9-6T; Fri, 14 Aug 2026 06:04:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1390742.1630906; Fri, 14 Aug 2026 06:04:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wul2E-0006kw-1p; Fri, 14 Aug 2026 06:04:54 +0000
Received: by outflank-mailman (input) for mailman id 1390742;
 Fri, 14 Aug 2026 06:04:52 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <james@dingwall.me.uk>) id 1wul2C-0006kq-UR
 for xen-devel@lists.xenproject.org; Fri, 14 Aug 2026 06:04:52 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wul2C-002uN7-BM
 for xen-devel@lists.xenproject.org; Fri, 14 Aug 2026 08:04:52 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <james@dingwall.me.uk>)
 id 6a7eafeb-8faa-0a2a0a5109dd-0a2a450a9076-36
 for <xen-devel@lists.xenproject.org>; Fri, 14 Aug 2026 08:04:52 +0200
Received: from [212.23.1.22] (helo=smarthost01c.ixn.mail.zen.net.uk)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <james@dingwall.me.uk>)
 id 6a7eb003-f2d2-0a2a450a0019-d41701169d92-3
 for <xen-devel@lists.xenproject.org>; Fri, 14 Aug 2026 08:04:52 +0200
Received: from [217.155.64.189] (helo=mail0.xen.dingwall.me.uk)
 by smarthost01c.ixn.mail.zen.net.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.97)
 (envelope-from <james@dingwall.me.uk>) id 1wul2B-00000000B81-20DT;
 Fri, 14 Aug 2026 06:04:51 +0000
Received: from localhost (localhost [IPv6:::1])
 by mail0.xen.dingwall.me.uk (Postfix) with ESMTP id 45B32F0985C;
 Fri, 14 Aug 2026 07:04:51 +0100 (BST)
Received: from mail0.xen.dingwall.me.uk ([IPv6:::1])
 by localhost (mail0.xen.dingwall.me.uk [IPv6:::1]) (amavis, port 10024)
 with ESMTP id Ie_Y05KXr7I6; Fri, 14 Aug 2026 07:04:51 +0100 (BST)
Received: from ghoul.dingwall.me.uk (ghoul.dingwall.me.uk [192.168.1.200])
 by dingwall.me.uk (Postfix) with ESMTP id 01FF3F09859;
 Fri, 14 Aug 2026 07:04:50 +0100 (BST)
Received: by ghoul.dingwall.me.uk (Postfix, from userid 1000)
 id D8FAA8F2; Fri, 14 Aug 2026 07:04:50 +0100 (BST)
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
X-Virus-Scanned: Debian amavis at dingwall.me.uk
From: James Dingwall <james-xen@dingwall.me.uk>
To: xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>
Subject: tools/hotplug: fix invalid frontend path for set_mtu
Date: Fri, 14 Aug 2026 07:03:49 +0100
Message-ID: <20260814060441.923061-1-james-xen@dingwall.me.uk>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Originating-smarthost01c-IP: [217.155.64.189]
Feedback-ID: 217.155.64.189
X-purgate-ID: tlsNG-4011c0/1786687492-5A9D9CFC-66E29EDF/0/0
X-purgate-type: clean
X-purgate-size: 426


Hi,

This is a resubmission of patches previously discussed in this thread:

https://lists.xen.org/archives/html/xen-devel/2022-04/msg02209.html

It appears they fell down a crack after review and never made it to git.
This is a fix for reading a custom interface mtu from xenstore when the
interface is given a non-default name along with an adjustment to the
check that the value read is >=68.

Thanks,
James

