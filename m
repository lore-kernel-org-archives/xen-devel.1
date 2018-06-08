From: Daniel Kiper <daniel.kiper@oracle.com>
Subject: Re: [PATCH v2] multiboot2: clarify usage of the address
 tag
Date: Fri, 8 Jun 2018 11:35:52 +0200
Message-ID: <20180608093552.GA20016__20660.122720483$1528450512$gmane$org@olila.local.net-space.pl>
References: <20180607155906.14304-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=jljr=i2=oracle.com=daniel.kiper@srs-us1.protection.inumbo.net>)
 id 1fRDoU-0003HQ-UF
 for xen-devel@lists.xenproject.org; Fri, 08 Jun 2018 09:36:06 +0000
Content-Disposition: inline
In-Reply-To: <20180607155906.14304-1-roger.pau@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: grub-devel@gnu.org, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBKdW4gMDcsIDIwMTggYXQgMDU6NTk6MDZQTSArMDIwMCwgUm9nZXIgUGF1IE1vbm5l
IHdyb3RlOgo+IEFkZCBhIG5vdGUgdG8gc3BlbGwgb3V0IHRoYXQgaWYgdGhlIGFkZHJlc3MgdGFn
IGlzIG5vdCBwcmVzZW50IHRoZQo+IGZpbGUgc2hvdWxkIGJlIGxvYWRlZCB1c2luZyB0aGUgZWxm
IGhlYWRlci4KPgo+IFNpZ25lZC1vZmYtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBj
aXRyaXguY29tPgo+IC0tLQo+IENjOiBEYW5pZWwgS2lwZXIgPGRhbmllbC5raXBlckBvcmFjbGUu
Y29tPgo+IENjOiB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKPiAtLS0KPiBDaGFuZ2Vz
IHNpbmNlIHYxOgo+ICAtIHMvZWxmL0BzY3tlbGZ9Lwo+ICAtIHMvTXVsdGlib290L011bHRpYm9v
dDIvCj4gLS0tCj4gIGRvYy9tdWx0aWJvb3QudGV4aSB8IDYgKysrKysrCj4gIDEgZmlsZSBjaGFu
Z2VkLCA2IGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS9kb2MvbXVsdGlib290LnRleGkg
Yi9kb2MvbXVsdGlib290LnRleGkKPiBpbmRleCAyZTJkN2U3NGEuLjNjNzk3Nzg3YyAxMDA2NDQK
PiAtLS0gYS9kb2MvbXVsdGlib290LnRleGkKPiArKysgYi9kb2MvbXVsdGlib290LnRleGkKPiBA
QCAtNTA5LDYgKzUwOSwxMiBAQCBhc3N1bWVzIHRoYXQgbm8gYnNzIHNlZ21lbnQgaXMgcHJlc2Vu
dC4KPgo+ICBAZW5kIHRhYmxlCj4KPiArTm90ZTogVGhpcyBpbmZvcm1hdGlvbiBkb2VzIG5vdCBu
ZWVkIHRvIGJlIHByb3ZpZGVkIGlmIHRoZSBrZXJuZWwgaW1hZ2UKPiAraXMgaW4gQHNje2VsZn0g
Zm9ybWF0LCBidXQgaXQgbXVzdCBiZSBwcm92aWRlZCBpZiB0aGUgaW1hZ2UgaXMgaW4gYS5vdXQK
PiArZm9ybWF0IG9yIGluIHNvbWUgb3RoZXIgZm9ybWF0LiBDb21wbGlhbnQgYm9vdCBsb2FkZXJz
IG11c3QgYmUgYWJsZSB0bwo+ICtsb2FkIGltYWdlcyB0aGF0IGFyZSBlaXRoZXIgaW4gQHNje2Vs
Zn0gZm9ybWF0IG9yIGNvbnRhaW4gdGhlIGFkZHJlc3MKPiArdGFnIGVtYmVkZGVkIGluIHRoZSBN
dWx0aWJvb3QyIGhlYWRlci4KPiArCgpOb3cgaXQgaXMgYmV0dGVyLiBIb3dldmVyLCB0aGVyZSBp
cyBhIGxhY2sgb2YgaW5mb3JtYXRpb24gdGhhdCB0aGlzIHRhZwpzaG91bGQgYmUgcHJlZmVycmVk
IG92ZXIgdGhlIHJlbGV2YW50IGRhdGEgcHJvdmlkZWQgaW4gdGhlIEVMRiBoZWFkZXIgaWYKYm90
aCBhcmUgYXZhaWxhYmxlIGluIHRoZSBpbWFnZS4gVGhpcyBoYXZlIHRvIGJlIGNsZWFyIGxpa2Ug
aXQgaXMgaW4KTXVsdGlib290IHNwZWMuCgpEYW5pZWwKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
