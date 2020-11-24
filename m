Return-Path: <SRS0=fYmn=E6=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97621C56201
	for <xen-devel@archiver.kernel.org>; Tue, 24 Nov 2020 07:01:35 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 281112083E
	for <xen-devel@archiver.kernel.org>; Tue, 24 Nov 2020 07:01:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="A+D6TBR+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 281112083E
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.35376.66873 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khSK9-0001l7-Ql; Tue, 24 Nov 2020 07:01:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 35376.66873; Tue, 24 Nov 2020 07:01:13 +0000
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
	id 1khSK9-0001l0-Na; Tue, 24 Nov 2020 07:01:13 +0000
Received: by outflank-mailman (input) for mailman id 35376;
 Tue, 24 Nov 2020 07:01:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KyA6=E6=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1khSK8-0001kq-8D
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 07:01:12 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 168c7a9a-9299-4675-a1e2-cb9118043922;
 Tue, 24 Nov 2020 07:01:09 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 14A13ADA2;
 Tue, 24 Nov 2020 07:01:09 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=KyA6=E6=suse.com=jgross@srs-us1.protection.inumbo.net>)
	id 1khSK8-0001kq-8D
	for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 07:01:12 +0000
X-Inumbo-ID: 168c7a9a-9299-4675-a1e2-cb9118043922
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 168c7a9a-9299-4675-a1e2-cb9118043922;
	Tue, 24 Nov 2020 07:01:09 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1606201269; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=Y70uQzyLQKdWXjkBuRCWzDGAgoEANc5akwMpuiUm184=;
	b=A+D6TBR+7L/YG7k2RXOaS2GvCR+ucezzfrjtryIsIW0dWE1oblb876zHEt+yUDLUHchhdn
	m3WKDKSjmvp3qG5DzgdLUTDxl3vaXrNvwU6EhI/Btsi9k00pRpRPPi4NCl1psww50aZ2By
	O0/wDefv0zqZ5EBp8Ywt+9IANsGAVdo=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 14A13ADA2;
	Tue, 24 Nov 2020 07:01:09 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v7 0/3] xen/events: further locking adjustments
Date: Tue, 24 Nov 2020 08:01:03 +0100
Message-Id: <20201124070106.26854-1-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is an add-on of my event channel locking series.

It is a resend of the single patch not having been applied from my
V6 series (being the reason to name this one V7), plus two patches
addressing issues Jan identified with the previous approach (with
one issue being more a latent one, while the other one actually existed
since the introduction on fifo events and just has been made more
probable with the new locking scheme).

Juergen Gross (3):
  xen/events: access last_priority and last_vcpu_id together
  xen/events: modify struct evtchn layout
  xen/events: rework fifo queue locking

 xen/common/event_fifo.c | 128 ++++++++++++++++++++++------------------
 xen/include/xen/sched.h |  23 ++++----
 2 files changed, 83 insertions(+), 68 deletions(-)

-- 
2.26.2


