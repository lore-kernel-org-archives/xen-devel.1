Return-Path: <SRS0=ZpmR=ST=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCC69C282DA
	for <xen-devel@archiver.kernel.org>; Wed, 17 Apr 2019 21:12:37 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9954A217FA
	for <xen-devel@archiver.kernel.org>; Wed, 17 Apr 2019 21:12:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="bR5sYCU2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9954A217FA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hGrqu-0004vm-9t; Wed, 17 Apr 2019 21:12:20 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=CUiA=ST=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hGrqs-0004vh-8F
 for xen-devel@lists.xenproject.org; Wed, 17 Apr 2019 21:12:18 +0000
X-Inumbo-ID: 7a71510f-6155-11e9-92d7-bc764e045a96
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 7a71510f-6155-11e9-92d7-bc764e045a96;
 Wed, 17 Apr 2019 21:12:16 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0F344217FA;
 Wed, 17 Apr 2019 21:12:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1555535536;
 bh=MP7DCCEXd3rSnw3l5GQh4E6jej3pBAQtFVDPX1EswEc=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=bR5sYCU2XS/z5Bu+4fMcd0XaTWQ9B95tuoTndC9UjCpmnh+KwbU4jjYbLGcBefMby
 l9XAU4PpD93W2ydlljY2YUWnBbpQXQEXkqTKxRcgfYsWqdXLxJCfayPp95J0tBkPQc
 Xu5pGEUWihA404GXtpYW45dC9or8G7XlNiYmOeMQ=
Date: Wed, 17 Apr 2019 14:12:15 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-X260
To: Jan Beulich <JBeulich@suse.com>
In-Reply-To: <5C766799020000780021AA28@prv1-mh.provo.novell.com>
Message-ID: <alpine.DEB.2.10.1904171359470.1370@sstabellini-ThinkPad-X260>
References: <alpine.DEB.2.10.1902261501020.20689@sstabellini-ThinkPad-X260>
 <1551222427-21749-1-git-send-email-sstabellini@kernel.org>
 <5C766799020000780021AA28@prv1-mh.provo.novell.com>
User-Agent: Alpine 2.10 (DEB 1266 2009-07-14)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH 1/6] xen: extend XEN_DOMCTL_memory_mapping
 to handle cacheability
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
 Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Stefano Stabellini <stefanos@xilinx.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190417211215.zSyj1GzWc7mraA8A2Imr6K_vaEetHOm---yYtkurOJw@z>

