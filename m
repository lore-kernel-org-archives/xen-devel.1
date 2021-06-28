Return-Path: <SRS0=LFwY=LW=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 103DCC2B9F4
	for <xen-devel@archiver.kernel.org>; Mon, 28 Jun 2021 10:02:30 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CB35761205
	for <xen-devel@archiver.kernel.org>; Mon, 28 Jun 2021 10:02:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CB35761205
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.147769.272704 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lxo5h-0005WG-Ku; Mon, 28 Jun 2021 10:02:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 147769.272704; Mon, 28 Jun 2021 10:02:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lxo5h-0005W9-Ho; Mon, 28 Jun 2021 10:02:09 +0000
Received: by outflank-mailman (input) for mailman id 147769;
 Mon, 28 Jun 2021 10:02:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fPZa=LW=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1lxo5g-0005W3-MY
 for xen-devel@lists.xenproject.org; Mon, 28 Jun 2021 10:02:08 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 58989fc3-5613-44c0-84c0-394af414ecf2;
 Mon, 28 Jun 2021 10:02:07 +0000 (UTC)
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
X-Inumbo-ID: 58989fc3-5613-44c0-84c0-394af414ecf2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1624874527;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=J6HQlxlq3cLCqM+vOyHjQEzG+GRhxAkoDjQtJxvej+s=;
  b=ShQvot0e8v2ADB2l0viiAJLDirDFlMK9hb86scoP6mDIcKW1N7IHNqi+
   i5o8jV38QYxx0zWspIMco6KaRICz2FBM6Nsm4VhF3fkDXTfJr3mTeevBA
   KnOGP9AlIn+oTwCNscOLhmTK+UjGUvc4m7bkHl5gEiDtm3TXzC9gvkI6Z
   Y=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: noTJMdOnNS+nZAcDLa5Wm2kV3c9O4xl259OL2rctdjnbK5sJGWUbPFvPEfGVnwK5oML/YjeZqJ
 mU5XTABrRrJ5piNliLhaswhlCb/8IKnLQpHzrotWnaMQY77Z7Q4qYW9Cpml26dHrQ7ug6TIqRm
 O3+EvseyivNrhwFyJK+qvCdBVQj6+MTWzGxjFxV9yNGpFt/zxCncVRKhiqKBImxUFxsSPjrnEP
 xZXpsSCBB9n2lKoEYcrUPJFtVeCAQyowBqdWhSBm2qoCBZjnHjL+TYKqconn3H9l7OxwiRSiMv
 weQ=
X-SBRS: 5.1
X-MesageID: 47084622
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:pZkJIKnq6cwdKbybsN1YJXXM233pDfIm3DAbv31ZSRFFG/Fxl6
 iV88jzsiWE7Qr5OUtQ/uxoV5PgfZqxz/NICOoqTNWftWvd2FdARbsKheCJ/9SJIVybygc378
 ldmsZFZOEYdWIK7vrH3A==
X-IronPort-AV: E=Sophos;i="5.83,305,1616472000"; 
   d="scan'208";a="47084622"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>
Subject: Some more QEMU 6.0 fixes
Date: Mon, 28 Jun 2021 11:01:55 +0100
Message-ID: <20210628100157.5010-1-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Follow-up of
    [XEN PATCH v2 0/8] Fix libxl with QEMU 6.0 + remove some more deprecated usages
to fix few missing bits.

To be backported to Xen 4.15 as well.



