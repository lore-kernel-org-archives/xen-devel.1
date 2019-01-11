From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH] libxl: fix build on rather old systems
Date: Fri, 11 Jan 2019 12:03:10 +0000
Message-ID: <20190111120310.wrri5fw4gm2iungd@zion.uk.xensource.com>
References: <5C386B5F020000780020C96B@prv1-mh.provo.novell.com>
 <20190111111826.ur7e4z6f3yqs2duw@zion.uk.xensource.com>
 <5C387CF3020000780020CA15@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Q5q1=PT=citrix.com=prvs=9078f0792=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1ghvWz-0007lM-0z
 for xen-devel@lists.xenproject.org; Fri, 11 Jan 2019 12:03:21 +0000
Content-Disposition: inline
In-Reply-To: <5C387CF3020000780020CA15@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>, Juergen Gross <jgross@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBKYW4gMTEsIDIwMTkgYXQgMDQ6MjQ6MzVBTSAtMDcwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6ClsuLi5dCj4gPiAKPiA+PiArI2VuZGlmCj4gPj4gKyAgICByID0gdW5zaGFyZShDTE9ORV9O
RVdJUEMpOwo+ID4+ICsgICAgaWYgKHIpIHsKPiA+PiArICAgICAgICBpZiAociAmJiBlcnJubyAh
PSBFSU5WQUwpIHsKPiA+PiArICAgICAgICAgICAgTE9HRShFUlJPUiwgImxpYnhsOiBJUEMgbmFt
ZXNwYWNlIHVuc2hhcmUgZmFpbGVkIik7Cj4gPj4gKyAgICAgICAgICAgIHJldHVybiBFUlJPUl9G
QUlMOwo+ID4+ICsgICAgICAgIH0KPiA+PiArICAgICAgICBMT0coV0FSTiwgImxpYnhsOiBJUEMg
bmFtZXNwYWNlIHVuc2hhcmUgdW5hdmFpbGFibGUiKTsKPiA+IAo+ID4gQnV0IEkgZ3Vlc3Mgd2hl
dGhlciBpdCBzaG91bGQgYmUgYWxsb3dlZCB0byBjb250aW51ZSBvciBub3QgaXMgYW5vdGhlcgo+
ID4gcXVlc3Rpb24uIERvIHdlIGNvbnNpZGVyIHRoaXMgSVBDIG5hbWVzcGFjZSAibXVzdC1oYXZl
Ij8KPiAKPiBXZWxsLCB0aGVyZSBzaW1wbHkgY2FuJ3QgYmUgZGlmZmVyZW50IG5hbWVzcGFjZXMg
dG8gc3dpdGNoIGJldHdlZW4KPiB3aGVuIHRoZSBrZXJuZWwgZG9lc24ndCB1bmRlcnN0YW5kIHRo
ZSBmbGFnLgo+IAoKLi4uIHdoaWNoIG1lYW5zIHRoZSBpc29sYXRpb24gcHJvcGVydHkgaXMgd2Vh
a2VuIGJ5IHRoZSBsYWNrIG9mIElQQwpuYW1lc3BhY2UuCgpJZiB3ZSBkb24ndCB3YW50IHRvIHdl
YWtlbiBpc29sYXRpb24sIG5vdCBhbGxvd2luZyBpdCB0byBjb250aW51ZSBpcyB0aGUKcmlnaHQg
dGhpbmcgdG8gZG8gLS0gdGhhdCBtZWFucyB0aGUgaHVuayB0byBzcGxpdCBJUEMgbmFtZXNwYWNl
IHRvCnNlcGFyYXRlIGNhbGwgaXMgbm90IG5lY2Vzc2FyeS4gSWYgd2Ugd291bGQgcmF0aGVyIGxv
d2VyIHRoZSBpc29sYXRpb24KZ3VhcmFudGVlIHByb3ZpZGVkLCB0aGVuIHRoaXMgaHVuayBuZWVk
cyB0byBzdGF5LgoKV2VpLgoKPiBKYW4KPiAKPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
