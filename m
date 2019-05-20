Return-Path: <SRS0=/voU=TU=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63B77C04AAF
	for <xen-devel@archiver.kernel.org>; Mon, 20 May 2019 08:24:47 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4158D20815
	for <xen-devel@archiver.kernel.org>; Mon, 20 May 2019 08:24:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4158D20815
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hSdat-0005uh-M0; Mon, 20 May 2019 08:24:27 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=gSYI=TU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hSdas-0005uc-0k
 for xen-devel@lists.xenproject.org; Mon, 20 May 2019 08:24:26 +0000
X-Inumbo-ID: acbcfbd6-7ad8-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id acbcfbd6-7ad8-11e9-8980-bc764e045a96;
 Mon, 20 May 2019 08:24:24 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Mon, 20 May 2019 02:24:23 -0600
Message-Id: <5CE2643502000078002307B2@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Mon, 20 May 2019 02:24:21 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Andrew Cooper" <andrew.cooper3@citrix.com>
References: <1558119524-318-1-git-send-email-andrew.cooper3@citrix.com>
In-Reply-To: <1558119524-318-1-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH 1/2] xen/lib: Introduce printk_once() and
 replace some opencoded examples
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
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190520082421.V_TfcxeXa-TOgL2LUQs-3jDRHgZ8RgEYl9dvqg0yQVk@z>

Pj4+IE9uIDE3LjA1LjE5IGF0IDIwOjU4LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gUmVmbG93IHRoZSBaeW5xTVAgbWVzc2FnZSBmb3IgZ3JlcGFiaWxpdHksIGFuZCBmaXgg
dGhlIG9taXNzaW9uIG9mIGEgbmV3bGluZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29v
cGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgoKUmV2aWV3ZWQtYnk6IEphbiBCZXVsaWNo
IDxqYmV1bGljaEBzdXNlLmNvbT4Kd2l0aCB0d28gcmVtYXJrczoKCj4gLS0tIGEveGVuL2luY2x1
ZGUveGVuL2xpYi5oCj4gKysrIGIveGVuL2luY2x1ZGUveGVuL2xpYi5oCj4gQEAgLTEwNSw2ICsx
MDUsMTcgQEAgZGVidWd0cmFjZV9wcmludGsoY29uc3QgY2hhciAqZm10LCAuLi4pIHt9Cj4gICNk
ZWZpbmUgX3AoX3gpICgodm9pZCAqKSh1bnNpZ25lZCBsb25nKShfeCkpCj4gIGV4dGVybiB2b2lk
IHByaW50ayhjb25zdCBjaGFyICpmb3JtYXQsIC4uLikKPiAgICAgIF9fYXR0cmlidXRlX18gKChm
b3JtYXQgKHByaW50ZiwgMSwgMikpKTsKPiArCj4gKyNkZWZpbmUgcHJpbnRrX29uY2UoZm10LCBh
cmdzLi4uKSAgICAgICAgICAgICAgIFwKPiArKHsgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgXAo+ICsgICAgc3RhdGljIGJvb2wgX19yZWFkX21vc3RseSBvbmNl
XzsgICAgICAgICAgICBcCj4gKyAgICBpZiAoIHVubGlrZWx5KCFvbmNlXykgKSAgICAgICAgICAg
ICAgICAgICAgIFwKPiArICAgIHsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgXAo+ICsgICAgICAgIG9uY2VfID0gdHJ1ZTsgICAgICAgICAgICAgICAgICAgICAgICAg
ICBcCj4gKyAgICAgICAgcHJpbnRrKGZtdCwgIyMgYXJncyk7ICAgICAgICAgICAgICAgICAgIFwK
PiArICAgIH0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+ICt9
KQoKSnVzdCBsaWtlIExpbnV4IHdlIGFjY2VwdCB0aGlzIGhhdmluZyBhIHNtYWxsIHJhY2Ugd2lu
ZG93LCBpLmUuCml0IG5vdCB0cnVseSBiZWluZyAib25jZSIgaW4gdW5saWtlbHkgY2FzZXMuIEkg
dGhpbmsgaXQgd291bGQgYmUKd29ydGh3aGlsZSB0byBtYWtlIHRoaXMgaW50ZW50aW9uIGV4cGxp
Y2l0IGluIHRoZSBjb21taXQKbWVzc2FnZS4KClVubGlrZSBMaW51eCdlcyB0aGUgbWFjcm8gZG9l
c24ndCBoYXZlIGEgInJldHVybiB2YWx1ZSIuIElzCnRoaXMgaW50ZW50aW9uYWw/IEkgdmlldyB0
aGlzIGFzIHBhcnRpY3VsYXJseSB1c2VmdWwgZm9yIHRoZQpXQVJOX09OQ0UoKSBzb3J0LW9mIGNv
dW50ZXJwYXJ0LCBidXQgSSBoYXZlIHRvIGFkbWl0IEkgY2FuJ3QKaW1tZWRpYXRlbHkgc2VlIGEg
Z29vZCB1c2UgaGVyZSwgc28gSSdtIGxhcmdlbHkgY3VyaW91cy4KKFRoZSAyIHVzZXMgSSBjb3Vs
ZCBmaW5kIGluIHg4Ni1zcGVjaWZpYyBjb2RlIGluIExpbnV4IGxvb2sKdG8gbWUgbGlrZSB0aGV5
J2QgYmV0dGVyIGJlIFdBUk5fT05DRSgpLikKCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
