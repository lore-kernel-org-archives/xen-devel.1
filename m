From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] timers: move back migrate_timers_from_cpu()
 invocation
Date: Thu, 11 Apr 2019 11:47:04 +0100
Message-ID: <704b34f9-dbbf-45f4-4e96-2a38e7c942ac@citrix.com>
References: <5CAF1AD502000078002268CA@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=YyQZ=SN=citrix.com=prvs=997b111c4=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hEXFZ-0005TN-Bn
 for xen-devel@lists.xenproject.org; Thu, 11 Apr 2019 10:48:09 +0000
In-Reply-To: <5CAF1AD502000078002268CA@prv1-mh.provo.novell.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTEvMDQvMjAxOSAxMTo0NSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gQ29tbWl0IDU5N2ZiYjhi
ZTYgKCJ4ZW4vdGltZXJzOiBGaXggbWVtb3J5IGxlYWsgd2l0aCBjcHUgdW5wbHVnL3BsdWciKQo+
IHdlbnQgYSBsaXR0bGUgdG9vIGZhcjogTWlncmF0aW5nIHRpbWVycyBhd2F5IGZyb20gYSBDUFUg
YmVpbmcgb2ZmbGluZWQKPiBuZWVkcyB0byBoZXBwZW4gaW5kZXBlbmRlbnQgb2Ygd2hldGhlciBp
dCBnZXQgcGFya2VkIG9yIGZ1bGx5IG9mZmxpbmVkLgo+Cj4gU2lnbmVkLW9mZi1ieTogSmFuIEJl
dWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+Cj4gLS0tIGEveGVuL2NvbW1vbi90aW1lci5jCj4g
KysrIGIveGVuL2NvbW1vbi90aW1lci5jCj4gQEAgLTYxOSw4ICs2MTksNiBAQCBzdGF0aWMgdm9p
ZCBmcmVlX3BlcmNwdV90aW1lcnModW5zaWduZWQKPiAgewo+ICAgICAgc3RydWN0IHRpbWVycyAq
dHMgPSAmcGVyX2NwdSh0aW1lcnMsIGNwdSk7Cj4gIAo+IC0gICAgbWlncmF0ZV90aW1lcnNfZnJv
bV9jcHUoY3B1KTsKPiAtCj4gICAgICBBU1NFUlQoaGVhcF9tZXRhZGF0YSh0cy0+aGVhcCktPnNp
emUgPT0gMCk7Cj4gICAgICBpZiAoIGhlYXBfbWV0YWRhdGEodHMtPmhlYXApLT5saW1pdCApCj4g
ICAgICB7Cj4gQEAgLTY0OCw2ICs2NDYsOCBAQCBzdGF0aWMgaW50IGNwdV9jYWxsYmFjaygKPiAg
ICAgIGNhc2UgQ1BVX1VQX0NBTkNFTEVEOgo+ICAgICAgY2FzZSBDUFVfREVBRDoKPiAgICAgIGNh
c2UgQ1BVX1JFU1VNRV9GQUlMRUQ6Cj4gKyAgICAgICAgbWlncmF0ZV90aW1lcnNfZnJvbV9jcHUo
Y3B1KTsKPiArCj4gICAgICAgICAgaWYgKCAhcGFya19vZmZsaW5lX2NwdXMgJiYgc3lzdGVtX3N0
YXRlICE9IFNZU19TVEFURV9zdXNwZW5kICkKPiAgICAgICAgICAgICAgZnJlZV9wZXJjcHVfdGlt
ZXJzKGNwdSk7Cj4gICAgICAgICAgYnJlYWs7CgpJJ20gcHJldHR5IHN1cmUgeW91IGFsc28gbmVl
ZCBhIGNhbGwgaW4gdGhlIFJFTU9WRV9DQVNFLsKgIFRoZSBjcHUgY29tZXMKb25saW5lIGZvciBs
b25nIGVub3VnaCB0byBwb3RlbnRpYWxseSBnYWluIGEgdGltZXIuCgp+QW5kcmV3CgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