T24gV2VkLCAyNyBGZWIgMjAxOSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gPj4+IE9uIDI3LjAyLjE5
IGF0IDAwOjA3LCA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4gd3JvdGU6Cj4gPiAtLS0gYS94ZW4v
aW5jbHVkZS9wdWJsaWMvZG9tY3RsLmgKPiA+ICsrKyBiL3hlbi9pbmNsdWRlL3B1YmxpYy9kb21j
dGwuaAo+ID4gQEAgLTU3MSwxMiArNTcxLDE0IEBAIHN0cnVjdCB4ZW5fZG9tY3RsX2JpbmRfcHRf
aXJxIHsKPiA+ICAqLwo+ID4gICNkZWZpbmUgRFBDSV9BRERfTUFQUElORyAgICAgICAgIDEKPiA+
ICAjZGVmaW5lIERQQ0lfUkVNT1ZFX01BUFBJTkcgICAgICAwCj4gPiArI2RlZmluZSBDQUNIRUFC
SUxJVFlfREVWTUVNICAgICAgMCAvKiBkZXZpY2UgbWVtb3J5LCB0aGUgZGVmYXVsdCAqLwo+ID4g
KyNkZWZpbmUgQ0FDSEVBQklMSVRZX01FTU9SWSAgICAgIDEgLyogbm9ybWFsIG1lbW9yeSAqLwo+
ID4gIHN0cnVjdCB4ZW5fZG9tY3RsX21lbW9yeV9tYXBwaW5nIHsKPiA+ICAgICAgdWludDY0X2Fs
aWduZWRfdCBmaXJzdF9nZm47IC8qIGZpcnN0IHBhZ2UgKGh2bSBndWVzdCBwaHlzIHBhZ2UpIGlu
IHJhbmdlICovCj4gPiAgICAgIHVpbnQ2NF9hbGlnbmVkX3QgZmlyc3RfbWZuOyAvKiBmaXJzdCBw
YWdlIChtYWNoaW5lIHBhZ2UpIGluIHJhbmdlICovCj4gPiAgICAgIHVpbnQ2NF9hbGlnbmVkX3Qg
bnJfbWZuczsgICAvKiBudW1iZXIgb2YgcGFnZXMgaW4gcmFuZ2UgKD4wKSAqLwo+ID4gICAgICB1
aW50MzJfdCBhZGRfbWFwcGluZzsgICAgICAgLyogYWRkIG9yIHJlbW92ZSBtYXBwaW5nICovCj4g
PiAtICAgIHVpbnQzMl90IHBhZGRpbmc7ICAgICAgICAgICAvKiBwYWRkaW5nIGZvciA2NC1iaXQg
YWxpZ25lZCBzdHJ1Y3R1cmUgKi8KPiA+ICsgICAgdWludDMyX3QgY2FjaGVfcG9saWN5OyAgICAg
IC8qIGNhY2hlYWJpbGl0eSBvZiB0aGUgbWVtb3J5IG1hcHBpbmcgKi8KPiA+ICB9Owo+IAo+IEkg
ZG9uJ3QgdGhpbmsgREVWTUVNIGFuZCBNRU1PUlkgYXJlIGFueXdoZXJlIG5lYXIgZGVzY3JpcHRp
dmUKPiBlbm91Z2gsIG5vciAtIGlmIHdlIHdhbnQgc3VjaCBjb250cm9sIGFueXdheSAtIGZsZXhp
YmxlIGVub3VnaC4gSQo+IHRoaW5rIHdoYXQgeW91IHdhbnQgaXMgdG8gYWN0dWFsbHkgc3BlY2lm
eSBjYWNoYWJpbGl0eSwgYWxsb3dpbmcgb24KPiB4ODYgdG8gZS5nLiBtYXAgZnJhbWUgYnVmZmVy
cyBvciBhbGlrZSBXQy4gVGhlIGF0dHJpYnV0ZSB0aGVuCj4gd291bGQgKG9idmlvdXNseSBhbmQg
bmVjZXNzYXJpbHkpIGJlIGFyY2hpdGVjdHVyZSBzcGVjaWZpYy4KClllcywgSSBhZ3JlZSB3aXRo
IHdoYXQgeW91IHdyb3RlLCBhbmQgYWxzbyB3aXRoIHdoYXQgSnVsaWVuIHdyb3RlLiBOb3cKdGhl
IHF1ZXN0aW9uIGlzIGhvdyBkbyB5b3UgYm90aCB0aGluayB0aGlzIHNob3VsZCBsb29rIGxpa2Ug
aW4gbW9yZQpkZXRhaWxzOgoKLSBhcmUgeW91IE9LIHdpdGggdXNpbmcgbWVtb3J5X3BvbGljeSBp
bnN0ZWFkIG9mIGNhY2hlX3BvbGljeSBsaWtlCiAgSnVsaWVuJ3Mgc3VnZ2VzdGVkIGFzIG5hbWUg
Zm9yIHRoZSBmaWVsZD8KLSBhcmUgeW91IE9LIHdpdGggdXNpbmcgI2RlZmluZXMgZm9yIHRoZSB2
YWx1ZXM/Ci0gc2hvdWxkIHRoZSAjZGVmaW5lcyBmb3IgYm90aCB4ODYgYW5kIEFybSBiZSBkZWZp
bmVkIGhlcmUgb3IgaW4gb3RoZXIKICBoZWFkZXJzPwotIHdoYXQgdmFsdWVzIHdvdWxkIHlvdSBs
aWtlIHRvIHNlZSBmb3IgeDg2PwoKRm9yIEFybSwgdGhlIG9uZXMgSSBjYXJlIGFib3V0IGFyZToK
Ci0gcDJtX21taW9fZGlyZWN0X2RldgotIHAybV9tbWlvX2RpcmVjdF9jCgpTbyBtYXliZToKCiNk
ZWZpbmUgQVJNX1AyTV9ESVJFQ1RfREVWICAgICAgMCAvKiBEZXZpY2UtbkduUm5FLCBkZWZhdWx0
Ki8KI2RlZmluZSBBUk1fUDJNX0RJUkVDVF9DICAgICAgICAxIC8qIFdyaXRlLWJhY2sgd3JpdGUt
YWxsb2NhdGUgKi8KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
