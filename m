From: Paul Durrant <Paul.Durrant@citrix.com>
Subject: Re: [PATCH v6 01/14] iommu: introduce the concept of
 BFN...
Date: Tue, 4 Sep 2018 08:49:20 +0000
Message-ID: <777ac29dd97a46938eec6c00ecf51e32@AMSPEX02CL03.citrite.net>
References: <20180823094711.21376-1-paul.durrant@citrix.com>
 <20180823094711.21376-2-paul.durrant@citrix.com>
 <5B88147F02000078001E39FB@prv1-mh.provo.novell.com>
 <eb9e4dcaf17544338b3b3fb5d40d43d0@AMSPEX02CL03.citrite.net>
 <5B8D1F2602000078001E48B5@prv1-mh.provo.novell.com>
 <AADFC41AFE54684AB9EE6CBC0274A5D1912EFA15@SHSMSX101.ccr.corp.intel.com>
 <5B8E432E02000078001E4FB5@prv1-mh.provo.novell.com>
 <AADFC41AFE54684AB9EE6CBC0274A5D1912EFD02@SHSMSX101.ccr.corp.intel.com>
 <5B8E469802000078001E4FE5@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=kh5z=ls=citrix.com=prvs=7788b8ed3=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1fx71X-0007QL-O1
 for xen-devel@lists.xenproject.org; Tue, 04 Sep 2018 08:49:23 +0000
In-Reply-To: <5B8E469802000078001E4FE5@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: 'Jan Beulich' <JBeulich@suse.com>, Kevin Tian <kevin.tian@intel.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
List-Id: xen-devel@lists.xenproject.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IEphbiBCZXVsaWNoIFttYWlsdG86
SkJldWxpY2hAc3VzZS5jb21dCj4gU2VudDogMDQgU2VwdGVtYmVyIDIwMTggMDk6NDcKPiBUbzog
S2V2aW4gVGlhbiA8a2V2aW4udGlhbkBpbnRlbC5jb20+Cj4gQ2M6IFN1cmF2ZWUgU3V0aGlrdWxw
YW5pdCA8c3VyYXZlZS5zdXRoaWt1bHBhbml0QGFtZC5jb20+OyBKdWxpZW4gR3JhbGwKPiA8anVs
aWVuLmdyYWxsQGFybS5jb20+OyBQYXVsIER1cnJhbnQgPFBhdWwuRHVycmFudEBjaXRyaXguY29t
PjsgU3RlZmFubwo+IFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+OyB4ZW4tZGV2
ZWwgPHhlbi0KPiBkZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZz4KPiBTdWJqZWN0OiBSZTogW1hl
bi1kZXZlbF0gW1BBVENIIHY2IDAxLzE0XSBpb21tdTogaW50cm9kdWNlIHRoZSBjb25jZXB0IG9m
Cj4gQkZOLi4uCj4gCj4gPj4+IE9uIDA0LjA5LjE4IGF0IDEwOjM3LCA8a2V2aW4udGlhbkBpbnRl
bC5jb20+IHdyb3RlOgo+ID4+ICBGcm9tOiBKYW4gQmV1bGljaCBbbWFpbHRvOkpCZXVsaWNoQHN1
c2UuY29tXQo+ID4+IFNlbnQ6IFR1ZXNkYXksIFNlcHRlbWJlciA0LCAyMDE4IDQ6MzMgUE0KPiA+
PiA+Cj4gPj4gPiBidXMgYWRkcmVzcyBpcyBjb21tb25seSB1c2VkIGFsb25nIHdpdGggcGh5c2lj
YWwvdmlydHVhbCBhZGRyZXNzLCB0bwo+ID4+ID4gcmVwcmVzZW50IGRpZmZlcmVudCB2aWV3cyBi
ZXR3ZWVuIGRldmljZXMgYW5kIENQVS4gRnJvbSB0aGF0IGFuZ2xlCj4gPj4gPiBJIHRoaW5rIEJG
TiBpcyBhIGNsZWFyIHRlcm0gaW4gdGhpcyBjb250ZXh0LiBidHcgaXQgaXMgbm90IG5lY2Vzc2Fy
eSB0bwo+ID4+ID4gZGlmZmVyZW50aWF0ZSBHQkZOIGFuZCBNQkZOIHNpbmNlIHRoZXJlIGlzIG9u
bHkgb25lIEJGTiB2aWV3IHBlcgo+ID4+ID4gZGV2aWNlLgo+ID4+Cj4gPj4gU3VyZSwgYnV0IHlv
dSBuZWdsZWN0IHRoZSBwcmVzZW5jZSBvZiBvbmUgb3IgbW9yZSBJT01NVXMgd2hlbgo+ID4+IHlv
dSBzYXkgImJldHdlZW4gZGV2aWNlcyBhbmQgQ1BVIi4gVGhlcmUgYWRkcmVzc2VzIHByaW9yIHRv
IGFuZAo+ID4+IGFmdGVyIElPTU1VIHRyYW5zbGF0aW9uIGFyZSBkaXN0aW5jdCwgYW5kIHdoaWxl
IHRoZSBvbmUgYmVmb3JlIHRoZQo+ID4+IHRyYW5zbGF0aW9uIG1hdGNoZXMgdGhlIGRldmljZSB2
aWV3LCB0aGUgb25lIGFmdGVyIHRyYW5zbGF0aW9uIGRvZXMKPiA+PiBub3QgbmVjZXNzYXJpbHkg
bWF0Y2ggdGhlIENQVSB2aWV3LiBIZW5jZSB0aGVyZSBhcmUgdHdvICJidXMiCj4gPj4gZnJhbWUg
bnVtYmVycyBoZXJlIC0gb25lIHJlcHJlc2VudGluZyB0aGUgZGV2aWNlIHZpZXcsIGFuZCB0aGUK
PiA+PiBvdGhlciByZXByZXNlbnRpbmcgdGhlIElPTU1VIChvdXRwdXQpIHZpZXcuCj4gPj4KPiA+
Cj4gPiBJIGRpZG4ndCBnZXQuIHRoZSBvdXRwdXQgYWRkcmVzcyBmcm9tIElPTU1VIGlzIHRoZSBv
bmUgc2VudCB0bwo+ID4gbWVtb3J5IGNvbnRyb2xsZXIsIHNhbWUgYXMgdGhlIG9uZSBzZW50IGZy
b20gQ1BVLgo+IAo+IFRoYXQncyBvbiBwcmVzZW50IHg4NiBzeXN0ZW1zLCBidXQgYWl1aSBub3Qg
aW4gdGhlIGdlbmVyYWwgY2FzZS4gVGhlCj4gdGVybWlub2xvZ3kgdG8gYmUgdXNlZCBpbiBYZW4g
c2hvdWxkIGZpdCB0aGUgZ2VuZXJhbCBjYXNlIHRob3VnaC4KClNvIHlvdXIgY29uY2VybiBpcyBj
YXNjYWRlZCBJT01NVXM/CgogIFBhdWwKCj4gCj4gSmFuCj4gCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
