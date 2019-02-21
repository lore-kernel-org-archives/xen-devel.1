From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v3 09/17] tools/libvchan: notify server when
 client is connected
Date: Thu, 21 Feb 2019 16:02:26 +0000
Message-ID: <20190221160226.yvusvcrnxtcrjic7@zion.uk.xensource.com>
References: <cover.8f900c4839866ee551e8ebf221cfc7b9310cecd6.1548710973.git-series.marmarek@invisiblethingslab.com>
 <02ae82eafc7e64ba7fad883cb5f66cbe888e799d.1548710973.git-series.marmarek@invisiblethingslab.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=y0vM=Q4=citrix.com=prvs=948a3d738=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1gwqpB-0000r4-F3
 for xen-devel@lists.xenproject.org; Thu, 21 Feb 2019 16:03:49 +0000
Content-Disposition: inline
In-Reply-To: <02ae82eafc7e64ba7fad883cb5f66cbe888e799d.1548710973.git-series.marmarek@invisiblethingslab.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?= <marmarek@invisiblethingslab.com>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBKYW4gMjgsIDIwMTkgYXQgMTA6MzA6MjZQTSArMDEwMCwgTWFyZWsgTWFyY3p5a293
c2tpLUfDs3JlY2tpIHdyb3RlOgo+IExldCB0aGUgc2VydmVyIGtub3cgd2hlbiB0aGUgY2xpZW50
IGlzIGNvbm5lY3RlZC4gT3RoZXJ3aXNlIHNlcnZlciB3aWxsCj4gbm90aWNlIG9ubHkgd2hlbiBj
bGllbnQgc2VuZCBzb21lIGRhdGEuCj4gVGhpcyBjaGFuZ2UgZG9lcyBub3QgYnJlYWsgZXhpc3Rp
bmcgY2xpZW50cywgYXMgbGlidmNoYW4gdXNlciBzaG91bGQKPiBoYW5kbGUgc3B1cmlvdXMgbm90
aWZpY2F0aW9ucyBhbnl3YXkgKGZvciBleGFtcGxlIGFja25vd2xlZGdlIG9mIHJlbW90ZQo+IHNp
ZGUgcmVhZGluZyB0aGUgZGF0YSkuCj4gCj4gU2lnbmVkLW9mZi1ieTogTWFyZWsgTWFyY3p5a293
c2tpLUfDs3JlY2tpIDxtYXJtYXJla0BpbnZpc2libGV0aGluZ3NsYWIuY29tPgo+IC0tLQo+IEkg
aGFkIHRoaXMgcGF0Y2ggaW4gUXViZXMgZm9yIGEgbG9uZyB0aW1lIGFuZCB0b3RhbGx5IGZvcmdv
dCBpdCB3YXNuJ3QKPiB1cHN0cmVhbSB0aGluZy4uLgo+IC0tLQo+ICB0b29scy9saWJ2Y2hhbi9p
bml0LmMgfCAzICsrKwo+ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspCj4gCj4gZGlm
ZiAtLWdpdCBhL3Rvb2xzL2xpYnZjaGFuL2luaXQuYyBiL3Rvb2xzL2xpYnZjaGFuL2luaXQuYwo+
IGluZGV4IDE4MDgzM2QuLjUwYTY0YzEgMTAwNjQ0Cj4gLS0tIGEvdG9vbHMvbGlidmNoYW4vaW5p
dC5jCj4gKysrIGIvdG9vbHMvbGlidmNoYW4vaW5pdC5jCj4gQEAgLTQ0Nyw2ICs0NDcsOSBAQCBz
dHJ1Y3QgbGlieGVudmNoYW4gKmxpYnhlbnZjaGFuX2NsaWVudF9pbml0KHN0cnVjdCB4ZW50b29s
bG9nX2xvZ2dlciAqbG9nZ2VyLAo+ICAJY3RybC0+cmluZy0+Y2xpX2xpdmUgPSAxOwo+ICAJY3Ry
bC0+cmluZy0+c3J2X25vdGlmeSA9IFZDSEFOX05PVElGWV9XUklURTsKPiAgCj4gKyAgICAvKiB3
YWtlIHVwIHRoZSBzZXJ2ZXIgKi8KPiArICAgIHhlbmV2dGNobl9ub3RpZnkoY3RybC0+ZXZlbnQs
IGN0cmwtPmV2ZW50X3BvcnQpOwo+ICsKCkluZGVudGF0aW9uIGlzIHdyb25nLiBGaXggaXQgYW5k
OgoKQWNrZWQtYnk6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+CgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
