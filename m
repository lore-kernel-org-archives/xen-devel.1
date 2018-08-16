From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/HVM: correct an inverted check in
 hvm_load()
Date: Thu, 16 Aug 2018 16:24:31 +0100
Message-ID: <0de3e591-7969-8b6f-0905-cdd585561f37@citrix.com>
References: <5B61D38002000078001DA043@prv1-mh.provo.novell.com>
 <0576d10c-4590-c925-4a03-ab455b0ad1f3@citrix.com>
 <5B629E9302000078001DA1B2@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=rytq=k7=citrix.com=prvs=759b2abc3=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1fqKco-0002Fh-CG
 for xen-devel@lists.xenproject.org; Thu, 16 Aug 2018 15:55:50 +0000
In-Reply-To: <5B629E9302000078001DA1B2@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMDIvMDgvMTggMDc6MDIsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDAxLjA4LjE4IGF0
IDE4OjA4LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3JvdGU6Cj4+IE9uIDAxLzA4LzE4
IDE2OjM2LCBKYW4gQmV1bGljaCB3cm90ZToKPj4+IENsZWFybHkgd2Ugd2FudCB0byBwdXQgYSB2
Q1BVIHRvIHNsZWVwIGlmIGl0IGlzIF9ub3RfIGFscmVhZHkgZG93bi4KPj4+Cj4+PiBTaWduZWQt
b2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4+PiAtLS0KPj4+IFRCRDog
U2luY2UgdGhlIGZsYXcgYXBwYXJlbnRseSBuZXZlciBtYXR0ZXJlZCwgSSBpbXBseSB0aGF0IHRo
ZSBmdW5jdGlvbgo+Pj4gICAgICBpcyBuZXZlciBjYWxsZWQgd2l0aCBhbnkgdkNQVSB1cC4gSGVu
Y2UgYW4gYWx0ZXJuYXRpdmUgbWlnaHQgYmUgdG8KPj4+ICAgICAgc2ltcGx5IHJldHVybiBhbiBl
cnJvciBpZiBhIHZDUFUgZG9lc24ndCBoYXZlIFZQRl9kb3duIHNldC4KPj4gV2l0aCBSZW11cy9D
T0xPLCB3ZSBzaG91bGQgaGl0IHRoaXMgcGF0aCB3aXRoIGFuIHVwIHZDUFUgb24gZXZlcnkKPj4g
aXRlcmF0aW9uIGFmdGVyIHRoZSBmaXJzdC4gIEdpdmVuIHRoaXMgYnVnLCBJJ20gc3RydWdnbGlu
ZyB0byBzZWUgaG93IGl0Cj4+IHdvcmtzIGF0IGFsbC4KPiBXZWxsLCB0aGF0IHdvdWxkIHJ1bGUg
b3V0IHRoZSBhbHRlcm5hdGl2ZSBzdWdnZXN0aW9uLCBidXQgc2luY2UKPiB0aGlzIGlzIG5laXRo
ZXIgYW4gYWNrIG5vciBhIG5hayAtIHdoYXQgZG8geW91IHN1Z2dlc3Qgd2UgZG8/CgpBcG9sb2dp
ZXMgZm9yIGNvbXBsZXRlbHkgbWlzc2luZyB0aGlzLsKgIFRoZSBmaXggaXMgb2J2aW91cywgc28K
UmV2aWV3ZWQtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+CgpJ
IGRvbid0IHRoaW5rIHdlIGNhbiBpbnN0ZWFkIHJldHVybiBhbiBlcnJvciwgYmVjYXVzZSBvZiB0
aGUgUmVtdXMvQ09MTwp1c2VjYXNlLCBidXQgSSBleHBlY3Qgc29tZW9uZSBpcyBnb2luZyB0byBo
YXZlIHNvbWUgZGVidWdnaW5nIHRvIGRvLi4uCgp+QW5kcmV3CgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
