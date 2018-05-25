From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH 1/5] x86: move definition of struct
 cpuid_leaf to cpuid.h
Date: Fri, 25 May 2018 10:35:29 +0100
Message-ID: <20180525093529.3izjhiiojh4hd7pk@citrix.com>
References: <20180524160522.757-1-wei.liu2@citrix.com>
 <20180524160522.757-2-wei.liu2@citrix.com>
 <20180525093117.ixgfd6ejsxhzfy26@MacBook-Pro-de-Roger.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=alxt=im=citrix.com=prvs=6765399a5=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1fM98K-0004rn-1k
 for xen-devel@lists.xenproject.org; Fri, 25 May 2018 09:35:36 +0000
Content-Disposition: inline
In-Reply-To: <20180525093117.ixgfd6ejsxhzfy26@MacBook-Pro-de-Roger.local>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>, sergey.dyasli@citrix.com
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBNYXkgMjUsIDIwMTggYXQgMTE6MzE6MTdBTSArMDIwMCwgUm9nZXIgUGF1IE1vbm7D
qSB3cm90ZToKPiBPbiBUaHUsIE1heSAyNCwgMjAxOCBhdCAwNTowNToxOFBNICswMTAwLCBXZWkg
TGl1IHdyb3RlOgo+ID4gVGhpcyBpcyBhIHN0ZXAgdG93YXJkcyBjb25zb2xpZGF0aW5nIHJlbGV2
YW50IGRhdGEgc3RydWN0dXJlcyBhbmQKPiA+IGRlZmluZXMgdG8gb25lIGxvY2F0aW9uLgo+ID4g
Cj4gPiBJdCB0aGVuIHJlcXVpcmVzIGRlZmluaW5nIGNwdWlkX2xlYWYgaW4gdXNlciBzcGFjZSBo
YXJuZXNzIGhlYWRlcnMgdG8KPiA+IG1ha2UgdGhlbSBjb250aW51ZSB0byBjb21waWxlLgo+ID4g
Cj4gPiBObyBmdW5jdGlvbmFsIGNoYW5nZS4KPiA+IAo+ID4gU2lnbmVkLW9mZi1ieTogV2VpIExp
dSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KPiA+IC0tLQo+ID4gQ2M6IEphbiBCZXVsaWNoIDxqYmV1
bGljaEBzdXNlLmNvbT4KPiA+IENjOiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRy
aXguY29tPgo+ID4gLS0tCj4gPiAgdG9vbHMvdGVzdHMveDg2X2VtdWxhdG9yL3g4Ni1lbXVsYXRl
LmggfCA2ICsrKysrKwo+ID4gIHhlbi9hcmNoL3g4Ni94ODZfZW11bGF0ZS94ODZfZW11bGF0ZS5o
IHwgNiArLS0tLS0KPiA+ICB4ZW4vaW5jbHVkZS9hc20teDg2L2NwdWlkLmggICAgICAgICAgICB8
IDQgKysrKwo+ID4gIDMgZmlsZXMgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlv
bnMoLSkKPiA+IAo+ID4gZGlmZiAtLWdpdCBhL3Rvb2xzL3Rlc3RzL3g4Nl9lbXVsYXRvci94ODYt
ZW11bGF0ZS5oIGIvdG9vbHMvdGVzdHMveDg2X2VtdWxhdG9yL3g4Ni1lbXVsYXRlLmgKPiA+IGlu
ZGV4IGM1ZTg1ZGUzYTIuLjhhZTMxYTJmOWEgMTAwNjQ0Cj4gPiAtLS0gYS90b29scy90ZXN0cy94
ODZfZW11bGF0b3IveDg2LWVtdWxhdGUuaAo+ID4gKysrIGIvdG9vbHMvdGVzdHMveDg2X2VtdWxh
dG9yL3g4Ni1lbXVsYXRlLmgKPiA+IEBAIC03OSw2ICs3OSwxMiBAQCBXUkFQKHB1dHMpOwo+ID4g
IAo+ID4gICN1bmRlZiBXUkFQCj4gPiAgCj4gPiArI2lmbmRlZiBjcHVpZF9sZWFmCj4gPiArc3Ry
dWN0IGNwdWlkX2xlYWYgewo+ID4gKyAgICB1aW50MzJfdCBhLCBiLCBjLCBkOwo+ID4gK307Cj4g
PiArI2VuZGlmCj4gCj4gRG8geW91IHJlYWxseSBuZWVkIHRoZSBpZm5kZWY/IEFGQUlDVCB0aGlz
IGhlYWRlciB3aWxsIGFsd2F5cyBiZQo+IGluY2x1ZGVkIGZyb20gdGhlIHRlc3QgaGFybmVzcywg
d2hpY2ggaGFzIG5vIGRlZmluaXRpb24gb2YgY3B1aWRfbGVhZi4KCkl0IGlzIG5vdCBzdHJpY3Rs
eSByZXF1aXJlZC4KCldlaS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
