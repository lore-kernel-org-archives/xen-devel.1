Return-Path: <SRS0=KeRi=OR=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09176C4332F
	for <xen-devel@archiver.kernel.org>; Mon, 27 Sep 2021 10:48:29 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CA64260FC0
	for <xen-devel@archiver.kernel.org>; Mon, 27 Sep 2021 10:48:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CA64260FC0
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.196700.349646 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mUoBG-0003Hu-Sn; Mon, 27 Sep 2021 10:48:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 196700.349646; Mon, 27 Sep 2021 10:48:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mUoBG-0003Hl-P8; Mon, 27 Sep 2021 10:48:18 +0000
Received: by outflank-mailman (input) for mailman id 196700;
 Mon, 27 Sep 2021 10:48:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=eI72=OR=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1mUoBF-0003Gz-BY
 for xen-devel@lists.xenproject.org; Mon, 27 Sep 2021 10:48:17 +0000
Received: from smtp-out1.suse.de (unknown [195.135.220.28])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 81c52922-a431-496e-9c83-27d06e7505dd;
 Mon, 27 Sep 2021 10:48:16 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id B8F1022060;
 Mon, 27 Sep 2021 10:48:15 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8F83313A7F;
 Mon, 27 Sep 2021 10:48:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 2CHzIW+hUWHBKgAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 27 Sep 2021 10:48:15 +0000
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
X-Inumbo-ID: 81c52922-a431-496e-9c83-27d06e7505dd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1632739695; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=7Q8Q/1jLHjWLGdFh7x85OcFSIbNQybxr1Bod8P/V3So=;
	b=S8Y8tTPruO5kUWRDHOpbW+3tNSI4Sol3/9ga5LLb+Ye9RaPvQ0KeWq7Mjc9gt1ckq55kku
	o8TE0MGak9pyvkMhaSFJ8s0lLJTe7jUDID0PhC8lCY7ZUyBAuu/Q2FE6jIrh+KFbpBGLfm
	oCiVUa2Ba5y/NlXUcTdfvnDsyzHoSvI=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v4 0/2] tools/xenstore: set resource limits of xenstored
Date: Mon, 27 Sep 2021 12:48:11 +0200
Message-Id: <20210927104813.19772-1-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Set some limits for xenstored in order to avoid it being killed by
OOM killer, or to run out of file descriptors.

Changes in V4:
- add comments
- switch to configure open file descriptors directly

Changes in V3:
- make oom score configurable

Changes in V2:
- split into 2 patches
- set limits from start script

Juergen Gross (2):
  tools/xenstore: set oom score for xenstore daemon on Linux
  tools/xenstore: set open file descriptor limit for xenstored

 .../Linux/init.d/sysconfig.xencommons.in      | 22 +++++++++++++++++++
 tools/hotplug/Linux/launch-xenstore.in        |  8 +++++++
 2 files changed, 30 insertions(+)

-- 
2.26.2


