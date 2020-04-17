Return-Path: <SRS0=mRjJ=6B=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIM_ADSP_ALL,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8B5EC2BB1D
	for <xen-devel@archiver.kernel.org>; Fri, 17 Apr 2020 07:06:12 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A050121D94
	for <xen-devel@archiver.kernel.org>; Fri, 17 Apr 2020 07:06:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=amazon.de header.i=@amazon.de header.b="a0XgZ+sV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A050121D94
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amazon.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jPL4X-0001fT-5c; Fri, 17 Apr 2020 07:05:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=3sm3=6B=amazon.de=prvs=369b905e4=wipawel@srs-us1.protection.inumbo.net>)
 id 1jPL4W-0001fN-EO
 for xen-devel@lists.xen.org; Fri, 17 Apr 2020 07:05:56 +0000
X-Inumbo-ID: e1ff53da-8079-11ea-9e09-bc764e2007e4
Received: from smtp-fw-2101.amazon.com (unknown [72.21.196.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e1ff53da-8079-11ea-9e09-bc764e2007e4;
 Fri, 17 Apr 2020 07:05:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
 t=1587107156; x=1618643156;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=AkgOU1+wOVzG+27TQuBhKQNE6uoniU+ew1o8ehk32hA=;
 b=a0XgZ+sVOHLGUzcjFLCelGmC2EIDt7sv7VvRaMyEKJAXMgomSltgc5RI
 GCmDC1qGNum+Qq3dTN2/GosEyDH61O1nMFLkjTPY3BjrPcnDITDwfiQfZ
 4Ro893VPE4f7NMfeWDVN66dLZGFccAR3v//dCIavSx3aHm3ltk1OrMPN/ 8=;
IronPort-SDR: pfvgCizM2AECzeaFULj2lu7txdzERBMb1floi+jXOnnAkISKso9xmZqRJv6SGT7bW7qDb+eYdv
 tQGJUJKhmbzg==
X-IronPort-AV: E=Sophos;i="5.72,394,1580774400"; d="scan'208";a="26253741"
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO
 email-inbound-relay-2b-c7131dcf.us-west-2.amazon.com) ([10.43.8.2])
 by smtp-border-fw-out-2101.iad2.amazon.com with ESMTP;
 17 Apr 2020 07:05:39 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2b-c7131dcf.us-west-2.amazon.com (Postfix) with ESMTPS
 id A24CCA218A; Fri, 17 Apr 2020 07:05:38 +0000 (UTC)
Received: from EX13D02EUC004.ant.amazon.com (10.43.164.117) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Fri, 17 Apr 2020 07:05:37 +0000
Received: from EX13MTAUEE002.ant.amazon.com (10.43.62.24) by
 EX13D02EUC004.ant.amazon.com (10.43.164.117) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Fri, 17 Apr 2020 07:05:36 +0000
Received: from dev-dsk-wipawel-1a-0c4e6d58.eu-west-1.amazon.com (10.4.134.33)
 by mail-relay.amazon.com (10.43.62.224) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Fri, 17 Apr 2020 07:05:35 +0000
From: Pawel Wieczorkiewicz <wipawel@amazon.de>
To: <xen-devel@lists.xen.org>
Subject: [XTF 0/6] Add time management functionality
Date: Fri, 17 Apr 2020 07:05:22 +0000
Message-ID: <20200417070528.48329-1-wipawel@amazon.de>
X-Mailer: git-send-email 2.16.6
MIME-Version: 1.0
Content-Type: text/plain
Precedence: Bulk
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: semelpaul@gmail.com, andrew.cooper3@citrix.com, julien@xen.org,
 nmanthey@amazon.de, paul@xen.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

This is a 2nd attempt to contribute time management functionality
to XTF. It is also a 2nd batch of the changes I want to sent upstream.

The patches add common/time.c core with scaling and system time
calculating functions.
Other patches add helper functions based on the core functionality.

Finally, there is also a little change adding EVTCHNOP_bind_vcpu
defininitions.

Paul Semel (4):
  time: introduce time managment in xtf
  time: add current_time() function to time management
  time: add gettimeofday() function to time managment
  time: Add helper functions and macros to time management

Pawel Wieczorkiewicz (2):
  time: Add cycles2{n,u,m}sec functions
  event_channels: Add EVTCHNOP_bind_vcpu hypercall support

 build/files.mk              |   1 +
 common/time.c               | 190 ++++++++++++++++++++++++++++++++++++++++++++
 include/xen/event_channel.h |   7 ++
 include/xtf/lib.h           |  18 +++++
 include/xtf/time.h          |  63 +++++++++++++++
 5 files changed, 279 insertions(+)
 create mode 100644 common/time.c
 create mode 100644 include/xtf/time.h

-- 
2.16.6




Amazon Development Center Germany GmbH
Krausenstr. 38
10117 Berlin
Geschaeftsfuehrung: Christian Schlaeger, Jonathan Weiss
Eingetragen am Amtsgericht Charlottenburg unter HRB 149173 B
Sitz: Berlin
Ust-ID: DE 289 237 879




