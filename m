From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] xen: only clobber multicall elements
 without error
Date: Fri, 23 Nov 2018 13:28:30 +0000
Message-ID: <e0cf196f-11ee-0e05-0966-c77161a0a949@citrix.com>
References: <20181123132516.28681-1-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=zeqx=oc=citrix.com=prvs=8587bc52e=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1gQBVa-0000PG-D5
 for xen-devel@lists.xenproject.org; Fri, 23 Nov 2018 13:28:34 +0000
In-Reply-To: <20181123132516.28681-1-jgross@suse.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, wei.liu2@citrix.com, konrad.wilk@oracle.com, George.Dunlap@eu.citrix.com, ian.jackson@eu.citrix.com, tim@xen.org, julien.grall@arm.com, jbeulich@suse.com
List-Id: xen-devel@lists.xenproject.org

T24gMjMvMTEvMjAxOCAxMzoyNSwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBJbiBkZWJ1ZyBidWls
ZHMgdGhlIGh5cGVydmlzb3Igd2lsbCBkZWxpYmVyYXRlbHkgY2xvYmJlciBwcm9jZXNzZWQKPiBl
bGVtZW50cyBvZiB0aGUgbXVsdGljYWxsIHN0cnVjdHVyZS4gSW4gb3JkZXIgdG8gZWFzZSBkaWFn
bm9zdGljIGRhdGEKPiBwcmludG91dCBpbiB0aGUgYWZmZWN0ZWQgZ3Vlc3Qgb25seSBjbG9iYmVy
IGVsZW1lbnRzIHdoaWNoIGRpZG4ndAo+IHJldHVybiBhbiBlcnJvci4KPgo+IFNpZ25lZC1vZmYt
Ynk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KPiAtLS0KPiAgeGVuL2NvbW1vbi9t
dWx0aWNhbGwuYyB8IDEgKwo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKPgo+IGRp
ZmYgLS1naXQgYS94ZW4vY29tbW9uL211bHRpY2FsbC5jIGIveGVuL2NvbW1vbi9tdWx0aWNhbGwu
Ywo+IGluZGV4IDVhMTk5ZWJmOGYuLjQ4NjIyNjE5Y2UgMTAwNjQ0Cj4gLS0tIGEveGVuL2NvbW1v
bi9tdWx0aWNhbGwuYwo+ICsrKyBiL3hlbi9jb21tb24vbXVsdGljYWxsLmMKPiBAQCAtNzQsNiAr
NzQsNyBAQCBkb19tdWx0aWNhbGwoCj4gICAgICAgICAgQVNTRVJUX05PVF9JTl9BVE9NSUMoKTsK
PiAgCj4gICNpZm5kZWYgTkRFQlVHCj4gKyAgICAgICAgaWYgKCAobG9uZyltY3MtPmNhbGwucmVz
dWx0ID49IDAgKQoKV2hpbGUgSSBhcHByZWNpYXRlIHlvdXIgcG9pbnQgYW5kIGFncmVlIHRoYXQg
dGhpcyBpcyBnb29kIGluIHByaW5jaXBsZSwKdGhlIGZhaWx1cmUgY29uZGl0aW9uIGlzIHBlci1o
eXBlcmNhbGwsIGFuZCBub3QgYWx3YXlzIG5lZ2F0aXZlLgoKSSd2ZSB0cmllZCBwbGF5aW5nIGEg
c2ltaWxhciBnYW1lIGJlZm9yZSBhbmQgY291bGRuJ3QgY29tZSB1cCB3aXRoIGEKdmlhYmxlIG9w
dGlvbi4KCn5BbmRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
