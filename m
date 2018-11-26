From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2 2/2] amd-iommu: replace occurrences of
 u<N> with uint<N>_t...
Date: Mon, 26 Nov 2018 04:49:12 -0700
Message-ID: <5BFBDDB802000078001FFEAD@prv1-mh.provo.novell.com>
References: <20181126113253.5349-1-paul.durrant@citrix.com>
 <20181126113253.5349-3-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=aZgN=OF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gRFOB-0003R8-BK
 for xen-devel@lists.xenproject.org; Mon, 26 Nov 2018 11:49:19 +0000
In-Reply-To: <20181126113253.5349-3-paul.durrant@citrix.com>
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
Cc: xen-devel <xen-devel@lists.xenproject.org>, Brian Woods <brian.woods@amd.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI2LjExLjE4IGF0IDEyOjMyLCA8cGF1bC5kdXJyYW50QGNpdHJpeC5jb20+IHdyb3Rl
Ogo+IEBAIC0zMDYsNyArMzA3LDggQEAgdm9pZCBpb21tdV9kdGVfc2V0X2d1ZXN0X2NyMyh1MzIg
KmR0ZSwgdTE2IGRvbV9pZCwgdTY0IGdjcjMsCj4gIHVpbnQ2NF90IGFtZF9pb21tdV9nZXRfYWRk
cmVzc19mcm9tX3B0ZSh2b2lkICpwdGUpCj4gIHsKPiAgICAgIHVpbnQzMl90ICplbnRyeSA9IHB0
ZTsKPiAtICAgIHVpbnQ2NF90IGFkZHJfbG8sIGFkZHJfaGksIHB0cjsKPiArICAgIHVpbnQzMl90
IGFkZHJfbG8sIGFkZHJfaGk7Cj4gKyAgICB1aW50NjRfdCBwdHI7Cj4gIAo+ICAgICAgYWRkcl9s
byA9IGdldF9maWVsZF9mcm9tX3JlZ191MzIoZW50cnlbMF0sCj4gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBJT01NVV9QVEVfQUREUl9MT1dfTUFTSywKPiBAQCAtMzE2LDI5
ICszMTgsMzAgQEAgdWludDY0X3QgYW1kX2lvbW11X2dldF9hZGRyZXNzX2Zyb21fcHRlKHZvaWQg
KnB0ZSkKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIElPTU1VX1BURV9B
RERSX0hJR0hfTUFTSywKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIElP
TU1VX1BURV9BRERSX0hJR0hfU0hJRlQpOwo+ICAKPiAtICAgIHB0ciA9IChhZGRyX2hpIDw8IDMy
KSB8IChhZGRyX2xvIDw8IFBBR0VfU0hJRlQpOwo+ICsgICAgcHRyID0gKCh1aW50NjRfdClhZGRy
X2hpIDw8IDMyKSB8Cj4gKyAgICAgICAgICAoKHVpbnQ2NF90KWFkZHJfbG8gPDwgUEFHRV9TSElG
VCk7Cj4gICAgICByZXR1cm4gcHRyOwo+ICB9CgpUaGlzIGlzIGFjdHVhbGx5IGFuIGluY3JlYXNl
IGluIGNhc3RzLiBJIGFzc3VtZSB5b3UndmUgZG9uZSB0aGlzIGZvcgpjb25zaXN0ZW5jeSwgYnV0
IGl0IHdvdWxkIGhhdmUgYmVlbiBuaWNlIGlmIHRoZSBkZXNjcmlwdGlvbiBzYWlkIHNvLgpBbnl3
YXksClJldmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgpKYW4KCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
