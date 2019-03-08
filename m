From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v4.1 4/6] xen/x86: Allow stubdom access to
 irq created for msi.
Date: Fri, 08 Mar 2019 10:04:50 -0700
Message-ID: <5C82A0B2020000780021CC8A@prv1-mh.provo.novell.com>
References: <20190208101559.GA21228@mail-itl>
 <20190208101705.31790-1-marmarek@invisiblethingslab.com>
 <20190221164751.hjtyddw63ztmc3yk@Air-de-Roger>
 <20190221174040.GV21228@mail-itl>
 <20190222104222.p7niwzgngaf3uz2k@Air-de-Roger>
 <20190307005004.GC19265@mail-itl>
 <20190307144801.vh6fcvp6mj3e6puj@Air-de-Roger>
 <20190307222825.GE19265@mail-itl>
 <20190308102628.ndpwh67jlpe5nnrn@Air-de-Roger>
 <20190308164941.GH19265@mail-itl>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ic8h=RL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1h2IvZ-00072K-BD
 for xen-devel@lists.xenproject.org; Fri, 08 Mar 2019 17:04:57 +0000
In-Reply-To: <20190308164941.GH19265@mail-itl>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Marek Marczykowski <marmarek@invisiblethingslab.com>
Cc: Kevin Tian <kevin.tian@intel.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Simon Gaiser <simon@invisiblethingslab.com>, Julien Grall <julien.grall@arm.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, xen-devel <xen-devel@lists.xenproject.org>, Brian Woods <brian.woods@amd.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA4LjAzLjE5IGF0IDE3OjQ5LCA8bWFybWFyZWtAaW52aXNpYmxldGhpbmdzbGFiLmNv
bT4gd3JvdGU6Cj4gT24gRnJpLCBNYXIgMDgsIDIwMTkgYXQgMTE6MjY6MjhBTSArMDEwMCwgUm9n
ZXIgUGF1IE1vbm7DqSB3cm90ZToKPj4gT24gVGh1LCBNYXIgMDcsIDIwMTkgYXQgMTE6Mjg6MjVQ
TSArMDEwMCwgTWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tpIHdyb3RlOgo+PiA+IENhbiBvbmUg
SFZNIGRvbWFpbiBoYXZlIG11bHRpcGxlIHN0dWJkb21haW5zPyBJZiBzbywgaXQgc2hvdWxkIGEg
YmUKPj4gPiBsaXN0LCBub3QgYSBzaW5nbGUgZmllbGQuCj4+IAo+PiBZZXMsIEkgdGhpbmsgdGhh
dCdzIGEgc3VwcG9ydGVkIHNldHVwLiBZb3UgY2FuIHJlZ2lzdGVyIG11bHRpcGxlIGlvcmVxCj4+
IHNlcnZlcnMgaGFuZGxpbmcgYWNjZXNzZXMgZm9yIGEgc2luZ2xlIGRvbWFpbiwgYW5kIHRoZXJl
J3Mgbm8KPj4gcmVzdHJpY3Rpb24gdGhhdCBmb3JjZXMgcnVubmluZyBhbGwgdGhvc2UgaW9yZXEg
c2VydmVycyBpbiB0aGUgc2FtZQo+PiBjb250cm9sIGRvbWFpbi4KPiAKPiBJIHdhcyBsb29raW5n
IGF0IGl0LCBhbmQgYWRkaW5nIGEgbGlzdCBvZiBzdHJ1Y3QgZG9tYWluIHBvaW50ZXJzIHdvdWxk
Cj4gYmUgZWFzeSwgYnV0IHdvdWxkIHJlcXVpcmUgYnJlYWtpbmcgY2lyY3VsYXIgZGVwZW5kZW5j
eSBkdXJpbmcgdGVhcmRvd24KPiAoaW4gZG9tYWluX2tpbGwpLiBBbmQgd2lsbCBhZGQgeWV0IGFu
b3RoZXIgc3RydWN0IGxpc3RfaGVhZCBpbnRvCj4gc3RydWN0IGRvbWFpbi4gT24gdGhlIG90aGVy
IGhhbmQsIGhhdmluZyBsaXN0IG9mIGRvbWFpbiBpZHMgd291bGQKPiByZXF1aXJlIGEgd3JhcHBl
ciBzdHJ1Y3R1cmUgb3Igc3VjaCAtIEkgZG9uJ3Qgc2VlIGFueSBBUEkgaW4gWGVuIGZvcgo+IHN0
b3JpbmcgbGlzdCBvZiBqdXN0IGludHMgKGRvbWlkX3Qgc3BlY2lmaWNhbGx5KS4gVXNpbmcgYW4g
YXJyYXkgZm9yCj4gc29tZXRoaW5nIHRoYXQgc2hvdWxkIHJlYWxseSBiZSBhIGxpc3QgbG9va3Mg
Y2x1bXN5IC0gYWxsIHRoZSBzZWFyY2hpbmcKPiBmb3IgZmlyc3QgYXZhaWxhYmxlIHNwYWNlLCBp
Z25vcmluZyBlbXB0eSBzbG90cyBldGMuIE1heWJlIHJhbmdlc2V0Cj4gY291bGQgYmUgdXNlZCBm
b3IgdGhhdD8KCkZvciBvbmUgcmFuZ2VzZXRzIGFyZSBtZWFudCBwcmltYXJpbHkgZm9yIHRoaW5n
cyB3aGljaCBjb21lIGluCihjb25zZWN1dGl2ZSkgZ3JvdXBzLCB3aGljaCBkb2Vzbid0IHNlZW0g
bGlrZSBhIGdvZCBmaXQgaGVyZS4gQW5kCnRoZW4gaXRzIG92ZXJoZWFkIGlzIGV2ZW4gaGlnaGVy
IChlc3BlY2lhbGx5IGZvciB0aGUgY29tbW9uIGNhc2UKb2YganVzdCBhIHNpbmdsZSBzdHViZG9t
KSBjb21wYXJlZCB0byB0aGUgc2ltcGxlc3QgZHluYW1pYyBmb3JtCm9mIGFsbG9jYXRpbmcgYW5k
IG1haW50YWluaW5nIGFuIGFycmF5IG9mIHN1aXRhYmxlIHNpemUgKGluIHdoaWNoCmNhc2UgeW91
J2QgcHJvYmFibHkgbm90IGV2ZW4gbmVlZCB0byBza2lwIGVtcHR5IHNsb3RzIG9yIHNlcmFjaApm
b3IgYXZhaWxhYmxlIHNwYWNlKS4KCkphbgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
