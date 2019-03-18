From: Igor Druzhinin <igor.druzhinin@citrix.com>
Subject: Re: [PATCH v2] xen-mapcache: use MAP_FIXED flag so the
 mmap address hint is always honored
Date: Mon, 18 Mar 2019 15:48:59 +0000
Message-ID: <8920b229-45b4-8490-1476-8a5274b97ffe@citrix.com>
References: <20190318154545.13974-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=MxND=RV=citrix.com=prvs=973d7f055=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1h5uVj-0005KR-56
 for xen-devel@lists.xenproject.org; Mon, 18 Mar 2019 15:49:11 +0000
In-Reply-To: <20190318154545.13974-1-roger.pau@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>, qemu-devel@nongnu.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, Paul Durrant <paul.durrant@citrix.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, xen-devel@lists.xenproject.org, Anthony Perard <anthony.perard@citrix.com>, Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
List-Id: xen-devel@lists.xenproject.org

T24gMTgvMDMvMjAxOSAxNTo0NSwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+IE9yIGlmIGl0J3Mg
bm90IHBvc3NpYmxlIHRvIGhvbm9yIHRoZSBoaW50ZWQgYWRkcmVzcyBhbiBlcnJvciBpcyByZXR1
cm5lZAo+IGluc3RlYWQuIFRoaXMgbWFrZXMgaXQgZWFzaWVyIHRvIHNwb3QgdGhlIGFjdHVhbCBm
YWlsdXJlLCBpbnN0ZWFkIG9mCj4gZmFpbGluZyBsYXRlciBvbiB3aGVuIHRoZSBjYWxsZXIgb2Yg
eGVuX3JlbWFwX2J1Y2tldCByZWFsaXplcyB0aGUKPiBtYXBwaW5nIGhhcyBub3QgYmVlbiBjcmVh
dGVkIGF0IHRoZSByZXF1ZXN0ZWQgYWRkcmVzcy4KPiAKPiBBbHNvIG5vdGUgdGhhdCBhdCBsZWFz
dCBvbiBGcmVlQlNEIHVzaW5nIE1BUF9GSVhFRCB3aWxsIGNhdXNlIG1tYXAgdG8KPiB0cnkgaGFy
ZGVyIHRvIGhvbm9yIHRoZSBwYXNzZWQgYWRkcmVzcy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBSb2dl
ciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KPiAtLS0KPiBDYzogU3RlZmFubyBT
dGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPgo+IENjOiBBbnRob255IFBlcmFyZCA8
YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbT4KPiBDYzogUGF1bCBEdXJyYW50IDxwYXVsLmR1cnJh
bnRAY2l0cml4LmNvbT4KPiBDYzogSWdvciBEcnV6aGluaW4gPGlnb3IuZHJ1emhpbmluQGNpdHJp
eC5jb20+Cj4gQ2M6IFBhb2xvIEJvbnppbmkgPHBib256aW5pQHJlZGhhdC5jb20+Cj4gQ2M6IFJp
Y2hhcmQgSGVuZGVyc29uIDxydGhAdHdpZGRsZS5uZXQ+Cj4gQ2M6IEVkdWFyZG8gSGFia29zdCA8
ZWhhYmtvc3RAcmVkaGF0LmNvbT4KPiBDYzogIk1pY2hhZWwgUy4gVHNpcmtpbiIgPG1zdEByZWRo
YXQuY29tPgo+IENjOiBNYXJjZWwgQXBmZWxiYXVtIDxtYXJjZWwuYXBmZWxiYXVtQGdtYWlsLmNv
bT4KPiBDYzogeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCj4gLS0tCj4gQ2hhbmdlcyBz
aW5jZSB2MToKPiAgLSBVc2UgTUFQX0ZJWEVEIGZvciB0aGUgZHVtbXkgbW1hcCBjYWxsIGFsc28g
aWYgYSBzcGVjaWZpYyB2aXJ0dWFsCj4gICAgYWRkcmVzcyBpcyByZXF1ZXN0ZWQuCj4gLS0tCj4g
IGh3L2kzODYveGVuL3hlbi1tYXBjYWNoZS5jIHwgMTAgKysrKysrKystLQo+ICAxIGZpbGUgY2hh
bmdlZCwgOCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9o
dy9pMzg2L3hlbi94ZW4tbWFwY2FjaGUuYyBiL2h3L2kzODYveGVuL3hlbi1tYXBjYWNoZS5jCj4g
aW5kZXggMzQ5ZjcyZDAwYy4uMjNkZTU1MTdkYiAxMDA2NDQKPiAtLS0gYS9ody9pMzg2L3hlbi94
ZW4tbWFwY2FjaGUuYwo+ICsrKyBiL2h3L2kzODYveGVuL3hlbi1tYXBjYWNoZS5jCj4gQEAgLTE4
NSw4ICsxODUsMTMgQEAgc3RhdGljIHZvaWQgeGVuX3JlbWFwX2J1Y2tldChNYXBDYWNoZUVudHJ5
ICplbnRyeSwKPiAgICAgIH0KPiAgCj4gICAgICBpZiAoIWR1bW15KSB7Cj4gKyAgICAgICAgLyoK
PiArICAgICAgICAgKiBJZiB0aGUgY2FsbGVyIGhhcyByZXF1ZXN0ZWQgdGhlIG1hcHBpbmcgYXQg
YSBzcGVjaWZpYyBhZGRyZXNzIHVzZQo+ICsgICAgICAgICAqIE1BUF9GSVhFRCB0byBtYWtlIHN1
cmUgaXQncyBob25vcmVkLgo+ICsgICAgICAgICAqLwoKU2luY2UgdGhlIGNvbW1lbnQgbm93IGFw
cGxpZWQgdG8gYm90aCBpbnZvY2F0aW9uIC0gY291bGQgaXQgYmUgbW92ZWQKb3V0c2lkZSB0aGUg
aWYgc3RhdGVtZW50IHRoZW4/CgpJZ29yCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
