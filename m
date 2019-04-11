Return-Path: <SRS0=7RrO=SN=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1E55C10F13
	for <xen-devel@archiver.kernel.org>; Thu, 11 Apr 2019 12:51:57 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8035C2184E
	for <xen-devel@archiver.kernel.org>; Thu, 11 Apr 2019 12:51:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8035C2184E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hEZB3-0000P0-PU; Thu, 11 Apr 2019 12:51:37 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=iw/1=SN=citrix.com=prvs=99710a114=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1hEZB2-0000Ov-Jp
 for xen-devel@lists.xenproject.org; Thu, 11 Apr 2019 12:51:36 +0000
X-Inumbo-ID: 8993a487-5c58-11e9-92d7-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 8993a487-5c58-11e9-92d7-bc764e045a96;
 Thu, 11 Apr 2019 12:51:35 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,337,1549929600"; d="scan'208";a="83326359"
To: Alexandru Stefan ISAILA <aisaila@bitdefender.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "tamas@tklengyel.com" <tamas@tklengyel.com>
References: <20190409120324.13940-1-aisaila@bitdefender.com>
 <28c52232-536f-d007-4072-fbce95b44d8c@citrix.com>
 <7a64b16b-b7df-2af8-219b-5d3c4a3bf381@bitdefender.com>
From: George Dunlap <george.dunlap@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=george.dunlap@citrix.com; prefer-encrypt=mutual; keydata=
 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
 rIFfe2Dk+lD9A9BVd2rfoHA=
Message-ID: <21a454d7-fc0e-5d44-9991-680582752989@citrix.com>
Date: Thu, 11 Apr 2019 13:50:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <7a64b16b-b7df-2af8-219b-5d3c4a3bf381@bitdefender.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 1/3] x86/mm: Introduce
 altp2m_get_gfn_type_access
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
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "jbeulich@suse.com" <jbeulich@suse.com>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190411125026.ACe9tIEG5Vu7yYN48JCmQfR-IlbYGzynPbZMpbqz-2A@z>

