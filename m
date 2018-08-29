From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Subject: Re: [PATCH v2 12/23] x86: monitor.o is currently HVM
 only
Date: Wed, 29 Aug 2018 21:09:03 +0300
Message-ID: <42df5c71-b468-6dc3-58b9-aaf768353c16@bitdefender.com>
References: <cover.65253d1128f698146b48c4ff3bba2198f360c7b1.1535285866.git-series.wei.liu2@citrix.com>
 <9a48f409a1c77ec9e0a5742fc36de3e0b825b1fe.1535285866.git-series.wei.liu2@citrix.com>
 <5B84164502000078001E24B9@prv1-mh.provo.novell.com>
 <20180829164223.6tkiobnyn3b5pwd2@citrix.com>
 <CABfawhmG6Bg=kVNy1zdPGyRvD3yTRyFJA+n2x=bZGz=-FtE5rw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=9gya=lm=bitdefender.com=rcojocaru@srs-us1.protection.inumbo.net>)
 id 1fv4tw-0004qQ-EI
 for xen-devel@lists.xenproject.org; Wed, 29 Aug 2018 18:09:08 +0000
Received: from mx-sr.buh.bitdefender.com (mx-sr.buh.bitdefender.biz
 [10.17.80.103])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id 0C794305FFAE
 for <xen-devel@lists.xenproject.org>; Wed, 29 Aug 2018 21:09:06 +0300 (EEST)
Received: from smtp02.buh.bitdefender.net (smtp.bitdefender.biz [10.17.80.76])
 by mx-sr.buh.bitdefender.com (Postfix) with ESMTP id EC7897FE66
 for <xen-devel@lists.xenproject.org>; Wed, 29 Aug 2018 21:09:05 +0300 (EEST)
