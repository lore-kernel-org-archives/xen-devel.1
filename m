From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v15 05/11] x86/mm: add HYPERVISOR_memory_op
 to acquire guest resources
Date: Fri, 15 Dec 2017 01:06:07 -0700
Message-ID: <5A33907F02000078001978BC@prv-mh.provo.novell.com>
References: <20171214174144.27852-1-paul.durrant@citrix.com>
 <20171214174144.27852-6-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=nivo=dl=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ePl0T-0001wm-Kv
 for xen-devel@lists.xenproject.org; Fri, 15 Dec 2017 08:06:09 +0000
In-Reply-To: <20171214174144.27852-6-paul.durrant@citrix.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org, Daniel De Graaf <dgdegra@tycho.nsa.gov>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE0LjEyLjE3IGF0IDE4OjQxLCA8cGF1bC5kdXJyYW50QGNpdHJpeC5jb20+IHdyb3Rl
Ogo+IENlcnRhaW4gbWVtb3J5IHJlc291cmNlcyBhc3NvY2lhdGVkIHdpdGggYSBndWVzdCBhcmUg
bm90IG5lY2Vzc2FyaWx5Cj4gcHJlc2VudCBpbiB0aGUgZ3Vlc3QgUDJNLgo+IAo+IFRoaXMgcGF0
Y2ggYWRkcyB0aGUgYm9pbGVycGxhdGUgZm9yIG5ldyBtZW1vcnkgb3AgdG8gYWxsb3cgc3VjaCBh
IHJlc291cmNlCj4gdG8gYmUgcHJpdi1tYXBwZWQgZGlyZWN0bHksIGJ5IGVpdGhlciBhIFBWIG9y
IEhWTSB0b29scyBkb21haW4uCj4gCj4gTk9URTogV2hpbHN0IHRoZSBuZXcgb3AgaXMgbm90IGlu
dHJpbnNpY2x5IHNwZWNpZmljIHRvIHRoZSB4ODYgYXJjaGl0ZWN0dXJlLAo+ICAgICAgIEkgaGF2
ZSBubyBtZWFucyB0byB0ZXN0IGl0IG9uIGFuIEFSTSBwbGF0Zm9ybSBhbmQgc28gY2Fubm90IHZl
cmlmeQo+ICAgICAgIHRoYXQgaXQgZnVuY3Rpb25zIGNvcnJlY3RseS4KPiAKPiBTaWduZWQtb2Zm
LWJ5OiBQYXVsIER1cnJhbnQgPHBhdWwuZHVycmFudEBjaXRyaXguY29tPgo+IFJldmlld2VkLWJ5
OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgpMb29rcyBsaWtlIHlvdSd2ZSBsb3N0
IERhbmllbCdzIGFjayBoZXJlLgoKSmFuCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
