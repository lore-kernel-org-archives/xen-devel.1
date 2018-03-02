From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v4 11/16] xen/mm: Switch page_alloc.c to
 typesafe MFN
Date: Fri, 02 Mar 2018 08:18:39 -0700
Message-ID: <5A99795F02000078001ADE42@prv-mh.provo.novell.com>
References: <20180221140259.29360-1-julien.grall@arm.com>
 <20180221140259.29360-12-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20180221140259.29360-12-julien.grall@arm.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIxLjAyLjE4IGF0IDE1OjAyLCA8anVsaWVuLmdyYWxsQGFybS5jb20+IHdyb3RlOgo+
IEBAIC0xNzM1LDE0ICsxNzQzLDE0IEBAIHN0YXRpYyB2b2lkIGluaXRfaGVhcF9wYWdlcygKPiAg
Cj4gICAgICAgICAgaWYgKCB1bmxpa2VseSghYXZhaWxbbmlkXSkgKQo+ICAgICAgICAgIHsKPiAt
ICAgICAgICAgICAgdW5zaWduZWQgbG9uZyBzID0gcGFnZV90b19tZm4ocGcgKyBpKTsKPiAtICAg
ICAgICAgICAgdW5zaWduZWQgbG9uZyBlID0gcGFnZV90b19tZm4ocGcgKyBucl9wYWdlcyAtIDEp
ICsgMTsKPiArICAgICAgICAgICAgdW5zaWduZWQgbG9uZyBzID0gbWZuX3gocGFnZV90b19tZm4o
cGcgKyBpKSk7Cj4gKyAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgZSA9IG1mbl94KG1mbl9hZGQo
cGFnZV90b19tZm4ocGcgKyBucl9wYWdlcyAtIDEpLCAxKSk7Cj4gICAgICAgICAgICAgIGJvb2xf
dCB1c2VfdGFpbCA9IChuaWQgPT0gcGh5c190b19uaWQocGZuX3RvX3BhZGRyKGUgLSAxKSkpICYm
Cj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICEocyAmICgoMVVMIDw8IE1BWF9PUkRF
UikgLSAxKSkgJiYKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKGZpbmRfZmlyc3Rf
c2V0X2JpdChlKSA8PSBmaW5kX2ZpcnN0X3NldF9iaXQocykpOwo+ICAgICAgICAgICAgICB1bnNp
Z25lZCBsb25nIG47Cj4gIAo+IC0gICAgICAgICAgICBuID0gaW5pdF9ub2RlX2hlYXAobmlkLCBw
YWdlX3RvX21mbihwZytpKSwgbnJfcGFnZXMgLSBpLAo+ICsgICAgICAgICAgICBuID0gaW5pdF9u
b2RlX2hlYXAobmlkLCBtZm5feChwYWdlX3RvX21mbihwZytpKSksIG5yX3BhZ2VzIC0gaSwKCllv
dSd2ZSBnb3QgV2VpJ3MgUi1iLCBzbyBJIHdvbid0IGluc2lzdCwgYnV0IGl0IHdvdWxkIGhhdmUg
YmVlbiBuaWNlCmlmIHlvdSBhZGRlZCB0aGUgbWlzc2luZyBibGFua3MgYXJvdW5kIHRoZSArIGhl
cmUuCgpBbHNvIEkgdGhpbmsgdGhlIHBhdGNoIGRvZXNuJ3QgZ28gcXVpdGUgZmFyIGVub3VnaCB0
byBtYWtlIHRoZSB0aXRsZQphY3R1YWxseSB0cnVlLiBDYXJlIHRvIG1ha2UgaXQgc2F5ICIuLi4g
c29tZSBvZiBwYWdlX2FsbG9jLmMgLi4uIj8KCkphbgoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
