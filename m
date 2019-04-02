From: Pu Wen <puwen@hygon.cn>
Subject: Re: [PATCH v4 02/15] x86/cpu: Fix common cpuid faulting
 probing for AMD and Hygon
Date: Tue, 2 Apr 2019 19:58:39 +0800
Message-ID: <6341db2c-2504-efb0-acae-f0b2b1b42c98@hygon.cn>
References: <cover.1553935727.git.puwen@hygon.cn>
 <96396a5ea9e1acc527705f71e9cd657b16585a75.1553935727.git.puwen@hygon.cn>
 <5CA1CE900200007800223782@prv1-mh.provo.novell.com>
 <3584da10-e33c-b382-bbb3-c12b538de30a@hygon.cn>
 <5CA337400200007800223D81@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=tiqP=SE=hygon.cn=puwen@srs-us1.protection.inumbo.net>)
 id 1hBI99-0001ja-9d
 for xen-devel@lists.xenproject.org; Tue, 02 Apr 2019 12:04:07 +0000
In-Reply-To: <5CA337400200007800223D81@prv1-mh.provo.novell.com>
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

T24gMjAxOS80LzIgMTg6MjAsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDAyLjA0LjE5IGF0IDA4
OjQ2LCA8cHV3ZW5AaHlnb24uY24+IHdyb3RlOgo+PiBPbiAyMDE5LzQvMSAxNjo0MSwgSmFuIEJl
dWxpY2ggd3JvdGU6Cj4+PiBPbiAzMC4wMy4xOSBhdCAxMTo0MiwgPHB1d2VuQGh5Z29uLmNuPiB3
cm90ZToKPj4+PiBUaGVyZSBpcyBubyBNU1JfSU5URUxfUExBVEZPUk1fSU5GTyBmb3IgQU1EIGFu
ZCBIeWdvbiBmYW1pbGllcy4gU28gZGlyZWN0bHkKPj4+PiByZXR1cm4gZmFsc2UgaW4gdGhlIGZ1
bmN0aW9uIHByb2JlX2NwdWlkX2ZhdWx0aW5nKCkgaWYgIWNwdV9oYXNfaHlwZXJ2aXNvci4KPj4+
Cj4+PiBJIHRoaW5rIGl0IHdvdWxkIGhhdmUgYmVlbiBuaWNlIGlmIHlvdSBoYWQgbWVudGlvbmVk
IHRoZSByZWFsCj4+PiByZWFzb24gd2h5IHlvdSB3YW50IHRvIGJ5cGFzcyB0aGUgTVNSIGFjY2Vz
c2VzLiBUaGlzIHdheSBpdAo+Pj4gc291bmRzIGFzIGlmIHRoZSBjaGFuZ2Ugd2FzIG9ubHkgY29z
bWV0aWMsIGFuZCBoZW5jZSBjb3VsZCBiZQo+Pj4gbGVmdCBvdXQuCj4+Cj4+IE9rYXksIGhvdyBh
Ym91dCB0aGUgbmV3IGRlc2NyaXB0aW9uOgo+PiBUaGVyZSBpcyBubyBNU1JfSU5URUxfUExBVEZP
Uk1fSU5GTyBmb3IgQU1EIGFuZCBIeWdvbiBmYW1pbGllcy4gUmVhZAo+PiB0aGlzIE1TUiB3aWxs
IHN0b3AgdGhlIFhlbiBpbml0aWFsaXphdGlvbiBwcm9jZXNzCj4gCj4gIi4uLiBmb3Igc29tZSBl
YXJseSBIeWdvbiBzdGVwcGluZ3MiKD8pLiBJJ20gdW5hd2FyZSBvZiBBTUQgQ1BVcwoKWWVzLGZv
ciBzb21lIGVhcmx5IEh5Z29uIHN0ZXBwaW5ncy4KCj4gaGF2aW5nIHRoaXMgaXNzdWUgLSBhcmUg
eW91IHRlbGxpbmcgdXMgb3RoZXJ3aXNlPwoKSSB0ZXN0ZWQgd2l0aCBhbiBBTUQgQ1BVKEZhbWls
eSAxN2gsIE1vZGVsIDEsIFN0ZXBwaW5nIDEpIHRvZGF5LCBhbmQKaXQgYWxzbyBzdG9wcGVkIHdo
ZW4gcmVhZGluZyB0aGUgTVNSX0lOVEVMX1BMQVRGT1JNX0lORk8gaW5zdGVhZCBvZgpwcm9kdWNp
bmcgI0dQKDApLgoKLS0gClJlZ2FyZHMsClB1IFdlbgoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
