From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 2/2] x86/HPET: adjustments to constants and
 their use
Date: Tue, 17 Jul 2018 03:33:30 -0600
Message-ID: <5B4DB7EA02000078001D4C45@prv1-mh.provo.novell.com>
References: <5B4DA67502000078001D4B70@prv1-mh.provo.novell.com>
 <5B4DAA5C02000078001D4B81@prv1-mh.provo.novell.com>
 <20180717091241.76pqzqabw2y656nt@mac.bytemobile.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=enkq=kb=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ffMMT-0000oK-WA
 for xen-devel@lists.xenproject.org; Tue, 17 Jul 2018 09:33:38 +0000
In-Reply-To: <20180717091241.76pqzqabw2y656nt@mac.bytemobile.com>
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE3LjA3LjE4IGF0IDExOjEyLCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IE9uIFR1ZSwgSnVsIDE3LCAyMDE4IGF0IDAyOjM1OjQwQU0gLTA2MDAsIEphbiBCZXVsaWNoIHdy
b3RlOgo+PiAtLS0gYS94ZW4vYXJjaC94ODYvaHZtL2hwZXQuYwo+PiArKysgYi94ZW4vYXJjaC94
ODYvaHZtL2hwZXQuYwo+PiBAQCAtNDEsMTQgKzQxLDggQEAKPj4gICNkZWZpbmUgZ3Vlc3RfdGlt
ZV9ocGV0KGhwZXQpIFwKPj4gICAgICAoaHZtX2dldF9ndWVzdF90aW1lKHZocGV0X3ZjcHUoaHBl
dCkpIC8gU1RJTUVfUEVSX0hQRVRfVElDSykKPj4gIAo+PiAtI2RlZmluZSBIUEVUX1ROX0lOVF9S
T1VURV9DQVBfU0hJRlQgMzIKPj4gLQo+PiAgLyogY2FuIGJlIHJvdXRlZCB0byBJT0FQSUMucmVk
aXJlY3RfdGFibGVbMjMuLjIwXSAqLwo+PiAtI2RlZmluZSBIUEVUX1ROX0lOVF9ST1VURV9DQVAg
ICAgICAoMHgwMGYwMDAwMFVMTCBcCj4+IC0gICAgICAgICAgICAgICAgICAgIDw8IEhQRVRfVE5f
SU5UX1JPVVRFX0NBUF9TSElGVCkKPj4gLQo+PiAtI2RlZmluZSBIUEVUX1ROX0lOVF9ST1VURV9D
QVBfTUFTSyAoMHhmZmZmZmZmZlVMTCBcCj4+IC0gICAgICAgICAgICAgICAgICAgIDw8IEhQRVRf
VE5fSU5UX1JPVVRFX0NBUF9TSElGVCkKPj4gKyNkZWZpbmUgSFBFVF9UTl9JTlRfUk9VVEVfQ0FQ
X1ZBTCBNQVNLX0lOU1IoMHgwMGYwMDAwMCwgCj4gSFBFVF9UTl9JTlRfUk9VVEVfQ0FQKQo+IAo+
IEkgbWlnaHQgYmUgY2xlYXJlciB0byBkZWZpbmUgdGhpcyBhczoKPiAoMSA8PCAyMCB8IDEgPDwg
MjEgfCAxIDw8IDIyIHwgMSA8PCAyMykKPiBidXQgaXQncyBhbHNvIHF1aXRlIGN1bWJlcnNvbWUu
CgpJbmRlZWQgKHRoZSAiY3VtYmVyc29tZSIpLgoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
