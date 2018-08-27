From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Subject: Re: [PATCH v2 12/23] x86: monitor.o is currently HVM
 only
Date: Mon, 27 Aug 2018 18:23:44 +0300
Message-ID: <dbb93340-fbdc-b6eb-68fa-882697322c20@bitdefender.com>
References: <cover.65253d1128f698146b48c4ff3bba2198f360c7b1.1535285866.git-series.wei.liu2@citrix.com>
 <9a48f409a1c77ec9e0a5742fc36de3e0b825b1fe.1535285866.git-series.wei.liu2@citrix.com>
 <5B84164502000078001E24B9@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=lvj3=lk=bitdefender.com=rcojocaru@srs-us1.protection.inumbo.net>)
 id 1fuJMz-0005gl-Si
 for xen-devel@lists.xenproject.org; Mon, 27 Aug 2018 15:23:57 +0000
Received: from mx-sr.buh.bitdefender.com (mx-sr.buh.bitdefender.biz
 [10.17.80.103])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id 751D7307503D
 for <xen-devel@lists.xenproject.org>; Mon, 27 Aug 2018 18:23:56 +0300 (EEST)
Received: from smtp01.buh.bitdefender.com (unknown [10.17.80.75])
 by mx-sr.buh.bitdefender.com (Postfix) with ESMTP id 61BAB7FE66
 for <xen-devel@lists.xenproject.org>; Mon, 27 Aug 2018 18:23:56 +0300 (EEST)
In-Reply-To: <5B84164502000078001E24B9@prv1-mh.provo.novell.com>
Content-Language: en-US-large
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, Wei Liu <wei.liu2@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Tamas K Lengyel <tamas@tklengyel.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gOC8yNy8xOCA2OjE4IFBNLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+PiBPbiAyNi4wOC4xOCBh
dCAxNDoxOSwgPHdlaS5saXUyQGNpdHJpeC5jb20+IHdyb3RlOgo+PiBUaGVyZSBoYXMgYmVlbiBw
bGFuIHRvIG1ha2UgUFYgd29yaywgYnV0IGl0IGlzIG5vdCB5ZXQgdGhlcmUuICBQcm92aWRlCj4+
IHN0dWJzIHRvIG1ha2UgaXQgYnVpbGQgd2l0aCAhQ09ORklHX0hWTS4KPj4KPj4gU2lnbmVkLW9m
Zi1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KPj4gLS0tCj4+ICB4ZW4vYXJjaC94
ODYvTWFrZWZpbGUgICAgICAgICB8ICAyICstCj4+ICB4ZW4vaW5jbHVkZS9hc20teDg2L21vbml0
b3IuaCB8IDE0ICsrKysrKysrKysrKysrCj4+ICAyIGZpbGVzIGNoYW5nZWQsIDE1IGluc2VydGlv
bnMoKyksIDEgZGVsZXRpb24oLSkKPj4KPj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9NYWtl
ZmlsZSBiL3hlbi9hcmNoL3g4Ni9NYWtlZmlsZQo+PiBpbmRleCA5YjliNjNhLi40M2Y5MTg5IDEw
MDY0NAo+PiAtLS0gYS94ZW4vYXJjaC94ODYvTWFrZWZpbGUKPj4gKysrIGIveGVuL2FyY2gveDg2
L01ha2VmaWxlCj4+IEBAIC00NSw3ICs0NSw3IEBAIG9iai15ICs9IG1pY3JvY29kZV9hbWQubwo+
PiAgb2JqLXkgKz0gbWljcm9jb2RlX2ludGVsLm8KPj4gIG9iai15ICs9IG1pY3JvY29kZS5vCj4+
ICBvYmoteSArPSBtbS5vIHg4Nl82NC9tbS5vCj4+IC1vYmoteSArPSBtb25pdG9yLm8KPj4gK29i
ai0kKENPTkZJR19IVk0pICs9IG1vbml0b3Iubwo+PiAgb2JqLXkgKz0gbXBwYXJzZS5vCj4+ICBv
YmoteSArPSBubWkubwo+PiAgb2JqLXkgKz0gbnVtYS5vCj4+IGRpZmYgLS1naXQgYS94ZW4vaW5j
bHVkZS9hc20teDg2L21vbml0b3IuaCBiL3hlbi9pbmNsdWRlL2FzbS14ODYvbW9uaXRvci5oCj4+
IGluZGV4IDQ5ODg5MDMuLjA5ZjdmOGEgMTAwNjQ0Cj4+IC0tLSBhL3hlbi9pbmNsdWRlL2FzbS14
ODYvbW9uaXRvci5oCj4+ICsrKyBiL3hlbi9pbmNsdWRlL2FzbS14ODYvbW9uaXRvci5oCj4+IEBA
IC05OSwxMCArOTksMjQgQEAgc3RhdGljIGlubGluZSB1aW50MzJfdCAKPj4gYXJjaF9tb25pdG9y
X2dldF9jYXBhYmlsaXRpZXMoc3RydWN0IGRvbWFpbiAqZCkKPj4gIGludCBhcmNoX21vbml0b3Jf
ZG9tY3RsX2V2ZW50KHN0cnVjdCBkb21haW4gKmQsCj4+ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBzdHJ1Y3QgeGVuX2RvbWN0bF9tb25pdG9yX29wICptb3ApOwo+PiAgCj4+ICsjaWZk
ZWYgQ09ORklHX0hWTQo+PiArCj4+ICBpbnQgYXJjaF9tb25pdG9yX2luaXRfZG9tYWluKHN0cnVj
dCBkb21haW4gKmQpOwo+PiAgCj4+ICB2b2lkIGFyY2hfbW9uaXRvcl9jbGVhbnVwX2RvbWFpbihz
dHJ1Y3QgZG9tYWluICpkKTsKPj4gIAo+PiArI2Vsc2UKPj4gKwo+PiArc3RhdGljIGlubGluZSBp
bnQgYXJjaF9tb25pdG9yX2luaXRfZG9tYWluKHN0cnVjdCBkb21haW4gKmQpCj4+ICt7Cj4+ICsg
ICAgcmV0dXJuIDA7Cj4+ICt9Cj4+ICsKPj4gK3N0YXRpYyBpbmxpbmUgdm9pZCBhcmNoX21vbml0
b3JfY2xlYW51cF9kb21haW4oc3RydWN0IGRvbWFpbiAqZCkKPj4gK3t9Cj4+ICsKPj4gKyNlbmRp
Zgo+IAo+IFdvdWxkbid0IHRoZSBlbnRpcmUgWEVOX0RPTUNUTF9WTV9FVkVOVF9PUF9NT05JVE9S
IGNhc2UKPiBpbiB2bV9ldmVudF9kb21jdGwoKSB0aGVuIGJldHRlciBiZSBwdXQgaW4gYW4gI2lm
ZGVmIGluc3RlYWQ/CgpUaGF0IHNob3VsZCBiZSBmaW5lIGFzIHdlbGwgKHBlcmhhcHMgZXZlbiBi
ZXR0ZXIgdGhhbiByZXR1cm5pbmcgYW4gZXJyb3IKaGVyZSwgc2luY2UgdGhlIHN3aXRjaCB3b3Vs
ZCB0aGVuIGp1c3QgZGVmYXVsdCB3aXRoIGFuIGVycm9yIHdpdGhvdXQgdGhlCmR1cGxpY2F0ZSBm
dW5jdGlvbikuCgoKVGhhbmtzLApSYXp2YW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
