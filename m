Return-Path: <SRS0=kbZc=SS=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2D02C10F13
	for <xen-devel@archiver.kernel.org>; Tue, 16 Apr 2019 13:52:35 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AD107222B2
	for <xen-devel@archiver.kernel.org>; Tue, 16 Apr 2019 13:52:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AD107222B2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hGOVW-0001hw-RY; Tue, 16 Apr 2019 13:52:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=19lK=SS=citrix.com=prvs=002fb28a9=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hGOVW-0001hr-BV
 for xen-devel@lists.xenproject.org; Tue, 16 Apr 2019 13:52:18 +0000
X-Inumbo-ID: d5d07b1c-604e-11e9-ac71-eb43fcfa25a7
Received: from SMTP.EU.CITRIX.COM (unknown [185.25.65.24])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d5d07b1c-604e-11e9-ac71-eb43fcfa25a7;
 Tue, 16 Apr 2019 13:52:13 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,358,1549929600"; d="scan'208";a="88899454"
To: Tamas K Lengyel <tamas@tklengyel.com>, Alexandru Stefan ISAILA
 <aisaila@bitdefender.com>
References: <20190416084531.5084-1-aisaila@bitdefender.com>
 <CABfawhncF-r0ZYwd-V9D4UkpmqA22+kca5YTeuMVHm2A4xSCOg@mail.gmail.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <55fc24f5-8f6e-08d5-3e9d-946de804d83b@citrix.com>
Date: Tue, 16 Apr 2019 14:51:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CABfawhncF-r0ZYwd-V9D4UkpmqA22+kca5YTeuMVHm2A4xSCOg@mail.gmail.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v5] x86/altp2m: Aggregate get entry and
 populate into common funcs
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
Cc: "wei.liu2@citrix.com" <wei.liu2@citrix.com>,
 "rcojocaru@bitdefender.com" <rcojocaru@bitdefender.com>,
 "george.dunlap@eu.citrix.com" <george.dunlap@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 "jbeulich@suse.com" <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190416135123.jzix5zLE5qiJBygBb4oTeNVFx5vqHqH7iCdXMubP5ks@z>

T24gMTYvMDQvMjAxOSAxNDo0NCwgVGFtYXMgSyBMZW5neWVsIHdyb3RlOgo+Cj4+IGRpZmYgLS1n
aXQgYS94ZW4vaW5jbHVkZS9hc20teDg2L3AybS5oIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9wMm0u
aAo+PiBpbmRleCAyODAxYThjY2NhLi44ZGM0MzUzNjQ1IDEwMDY0NAo+PiAtLS0gYS94ZW4vaW5j
bHVkZS9hc20teDg2L3AybS5oCj4+ICsrKyBiL3hlbi9pbmNsdWRlL2FzbS14ODYvcDJtLmgKPj4g
QEAgLTUxNCw2ICs1MTQsMjMgQEAgc3RhdGljIGlubGluZSB1bnNpZ25lZCBsb25nIG1mbl90b19n
Zm4oc3RydWN0IGRvbWFpbiAqZCwgbWZuX3QgbWZuKQo+PiAgICAgICAgICByZXR1cm4gbWZuX3go
bWZuKTsKPj4gIH0KPj4KPj4gK2ludCBhbHRwMm1fZ2V0X2VudHJ5KHN0cnVjdCBwMm1fZG9tYWlu
ICphcDJtLCBnZm5fdCBnZm4sIG1mbl90ICptZm4sCj4+ICsgICAgICAgICAgICAgICAgICAgICBw
Mm1fdHlwZV90ICp0LCBwMm1fYWNjZXNzX3QgKmEsIGJvb2wgcHJlcG9wdWxhdGUpOwo+PiArCj4+
ICtzdGF0aWMgaW5saW5lIGludCBhbHRwMm1fZ2V0X2VudHJ5X2RpcmVjdChzdHJ1Y3QgcDJtX2Rv
bWFpbiAqYXAybSwKPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IGdmbl90IGdmbiwgbWZuX3QgKm1mbiwKPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHAybV90eXBlX3QgKnQsIHAybV9hY2Nlc3NfdCAqYSkKPj4gK3sKPj4gKyAg
ICByZXR1cm4gYWx0cDJtX2dldF9lbnRyeShhcDJtLCBnZm4sIG1mbiwgdCwgYSwgZmFsc2UpOwo+
PiArfQo+PiArCj4+ICtzdGF0aWMgaW5saW5lIGludCBhbHRwMm1fZ2V0X2VudHJ5X3ByZXBvcHVs
YXRlKHN0cnVjdCBwMm1fZG9tYWluICphcDJtLAo+PiArICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBnZm5fdCBnZm4sIG1mbl90ICptZm4sCj4+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHAybV90eXBlX3QgKnQsIHAy
bV9hY2Nlc3NfdCAqYSkKPj4gK3sKPj4gKyAgICByZXR1cm4gYWx0cDJtX2dldF9lbnRyeShhcDJt
LCBnZm4sIG1mbiwgdCwgYSwgdHJ1ZSk7Cj4+ICt9Cj4gQXJlIHRoZXNlIHdyYXBwZXJzIHJlYWxs
eSByZXF1aXJlZD8gSSBkb24ndCB0aGluayB0aGV5IGFkZCBhbnl0aGluZyB0bwo+IHJlYWRhYmls
aXR5LCBpdCdzIGp1c3QgeWV0IGFub3RoZXIgbGF5ZXIgdGhhdCBkb2VzIGFsbW9zdCBub3RoaW5n
LgoKRnJvbSBhIHJlYWRhYmlsaXR5IHBvaW50IG9mIHZpZXcsIGJvb2xlYW4gcGFyYW1ldGVycyBh
cmUgYWJvdXQgYXMgb3BhcXVlCmFzIHRoZXkgY29tZS7CoCBUaGUgc2FtZSBnb2VzIGZvciBhbGwg
b3RoZXIgc2NhbGFyIHBhcmFtZXRlcnMgd2hpY2ggZG9uJ3QKaGF2ZSBhIG1uZW1vbmljLgoKRm9y
IHNvbWVvbmUgd2hvIGlzIG5vdCBhbiBleHBlcnQgb2YgdGhlIGludHJpY2FjaWVzIG9mIHRoZSBz
dWJzeXN0ZW0sCmhhdmluZyB0aGUgb3B0aW9ucyBzcGVsdCBvdXQgaW4gd3JhcHBlcnMgbGlrZSB0
aGlzIGlzIGV4dHJlbWVseSBoZWxwZnVsCnRvIHJlZHVjZSB0aGUgY29nbml0aXZlIGxvYWQgb2Yg
dHJ5aW5nIHRvIGZvbGxvdyB0aGUgY29kZS4KCklmIGl0IHdlcmUgdXAgdG8gbWUsIGFsbCBvZiBv
dXIgY29kZSB3b3VsZCBiZSB3cmFwcGVkIGxpa2UgdGhpcywgYnV0IEkKa25vdyB0aGF0IG90aGVy
cyBoYXZlIGRpZmZlcmluZyBvcGluaW9ucy4KCn5BbmRyZXcKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
