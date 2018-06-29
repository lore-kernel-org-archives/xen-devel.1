From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Subject: Re: [PATCH] x86/altp2m: Add a subop for obtaining the
 mem access of a page
Date: Fri, 29 Jun 2018 19:39:33 +0300
Message-ID: <5435e9f9-21ea-1e36-294c-a79250ba9119@bitdefender.com>
References: <20180628130036.23241-1-apop@bitdefender.com>
 <5B36529202000078001CF466@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=z68p=jp=bitdefender.com=rcojocaru@srs-us1.protection.inumbo.net>)
 id 1fYwQx-0002n2-BE
 for xen-devel@lists.xenproject.org; Fri, 29 Jun 2018 16:39:43 +0000
Received: from mx-sr.buh.bitdefender.com (mx-sr.buh.bitdefender.biz
 [10.17.80.103])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id 379CF3041470
 for <xen-devel@lists.xenproject.org>; Fri, 29 Jun 2018 20:55:50 +0300 (EEST)
Received: from smtp01.buh.bitdefender.com (smtp.bitdefender.biz [10.17.80.75])
 by mx-sr.buh.bitdefender.com (Postfix) with ESMTP id 953B47FBB8
 for <xen-devel@lists.xenproject.org>; Fri, 29 Jun 2018 19:39:39 +0300 (EEST)
In-Reply-To: <5B36529202000078001CF466@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, Adrian Pop <apop@bitdefender.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, tamas@tklengyel.com, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMDYvMjkvMjAxOCAwNjozOCBQTSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMjguMDYu
MTggYXQgMTU6MDAsIDxhcG9wQGJpdGRlZmVuZGVyLmNvbT4gd3JvdGU6Cj4+IEBAIC00NjY2LDYg
KzQ2NjcsMjMgQEAgc3RhdGljIGludCBkb19hbHRwMm1fb3AoCj4+ICAgICAgICAgIH0KPj4gICAg
ICAgICAgYnJlYWs7Cj4+ICAKPj4gKyAgICBjYXNlIEhWTU9QX2FsdHAybV9nZXRfbWVtX2FjY2Vz
czoKPj4gKyAgICAgICAgaWYgKCBhLnUubWVtX2FjY2Vzcy5wYWQgKQo+PiArICAgICAgICAgICAg
cmMgPSAtRUlOVkFMOwo+PiArICAgICAgICBlbHNlCj4+ICsgICAgICAgIHsKPj4gKyAgICAgICAg
ICAgIHhlbm1lbV9hY2Nlc3NfdCBhY2Nlc3M7Cj4+ICsKPj4gKyAgICAgICAgICAgIHJjID0gcDJt
X2dldF9tZW1fYWNjZXNzKGQsIF9nZm4oYS51Lm1lbV9hY2Nlc3MuZ2ZuKSwgJmFjY2VzcywKPj4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGEudS5tZW1fYWNjZXNzLnZpZXcp
Owo+PiArICAgICAgICAgICAgaWYgKCAhcmMgKQo+PiArICAgICAgICAgICAgewo+PiArICAgICAg
ICAgICAgICAgIGEudS5tZW1fYWNjZXNzLmh2bW1lbV9hY2Nlc3MgPSBhY2Nlc3M7Cj4+ICsgICAg
ICAgICAgICAgICAgcmMgPSBfX2NvcHlfdG9fZ3Vlc3QoYXJnLCAmYSwgMSkgPyAtRUZBVUxUIDog
MDsKPiAKPiBfX2NvcHlfZmllbGRfdG9fZ3Vlc3QoKT8gT3Igd2FpdCwgbm8sIHRoZSBmdW5jdGlv
biBhcmd1bWVudCBpcyBzdGlsbCBhCj4gaGFuZGxlIG9mIHZvaWQuCj4gCj4gQW5kIHRoZW4gLSBo
ZXJlIHdlIGFyZSBhZ2FpbjogSXMgaXQgcmVhc29uYWJsZSB0byBwZXJtaXQgYSBkb21haW4gaW5x
dWlyaW5nCj4gZm9yIGl0c2VsZj8KCkEgZ29vZCBxdWVzdGlvbi4gUGVyaGFwcyB0aGUgZm9sbG93
aW5nIGFyZSBkZWNpc2lvbiBmYWN0b3JzOgoKMS4gSXQgaXMgYWxyZWFkeSBwb3NzaWJsZSBmb3Ig
YSBkb21haW4gdG8gc2V0IG1lbV9hY2Nlc3MgcmVzdHJpY3Rpb25zCih2aWEgSFZNT1BfYWx0cDJt
X3NldF9tZW1fYWNjZXNzKSBvbiBpdHNlbGYuCgoyLiBUYW1hcycgcGF0Y2ggYWxsb3dzIHNldHRp
bmcgdGhpcyBleHRlcm5hbGx5OgoKaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wYXRjaC85
NjM5Nzc5LwoKU3BlY2lmaWNhbGx5LCB3ZSBoYXZlIGFsdHAybSA9IGRpc2FibGVkLCBtaXhlZCwg
ZXh0ZXJuYWwgYW5kIGxpbWl0ZWQgdG8KY29udHJvbCB3aG8gaXMgYWxsb3dlZCB0byBkbyB3aGF0
OgoKaHR0cHM6Ly94ZW5iaXRzLnhlbi5vcmcvZG9jcy91bnN0YWJsZS9tYW4veGwuY2ZnLjUuaHRt
bAoKVGhhdCBiZWluZyBzYWlkLCB3ZSBkb24ndCBzcGVjaWZpY2FsbHkgbmVlZCB0aGlzIHRvIGJl
IGEgSFZNT1AgLSB3ZQppbnRlbmQgdG8gdXNlIHRoaXMgZnJvbSBhIHByaXZpbGVnZWQtZG9tYWlu
IGJhc2VkIHVzZXJzcGFjZSBhZ2VudCBvbmx5LgoKClRoYW5rcywKUmF6dmFuCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
