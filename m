From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH V4 2/5] xen/arm: drivers: scif: Extend
 driver to handle other interfaces
Date: Mon, 29 Apr 2019 13:51:56 +0100
Message-ID: <ef12a3bd-7af2-c225-fcb3-c51f60c702d8@arm.com>
References: <1555513175-7596-1-git-send-email-olekstysh@gmail.com>
 <1555513175-7596-3-git-send-email-olekstysh@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=cijb=S7=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hL5lJ-0000JA-M2
 for xen-devel@lists.xenproject.org; Mon, 29 Apr 2019 12:52:01 +0000
In-Reply-To: <1555513175-7596-3-git-send-email-olekstysh@gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Oleksandr Tyshchenko <olekstysh@gmail.com>, xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, sstabellini@kernel.org
List-Id: xen-devel@lists.xenproject.org

SGkgT2xla3NhbmRyLAoKT24gMTcvMDQvMjAxOSAxNTo1OSwgT2xla3NhbmRyIFR5c2hjaGVua28g
d3JvdGU6Cj4gRnJvbTogT2xla3NhbmRyIFR5c2hjaGVua28gPG9sZWtzYW5kcl90eXNoY2hlbmtv
QGVwYW0uY29tPgo+IAo+IEV4dGVuZCBkcml2ZXIgdG8gYmUgYWJsZSB0byBoYW5kbGUgb3RoZXIg
U0NJRihYKSBjb21wYXRpYmxlCj4gaW50ZXJmYWNlcyBhcyB3ZWxsLiBUaGVzZSBpbnRlcmZhY2Vz
IGhhdmUgbG90IGluIGNvbW1vbiwKPiBidXQgbW9zdGx5IGRpZmZlciBpbiBvZmZzZXRzIGFuZCBi
aXRzIGZvciBzb21lIHJlZ2lzdGVycy4KPiAKPiBGb3IgZXhhbXBsZSwgdGhlIG1haW4gZGlmZmVy
ZW5jZSBiZXR3ZWVuIFNDSUYgYW5kIFNDSUZBIGludGVyZmFjZXMKPiBmcm9tICJzY2lmLXVhcnQi
IGRyaXZlcidzIHBvaW50IG9mIHZpZXc6Cj4gLSBSZWdpc3RlcnMgb2Zmc2V0OiBzZXJpYWwgc3Rh
dHVzLCByZWNlaXZlL3RyYW5zbWl0IEZJRk8gZGF0YQo+ICAgIHJlZ2lzdGVycyBoYXZlIGRpZmZl
cmVudCBvZmZzZXQKPiAtIEludGVybmFsIEZJRk8gc2l6ZTogNjQgYnl0ZXMgZm9yIFNDSUZBIGFu
ZCAxNiBieXRlcyBmb3IgU0NJRgo+IC0gT3ZlcnJ1biBiaXQgbG9jYXRpb246IHNlcmlhbCBzdGF0
dXMgcmVnaXN0ZXIgZm9yIFNDSUZBIGFuZAo+ICAgIGRlZGljYXRlZCBsaW5lIHN0YXR1cyByZWdp
c3RlciBmb3IgU0NJRgo+IAo+IEludHJvZHVjZSAicG9ydF9wYXJhbXMiIGFycmF5IHRvIGtlZXAg
aW50ZXJmYWNlIHNwZWNpZmljIHRoaW5ncy4KPiAKPiBUaGUgImRhdGEiIGZpZWxkIGluIHN0cnVj
dCBkdF9kZXZpY2VfbWF0Y2ggaXMgdXNlZCBmb3IgcmVjb2duaXppbmcKPiB3aGF0IGludGVyZmFj
ZSBpcyBwcmVzZW50IG9uIGEgdGFyZ2V0IGJvYXJkLgo+IAo+IFBsZWFzZSBub3RlLCBub3RoaW5n
IGhhcyBiZWVuIHRlY2huaWNhbGx5IGNoYW5nZWQgZm9yIFJlbmVzYXMgIkxhZ2VyIgo+IGFuZCBv
dGhlciBzdXBwb3J0ZWQgYm9hcmRzIChTQ0lGKS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBPbGVrc2Fu
ZHIgVHlzaGNoZW5rbyA8b2xla3NhbmRyX3R5c2hjaGVua29AZXBhbS5jb20+Cj4gQ0M6IEp1bGll
biBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+CgpBY2tlZC1ieTogSnVsaWVuIEdyYWxsIDxq
dWxpZW4uZ3JhbGxAYXJtLmNvbT4KCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
