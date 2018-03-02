From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH v4 11/16] xen/mm: Switch page_alloc.c to
	typesafe MFN
Date: Fri, 2 Mar 2018 15:57:57 +0000
Message-ID: <2927a395-0508-bdb4-69b0-b38aef792063@arm.com>
References: <20180221140259.29360-1-julien.grall@arm.com>
 <20180221140259.29360-12-julien.grall@arm.com>
 <5A99795F02000078001ADE42@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <5A99795F02000078001ADE42@prv-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

CgpPbiAwMi8wMy8xOCAxNToxOCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMjEuMDIuMTgg
YXQgMTU6MDIsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4gd3JvdGU6Cj4+IEBAIC0xNzM1LDE0ICsx
NzQzLDE0IEBAIHN0YXRpYyB2b2lkIGluaXRfaGVhcF9wYWdlcygKPj4gICAKPj4gICAgICAgICAg
IGlmICggdW5saWtlbHkoIWF2YWlsW25pZF0pICkKPj4gICAgICAgICAgIHsKPj4gLSAgICAgICAg
ICAgIHVuc2lnbmVkIGxvbmcgcyA9IHBhZ2VfdG9fbWZuKHBnICsgaSk7Cj4+IC0gICAgICAgICAg
ICB1bnNpZ25lZCBsb25nIGUgPSBwYWdlX3RvX21mbihwZyArIG5yX3BhZ2VzIC0gMSkgKyAxOwo+
PiArICAgICAgICAgICAgdW5zaWduZWQgbG9uZyBzID0gbWZuX3gocGFnZV90b19tZm4ocGcgKyBp
KSk7Cj4+ICsgICAgICAgICAgICB1bnNpZ25lZCBsb25nIGUgPSBtZm5feChtZm5fYWRkKHBhZ2Vf
dG9fbWZuKHBnICsgbnJfcGFnZXMgLSAxKSwgMSkpOwo+PiAgICAgICAgICAgICAgIGJvb2xfdCB1
c2VfdGFpbCA9IChuaWQgPT0gcGh5c190b19uaWQocGZuX3RvX3BhZGRyKGUgLSAxKSkpICYmCj4+
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIShzICYgKCgxVUwgPDwgTUFYX09SREVS
KSAtIDEpKSAmJgo+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIChmaW5kX2ZpcnN0
X3NldF9iaXQoZSkgPD0gZmluZF9maXJzdF9zZXRfYml0KHMpKTsKPj4gICAgICAgICAgICAgICB1
bnNpZ25lZCBsb25nIG47Cj4+ICAgCj4+IC0gICAgICAgICAgICBuID0gaW5pdF9ub2RlX2hlYXAo
bmlkLCBwYWdlX3RvX21mbihwZytpKSwgbnJfcGFnZXMgLSBpLAo+PiArICAgICAgICAgICAgbiA9
IGluaXRfbm9kZV9oZWFwKG5pZCwgbWZuX3gocGFnZV90b19tZm4ocGcraSkpLCBucl9wYWdlcyAt
IGksCj4gCj4gWW91J3ZlIGdvdCBXZWkncyBSLWIsIHNvIEkgd29uJ3QgaW5zaXN0LCBidXQgaXQg
d291bGQgaGF2ZSBiZWVuIG5pY2UKPiBpZiB5b3UgYWRkZWQgdGhlIG1pc3NpbmcgYmxhbmtzIGFy
b3VuZCB0aGUgKyBoZXJlLgo+IAo+IEFsc28gSSB0aGluayB0aGUgcGF0Y2ggZG9lc24ndCBnbyBx
dWl0ZSBmYXIgZW5vdWdoIHRvIG1ha2UgdGhlIHRpdGxlCj4gYWN0dWFsbHkgdHJ1ZS4gQ2FyZSB0
byBtYWtlIGl0IHNheSAiLi4uIHNvbWUgb2YgcGFnZV9hbGxvYy5jIC4uLiI/CgpJIHdpbGwgZG8g
Zm9yIGJvdGguIFRoYW5rIHlvdSBmb3IgdGhlIHJldmlldy4KCkNoZWVycywKCi0tIApKdWxpZW4g
R3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
