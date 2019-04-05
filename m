Return-Path: <SRS0=0dJu=SH=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60705C4360F
	for <xen-devel@archiver.kernel.org>; Fri,  5 Apr 2019 14:27:21 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3A7A320693
	for <xen-devel@archiver.kernel.org>; Fri,  5 Apr 2019 14:27:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3A7A320693
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hCPoE-0007Wc-Nh; Fri, 05 Apr 2019 14:27:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=KiBs=SH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hCPoE-0007WS-0o
 for xen-devel@lists.xenproject.org; Fri, 05 Apr 2019 14:27:10 +0000
X-Inumbo-ID: e31a7d70-57ae-11e9-82c5-4fe9a11cdfa5
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e31a7d70-57ae-11e9-82c5-4fe9a11cdfa5;
 Fri, 05 Apr 2019 14:27:06 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Fri, 05 Apr 2019 08:27:05 -0600
Message-Id: <5CA765B80200007800224E6D@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Fri, 05 Apr 2019 08:27:04 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "xen-devel" <xen-devel@lists.xenproject.org>
References: <5CA75E460200007800224E23@prv1-mh.provo.novell.com>
In-Reply-To: <5CA75E460200007800224E23@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [Xen-devel] [PATCH v2 2/2] x86/AMD: limit C1E disable family range
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
 Brian Woods <brian.woods@amd.com>, Wei Liu <wei.liu2@citrix.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190405142704.cn0KqwFjA1BcOoepC1Qr1WAJE9t6udV-s0aEnOY0dgM@z>

SnVzdCBsaWtlIGZvciBvdGhlciBmYW1pbHkgdmFsdWVzIG9mIDB4MTcgKHNlZSAieDg2L0FNRDog
Y29ycmVjdCBjZXJ0YWluCkZhbTE3IGNoZWNrcyIpLCBjb21taXQgMzE1N2JiNGUxMyAoIkFkZCBN
U1Igc3VwcG9ydCBmb3IgdmFyaW91cyBmZWF0dXJlCkFNRCBwcm9jZXNzb3IgZmFtaWxpZXMiKSBt
YWRlIHRoZSBvcmlnaW5hbCBjaGVjayBmb3IgRmFtMTEgaGVyZSBpbmNsdWRlCmZhbWlsaWVzIGFs
bCB0aGUgd2F5IHVwIHRvIEZhbTE3LiBUaGUgaW52b2x2ZWQgTVNSICgweEMwMDEwMDU1KSwKaG93
ZXZlciwgaXMgZnVsbHkgcmVzZXJ2ZWQgc3RhcnRpbmcgZnJvbSBGYW0xNiwgYW5kIHRoZSB0d28g
Yml0cyBvZgppbnRlcmVzdCBhcmUgcmVzZXJ2ZWQgZm9yIEZhbTEyIGFuZCBvbndhcmRzIChhbGJl
aXQgSSBhZG1pdCBJIHdhc24ndAphYmxlIHRvIGZpbmQgYW55IEZhbTEzIGRvYykuIFJlc3RvcmUg
dGhlIHVwcGVyIGJvdW5kIHRvIGJlIEZhbTExLgoKU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2gg
PGpiZXVsaWNoQHN1c2UuY29tPgotLS0KdjI6IE5ldy4KCi0tLSBhL3hlbi9hcmNoL3g4Ni9jcHUv
YW1kLmMKKysrIGIveGVuL2FyY2gveDg2L2NwdS9hbWQuYwpAQCAtNjI4LDcgKzYyOCw3IEBAIHN0
YXRpYyB2b2lkIGluaXRfYW1kKHN0cnVjdCBjcHVpbmZvX3g4NgogCiAJc3dpdGNoKGMtPng4NikK
IAl7Ci0JY2FzZSAweGYgLi4uIDB4MTc6CisJY2FzZSAweGYgLi4uIDB4MTE6CiAJCWRpc2FibGVf
YzFlKE5VTEwpOwogCQlpZiAoYWNwaV9zbWlfY21kICYmIChhY3BpX2VuYWJsZV92YWx1ZSB8IGFj
cGlfZGlzYWJsZV92YWx1ZSkpCiAJCQlhbWRfYWNwaV9jMWVfcXVpcmsgPSB0cnVlOwoKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
