Return-Path: <SRS0=W9gt=ZN=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9234C432C0
	for <xen-devel@archiver.kernel.org>; Thu, 21 Nov 2019 22:16:31 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 76D10206CB
	for <xen-devel@archiver.kernel.org>; Thu, 21 Nov 2019 22:16:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="KbfomWNT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 76D10206CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iXuk6-00077T-VO; Thu, 21 Nov 2019 22:16:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=YOoV=ZN=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1iXuk5-00077J-Bc
 for xen-devel@lists.xenproject.org; Thu, 21 Nov 2019 22:16:01 +0000
X-Inumbo-ID: 7f19b7e2-0cac-11ea-9631-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7f19b7e2-0cac-11ea-9631-bc764e2007e4;
 Thu, 21 Nov 2019 22:16:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1574374560;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=o4/fhOdVyBwolZzOfgBxg/SiLaBEcH4W4O7eq0nL5lY=;
 b=KbfomWNTtWVHhs0ebeXAIdPIaJy6pBo+o2R/8/X/sG9LRfOem5SLHqxT
 aPpgL/qmc6X3tSJHcWJye/57duMvlt8S8CbcVMx1OJs64kCtos4njfgvm
 ixZhBIeeVG/pPpDylqsZjwwRnQ0I1z7iE6oWkEg95tre+Z1KsWCxUbaD8 c=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: iyN6NMxOeSjJzfoIIAqyWrYGrVEqCBRmqSqUtR9joz7hxLMf70DvlGYZKu+m5vE8AwL0at0RJg
 l/50YriHZxABslDn3qsxG2R6raVDstdYQygdKYBr/heKO7q1YmITDhejsIl8Km22cWdeZhNnsd
 SW66J48QBqSCvvAuugOyASo54KGn/Z3nXzTc38RE71GHl0B+hcv/fgSr0waORENIYx3auU4TbN
 B3Rd23FK4643rhoFAXPPbvOnWehdThrWaQdaWfuLuR9TychvVseT3wvRxX0rNL/ZBI6a/+ZOAl
 Qjk=
X-SBRS: 2.7
X-MesageID: 8679248
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,227,1571716800"; 
   d="scan'208";a="8679248"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Thu, 21 Nov 2019 22:15:49 +0000
Message-ID: <20191121221551.1175-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH for-4.13 0/2] x86/hvm: Multiple corrections to
 task switch handling
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
Cc: Juergen Gross <jgross@suse.com>, Kevin Tian <kevin.tian@intel.com>,
 Jan Beulich <JBeulich@suse.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Jun Nakajima <jun.nakajima@intel.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlc2UgcGF0Y2hlcyB3YW50IGJhY2twb3J0aW5nIGR1ZSB0byB0aGUgc2V2ZXJpdHkgb2YgcGF0
Y2ggMi4gIFRoZXkgc2hvdWxkCnRoZXJlZm9yZSBiZSBjb25zaWRlcmVkIGZvciA0LjEzIGF0IHRo
aXMgcG9pbnQuCgpBbmRyZXcgQ29vcGVyICgyKToKICB4ODYvdnR4OiBGaXggZmF1bHQgc2VtYW50
aWNzIGZvciBlYXJseSB0YXNrIHN3aXRjaCBmYWlsdXJlcwogIHg4Ni9zdm06IFdyaXRlIHRoZSBj
b3JyZWN0ICVlaXAgaW50byB0aGUgb3V0Z29pbmcgdGFzawoKIHhlbi9hcmNoL3g4Ni9odm0vaHZt
LmMgICAgICAgICAgICAgICAgfCAgNCArLS0KIHhlbi9hcmNoL3g4Ni9odm0vc3ZtL2VtdWxhdGUu
YyAgICAgICAgfCA1NSArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwogeGVuL2Fy
Y2gveDg2L2h2bS9zdm0vc3ZtLmMgICAgICAgICAgICB8IDQ2ICsrKysrKysrKysrKysrKysrKysr
KystLS0tLS0tCiB4ZW4vYXJjaC94ODYvaHZtL3ZteC92bXguYyAgICAgICAgICAgIHwgIDQgKy0t
CiB4ZW4vaW5jbHVkZS9hc20teDg2L2h2bS9odm0uaCAgICAgICAgIHwgIDIgKy0KIHhlbi9pbmNs
dWRlL2FzbS14ODYvaHZtL3N2bS9lbXVsYXRlLmggfCAgMSArCiA2IGZpbGVzIGNoYW5nZWQsIDk3
IGluc2VydGlvbnMoKyksIDE1IGRlbGV0aW9ucygtKQoKLS0gCjIuMTEuMAoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
