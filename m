From: Pu Wen <puwen@hygon.cn>
Subject: Re: [PATCH v4 02/15] x86/cpu: Fix common cpuid faulting
 probing for AMD and Hygon
Date: Wed, 3 Apr 2019 00:14:26 +0800
Message-ID: <b100d894-fda5-a74c-ae24-596914366042@hygon.cn>
References: <cover.1553935727.git.puwen@hygon.cn>
 <96396a5ea9e1acc527705f71e9cd657b16585a75.1553935727.git.puwen@hygon.cn>
 <5CA1CE900200007800223782@prv1-mh.provo.novell.com>
 <3584da10-e33c-b382-bbb3-c12b538de30a@hygon.cn>
 <5CA337400200007800223D81@prv1-mh.provo.novell.com>
 <6341db2c-2504-efb0-acae-f0b2b1b42c98@hygon.cn>
 <5CA383BB0200007800223F56@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=tiqP=SE=hygon.cn=puwen@srs-us1.protection.inumbo.net>)
 id 1hBM80-0002Xy-D1
 for xen-devel@lists.xenproject.org; Tue, 02 Apr 2019 16:19:12 +0000
In-Reply-To: <5CA383BB0200007800223F56@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjAxOS80LzIgMjM6NDYsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDAyLjA0LjE5IGF0IDEz
OjU4LCA8cHV3ZW5AaHlnb24uY24+IHdyb3RlOgo+PiBPbiAyMDE5LzQvMiAxODoyMCwgSmFuIEJl
dWxpY2ggd3JvdGU6Cj4+PiBPbiAwMi4wNC4xOSBhdCAwODo0NiwgPHB1d2VuQGh5Z29uLmNuPiB3
cm90ZToKPj4+PiBPbiAyMDE5LzQvMSAxNjo0MSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+IE9u
IDMwLjAzLjE5IGF0IDExOjQyLCA8cHV3ZW5AaHlnb24uY24+IHdyb3RlOgo+Pj4+Pj4gVGhlcmUg
aXMgbm8gTVNSX0lOVEVMX1BMQVRGT1JNX0lORk8gZm9yIEFNRCBhbmQgSHlnb24gZmFtaWxpZXMu
IFNvIGRpcmVjdGx5Cj4+Pj4+PiByZXR1cm4gZmFsc2UgaW4gdGhlIGZ1bmN0aW9uIHByb2JlX2Nw
dWlkX2ZhdWx0aW5nKCkgaWYgIWNwdV9oYXNfaHlwZXJ2aXNvci4KPj4+Pj4KPj4+Pj4gSSB0aGlu
ayBpdCB3b3VsZCBoYXZlIGJlZW4gbmljZSBpZiB5b3UgaGFkIG1lbnRpb25lZCB0aGUgcmVhbAo+
Pj4+PiByZWFzb24gd2h5IHlvdSB3YW50IHRvIGJ5cGFzcyB0aGUgTVNSIGFjY2Vzc2VzLiBUaGlz
IHdheSBpdAo+Pj4+PiBzb3VuZHMgYXMgaWYgdGhlIGNoYW5nZSB3YXMgb25seSBjb3NtZXRpYywg
YW5kIGhlbmNlIGNvdWxkIGJlCj4+Pj4+IGxlZnQgb3V0Lgo+Pj4+Cj4+Pj4gT2theSwgaG93IGFi
b3V0IHRoZSBuZXcgZGVzY3JpcHRpb246Cj4+Pj4gVGhlcmUgaXMgbm8gTVNSX0lOVEVMX1BMQVRG
T1JNX0lORk8gZm9yIEFNRCBhbmQgSHlnb24gZmFtaWxpZXMuIFJlYWQKPj4+PiB0aGlzIE1TUiB3
aWxsIHN0b3AgdGhlIFhlbiBpbml0aWFsaXphdGlvbiBwcm9jZXNzCj4+Pgo+Pj4gIi4uLiBmb3Ig
c29tZSBlYXJseSBIeWdvbiBzdGVwcGluZ3MiKD8pLiBJJ20gdW5hd2FyZSBvZiBBTUQgQ1BVcwo+
Pgo+PiBZZXMsZm9yIHNvbWUgZWFybHkgSHlnb24gc3RlcHBpbmdzLgo+Pgo+Pj4gaGF2aW5nIHRo
aXMgaXNzdWUgLSBhcmUgeW91IHRlbGxpbmcgdXMgb3RoZXJ3aXNlPwo+Pgo+PiBJIHRlc3RlZCB3
aXRoIGFuIEFNRCBDUFUoRmFtaWx5IDE3aCwgTW9kZWwgMSwgU3RlcHBpbmcgMSkgdG9kYXksIGFu
ZAo+PiBpdCBhbHNvIHN0b3BwZWQgd2hlbiByZWFkaW5nIHRoZSBNU1JfSU5URUxfUExBVEZPUk1f
SU5GTyBpbnN0ZWFkIG9mCj4+IHByb2R1Y2luZyAjR1AoMCkuCj4gCj4gSSd2ZSB5ZXQgdG8gdHJ5
IGl0IG91dCBvbiBteSBSb21lIHN5c3RlbSwgYnV0IEkgaGF2ZSB0byBhZG1pdCBJCgpXZSBoYXZl
IFJvbWUgc3lzdGVtIHRvbywgSSdsbCBoYXZlIGEgdHJ5IG9uIGl0IGFzIHdlbGwuCgo+IGZpbmQg
dGhpcyBoYXJkIHRvIGJlbGlldmUuIEFuZHJldyAtIHlvdSd2ZSB0cmllZCB0byBib290IFhlbiBv
biBhCj4gUm9tZSBhbHJlYWR5LiBJaXJjIHlvdSBzYWlkIGl0IGNyYXNoZWQsIGJ1dCBkaWQgaXQg
cGVyaGFwcyBnZXQgdG8KPiAoYW5kIHBhc3QpIHRoaXMgcG9pbnQ/CgotLSAKUmVnYXJkcywKUHUg
V2VuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
