Return-Path: <SRS0=FJpJ=5X=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5435BC2BA80
	for <xen-devel@archiver.kernel.org>; Tue,  7 Apr 2020 15:23:11 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 214B52072F
	for <xen-devel@archiver.kernel.org>; Tue,  7 Apr 2020 15:23:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="TAzEuqla"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 214B52072F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jLq3t-0005dh-O2; Tue, 07 Apr 2020 15:22:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=DsZW=5X=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1jLq3s-0005dc-4M
 for xen-devel@lists.xenproject.org; Tue, 07 Apr 2020 15:22:48 +0000
X-Inumbo-ID: a2714d88-78e3-11ea-b58d-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a2714d88-78e3-11ea-b58d-bc764e2007e4;
 Tue, 07 Apr 2020 15:22:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1586272967;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=p4pqrvqLWTeQJ2N/iED4+aXuC2skShBJ4HGL3c8YB1Y=;
 b=TAzEuqlaknaOmP2fRZRgeyybFDHw8gYHvdWaiXLiASbPrzvdoxgm2h3Y
 dmij6fRihwTThCBRtDvTPW26POTmyOAcg9kaiQ9obpe9FiMf2pBVAGgaP
 85vYxdYbAyQWP6UNs1sV2kB/X3DJVZgIEdELuWoTVl0W1YPybMmx2gEDu Q=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 5+opBNhuKZjxrRGFQXvAaJMdbcrJU69J57N5qV2v5aq49GjtbNrkEyM5Jmgq3OiYKidpOMYe78
 wdi0th0m74HMsZ7tDLtfOBtLwmPvmz0Ne4665Fi9FXXkm0HXsaK6t2IsYaREOpq50ZCa7emJ4V
 iSQCYz0wsi/QRa8stCQJtuca3iMxokWAcCbU99E+KIN4cgvgRWNz1HfbldysuqtLyP3XY7bGew
 zXEAgcrWH4Dd1EK2yrTr0GMlWofR2KN1vO+FUBzk2cxYdaNg490IcIBRXUVUWOCAChZGbiiZGL
 56Q=
X-SBRS: 2.7
X-MesageID: 15974520
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,355,1580792400"; d="scan'208";a="15974520"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <qemu-devel@nongnu.org>
Subject: [PULL 0/3] xen queue for 5.0
Date: Tue, 7 Apr 2020 16:22:34 +0100
Message-ID: <20200407152237.1468704-1-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

The following changes since commit 8f0d25c464a1989d606f7b988d07b1147dfcde33:

  Merge remote-tracking branch 'remotes/philmd-gitlab/tags/acceptance-fixes-20200407' into staging (2020-04-07 15:10:11 +0100)

are available in the Git repository at:

  https://xenbits.xen.org/git-http/people/aperard/qemu-dm.git tags/pull-xen-20200407

for you to fetch changes up to 758af9cfabfb000eb00e42b9738e655b18fdd812:

  MAINTAINERS: Add xen-usb.c to Xen section (2020-04-07 16:13:26 +0100)

----------------------------------------------------------------
Xen queue for QEMU 5.0

- Fix for xen-block.
- A fix for a Coverity false positive in xen-usb.
- Update MAINTAINERS to add xen-usb.c to Xen section.

----------------------------------------------------------------
Anthony PERARD (2):
      xen-block: Fix uninitialized variable
      MAINTAINERS: Add xen-usb.c to Xen section

Peter Maydell (1):
      hw/usb/xen-usb.c: Pass struct usbback_req* to usbback_packet_complete()

 MAINTAINERS          |  1 +
 hw/block/xen-block.c |  2 +-
 hw/usb/xen-usb.c     | 10 ++++------
 3 files changed, 6 insertions(+), 7 deletions(-)

