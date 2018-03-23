From: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH] SUPPORT.md: add Domain 0 section
Date: Fri, 23 Mar 2018 11:06:54 +0000
Message-ID: <093d2dd5-6422-14a1-e1f5-fc03770558a6@citrix.com>
References: <20180323102718.72049-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=fgsg=gn=citrix.com=prvs=6135444e9=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1ezKaB-0002DX-S4
 for xen-devel@lists.xenproject.org; Fri, 23 Mar 2018 11:10:03 +0000
In-Reply-To: <20180323102718.72049-1-roger.pau@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDMvMjMvMjAxOCAxMDoyNyBBTSwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+IFNpZ25lZC1v
ZmYtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgo+IC0tLQo+IENj
OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgo+IENjOiBHZW9yZ2Ug
RHVubGFwIDxHZW9yZ2UuRHVubGFwQGV1LmNpdHJpeC5jb20+Cj4gQ2M6IElhbiBKYWNrc29uIDxp
YW4uamFja3NvbkBldS5jaXRyaXguY29tPgo+IENjOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3Vz
ZS5jb20+Cj4gQ2M6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+Cj4gQ2M6IEtv
bnJhZCBSemVzenV0ZWsgV2lsayA8a29ucmFkLndpbGtAb3JhY2xlLmNvbT4KPiBDYzogU3RlZmFu
byBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPgo+IENjOiBUaW0gRGVlZ2FuIDx0
aW1AeGVuLm9yZz4KPiBDYzogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KPiAtLS0KPiAg
U1VQUE9SVC5tZCB8IDI0ICsrKysrKysrKysrKysrKysrKysrKysrKwo+ICAxIGZpbGUgY2hhbmdl
ZCwgMjQgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9TVVBQT1JULm1kIGIvU1VQUE9S
VC5tZAo+IGluZGV4IGRkY2RmYWI1YWQuLmZiMDE1MWFhN2IgMTAwNjQ0Cj4gLS0tIGEvU1VQUE9S
VC5tZAo+ICsrKyBiL1NVUFBPUlQubWQKPiBAQCAtOTYsNiArOTYsMzAgQEAgUmVxdWlyZXMgaGFy
ZHdhcmUgdmlydHVhbGlzYXRpb24gc3VwcG9ydCAoSW50ZWwgVk1YIC8gQU1EIFNWTSkKPiAgCj4g
IEFSTSBvbmx5IGhhcyBvbmUgZ3Vlc3QgdHlwZSBhdCB0aGUgbW9tZW50Cj4gIAo+ICsjIyBEb21h
aW4gMCBUeXBlCj4gKwo+ICsjIyMgeDg2L1BWIERvbTAKPiArCj4gKyAgICBTdGF0dXM6IFN1cHBv
cnRlZAo+ICsKPiArVHJhZGl0aW9uYWwgWGVuIFBWIERvbWFpbiAwCj4gKwo+ICtObyBoYXJkd2Fy
ZSByZXF1aXJlbWVudHMKPiArCj4gKyMjIyB4ODYvUFZIIERvbTAKPiArCj4gKyAgICBTdGF0dXM6
IEV4cGVyaW1lbnRhbAo+ICsKPiArUFZIIGJhc2VkIERvbWFpbiAwCj4gKwo+ICtSZXF1aXJlcyBD
UFUgaGFyZHdhcmUgdmlydHVhbGl6YXRpb24gZXh0ZW5zaW9ucyBhbmQgYW4gSU9NTVUuCj4gKwo+
ICsjIyMgQVJNIERvbTAKPiArCj4gKyAgICBTdGF0dXM6IFN1cHBvcnRlZAo+ICsKPiArQVJNIG9u
bHkgaGFzIG9uZSBEb21haW4gMCB0eXBlIGF0IHRoZSBtb21lbnQKPiArCgpUaGVyZSdzIGEgbG90
IG9mIHJlZHVuZGFuY3kgaGVyZS4gIFdoYXQgYWJvdXQga2VlcGluZyB0aGUgZ3Vlc3QgdHlwZXMK
dG9nZXRoZXIsIGxpa2UgdGhlIGZvbGxvd2luZz8KCi0tLQojIyMgeDg2L1BWSAoKICAgIFN0YXR1
cywgZG9tVTogU3VwcG9ydGVkCiAgICBTdGF0dXMsIGRvbTA6IEV4cGVyaW1lbnRhbAoKW2Rlc2Ny
aXB0aW9uXQoKTm90ZSBhbHNvIHRoYXQgZG9tMCBzdXBwb3J0IHJlcXVpcmVzIElPTU1VIG9yIFZU
LWQgaGFyZHdhcmUuCi0tLQoKIC1HZW9yZ2UKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
