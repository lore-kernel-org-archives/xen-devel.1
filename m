Return-Path: <SRS0=yWKO=DX=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5E88C433DF
	for <xen-devel@archiver.kernel.org>; Fri, 16 Oct 2020 08:54:19 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4DB8C20848
	for <xen-devel@archiver.kernel.org>; Fri, 16 Oct 2020 08:54:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="Z/J5gRoU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4DB8C20848
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.7830.20617 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kTLUq-0002Da-Ci; Fri, 16 Oct 2020 08:53:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 7830.20617; Fri, 16 Oct 2020 08:53:56 +0000
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
	id 1kTLUq-0002DP-6w; Fri, 16 Oct 2020 08:53:56 +0000
Received: by outflank-mailman (input) for mailman id 7830;
 Fri, 16 Oct 2020 08:53:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JQTg=DX=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kTLUo-0002Cw-Tc
 for xen-devel@lists.xenproject.org; Fri, 16 Oct 2020 08:53:54 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 472e706b-4829-411a-9c0b-844cf330e8d5;
 Fri, 16 Oct 2020 08:53:53 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6DA3EADE4;
 Fri, 16 Oct 2020 08:53:52 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=JQTg=DX=suse.com=jgross@srs-us1.protection.inumbo.net>)
	id 1kTLUo-0002Cw-Tc
	for xen-devel@lists.xenproject.org; Fri, 16 Oct 2020 08:53:54 +0000
X-Inumbo-ID: 472e706b-4829-411a-9c0b-844cf330e8d5
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 472e706b-4829-411a-9c0b-844cf330e8d5;
	Fri, 16 Oct 2020 08:53:53 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1602838432;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=uflXsgCH4arUjU1zZLQaRsAU0C5CIOEyLH+JEYOYK6k=;
	b=Z/J5gRoUPV+PO0kMiJFFsSN9ei68GzUGczE6Ikc5e3ChHnTrra5NkAeHQp1r55ug+TJYZd
	MAmJZq3AcX+QjnHZ11ETXP0nh7i9IPnYraWD/PmYFuG6PYprTELD2AxYmX6ICkjGqBU8rh
	TdCsLxpUNxhcaRqyXLGsyEB/DcjHxRk=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 6DA3EADE4;
	Fri, 16 Oct 2020 08:53:52 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v3 0/3] xen/x86: implement NMI continuation
Date: Fri, 16 Oct 2020 10:53:47 +0200
Message-Id: <20201016085350.10233-1-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move sending of a virq event for oprofile to the local vcpu from NMI
to normal interrupt context.

This has been tested with a small test patch using the continuation
framework of patch 1 for all NMIs and doing a print to console in
the continuation handler.

Version 1 of this small series was sent to the security list before.

Changes in V3:
- switched to self-IPI instead of softirq
- added patch 3

Juergen Gross (3):
  xen/x86: add nmi continuation framework
  xen/oprofile: use set_nmi_continuation() for sending virq to guest
  xen/x86: issue pci_serr error message via NMI continuation

 xen/arch/x86/apic.c             | 13 +++++--
 xen/arch/x86/oprofile/nmi_int.c |  9 ++++-
 xen/arch/x86/traps.c            | 61 +++++++++++++++++++++++++++++----
 xen/include/asm-x86/nmi.h       | 13 ++++++-
 xen/include/asm-x86/softirq.h   |  5 ++-
 5 files changed, 87 insertions(+), 14 deletions(-)

-- 
2.26.2


