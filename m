Return-Path: <SRS0=7RrO=SN=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 553DAC10F13
	for <xen-devel@archiver.kernel.org>; Thu, 11 Apr 2019 14:41:37 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2B0862184B
	for <xen-devel@archiver.kernel.org>; Thu, 11 Apr 2019 14:41:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2B0862184B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hEatB-0001Gv-Lq; Thu, 11 Apr 2019 14:41:17 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=5H/f=SN=citrix.com=prvs=9971fd090=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hEat9-0001Gq-To
 for xen-devel@lists.xenproject.org; Thu, 11 Apr 2019 14:41:15 +0000
X-Inumbo-ID: db074623-5c67-11e9-92d7-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id db074623-5c67-11e9-92d7-bc764e045a96;
 Thu, 11 Apr 2019 14:41:14 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,337,1549929600"; d="scan'208";a="83341032"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23727.20931.802437.241828@mariner.uk.xensource.com>
Date: Thu, 11 Apr 2019 15:40:03 +0100
To: <xen-devel@lists.xenproject.org>
In-Reply-To: <osstest-134621-mainreport@xen.org>
References: <osstest-134621-mainreport@xen.org>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: [Xen-devel] osstest force push (Re: [osstest test] 134621:
 regressions - trouble: blocked/broken/fail/pass)
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
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190411144003.vlTUtmjREVsjymSW7-_8gRJxDfWL5AHjVMJoAxQCxeE@z>

b3NzdGVzdCBzZXJ2aWNlIG93bmVyIHdyaXRlcyAoIltvc3N0ZXN0IHRlc3RdIDEzNDYyMTogcmVn
cmVzc2lvbnMgLSB0cm91YmxlOiBibG9ja2VkL2Jyb2tlbi9mYWlsL3Bhc3MiKToKPiBmbGlnaHQg
MTM0NjIxIG9zc3Rlc3QgcmVhbCBbcmVhbF0KPiBodHRwOi8vbG9ncy50ZXN0LWxhYi54ZW5wcm9q
ZWN0Lm9yZy9vc3N0ZXN0L2xvZ3MvMTM0NjIxLwo+IAo+IFJlZ3Jlc3Npb25zIDotKAo+IAo+IFRl
c3RzIHdoaWNoIGRpZCBub3Qgc3VjY2VlZCBhbmQgYXJlIGJsb2NraW5nLAo+IGluY2x1ZGluZyB0
ZXN0cyB3aGljaCBjb3VsZCBub3QgYmUgcnVuOgo+ICBidWlsZC1hcm02NCAgICAgICAgICAgICAg
ICAgICAgIDxqb2Igc3RhdHVzPiAgICAgICAgICAgICAgICAgYnJva2VuCj4gIGJ1aWxkLWFybTY0
ICAgICAgICAgICAgICAgICAgIDQgaG9zdC1pbnN0YWxsKDQpICAgICAgICBicm9rZW4gUkVHUi4g
dnMuIDEzMzcyMgo+ICB0ZXN0LWFybTY0LWFybTY0LXhsICAgICAgICAgICAgIDxqb2Igc3RhdHVz
PiAgICAgICAgICAgICAgICAgYnJva2VuICBpbiAxMzQ2MDgKPiAgdGVzdC1hcm02NC1hcm02NC14
bCAgICAgICAgNCBob3N0LWluc3RhbGwoNCkgYnJva2VuIGluIDEzNDYwOCBSRUdSLiB2cy4gMTMz
NzIyCgpUaGlzIGlzIHRoZSBsYXh0b24wIHBkdSBwcm9ibGVtICh3aGljaCB3YXMgdHJhbnNpZW50
KS4gIEkgYW0gZ29pbmcgdG8KZm9yY2UgcHVzaCB0aGlzLgoKPiAgdGVzdC1hcm02NC1hcm02NC1l
eGFtaW5lICAgICAgNSBob3N0LWluc3RhbGwgYnJva2VuIGluIDEzNDYwOCBSRUdSLiB2cy4gMTMz
NzIyCj4gIHRlc3QtYW1kNjQtYW1kNjQteGwtcWNvdzIgICAgMTcgZ3Vlc3QtbG9jYWxtaWdyYXRl
L3gxMCAgIGZhaWwgUkVHUi4gdnMuIDEzMzcyMgoKQWxyZWFkeSBkaXNjdXNzZWQuCgpJYW4uCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
