From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH] lzma: fix hypervisor build
Date: Fri, 20 Jul 2018 10:22:21 +0100
Message-ID: <20180720092221.re6yjzzcgo5skava@citrix.com>
References: <20180720083242.34004-1-roger.pau@citrix.com>
 <20180720090032.a43u6tvqooozuyq2@citrix.com>
 <56c535f2-2a0f-ad5f-8a30-1b77be67a0b7@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=5nua=ke=citrix.com=prvs=732c52347=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1fgRcG-0004s9-Vy
 for xen-devel@lists.xenproject.org; Fri, 20 Jul 2018 09:22:25 +0000
Content-Disposition: inline
In-Reply-To: <56c535f2-2a0f-ad5f-8a30-1b77be67a0b7@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBKdWwgMjAsIDIwMTggYXQgMTE6MTc6MThBTSArMDIwMCwgSnVlcmdlbiBHcm9zcyB3
cm90ZToKPiBPbiAyMC8wNy8xOCAxMTowMCwgV2VpIExpdSB3cm90ZToKPiA+IE9uIEZyaSwgSnVs
IDIwLCAyMDE4IGF0IDEwOjMyOjQyQU0gKzAyMDAsIFJvZ2VyIFBhdSBNb25uZSB3cm90ZToKPiA+
PiBSZW1vdmUgbG9jYWwgZGVmaW5pdGlvbiBvZiBNSU4gYW5kIGluc3RlYWQgaW5jbHVkZSB0aGUg
a2VybmVsLmggaGVhZGVyCj4gPj4gZm9yIHRoZSBoeXBlcnZpc29yIGJ1aWxkLiBGaXhlcyB0aGUg
Zm9sbG93aW5nIGVycm9yIG9uIHRoZSB0b29scyBidWlsZDoKPiA+Pgo+ID4+IEluIGZpbGUgaW5j
bHVkZWQgZnJvbSB4Y19kb21fZGVjb21wcmVzc191bnNhZmVfbHptYS5jOjg6MDoKPiA+PiAuLi8u
Li94ZW4vY29tbW9uL3VubHptYS5jOjMzOjA6IGVycm9yOiAiTUlOIiByZWRlZmluZWQgWy1XZXJy
b3JdCj4gPj4gICNkZWZpbmUgTUlOKGEsIGIpICgoKGEpIDwgKGIpKSA/IChhKSA6IChiKSkKPiA+
PiAgXgo+ID4+IEluIGZpbGUgaW5jbHVkZWQgZnJvbSB4Y19wcml2YXRlLmg6NDM6MCwKPiA+PiAg
ICAgICAgICAgICAgICAgIGZyb20geGdfcHJpdmF0ZS5oOjI5LAo+ID4+ICAgICAgICAgICAgICAg
ICAgZnJvbSB4Y19kb21fZGVjb21wcmVzc191bnNhZmVfbHptYS5jOjU6Cj4gPj4gL2hvbWUvb3Nz
dGVzdC9idWlsZC4xMjU0NTguYnVpbGQtYW1kNjQveGVuL3N0dWJkb20vbGlieGMteDg2XzY0Ly4u
Ly4uL3Rvb2xzL2luY2x1ZGUveGVuLXRvb2xzL2xpYnMuaDoyMTowOiBub3RlOiB0aGlzIGlzIHRo
ZSBsb2NhdGlvbiBvZiB0aGUgcHJldmlvdXMgZGVmaW5pdGlvbgo+ID4+ICAjZGVmaW5lIE1JTih4
LCB5KSAoKHgpIDwgKHkpID8gKHgpIDogKHkpKQo+ID4+ICBeCj4gPj4KPiA+PiBTaWduZWQtb2Zm
LWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KPiA+IAo+ID4gQWNr
ZWQtYnk6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+Cj4gPiAKPiA+IFN0cmFuZ2VseSBJ
IG5ldmVyIHNhdyB0aGlzIGR1cmluZyBteSBidWlsZC4KPiAKPiBXaGF0IGRpZCB5b3VyIC4vY29u
ZmlndXJlIHJ1biBzYXkgYWJvdXQgbHptYSBzdXBwb3J0PwoKSXQgYXBwZWFycyB0aGF0IGl0IGdv
dCBicm9rZW4geWVzdGVyZGF5LWlzaCBzbyBJIG5ldmVyIGhhZCBhIGNoYW5jZSB0bwpzZWUgaXQu
IDotKQoKV2VpLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
