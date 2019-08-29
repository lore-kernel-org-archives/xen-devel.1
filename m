Return-Path: <SRS0=9cJ5=WZ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B212C3A59F
	for <xen-devel@archiver.kernel.org>; Thu, 29 Aug 2019 09:18:33 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 053802339E
	for <xen-devel@archiver.kernel.org>; Thu, 29 Aug 2019 09:18:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="eKKAoXPM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 053802339E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=eu.citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i3GZP-0005y6-Qb; Thu, 29 Aug 2019 09:18:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=HRfl=WZ=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1i3GZO-0005xu-Jw
 for xen-devel@lists.xenproject.org; Thu, 29 Aug 2019 09:18:18 +0000
X-Inumbo-ID: ef7667bc-ca3d-11e9-ae63-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ef7667bc-ca3d-11e9-ae63-12813bfff9fa;
 Thu, 29 Aug 2019 09:18:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1567070298;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=crEr2lcaAIYH5XlxgOqXqUJZJFway8XKTrtox9dq0As=;
 b=eKKAoXPMPWuKVkIa0XJC/Cf6p/uzTBwf5cOz78YxL8BlNBJ5Af5FKrtS
 7FWURYsvmzx/kPhEjP7Phm4SXrxhO/LkfLgrpCaxKtubyhWauMXdovuSO
 HpMPr7zDX/YO30YApNn3aOUpS0eISnDiuwMVpH8fjsOycTPyzfCLOakaE w=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@eu.citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@eu.citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@eu.citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: t48knbqXlKGTfwoTo0XwGZ0YwJMGwGRlHCxK0GgokOM6Pvt/jNfELo5Qgq/aOlSyEy9gd1EBYC
 zEpXRwcYbBlhjDJLUNUHBcsLSpXGlAaQLcLQOZUj1CneeLmPuk5QNcTAN7UekGrHyh5hm2nU1n
 laAGhUPEFb8OlY9BIrd7o30gwGDXfHnJqz+960wYAWhhyQBoZ+Iw4rDj5Vlmd6GJXGJmN5s6TY
 khz6I0v1eVBUkxertHIKMui9tLoR8HZqi58B/nx2NYVG5A9FN7JddaWdHcLpoGbYwASsG6lA4z
 l+g=
X-SBRS: 2.7
X-MesageID: 4882837
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,442,1559534400"; 
   d="scan'208";a="4882837"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 29 Aug 2019 10:17:17 +0100
Message-ID: <20190829091719.25605-1-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [OSSTEST PATCH 1/3] mg-hosts mknetbootdir: Improve
 sub-option parser
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
Cc: Ian Jackson <ian.jackson@eu.citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Tm8gc2VtYW50aWMgY2hhbmdlLgoKU2lnbmVkLW9mZi1ieTogSWFuIEphY2tzb24gPGlhbi5qYWNr
c29uQGV1LmNpdHJpeC5jb20+Ci0tLQogbWctaG9zdHMgfCA5ICsrKysrKysrLQogMSBmaWxlIGNo
YW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL21nLWhv
c3RzIGIvbWctaG9zdHMKaW5kZXggNThiNGFjYzMuLmQ2OGY3YjRlIDEwMDc1NQotLS0gYS9tZy1o
b3N0cworKysgYi9tZy1ob3N0cwpAQCAtMTIxLDcgKzEyMSwxNCBAQCBzdWIgbCAoJCkgeyByZXR1
cm4gc3BsaXQgLywvLCAkX1swXTsgfQogCiBzdWIgY21kX21rbmV0Ym9vdGRpciAoKSB7CiAgICAg
bXkgJGRyeXJ1biA9IDA7Ci0gICAgaWYgKEBBUkdWICYmICRBUkdWWzBdIGVxICctbicpIHsgc2hp
ZnQgQEFSR1Y7ICRkcnlydW49IDE7IH0KKyAgICB3aGlsZSAoQEFSR1YgJiYgJEFSR1ZbMF0gPX4g
bS9eLS8pIHsKKwkkXyA9IHNoaWZ0IEBBUkdWOworCWxhc3QgaWYgJF8gPX4gbS9eLS0/JC87CisJ
d2hpbGUgKG0vXi0uLykgeworCSAgICBpZiAocy9eLW4vLS8pIHsgJGRyeXJ1bj0gMTsgfQorCSAg
ICBlbHNlIHsgZGllICJ1bmtub3duIG1rbmV0Ym9vdGRpciBvcHRpb24gJF8iOyB9CisJfQorICAg
IH0KICAgICBkaWUgdW5sZXNzIEBBUkdWPj0xOwogICAgIG15ICRzdWRvID0gJEVOVnsnT1NTVEVT
VF9TVURPJ30gLy8gJ3N1ZG8nOwogICAgIGZvcmVhY2ggbXkgJGhuIChAQVJHVikgewotLSAKMi4x
MS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
