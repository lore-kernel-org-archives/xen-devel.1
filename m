From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v3 15/15] argo: validate hypercall arg
 structures via compat machinery
Date: Thu, 17 Jan 2019 04:25:39 -0700
Message-ID: <5C406633020000780020E9BC@prv1-mh.provo.novell.com>
References: <1546846968-7372-1-git-send-email-christopher.w.clark@gmail.com>
 <1546846968-7372-16-git-send-email-christopher.w.clark@gmail.com>
 <5C3C874D020000780020D3D4@prv1-mh.provo.novell.com>
 <CACMJ4Gbcf9xXBATQsJtjx4LuiAxUXqjh8J3cevO+3x+6E-sZZQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=SW9P=PZ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gk5np-0006Ru-Gp
 for xen-devel@lists.xenproject.org; Thu, 17 Jan 2019 11:25:41 +0000
In-Reply-To: <CACMJ4Gbcf9xXBATQsJtjx4LuiAxUXqjh8J3cevO+3x+6E-sZZQ@mail.gmail.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Christopher Clark <christopher.w.clark@gmail.com>
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, ross.philipson@gmail.com, Jason Andryuk <jandryuk@gmail.com>, Daniel Smith <dpsmith@apertussolutions.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Rich Persaud <persaur@gmail.com>, James McKenzie <james@bromium.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, eric chanudet <eric.chanudet@gmail.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE3LjAxLjE5IGF0IDA4OjIyLCA8Y2hyaXN0b3BoZXIudy5jbGFya0BnbWFpbC5jb20+
IHdyb3RlOgo+IFNvbWUgZGV0YWlscyBvZiB0aGUgcHJvYmxlbToKPiAKPiBXaXRob3V0IHRoZSBt
YWNybyBvdmVycmlkZXMgaW4gcGxhY2UgKGllLiB1c2luZyB0aGUgZXhpc3RpbmcKPiBkZWZpbml0
aW9ucykgdGhlIGJ1aWxkIGZhaWxzIG9uIENIRUNLX2FyZ29fc2VuZF9hZGRyICBiZWNhdXNlIHRo
aXMKPiBzdHJ1Y3QgaXMgZGVmaW5lZCB3aXRoIHR5cGVzIHRoYXQgYXJlIHRoZW1zZWx2ZXMgdHJh
bnNsYXRlZCBieSB0aGUKPiBjb21wYXQgcHJvY2Vzc2luZzoKCkJ1dCB0aGF0J3MgYSBub3JtYWwg
c2l0dWF0aW9uLgoKPiB0eXBlZGVmIHN0cnVjdCB4ZW5fYXJnb19zZW5kX2FkZHIKPiB7Cj4gICAg
IHhlbl9hcmdvX2FkZHJfdCBzcmM7Cj4gICAgIHhlbl9hcmdvX2FkZHJfdCBkc3Q7Cj4gfSB4ZW5f
YXJnb19zZW5kX2FkZHJfdDsKPiAKPiBjb21wYXQvYXJnby5jOiBJbiBmdW5jdGlvbiAnX19jaGVj
a0ZzdHJ1Y3RfYXJnb19zZW5kX2FkZHJfX3NyYyc6Cj4geGVuL2luY2x1ZGUveGVuL2NvbXBhdC5o
OjE3MDoxODogZXJyb3I6IGNvbXBhcmlzb24gb2YgZGlzdGluY3QgcG9pbnRlcgo+IHR5cGVzIGxh
Y2tzIGEgY2FzdCBbLVdlcnJvcl0KPiAgICAgIHJldHVybiAmeC0+ZiA9PSAmYy0+ZjsgXAo+ICAg
ICAgICAgICAgICAgICAgIF4KPiB4ZW4vaW5jbHVkZS94ZW4vY29tcGF0Lmg6MTc2OjU6IG5vdGU6
IGluIGV4cGFuc2lvbiBvZiBtYWNybwo+ICdDSEVDS19GSUVMRF9DT01NT05fJwo+ICAgICAgQ0hF
Q0tfRklFTERfQ09NTU9OXyhrLCBDSEVDS19OQU1FXyhrLCBuICMjIF9fICMjIGYsIEYpLCBuLCBm
KQo+ICAgICAgXn5+fn5+fn5+fn5+fn5+fn5+fgo+IHhlbi9pbmNsdWRlL2NvbXBhdC94bGF0Lmg6
MTIzODo1OiBub3RlOiBpbiBleHBhbnNpb24gb2YgbWFjcm8gJ0NIRUNLX0ZJRUxEXycKPiAgICAg
IENIRUNLX0ZJRUxEXyhzdHJ1Y3QsIGFyZ29fc2VuZF9hZGRyLCBzcmMpOyBcCj4gICAgICBefn5+
fn5+fn5+fn4KPiBjb21wYXQvYXJnby5jOjQzOjE6IG5vdGU6IGluIGV4cGFuc2lvbiBvZiBtYWNy
byAnQ0hFQ0tfYXJnb19zZW5kX2FkZHInCj4gIENIRUNLX2FyZ29fc2VuZF9hZGRyOwo+ICBefn5+
fn5+fn5+fn5+fn5+fn5+fgo+IAo+IGJlY2F1c2UgeGVuX2FyZ29fYWRkcl90IGlzIGRldGVjdGVk
IGFzIGEgZGlmZmVyZW50IHR5cGUgdGhhbgo+IGNvbXBhdF9hcmdvX2FkZHJfdCAtLSB3aGVuIGlu
IHByYWN0aWNlIGlzIHRoZSBzYW1lIHNpemUgYW5kIGhhcyB0aGUKPiBzYW1lIGZpZWxkcyBhdCB0
aGUgc2FtZSBvZmZzZXRzLgoKRGlkIHlvdSBwZXJoYXBzIG5vdCBhZGQgZW50cmllcyBmb3IgdGhl
IGlubmVyIHN0cnVjdHVyZXMgdG8geGxhdC5sc3Q/Cgo+PiA+IC0tLSBhL3hlbi9jb21tb24vTWFr
ZWZpbGUKPj4gPiArKysgYi94ZW4vY29tbW9uL01ha2VmaWxlCj4+ID4gQEAgLTcwLDcgKzcwLDcg
QEAgb2JqLXkgKz0geG1hbGxvY190bHNmLm8KPj4gPiAgb2JqLWJpbi0kKENPTkZJR19YODYpICs9
ICQoZm9yZWFjaCBuLGRlY29tcHJlc3MgYnVuemlwMiB1bnh6IHVubHptYSB1bmx6byB1bmx6NCBl
YXJseWNwaW8sJChuKS5pbml0Lm8pCj4+ID4KPj4gPgo+PiA+IC1vYmotJChDT05GSUdfQ09NUEFU
KSArPSAkKGFkZHByZWZpeCBjb21wYXQvLGRvbWFpbi5vIGtlcm5lbC5vIG1lbW9yeS5vIG11bHRp
Y2FsbC5vIHhsYXQubykKPj4gPiArb2JqLSQoQ09ORklHX0NPTVBBVCkgKz0gJChhZGRwcmVmaXgg
Y29tcGF0LyxhcmdvLm8gZG9tYWluLm8ga2VybmVsLm8gbWVtb3J5Lm8gbXVsdGljYWxsLm8geGxh
dC5vKQo+Pgo+PiBXaGlsZSBhIG1hdHRlciBvZiB0YXN0ZSB0byBhIGNlcnRhaW4gZGVncmVlLCBJ
J20gbm90IGNvbnZpbmNlZAo+PiBpbnRyb2R1Y2luZyBhIHNlcGFyYXRlIGZpbGUgZm9yIHRoaXMg
aXMgcmVhbGx5IG5lY2Vzc2FyeSwgZXNwZWNpYWxseQo+PiBpZiBzb21lIG9mIHRoZSBvdmVycmlk
ZXMgdG8gdGhlIENIRUNLXyogbWFjcm9zIHdvdWxkIGdvIGF3YXkuCj4gCj4gYWNrLiBJIHdvdWxk
bid0IGhhdmUgbW92ZWQgdGhlbSBvdXQgaWYgdGhlIG92ZXJyaWRlcyB3ZXJlbid0IGluIHVzZTsK
PiBidXQgSSB3aWxsIG1lcmdlIGl0IGludG8gdGhlIGltcGxlbWVudGF0aW9uIGZpbGUgaWYgdGhh
dCBpcyBwcmVmZXJyZWQuCgpXZWxsIC0gbGV0J3MgZmlyc3Qgc2VlIHdoZXRoZXIgdGhlIG92ZXJy
aWRlcyBhcmUgcmVhbGx5IG5lZWRlZC4gSWYgc28sCmtlZXBpbmcgdGhpcyBpbiBhIHNlcGFyYXRl
IGZpbGUgbWlnaHQgaW5kZWVkIGJlIGJldHRlci4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
