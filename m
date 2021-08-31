Return-Path: <SRS0=eVLD=NW=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-23.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D22B6C432BE
	for <xen-devel@archiver.kernel.org>; Tue, 31 Aug 2021 07:31:09 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 953F260462
	for <xen-devel@archiver.kernel.org>; Tue, 31 Aug 2021 07:31:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 953F260462
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.175510.319714 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mKyEN-0008Hj-GD; Tue, 31 Aug 2021 07:30:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 175510.319714; Tue, 31 Aug 2021 07:30:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mKyEN-0008Hc-D0; Tue, 31 Aug 2021 07:30:51 +0000
Received: by outflank-mailman (input) for mailman id 175510;
 Tue, 31 Aug 2021 07:30:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=DmOZ=NW=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1mKyEN-0008HW-0o
 for xen-devel@lists.xenproject.org; Tue, 31 Aug 2021 07:30:51 +0000
Received: from smtp-out2.suse.de (unknown [195.135.220.29])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5cf28380-0a2d-11ec-ad0e-12813bfff9fa;
 Tue, 31 Aug 2021 07:30:49 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id B739920111;
 Tue, 31 Aug 2021 07:30:48 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 6B8E6136DF;
 Tue, 31 Aug 2021 07:30:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id YYguGKjaLWFQTAAAGKfGzw
 (envelope-from <jgross@suse.com>); Tue, 31 Aug 2021 07:30:48 +0000
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
X-Inumbo-ID: 5cf28380-0a2d-11ec-ad0e-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1630395048; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=QDw6hWNKn1OSxqSn8LcKWeOLr5F/R547IKlLdYiyFwI=;
	b=ZrQ+vpdq6YJ/MVjJe0kWgXlWjwIifEJzUqz2vtTGCmwYAwdvLmgqdvzLPoretEBWRWWPGc
	2vvAKRQy682fahKtv0FDIfCb4Yf/TlDkjLEh70WVhpHRGUdAeH0rEAlSh8ZRxEh7mo9btJ
	L33ugijrxBSXiUnKGwoC1Wz1vyUPfpU=
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
Subject: [PATCH] Config: use Mini-OS master for xen-unstable
Date: Tue, 31 Aug 2021 09:30:38 +0200
Message-Id: <20210831073039.7101-1-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In order to get Mini-OS master branch tested by OSStest, use it for
xen-unstable.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
There are some Mini-OS patches pending, of which at least the Mini-OS
netfront fix should be committed as it will be required for qemu-stubdom
to work.
---
 Config.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Config.mk b/Config.mk
index 4d723eec1d..d4e8ced104 100644
--- a/Config.mk
+++ b/Config.mk
@@ -246,7 +246,7 @@ MINIOS_UPSTREAM_URL ?= git://xenbits.xen.org/mini-os.git
 endif
 OVMF_UPSTREAM_REVISION ?= b37cfdd2807181aed2fee1e17bd7ec1190db266a
 QEMU_UPSTREAM_REVISION ?= master
-MINIOS_UPSTREAM_REVISION ?= 051b87bb9c19609976fb038f386920e1ce5454c5
+MINIOS_UPSTREAM_REVISION ?= master
 
 SEABIOS_UPSTREAM_REVISION ?= rel-1.14.0
 
-- 
2.26.2


