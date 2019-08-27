Return-Path: <SRS0=wySQ=WX=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9315DC3A5A3
	for <xen-devel@archiver.kernel.org>; Tue, 27 Aug 2019 15:39:01 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 627FD2184D
	for <xen-devel@archiver.kernel.org>; Tue, 27 Aug 2019 15:39:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="ecBf5BxH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 627FD2184D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i2dYT-00075t-TB; Tue, 27 Aug 2019 15:38:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ssFz=WX=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1i2dYT-00075o-6S
 for xen-devel@lists.xenproject.org; Tue, 27 Aug 2019 15:38:45 +0000
X-Inumbo-ID: bff71206-c8e0-11e9-ae37-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bff71206-c8e0-11e9-ae37-12813bfff9fa;
 Tue, 27 Aug 2019 15:38:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1566920324;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=HhtVtVcyeId9a8mM7Xat6YU2+7ShZDg9wWzcSh4Jw+A=;
 b=ecBf5BxHbywPE+iMoypWRXSqkK5Augyo5ZNIHKjDidnkCxrX+AQqSw6f
 5j+UkJY1Td19jflNNrJS9CtnKqKhIS+9grFL1TRtspHp/hT37JTVPKKrk
 P+H3cnLxPpHOhDzZ5KjkadkYCDH1ZeScqxzfxVSO+rk0vifUkOLHDVGVZ 4=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: kYxyHqK4L6gIBWJOljkoWblDbOI4KxbuLMOXm/FGJBSqfQMuRM3PfI7pMF3LpI8KXCjxWt1Cqi
 z4619kgQFjlnkNlA/9+GQDpyZDIoGHo4p16iyjsrZQfERCsw+4ux6ki89zBRXxQoVcRzC0GTId
 mK8TzYUeBiuN4R1UCQBefSyybMuJo2HOI6/SroddAgyRPiEezpyX9T5y52amCSEDfGNcCUUq5n
 bOmyGgOXp2u9oHHXYBAUZZjvC2plS5TN6i/rT/Es4NsCUz0Ls3HaLkrXvM2WnI1v/TNoLa1Q+c
 BGw=
X-SBRS: 2.7
X-MesageID: 4783657
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,437,1559534400"; 
   d="scan'208";a="4783657"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Tue, 27 Aug 2019 16:38:39 +0100
Message-ID: <20190827153839.21737-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] livepatch: Identify the object file
 create-diff-object dislikes
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Li4uIHJhdGhlciB0aGFuIGxlYXZpbmcgdGhlIHVzZXIgd2l0aCBubyBoaW50IGFzIHRvIHdoZXJl
IHRvIGRlYnVnIG5leHQuCgpTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29v
cGVyM0BjaXRyaXguY29tPgotLS0KQ0M6IEtvbnJhZCBSemVzenV0ZWsgV2lsayA8a29ucmFkLndp
bGtAb3JhY2xlLmNvbT4KQ0M6IFJvc3MgTGFnZXJ3YWxsIDxyb3NzLmxhZ2Vyd2FsbEBjaXRyaXgu
Y29tPgotLS0KIGxpdmVwYXRjaC1idWlsZCB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2xpdmVwYXRjaC1idWlsZCBiL2xp
dmVwYXRjaC1idWlsZAppbmRleCA3MDY4ZmFmLi5iMTk4Yzk3IDEwMDc1NQotLS0gYS9saXZlcGF0
Y2gtYnVpbGQKKysrIGIvbGl2ZXBhdGNoLWJ1aWxkCkBAIC0xNDAsNyArMTQwLDcgQEAgZnVuY3Rp
b24gY3JlYXRlX3BhdGNoKCkKICAgICAgICAgICAgIGRpZSAibm8gY29yZSBmaWxlIGZvdW5kLCBy
dW4gJ3VsaW1pdCAtYyB1bmxpbWl0ZWQnIGFuZCB0cnkgdG8gcmVjcmVhdGUiCiAgICAgICAgIGZp
CiAgICAgICAgICMgY3JlYXRlLWRpZmYtb2JqZWN0IHJldHVybnMgMyBpZiBubyBmdW5jdGlvbmFs
IGNoYW5nZSBpcyBmb3VuZAotICAgICAgICBbWyAkcmMgLWVxIDAgXV0gfHwgW1sgJHJjIC1lcSAz
IF1dIHx8IEVSUk9SPSQoZXhwciAkRVJST1IgIisiIDEpCisgICAgICAgIFtbICRyYyAtZXEgMCBd
XSB8fCBbWyAkcmMgLWVxIDMgXV0gfHwgeyBFUlJPUj0kKGV4cHIgJEVSUk9SICIrIiAxKTsgd2Fy
biAiY3JlYXRlLWRpZmYtb2JqZWN0ICRpIHJjICRyYyI7IH0KICAgICAgICAgaWYgW1sgJHJjIC1l
cSAwIF1dOyB0aGVuCiAgICAgICAgICAgICBDSEFOR0VEPTEKICAgICAgICAgZmkKLS0gCjIuMTEu
MAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
