Return-Path: <SRS0=w6oi=S3=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1B1AC43219
	for <xen-devel@archiver.kernel.org>; Thu, 25 Apr 2019 13:37:49 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B178B2067C
	for <xen-devel@archiver.kernel.org>; Thu, 25 Apr 2019 13:37:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B178B2067C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hJeZD-0007kW-J6; Thu, 25 Apr 2019 13:37:35 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=iCIG=S3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hJeZB-0007kQ-NM
 for xen-devel@lists.xenproject.org; Thu, 25 Apr 2019 13:37:33 +0000
X-Inumbo-ID: 47002004-675f-11e9-843c-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 47002004-675f-11e9-843c-bc764e045a96;
 Thu, 25 Apr 2019 13:37:32 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Thu, 25 Apr 2019 07:37:31 -0600
Message-Id: <5CC1B818020000780022916A@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Thu, 25 Apr 2019 07:37:28 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Andrew Cooper" <andrew.cooper3@citrix.com>,
 "FionaLi-oc" <fionali-oc@zhaoxin.com>
References: <1555663857-4173-1-git-send-email-fionali-oc@zhaoxin.com>
 <5CC1B46B0200007800229134@prv1-mh.provo.novell.com>
 <89dcdf84-214d-d100-e2a1-8bd151f215bd@citrix.com>
In-Reply-To: <89dcdf84-214d-d100-e2a1-8bd151f215bd@citrix.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH 2/2 v2] x86/acpi: Improve suspend and resume
 process for Zhaoxin CPU
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
Cc: xen-devel <xen-devel@lists.xenproject.org>, cobechen@zhaoxin.com,
 Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190425133728.igNTEy2fPnyEa3OuFmJDUG2FWPN_BP-_0YRED4N-qR0@z>

Pj4+IE9uIDI1LjA0LjE5IGF0IDE1OjI1LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMjUvMDQvMjAxOSAxNDoyMSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+IE9uIDE5
LjA0LjE5IGF0IDEwOjUwLCA8ZmlvbmFsaS1vY0B6aGFveGluLmNvbT4gd3JvdGU6Cj4+PiAtLS0g
YS94ZW4vYXJjaC94ODYveDg2XzY0L3RyYXBzLmMKPj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni94ODZf
NjQvdHJhcHMuYwo+Pj4gQEAgLTMzNCw3ICszMzQsOCBAQCB2b2lkIHN1YmFyY2hfcGVyY3B1X3Ry
YXBzX2luaXQodm9pZCkKPj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICh1
bnNpZ25lZCBsb25nKWxzdGFyX2VudGVyKTsKPj4+ICAgICAgc3R1Yl92YSArPSBvZmZzZXQ7Cj4+
PiAgCj4+PiAtICAgIGlmICggYm9vdF9jcHVfZGF0YS54ODZfdmVuZG9yICYgKFg4Nl9WRU5ET1Jf
SU5URUwgfCBYODZfVkVORE9SX0NFTlRBVVIpIAo+ICkKPj4+ICsgICAgaWYgKCBib290X2NwdV9k
YXRhLng4Nl92ZW5kb3IgJgo+Pj4gKyAgICAgICAgKFg4Nl9WRU5ET1JfSU5URUwgfCBYODZfVkVO
RE9SX0NFTlRBVVIgfCBYODZfVkVORE9SX1NIQU5HSEFJKSApCj4+PiAgICAgIHsKPj4+ICAgICAg
ICAgIC8qIFNZU0VOVEVSIGVudHJ5LiAqLwo+Pj4gICAgICAgICAgd3Jtc3JsKE1TUl9JQTMyX1NZ
U0VOVEVSX0VTUCwgc3RhY2tfYm90dG9tKTsKPj4gSG93IGlzIHRoaXMgaHVuayByZWxhdGVkIHRv
IHRoZSB0aXRsZSBvZiB0aGUgY2hhbmdlPyBJIHRoaW5rIHRoZQo+PiB0aXRsZSB3YW50cyB0byBi
ZSBhZGp1c3RlZC4KPj4KPj4gRnVydGhlcm1vcmUgZm9yIGFsbCBvZiB0aGUgY2hhbmdlcyBkb25l
LCB3b3VsZG4ndCB3ZSBiZXR0ZXIKPj4gc3dpdGNoIHRvIHVzZSBjcHVfaGFzX3NlcD8gaW5pdF9h
bWQoKSBhcyB3ZWxsIGFzIGRlZmF1bHRfaW5pdCgpCj4+IGFscmVhZHkgY2xlYXIgdGhpcyBmbGFn
LiBBbmRyZXcsIHRob3VnaHRzPwo+IAo+IEkgd29uZGVyZWQgZXhhY3RseSB0aGF0IGFmdGVyIHF1
ZXVpbmcgdGhpcyBwYXRjaCwgYnV0IGRpZG4ndCBnZXQgYXJvdW5kCj4gdG8gZXhwZXJpbWVudGlu
Zy4KPiAKPiBXZSBoYXZlIHRvIGJlIGEgbGl0dGxlIGNhcmVmdWwgd2l0aCB0aGUgb3JkZXJpbmcg
b2Ygb3BlcmF0aW9ucy4gCj4gY3B1X2hhc19zZXAgaXMgdmlzaWJsZSBpbiBDUFVJRCBidXQgbmVl
ZHMgY2xvYmJlcmluZyBpbiBBTUQvSHlnb24gYmVmb3JlCj4gY3B1X2hhc19zZXAgaXMgc2FmZSB0
byB1c2UgKGFsdGhvdWdoIGZvciB0aGUgTVNScywgaXQgc2hvdWxkIGJlIHNhZmUpLgoKdHJhcF9p
bml0KCkgKGFuZCBoZW5jZSBwZXJjcHVfdHJhcHNfaW5pdCgpKSBydW5zIGFmdGVyLCBpbgpwYXJ0
aWN1bGFyLCBpbml0X3NwZWN1bGF0aW9uX21pdGlnYXRpb25zKCksIHdoaWNoIG1lYW5zIGFsbApm
ZWF0dXJlIGNvbGxlY3Rpb24gYW5kIG1hc3NhZ2luZyBtdXN0IGhhdmUgaGFwcGVuZWQuIFNvCnVu
bGVzcyB5b3UgZXhwbGljaXRseSBzYXkgb3RoZXJ3aXNlLCBJJ2QgbGlrZSB0byBhc2sgRmlvbmFM
aQp0byBzdWJtaXQgYSB2MiB3aXRoIHRoYXQgY2hhbmdlIChhbmQgd2l0aCB0aGUgb3RoZXIgY29z
bWV0aWMKYWRqdXN0bWVudHMgY2FycmllZCBvdXQpLgoKSmFuCgoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
