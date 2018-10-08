From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH] x86/vtd: fix iommu_share_p2m_table
Date: Mon, 8 Oct 2018 12:37:39 +0200
Message-ID: <20181008103739.zlou3uwv7mlevrn6@mac.bytemobile.com>
References: <20181008101445.38735-1-roger.pau@citrix.com>
 <5BBB326002000078001EF7D2@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=/pwx=mu=citrix.com=prvs=812c9b64b=roger.pau@srs-us1.protection.inumbo.net>)
 id 1g9Sv6-0005Lf-QA
 for xen-devel@lists.xenproject.org; Mon, 08 Oct 2018 10:37:48 +0000
Content-Disposition: inline
In-Reply-To: <5BBB326002000078001EF7D2@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Paul Durrant <paul.durrant@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBPY3QgMDgsIDIwMTggYXQgMDQ6MzM6MDRBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDA4LjEwLjE4IGF0IDEyOjE0LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdy
b3RlOgo+ID4gLS0tIGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvaW9tbXUuYwo+ID4gKysrIGIv
eGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvaW9tbXUuYwo+ID4gQEAgLTUwNSw3ICs1MDUsNyBAQCBp
bnQgaW9tbXVfZG9fZG9tY3RsKAo+ID4gIAo+ID4gIHZvaWQgaW9tbXVfc2hhcmVfcDJtX3RhYmxl
aW9tbXVfc2hhcmVfcDJtX3RhYmxlKHN0cnVjdCBkb21haW4qIGQpCj4gPiAgewo+ID4gLSAgICBp
ZiAoIGlvbW11X3VzZV9oYXBfcHQoZCkgKQo+ID4gKyAgICBpZiAoIGlvbW11X2VuYWJsZWQgJiYg
aGFwX2VuYWJsZWQoZCkgJiYgaW9tbXVfaGFwX3B0X3NoYXJlICkKPiAKPiBDb25zaWRlcmluZyB0
aGUgb25seSBjYWxsZXIsIHRoZSBoYXBfZW5hYmxlZCgpIHBhcnQgaXMgKGFuZCB3YXMpIG5vdAo+
IG5lZWRlZCBoZXJlLgoKV291bGQgeW91IGxpa2UgbWUgdG8gcmVtb3ZlIGl0IGluIHRoaXMgcGF0
Y2g/CgpJJ3ZlIG1lcmVseSBjaGFuZ2VkIGlvbW11X3NoYXJlX3AybV90YWJsZSBiYWNrIHRvIHVz
ZSB0aGUgc2FtZSBsb2dpYwphcyBiZWZvcmUgMjkxNjk1MWMxLgoKPiBJIGFsc28gd291bGQgcHJl
ZmVyIHRvIHNlZSBhIGNvbW1lbnQgYXR0YWNoZWQgaGVyZSwKPiB0byAoYnJpZWZseSkgZXhwbGFp
biB3aHkgdGhpcyBjYW4ndCBiZSBpb21tdV91c2VfaGFwX3B0KCkuCj4gCj4gSXMgdGhpcyB3aGF0
IFdlaSBhbHNvIGhhcyBmb3VuZCB0byBicmVhayBoaXMgUFZIIERvbTA/CgpZZXMsIEkgdGhpbmsg
c28uCgpSb2dlci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
