From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2] mm/page_alloc: make bootscrub happen in
 idle-loop
Date: Fri, 12 Oct 2018 07:40:56 -0600
Message-ID: <5BC0A46802000078001F102F@prv1-mh.provo.novell.com>
References: <20181009152119.15567-1-sergey.dyasli@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20181009152119.15567-1-sergey.dyasli@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Sergey Dyasli <sergey.dyasli@citrix.com>
Cc: Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xen.org, Julien Grall <julien.grall@arm.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA5LjEwLjE4IGF0IDE3OjIxLCA8c2VyZ2V5LmR5YXNsaUBjaXRyaXguY29tPiB3cm90
ZToKPiAtLS0gYS94ZW4vY29tbW9uL3BhZ2VfYWxsb2MuYwo+ICsrKyBiL3hlbi9jb21tb24vcGFn
ZV9hbGxvYy5jCj4gQEAgLTE2MSw4ICsxNjEsNDIgQEAgc3RyaW5nX3BhcmFtKCJiYWRwYWdlIiwg
b3B0X2JhZHBhZ2UpOwo+ICAvKgo+ICAgKiBuby1ib290c2NydWIgLT4gRnJlZSBwYWdlcyBhcmUg
bm90IHplcm9lZCBkdXJpbmcgYm9vdC4KPiAgICovCj4gLXN0YXRpYyBib29sX3Qgb3B0X2Jvb3Rz
Y3J1YiBfX2luaXRkYXRhID0gMTsKPiAtYm9vbGVhbl9wYXJhbSgiYm9vdHNjcnViIiwgb3B0X2Jv
b3RzY3J1Yik7Cj4gK2VudW0gYm9vdHNjcnViX21vZGUgewo+ICsgICAgQk9PVFNDUlVCX09GRiA9
IDAsCgpUaGUgIj0gMCIgaXMgcG9pbnRsZXNzLgoKPiBAQCAtMjAzOSw4ICsyMDc3LDI0IEBAIHZv
aWQgX19pbml0IGhlYXBfaW5pdF9sYXRlKHZvaWQpCj4gICAgICAgKi8KPiAgICAgIHNldHVwX2xv
d19tZW1fdmlycSgpOwo+ICAKPiAtICAgIGlmICggb3B0X2Jvb3RzY3J1YiApCj4gKyAgICBzd2l0
Y2ggKCBvcHRfYm9vdHNjcnViICkKPiArICAgIHsKPiArICAgIGRlZmF1bHQ6Cj4gKyAgICAgICAg
QVNTRVJUX1VOUkVBQ0hBQkxFKCk7Cj4gKyAgICAgICAgLyogRmFsbCB0aHJvdWdoICovCj4gKwo+
ICsgICAgY2FzZSBCT09UU0NSVUJfSURMRToKPiArICAgICAgICBwcmludGsoIlNjcnViYmluZyBG
cmVlIFJBTSBvbiAlZCBub2RlcyBpbiBiYWNrZ3JvdW5kXG4iLAo+ICsgICAgICAgICAgICAgICBu
dW1fb25saW5lX25vZGVzKCkpOwoKU3RpbGwgdGhlIHF1ZXN0aW9uIHdoZXRoZXIgdGhpcyBwcmlu
dGsoKSwgYW5kIGluIHBhcnRpY3VsYXIgdGhlIGluY2x1c2lvbgpvZiB0aGUgbm9kZSBjb3VudCwg
aXMgbWVhbmluZ2Z1bCBpbiBhbnkgd2F5LiBPdGhlciB0aGFuIHRoaXMKUmV2aWV3ZWQtYnk6IEph
biBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KYW5kIG9uZSBvciBib3RoIGNoYW5nZXMgd291
bGQgYmUgZWFzeSBlbm91Z2ggdG8gbWFrZSB3aGlsZQpjb21taXR0aW5nLCBwcm92aWRlZCB3ZSBj
YW4gcmVhY2ggYWdyZWVtZW50LgoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
