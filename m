From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] xen/altp2m: set access_required properly
 for all altp2ms
Date: Tue, 12 Jun 2018 06:52:20 -0600
Message-ID: <5B1FC20402000078001CA74B@prv1-mh.provo.novell.com>
References: <1528729942-4384-1-git-send-email-rcojocaru@bitdefender.com>
 <5B1FBB3202000078001CA6D7@prv1-mh.provo.novell.com>
 <f45802c8-1484-cb1d-91e1-bec3345272e7@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <f45802c8-1484-cb1d-91e1-bec3345272e7@bitdefender.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Razvan Cojocaru <rcojocaru@bitdefender.com>
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, xen-devel@lists.xen.org, Julien Grall <julien.grall@arm.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDEyLjA2LjE4IGF0IDE0OjM1LCA8cmNvam9jYXJ1QGJpdGRlZmVuZGVyLmNvbT4gd3Jv
dGU6Cj4gT24gMDYvMTIvMjAxOCAwMzoyMyBQTSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+IE9u
IDExLjA2LjE4IGF0IDE3OjEyLCA8cmNvam9jYXJ1QGJpdGRlZmVuZGVyLmNvbT4gd3JvdGU6Cj4+
PiAtLS0gYS94ZW4vY29tbW9uL2RvbWN0bC5jCj4+PiArKysgYi94ZW4vY29tbW9uL2RvbWN0bC5j
Cj4+PiBAQCAtMTA5NCw2ICsxMDk0LDggQEAgbG9uZyBkb19kb21jdGwoWEVOX0dVRVNUX0hBTkRM
RV9QQVJBTSh4ZW5fZG9tY3RsX3QpIHVfZG9tY3RsKQo+Pj4gICAgICAgICAgICAgIGRvbWFpbl9w
YXVzZShkKTsKPj4+ICAgICAgICAgICAgICBwMm1fZ2V0X2hvc3RwMm0oZCktPmFjY2Vzc19yZXF1
aXJlZCA9Cj4+PiAgICAgICAgICAgICAgICAgIG9wLT51LmFjY2Vzc19yZXF1aXJlZC5hY2Nlc3Nf
cmVxdWlyZWQ7Cj4+PiArICAgICAgICAgICAgYXJjaF9kb21haW5fc2V0X2FjY2Vzc19yZXF1aXJl
ZChkLAo+Pj4gKyAgICAgICAgICAgICAgICBvcC0+dS5hY2Nlc3NfcmVxdWlyZWQuYWNjZXNzX3Jl
cXVpcmVkKTsKPj4gCj4+IFBlcmhhcHMgdGhlIHNldHRpbmcgb2YgdGhlIGhvc3QgcDJtIGZpZWxk
IHNob3VsZCBtb3ZlIGludG8gdGhhdAo+PiBmdW5jdGlvbiBhcyB3ZWxsPwo+IAo+IE5vIG9iamVj
dGlvbiwgYnV0IHNob3VsZCBpbiB0aGF0IGNhc2UgdGhlIGxvZ2ljIHN0aWxsIGxpdmUgaW4KPiBj
b21tb24vZG9tY3RsLmMgKGlmIHRoZSBvbmx5IHRoaW5nIHRoZSBjYXNlIGRvZXMgaXMgY2FsbAo+
IGFyY2hfZG9tYWluX3NldF9hY2Nlc3NfcmVxdWlyZWQoKSk/Cj4gCj4gSSB0aG91Z2h0IHRoZSBj
b21tb24gcGFydCAoc2V0dGluZyBwMm1fZ2V0X2hvc3RwMm0oZCktPmFjY2Vzc19yZXF1aXJlZCkK
PiBqdXN0aWZpZXMgdGhlIGNvZGUgcmVtYWluaW5nIGluIHRoZSBjb21tb24vIHNvdXJjZSBmaWxl
LgoKS2VlcGluZyBpdCB0aGVyZSBoYXMgYWR2YW50YWdlcywgYW5kIG1vdmluZyBpdCB3b3VsZCBo
YXZlIGFkdmFudGFnZXMKdG9vLiBJJ20gZmluZSBlaXRoZXIgd2F5LCBJIHRoaW5rLgoKSmFuCgoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
