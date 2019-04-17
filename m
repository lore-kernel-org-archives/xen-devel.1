From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 05/12] xen/arm64: bitops: Match the register
 size with the value size in flsl
Date: Wed, 17 Apr 2019 13:24:02 -0700 (PDT)
Message-ID: <alpine.DEB.2.10.1904171322560.1370@sstabellini-ThinkPad-X260>
References: <20190327184531.30986-1-julien.grall@arm.com>
 <20190327184531.30986-6-julien.grall@arm.com>
 <2af3ed7f-00d4-2eb7-0dde-c9570578dd4e@citrix.com>
 <bac73177-1ff7-7b7c-6852-832f88707555@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=CUiA=ST=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hGr6C-0008Vp-8I
 for xen-devel@lists.xenproject.org; Wed, 17 Apr 2019 20:24:04 +0000
In-Reply-To: <bac73177-1ff7-7b7c-6852-832f88707555@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <Julien.Grall@arm.com>
Cc: "Artem_Mygaiev@epam.com" <Artem_Mygaiev@epam.com>, "sstabellini@kernel.org" <sstabellini@kernel.org>, "Andrii_Anisov@epam.com" <Andrii_Anisov@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>, "Oleksandr_Tyshchenko@epam.com" <Oleksandr_Tyshchenko@epam.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, nd <nd@arm.com>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCAyNyBNYXIgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEhpLAo+IAo+IE9uIDI3
LzAzLzIwMTkgMTk6MDMsIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4gPiBPbiAyNy8wMy8yMDE5IDE4
OjQ1LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gPj4gQ2xhbmcgaXMgcGlja2llciB0aGFuIEdDQyBm
b3IgdGhlIHJlZ2lzdGVyIHNpemUgaW4gYXNtIHN0YXRlbWVudC4gSXQgZXhwZWN0cwo+ID4+IHRo
ZSByZWdpc3RlciBzaXplIHRvIG1hdGNoIHRoZSB2YWx1ZSBzaXplLgo+ID4+Cj4gPj4gVGhlIGlu
c3RydWN0aW9uIGNseiBpcyBleHBlY3RpbmcgdGhlIHR3byBvcGVyYW5kcyB0byBiZSB0aGUgc2Ft
ZSBzaXplCj4gPj4gKGkuZSAzMi1iaXQgb3IgNjQtYml0KS4gQXMgdGhlIGZsc2wgZnVuY3Rpb24g
aXMgZGVhbGluZyB3aXRoIDY0LWJpdAo+ID4+IHZhbHVlLCB3ZSBuZWVkIHRvIG1ha2UgdGhlIGRl
c3RpbmF0aW9uIHZhcmlhYmxlIDY0LWJpdCBhcyB3ZWxsLgo+ID4+Cj4gPj4gV2hpbGUgYXQgaXQs
IGFkZCBhIG5ld2xpbmUgYmVmb3JlIHRoZSByZXR1cm4gc3RhdGVtZW50Lgo+ID4+Cj4gPj4gU2ln
bmVkLW9mZi1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KPiA+PiAtLS0K
PiA+PiAgIHhlbi9pbmNsdWRlL2FzbS1hcm0vYXJtNjQvYml0b3BzLmggfCAzICsrLQo+ID4+ICAg
MSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+ID4+Cj4gPj4g
ZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL2FzbS1hcm0vYXJtNjQvYml0b3BzLmggYi94ZW4vaW5j
bHVkZS9hc20tYXJtL2FybTY0L2JpdG9wcy5oCj4gPj4gaW5kZXggNmJmMTkyMjY4MC4uMDUwNDVm
MTEwOSAxMDA2NDQKPiA+PiAtLS0gYS94ZW4vaW5jbHVkZS9hc20tYXJtL2FybTY0L2JpdG9wcy5o
Cj4gPj4gKysrIGIveGVuL2luY2x1ZGUvYXNtLWFybS9hcm02NC9iaXRvcHMuaAo+ID4+IEBAIC0z
NCwxMiArMzQsMTMgQEAgc3RhdGljIC8qX18qL2Fsd2F5c19pbmxpbmUgdW5zaWduZWQgbG9uZyBf
X2Zmcyh1bnNpZ25lZCBsb25nIHdvcmQpCj4gPj4gICAKPiA+PiAgIHN0YXRpYyBpbmxpbmUgaW50
IGZsc2wodW5zaWduZWQgbG9uZyB4KQo+ID4+ICAgewo+ID4+IC0gICAgICAgIGludCByZXQ7Cj4g
Pj4gKyAgICAgICAgdWludDY0X3QgcmV0Owo+ID4+ICAgCj4gPj4gICAgICAgICAgIGlmIChfX2J1
aWx0aW5fY29uc3RhbnRfcCh4KSkKPiA+PiAgICAgICAgICAgICAgICAgIHJldHVybiBnZW5lcmlj
X2Zsc2woeCk7Cj4gPj4gICAKPiA+PiAgICAgICAgICAgYXNtKCJjbHpcdCUwLCAlMSIgOiAiPXIi
IChyZXQpIDogInIiICh4KSk7Cj4gPiAKPiA+IEFzIHggaXMgZml4ZWQgYnkgdGhlIEFCSSwgcmV0
IHNob3VsZCBiZSB1bnNpZ25lZCBsb25nIHRvIG1hdGNoLCBzdXJlbHk/Cj4gCj4gTm8gbmVlZCBm
b3IgaXQuIFRoZSByZXN1bHQgb2YgdGhlIGluc3RydWN0aW9uIGNseiB3aWxsIGFsd2F5cyBiZSBz
bWFsbGVyIAo+IHRoYW4gNjQuCj4gCj4gSSBzdXNwZWN0IHRoZXkgcmVxdWlyZSBhIDY0LWJpdCBy
ZWdpc3RlciBqdXN0IGZvciBzaW1wbGljaXR5IGFzIHRoZXkgCj4gZW5jb2RlIHRoZSBzaXplIGZv
ciB0aGUgMiByZWdpc3RlcnMgaW4gb25seSBhIHNpbmdsZSBiaXQgKGkuZSBzZikuCj4gCj4gPiAK
PiA+IFRoaXMgd2lsbCBjb21waWxlIGFzIGl0IGlzIGFybTY0IHNwZWNpZmljLCBidXQgaXQgbG9v
a3MganVzdCBhcyB3cm9uZwo+ID4gKHBlciB0aGUgY29tbWl0IG1lc3NhZ2UpIGFzIHVzaW5nIGlu
dCBpbiB0aGUgZmlyc3QgcGxhY2UuCj4gU2VlIGFib3ZlLiBJIGNhbiBjbGFyaWZ5IGl0IGluIHRo
ZSBjb21taXQgbWVzc2FnZS4KCkkgYWdyZWUgd2l0aCBBbmRyZXc6IEkgY2FuIHNlZSB0aGF0IHRo
ZSBjb2RlIGlzIGNvcnJlY3QsIGJ1dCBpdCByZWFsbHkKbG9va3Mgd3JvbmcgYXQgZmlyc3Qgc2ln
aHQuIFdoeSBub3QgdXNlIHVuc2lnbmVkIGxvbmc/IFRoaXMgaXMgYW4gYXJtNjQKaGVhZGVyIGFu
eXdheS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
