From: Tamas K Lengyel <tamas@tklengyel.com>
Subject: Re: [PATCH] x86/vm_event: correctly gather gs_shadow
 value
Date: Wed, 1 May 2019 08:58:31 -0600
Message-ID: <CABfawhk_cCzL0XVUp6h-5QvXBDwqwf87+CqBvPDdeAHqAcrmvw@mail.gmail.com>
References: <20190501042249.1218-1-tamas@tklengyel.com>
 <602abffd-4cb8-c471-3adb-38d6bc3b1cb9@citrix.com>
 <CABfawhmi0UJ=K9q7y7oX1kYUBtpTZcLBk9RLnu4Uay7=CqJmpg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=q16C=TB=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1hLqhU-0005jL-Ny
 for xen-devel@lists.xenproject.org; Wed, 01 May 2019 14:59:12 +0000
Received: by mail-wm1-f46.google.com with SMTP id o25so7374557wmf.5
 for <xen-devel@lists.xenproject.org>; Wed, 01 May 2019 07:59:09 -0700 (PDT)
In-Reply-To: <CABfawhmi0UJ=K9q7y7oX1kYUBtpTZcLBk9RLnu4Uay7=CqJmpg@mail.gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>, Razvan Cojocaru <rcojocaru@bitdefender.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBNYXkgMSwgMjAxOSBhdCA3OjQ1IEFNIFRhbWFzIEsgTGVuZ3llbCA8dGFtYXNAdGts
ZW5neWVsLmNvbT4gd3JvdGU6Cj4KPiBPbiBXZWQsIE1heSAxLCAyMDE5IGF0IDE6NTAgQU0gQW5k
cmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3JvdGU6Cj4gPgo+ID4gT24g
MDEvMDUvMjAxOSAwNToyMiwgVGFtYXMgSyBMZW5neWVsIHdyb3RlOgo+ID4gPiBDdXJyZW50bHkg
dGhlIGdzX3NoYWRvdyB2YWx1ZSBpcyBvbmx5IGNhY2hlZCB3aGVuIHRoZSB2Q1BVIGlzIGJlaW5n
IHNjaGVkdWxlZAo+ID4gPiBvdXQgYnkgWGVuLiBSZXBvcnRpbmcgdGhpcyAodXN1YWxseSkgc3Rh
bGUgdmFsdWUgdGhyb3VnaCB2bV9ldmVudCBpcyBpbmNvcnJlY3QsCj4gPiA+IHNpbmNlIGl0IGRv
ZXNuJ3QgcmVwcmVzZW50IHRoZSBhY3R1YWwgc3RhdGUgb2YgdGhlIHZDUFUgYXQgdGhlIHRpbWUg
dGhlIGV2ZW50Cj4gPiA+IHdhcyByZWNvcmRlZC4gVGhpcyBwcmV2ZW50cyB2bV9ldmVudCBzdWJz
Y3JpYmVycyBmcm9tIGNvcnJlY3RseSBmaW5kaW5nIGtlcm5lbAo+ID4gPiBzdHJ1Y3R1cmVzIGlu
IHRoZSBndWVzdCB3aGVuIGl0IGlzIHRyYXBwZWQgd2hpbGUgaW4gcmluZzMuCj4gPiA+Cj4gPiA+
IFNpZ25lZC1vZmYtYnk6IFRhbWFzIEsgTGVuZ3llbCA8dGFtYXNAdGtsZW5neWVsLmNvbT4KPiA+
ID4gQ2M6IFJhenZhbiBDb2pvY2FydSA8cmNvam9jYXJ1QGJpdGRlZmVuZGVyLmNvbT4KPiA+ID4g
Q2M6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPiA+ID4gQ2M6IEFuZHJldyBDb29w
ZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Cj4gPiA+IENjOiBXZWkgTGl1IDx3ZWkubGl1
MkBjaXRyaXguY29tPgo+ID4gPiBDYzogUm9nZXIgUGF1IE1vbm5lIDxyb2dlci5wYXVAY2l0cml4
LmNvbT4KPiA+ID4gLS0tCj4gPiA+ICB4ZW4vYXJjaC94ODYvdm1fZXZlbnQuYyB8IDIgKy0KPiA+
ID4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+ID4gPgo+
ID4gPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L3ZtX2V2ZW50LmMgYi94ZW4vYXJjaC94ODYv
dm1fZXZlbnQuYwo+ID4gPiBpbmRleCA1MWMzNDkzYjFkLi40NDY0OTQwZGE3IDEwMDY0NAo+ID4g
PiAtLS0gYS94ZW4vYXJjaC94ODYvdm1fZXZlbnQuYwo+ID4gPiArKysgYi94ZW4vYXJjaC94ODYv
dm1fZXZlbnQuYwo+ID4KPiA+IEFjdHVhbGx5LCBjb21lIHRvIHRoaW5rIG9mIGl0LCB0aGUgc2Ft
ZSBpcyB0cnVlIGZvciB0aGUgU1lTRU5URVIKPiA+IGRldGFpbHMsIHdoaWNoIGJ5IGRlZmF1bHQg
YXJlIHJlYWQvd3JpdGUgdG8gdGhlIGd1ZXN0IHdoaWxlIGl0IGlzCj4gPiBzY2hlZHVsZWQuICBB
cyBhIHJlc3VsdCwgdGhlIGRldGFpbHMgcmVwb3J0ZWQgaGVyZSB3aWxsIGZyb20gdGhlIGxhc3QK
PiA+IHZjcHUgY29udGV4dCBzd2l0Y2gsIGFuZCBwb3NzaWJseSBzdGFsZS4KPgo+IEknbGwgbG9v
ayBpbnRvIGl0LgoKVGhlIHN5c2VudGVyIHZhbHVlcyBsb29rIGZpbmUgdG8gbWUgYmVjYXVzZSB2
bXhfc2F2ZV92bWNzX2N0eHQgY2FsbHMKdm14X3ZtY3Nfc2F2ZSwgd2hpY2ggcmVmcmVzaGVzIHRo
ZSB2YWx1ZXMgZnJvbSB0aGUgYWN0dWFsIFZNQ1MuIEl0J3MKb25seSBzaGFkb3dfZ3MgdGhhdCBp
cyBub3QgcmVmcmVzaGVkLgoKVGFtYXMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
