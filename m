Return-Path: <SRS0=UfNL=D5=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AEC2C388F7
	for <xen-devel@archiver.kernel.org>; Thu, 22 Oct 2020 09:49:39 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 25D1F2245F
	for <xen-devel@archiver.kernel.org>; Thu, 22 Oct 2020 09:49:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="UMv6UT0a"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 25D1F2245F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.10306.27369 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVXDc-0004UR-T6; Thu, 22 Oct 2020 09:49:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 10306.27369; Thu, 22 Oct 2020 09:49:12 +0000
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
	id 1kVXDc-0004UK-QA; Thu, 22 Oct 2020 09:49:12 +0000
Received: by outflank-mailman (input) for mailman id 10306;
 Thu, 22 Oct 2020 09:49:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dfvK=D5=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kVXDb-0004UF-T9
 for xen-devel@lists.xenproject.org; Thu, 22 Oct 2020 09:49:11 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8fd17f21-220d-4572-8d11-e6f15370c0c5;
 Thu, 22 Oct 2020 09:49:11 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 4A394AD87;
 Thu, 22 Oct 2020 09:49:10 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=dfvK=D5=suse.com=jgross@srs-us1.protection.inumbo.net>)
	id 1kVXDb-0004UF-T9
	for xen-devel@lists.xenproject.org; Thu, 22 Oct 2020 09:49:11 +0000
X-Inumbo-ID: 8fd17f21-220d-4572-8d11-e6f15370c0c5
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 8fd17f21-220d-4572-8d11-e6f15370c0c5;
	Thu, 22 Oct 2020 09:49:11 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1603360150;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=h/u/r/R71NxCYcOyxSXeNfPtXwCtEz7D63O5chrEOVo=;
	b=UMv6UT0andZFdqJzA9T57KO5xZgBpaxBp0MwYbcL2oqPEIKF4LBgN2CJGiUBElIEmMfytC
	PIHXqXVWKV6fLLkXApYo0DHCHCb6ywsYd7UdSv0INLKi5dxaNWaF9pvD8e5FIpQL5rADuu
	jw/AAb47AszHf01DLw5KDCaXH39KMdA=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 4A394AD87;
	Thu, 22 Oct 2020 09:49:10 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org,
	x86@kernel.org,
	linux-doc@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH v2 0/5] xen: event handling cleanup
Date: Thu, 22 Oct 2020 11:49:02 +0200
Message-Id: <20201022094907.28560-1-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Do some cleanups in Xen event handling code.

Changes in V2:
- addressed comments

Juergen Gross (5):
  xen: remove no longer used functions
  xen/events: make struct irq_info private to events_base.c
  xen/events: only register debug interrupt for 2-level events
  xen/events: unmask a fifo event channel only if it was masked
  Documentation: add xen.fifo_events kernel parameter description

 .../admin-guide/kernel-parameters.txt         |  7 ++
 arch/x86/xen/smp.c                            | 19 ++--
 arch/x86/xen/xen-ops.h                        |  2 +
 drivers/xen/events/events_2l.c                |  7 +-
 drivers/xen/events/events_base.c              | 94 +++++++++++++------
 drivers/xen/events/events_fifo.c              |  9 +-
 drivers/xen/events/events_internal.h          | 70 ++------------
 include/xen/events.h                          |  8 --
 8 files changed, 102 insertions(+), 114 deletions(-)

-- 
2.26.2


