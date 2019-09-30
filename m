Return-Path: <SRS0=D6zB=XZ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6857DC32792
	for <xen-devel@archiver.kernel.org>; Mon, 30 Sep 2019 17:23:50 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3BEAB216F4
	for <xen-devel@archiver.kernel.org>; Mon, 30 Sep 2019 17:23:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="HBv8ks1v"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3BEAB216F4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iEzOW-0003Xi-U6; Mon, 30 Sep 2019 17:23:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=QDh0=XZ=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1iEzOV-0003XY-NP
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2019 17:23:31 +0000
X-Inumbo-ID: 057e4e30-e3a7-11e9-96dc-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by localhost (Halon) with ESMTPS
 id 057e4e30-e3a7-11e9-96dc-12813bfff9fa;
 Mon, 30 Sep 2019 17:23:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1569864210;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=VChGdlYd1q0+QlBJLMvsje/7ttAR3785gvO+XDAOByc=;
 b=HBv8ks1vUiVge16l9xBBUlUcND+/8YskWXA6ngW0ik9E7VjhoOYEkvix
 az2Hk7UEMtlm4loUzYxqiM/ZIDaFa9BFojyC6sHwwhoYiPbhulZUodNA2
 rvmwkygGc/tSh+v4+B7gs8/I01BiC0z0wkf9SKqDSrRFpRIt5aRQoK4Nq I=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 26ucXNbMX6hNvOTETz9aMXBUq2HltFTbDjHbqp6ou2akb+IQRWtQnD43fxE+UamH5tQ9Z9GABE
 WOwA2gyHFU9Vpdt6K5WMIuS7zayAI0wsDa0uIWm29gc6+KV26RI9yOMYiioKyXjh96AsmVO9wQ
 QVFbPM9kmGIMRjMnWGwUJ6G/NjXeUJKHBMH+QlkXYrYSDcg4WvqR5F0NfQAsnGZfGpu1BUkZI0
 AahSMQN4J+QJRzZdOWyNaYuq1Nw0V4V2DZkqMMeJLxvciWUGSX6Kdwf/3T/79p7E1sb1KTltWC
 iXQ=
X-SBRS: 2.7
X-MesageID: 6617644
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,568,1559534400"; 
   d="scan'208";a="6617644"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Mon, 30 Sep 2019 18:23:25 +0100
Message-ID: <20190930172327.784520-1-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 0/2] libxl fixes with pci passthrough
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
Cc: Anthony PERARD <anthony.perard@citrix.com>, Ian
 Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

UGF0Y2ggc2VyaWVzIGF2YWlsYWJsZSBpbiB0aGlzIGdpdCBicmFuY2g6Cmh0dHBzOi8veGVuYml0
cy54ZW4ub3JnL2dpdC1odHRwL3Blb3BsZS9hcGVyYXJkL3hlbi11bnN0YWJsZS5naXQgYnIuZml4
ZXMtZm9yLXBjaS1wdC1saWJ4bC12MQoKSGksCgpTb21lIGZpeGVzIGZvbGxvd2luZyB0aGUgcmVj
ZW50IGNoYW5nZXMgdG8gdXNlIGV2X3FtcCBpbiBsaWJ4bC4KCkFudGhvbnkgUEVSQVJEICgyKToK
ICBsaWJ4bF9wY2k6IERvbid0IGlnbm9yZSBQQ0kgUFQgZXJyb3IgYXQgZ3Vlc3QgY3JlYXRpb24K
ICBsaWJ4bF9wY2k6IEZpeCBndWVzdCBzaHV0ZG93biB3aXRoIFBDSSBQVCBhdHRhY2hlZAoKIHRv
b2xzL2xpYnhsL2xpYnhsX3BjaS5jIHwgNDMgKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0t
LS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAyOCBpbnNlcnRpb25zKCspLCAxNSBkZWxldGlv
bnMoLSkKCi0tIApBbnRob255IFBFUkFSRAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
