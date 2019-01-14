From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: PING ARM [PATCH v2] xen/cmdline: Fix buggy
 strncmp(s, LITERAL, ss - s) construct
Date: Mon, 14 Jan 2019 16:59:58 +0000
Message-ID: <5d7290c3-02e2-c54d-9a65-cc8b8019a4cc@citrix.com>
References: <1546622255-9324-1-git-send-email-andrew.cooper3@citrix.com>
 <8161196e-b6ff-2ab1-eaa8-cdb5341ae178@citrix.com>
 <4f1859e5-c901-3e3e-ffc2-0e7233d1c794@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <4f1859e5-c901-3e3e-ffc2-0e7233d1c794@arm.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>, Xen-devel <xen-devel@lists.xen.org>
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>
List-Id: xen-devel@lists.xenproject.org

T24gMTQvMDEvMjAxOSAxNjowNywgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEhpIEFuZHJldywKPgo+
IE9uIDE0LzAxLzIwMTkgMTU6MTcsIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4+PiBkaWZmIC0tZ2l0
IGEveGVuL2FyY2gvYXJtL2VmaS9lZmktYm9vdC5oIGIveGVuL2FyY2gvYXJtL2VmaS9lZmktYm9v
dC5oCj4+PiBpbmRleCBjYTY1NWZmLi4yMmE4NmVjIDEwMDY0NAo+Pj4gLS0tIGEveGVuL2FyY2gv
YXJtL2VmaS9lZmktYm9vdC5oCj4+PiArKysgYi94ZW4vYXJjaC9hcm0vZWZpL2VmaS1ib290LmgK
Pj4+IEBAIC0yMTIsNyArMjEyLDcgQEAgRUZJX1NUQVRVUyBfX2luaXQKPj4+IGZkdF9hZGRfdWVm
aV9ub2RlcyhFRklfU1lTVEVNX1RBQkxFICpzeXNfdGFibGUsCj4+PiDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBicmVhazsKPj4+IMKgIMKgwqDCoMKgwqDCoMKgwqDCoCB0eXBlID0gZmR0X2dl
dHByb3AoZmR0LCBub2RlLCAiZGV2aWNlX3R5cGUiLCAmbGVuKTsKPj4+IC3CoMKgwqDCoMKgwqDC
oCBpZiAoIHR5cGUgJiYgc3RybmNtcCh0eXBlLCAibWVtb3J5IiwgbGVuKSA9PSAwICkKPj4+ICvC
oMKgwqDCoMKgwqDCoCBpZiAoIHR5cGUgJiYgbGVuID09IDYgJiYgc3RybmNtcCh0eXBlLCAibWVt
b3J5IiwgNikgPT0gMCApCj4KPiBzdHJpbmcgcHJvcGVydHkgdGVybWluYXRlcyB3aXRoIE5VTCBh
bmQgaXMgaW5jbHVkZWQgaW4gdGhlIGxlbi4gU28gSQo+IGRvbid0IHRoaW5rIHRoaXMgY2hhbmdl
IGlzIGNvcnJlY3QuCgpBcmUgeW91IHNheWluZyB0aGF0IGxlbiBpcyA3IGhlcmUgdGhlbj8KCn5B
bmRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
