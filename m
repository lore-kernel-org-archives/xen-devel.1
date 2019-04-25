Return-Path: <SRS0=w6oi=S3=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 671FBC43218
	for <xen-devel@archiver.kernel.org>; Thu, 25 Apr 2019 20:01:38 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 76066206C1
	for <xen-devel@archiver.kernel.org>; Thu, 25 Apr 2019 20:01:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 76066206C1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hJkYe-00085e-8g; Thu, 25 Apr 2019 20:01:24 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=PBl1=S3=citrix.com=prvs=0115b8627=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hJkYd-00085Z-TX
 for xen-devel@lists.xenproject.org; Thu, 25 Apr 2019 20:01:23 +0000
X-Inumbo-ID: e557b56e-6794-11e9-843c-bc764e045a96
Received: from SMTP.EU.CITRIX.COM (unknown [185.25.65.24])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id e557b56e-6794-11e9-843c-bc764e045a96;
 Thu, 25 Apr 2019 20:01:22 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,394,1549929600"; d="scan'208";a="89307993"
To: Tamas K Lengyel <tamas@tklengyel.com>
References: <20190425153252.14795-1-tamas@tklengyel.com>
 <20190425153252.14795-2-tamas@tklengyel.com>
 <ced3d7b5-e683-f17c-b068-2d372f59c498@citrix.com>
 <CABfawhn4eS2aB8+aZjo10ixmtzsOrSfugEz7ELMM9uMqC-6dSw@mail.gmail.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <495a1395-06d4-2ce3-7216-1417ba41fe07@citrix.com>
Date: Thu, 25 Apr 2019 21:01:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CABfawhn4eS2aB8+aZjo10ixmtzsOrSfugEz7ELMM9uMqC-6dSw@mail.gmail.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH 2/3] x86/mem_sharing: replace use of
 page_lock/unlock with our own lock
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
Cc: George Dunlap <george.dunlap@eu.citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190425200119.XDP5tm4T6QuhPpZy9XIeO2AT3lYct6pIKuzE_CbqtvI@z>

