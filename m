Return-Path: <SRS0=3Xfx=75=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C195C433DF
	for <xen-devel@archiver.kernel.org>; Tue, 16 Jun 2020 12:09:55 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 628CE2074D
	for <xen-devel@archiver.kernel.org>; Tue, 16 Jun 2020 12:09:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 628CE2074D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jlAPL-0000BB-GS; Tue, 16 Jun 2020 12:09:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sXm7=75=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1jlAPK-0000B5-Tm
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2020 12:09:38 +0000
X-Inumbo-ID: 3f53dfb8-afca-11ea-b8c1-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3f53dfb8-afca-11ea-b8c1-12813bfff9fa;
 Tue, 16 Jun 2020 12:09:38 +0000 (UTC)
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: KKdId0+JI8lDxNG/hV1k/8LBBAT3XBjHfWp9mKeBj/ulOnzyDxsJwPv03TRlJWn8P2gDeMDdAJ
 UVoCqb2neKxgNS1dEJRIFEVsFi6J2wkcjweJ6MXWiyvPtj9lWGbtgRLhJ9bn4MoaUSSzEnqcvu
 pApWqbEPFcRs8ddqZcPzYyHNyuJuHDdx7jrI+lyL3g2ISUabNgg8VWofXeSNiXtgoGSc9WzO9A
 PREdcumcbfl2OMmPpiXyoU4I4+JyaKgDW9hFOkXv9mYIlVOJlJQRBmkyKIHMQ46ufYRC6LAbT1
 7N0=
X-SBRS: 2.7
X-MesageID: 20497140
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,518,1583211600"; d="scan'208";a="20497140"
From: George Dunlap <George.Dunlap@citrix.com>
To: xen-devel <xen-devel@lists.xenproject.org>,
 "xen-announce@lists.xenproject.org" <xen-announce@lists.xenproject.org>
Subject: Submitting new talks to XenSummit via the design-sessions website
Thread-Topic: Submitting new talks to XenSummit via the design-sessions website
Thread-Index: AQHWQ9b/QLhthVHlrkGKEhIxW4JRpA==
Date: Tue, 16 Jun 2020 12:09:33 +0000
Message-ID: <2BCC5487-5C91-4F2D-818C-7AB9A1C8A803@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3608.80.23.2.2)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-Type: text/plain; charset="utf-8"
Content-ID: <043B76A7F816014796AA14ED2AAFAA48@citrix.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RHVlIHRvIHRoZSByZS1zY2hlZHVsaW5nIG9mIHRoZSBYZW5TdW1taXQgZnJvbSBKdW5lIHRvIEp1
bHksIGFzIHdlbGwgYXMgbWFraW5nIGl0IGEgdmlydHVhbCBldmVudCBjb3ZlcmluZyBhIGZldyBt
b3JlIGRheXMsIHdlIGhhdmUgc3BhY2UgdG8gYWNjZXB0IG1vcmUgdGFsa3MuDQoNClJhdGhlciB0
aGFuIGdvaW5nIHRocm91Z2ggdGhlIGVudGlyZSBzdWJtaXNzaW9uIHByb2Nlc3MgYWdhaW4sIHdl
4oCZdmUgZGVjaWRlZCB0byB1dGlsaXplIHRoZSBkZXNpZ24gc2Vzc2lvbiB3ZWJzaXRlLiAgSWYg
eW91IHdpc2ggdG8gZ2l2ZSBhIHRhbGssIHNpbXBseSBzdWJtaXQgYSBkZXNpZ24gc2Vzc2lvbiB3
aXRoIGBbVEFMS11gIGFzIHRoZSBmaXJzdCBwYXJ0IG9mIHRoZSB0aXRsZS4gIFRoZSBzZXNzaW9u
IHdpbGwgYmUgc2NoZWR1bGVkIG5vcm1hbGx5IGJhc2VkIG9uIGludGVyZXN0LCBidXQgZXZlcnlv
bmUgd2lsbCBrbm93IHRoYXQgdGhlIGRpcmVjdGlvbiBvZiB0aGlzIHNlc3Npb24gd2lsbCBwcmlt
YXJpbHkgYmUgb25lLXdheS4NCg0KU29tZSB0YWxrcyB3ZSBtYXkgZW5kIHVwIOKAnHByb21vdGlu
Z+KAnSBmcm9tIGRlc2lnbiBzZXNzaW9uIHRvIG5vcm1hbGx5IHNjaGVkdWxlZCB0YWxrcy4NCg0K
TG9va2luZyBmb3J3YXJkIHRvIHNlZWluZyB5b3UgYWxsIGF0IHRoZSBTdW1taXQhDQoNCiAtR2Vv
cmdlIER1bmxhcA==

