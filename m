Return-Path: <SRS0=MKw+=S2=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=3.0 tests=FROM_EXCESS_BASE64,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A09AC10F11
	for <xen-devel@archiver.kernel.org>; Wed, 24 Apr 2019 14:48:20 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E5E90218FD
	for <xen-devel@archiver.kernel.org>; Wed, 24 Apr 2019 14:48:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E5E90218FD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hJJBr-0004BJ-F0; Wed, 24 Apr 2019 14:48:03 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Rs1d=S2=citrix.com=prvs=010ed0f85=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hJJBq-0004BE-FZ
 for xen-devel@lists.xenproject.org; Wed, 24 Apr 2019 14:48:02 +0000
X-Inumbo-ID: f469a6f4-669f-11e9-92d7-bc764e045a96
Received: from SMTP.EU.CITRIX.COM (unknown [185.25.65.24])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id f469a6f4-669f-11e9-92d7-bc764e045a96;
 Wed, 24 Apr 2019 14:48:00 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,390,1549929600"; d="scan'208";a="89236995"
Date: Wed, 24 Apr 2019 16:46:58 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
Message-ID: <20190424144658.k4hrjj2rxykh4qd6@Air-de-Roger>
References: <20190424142718.14721-1-aisaila@bitdefender.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190424142718.14721-1-aisaila@bitdefender.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
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
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190424144658.4yJ_2DVq8xlAo09K6vP-gao-h9E3bG1LDl9moQQwUjY@z>

