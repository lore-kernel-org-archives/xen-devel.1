From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH v2] xen-mapcache: use MAP_FIXED flag so the
 mmap address hint is always honored
Date: Mon, 18 Mar 2019 17:03:55 +0100
Message-ID: <20190318160355.yndhneqe4qtb6qwl@Air-de-Roger>
References: <20190318154545.13974-1-roger.pau@citrix.com>
 <8920b229-45b4-8490-1476-8a5274b97ffe@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8XUm=RV=citrix.com=prvs=97342a854=roger.pau@srs-us1.protection.inumbo.net>)
 id 1h5uls-0007tF-2Q
 for xen-devel@lists.xenproject.org; Mon, 18 Mar 2019 16:05:52 +0000
Content-Disposition: inline
In-Reply-To: <8920b229-45b4-8490-1476-8a5274b97ffe@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Igor Druzhinin <igor.druzhinin@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Eduardo Habkost <ehabkost@redhat.com>, "Michael
 S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org, Paul Durrant <paul.durrant@citrix.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, xen-devel@lists.xenproject.org, Anthony Perard <anthony.perard@citrix.com>, Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBNYXIgMTgsIDIwMTkgYXQgMDM6NDg6NTlQTSArMDAwMCwgSWdvciBEcnV6aGluaW4g
d3JvdGU6Cj4gT24gMTgvMDMvMjAxOSAxNTo0NSwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+ID4g
T3IgaWYgaXQncyBub3QgcG9zc2libGUgdG8gaG9ub3IgdGhlIGhpbnRlZCBhZGRyZXNzIGFuIGVy
cm9yIGlzIHJldHVybmVkCj4gPiBpbnN0ZWFkLiBUaGlzIG1ha2VzIGl0IGVhc2llciB0byBzcG90
IHRoZSBhY3R1YWwgZmFpbHVyZSwgaW5zdGVhZCBvZgo+ID4gZmFpbGluZyBsYXRlciBvbiB3aGVu
IHRoZSBjYWxsZXIgb2YgeGVuX3JlbWFwX2J1Y2tldCByZWFsaXplcyB0aGUKPiA+IG1hcHBpbmcg
aGFzIG5vdCBiZWVuIGNyZWF0ZWQgYXQgdGhlIHJlcXVlc3RlZCBhZGRyZXNzLgo+ID4gCj4gPiBB
bHNvIG5vdGUgdGhhdCBhdCBsZWFzdCBvbiBGcmVlQlNEIHVzaW5nIE1BUF9GSVhFRCB3aWxsIGNh
dXNlIG1tYXAgdG8KPiA+IHRyeSBoYXJkZXIgdG8gaG9ub3IgdGhlIHBhc3NlZCBhZGRyZXNzLgo+
ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4
LmNvbT4KPiA+IC0tLQo+ID4gQ2M6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2Vy
bmVsLm9yZz4KPiA+IENjOiBBbnRob255IFBlcmFyZCA8YW50aG9ueS5wZXJhcmRAY2l0cml4LmNv
bT4KPiA+IENjOiBQYXVsIER1cnJhbnQgPHBhdWwuZHVycmFudEBjaXRyaXguY29tPgo+ID4gQ2M6
IElnb3IgRHJ1emhpbmluIDxpZ29yLmRydXpoaW5pbkBjaXRyaXguY29tPgo+ID4gQ2M6IFBhb2xv
IEJvbnppbmkgPHBib256aW5pQHJlZGhhdC5jb20+Cj4gPiBDYzogUmljaGFyZCBIZW5kZXJzb24g
PHJ0aEB0d2lkZGxlLm5ldD4KPiA+IENjOiBFZHVhcmRvIEhhYmtvc3QgPGVoYWJrb3N0QHJlZGhh
dC5jb20+Cj4gPiBDYzogIk1pY2hhZWwgUy4gVHNpcmtpbiIgPG1zdEByZWRoYXQuY29tPgo+ID4g
Q2M6IE1hcmNlbCBBcGZlbGJhdW0gPG1hcmNlbC5hcGZlbGJhdW1AZ21haWwuY29tPgo+ID4gQ2M6
IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwo+ID4gLS0tCj4gPiBDaGFuZ2VzIHNpbmNl
IHYxOgo+ID4gIC0gVXNlIE1BUF9GSVhFRCBmb3IgdGhlIGR1bW15IG1tYXAgY2FsbCBhbHNvIGlm
IGEgc3BlY2lmaWMgdmlydHVhbAo+ID4gICAgYWRkcmVzcyBpcyByZXF1ZXN0ZWQuCj4gPiAtLS0K
PiA+ICBody9pMzg2L3hlbi94ZW4tbWFwY2FjaGUuYyB8IDEwICsrKysrKysrLS0KPiA+ICAxIGZp
bGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+ID4gCj4gPiBkaWZm
IC0tZ2l0IGEvaHcvaTM4Ni94ZW4veGVuLW1hcGNhY2hlLmMgYi9ody9pMzg2L3hlbi94ZW4tbWFw
Y2FjaGUuYwo+ID4gaW5kZXggMzQ5ZjcyZDAwYy4uMjNkZTU1MTdkYiAxMDA2NDQKPiA+IC0tLSBh
L2h3L2kzODYveGVuL3hlbi1tYXBjYWNoZS5jCj4gPiArKysgYi9ody9pMzg2L3hlbi94ZW4tbWFw
Y2FjaGUuYwo+ID4gQEAgLTE4NSw4ICsxODUsMTMgQEAgc3RhdGljIHZvaWQgeGVuX3JlbWFwX2J1
Y2tldChNYXBDYWNoZUVudHJ5ICplbnRyeSwKPiA+ICAgICAgfQo+ID4gIAo+ID4gICAgICBpZiAo
IWR1bW15KSB7Cj4gPiArICAgICAgICAvKgo+ID4gKyAgICAgICAgICogSWYgdGhlIGNhbGxlciBo
YXMgcmVxdWVzdGVkIHRoZSBtYXBwaW5nIGF0IGEgc3BlY2lmaWMgYWRkcmVzcyB1c2UKPiA+ICsg
ICAgICAgICAqIE1BUF9GSVhFRCB0byBtYWtlIHN1cmUgaXQncyBob25vcmVkLgo+ID4gKyAgICAg
ICAgICovCj4gCj4gU2luY2UgdGhlIGNvbW1lbnQgbm93IGFwcGxpZWQgdG8gYm90aCBpbnZvY2F0
aW9uIC0gY291bGQgaXQgYmUgbW92ZWQKPiBvdXRzaWRlIHRoZSBpZiBzdGF0ZW1lbnQgdGhlbj8K
CkkgZmVsdCB0aGF0IHdhcyB0b28gZmFyIGZyb20gdGhlIGFjdHVhbCBjYWxsLCBidXQgSSBjYW4g
bW92ZSBpdCBpZgp0aGVyZSdzIGNvbnNlbnN1cy4KClRoYW5rcywgUm9nZXIuCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
