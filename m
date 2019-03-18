From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2 02/14] x86/cpu/mtrr: Add Hygon Dhyana
 support to get TOP_MEM2
Date: Mon, 18 Mar 2019 02:57:13 -0600
Message-ID: <5C8F5D69020000780021FB8B@prv1-mh.provo.novell.com>
References: <cover.1550647742.git.puwen@hygon.cn>
 <def8c70bb26f9d5bc92e29f2ef182a87fbccb408.1550647742.git.puwen@hygon.cn>
 <5C8B9D0D020000780021F419@prv1-mh.provo.novell.com>
 <7edd53a4-99c6-ff6e-15e5-a88ff5d5efb8@hygon.cn>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=VMO2=RV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1h5o59-0007rr-IE
 for xen-devel@lists.xenproject.org; Mon, 18 Mar 2019 08:57:19 +0000
In-Reply-To: <7edd53a4-99c6-ff6e-15e5-a88ff5d5efb8@hygon.cn>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Pu Wen <puwen@hygon.cn>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE2LjAzLjE5IGF0IDExOjA2LCA8cHV3ZW5AaHlnb24uY24+IHdyb3RlOgo+IE9uIDIw
MTkvMy8xNSAyMDo0MCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+IE9uIDIxLjAyLjE5IGF0IDEw
OjQ4LCA8cHV3ZW5AaHlnb24uY24+IHdyb3RlOgo+Pj4gVGhlIEh5Z29uIERoeWFuYSBDUFUgc3Vw
cG9ydHMgdGhlIE1TUiB3YXkgdG8gZ2V0IFRPUF9NRU0yLiBTbyBhZGQgSHlnb24KPj4+IERoeWFu
YSBzdXBwb3J0IHRvIHByaW50IHRoZSB2YWx1ZSBvZiBUT1BfTUVNMi4KPj4+Cj4+PiBTaWduZWQt
b2ZmLWJ5OiBQdSBXZW4gPHB1d2VuQGh5Z29uLmNuPgo+PiAKPj4gQWNrZWQtYnk6IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPj4gCj4+IEknbSBhZnJhaWQgSSB3b24ndCBiZSBhYmxl
IHRvIG9mZmVyIFJldmlld2VkLWJ5IHRhZ3MgZm9yIGFueSBvZgo+PiB0aGlzIHNlcmllcyB3aXRo
b3V0IHlvdSBwb2ludGluZyB1cyBhdCB0aGUgZG9jdW1lbnRhdGlvbiBmb3IgdGhlCj4+IHByb2Nl
c3NvciAoYSBsaW5rIHNob3VsZCByZWFsbHkgYmUgaW4gdGhlIGNvdmVyIGxldHRlcikuCj4gCj4g
RG8geW91IG1lYW4gdGhlIHNwZWNpZmljYXRpb24gZm9yIEh5Z29uIHByb2Nlc3Nvcj8gV2UgZG9u
J3QgaGF2ZSBhbnkKPiBwdWJsaWMgc3BlYyBub3csIGJ1dCB5b3UgY2FuIHJlZmVyZW5jZSB0byB0
aGUgQU1EIFplbiBvbmVbMV0uCgpXZWxsLCBubywgbm90IHJlYWxseS4gVGhlcmUgYXJlIHVuZG91
YnRlZGx5IGRpZmZlcmVuY2VzIChzZWUgeW91cgpyZXBseSB0byBteSBwY2lfY2ZnX29rKCkgcXVl
c3Rpb24gYXMgYW4gZXhhbXBsZSkuIEkgY2FuIGFjawpjaGFuZ2VzIG9uIHRoZSBiYXNpcyB0aGF0
IHlvdSBrbm93IGhvdyB5b3VyIHByb2Nlc3NvcnMgYmVoYXZlLgpJIGNhbiBnaXZlIFItYiBvbmx5
IGlmIEkgaGF2ZSBIeWdvbi1zcGVjaWZpYyBkb2MgdG8gY2hlY2sgYWdhaW5zdC4KCkphbgoKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
