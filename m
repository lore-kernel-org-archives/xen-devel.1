From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v3 10/16] x86/mm: put nested p2m code under
 CONFIG_HVM
Date: Fri, 14 Sep 2018 02:01:19 -0600
Message-ID: <5B9B6ACF02000078001E8803@prv1-mh.provo.novell.com>
References: <20180904161533.11575-1-wei.liu2@citrix.com>
 <20180904161533.11575-11-wei.liu2@citrix.com>
 <5B92237E02000078001E627E@prv1-mh.provo.novell.com>
 <20180913150707.qgrts6bbma7gdb5h@zion.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=ck89=l4=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1g0j2Y-0003uB-14
 for xen-devel@lists.xenproject.org; Fri, 14 Sep 2018 08:01:22 +0000
In-Reply-To: <20180913150707.qgrts6bbma7gdb5h@zion.uk.xensource.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDEzLjA5LjE4IGF0IDE3OjA3LCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4g
T24gRnJpLCBTZXAgMDcsIDIwMTggYXQgMDE6MDY6MzhBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4+ID4+PiBPbiAwNC4wOS4xOCBhdCAxODoxNSwgPHdlaS5saXUyQGNpdHJpeC5jb20+IHdy
b3RlOgo+PiA+IEBAIC0xNDksNiArMTQ5LDcgQEAgc3RhdGljIHZvaWQgcDJtX3RlYXJkb3duX2hv
c3RwMm0oc3RydWN0IGRvbWFpbiAqZCkKPj4gPiAgICAgIH0KPj4gPiAgfQo+PiA+ICAKPj4gPiAr
I2lmZGVmIENPTkZJR19IVk0KPj4gPiAgc3RhdGljIHZvaWQgcDJtX3RlYXJkb3duX25lc3RlZHAy
bShzdHJ1Y3QgZG9tYWluICpkKQo+PiA+ICB7Cj4+ID4gICAgICB1bnNpZ25lZCBpbnQgaTsKPj4g
PiBAQCAtMTg2LDYgKzE4Nyw3IEBAIHN0YXRpYyBpbnQgcDJtX2luaXRfbmVzdGVkcDJtKHN0cnVj
dCBkb21haW4gKmQpCj4+ID4gIAo+PiA+ICAgICAgcmV0dXJuIDA7Cj4+ID4gIH0KPj4gPiArI2Vu
ZGlmCj4+IAo+PiBXaXRoIHRoZSBnb2FsIG9mIGxpbWl0ZWQgY29kZSBjaHVybiBJIHRoaW5rIHRo
ZXNlIHdvdWxkIGJldHRlciBiZSBwdXQKPj4gYXJvdW5kIHRoZSBlbnRpcmUgYm9keSBvZiB0aGUg
ZnVuY3Rpb24uIFRoYXQgd2F5IHRoZSBvbmVzIGJlbG93Cj4+IGVuY2xvc2luZyB0aGUgZnVuY3Rp
b24gY2FsbHMgY2FuIGdvIGF3YXkuCj4gCj4gTGF0ZXIgdGhlIGlmZGVmcyBoZXJlIGFuZCBzb21l
IG90aGVyIHBsYWNlcyB3aWxsIGJlIGV4cGFuZCB0byBjb3Zlcgo+IGFsdHAybSBhcyB3ZWxsLiBJ
ZiB3ZSBlbmNsb3NlIG9ubHkgdGhlIGJvZHkgaGVyZSwgd2Ugd2lsbCBuZWVkIHRvIGRvIHRoZQo+
IHNhbWUgdGhpbmdzIGZvciBhbHRwMm0gZnVuY3Rpb25zLgo+IAo+IFRoZSBlbmQgcmVzdWx0IGlz
IHdlIHdpbGwgYWN0dWFsbHkgaGF2ZSBtb3JlIG9yIGxlc3MgdGhlCj4gc2FtZSBhbW91bnQgd2hl
dGhlciB3ZSBjaGFuZ2UgdG8gdGhhdCBtZXRob2Qgb3Igbm90LgoKQnV0ICh0byBtZSBhdCBsZWFz
dCkgaXQncyBhIGRpZmZlcmVuY2Ugd2hldGhlciB0aGVyZSBhcmUgbWFueSBzbWFsbApjb3BlIChj
b3ZlcmluZyBhIHNpbmdsZSBsaW5lLCBpLmUuIGEgY2FsbCBzaXRlIGhlcmUpICNpZmRlZi1zLCBv
ciB0aGUKc2FtZSBhbW91bnQgb2Ygb25lcyBjb3ZlcmluZyB3aGlsZSBmdW5jdGlvbiBib2RpZXMu
IFRoZSBsYXR0ZXIKaW1vIGlzIGJldHRlciByZWFkYWJsZSBvdmVyYWxsLgoKSmFuCgoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
