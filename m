From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/NMI: invert condition in
	nmi_show_execution_state()
Date: Tue, 6 Feb 2018 10:42:51 +0000
Message-ID: <29643854-2005-8332-f2b2-08317440e784@citrix.com>
References: <5A79947702000078001A596F@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=2oj6=fa=citrix.com=prvs=5687f09f5=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ej0iN-0001td-3x
 for xen-devel@lists.xenproject.org; Tue, 06 Feb 2018 10:43:03 +0000
In-Reply-To: <5A79947702000078001A596F@prv-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMDYvMDIvMTggMTA6NDEsIEphbiBCZXVsaWNoIHdyb3RlOgo+IFdlIHdhbnQgdG8gZGVjb2Rl
IHRoZSBzeW1ib2wgd2hlbiBfbm90XyBpbiBndWVzdCBtb2RlLgo+Cj4gU2lnbmVkLW9mZi1ieTog
SmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKTmljZS7CoCBGaWd1cmluZyBvdXQgd2h5
IHRoaXMgd2Fzbid0IHdvcmtpbmcgd2FzIG9uIG15IHRvZG8gbGlzdC4KClJldmlld2VkLWJ5OiBB
bmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgoKPgo+IC0tLSBhL3hlbi9h
cmNoL3g4Ni90cmFwcy5jCj4gKysrIGIveGVuL2FyY2gveDg2L3RyYXBzLmMKPiBAQCAtNjMyLDcg
KzYzMiw3IEBAIHN0YXRpYyBpbnQgbm1pX3Nob3dfZXhlY3V0aW9uX3N0YXRlKGNvbnMKPiAgICAg
ICAgICBzaG93X2V4ZWN1dGlvbl9zdGF0ZShyZWdzKTsKPiAgICAgIGVsc2UKPiAgICAgICAgICBw
cmludGsoWEVOTE9HX0VSUiAiQ1BVJWQgQCAlMDR4OiUwOGx4ICglcFMpXG4iLCBjcHUsIHJlZ3Mt
PmNzLAo+IC0gICAgICAgICAgICAgICByZWdzLT5yaXAsIGd1ZXN0X21vZGUocmVncykgPyBfcChy
ZWdzLT5yaXApIDogTlVMTCk7Cj4gKyAgICAgICAgICAgICAgIHJlZ3MtPnJpcCwgZ3Vlc3RfbW9k
ZShyZWdzKSA/IE5VTEwgOiBfcChyZWdzLT5yaXApKTsKPiAgICAgIGNwdW1hc2tfY2xlYXJfY3B1
KGNwdSwgJnNob3dfc3RhdGVfbWFzayk7Cj4gIAo+ICAgICAgcmV0dXJuIDE7Cj4KPgo+CgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
