From: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: [OSSTEST PATCH v2 14/19] ts-guests-nbd-mirror: make
	it work with stretch
Date: Wed, 7 Mar 2018 14:45:50 +0000
Message-ID: <23199.64286.610624.17526@mariner.uk.xensource.com>
References: <20171031135203.11537-1-wei.liu2@citrix.com>
 <20171031135203.11537-15-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=yqaj=f5=citrix.com=prvs=597a3b2b9=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1etaKJ-0001PC-Jn
 for xen-devel@lists.xenproject.org; Wed, 07 Mar 2018 14:45:55 +0000
In-Reply-To: <20171031135203.11537-15-wei.liu2@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

V2VpIExpdSB3cml0ZXMgKCJbT1NTVEVTVCBQQVRDSCB2MiAxNC8xOV0gdHMtZ3Vlc3RzLW5iZC1t
aXJyb3I6IG1ha2UgaXQgd29yayB3aXRoIHN0cmV0Y2giKToKPiBPbiB0aGUgc2VydmVyIHNpZGUs
IG9ubHkgYWRkIG9sZHN0eWxlPSBhbmQgcG9ydD0gb24gV2hlZXp5IGFuZCBKZXNzaWUuCj4gU3Ry
ZXRjaCBkb2Vzbid0IHN1cHBvcnQgb3IgbmVlZCB0aG9zZSBhbnltb3JlLgouLi4KPiArICAgIGlm
ICgkY2hvLT57U3VpdGV9ICF+IG0vc3RyZXRjaC8pIHsKPiArICAgICAgICBjb25maWdjbGllbnRf
cHJlX3N0cmV0Y2goKTsKClRoaXMgd2lsbCBnbyB3cm9uZyBpbiBidXN0ZXIuICBZb3VyIG1hdGNo
IG5lZWRzIHRvIGJlIGludmVydGVkIGFuZCB0aGUKc2V0IG9mIHN1aXRlcyB0b28sIHNvIHRoYXQg
dW5rbm93biBzdWl0ZXMgZ2V0IHRoZSBuZXcgYmVoYXZpb3VyLgoKSXQncyBwcm9iYWJseSBlYXNp
ZXIgdG8gc3dhcCB0aGUgbGltYnMgb2YgdGhlIGlmLgoKPiArCj4gKyAgICBpZiAoJGNoby0+e1N1
aXRlfSAhfiBtL3NxdWVlemV8d2hlZXp5fGplc3NpZS8pIHsKPiArCWZvcmVhY2ggbXkgJHYgKEB2
b2xzKSB7Cj4gKwkgICAgbXkgJG5iZGRldiA9ICJuYmQkdi0+e0l4fSI7Cj4gKwkgICAgdGFyZ2V0
X2NtZF9yb290KCRjaG8sIDw8RU5EKTsKPiArbWtkaXIgLXAgL2Rldi8kdi0+e0dob317Vmd9Cj4g
K2lmICEgdGVzdCAtTCAkdi0+e1BhdGh9OyB0aGVuIGxuIC1zIC9kZXYvJG5iZGRldiAkdi0+e1Bh
dGh9OyBmaQo+ICtFTkQKClRoaXMgc2VlbXMgdG8gZHVwbGljYXRlIGNvZGUgaW4gd2hhdCBpcyBu
b3cgY29uZmlnY2xpZW50X3ByZV9zdHJldGNoLgoKSSBhbHNvIGRvbid0IHVuZGVyc3RhbmQgdGhl
IGxvZ2ljIHRoYXQgc2F5czoKIC0gb24gc3RyZXRjaCwgZG8gdGhlIHBvc3Qtc3RyZXRjaCB0aGlu
ZywgYW5kIG1ha2UgdGhpcyBzeW1saW5rCiAtIG9uIHNxdWVlemUuLmplc3NpZSwgZG8gdGhlIHBy
ZS1zdHJldGNoIHRoaW5nLCBhbmQgbWFrZSB0aGlzIHN5bWxpbmsKIC0gb24gc2FyZ2UsIGRvIHRo
ZSBwcmUtc3RyZXRjaCB0aGluZywgYW5kIG1ha2UgdGhlIHN5bWxpbmsgdHdpY2UKPwoKSWFuLgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
