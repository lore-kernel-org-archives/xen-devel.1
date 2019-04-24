Return-Path: <SRS0=MKw+=S2=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34495C10F11
	for <xen-devel@archiver.kernel.org>; Wed, 24 Apr 2019 14:59:42 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0D2922084F
	for <xen-devel@archiver.kernel.org>; Wed, 24 Apr 2019 14:59:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0D2922084F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bitdefender.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hJJMq-00058A-1r; Wed, 24 Apr 2019 14:59:24 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Ea5E=S2=bitdefender.com=rcojocaru@srs-us1.protection.inumbo.net>)
 id 1hJJMp-000585-1Q
 for xen-devel@lists.xenproject.org; Wed, 24 Apr 2019 14:59:23 +0000
X-Inumbo-ID: 8a3408a5-66a1-11e9-92d7-bc764e045a96
Received: from mx01.bbu.dsd.mx.bitdefender.com (unknown [91.199.104.161])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 8a3408a5-66a1-11e9-92d7-bc764e045a96;
 Wed, 24 Apr 2019 14:59:21 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp02.buh.bitdefender.net [10.17.80.76])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 D7573301AB20; Wed, 24 Apr 2019 17:59:19 +0300 (EEST)
Received: from [10.10.196.90] (unknown [195.210.5.22])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id C96F4306E4AC;
 Wed, 24 Apr 2019 17:59:19 +0300 (EEST)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Alexandru Stefan ISAILA <aisaila@bitdefender.com>
References: <20190424142718.14721-1-aisaila@bitdefender.com>
 <20190424144658.k4hrjj2rxykh4qd6@Air-de-Roger>
From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Message-ID: <a7e91022-7ca0-594b-cb07-3ac517f98f2a@bitdefender.com>
Date: Wed, 24 Apr 2019 17:59:06 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190424144658.k4hrjj2rxykh4qd6@Air-de-Roger>
Content-Language: en-US-large
Subject: Re: [Xen-devel] [PATCH v1] x86/mm: Make change_type_range return
 error
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
Cc: "george.dunlap@eu.citrix.com" <george.dunlap@eu.citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "wei.liu2@citrix.com" <wei.liu2@citrix.com>,
 "jbeulich@suse.com" <jbeulich@suse.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="UTF-8"; format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190424145906.YU4I_Gm_EcLt9lEpeCCIY0AVdjej9WICXJjSn35FvcM@z>

T24gNC8yNC8xOSA1OjQ2IFBNLCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOgo+IE9uIFdlZCwgQXBy
IDI0LCAyMDE5IGF0IDAyOjI3OjMyUE0gKzAwMDAsIEFsZXhhbmRydSBTdGVmYW4gSVNBSUxBIHdy
b3RlOgo+PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L21tL3AybS5jIGIveGVuL2FyY2gveDg2
L21tL3AybS5jCj4+IGluZGV4IDllODFhMzBjYzQuLjI3Njk3ZDVhNzcgMTAwNjQ0Cj4+IC0tLSBh
L3hlbi9hcmNoL3g4Ni9tbS9wMm0uYwo+PiArKysgYi94ZW4vYXJjaC94ODYvbW0vcDJtLmMKPj4g
QEAgLTEwMjgsNyArMTAyOCw3IEBAIGludCBwMm1fY2hhbmdlX3R5cGVfb25lKHN0cnVjdCBkb21h
aW4gKmQsIHVuc2lnbmVkIGxvbmcgZ2ZuX2wsCj4+ICAgfQo+PiAgIAo+PiAgIC8qIE1vZGlmeSB0
aGUgcDJtIHR5cGUgb2YgW3N0YXJ0LCBlbmRfZXhjbHVzaXZlKSBmcm9tIG90IHRvIG50LiAqLwo+
PiAtc3RhdGljIHZvaWQgY2hhbmdlX3R5cGVfcmFuZ2Uoc3RydWN0IHAybV9kb21haW4gKnAybSwK
Pj4gK3N0YXRpYyBpbnQgY2hhbmdlX3R5cGVfcmFuZ2Uoc3RydWN0IHAybV9kb21haW4gKnAybSwK
Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBsb25nIHN0YXJ0LCB1
bnNpZ25lZCBsb25nIGVuZF9leGNsdXNpdmUsCj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgcDJtX3R5cGVfdCBvdCwgcDJtX3R5cGVfdCBudCkKPj4gICB7Cj4+IEBAIC0xMDUzLDE1
ICsxMDUzLDExIEBAIHN0YXRpYyB2b2lkIGNoYW5nZV90eXBlX3JhbmdlKHN0cnVjdCBwMm1fZG9t
YWluICpwMm0sCj4+ICAgICAgICAqIFRoaXMgc2hvdWxkIGJlIHJldmlzaXRlZCBsYXRlciwgYnV0
IGZvciBub3cgcG9zdCBhIHdhcm5pbmcuCj4+ICAgICAgICAqLwo+PiAgICAgICBpZiAoIHVubGlr
ZWx5KGVuZCA+IGhvc3RfbWF4X3BmbikgKQo+PiAtICAgIHsKPj4gLSAgICAgICAgcHJpbnRrKFhF
TkxPR19HX1dBUk5JTkcgIkRvbSVkIGxvZ2RpcnR5IHJhbmdlc2V0IGNsaXBwZWQgdG8gbWF4X21h
cHBlZF9wZm5cbiIsCj4+IC0gICAgICAgICAgICAgICBkLT5kb21haW5faWQpOwo+PiAtICAgICAg
ICBlbmQgPSBpbnZhbGlkYXRlX2VuZCA9IGhvc3RfbWF4X3BmbjsKPj4gLSAgICB9Cj4+ICsgICAg
ICAgIHJldHVybiAtRUlOVkFMOwo+PiAgIAo+PiAgICAgICAvKiBJZiB0aGUgcmVxdWVzdGVkIHJh
bmdlIGlzIG91dCBvZiBzY29wZSwgcmV0dXJuIGRvaW5nIG5vdGhpbmcuICovCj4+ICAgICAgIGlm
ICggc3RhcnQgPiBlbmQgKQo+PiAtICAgICAgICByZXR1cm47Cj4+ICsgICAgICAgIHJldHVybiAw
Owo+IAo+IFNpbmNlIHlvdSBhcmUgYWxyZWFkeSBjaGFuZ2luZyB0aGUgYmVoYXZpb3Igb2YgdGhl
IGZ1bmN0aW9uIGFib3ZlIHRoaXMKPiBzaG91bGQgYWxzbyByZXR1cm4gRUlOVkFMIElNTy4KCk15
IGZhdWx0LCBJIHN1Z2dlc3RlZCAwIHRoZXJlLiA6KQoKClRoYW5rcywKUmF6dmFuCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
