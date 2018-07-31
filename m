From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 4/4] x86/iommu: add PVH support to the
 inclusive options
Date: Tue, 31 Jul 2018 09:33:41 -0600
Message-ID: <5B60815502000078001D98E9@prv1-mh.provo.novell.com>
References: <20180727153149.25094-1-roger.pau@citrix.com>
 <20180727153149.25094-5-roger.pau@citrix.com>
 <5B60779E02000078001D9898@prv1-mh.provo.novell.com>
 <20180731151522.gnhoydkm42vloldi@mac>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=3hbq=kp=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fkWej-0008RD-VS
 for xen-devel@lists.xenproject.org; Tue, 31 Jul 2018 15:33:49 +0000
In-Reply-To: <20180731151522.gnhoydkm42vloldi@mac>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDMxLjA3LjE4IGF0IDE3OjE1LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IE9uIFR1ZSwgSnVsIDMxLCAyMDE4IGF0IDA4OjUyOjE0QU0gLTA2MDAsIEphbiBCZXVsaWNoIHdy
b3RlOgo+PiA+Pj4gT24gMjcuMDcuMTggYXQgMTc6MzEsIDxyb2dlci5wYXVAY2l0cml4LmNvbT4g
d3JvdGU6Cj4+ID4gKyAgICAvKiAuLi4gb3IgdGhlIFBDSWUgTUNGRyByZWdpb25zLiAqLwo+PiA+
ICsgICAgZm9yICggaSA9IDA7IGkgPCBwY2lfbW1jZmdfY29uZmlnX251bTsgaSsrICkKPj4gPiAr
ICAgIHsKPj4gPiArICAgICAgICB1bnNpZ25lZCBsb25nIGFkZHIgPSBQRk5fRE9XTihwY2lfbW1j
ZmdfY29uZmlnW2ldLmFkZHJlc3MpOwo+PiA+ICsKPj4gPiArICAgICAgICBpZiAoIHBmbiA+PSBh
ZGRyICsgKHBjaV9tbWNmZ19jb25maWdbaV0uc3RhcnRfYnVzX251bWJlciA8PCA4KSAmJgo+PiA+
ICsgICAgICAgICAgICAgcGZuIDwgYWRkciArIChwY2lfbW1jZmdfY29uZmlnW2ldLmVuZF9idXNf
bnVtYmVyIDw8IDgpICkKPj4gPiArICAgICAgICAgICAgcmV0dXJuIGZhbHNlOwo+PiA+ICsgICAg
fQo+PiAKPj4gU2FtZSBoZXJlIC0gdGhpcyB3b3VsZCBiZXR0ZXIgdXNlIGRvbWFpbiBzdGF0ZS4K
PiAKPiAuLi4gYnV0IHBjaSBtY2ZnIHJlZ2lvbnMgYXJlIGN1cnJlbnRseSBhZGRlZCBhZnRlciB0
aGUgaW9tbXUKPiBpbml0aWFsaXphdGlvbiBpbiB0aGUgSFZNIGRvbTAgYnVpbGRlci4gSSBjYW4g
c2h1ZmZsZSB0aGF0IGNhbGwgc28KPiB0aGF0IGlvbW11IGluaXRpYWxpemF0aW9uIGlzIHBlcmZv
cm1lZCBhZnRlciB0aGUgbWNmZyByZWdpb25zIGFyZQo+IGFkZGVkLgoKT3IgYXQgbGVhc3QgbGVh
dmUgYSB0b2RvIGNvbW1lbnQuIEFmdGVyIGFsbCBNQ0ZHIHJlZ2lvbnMgbWlnaHQKZnVydGhlciBi
ZSBhZGRlZCB3aGlsZSBEb20wIGJvb3RzIGFuZCBwYXJzZXMgQU1MLgoKSmFuCgoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
