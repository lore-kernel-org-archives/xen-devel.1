Return-Path: <SRS0=2EqH=MG=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 379C8C07E95
	for <xen-devel@archiver.kernel.org>; Wed, 14 Jul 2021 00:39:34 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EF96C608FE
	for <xen-devel@archiver.kernel.org>; Wed, 14 Jul 2021 00:39:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EF96C608FE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.155834.287605 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3Svo-0000RA-02; Wed, 14 Jul 2021 00:39:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 155834.287605; Wed, 14 Jul 2021 00:39:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3Svn-0000R3-SY; Wed, 14 Jul 2021 00:39:19 +0000
Received: by outflank-mailman (input) for mailman id 155834;
 Wed, 14 Jul 2021 00:39:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tvfX=MG=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1m3Svm-0000Qx-Is
 for xen-devel@lists.xenproject.org; Wed, 14 Jul 2021 00:39:18 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8a25ec2e-72d9-4b60-9db8-0f3b00d855a8;
 Wed, 14 Jul 2021 00:39:18 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 277F660FED;
 Wed, 14 Jul 2021 00:39:17 +0000 (UTC)
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
X-Inumbo-ID: 8a25ec2e-72d9-4b60-9db8-0f3b00d855a8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1626223157;
	bh=t+dzwqWf5U8EV5UtznliY3kiBjWeOoCHJK1U7NAT7D0=;
	h=Date:From:To:cc:Subject:From;
	b=R5EbyUy1SpZJG7myX+6oZB07QcPQBPhw4xUJlyjyzmi6MBACylqGcEfgqfjaTwPAs
	 LUQJz9ILdxjz6kTLYrP2hzGoqMstYPxHO7gWVwNa/6CUuSiqD+O93ZPrdJ57XXOhy3
	 hqJkSafTduywXgsrNRS5FtDwlWKajLa/O1B4wzjVpMmFOi7dokbLhbYKqVL5d/T/IM
	 4NOCEulALnod13aqobZzuNOamfkn/+htmO+iaRthDwV8IqZmhvMQqnOUNhRHdE+t6p
	 NwQN0QLJBWGhktpwJ2lGxo/hKIaP3hEG/D2YyfwnrsbOuViT7v6f4AecMYBkbCTWlq
	 8W2w6wQ/aTC1A==
Date: Tue, 13 Jul 2021 17:39:16 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: xen-devel@lists.xenproject.org
cc: sstabellini@kernel.org, julien@xen.org, andrew.cooper3@citrix.com, 
    george.dunlap@citrix.com, jbeulich@suse.com, iwj@xenproject.org, 
    wl@xen.org
Subject: [PATCH] SUPPORT.md: add Dom0less as Supported
Message-ID: <alpine.DEB.2.21.2107131734170.23286@sstabellini-ThinkPad-T480s>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Add Dom0less to SUPPORT.md to clarify its support status. The feature is
mature enough and small enough to make it security supported.

Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>

diff --git a/SUPPORT.md b/SUPPORT.md
index 317392d8f3..c777f3da72 100644
--- a/SUPPORT.md
+++ b/SUPPORT.md
@@ -832,6 +832,12 @@ OVMF firmware implements the UEFI boot protocol.
 
     Status, qemu-xen: Supported
 
+## Dom0less
+
+Guest creation from the hypervisor at boot without Dom0 intervention.
+
+    Status, ARM: Supported
+
 # Format and definitions
 
 This file contains prose, and machine-readable fragments.

