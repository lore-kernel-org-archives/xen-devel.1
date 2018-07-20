From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH] lzma: fix hypervisor build
Date: Fri, 20 Jul 2018 10:00:32 +0100
Message-ID: <20180720090032.a43u6tvqooozuyq2@citrix.com>
References: <20180720083242.34004-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=5nua=ke=citrix.com=prvs=732c52347=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1fgRHA-0001Ro-Bo
 for xen-devel@lists.xenproject.org; Fri, 20 Jul 2018 09:00:36 +0000
Content-Disposition: inline
In-Reply-To: <20180720083242.34004-1-roger.pau@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBKdWwgMjAsIDIwMTggYXQgMTA6MzI6NDJBTSArMDIwMCwgUm9nZXIgUGF1IE1vbm5l
IHdyb3RlOgo+IFJlbW92ZSBsb2NhbCBkZWZpbml0aW9uIG9mIE1JTiBhbmQgaW5zdGVhZCBpbmNs
dWRlIHRoZSBrZXJuZWwuaCBoZWFkZXIKPiBmb3IgdGhlIGh5cGVydmlzb3IgYnVpbGQuIEZpeGVz
IHRoZSBmb2xsb3dpbmcgZXJyb3Igb24gdGhlIHRvb2xzIGJ1aWxkOgo+IAo+IEluIGZpbGUgaW5j
bHVkZWQgZnJvbSB4Y19kb21fZGVjb21wcmVzc191bnNhZmVfbHptYS5jOjg6MDoKPiAuLi8uLi94
ZW4vY29tbW9uL3VubHptYS5jOjMzOjA6IGVycm9yOiAiTUlOIiByZWRlZmluZWQgWy1XZXJyb3Jd
Cj4gICNkZWZpbmUgTUlOKGEsIGIpICgoKGEpIDwgKGIpKSA/IChhKSA6IChiKSkKPiAgXgo+IElu
IGZpbGUgaW5jbHVkZWQgZnJvbSB4Y19wcml2YXRlLmg6NDM6MCwKPiAgICAgICAgICAgICAgICAg
IGZyb20geGdfcHJpdmF0ZS5oOjI5LAo+ICAgICAgICAgICAgICAgICAgZnJvbSB4Y19kb21fZGVj
b21wcmVzc191bnNhZmVfbHptYS5jOjU6Cj4gL2hvbWUvb3NzdGVzdC9idWlsZC4xMjU0NTguYnVp
bGQtYW1kNjQveGVuL3N0dWJkb20vbGlieGMteDg2XzY0Ly4uLy4uL3Rvb2xzL2luY2x1ZGUveGVu
LXRvb2xzL2xpYnMuaDoyMTowOiBub3RlOiB0aGlzIGlzIHRoZSBsb2NhdGlvbiBvZiB0aGUgcHJl
dmlvdXMgZGVmaW5pdGlvbgo+ICAjZGVmaW5lIE1JTih4LCB5KSAoKHgpIDwgKHkpID8gKHgpIDog
KHkpKQo+ICBeCj4gCj4gU2lnbmVkLW9mZi1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1
QGNpdHJpeC5jb20+CgpBY2tlZC1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KClN0
cmFuZ2VseSBJIG5ldmVyIHNhdyB0aGlzIGR1cmluZyBteSBidWlsZC4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
