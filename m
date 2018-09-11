From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v6 09/14] mm / iommu: include need_iommu()
 test in iommu_use_hap_pt()
Date: Tue, 11 Sep 2018 03:47:30 -0600
Message-ID: <5B978F3202000078001E722A@prv1-mh.provo.novell.com>
References: <20180823094711.21376-1-paul.durrant@citrix.com>
 <20180823094711.21376-10-paul.durrant@citrix.com>
 <5B925EF202000078001E655B@prv1-mh.provo.novell.com>
 <1ed1d6509b3043e89ccfe352a9b64ad4@AMSPEX02CL03.citrite.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=zj+h=lz=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fzfGi-0000VU-1R
 for xen-devel@lists.xenproject.org; Tue, 11 Sep 2018 09:47:36 +0000
In-Reply-To: <1ed1d6509b3043e89ccfe352a9b64ad4@AMSPEX02CL03.citrite.net>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <paul.durrant@citrix.com>
Cc: Kevin Tian <kevin.tian@intel.com>, Stefano Stabellini <sstabellini@kernel.org>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Andrew Cooper <andrew.cooper3@citrix.com>, george.dunlap@citrix.com, Julien Grall <julien.grall@arm.com>, Jun Nakajima <jun.nakajima@intel.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDExLjA5LjE4IGF0IDExOjM5LCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+IHdyb3Rl
Ogo+PiAgLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0KPj4gRnJvbTogSmFuIEJldWxpY2ggW21h
aWx0bzpKQmV1bGljaEBzdXNlLmNvbV0KPj4gU2VudDogMDcgU2VwdGVtYmVyIDIwMTggMTI6MjAK
Pj4gVG86IFBhdWwgRHVycmFudCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+Cj4+IENjOiBKdWxp
ZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPjsgQW5kcmV3IENvb3Blcgo+PiA8QW5kcmV3
LkNvb3BlcjNAY2l0cml4LmNvbT47IEdlb3JnZSBEdW5sYXAKPj4gPEdlb3JnZS5EdW5sYXBAY2l0
cml4LmNvbT47IEp1biBOYWthamltYSA8anVuLm5ha2FqaW1hQGludGVsLmNvbT47Cj4+IFN0ZWZh
bm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz47IHhlbi1kZXZlbCA8eGVuLQo+
PiBkZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZz4KPj4gU3ViamVjdDogUmU6IFtQQVRDSCB2NiAw
OS8xNF0gbW0gLyBpb21tdTogaW5jbHVkZSBuZWVkX2lvbW11KCkgdGVzdCBpbgo+PiBpb21tdV91
c2VfaGFwX3B0KCkKPj4gCj4+ID4+PiBPbiAyMy4wOC4xOCBhdCAxMTo0NywgPHBhdWwuZHVycmFu
dEBjaXRyaXguY29tPiB3cm90ZToKPj4gPiBUaGUgbmFtZSAnaW9tbXVfdXNlX2hhcF9wdCcgc3Vn
Z2VzdHMgdGhhdCB0aGF0IFAyTSB0YWJsZSBpcyBpbiB1c2UgYXMKPj4gdGhlCj4+ID4gZG9tYWlu
J3MgSU9NTVUgcGFnZXRhYmxlIHdoaWNoLCBwcmlvciB0byB0aGlzIHBhdGNoLCBpcyBub3Qgc3Ry
aWN0bHkgdHJ1ZQo+PiA+IHNpbmNlIHRoZSBtYWNybyBkaWQgbm90IHRlc3Qgd2hldGhlciB0aGUg
ZG9tYWluIGFjdHVhbGx5IGhhcyBJT01NVQo+PiA+IG1hcHBpbmdzLgo+PiAKPj4gSG1tLCBJIHdv
dWxkIG5ldmVyIGhhdmUgaW1wbGllZCAiaGFzIElPTU1VIG1hcHBpbmdzIiBmcm9tIHRoaXMKPj4g
dmFyaWFibGUgbmFtZS4gVG8gbWUgaXQgaGFzIGFsd2F5cyBiZWVuICJ1c2UgSEFQIHBhZ2UgdGFi
bGVzIGZvcgo+PiBJT01NVSBpZiBhbiBJT01NVSBpcyBpbiB1c2UiLiBUaGUgY29kZSBjaGFuZ2Ug
bG9va3Mgc2FuZSwgYnV0Cj4+IEknbSBub3Qgc3VyZSBpdCBpcyBhIGNsZWFyIGltcHJvdmVtZW50
LiBIZW5jZSBJIHdvbmRlciB3aGV0aGVyIHlvdQo+PiBoYXZlIGEgbmVlZCBmb3IgdGhpcyBjaGFu
Z2UgaW4gc3Vic2VxdWVudCBwYXRjaGVzIHdoaWNoIGdvZXMKPj4gYmV5b25kIHdoYXQgeW91IHNh
eSBhYm92ZS4KPj4gCj4gCj4gSSBjb3VsZCB0YWtlIGl0IG91dCBidXQgaXQgd291bGQgbWVhbiBh
IG5vbi10cml2aWFsIHJlYmFzZSwgYW5kIHRvIG1lIC0gaWYgCj4gdHJ1ZSAtIHRoZSBuYW1lIHNp
bGwgaW1wbGllcyB0aGUgSU9NTVUgaXMgaW4gdXNlIGZvciB0aGUgZG9tYWluIHNvIEknZCBsaWtl
IHRvIAo+IGtlZXAgdGhlIGNoYW5nZS4KCkxldCdzIGJyb2FkZW4gdGhlIENjIGxpc3QgYSBsaXR0
bGUgLSBwZXJoYXBzIHdlIGNhbiBnZXQgZnVydGhlciBvcGluaW9ucyB0aGlzCndheS4KCkphbgoK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
