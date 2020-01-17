Return-Path: <SRS0=Kj7J=3G=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC9A3C33CB1
	for <xen-devel@archiver.kernel.org>; Fri, 17 Jan 2020 15:58:05 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BC84C2064C
	for <xen-devel@archiver.kernel.org>; Fri, 17 Jan 2020 15:58:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="g5HCzbgD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BC84C2064C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1isU0O-0002Va-Bo; Fri, 17 Jan 2020 15:57:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=V5CB=3G=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1isU0M-0002VR-Cm
 for xen-devel@lists.xenproject.org; Fri, 17 Jan 2020 15:57:50 +0000
X-Inumbo-ID: 17771a7c-3942-11ea-b833-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 17771a7c-3942-11ea-b833-bc764e2007e4;
 Fri, 17 Jan 2020 15:57:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1579276661;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rFuVzKQ9OuTB+RQgWp0Vao74hawqHb77AcRIS5OBuhM=;
 b=g5HCzbgDgZhJ6kyyuJqH1k8NE99XhoD1RRGmuLQrau/XYVsECq+gW7wZ
 A52NR6A3KKKm7CpRnOBx7ouWLUwAk19eFvs8j/mjjRXjRdpXiNGhk06lk
 EaO/WJDcJreMWcIE3/8MdZfxiAR6CApkaqnvUOm7knfjGwsuwf+F6jPyZ 4=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=george.dunlap@citrix.com;
 spf=Pass smtp.mailfrom=George.Dunlap@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 george.dunlap@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="george.dunlap@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 George.Dunlap@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
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
 envelope-from="George.Dunlap@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: aupfuAVvOcw9jDAAlx4vrQf8hNPGdtpvEfrVmQ/CnLt44OXAWsuCJ+v23M6gXZ8dbMPJiNSN/M
 3ghCTOLh83pxP7E0RVqCZL5ISnJSI2K2G3jJyKzhGkeg6tHjV1yeYowl9aIOZHdii2cHhLTwFN
 vq+72Pyklk1J216Q3e1ltSsWihspeXiIMgNdqV5Jl1D382ADtl6kpK6Uea0VaGExZ5mqofoE2e
 FnjOcnCcgCXTH2E6zqRDpRhbaCuotA7GK3WaPFzcj68cxy1G+gp+4qv9DDQ+nZ7SxLmKLMc8Vn
 AhI=
X-SBRS: 2.7
X-MesageID: 11674357
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,330,1574139600"; d="scan'208";a="11674357"
From: George Dunlap <george.dunlap@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 17 Jan 2020 15:57:31 +0000
Message-ID: <20200117155734.1067550-5-george.dunlap@citrix.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200117155734.1067550-1-george.dunlap@citrix.com>
References: <20200117155734.1067550-1-george.dunlap@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v3 5/8] golang/xenlight: Default loglevel to
 DEBUG until we get everything working
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
Cc: Nick Rosbrook <rosbrookn@ainfosec.com>,
 George Dunlap <george.dunlap@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

U2lnbmVkLW9mZi1ieTogR2VvcmdlIER1bmxhcCA8Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPgot
LS0KClRoZSBvdGhlciBvcHRpb24gd291bGQgYmUgdG8gZXhwb3NlIHRoZSBYVEwgbG9nZ2luZyBs
ZXZlbHMgYW5kIGxldCB0aGUKY2FsbGVyIHNldCB0aGVtIHNvbWVob3cuCgpDQzogTmljayBSb3Ni
cm9vayA8cm9zYnJvb2tuQGFpbmZvc2VjLmNvbT4KLS0tCiB0b29scy9nb2xhbmcveGVubGlnaHQv
eGVubGlnaHQuZ28gfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVs
ZXRpb24oLSkKCmRpZmYgLS1naXQgYS90b29scy9nb2xhbmcveGVubGlnaHQveGVubGlnaHQuZ28g
Yi90b29scy9nb2xhbmcveGVubGlnaHQveGVubGlnaHQuZ28KaW5kZXggYWExZTYzYTYxYS4uMGU3
MWY2Y2E3ZCAxMDA2NDQKLS0tIGEvdG9vbHMvZ29sYW5nL3hlbmxpZ2h0L3hlbmxpZ2h0LmdvCisr
KyBiL3Rvb2xzL2dvbGFuZy94ZW5saWdodC94ZW5saWdodC5nbwpAQCAtODIsNyArODIsNyBAQCB0
eXBlIENvbnRleHQgc3RydWN0IHsKIGZ1bmMgTmV3Q29udGV4dCgpICgqQ29udGV4dCwgZXJyb3Ip
IHsKIAl2YXIgY3R4IENvbnRleHQKIAotCWN0eC5sb2dnZXIgPSBDLnh0bF9jcmVhdGVsb2dnZXJf
c3RkaW9zdHJlYW0oQy5zdGRlcnIsIEMuWFRMX0VSUk9SLCAwKQorCWN0eC5sb2dnZXIgPSBDLnh0
bF9jcmVhdGVsb2dnZXJfc3RkaW9zdHJlYW0oQy5zdGRlcnIsIEMuWFRMX0RFQlVHLCAwKQogCiAJ
cmV0IDo9IEMubGlieGxfY3R4X2FsbG9jKCZjdHguY3R4LCBDLkxJQlhMX1ZFUlNJT04sIDAsCiAJ
CSgqQy54ZW50b29sbG9nX2xvZ2dlcikodW5zYWZlLlBvaW50ZXIoY3R4LmxvZ2dlcikpKQotLSAK
Mi4yNC4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
