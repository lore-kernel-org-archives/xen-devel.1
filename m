From: Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH v2] xen-mapcache: use MAP_FIXED flag so the
 mmap address hint is always honored
Date: Mon, 18 Mar 2019 16:35:03 +0000
Message-ID: <20190318163503.GI11621@perard.uk.xensource.com>
References: <20190318154545.13974-1-roger.pau@citrix.com>
 <8920b229-45b4-8490-1476-8a5274b97ffe@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=yH2q=RV=citrix.com=prvs=973f489d5=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1h5vEv-0002XB-LM
 for xen-devel@lists.xenproject.org; Mon, 18 Mar 2019 16:35:53 +0000
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org, Paul Durrant <paul.durrant@citrix.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, xen-devel@lists.xenproject.org, Paolo Bonzini <pbonzini@redhat.com>, Roger Pau Monne <roger.pau@citrix.com>, Richard Henderson <rth@twiddle.net>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBNYXIgMTgsIDIwMTkgYXQgMDM6NDg6NTlQTSArMDAwMCwgSWdvciBEcnV6aGluaW4g
d3JvdGU6Cj4gT24gMTgvMDMvMjAxOSAxNTo0NSwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+ID4g
ZGlmZiAtLWdpdCBhL2h3L2kzODYveGVuL3hlbi1tYXBjYWNoZS5jIGIvaHcvaTM4Ni94ZW4veGVu
LW1hcGNhY2hlLmMKPiA+IGluZGV4IDM0OWY3MmQwMGMuLjIzZGU1NTE3ZGIgMTAwNjQ0Cj4gPiAt
LS0gYS9ody9pMzg2L3hlbi94ZW4tbWFwY2FjaGUuYwo+ID4gKysrIGIvaHcvaTM4Ni94ZW4veGVu
LW1hcGNhY2hlLmMKPiA+IEBAIC0xODUsOCArMTg1LDEzIEBAIHN0YXRpYyB2b2lkIHhlbl9yZW1h
cF9idWNrZXQoTWFwQ2FjaGVFbnRyeSAqZW50cnksCj4gPiAgICAgIH0KPiA+ICAKPiA+ICAgICAg
aWYgKCFkdW1teSkgewo+ID4gKyAgICAgICAgLyoKPiA+ICsgICAgICAgICAqIElmIHRoZSBjYWxs
ZXIgaGFzIHJlcXVlc3RlZCB0aGUgbWFwcGluZyBhdCBhIHNwZWNpZmljIGFkZHJlc3MgdXNlCj4g
PiArICAgICAgICAgKiBNQVBfRklYRUQgdG8gbWFrZSBzdXJlIGl0J3MgaG9ub3JlZC4KPiA+ICsg
ICAgICAgICAqLwo+IAo+IFNpbmNlIHRoZSBjb21tZW50IG5vdyBhcHBsaWVkIHRvIGJvdGggaW52
b2NhdGlvbiAtIGNvdWxkIGl0IGJlIG1vdmVkCj4gb3V0c2lkZSB0aGUgaWYgc3RhdGVtZW50IHRo
ZW4/CgpUaGF0IHNvdW5kcyBnb29kIHRvIG1lLgoKLS0gCkFudGhvbnkgUEVSQVJECgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
