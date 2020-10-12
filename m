Return-Path: <SRS0=s5AT=DT=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0120CC433E7
	for <xen-devel@archiver.kernel.org>; Mon, 12 Oct 2020 09:28:04 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7983B2080D
	for <xen-devel@archiver.kernel.org>; Mon, 12 Oct 2020 09:28:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="ifIHI4wl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7983B2080D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.5835.15179 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kRu7N-0006vJ-Cf; Mon, 12 Oct 2020 09:27:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 5835.15179; Mon, 12 Oct 2020 09:27:45 +0000
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
	id 1kRu7N-0006vC-8d; Mon, 12 Oct 2020 09:27:45 +0000
Received: by outflank-mailman (input) for mailman id 5835;
 Mon, 12 Oct 2020 09:27:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HuXe=DT=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kRu7M-0006v7-8M
 for xen-devel@lists.xenproject.org; Mon, 12 Oct 2020 09:27:44 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0450a4dc-39fe-4b5e-a12a-22a68f0d597c;
 Mon, 12 Oct 2020 09:27:43 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A2806ACE6;
 Mon, 12 Oct 2020 09:27:42 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=HuXe=DT=suse.com=jgross@srs-us1.protection.inumbo.net>)
	id 1kRu7M-0006v7-8M
	for xen-devel@lists.xenproject.org; Mon, 12 Oct 2020 09:27:44 +0000
X-Inumbo-ID: 0450a4dc-39fe-4b5e-a12a-22a68f0d597c
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 0450a4dc-39fe-4b5e-a12a-22a68f0d597c;
	Mon, 12 Oct 2020 09:27:43 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1602494862;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=asB2BCdRsDccGAc7GcG/kddQH4nCdr8U8AOZiUpLbWE=;
	b=ifIHI4wlnNJnZgWMVBBgNCukI5PzuwlTNIBE+fGyfup1hDoJH1FFtNj4Xa9aBv9CuBJE56
	OCI67kxyPPdNv4UuZyDwc3NAJaOyLLM51Ikq20QsDTvHUl9S2m6wUABHgbcNO+fFvuiV8H
	8un7TXjM+KNMnl3iu7cFnOYGCbnejyA=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id A2806ACE6;
	Mon, 12 Oct 2020 09:27:42 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 0/2] XSA-343 followup patches
Date: Mon, 12 Oct 2020 11:27:38 +0200
Message-Id: <20201012092740.1617-1-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The patches for XSA-343 produced some fallout, especially the event
channel locking has shown to be problematic.

Patch 1 is targeting fifo event channels for avoiding any races for the
case that the fifo queue has been changed for a specific event channel.

The second patch is modifying the per event channel locking scheme in
order to avoid deadlocks and problems due to the event channel lock
having been changed to require IRQs off by the XSA-343 patches.

Juergen Gross (2):
  xen/events: access last_priority and last_vcpu_id together
  xen/evtchn: rework per event channel lock

 xen/arch/x86/irq.c         |   6 +-
 xen/arch/x86/pv/shim.c     |   9 +--
 xen/common/event_channel.c | 109 +++++++++++++++++--------------------
 xen/common/event_fifo.c    |  25 +++++++--
 xen/include/xen/event.h    |  56 ++++++++++++++++---
 xen/include/xen/sched.h    |   5 +-
 6 files changed, 126 insertions(+), 84 deletions(-)

-- 
2.26.2


