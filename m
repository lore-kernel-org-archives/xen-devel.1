From: Andrii Anisov <andrii.anisov@gmail.com>
Subject: Re: [PATCH 2/2] arm/irq: skip action avalability check
 for non-debug build
Date: Wed, 12 Dec 2018 19:59:55 +0200
Message-ID: <8a4d640b-c247-c159-9ce5-8630b64f7453@gmail.com>
References: <1544633725-7243-1-git-send-email-andrii.anisov@gmail.com>
 <1544633725-7243-3-git-send-email-andrii.anisov@gmail.com>
 <46211378-e63d-86bb-6ce9-d739b986b777@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=X41P=OV=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1gX8ng-0004je-Vl
 for xen-devel@lists.xenproject.org; Wed, 12 Dec 2018 18:00:01 +0000
Received: by mail-lj1-x241.google.com with SMTP id n18-v6so17087022lji.7
 for <xen-devel@lists.xenproject.org>; Wed, 12 Dec 2018 09:59:59 -0800 (PST)
In-Reply-To: <46211378-e63d-86bb-6ce9-d739b986b777@arm.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Andrii Anisov <andrii_anisov@epam.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTIuMTIuMTggMTk6NDksIEp1bGllbiBHcmFsbCB3cm90ZToKPiBUaG9zZSBjb25kaXRpb25z
IGFyZSBub3Qgc3VmZmljaWVudCB0byBlbnN1cmUgZGVzYy0+YWN0aW9uIGlzIG5vdCBOVUxMLiBZ
b3UgYWxzbyBuZWVkIHRvIHRha2UgdGhlIHNwaW5sb2NrLgpBZ3JlZS4gU2hvdWxkIEkgZGVzY3Jp
YmUgaXQgYXMgZm9sbG93aW5nPwoKPj4gVW5kZXIgZGVzYy0+bG9jayB0YWtlbjoKPj4gQW4gSVJR
IHdpdGggX0lSUV9HVUVTVCBmbGFnIHNldCBhbHdheXMgaGFzIGFuIGFjdGlvbi4KPj4gQW4gSVJR
IHdpdGggX0lSUV9ESVNBQkxFRCBmbGFnIGNsZWFyZWQgYWx3YXlzIGhhdmUgYW4gYWN0aW9uLgoK
Cj4gV2hpbGUgbG9va2luZyBhdCB0aGUgY29kZSwgSSBub3RpY2VkIGFuIGludGVyZXN0aW5nIHJh
Y2Ugd2l0aCB0aGUgcmVsZWFzZSBjb2RlLgpBcyBJIHVuZGVyc3RhbmQgdGhlIHJhY2UgaW4gbm90
IGRpcmVjdGx5IGxpbmtlZCB0byB0aGlzIHBhdGNoLiBJcyBpdCBjb3JyZWN0PwoKPiBHdWVzdCBJ
UlEgYXJlIHJlbGVhc2VkIHVzaW5nIHRoZSBmdW5jdGlvbiBnaWNfcmVtb3ZlX2lycV90b19ndWVz
dC4gVGhlIHNlcXVlbmNlIGlzIHJvdWdobHk6Cj4gCj4gMSkgc3Bpbl9sb2NrKGRlc2MtPmxvY2sp
Owo+IDIpIHdyaXRlbChkZXNjLT5pcnEsIElDRU5BQkxFUik7Cj4gMykgc2V0X2JpdChfSVJRX0RJ
U0FCTEVELCAmZGVzYy0+c3RhdHVzKTsKPiA0KSBjbGVhcl9iaXQoX0lSUV9HVUVTLCAmZGVzYy0+
c3RhdHVzKTsKPiA1KSBkZXNjLT5oYW5kbGVyID0gJm5vX2lycV90eXBlOwo+IDYpIHNwaW5fdW5s
b2NrKGRlc2MtPmxvY2spOwo+IAo+IEV2ZW4gaWYgMikgd2lsbCBkaXNhYmxlIHRoZSBpbnRlcnJ1
cHQgaW4gdGhlIGhhcmR3YXJlLCB0aGUgaW50ZXJydXB0IG1heSBoYXZlIGJlZW4gcmVjZWl2ZWQg
ZWFybGllciBvbiBhbm90aGVyIENQVSBhbmQgd2FpdGluZyBvbiB0aGUgbG9jay4gQXMgc29vbiBh
cyB0aGUgbG9jayBpcyB0YWtlbiwgdGhlIGNvZGUgd2lsbCBub3RpY2UgdGhlIGlycSBkaXNhYmxl
ZCAodGhhbmtzIHRvIDMpKSBhbmQgd2lsbCB0aGVuIGVuZCB0aGUgaW50ZXJydXB0LiBUaGUgY2Fs
bGJhayBlbmQgZm9yIG5vX2lycV90eXBlIGlzIGEgTk9QLCB0aGVyZWZvcmUgdGhlIGludGVycnVw
dCB3aWxsIHN0YXkgYWN0aXZlIGFuZCB0aGUgcHJpb3JpdHkgd2lsbCBub3QgYmUgZHJvcHBlZC4K
PiAKPiBCZWNhdXNlIG9mIHRoYXQsIHRoZSBDUFUgd2lsbCBuZXZlciBiZSBhYmxlIHRvIHJlY2Vp
dmUgaW50ZXJydXB0IGZvciBndWVzdCBhbnltb3JlLiBBRkFJQ1QsIHRoaXMgY2FuIG9ubHkgaGFw
cGVuIGlmIGFuIGludGVycnVwdCBpcyByZWNlaXZlZCB3aGlsZSBkZXN0cm95aW5nIHRoZSBhc3Np
Z25lZCBkb21haW4uCj4gCj4gSSB0aGluayA1KSBzaG91bGQgYmUgcmVwbGFjZWQgd2l0aAo+IAo+
IGRlc2MtPmhhbmRsZXIgPSBnaWNfaHdfb3BzLT5naWNfaG9zdF9pcnFfdHlwZTsKPiAKPiBPciB3
ZSBwb3RlbnRpYWxseSBuZWVkIHRvIHVwZGF0ZSBub19pcnFfdHlwZSBhbmQgRU9JICJzcHVyaW91
cyBpbnRlcnJ1cHQiLgo+IAo+IEkgYW0gbm90IGVudGlyZWx5IHN1cmUgd2hpY2ggd2F5IGlzIHRo
ZSBiZXN0IHRvIGFkZHJlc3MgdGhlIHJhY2UuIEFueSBvcGluaW9ucz8KTGV0IG1lIHNwZW5kIGEg
Yml0IG1vcmUgdGltZSB0byBsb29rIGludG8gdGhhdAoKT3RoZXIgd29yZGluZyBhbmQgZ3JhbW1h
dGljYWwgbml0cyB3aWxsIGJlIGFkZHJlc3NlZCBhcyBzdWdnZXN0ZWQuCgotLSAKU2luY2VyZWx5
LApBbmRyaWkgQW5pc292LgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
