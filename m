From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH 1/2] core-parking: interact with runtime
 SMT-disabling
Date: Wed, 24 Apr 2019 12:51:23 +0100
Message-ID: <3d520753-510d-69b2-b2f0-0965bc14cc6b@arm.com>
References: <5CAF2D310200007800226974@prv1-mh.provo.novell.com>
 <5CAF36E202000078002269BE@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8RIj=S2=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hJGQy-0007Zm-RD
 for xen-devel@lists.xenproject.org; Wed, 24 Apr 2019 11:51:28 +0000
In-Reply-To: <5CAF36E202000078002269BE@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>
List-Id: xen-devel@lists.xenproject.org

SGkgSmFuLAoKT24gMTEvMDQvMjAxOSAxMzo0NSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gLS0tIGEv
eGVuL2NvbW1vbi9jb3JlX3BhcmtpbmcuYwo+ICsrKyBiL3hlbi9jb21tb24vY29yZV9wYXJraW5n
LmMKCgpbLi4uXQoKPiArYm9vbCBjb3JlX3BhcmtpbmdfcmVtb3ZlKHVuc2lnbmVkIGludCBjcHUp
CgpTb21ldGhpbmcgbG9va3Mgd3JvbmcuIFRoaXMgZnVuY3Rpb24gaXMgaW1wbGVtZW50ZWQgaW4g
Y29tbW9uIGNvZGUgYnV0Li4uCgo+ICt7Cj4gKyAgICB1bnNpZ25lZCBpbnQgaTsKPiArICAgIGJv
b2wgZm91bmQgPSBmYWxzZTsKPiArCj4gKyAgICBzcGluX2xvY2soJmFjY291bnRpbmdfbG9jayk7
Cj4gKwo+ICsgICAgZm9yICggaSA9IDA7IGkgPCBjdXJfaWRsZV9udW1zOyArK2kgKQo+ICsgICAg
ICAgIGlmICggY29yZV9wYXJraW5nX2NwdW51bVtpXSA9PSBjcHUgKQo+ICsgICAgICAgIHsKPiAr
ICAgICAgICAgICAgZm91bmQgPSB0cnVlOwo+ICsgICAgICAgICAgICAtLWN1cl9pZGxlX251bXM7
Cj4gKyAgICAgICAgICAgIGJyZWFrOwo+ICsgICAgICAgIH0KPiArCj4gKyAgICBmb3IgKCA7IGkg
PCBjdXJfaWRsZV9udW1zOyArK2kgKQo+ICsgICAgICAgIGNvcmVfcGFya2luZ19jcHVudW1baV0g
PSBjb3JlX3BhcmtpbmdfY3B1bnVtW2kgKyAxXTsKPiArCj4gKyAgICBzcGluX3VubG9jaygmYWNj
b3VudGluZ19sb2NrKTsKPiArCj4gKyAgICByZXR1cm4gZm91bmQ7Cj4gK30KPiArCj4gICB1aW50
MzJfdCBnZXRfY3VyX2lkbGVfbnVtcyh2b2lkKQo+ICAgewo+ICAgICAgIHJldHVybiBjdXJfaWRs
ZV9udW1zOwo+IC0tLSBhL3hlbi9pbmNsdWRlL2FzbS14ODYvc21wLmgKPiArKysgYi94ZW4vaW5j
bHVkZS9hc20teDg2L3NtcC5oCj4gQEAgLTYzLDYgKzYzLDcgQEAgbG9uZyBjcHVfdXBfaGVscGVy
KHZvaWQgKmRhdGEpOwo+ICAgbG9uZyBjcHVfZG93bl9oZWxwZXIodm9pZCAqZGF0YSk7Cj4gICAK
PiAgIGxvbmcgY29yZV9wYXJraW5nX2hlbHBlcih2b2lkICpkYXRhKTsKPiArYm9vbCBjb3JlX3Bh
cmtpbmdfcmVtb3ZlKHVuc2lnbmVkIGludCBjcHUpOwoKVGhlIHByb3RvdHlwZSBpcyBkZWNsYXJl
ZCBpbiBhc20teDg2L3NtcC5oLiBBY3R1YWxseSwgaXQgc2VlbXMgYWxsIHRoZSBmdW5jdGlvbiAK
ZXhwb3J0ZWQgaW4gY29yZV9wYXJraW5nLmMgaGF2ZSB0aGVpciBwcm90b3R5cGUgZGVjbGFyZWQg
aW4gYXNtLXg4Ni9zbXAuaC4KClRoaXMgcmFpc2VzIHRoZSBxdWVzdGlvbiBvZiB3aGV0aGVyIGl0
IG1ha2VzIHNlbnNlIHRvIGhhdmUgY29yZV9wYXJraW5nLmMgaW4gCmNvbW1vbi4gSWYgaXQgbWFr
ZXMgc2Vuc2UsIHRoZW4gdGhlIHByb3RvdHlwZSBzaG91bGQgYmUgZGVjbGFyZWQgaW4gaW5jbHVk
ZS94ZW4uCgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
