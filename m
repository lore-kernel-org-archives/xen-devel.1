Return-Path: <SRS0=P/U6=NP=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEED4C4338F
	for <xen-devel@archiver.kernel.org>; Tue, 24 Aug 2021 10:28:26 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9BAC0611CB
	for <xen-devel@archiver.kernel.org>; Tue, 24 Aug 2021 10:28:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9BAC0611CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.170854.311811 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mITfE-00031y-Rj; Tue, 24 Aug 2021 10:28:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 170854.311811; Tue, 24 Aug 2021 10:28:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mITfE-00031r-Oh; Tue, 24 Aug 2021 10:28:16 +0000
Received: by outflank-mailman (input) for mailman id 170854;
 Tue, 24 Aug 2021 10:28:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3Uw6=NP=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1mITfD-00031f-Bo
 for xen-devel@lists.xenproject.org; Tue, 24 Aug 2021 10:28:15 +0000
Received: from smtp-out2.suse.de (unknown [195.135.220.29])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fcaa3606-04c5-11ec-a8c4-12813bfff9fa;
 Tue, 24 Aug 2021 10:28:14 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 4E91D1FD84;
 Tue, 24 Aug 2021 10:28:13 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 0A1AB136DD;
 Tue, 24 Aug 2021 10:28:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id WT7oAL3JJGG8DwAAGKfGzw
 (envelope-from <jgross@suse.com>); Tue, 24 Aug 2021 10:28:13 +0000
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
X-Inumbo-ID: fcaa3606-04c5-11ec-a8c4-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1629800893; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=3sbNcmhBSTVo5KYZTHugr3AbCZgn9x7Of4fyWuiEohU=;
	b=n3qgFoWwu0QTp3L1qNcVioaf+GMOKbbANz2taAoIgSXmKNVNwa1yG4bHW42VfW1etWEUhQ
	VRUcGVx5mWXQ33GYeeIfj+MEftA6855+98ln0kqZi6NPCJyX24axaQt7+P+CyQSby5QRld
	R0wf2tkrOhsK1c49Qpgw10FQ3Xc7nxs=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>
Subject: [PATCH v2 0/4] xen: harden netfront against malicious backends
Date: Tue, 24 Aug 2021 12:28:05 +0200
Message-Id: <20210824102809.26370-1-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Xen backends of para-virtualized devices can live in dom0 kernel, dom0
user land, or in a driver domain. This means that a backend might
reside in a less trusted environment than the Xen core components, so
a backend should not be able to do harm to a Xen guest (it can still
mess up I/O data, but it shouldn't be able to e.g. crash a guest by
other means or cause a privilege escalation in the guest).

Unfortunately netfront in the Linux kernel is fully trusting its
backend. This series is fixing netfront in this regard.

It was discussed to handle this as a security problem, but the topic
was discussed in public before, so it isn't a real secret.

It should be mentioned that a similar series has been posted some years
ago by Marek Marczykowski-Górecki, but this series has not been applied
due to a Xen header not having been available in the Xen git repo at
that time. Additionally my series is fixing some more DoS cases.

Changes in V2:
- put netfront patches into own series
- comments addressed
- new patch 3

Juergen Gross (4):
  xen/netfront: read response from backend only once
  xen/netfront: don't read data from request on the ring page
  xen/netfront: disentangle tx_skb_freelist
  xen/netfront: don't trust the backend response data blindly

 drivers/net/xen-netfront.c | 272 +++++++++++++++++++++++--------------
 1 file changed, 169 insertions(+), 103 deletions(-)

-- 
2.26.2


