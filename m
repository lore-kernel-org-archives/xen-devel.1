From: "Jan Beulich" <JBeulich@suse.com>
Subject: Ping: [PATCH] pass-through: adjust pIRQ migration
Date: Fri, 26 Oct 2018 04:58:43 -0600
Message-ID: <5BD2F36302000078001F5082@prv1-mh.provo.novell.com>
References: <5B9678B402000078001E6CD6@prv1-mh.provo.novell.com>
 <20180913164419.jv7hfq2dcjenncwk@zion.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=n7n6=ng=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gFzpJ-0007jC-9Z
 for xen-devel@lists.xenproject.org; Fri, 26 Oct 2018 10:58:49 +0000
In-Reply-To: <20180913164419.jv7hfq2dcjenncwk@zion.uk.xensource.com>
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

Pj4+IE9uIDEzLjA5LjE4IGF0IDE4OjQ0LCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4g
T24gTW9uLCBTZXAgMTAsIDIwMTggYXQgMDc6NTk6MTZBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4+IEZvciBvbmUgaXQgaXMgcXVpdGUgcG9pbnRsZXNzIHRvIGl0ZXJhdGUgb3ZlciBhbGwg
cElSUS1zIHRoZSBkb21haW4gaGFzCj4+IHdoZW4ganVzdCBvbmUgaXMgYmVpbmcgYWRqdXN0ZWQu
IEludHJvZHVjZSBodm1fbWlncmF0ZV9waXJxKCkuCj4+IAo+PiBBZGRpdGlvbmFsbHkgaXQgaXMg
Ym9ndXMgdG8gbWlncmF0ZSB0aGUgcElSUSB0byBhIHZDUFUgZGlmZmVyZW50IGZyb20KPj4gdGhl
IG9uZSB0aGUgZXZlbnQgaXMgc3VwcG9zZWQgdG8gYmUgcG9zdGVkIHRvIC0gaWYgYW55dGhpbmcs
IGl0IG1pZ2h0IGJlCj4+IHdvcnRoIGNvbnNpZGVyaW5nIG5vdCB0byBtaWdyYXRlIHRoZSBwSVJR
IGF0IGFsbCBpbiB0aGUgcG9zdGluZyBjYXNlLgo+PiAKPj4gU2lnbmVkLW9mZi1ieTogSmFuIEJl
dWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+IAo+IFJldmlld2VkLWJ5OiBXZWkgTGl1IDx3ZWku
bGl1MkBjaXRyaXguY29tPgoKQW5kcmV3LAoKY2FuIEkgZ2V0IHlvdXIgYWNrIChvciBvdGhlcndp
c2UpIG9uIHRoZSB4ODYtc3BlY2lmaWMgcGFydCBvZiB0aGlzCmNoYW5nZSwgcGxlYXNlPwoKSmFu
CgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