T24gV2VkLCBBcHIgMjQsIDIwMTkgYXQgMDI6Mjc6MzJQTSArMDAwMCwgQWxleGFuZHJ1IFN0ZWZh
biBJU0FJTEEgd3JvdGU6Cj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9tbS9wMm0uYyBiL3hl
bi9hcmNoL3g4Ni9tbS9wMm0uYwo+IGluZGV4IDllODFhMzBjYzQuLjI3Njk3ZDVhNzcgMTAwNjQ0
Cj4gLS0tIGEveGVuL2FyY2gveDg2L21tL3AybS5jCj4gKysrIGIveGVuL2FyY2gveDg2L21tL3Ay
bS5jCj4gQEAgLTEwMjgsNyArMTAyOCw3IEBAIGludCBwMm1fY2hhbmdlX3R5cGVfb25lKHN0cnVj
dCBkb21haW4gKmQsIHVuc2lnbmVkIGxvbmcgZ2ZuX2wsCj4gIH0KPiAgCj4gIC8qIE1vZGlmeSB0
aGUgcDJtIHR5cGUgb2YgW3N0YXJ0LCBlbmRfZXhjbHVzaXZlKSBmcm9tIG90IHRvIG50LiAqLwo+
IC1zdGF0aWMgdm9pZCBjaGFuZ2VfdHlwZV9yYW5nZShzdHJ1Y3QgcDJtX2RvbWFpbiAqcDJtLAo+
ICtzdGF0aWMgaW50IGNoYW5nZV90eXBlX3JhbmdlKHN0cnVjdCBwMm1fZG9tYWluICpwMm0sCj4g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgc3RhcnQsIHVuc2ln
bmVkIGxvbmcgZW5kX2V4Y2x1c2l2ZSwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
cDJtX3R5cGVfdCBvdCwgcDJtX3R5cGVfdCBudCkKPiAgewo+IEBAIC0xMDUzLDE1ICsxMDUzLDEx
IEBAIHN0YXRpYyB2b2lkIGNoYW5nZV90eXBlX3JhbmdlKHN0cnVjdCBwMm1fZG9tYWluICpwMm0s
Cj4gICAgICAgKiBUaGlzIHNob3VsZCBiZSByZXZpc2l0ZWQgbGF0ZXIsIGJ1dCBmb3Igbm93IHBv
c3QgYSB3YXJuaW5nLgo+ICAgICAgICovCj4gICAgICBpZiAoIHVubGlrZWx5KGVuZCA+IGhvc3Rf
bWF4X3BmbikgKQo+IC0gICAgewo+IC0gICAgICAgIHByaW50ayhYRU5MT0dfR19XQVJOSU5HICJE
b20lZCBsb2dkaXJ0eSByYW5nZXNldCBjbGlwcGVkIHRvIG1heF9tYXBwZWRfcGZuXG4iLAo+IC0g
ICAgICAgICAgICAgICBkLT5kb21haW5faWQpOwo+IC0gICAgICAgIGVuZCA9IGludmFsaWRhdGVf
ZW5kID0gaG9zdF9tYXhfcGZuOwo+IC0gICAgfQo+ICsgICAgICAgIHJldHVybiAtRUlOVkFMOwo+
ICAKPiAgICAgIC8qIElmIHRoZSByZXF1ZXN0ZWQgcmFuZ2UgaXMgb3V0IG9mIHNjb3BlLCByZXR1
cm4gZG9pbmcgbm90aGluZy4gKi8KPiAgICAgIGlmICggc3RhcnQgPiBlbmQgKQo+IC0gICAgICAg
IHJldHVybjsKPiArICAgICAgICByZXR1cm4gMDsKClNpbmNlIHlvdSBhcmUgYWxyZWFkeSBjaGFu
Z2luZyB0aGUgYmVoYXZpb3Igb2YgdGhlIGZ1bmN0aW9uIGFib3ZlIHRoaXMKc2hvdWxkIGFsc28g
cmV0dXJuIEVJTlZBTCBJTU8uCgo+ICAKPiAgICAgIGlmICggcDJtX2lzX2FsdHAybShwMm0pICkK
PiAgICAgICAgICBpbnZhbGlkYXRlX2VuZCA9IG1pbihpbnZhbGlkYXRlX2VuZCwgbWF4X3Bmbik7
Cj4gQEAgLTExMTUsMTMgKzExMTEsMTYgQEAgc3RhdGljIHZvaWQgY2hhbmdlX3R5cGVfcmFuZ2Uo
c3RydWN0IHAybV9kb21haW4gKnAybSwKPiAgICAgICAgICAgICAgICAgcmMsIGQtPmRvbWFpbl9p
ZCk7Cj4gICAgICAgICAgZG9tYWluX2NyYXNoKGQpOwo+ICAgICAgfQo+ICsKPiArICAgIHJldHVy
biAwOwoKSGVyZSB5b3Ugc2hvdWxkIHVzZSAncmV0dXJuIHJjOycsIG9yIGVsc2UgeW91IGFyZSBk
cm9wcGluZyB0aGUgZXJyb3IKY29kZSBmcm9tIHRoZSBjYWxscyBmcm9tIHRoZSByYW5nZXNldCBm
dW5jdGlvbnMuCgpJdCB3b3VsZCBiZSB3b3J0aCB0byBjb25zaWRlciB3aGVyZSB0aGUgZG9tYWlu
X2NyYXNoIHBhdGhzIGluIHRoZQpmdW5jdGlvbiBjb3VsZCBiZSBmb2xsb3dlZCBieSBhIHJldHVy
biByYywgc28gdGhhdCB5b3UgZG9uJ3QgbG9zZSB0aGUKZXJyb3IgY29kZSBmcm9tIHRoZSBjYWxs
IHRvIGNoYW5nZV9lbnRyeV90eXBlX3JhbmdlLgoKPiAgfQo+ICAKPiAtdm9pZCBwMm1fY2hhbmdl
X3R5cGVfcmFuZ2Uoc3RydWN0IGRvbWFpbiAqZCwKPiAtICAgICAgICAgICAgICAgICAgICAgICAg
ICAgdW5zaWduZWQgbG9uZyBzdGFydCwgdW5zaWduZWQgbG9uZyBlbmQsCj4gLSAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHAybV90eXBlX3Qgb3QsIHAybV90eXBlX3QgbnQpCj4gK2ludCBwMm1f
Y2hhbmdlX3R5cGVfcmFuZ2Uoc3RydWN0IGRvbWFpbiAqZCwKPiArICAgICAgICAgICAgICAgICAg
ICAgICAgICB1bnNpZ25lZCBsb25nIHN0YXJ0LCB1bnNpZ25lZCBsb25nIGVuZCwKPiArICAgICAg
ICAgICAgICAgICAgICAgICAgICBwMm1fdHlwZV90IG90LCBwMm1fdHlwZV90IG50KQo+ICB7Cj4g
ICAgICBzdHJ1Y3QgcDJtX2RvbWFpbiAqaG9zdHAybSA9IHAybV9nZXRfaG9zdHAybShkKTsKPiAr
ICAgIGludCByYyA9IDA7CgpJIGRvbid0IHRoaW5rIHlvdSBuZWVkIHRvIGluaXRpYWxpemUgcmMs
IGl0IHdpbGwgYmUgdW5jb25kaXRpb25hbGx5CmluaXRpYWxpemVkIGJ5IHRoZSBjYWxsIHRvIGNo
YW5nZV90eXBlX3JhbmdlIGJlbG93LgoKVGhhbmtzLCBSb2dlci4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
