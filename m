From: "Jan Beulich" <JBeulich@suse.com>
Subject: Ping#2: [PATCH] pass-through: adjust pIRQ migration
Date: Fri, 09 Nov 2018 04:29:56 -0700
Message-ID: <5BE56FB402000078001FA258@prv1-mh.provo.novell.com>
References: <5B9678B402000078001E6CD6@prv1-mh.provo.novell.com>
 <20180913164419.jv7hfq2dcjenncwk@zion.uk.xensource.com>
 <5BD2F36302000078001F5082@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=mulf=nu=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gL4zA-0003bp-Js
 for xen-devel@lists.xenproject.org; Fri, 09 Nov 2018 11:30:00 +0000
In-Reply-To: <5BD2F36302000078001F5082@prv1-mh.provo.novell.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Kevin Tian <kevin.tian@intel.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI2LjEwLjE4IGF0IDEyOjU4LCA8SkJldWxpY2hAc3VzZS5jb20+IHdyb3RlOgo+Pj4+
IE9uIDEzLjA5LjE4IGF0IDE4OjQ0LCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4+IE9u
IE1vbiwgU2VwIDEwLCAyMDE4IGF0IDA3OjU5OjE2QU0gLTA2MDAsIEphbiBCZXVsaWNoIHdyb3Rl
Ogo+Pj4gRm9yIG9uZSBpdCBpcyBxdWl0ZSBwb2ludGxlc3MgdG8gaXRlcmF0ZSBvdmVyIGFsbCBw
SVJRLXMgdGhlIGRvbWFpbiBoYXMKPj4+IHdoZW4ganVzdCBvbmUgaXMgYmVpbmcgYWRqdXN0ZWQu
IEludHJvZHVjZSBodm1fbWlncmF0ZV9waXJxKCkuCj4+PiAKPj4+IEFkZGl0aW9uYWxseSBpdCBp
cyBib2d1cyB0byBtaWdyYXRlIHRoZSBwSVJRIHRvIGEgdkNQVSBkaWZmZXJlbnQgZnJvbQo+Pj4g
dGhlIG9uZSB0aGUgZXZlbnQgaXMgc3VwcG9zZWQgdG8gYmUgcG9zdGVkIHRvIC0gaWYgYW55dGhp
bmcsIGl0IG1pZ2h0IGJlCj4+PiB3b3J0aCBjb25zaWRlcmluZyBub3QgdG8gbWlncmF0ZSB0aGUg
cElSUSBhdCBhbGwgaW4gdGhlIHBvc3RpbmcgY2FzZS4KPj4+IAo+Pj4gU2lnbmVkLW9mZi1ieTog
SmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+PiAKPj4gUmV2aWV3ZWQtYnk6IFdlaSBM
aXUgPHdlaS5saXUyQGNpdHJpeC5jb20+Cj4gCj4gQW5kcmV3LAo+IAo+IGNhbiBJIGdldCB5b3Vy
IGFjayAob3Igb3RoZXJ3aXNlKSBvbiB0aGUgeDg2LXNwZWNpZmljIHBhcnQgb2YgdGhpcwo+IGNo
YW5nZSwgcGxlYXNlPwoKT25lIG1vcmUgdHJ5LiBVbmxlc3MgSSBnZXQgYSByZXNwb25zZSB3aXRo
aW4gYSB3ZWVrIEknbGwgY29tbWl0IGJhc2VkCm9uIEtldmluJ3MgYW5kIFdlaSdzIFItYi4KCkph
bgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