T24gNC8xMS8xOSAxOjE3IFBNLCBBbGV4YW5kcnUgU3RlZmFuIElTQUlMQSB3cm90ZToKPj4+IGRp
ZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvbW0vcDJtLmMgYi94ZW4vYXJjaC94ODYvbW0vcDJtLmMK
Pj4+IGluZGV4IGI5YmJiOGY0ODUuLmQzOGQ3YzI5Y2EgMTAwNjQ0Cj4+PiAtLS0gYS94ZW4vYXJj
aC94ODYvbW0vcDJtLmMKPj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni9tbS9wMm0uYwo+Pj4gQEAgLTI2
MjYsNiArMjYyNiw3IEBAIGludCBwMm1fY2hhbmdlX2FsdHAybV9nZm4oc3RydWN0IGRvbWFpbiAq
ZCwgdW5zaWduZWQgaW50IGlkeCwKPj4+ICAgICAgIG1mbl90IG1mbjsKPj4+ICAgICAgIHVuc2ln
bmVkIGludCBwYWdlX29yZGVyOwo+Pj4gICAgICAgaW50IHJjID0gLUVJTlZBTDsKPj4+ICsgICAg
Ym9vbCBjb3BpZWRfZnJvbV9ob3N0cDJtOwo+Pj4gICAKPj4+ICAgICAgIGlmICggaWR4ID49IE1B
WF9BTFRQMk0gfHwgZC0+YXJjaC5hbHRwMm1fZXB0cFtpZHhdID09IG1mbl94KElOVkFMSURfTUZO
KSApCj4+PiAgICAgICAgICAgcmV0dXJuIHJjOwo+Pj4gQEAgLTI2MzYsNyArMjYzNyw3IEBAIGlu
dCBwMm1fY2hhbmdlX2FsdHAybV9nZm4oc3RydWN0IGRvbWFpbiAqZCwgdW5zaWduZWQgaW50IGlk
eCwKPj4+ICAgICAgIHAybV9sb2NrKGhwMm0pOwo+Pj4gICAgICAgcDJtX2xvY2soYXAybSk7Cj4+
PiAgIAo+Pj4gLSAgICBtZm4gPSBhcDJtLT5nZXRfZW50cnkoYXAybSwgb2xkX2dmbiwgJnQsICZh
LCAwLCBOVUxMLCBOVUxMKTsKPj4+ICsgICAgbWZuID0gYWx0cDJtX2dldF9nZm5fdHlwZV9hY2Nl
c3MoYXAybSwgb2xkX2dmbiwgJnQsICZhLCAmcGFnZV9vcmRlciwgJmNvcGllZF9mcm9tX2hvc3Rw
Mm0pOwo+Pgo+PiBCZWZvcmUsIGlmIG5ld19nZm4gd2FzIElOVkFMSURfR0ZOLCB0aGVuIHRoZSBo
b3N0IHAybSB3YXNuJ3QgcmVhZCBhdAo+PiBhbGwuICBOb3csIHRoZSBob3N0cDJtIHdpbGwgaGF2
ZSBfX2dldF9nZm5fdHlwZV9hY2Nlc3MoKSBjYWxsZWQgd2l0aAo+PiBQMk1fQUxMT0MgfCBQMk1f
VU5TSEFSRS4gIElzIHRoYXQgY2hhbmdlIGludGVudGlvbmFsLCBhbmQgaWYgc28sIHdoeT8KPiAK
PiBUaGlzIGhhcyBiZWVuIHJlcXVlc3RlZCBieSBUYW1hcyBpbiB2Mi4KClRoYXQncyBuaWNlLCBi
dXQgMSkgeW91IHN0aWxsIGhhdmVuJ3QgYW5zd2VyZWQgdGhlIHF1ZXN0aW9uLCBhbmQgMikgaXQn
cwpub3QgaW4gdGhlIGNoYW5nZWxvZy4KCkxpdGVyYWxseSB0d28gd2Vla3MgYWdvIFsxXSB3ZSBo
YWQgYSBzaXR1YXRpb24gd2hlcmUgbmVpdGhlciBhIGNvbW1lbnQKbm9yIHRoZSBjaGFuZ2Vsb2cg
dGhhdCBpbnRyb2R1Y2VkIGEgY2hhbmdlIGV4cGxhaW5lZCB3aHkgYSBkZWNpc2lvbiB3YXMKbWFk
ZSwgYW5kIHRoZSByZXN1bHQgd2FzIGEgaGVhdGVkIGFyZ3VtZW50IGJldHdlZW4gdHdvIG1haW50
YWluZXJzIGFib3V0CnRoZSBzYWZlc3Qgd2F5IHRvIGNoYW5nZSBpdCwgdGhhdCB3YXMgb25seSBy
ZXNvbHZlZCB3aGVuIEkgd2VudCB0aHJvdWdoCnRoZSBtYWlsIGFyY2hpdmVzIGFuZCByZWFkIHRo
cm91Z2ggYSBmYWlybHkgbG9uZyBhbmQgd2luZGluZyB0aHJlYWQgZnJvbQo5IHllYXJzIGFnby4K
ClRoYXQgc2hvdWxkbid0IGhhcHBlbi4gIFRoZSBjb2RlICsgdGhlIGNoYW5nZWxvZyBzaG91bGQg
Z2l2ZSBzb21lb25lCmdlbmVyYWxseSBmYW1pbGlhciB3aXRoIHRoZSBjb2RlYmFzZSBldmVyeXRo
aW5nIHRoZXkgbmVlZCB0byB1bmRlcnN0YW5kCndoYXQncyBnb2luZyBvbiwgYW5kIHdoeSB0aGUg
Y2hhbmdlIHdhcyBtYWRlLgoKIC1HZW9yZ2UKClsxXSBtYXJjLmluZm8vP2k9PDY4OWI4Zjc1LTIw
ZGQtMjRkOS1iZDVmLWYwM2E4MjAxYjJlMkBjaXRyaXguY29tPgoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
