From: "Jan Beulich" <jbeulich@suse.com>
Subject: Re: [PATCH v2 1/8] viridian: add init hooks
Date: Tue, 29 Jan 2019 04:47:51 -0700
Message-ID: <5C503D67020000780014B898@prv1-mh.provo.novell.com>
References: <20190108151811.19510-1-paul.durrant@citrix.com>
 <20190108151811.19510-2-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=nol9=QF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1goRrx-0008Bi-68
 for xen-devel@lists.xenproject.org; Tue, 29 Jan 2019 11:47:57 +0000
In-Reply-To: <20190108151811.19510-2-paul.durrant@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: paul.durrant@citrix.com
Cc: andrew.cooper3@citrix.com, wei.liu2@citrix.com, xen-devel@lists.xenproject.org, roger.pau@citrix.com
List-Id: xen-devel@lists.xenproject.org

Pj4+IFBhdWwgRHVycmFudCA8cGF1bC5kdXJyYW50QGNpdHJpeC5jb20+IDAxLzA4LzE5IDQ6MTgg
UE0gPj4+Cj4tLS0gYS94ZW4vYXJjaC94ODYvaHZtL2h2bS5jCj4rKysgYi94ZW4vYXJjaC94ODYv
aHZtL2h2bS5jCj5AQCAtNjY1LDEyICs2NjUsMTggQEAgaW50IGh2bV9kb21haW5faW5pdGlhbGlz
ZShzdHJ1Y3QgZG9tYWluICpkKQo+aWYgKCBodm1fdHNjX3NjYWxpbmdfc3VwcG9ydGVkICkKPmQt
PmFyY2guaHZtLnRzY19zY2FsaW5nX3JhdGlvID0gaHZtX2RlZmF1bHRfdHNjX3NjYWxpbmdfcmF0
aW87CiA+Cj4rICAgIHJjID0gdmlyaWRpYW5fZG9tYWluX2luaXQoZCk7Cj4rICAgIGlmICggcmMg
KQo+KyAgICAgICAgZ290byBmYWlsMjsKPisKPnJjID0gaHZtX2Z1bmNzLmRvbWFpbl9pbml0aWFs
aXNlKGQpOwo+aWYgKCByYyAhPSAwICkKPi0gICAgICAgIGdvdG8gZmFpbDI7Cj4rICAgICAgICBn
b3RvIGZhaWwzOwogPgo+cmV0dXJuIDA7CiA+Cj4rIGZhaWwzOgo+KyAgICB2aXJpZGlhbl9kb21h
aW5fZGVpbml0KGQpOwo+ZmFpbDI6Cj5ydGNfZGVpbml0KGQpOwo+c3RkdmdhX2RlaW5pdChkKTsK
CkluIG9yZGVyIHRvIGF2b2lkIHRoZSBhZGRpdGlvbiBvZiBzdWNoIGV4dHJhIG5ldyBsYWJlbHMs
IGFuZCBpbiBsaW5lIHdpdGgKQW5kcmV3J3MgcmVxdWVzdCBmb3IgZGUtaW5pdCBmdW5jdGlvbnMg
dG8gYmUgaWRlbXBvdGVudCwgY291bGRuJ3QgeW91CmFycmFuZ2UgZm9yIHRoZSB0d28gZGUtaW5p
dCBmdW5jdGlvbnMgaGVyZSB0byByZW1haW4gaWRlbXBvdGVudCAodGhleQpsb29rIHRvIGJlIGF0
IHByZXNlbnQpLCBpbiB3aGljaCBjYXNlIHlvdSBjb3VsZCBtb3ZlIHRoZXJlIGludm9jYXRpb25z
CmZyb20gdGhlIGluaXQgcGF0aHMgaGVyZSBkb3duIHBhc3QgYWxsIHRoZSBvdGhlciBjbGVhbnVw
IGZ1bmN0aW9ucyB3aGljaApjYW4gb25seSBiZSBjYWxsZWQgd2hlbiB0aGVpciByZXNwZWN0aXZl
IGluaXQgY29kZSBoYXMgcnVuPwoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
