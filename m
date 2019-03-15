From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v7 10/11] viridian: add implementation of
 synthetic timers
Date: Fri, 15 Mar 2019 03:53:12 -0600
Message-ID: <5C8B7608020000780021F0B1@prv1-mh.provo.novell.com>
References: <20190314181117.1531-1-paul.durrant@citrix.com>
 <20190314181117.1531-11-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=64UD=RS=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1h4jWe-0007d4-BP
 for xen-devel@lists.xenproject.org; Fri, 15 Mar 2019 09:53:16 +0000
In-Reply-To: <20190314181117.1531-11-paul.durrant@citrix.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE0LjAzLjE5IGF0IDE5OjExLCA8cGF1bC5kdXJyYW50QGNpdHJpeC5jb20+IHdyb3Rl
Ogo+IFRoaXMgcGF0Y2ggaW50cm9kdWNlcyBhbiBpbXBsZW1lbnRhdGlvbiBvZiB0aGUgU1RJTUVS
MC0xNV9DT05GSUcvQ09VTlQgTVNScwo+IGFuZCBoZW5jZSBhIHRoZSBmaXJzdCBTeW5JQyBtZXNz
YWdlIHNvdXJjZS4KPiAKPiBUaGUgbmV3IChhbmQgZG9jdW1lbnRlZCkgJ3N0aW1lcicgdmlyaWRp
YW4gZW5saWdodGVubWVudCBncm91cCBtYXkgYmUKPiBzcGVjaWZpZWQgdG8gZW5hYmxlIHRoaXMg
ZmVhdHVyZS4KPiAKPiBXaGlsZSBpbiB0aGUgbmVpZ2hib3VyaG9vZCwgdGhpcyBwYXRjaCBhZGRz
IGEgbWlzc2luZyBjaGVjayBmb3IgYW4KPiBhdHRlbXB0IHRvIHdyaXRlIHRoZSB0aW1lIHJlZmVy
ZW5jZSBjb3VudCBNU1IsIHdoaWNoIHNob3VsZCByZXN1bHQgaW4gYW4KPiBleGNlcHRpb24gKGJ1
dCBub3QgYmUgcmVwb3J0ZWQgYXMgYW4gdW5pbXBsZW1lbnRlZCBNU1IpLgo+IAo+IE5PVEU6IEl0
IGlzIG5lY2Vzc2FyeSBmb3IgY29ycmVjdCBvcGVyYXRpb24gdGhhdCB0aW1lciBleHBpcmF0aW9u
IGFuZAo+ICAgICAgIG1lc3NhZ2UgZGVsaXZlcnkgdGltZS1zdGFtcGluZyB1c2UgdGhlIHNhbWUg
dGltZSBzb3VyY2UgYXMgdGhlIGd1ZXN0Lgo+ICAgICAgIFRoZSBzcGVjaWZpY2F0aW9uIGlzIGFt
YmlndW91cyBidXQgdGVzdGluZyB3aXRoIGEgV2luZG93cyAxMCAxODAzCj4gICAgICAgZ3Vlc3Qg
aGFzIHNob3duIHRoYXQgdXNpbmcgdGhlIHBhcnRpdGlvbiByZWZlcmVuY2UgY291bnRlciBhcyBh
Cj4gICAgICAgc291cmNlIHdoaWxzdCB0aGUgZ3Vlc3QgaXMgdXNpbmcgUkRUU0MgYW5kIHRoZSBy
ZWZlcmVuY2UgdHNjIHBhZ2UKPiAgICAgICBkb2VzIG5vdCB3b3JrIGNvcnJlY3RseS4gVGhlcmVm
b3JlIHRoZSB0aW1lX25vdygpIGZ1bmN0aW9uIGlzIHVzZWQuCj4gICAgICAgVGhpcyBpbXBsZW1l
bnRzIHRoZSBhbGdvcml0aG0gZm9yIGFjcXVpcmluZyBwYXJ0aXRpb24gcmVmZXJlbmNlIHRpbWUK
PiAgICAgICB0aGF0IGlzIGRvY3VtZW50ZWQgaW4gdGhlIHNwZWNpZmljdGlvbi4KPiAKPiBTaWdu
ZWQtb2ZmLWJ5OiBQYXVsIER1cnJhbnQgPHBhdWwuZHVycmFudEBjaXRyaXguY29tPgo+IEFja2Vk
LWJ5OiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgoKSHlwZXJ2aXNvciBwYXJ0cwpSZXZp
ZXdlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKSSdsbCBnZXQgdGhpcyBz
ZXJpZXMgaW4gb25jZSB0aGUgdHJlZSBpcyBmdWxseSBvcGVuIGFnYWluLgoKSmFuCgoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
