From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86: hap_enabled() is HVM-only
Date: Thu, 27 Sep 2018 16:32:33 +0100
Message-ID: <b8937dae-e8a6-899d-2794-7498c09ff3f5@citrix.com>
References: <5BACF7AB02000078001ECB10@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=xlny=mj=citrix.com=prvs=8017a36a5=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1g5YHM-0001Mo-RX
 for xen-devel@lists.xenproject.org; Thu, 27 Sep 2018 15:32:36 +0000
In-Reply-To: <5BACF7AB02000078001ECB10@prv1-mh.provo.novell.com>
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

T24gMjcvMDkvMTggMTY6MzAsIEphbiBCZXVsaWNoIHdyb3RlOgo+IFRoZXJlIGF0IGxlYXN0IHR3
byBjYXNlcyB3aGVyZSB0aGUgZmllbGQgc28gZmFyIGdvdCBhY2Nlc3NlZCBmb3IgUFYKPiBndWVz
dHMgYXMgd2VsbDogT25lIGlzIGluIGlvbW11X2NvbnN0cnVjdCgpLCB2aWEgaW9tbXVfdXNlX2hh
cF9wdCgpLAo+IGFuZCB0aGUgb3RoZXIgaXMKPiBhcmNoX2RvbWFpbl9jcmVhdGUoKQo+IC0+IHBh
Z2luZ19kb21haW5faW5pdCgpCj4gICAgLT4gcDJtX2luaXQoKQo+ICAgICAgIC0+IHAybV9pbml0
X2hvc3RwMm0oKQo+ICAgICAgICAgIC0+IHAybV9pbml0X29uZSgpCj4gICAgICAgICAgICAgLT4g
cDJtX2luaXRpYWxpc2UoKQo+IEl0IGp1c3Qgc28gaGFwcGVucyB0aGF0IHRoZSBmaWVsZCBjdXJy
ZW50bHkgbGl2ZXMgaW4gc3RydWN0IGh2bV9kb21haW4KPiBhdCBhbiBvZmZzZXQgbGFyZ2VyIHRo
YW4gc2l6ZW9mKHN0cnVjdCBwdl9kb21haW4pLgo+Cj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxp
Y2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKQWNrZWQtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5j
b29wZXIzQGNpdHJpeC5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
