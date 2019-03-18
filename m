From: Paul Durrant <Paul.Durrant@citrix.com>
Subject: Re: [PATCH v2] xen-mapcache: use MAP_FIXED flag so the
 mmap address hint is always honored
Date: Mon, 18 Mar 2019 16:36:01 +0000
Message-ID: <09407c12ebf7443a991fd132efe2683b@AMSPEX02CL02.citrite.net>
References: <20190318154545.13974-1-roger.pau@citrix.com>
 <8920b229-45b4-8490-1476-8a5274b97ffe@citrix.com>
 <20190318163503.GI11621@perard.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=0sDq=RV=citrix.com=prvs=973115de2=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1h5vHN-0002eb-Mx
 for xen-devel@lists.xenproject.org; Mon, 18 Mar 2019 16:38:25 +0000
In-Reply-To: <20190318163503.GI11621@perard.uk.xensource.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Anthony Perard <anthony.perard@citrix.com>, Igor Druzhinin <igor.druzhinin@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Paolo Bonzini <pbonzini@redhat.com>, Roger Pau Monne <roger.pau@citrix.com>, Richard Henderson <rth@twiddle.net>
List-Id: xen-devel@lists.xenproject.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IEFudGhvbnkgUEVSQVJEIFttYWls
dG86YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbV0KPiBTZW50OiAxOCBNYXJjaCAyMDE5IDE2OjM1
Cj4gVG86IElnb3IgRHJ1emhpbmluIDxpZ29yLmRydXpoaW5pbkBjaXRyaXguY29tPgo+IENjOiBS
b2dlciBQYXUgTW9ubmUgPHJvZ2VyLnBhdUBjaXRyaXguY29tPjsgcWVtdS1kZXZlbEBub25nbnUu
b3JnOyBTdGVmYW5vIFN0YWJlbGxpbmkKPiA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz47IFBhdWwg
RHVycmFudCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+OyBQYW9sbyBCb256aW5pIDxwYm9uemlu
aUByZWRoYXQuY29tPjsKPiBSaWNoYXJkIEhlbmRlcnNvbiA8cnRoQHR3aWRkbGUubmV0PjsgRWR1
YXJkbyBIYWJrb3N0IDxlaGFia29zdEByZWRoYXQuY29tPjsgTWljaGFlbCBTLiBUc2lya2luCj4g
PG1zdEByZWRoYXQuY29tPjsgTWFyY2VsIEFwZmVsYmF1bSA8bWFyY2VsLmFwZmVsYmF1bUBnbWFp
bC5jb20+OyB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKPiBTdWJqZWN0OiBSZTogW1BB
VENIIHYyXSB4ZW4tbWFwY2FjaGU6IHVzZSBNQVBfRklYRUQgZmxhZyBzbyB0aGUgbW1hcCBhZGRy
ZXNzIGhpbnQgaXMgYWx3YXlzIGhvbm9yZWQKPiAKPiBPbiBNb24sIE1hciAxOCwgMjAxOSBhdCAw
Mzo0ODo1OVBNICswMDAwLCBJZ29yIERydXpoaW5pbiB3cm90ZToKPiA+IE9uIDE4LzAzLzIwMTkg
MTU6NDUsIFJvZ2VyIFBhdSBNb25uZSB3cm90ZToKPiA+ID4gZGlmZiAtLWdpdCBhL2h3L2kzODYv
eGVuL3hlbi1tYXBjYWNoZS5jIGIvaHcvaTM4Ni94ZW4veGVuLW1hcGNhY2hlLmMKPiA+ID4gaW5k
ZXggMzQ5ZjcyZDAwYy4uMjNkZTU1MTdkYiAxMDA2NDQKPiA+ID4gLS0tIGEvaHcvaTM4Ni94ZW4v
eGVuLW1hcGNhY2hlLmMKPiA+ID4gKysrIGIvaHcvaTM4Ni94ZW4veGVuLW1hcGNhY2hlLmMKPiA+
ID4gQEAgLTE4NSw4ICsxODUsMTMgQEAgc3RhdGljIHZvaWQgeGVuX3JlbWFwX2J1Y2tldChNYXBD
YWNoZUVudHJ5ICplbnRyeSwKPiA+ID4gICAgICB9Cj4gPiA+Cj4gPiA+ICAgICAgaWYgKCFkdW1t
eSkgewo+ID4gPiArICAgICAgICAvKgo+ID4gPiArICAgICAgICAgKiBJZiB0aGUgY2FsbGVyIGhh
cyByZXF1ZXN0ZWQgdGhlIG1hcHBpbmcgYXQgYSBzcGVjaWZpYyBhZGRyZXNzIHVzZQo+ID4gPiAr
ICAgICAgICAgKiBNQVBfRklYRUQgdG8gbWFrZSBzdXJlIGl0J3MgaG9ub3JlZC4KPiA+ID4gKyAg
ICAgICAgICovCj4gPgo+ID4gU2luY2UgdGhlIGNvbW1lbnQgbm93IGFwcGxpZWQgdG8gYm90aCBp
bnZvY2F0aW9uIC0gY291bGQgaXQgYmUgbW92ZWQKPiA+IG91dHNpZGUgdGhlIGlmIHN0YXRlbWVu
dCB0aGVuPwo+IAo+IFRoYXQgc291bmRzIGdvb2QgdG8gbWUuCgpJIGhhdmUgbm8gcHJvYmxlbSBh
bmQgbXkgUi1iIHN0aWxsIHN0YW5kcy4KCiAgUGF1bAoKPiAKPiAtLQo+IEFudGhvbnkgUEVSQVJE
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
