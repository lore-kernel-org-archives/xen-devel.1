Return-Path: <SRS0=teC0=3X=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F0D2C33CAC
	for <xen-devel@archiver.kernel.org>; Mon,  3 Feb 2020 10:31:32 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 502C32080D
	for <xen-devel@archiver.kernel.org>; Mon,  3 Feb 2020 10:31:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="VUfP2E7B"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 502C32080D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iyZ0h-0005lZ-Tx; Mon, 03 Feb 2020 10:31:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=MGDo=3X=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iyZ0g-0005lQ-L3
 for xen-devel@lists.xenproject.org; Mon, 03 Feb 2020 10:31:18 +0000
X-Inumbo-ID: 4f47c538-4670-11ea-8396-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4f47c538-4670-11ea-8396-bc764e2007e4;
 Mon, 03 Feb 2020 10:31:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1580725877;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=htoYIi+2xWPvj2yldcD+WPbOONlNGH9fKUYA1+v4lvk=;
 b=VUfP2E7BDJzZpc2BmnwcpXOUg1KylZeYalvay6PfZ214MDXhsBLCRPPQ
 tvHh984Rr+Sc8ZM03ZUg051wzpdV85VvHf3sVJF3FcdirNRKgAeWLSwg4
 N7hbCesmRRIpI0xp4vdsdDiwN6ZshoVFTB/dMBnfdBs3dXyDjbdoS5xpJ Y=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: PzdkzGqnJV0fvoNUIhpqkwfNENvzWPql2uX3+QwEdFUx62KczS5aWObpWqwj/Bj8V1Be0oG6Bt
 dujuXNBSPQDPhBUh0Ua5AMM1kWN9ixUMKAuiIqQzuVJUSaq8zVTCs/YsXwJc55UxSN4g/i7v1/
 37ifmGugH37j2PFknqRbRieVcs2Y+4t/FFSGaul+6YhV0DKMPqv4bstNHabimYx/LFzRCm8iV8
 yQzZa//jmMCJXSynzFMoCrpS+NoUENz+HomicT8bfHiwkwhs1AI6Y8NXbzt3ZIWbD0zRWtpMQ4
 fHc=
X-SBRS: 2.7
X-MesageID: 12270197
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,397,1574139600"; d="scan'208";a="12270197"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Mon, 3 Feb 2020 11:31:12 +0100
Message-ID: <20200203103112.14622-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] docs/xl: fix typo in xl.cfg
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
Cc: Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIG5hbWUgb2YgdGhlIG9wdGlvbiBpcyBub2dyYXBoaWMuCgpTaWduZWQtb2ZmLWJ5OiBSb2dl
ciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KLS0tCiBkb2NzL21hbi94bC5jZmcu
NS5wb2QuaW4gfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRp
b24oLSkKCmRpZmYgLS1naXQgYS9kb2NzL21hbi94bC5jZmcuNS5wb2QuaW4gYi9kb2NzL21hbi94
bC5jZmcuNS5wb2QuaW4KaW5kZXggMjQ1ZDNmOTQ3Mi4uMGNhZDU2MTM3NSAxMDA2NDQKLS0tIGEv
ZG9jcy9tYW4veGwuY2ZnLjUucG9kLmluCisrKyBiL2RvY3MvbWFuL3hsLmNmZy41LnBvZC5pbgpA
QCAtMjUwNCw3ICsyNTA0LDcgQEAgQXZhaWxhYmxlIG9wdGlvbnMgYXJlOiBCPGZpbHRlciwgYWxs
LCBvZmY+LgogUmVkaXJlY3QgdmlydHVhbCBzZXJpYWwgcG9ydHMgdG8gQjxERVZJQ0U+cy4gUGxl
YXNlIHNlZSB0aGUKIEI8LXNlcmlhbD4gb3B0aW9uIGluIHRoZSBCPHFlbXUoMSk+IG1hbnBhZ2Ug
Zm9yIGRldGFpbHMgb2YgdGhlIHZhbGlkCiBCPERFVklDRT4gb3B0aW9ucy4gRGVmYXVsdCBpcyBC
PHZjPiB3aGVuIGluIGdyYXBoaWNhbCBtb2RlIGFuZAotQjxzdGRpbz4gaWYgQjxub2dyYXBoaWNz
PTE+IGlzIHVzZWQuCitCPHN0ZGlvPiBpZiBCPG5vZ3JhcGhpYz0xPiBpcyB1c2VkLgogCiBUaGUg
Zm9ybSBzZXJpYWw9REVWSUNFIGlzIGFsc28gYWNjZXB0ZWQgZm9yIGJhY2t3YXJkcyBjb21wYXRp
YmlsaXR5LgogCi0tIAoyLjI1LjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
