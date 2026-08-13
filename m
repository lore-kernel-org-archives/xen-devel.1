Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A433C5CFDB
	for <xen-devel@archiver.kernel.org>; Thu, 13 Aug 2026 10:44:04 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1389757.1630389 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wuSuV-0007NG-1O; Thu, 13 Aug 2026 10:43:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1389757.1630389; Thu, 13 Aug 2026 10:43:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wuSuU-0007N9-UB; Thu, 13 Aug 2026 10:43:42 +0000
Received: by outflank-mailman (input) for mailman id 1389757;
 Thu, 13 Aug 2026 10:43:41 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <james@dingwall.me.uk>) id 1wuSuT-0007N3-8c
 for xen-devel@lists.xenproject.org; Thu, 13 Aug 2026 10:43:41 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wuSuS-000b5G-IJ
 for xen-devel@lists.xenproject.org; Thu, 13 Aug 2026 12:43:40 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <james@dingwall.me.uk>)
 id 6a7d9fc7-bab6-0a2a0a5309dd-0a2a4502a6c4-48
 for <xen-devel@lists.xenproject.org>; Thu, 13 Aug 2026 12:43:40 +0200
Received: from [212.23.1.21] (helo=smarthost01b.ixn.mail.zen.net.uk)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <james@dingwall.me.uk>)
 id 6a7d9fdc-6ca4-0a2a45020019-d4170115bb06-3
 for <xen-devel@lists.xenproject.org>; Thu, 13 Aug 2026 12:43:40 +0200
Received: from [217.155.64.189] (helo=mail0.xen.dingwall.me.uk)
 by smarthost01b.ixn.mail.zen.net.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.97)
 (envelope-from <james@dingwall.me.uk>) id 1wuSuR-00000000pRW-38cJ;
 Thu, 13 Aug 2026 10:43:39 +0000
Received: from localhost (localhost [IPv6:::1])
 by mail0.xen.dingwall.me.uk (Postfix) with ESMTP id 4BE83F0908C;
 Thu, 13 Aug 2026 11:43:39 +0100 (BST)
Received: from mail0.xen.dingwall.me.uk ([IPv6:::1])
 by localhost (mail0.xen.dingwall.me.uk [IPv6:::1]) (amavis, port 10024)
 with ESMTP id cyE5uZ0aws-j; Thu, 13 Aug 2026 11:43:39 +0100 (BST)
Received: from ghoul.dingwall.me.uk (ghoul.dingwall.me.uk
 [IPv6:2a02:8010:698e:302::c0a8:1c8])
 by dingwall.me.uk (Postfix) with ESMTP id 1739CF09089;
 Thu, 13 Aug 2026 11:43:39 +0100 (BST)
Received: by ghoul.dingwall.me.uk (Postfix, from userid 1000)
 id EEB477F6; Thu, 13 Aug 2026 11:43:38 +0100 (BST)
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
From: James Dingwall <james@dingwall.me.uk>
To: xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH] libxl: use libxl__qemu_qmp_path() instead of open coding
Date: Thu, 13 Aug 2026 11:41:08 +0100
Message-ID: <20260813104325.489224-1-james@dingwall.me.uk>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Originating-smarthost01b-IP: [217.155.64.189]
Feedback-ID: 217.155.64.189
X-purgate-ID: tlsNG-720697/1786617820-F04A62AC-AD4D8D80/0/0
X-purgate-type: clean
X-purgate-size: 273

Hi,

I was tracing a problem with the qmp socket and found two open coded
definitions of the path when a helper function is available via
libxl_internal.h which is already included.  The 'const' was needed to
build with the Ubuntu 26.04 tool chain.

Thanks,
James