In-Reply-To: <CABfawhmG6Bg=kVNy1zdPGyRvD3yTRyFJA+n2x=bZGz=-FtE5rw@mail.gmail.com>
Content-Language: en-US-large
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Tamas K Lengyel <tamas@tklengyel.com>, Wei Liu <wei.liu2@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <JBeulich@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gOC8yOS8xOCA4OjQzIFBNLCBUYW1hcyBLIExlbmd5ZWwgd3JvdGU6Cj4gT24gV2VkLCBBdWcg
MjksIDIwMTggYXQgMTA6NDIgQU0gV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6
Cj4+Cj4+IE9uIE1vbiwgQXVnIDI3LCAyMDE4IGF0IDA5OjE4OjI5QU0gLTA2MDAsIEphbiBCZXVs
aWNoIHdyb3RlOgo+Pj4+Pj4gT24gMjYuMDguMTggYXQgMTQ6MTksIDx3ZWkubGl1MkBjaXRyaXgu
Y29tPiB3cm90ZToKPj4+PiBUaGVyZSBoYXMgYmVlbiBwbGFuIHRvIG1ha2UgUFYgd29yaywgYnV0
IGl0IGlzIG5vdCB5ZXQgdGhlcmUuICBQcm92aWRlCj4+Pj4gc3R1YnMgdG8gbWFrZSBpdCBidWls
ZCB3aXRoICFDT05GSUdfSFZNLgo+Pj4+Cj4+Pj4gU2lnbmVkLW9mZi1ieTogV2VpIExpdSA8d2Vp
LmxpdTJAY2l0cml4LmNvbT4KPj4+PiAtLS0KPj4+PiAgeGVuL2FyY2gveDg2L01ha2VmaWxlICAg
ICAgICAgfCAgMiArLQo+Pj4+ICB4ZW4vaW5jbHVkZS9hc20teDg2L21vbml0b3IuaCB8IDE0ICsr
KysrKysrKysrKysrCj4+Pj4gIDIgZmlsZXMgY2hhbmdlZCwgMTUgaW5zZXJ0aW9ucygrKSwgMSBk
ZWxldGlvbigtKQo+Pj4+Cj4+Pj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9NYWtlZmlsZSBi
L3hlbi9hcmNoL3g4Ni9NYWtlZmlsZQo+Pj4+IGluZGV4IDliOWI2M2EuLjQzZjkxODkgMTAwNjQ0
Cj4+Pj4gLS0tIGEveGVuL2FyY2gveDg2L01ha2VmaWxlCj4+Pj4gKysrIGIveGVuL2FyY2gveDg2
L01ha2VmaWxlCj4+Pj4gQEAgLTQ1LDcgKzQ1LDcgQEAgb2JqLXkgKz0gbWljcm9jb2RlX2FtZC5v
Cj4+Pj4gIG9iai15ICs9IG1pY3JvY29kZV9pbnRlbC5vCj4+Pj4gIG9iai15ICs9IG1pY3JvY29k
ZS5vCj4+Pj4gIG9iai15ICs9IG1tLm8geDg2XzY0L21tLm8KPj4+PiAtb2JqLXkgKz0gbW9uaXRv
ci5vCj4+Pj4gK29iai0kKENPTkZJR19IVk0pICs9IG1vbml0b3Iubwo+Pj4+ICBvYmoteSArPSBt
cHBhcnNlLm8KPj4+PiAgb2JqLXkgKz0gbm1pLm8KPj4+PiAgb2JqLXkgKz0gbnVtYS5vCj4+Pj4g
ZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL2FzbS14ODYvbW9uaXRvci5oIGIveGVuL2luY2x1ZGUv
YXNtLXg4Ni9tb25pdG9yLmgKPj4+PiBpbmRleCA0OTg4OTAzLi4wOWY3ZjhhIDEwMDY0NAo+Pj4+
IC0tLSBhL3hlbi9pbmNsdWRlL2FzbS14ODYvbW9uaXRvci5oCj4+Pj4gKysrIGIveGVuL2luY2x1
ZGUvYXNtLXg4Ni9tb25pdG9yLmgKPj4+PiBAQCAtOTksMTAgKzk5LDI0IEBAIHN0YXRpYyBpbmxp
bmUgdWludDMyX3QKPj4+PiBhcmNoX21vbml0b3JfZ2V0X2NhcGFiaWxpdGllcyhzdHJ1Y3QgZG9t
YWluICpkKQo+Pj4+ICBpbnQgYXJjaF9tb25pdG9yX2RvbWN0bF9ldmVudChzdHJ1Y3QgZG9tYWlu
ICpkLAo+Pj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgeGVuX2RvbWN0
bF9tb25pdG9yX29wICptb3ApOwo+Pj4+Cj4+Pj4gKyNpZmRlZiBDT05GSUdfSFZNCj4+Pj4gKwo+
Pj4+ICBpbnQgYXJjaF9tb25pdG9yX2luaXRfZG9tYWluKHN0cnVjdCBkb21haW4gKmQpOwo+Pj4+
Cj4+Pj4gIHZvaWQgYXJjaF9tb25pdG9yX2NsZWFudXBfZG9tYWluKHN0cnVjdCBkb21haW4gKmQp
Owo+Pj4+Cj4+Pj4gKyNlbHNlCj4+Pj4gKwo+Pj4+ICtzdGF0aWMgaW5saW5lIGludCBhcmNoX21v
bml0b3JfaW5pdF9kb21haW4oc3RydWN0IGRvbWFpbiAqZCkKPj4+PiArewo+Pj4+ICsgICAgcmV0
dXJuIDA7Cj4+Pj4gK30KPj4+PiArCj4+Pj4gK3N0YXRpYyBpbmxpbmUgdm9pZCBhcmNoX21vbml0
b3JfY2xlYW51cF9kb21haW4oc3RydWN0IGRvbWFpbiAqZCkKPj4+PiAre30KPj4+PiArCj4+Pj4g
KyNlbmRpZgo+Pj4KPj4+IFdvdWxkbid0IHRoZSBlbnRpcmUgWEVOX0RPTUNUTF9WTV9FVkVOVF9P
UF9NT05JVE9SIGNhc2UKPj4+IGluIHZtX2V2ZW50X2RvbWN0bCgpIHRoZW4gYmV0dGVyIGJlIHB1
dCBpbiBhbiAjaWZkZWYgaW5zdGVhZD8KPj4KPj4gSSBkaWRuJ3QgZG8gdGhhdCBiZWNhdXNlIHRo
YXQgd2FzIGNvbW1vbiB0byBib3RoIEFSTSBhbmQgeDg2Lgo+Pgo+PiBCdXQgbm93IGxvb2tpbmcg
YXQgdGhlIEFSTSBjb3VudGVycGFydCwgaXQgaXMgbm90IHN1cHBvcnRlZCBlaXRoZXIuIFdoZW4K
Pj4gaXQgaXMgZXZlbnR1YWxseSBzdXBwb3J0ZWQgb24gQVJNLCBpdCB3aWxsIGJlIGxpa2VseSB0
byBiZSBkZXBlbmRlbnQgb24KPj4gQ09ORklHX0hWTSBhbnl3YXkuIFNvIEkgdGhpbmsgSSBjYW4g
cHV0IFhFTl9ET01DVExfVk1fRVZFTlRfT1BfTU9OSVRPUgo+PiB1bmRlciBDT05GSUdfSFZNLgo+
Pgo+IAo+IEl0IGlzIG5vdCB0aGF0IGl0IGlzIG5vdCBzdXBwb3J0ZWQsIGl0IGlzIHRoYXQgaXQn
cyBub3QgKHlldCkgbmVlZGVkLgo+IEkgdGhpbmsgaXQgd291bGQgYmUgYmV0dGVyIHRvIGhhdmUg
aWZkZWYgQ09ORklHX0hWTSBvbmx5IGluIGNvZGUKPiB0aGF0J3MgcmVhY2hlZCBvbiB4ODYgYW5k
IG5vdCBjb21tb24gb25lcy4KCkZXSVcsIEkgYWdyZWUgd2l0aCBUYW1hcyBoZXJlLgoKClRoYW5r
cywKUmF6dmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