T24gMjUvMDQvMjAxOSAyMDo1NywgVGFtYXMgSyBMZW5neWVsIHdyb3RlOgo+IE9uIFRodSwgQXBy
IDI1LCAyMDE5IGF0IDEyOjU4IFBNIEFuZHJldyBDb29wZXIKPiA8YW5kcmV3LmNvb3BlcjNAY2l0
cml4LmNvbT4gd3JvdGU6Cj4+IE9uIDI1LzA0LzIwMTkgMTY6MzIsIFRhbWFzIEsgTGVuZ3llbCB3
cm90ZToKPj4+IGRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9hc20teDg2L21tLmggYi94ZW4vaW5j
bHVkZS9hc20teDg2L21tLmgKPj4+IGluZGV4IDZmYWE1NjMxNjcuLjU5NGRlNjE0OGYgMTAwNjQ0
Cj4+PiAtLS0gYS94ZW4vaW5jbHVkZS9hc20teDg2L21tLmgKPj4+ICsrKyBiL3hlbi9pbmNsdWRl
L2FzbS14ODYvbW0uaAo+Pj4gQEAgLTEzMyw3ICsxMzMsMTAgQEAgc3RydWN0IHBhZ2VfaW5mbwo+
Pj4gICAgICAgICAgICogb2Ygc2hhcmluZyBzaGFyZSB0aGUgdmVyc2lvbiB0aGV5IGV4cGVjdCB0
by4KPj4+ICAgICAgICAgICAqIFRoaXMgbGlzdCBpcyBhbGxvY2F0ZWQgYW5kIGZyZWVkIHdoZW4g
YSBwYWdlIGlzIHNoYXJlZC91bnNoYXJlZC4KPj4+ICAgICAgICAgICAqLwo+Pj4gLSAgICAgICAg
c3RydWN0IHBhZ2Vfc2hhcmluZ19pbmZvICpzaGFyaW5nOwo+Pj4gKyAgICAgICAgc3RydWN0IHsK
Pj4+ICsgICAgICAgICAgICBzdHJ1Y3QgcGFnZV9zaGFyaW5nX2luZm8gKmluZm87Cj4+PiArICAg
ICAgICAgICAgcndsb2NrX3QgbG9jazsKPj4+ICsgICAgICAgIH0gc2hhcmluZzsKPj4+ICAgICAg
fTsKPj4+Cj4+PiAgICAgIC8qIFJlZmVyZW5jZSBjb3VudCBhbmQgdmFyaW91cyBQR0NfeHh4IGZs
YWdzIGFuZCBmaWVsZHMuICovCj4+IEknbSBhZnJhaWQgdGhpcyBpcyBhIG5vLWdvLCBidXQgZm9y
IHNvbWUgcmVhc29ucyB3aGljaCBhcmUgcmF0aGVyIG1vcmUKPj4gc3VidGxlIHRoYXQgdGhleSBh
cHBlYXIgaGVyZS4KPj4KPj4gVGhlcmUgaXMgb25lIHN0cnVjdCBwYWdlX2luZm8gcGVyIDRrIGZy
YW1lLCBhbmQgeW91J3ZlIGFkZGVkIGFuIGV4dHJhIDE2Cj4+IGJ5dGVzLCB0YWtpbmcgaXQgZnJv
bSAzMiBieXRlcyB0byA0OCBieXRlcy4KPj4KPj4gT3RoZXIgdGhhbiBtYWtpbmcgaXQgYSBub24t
cG93ZXItb2YtMiAobmV0IGRpZmZzdGF0IGdyb3cvc2hyaW5rOiAyNTYvMjcKPj4gdXAvZG93bjog
Nzc1MC8tNTY5NiAoMjA1NCkgZHVlIHRvIGxlc3MgZWZmaWNpZW50IGFyaXRobWV0aWNbMV0pLCB0
aGUKPj4gZnJhbXRhYmxlIGhhcyBhIGZpeGVkIHZpcnR1YWwgc2l6ZSAoMTI4RyBieSBkZWZhdWx0
KSwgc28geW91J3ZlIGVuZGVkIHVwCj4+IGRyb3BwaW5nIFhlbidzIG1lbW9yeSBsaW1pdCAoMTZU
QiBieSBkZWZhdWx0KSBieSAxLzMuCj4gSW50ZXJlc3RpbmcsIEknbSBub3Qgc3VyZSBJIGNvbXBs
ZXRlbHkgZm9sbG93IGJ1dCBkb2VzIHRoaXMgbWVhbiB0aGF0Cj4gdGhpcyBzdHJ1Y3R1cmUgaXMg
bm93IG5vdCBhbGxvd2VkIHRvIGdyb3csIGxpa2UgZXZlciwgb3IgdGhhdCBJIGp1c3QKPiBuZWVk
IHRvIGFkZCBwYWRkaW5nIHRvIGZpeCB1cCBpdHMgYWxpZ25tZW50PwoKQmFzaWNhbGx5LCBpdCBu
ZWVkcyBleGNlZWRpbmdseSBnb29kIHJlYXNvbnMgdG8gZ3Jvdy7CoCBFdmVuICJzdXBwb3J0aW5n
Cm1vcmUgdGhhbiAxNlQgb2YgUkFNIiB3YXNuJ3QgYSBnb29kIGVub3VnaCByZWFzb24gdG8gZ3Jv
dyBpdCBmcm9tIDMyIHRvCjY0IGJ5dGVzLCB3aGljaCBpcyB3aHkgQ09ORklHX0JJR01FTSBleGlz
dHMgYW5kIGlzIG9mZiBieSBkZWZhdWx0LgoKQXQgdGhlIG1vbWVudCwgSSBkb24ndCBoYXZlIGEg
Z29vZCBzb2x1dGlvbiBmb3IgeW91ciBwcm9ibGVtIHRvIHN1Z2dlc3QuCgp+QW5kcmV3CgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
