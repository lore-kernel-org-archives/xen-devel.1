Return-Path: <SRS0=yhtS=OY=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A386C433F5
	for <xen-devel@archiver.kernel.org>; Mon,  4 Oct 2021 14:19:44 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0F7D561215
	for <xen-devel@archiver.kernel.org>; Mon,  4 Oct 2021 14:19:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0F7D561215
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.201540.356096 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mXOob-0007XX-1x; Mon, 04 Oct 2021 14:19:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 201540.356096; Mon, 04 Oct 2021 14:19:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mXOoa-0007XQ-Um; Mon, 04 Oct 2021 14:19:36 +0000
Received: by outflank-mailman (input) for mailman id 201540;
 Mon, 04 Oct 2021 14:19:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7SE7=OY=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1mXOoZ-0007UW-Qs
 for xen-devel@lists.xenproject.org; Mon, 04 Oct 2021 14:19:35 +0000
Received: from smtp-out2.suse.de (unknown [195.135.220.29])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b55e299b-80d0-4722-ae83-8c39b72cd2a2;
 Mon, 04 Oct 2021 14:19:29 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 638A220206;
 Mon,  4 Oct 2021 14:19:28 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2CD2B13342;
 Mon,  4 Oct 2021 14:19:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id YB2xCXANW2EjcAAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 04 Oct 2021 14:19:28 +0000
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
X-Inumbo-ID: b55e299b-80d0-4722-ae83-8c39b72cd2a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1633357168; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=0AOhPZV+JXqC2xfl8dUUkVHXeqvYXj7VLkoveiuIiaU=;
	b=KVeGLE7kpF7v7Zc1Q51PTlyg47fyQALvDke73b8ICABdPJ8HgHcoAiNzVCrjUvJP2qaUsg
	ACXY2nqc1NyrAfql+VIjUTPyBnKnWw0gWBUZSSMQRDT8zeSGeEv0Q+rk/pbuwSrZmZRV9K
	iQ4YxONqNpFwm8iurtHzjJas/ILOOHg=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	wl@xen.org,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH 0/2] mini-os: prepare mini-os stubdoms to use stable libs only
Date: Mon,  4 Oct 2021 16:19:22 +0200
Message-Id: <20211004141924.7088-1-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When built as stubdom Mini-OS can't be linked to use only stable Xen
libraries, as there is only one config option for adding Xen library
support, which includes libxenctrl.

This series is changing that by adding dedicated config options for
each Xen library needing special support in Mini-OS.

Juergen Gross (2):
  mini-os: fix testbuilds regarding CONFIG_XC
  mini-os: add config options for xen libraries

 Config.mk                     | 8 +++++++-
 arch/x86/testbuild/all-no     | 4 +++-
 arch/x86/testbuild/all-yes    | 8 +++++---
 arch/x86/testbuild/newxen-yes | 8 +++++---
 lib/sys.c                     | 8 ++++++--
 5 files changed, 26 insertions(+), 10 deletions(-)

-- 
2.26.2


