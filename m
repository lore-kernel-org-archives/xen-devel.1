Return-Path: <SRS0=mRjJ=6B=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E1F6C2D0EF
	for <xen-devel@archiver.kernel.org>; Fri, 17 Apr 2020 15:50:41 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0F41720857
	for <xen-devel@archiver.kernel.org>; Fri, 17 Apr 2020 15:50:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="gUILGGtj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0F41720857
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jPTFt-0007W3-Pq; Fri, 17 Apr 2020 15:50:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=z9Py=6B=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jPTFs-0007Vw-2c
 for xen-devel@lists.xenproject.org; Fri, 17 Apr 2020 15:50:12 +0000
X-Inumbo-ID: 1e35ab81-80c3-11ea-8d2d-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1e35ab81-80c3-11ea-8d2d-12813bfff9fa;
 Fri, 17 Apr 2020 15:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1587138610;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Ty9LCOSIDFwYRg9etCmwYzIgyzp5o29Ynp1qGNaPCMc=;
 b=gUILGGtjZDtyknJf5IP2mYV36oW/oLiJbBF2reVTeMU+66A9qKjD+PJZ
 7ibE8tySVB2AfBn8uATjiRPaRR6U2MuDCL0BDlMhLcL7WjTp+DNP8Ug4Q
 AEZ4EddwcMC2D+h/zevxS3uCt8awPtPa2b2SeI5MgJWS3EEhJFkA03eiY k=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
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
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: HNegbfuZ/DbU50cCy0gHrJ7kaVRk98n/zdGAAYajyTOWKrRD/iqU2e3o7UEpdrNYUtNX6+Zf3Q
 U7sd3xwM5EdHJJWgal+5pC8fltKPm4FL+RjweRUShk6UrMGCkbmZLSFrB+25ffzLNypC1p8T1l
 G5RPu5JPQTpldmMRmi4kquZ9ILV1sAQNeDjaQITKlcaVXbs7l/HDAxvJt4v4+DGIQD+ruVAzYY
 4WE+quqCl9ENMMb8fG/nAcZgH6X3evM+ey/7CCU8XJ987Sbh9A33HyCuPMljRWMTRSc/VXUWi1
 LEA=
X-SBRS: 2.7
X-MesageID: 16528319
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,395,1580792400"; d="scan'208";a="16528319"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Subject: [PATCH 0/3] x86/pv: Start to trim 32bit support
Date: Fri, 17 Apr 2020 16:50:01 +0100
Message-ID: <20200417155004.16806-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
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
Cc: Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Wei Liu <wl@xen.org>, Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Downstreams may want this for either security or performance reasons.  Offer
some options, and take advantage of some of the very low hanging fruit it
offers.

There is plenty more incremental cleanup which can be done at a later point.

Andrew Cooper (3):
  x86/pv: Options to disable and/or compile out 32bit PV support
  x86/pv: Short-circuit is_pv_{32,64}bit_domain() in !CONFIG_PV32 builds
  x86/pv: Compile out compat_gdt in !CONFIG_PV builds

 docs/misc/xen-command-line.pandoc | 12 +++++++++++-
 xen/arch/x86/Kconfig              | 16 +++++++++++++++
 xen/arch/x86/cpu/common.c         |  5 +++--
 xen/arch/x86/desc.c               |  2 ++
 xen/arch/x86/domctl.c             |  4 ++--
 xen/arch/x86/pv/domain.c          | 41 ++++++++++++++++++++++++++++++++++++---
 xen/arch/x86/pv/hypercall.c       |  2 ++
 xen/arch/x86/setup.c              |  9 +++++++--
 xen/arch/x86/smpboot.c            |  5 ++++-
 xen/arch/x86/traps.c              | 10 +++++++---
 xen/arch/x86/x86_64/asm-offsets.c |  4 +++-
 xen/include/asm-x86/domain.h      |  4 ++--
 xen/include/asm-x86/pv/domain.h   |  6 ++++++
 xen/include/xen/sched.h           | 15 ++++++++++++--
 14 files changed, 116 insertions(+), 19 deletions(-)

-- 
2.11.0


