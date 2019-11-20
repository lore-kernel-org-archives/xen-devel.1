Return-Path: <SRS0=DbOf=ZM=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=0.6 required=3.0 tests=DKIM_ADSP_ALL,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D0FAC43215
	for <xen-devel@archiver.kernel.org>; Wed, 20 Nov 2019 09:44:40 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1B82222440
	for <xen-devel@archiver.kernel.org>; Wed, 20 Nov 2019 09:44:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=amazon.com header.i=@amazon.com header.b="HlLzGizr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1B82222440
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iXMWq-0000xJ-G4; Wed, 20 Nov 2019 09:44:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=rUCm=ZM=amazon.com=prvs=220eb40af=pdurrant@srs-us1.protection.inumbo.net>)
 id 1iXMWp-0000xE-F5
 for xen-devel@lists.xenproject.org; Wed, 20 Nov 2019 09:44:03 +0000
X-Inumbo-ID: 48f246b2-0b7a-11ea-b678-bc764e2007e4
Received: from smtp-fw-6002.amazon.com (unknown [52.95.49.90])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 48f246b2-0b7a-11ea-b678-bc764e2007e4;
 Wed, 20 Nov 2019 09:44:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1574243043; x=1605779043; h=from:to:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=9u59RDPtzHDi4yamC1tlinzHMvMH+v0mhnxKGLil5So=;
 b=HlLzGizrNFksLJ4hzQJ31i2JVqC51uxqnIQSEi9BZZ5Soo9SXFuXjU47
 708VNAFU9vvlF8Jae1jNbaGF6iBw+BgJL0Av4dMpZVYcWnDeXivOyJtR8
 16ByUodpPS9Yuoc38U2+dXlBpbSXkXmLHS+6Hfb1bVIXa6nwyYjkgpWE5 4=;
IronPort-SDR: 5VmkMSrmPOFd7a2dVXdSynF982ZLBG7W4CAhFJnTmKTgcBTekMBfekW8fxMIJG6/38th5tuWZx
 OyLOJ2DDbIWg==
X-IronPort-AV: E=Sophos;i="5.69,221,1571702400"; 
   d="scan'208";a="3963226"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-2b-5bdc5131.us-west-2.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-6002.iad6.amazon.com with ESMTP;
 20 Nov 2019 09:44:02 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan3.pdx.amazon.com [10.170.41.166])
 by email-inbound-relay-2b-5bdc5131.us-west-2.amazon.com (Postfix) with ESMTPS
 id 60150A221C
 for <xen-devel@lists.xenproject.org>; Wed, 20 Nov 2019 09:44:01 +0000 (UTC)
Received: from EX13D32EUC004.ant.amazon.com (10.43.164.121) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 20 Nov 2019 09:44:00 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC004.ant.amazon.com (10.43.164.121) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 20 Nov 2019 09:44:00 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Wed, 20 Nov 2019 09:43:59 +0000
From: "Durrant, Paul" <pdurrant@amazon.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: grant table size
Thread-Index: AdWfhQwGXUKIxbF7Q62ckygVPo3ZWw==
Date: Wed, 20 Nov 2019 09:43:59 +0000
Message-ID: <08f386b1d300432384c27ba9a97be697@EX13D32EUC003.ant.amazon.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.164.128]
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] grant table size
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SSd2ZSBkZWFsdCB3aXRoIGEgZmV3IHByb2JsZW1zIG92ZXIgdGhlIHllYXJzIHdoZXJlIHRoZSBy
b290IGNhdXNlIHdhcyBhIGd1ZXN0IHJ1bm5pbmcgb3V0IG9mIGdyYW50IHRhYmxlIGFuZCBzbyBJ
J20gd29uZGVyaW5nIHdoZXRoZXIgaXQgd291bGQgYmUgYSBnb29kIGlkZWEgdG8gYWxsb3cgYSB0
b29sc3RhY2sgdG8gaW5jcmVhc2UgdGhlIHRhYmxlIHNpemUgb2YgYSBydW5uaW5nIGd1ZXN0LCBl
LmcuIHdoZW4gcGx1Z2dpbmcgaW4gYSBuZXcgUFYgaW50ZXJmYWNlLgpJdCB3b3VsZCBhcHBlYXIg
dGhhdCBjdXJyZW50IExpbnV4IGd1ZXN0cyB3b3VsZCBub3QgYmUgYWJsZSB0byBtYWtlIHVzZSBv
ZiB0aGlzIGFzIGl0IHN0YW5kcyAoYnV0IHRoYXQgY291bGQgYmUgZml4ZWQpLCBidXQgYXMgZmFy
IGFzIEkgY2FuIHRlbGwgYSBwdm9wcyBrZXJuZWwgd291bGQgbm90IG1pc2JlaGF2ZSBpZiB0aGUg
bWF4aW11bSB0YWJsZSBzaXplIHdlcmUgdG8gaW5jcmVhc2UuIFNpbWlsYXJseSBXaW5kb3dzIFBW
IGRyaXZlcnMgd291bGQgbmVlZCBtb2RpZmljYXRpb24gdG8gbWFrZSB1c2Ugb2YgYSBkeW5hbWlj
IG1heGltdW0gdGFibGUgc2l6ZSBidXQgd291bGQgbm90IG1pc2JlaGF2ZSBhcyBpcy4KRG9lcyBh
bnlvbmUgaGF2ZSBhbnkgb2JqZWN0aW9uIHRvIHRoZSBpZGVhPwoKICBQYXVsIAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
