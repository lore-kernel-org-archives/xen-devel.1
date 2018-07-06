From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Subject: Re: [PATCH] x86/altp2m: Add a subop for obtaining the
 mem access of a page
Date: Fri, 6 Jul 2018 11:56:35 +0300
Message-ID: <0ff581b5-8d77-c9f5-2848-d3f24fe49b97@bitdefender.com>
References: <20180628130036.23241-1-apop@bitdefender.com>
 <5B36529202000078001CF466@prv1-mh.provo.novell.com>
 <5435e9f9-21ea-1e36-294c-a79250ba9119@bitdefender.com>
 <5B39C76D02000078001CF8DF@prv1-mh.provo.novell.com>
 <A722A246-C6D6-4CF0-A26D-E788CDEC685B@citrix.com>
 <5B3CEA0E02000078001D1227@prv1-mh.provo.novell.com>
 <64BCF422-170C-40F4-BAA1-C4B71B3D1674@citrix.com>
 <5B3DD75702000078001D1550@prv1-mh.provo.novell.com>
 <CABfawh=fScutVH8_ERsdyFK9_cO9DGVQ79VaS_acLTXFE4nLCA@mail.gmail.com>
 <2db627a7-39ce-f4df-299e-c2eb69e7be17@bitdefender.com>
 <CABfawhkdDGyxt2p3kSdi2Q6U=9X7rc4715ax28jS5FPbxfMgJg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=ypu1=jw=bitdefender.com=rcojocaru@srs-us1.protection.inumbo.net>)
 id 1fbMXi-0007CS-KG
 for xen-devel@lists.xenproject.org; Fri, 06 Jul 2018 08:56:42 +0000
Received: from mx-sr.buh.bitdefender.com (mx-sr.buh.bitdefender.biz
 [10.17.80.103])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id B2580303CD89
 for <xen-devel@lists.xenproject.org>; Fri,  6 Jul 2018 13:12:52 +0300 (EEST)
Received: from smtp03.buh.bitdefender.org (smtp.bitdefender.biz [10.17.80.77])
 by mx-sr.buh.bitdefender.com (Postfix) with ESMTP id 98EDF7FC2A
 for <xen-devel@lists.xenproject.org>; Fri,  6 Jul 2018 11:56:40 +0300 (EEST)
