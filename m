From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v6 01/14] iommu: introduce the concept of
 BFN...
Date: Tue, 04 Sep 2018 02:47:20 -0600
Message-ID: <5B8E469802000078001E4FE5@prv1-mh.provo.novell.com>
References: <20180823094711.21376-1-paul.durrant@citrix.com>
 <20180823094711.21376-2-paul.durrant@citrix.com>
 <5B88147F02000078001E39FB@prv1-mh.provo.novell.com>
 <eb9e4dcaf17544338b3b3fb5d40d43d0@AMSPEX02CL03.citrite.net>
 <5B8D1F2602000078001E48B5@prv1-mh.provo.novell.com>
 <AADFC41AFE54684AB9EE6CBC0274A5D1912EFA15@SHSMSX101.ccr.corp.intel.com>
 <5B8E432E02000078001E4FB5@prv1-mh.provo.novell.com>
 <AADFC41AFE54684AB9EE6CBC0274A5D1912EFD02@SHSMSX101.ccr.corp.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=qfrq=ls=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fx6ze-0007AJ-2X
 for xen-devel@lists.xenproject.org; Tue, 04 Sep 2018 08:47:26 +0000
In-Reply-To: <AADFC41AFE54684AB9EE6CBC0274A5D1912EFD02@SHSMSX101.ccr.corp.intel.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Kevin Tian <kevin.tian@intel.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA0LjA5LjE4IGF0IDEwOjM3LCA8a2V2aW4udGlhbkBpbnRlbC5jb20+IHdyb3RlOgo+
PiAgRnJvbTogSmFuIEJldWxpY2ggW21haWx0bzpKQmV1bGljaEBzdXNlLmNvbV0KPj4gU2VudDog
VHVlc2RheSwgU2VwdGVtYmVyIDQsIDIwMTggNDozMyBQTQo+PiA+Cj4+ID4gYnVzIGFkZHJlc3Mg
aXMgY29tbW9ubHkgdXNlZCBhbG9uZyB3aXRoIHBoeXNpY2FsL3ZpcnR1YWwgYWRkcmVzcywgdG8K
Pj4gPiByZXByZXNlbnQgZGlmZmVyZW50IHZpZXdzIGJldHdlZW4gZGV2aWNlcyBhbmQgQ1BVLiBG
cm9tIHRoYXQgYW5nbGUKPj4gPiBJIHRoaW5rIEJGTiBpcyBhIGNsZWFyIHRlcm0gaW4gdGhpcyBj
b250ZXh0LiBidHcgaXQgaXMgbm90IG5lY2Vzc2FyeSB0bwo+PiA+IGRpZmZlcmVudGlhdGUgR0JG
TiBhbmQgTUJGTiBzaW5jZSB0aGVyZSBpcyBvbmx5IG9uZSBCRk4gdmlldyBwZXIKPj4gPiBkZXZp
Y2UuCj4+IAo+PiBTdXJlLCBidXQgeW91IG5lZ2xlY3QgdGhlIHByZXNlbmNlIG9mIG9uZSBvciBt
b3JlIElPTU1VcyB3aGVuCj4+IHlvdSBzYXkgImJldHdlZW4gZGV2aWNlcyBhbmQgQ1BVIi4gVGhl
cmUgYWRkcmVzc2VzIHByaW9yIHRvIGFuZAo+PiBhZnRlciBJT01NVSB0cmFuc2xhdGlvbiBhcmUg
ZGlzdGluY3QsIGFuZCB3aGlsZSB0aGUgb25lIGJlZm9yZSB0aGUKPj4gdHJhbnNsYXRpb24gbWF0
Y2hlcyB0aGUgZGV2aWNlIHZpZXcsIHRoZSBvbmUgYWZ0ZXIgdHJhbnNsYXRpb24gZG9lcwo+PiBu
b3QgbmVjZXNzYXJpbHkgbWF0Y2ggdGhlIENQVSB2aWV3LiBIZW5jZSB0aGVyZSBhcmUgdHdvICJi
dXMiCj4+IGZyYW1lIG51bWJlcnMgaGVyZSAtIG9uZSByZXByZXNlbnRpbmcgdGhlIGRldmljZSB2
aWV3LCBhbmQgdGhlCj4+IG90aGVyIHJlcHJlc2VudGluZyB0aGUgSU9NTVUgKG91dHB1dCkgdmll
dy4KPj4gCj4gCj4gSSBkaWRuJ3QgZ2V0LiB0aGUgb3V0cHV0IGFkZHJlc3MgZnJvbSBJT01NVSBp
cyB0aGUgb25lIHNlbnQgdG8KPiBtZW1vcnkgY29udHJvbGxlciwgc2FtZSBhcyB0aGUgb25lIHNl
bnQgZnJvbSBDUFUuCgpUaGF0J3Mgb24gcHJlc2VudCB4ODYgc3lzdGVtcywgYnV0IGFpdWkgbm90
IGluIHRoZSBnZW5lcmFsIGNhc2UuIFRoZQp0ZXJtaW5vbG9neSB0byBiZSB1c2VkIGluIFhlbiBz
aG91bGQgZml0IHRoZSBnZW5lcmFsIGNhc2UgdGhvdWdoLgoKSmFuCgoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
