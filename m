From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] mm/page_alloc: always scrub pages given to
 the allocator
Date: Mon, 01 Oct 2018 09:13:37 -0600
Message-ID: <5BB239A102000078001ED589@prv1-mh.provo.novell.com>
References: <20181001095818.22782-1-sergey.dyasli@citrix.com>
 <5BB2014B02000078001ED2B6@prv1-mh.provo.novell.com>
 <a1861a76-8542-60e8-05fd-b0b31e8ac05e@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <a1861a76-8542-60e8-05fd-b0b31e8ac05e@citrix.com>
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, xen-devel@lists.xen.org, Julien Grall <julien.grall@arm.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDAxLjEwLjE4IGF0IDE2OjQwLCA8c2VyZ2V5LmR5YXNsaUBjaXRyaXguY29tPiB3cm90
ZToKPiBPbiAwMS8xMC8xOCAxMjoxMywgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+IE9uIDAxLjEw
LjE4IGF0IDExOjU4LCA8c2VyZ2V5LmR5YXNsaUBjaXRyaXguY29tPiB3cm90ZToKPj4+IEFmdGVy
IHRoaXMgcGF0Y2gsIGFsbG9jX2hlYXBfcGFnZXMoKSBpcyBndWFyYW50ZWVkIHRvIHJldHVybiBz
Y3J1YmJlZAo+Pj4gcGFnZXMgdG8gYSBjYWxsZXIgdW5sZXNzIE1FTUZfbm9fc2NydWIgZmxhZyB3
YXMgcHJvdmlkZWQuCj4+IAo+PiBJIGFsc28gZG9uJ3QgdW5kZXJzdGFuZCB0aGUgcG9pbnQgb2Yg
dGhpczogWGVuJ3MgaW50ZXJuYWwgYWxsb2NhdGlvbnMKPj4gaGF2ZSBubyBuZWVkIHRvIGNvbWUg
ZnJvbSBzY3J1YmJlZCBtZW1vcnkuIFRoaXMgaW4gcGFydGljdWxhcgo+PiBhbHNvIHB1dHMgdW5k
ZXIgcXVlc3Rpb24gdGhlIG5lZWQgdG8gImVhZ2VybHkgc2NydWIgYWxsIGFsbG9jYXRlZAo+PiBw
YWdlcyBkdXJpbmcgYm9vdCIgKHF1b3RlZCBmcm9tIGFuIGVhcmxpZXIgcGFyYWdyYXBoKS4KPiAK
PiBUaGVyZSBhcmUgd2F5cyB0byBzaGFyZSBhIFhlbidzIHBhZ2Ugd2l0aCBhIGd1ZXN0LiBTbyBm
cm9tIGEgc2VjdXJpdHkKPiBwb2ludCBvZiB2aWV3LCB0aGVyZSBpcyBubyBndWFyYW50ZWUgdGhh
dCBhIHBhZ2UgYWxsb2NhdGVkIHdpdGgKPiBhbGxvY194ZW5oZWFwX3BhZ2VzKCkgd2lsbCBub3Qg
ZW5kIHVwIGFjY2Vzc2libGUgYnkgc29tZSBndWVzdC4KCkJ1dCB0aGlzIGlzIHRoZSBleGNlcHRp
b24sIG5vdCB0aGUgcnVsZSwgYW5kIGhlbmNlIHRoZSBjb2RlIGVuYWJsaW5nCnRoZSBzaGFyaW5n
IGlzIHJlc3BvbnNpYmxlIGZvciBpbml0aWFsaXppbmcgdGhlIHBhZ2Ugc3VpdGFibHkuCgpKYW4K
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