In-Reply-To: <CABfawhkdDGyxt2p3kSdi2Q6U=9X7rc4715ax28jS5FPbxfMgJg@mail.gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Tamas K Lengyel <tamas@tklengyel.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Adrian Pop <apop@bitdefender.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien.grall@arm.com>, Jan Beulich <JBeulich@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>, Ian Jackson <Ian.Jackson@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDcvMDUvMjAxOCAwNzo0NSBQTSwgVGFtYXMgSyBMZW5neWVsIHdyb3RlOgo+IE9uIFRodSwg
SnVsIDUsIDIwMTggYXQgOToyMiBBTSBSYXp2YW4gQ29qb2NhcnUKPiA8cmNvam9jYXJ1QGJpdGRl
ZmVuZGVyLmNvbT4gd3JvdGU6Cj4+IEhvd2V2ZXIsIG91ciBwYXJ0aWN1bGFyIGFwcGxpY2F0aW9u
IGlzIG9ubHkgaW50ZXJlc3RlZCBpbiBzZXR0aW5nIChhbmQKPj4gcXVlcnlpbmcpIHBhZ2UgcmVz
dHJpY3Rpb25zIGZyb20gdXNlcnNwYWNlIChmcm9tIHRoZSBkb20wIGFnZW50KS4gSXQKPj4gd2ls
bCBhbHNvIG5lZWQgdG8gYmUgYWJsZSB0byBzZXQgdGhlIGNvbnZlcnRpYmxlIGJpdCBvZiBndWVz
dCBwYWdlcyBmcm9tCj4+IHRoZSBkb20wIGFnZW50IGFzIHdlbGwgKHBhdGNoZXMgcGVuZGluZyku
IFNvIHdlJ3JlIGFsc28gZmluZSB3aXRoIGEKPj4gIkRPTUNUTCBpZiBub2JvZHkgd2FudHMgaXQg
YXMgYSBIVk1PUCIgcG9saWN5LCBpZiBwb2xsdXRpbmcgdGhlIERPTUNUTHMKPj4gKHBvc3NpYmx5
IHRlbXBvcmFyaWx5KSBpcyBhbiBvcHRpb24uCj4+Cj4+IFdlIGNvdWxkIGFsc28gKGF0IGxlYXN0
IGJldHdlZW4gVGFtYXMgYW5kIHVzKSBjb21lIHVwIHdpdGggY3VycmVudCAvCj4+IGxpa2VseSB1
c2UtY2FzZXMgYW5kIGRvd25ncmFkZSBhbGwgYWx0cDJtIEhWTU9QcyB0aGF0IGNvdWxkIGJlIERP
TUNUTHMKPj4gaW4gYWxsIHRoZSBzY2VuYXJpb3MgdG8gRE9NQ1RMcy4KPiAKPiBBeWUuIFRoZXJl
IGlzIHJlYWxseSBqdXN0IG9uZSBIVk1PUCB0aGF0IHRoZSBndWVzdCBhYnNvbHV0ZWx5IG5lZWRz
Cj4gYWNjZXNzIHRvIHNvIHRoYXQgaXQgY2FuIHVzZSAjVkUsIGFuZCB0aGF0J3MKPiBIVk1PUF9h
bHRwMm1fdmNwdV9lbmFibGVfbm90aWZ5LiBBRkFJVSBldmVyeXRoaW5nIGVsc2UgY291bGQgYmUg
anVzdCBhCj4gRE9NQ1RMLgoKV2UgbmVlZCBldmVuIGxlc3MgdGhhbiB0aGF0IC0gd2Ugd2FudCB0
byBtb2RpZnkKSFZNT1BfYWx0cDJtX3ZjcHVfZW5hYmxlX25vdGlmeSB0byBiZSBhYmxlIHRvIGNh
bGwgaXQgZnJvbSBkb20wIGFzIHdlbGwsCmFuZCB3ZSBkb24ndCBjYWxsIGl0IGZyb20gdGhlIGlu
LWd1ZXN0IGFnZW50IGV2ZXIuIEJlY2F1c2Ugd2UgYWdyZWUgdGhhdAp0aGUgc21hbGxlc3QgYXR0
YWNrIHN1cmZhY2UgaXMgYSByZXF1aXJlbWVudCwgYWxsIHdlIGV2ZXIgY2FsbCB0aGF0J3MKI1ZF
IC8gYWx0cDJtIHJlbGF0ZWQgaXMgYWN0dWFsbHkgZnJvbSB0aGUgcHJpdmlsZWdlZCBkb21haW4g
ZG9pbmcKaW50cm9zcGVjdGlvbi4gVGhlIGluLWd1ZXN0IGRyaXZlciBvbmx5IG5lZWRzIHRvIGRv
IFZNRlVOQyBhbmQgYmUgYWJsZQp0byBjb21tdW5pY2F0ZSB3aXRoIHRoZSBkb20wIGludHJvc3Bl
Y3Rpb24gYWdlbnQuCgpTbyBhdCB0aGUgbW9tZW50IHdlIG5laXRoZXIgbmVlZCBub3IgdXNlIF9h
bnlfIEhWTU9QIGZyb20gdGhlIGd1ZXN0IChidXQKaXQgZG9lcyBtYWtlIHNlbnNlIHRoYXQgdGhl
IGd1ZXN0IGJlIGFibGUgdG8gZG8KSFZNT1BfYWx0cDJtX3ZjcHVfZW5hYmxlX25vdGlmeSBpbmRl
ZWQpLgoKU28gaXQgd291bGQgYXBwZWFyIHRoYXQgYXQgbGVhc3QgYXQgdGhpcyB0aW1lLCBmb3Ig
Ym90aCB1cyBhbmQgVGFtYXMgdGhlCm9ubHkgb3BlcmF0aW9uIHRoYXQgbmVlZHMgdG8gYmUgYSBI
Vk1PUCBpcyBIVk1PUF9hbHRwMm1fdmNwdV9lbmFibGVfbm90aWZ5LgoKSW4gdGhhdCBjYXNlLCBp
ZiBldmVyeW9uZSBhZ3JlZXMsIEkgcHJvcG9zZSB0aGF0IHdlIG1ha2UgYWxsIHRoZSBvdGhlcnMK
RE9NQ1RMcy4gVGhpcyB3b3VsZCBhbHNvIGhhdmUgc2V2ZXJhbCBtYWludGVuYW5jZSBiZW5lZml0
czoKCjEuIFdlIGNhbiB0aGVuIGdldCByaWQgb2YgdGhlIHVnbHkgY29tcGF0IGNvZGUgdGhhdCB3
YXMgcmVxdWlyZWQgZm9yCnVwc3RyZWFtaW5nIHhjX2FsdHAybV9zZXRfbWVtX2FjY2Vzc19tdWx0
aSgpIChhbmQgY2xlYW4gdXAgdGhlCmh5cGVydmlzb3IgY29kZSBjb3JyZXNwb25kaW5nIHRvIGl0
KS4KCjIuIFdlIGNhbiBwcm9iYWJseSByZW1vdmUgVGFtYXMnIHBhdGNoIHRoYXQgY29udHJvbHMg
aWYgZG9tMCwgdGhlIGd1ZXN0LApvciBib3RoIGNhbiBjYWxsIGFsdHAybSBvcGVyYXRpb25zIChh
bHRob3VnaCBtYXliZSB3ZSBzaG91bGQga2VlcCBpdCBmb3IKdGhlIG9uZSByZW1haW5pbmcgSFZN
T1A/IEknbSBub3Qgc3VyZSkuCgpTbyB0byBteSBtaW5kLCBpdCdzIGxlc3MsIGNsZWFuZXIsIHNh
ZmVyIGNvZGUuIEkgZG9uJ3Qgc2VlIGhvdyB0aGUKb3JpZ2luYWwgZGVzaWduZXJzIG9mIHRoZSBj
b2RlIHdvdWxkIG9iamVjdCwgc2luY2UgdGhlaXIgZ29hbCBJIHdvdWxkCmFzc3VtZSB3YXMgaGVs
cGluZyBpbnRyb3NwZWN0aW9uLCBhbmQgVGFtYXMgYW5kIHVzIGFyZSB0aGUgb25lcyB0cnlpbmcK
dG8gdXNlIGl0IC0gZnVydGhlcm1vcmUgdGhlc2UgY2hhbmdlcyBhZGRyZXNzIHRoZSBzZWN1cml0
eSBvYmplY3Rpb25zIG9mCnRoZSBYZW4gY29tbXVuaXR5LgoKRG9lcyB0aGUgcGxhbiBzb3VuZCBy
ZWFzb25hYmxlPwoKClRoYW5rcywKUmF6dmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
