From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] x86/altp2m: Add a subop for obtaining the
 mem access of a page
Date: Wed, 04 Jul 2018 09:36:00 -0600
Message-ID: <5B3CE96002000078001D1224@prv1-mh.provo.novell.com>
References: <20180628130036.23241-1-apop@bitdefender.com>
 <5B36529202000078001CF466@prv1-mh.provo.novell.com>
 <20180704122045.GA3652@hel> <20180704132015.GA12259@hel>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=vtxc=ju=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fajp8-0000u8-Df
 for xen-devel@lists.xenproject.org; Wed, 04 Jul 2018 15:36:06 +0000
In-Reply-To: <20180704132015.GA12259@hel>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Adrian Pop <apop@bitdefender.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Razvan Cojocaru <rcojocaru@bitdefender.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, tamas@tklengyel.com, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA0LjA3LjE4IGF0IDE1OjIwLCA8YXBvcEBiaXRkZWZlbmRlci5jb20+IHdyb3RlOgo+
IE9uIFdlZCwgSnVsIDA0LCAyMDE4IGF0IDAzOjIwOjQ1UE0gKzAzMDAsIEFkcmlhbiBQT1Agd3Jv
dGU6Cj4+IE9uIEZyaSwgSnVuIDI5LCAyMDE4IGF0IDA5OjM4OjU4QU0gLTA2MDAsIEphbiBCZXVs
aWNoIHdyb3RlOgo+PiA+ID4gLS0tIGEveGVuL2FyY2gveDg2L21tL21lbV9hY2Nlc3MuYwo+PiA+
ID4gKysrIGIveGVuL2FyY2gveDg2L21tL21lbV9hY2Nlc3MuYwo+PiA+ID4gQEAgLTMyLDE3ICsz
MiwxMCBAQAo+PiA+ID4gIAo+PiA+ID4gICNpbmNsdWRlICJtbS1sb2Nrcy5oIgo+PiA+ID4gIAo+
PiA+ID4gLS8qCj4+ID4gPiAtICogR2V0IGFjY2VzcyB0eXBlIGZvciBhIGdmbi4KPj4gPiA+IC0g
KiBJZiBnZm4gPT0gSU5WQUxJRF9HRk4sIGdldHMgdGhlIGRlZmF1bHQgYWNjZXNzIHR5cGUuCj4+
ID4gPiAtICovCj4+ID4gPiAtc3RhdGljIGludCBfcDJtX2dldF9tZW1fYWNjZXNzKHN0cnVjdCBw
Mm1fZG9tYWluICpwMm0sIGdmbl90IGdmbiwKPj4gPiA+IC0gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgeGVubWVtX2FjY2Vzc190ICphY2Nlc3MpCj4+ID4gPiArc3RhdGljIGludCBwMm1f
YWNjZXNzX3RvX3hlbm1lbV9hY2Nlc3Moc3RydWN0IHAybV9kb21haW4gKnAybSwKPj4gPiAKPj4g
PiBUaGlzIGlzIG5vdCBldmVuIHAybSBjb2RlIC0gd2h5IHRoZSBwMm1fIHByZWZpeD8KPj4gCj4+
IFRoZXJlJ3MgaW5kZWVkIG5vIHJlYXNvbiBmb3IgdGhpcyB0byBoYXZlIHRoZSBwMm1fIHByZWZp
eC4gIFdpbGwgcmVtb3ZlCj4+IGl0Lgo+IAo+IE9oIEkgcmVtZW1iZXIgbm93LiAgVGhlIHAybV8g
cHJlZml4IHdhcyBhZGRlZCB0aGVyZSBiZWNhdXNlIHRoZSBoZWxwZXIKPiBmdW5jdGlvbiBjb252
ZXJ0cyBhIHAybV9hY2Nlc3NfdCB0byBhIHhlbm1lbV9hY2Nlc3NfdCwgc28KPiBwMm1fYWNjZXNz
X3RvX3hlbm1lbV9hY2Nlc3MoKS4gIFRvb2sgdGhlIG5hbWluZyBmcm9tIHRoZSBjb21wbGVtZW50
YXJ5Cj4gZnVuY3Rpb24sIHhlbm1lbV9hY2Nlc3NfdG9fcDJtX2FjY2VzcygpLiAgSSBjb3VsZCBh
ZGQgYSBjb21tZW50IHRvCj4gY2xhcmlmeSB0aGlzLgoKT2gsIG9mIGNvdXJzZSAtIEkgc2ltcGx5
IHdhc24ndCBwYXlpbmcgYXR0ZW50aW9uIHRvIHRoaXMgYXNwZWN0LCBzb3JyeS4KCkphbgoKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
