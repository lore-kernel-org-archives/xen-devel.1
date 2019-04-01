From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v4 02/15] x86/cpu: Fix common cpuid faulting
 probing for AMD and Hygon
Date: Mon, 01 Apr 2019 02:40:48 -0600
Message-ID: <5CA1CE900200007800223782@prv1-mh.provo.novell.com>
References: <cover.1553935727.git.puwen@hygon.cn>
 <96396a5ea9e1acc527705f71e9cd657b16585a75.1553935727.git.puwen@hygon.cn>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=uvFD=SD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hAsUw-0004KS-HC
 for xen-devel@lists.xenproject.org; Mon, 01 Apr 2019 08:40:54 +0000
In-Reply-To: <96396a5ea9e1acc527705f71e9cd657b16585a75.1553935727.git.puwen@hygon.cn>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Pu Wen <puwen@hygon.cn>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDMwLjAzLjE5IGF0IDExOjQyLCA8cHV3ZW5AaHlnb24uY24+IHdyb3RlOgo+IFRoZXJl
IGlzIG5vIE1TUl9JTlRFTF9QTEFURk9STV9JTkZPIGZvciBBTUQgYW5kIEh5Z29uIGZhbWlsaWVz
LiBTbyBkaXJlY3RseQo+IHJldHVybiBmYWxzZSBpbiB0aGUgZnVuY3Rpb24gcHJvYmVfY3B1aWRf
ZmF1bHRpbmcoKSBpZiAhY3B1X2hhc19oeXBlcnZpc29yLgoKSSB0aGluayBpdCB3b3VsZCBoYXZl
IGJlZW4gbmljZSBpZiB5b3UgaGFkIG1lbnRpb25lZCB0aGUgcmVhbApyZWFzb24gd2h5IHlvdSB3
YW50IHRvIGJ5cGFzcyB0aGUgTVNSIGFjY2Vzc2VzLiBUaGlzIHdheSBpdApzb3VuZHMgYXMgaWYg
dGhlIGNoYW5nZSB3YXMgb25seSBjb3NtZXRpYywgYW5kIGhlbmNlIGNvdWxkIGJlCmxlZnQgb3V0
LgoKPiBTaWduZWQtb2ZmLWJ5OiBQdSBXZW4gPHB1d2VuQGh5Z29uLmNuPgoKQWNrZWQtYnk6IEph
biBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCkFuZHJldywgSSdkIGxpa2UgdG8gYXNrIGZv
ciBleHBsaWNpdCBjbGFyaWZpY2F0aW9uIHRoYXQgeW91IGRvbid0IG9iamVjdAp0byB0aGlzIGFk
anVzdG1lbnQuIEJ1dCBpZiB5b3UgZG8sIHBsZWFzZSBjbGFyaWZ5IHdoeS4KClRoYW5rcywgSmFu
Cgo+IC0tLSBhL3hlbi9hcmNoL3g4Ni9jcHUvY29tbW9uLmMKPiArKysgYi94ZW4vYXJjaC94ODYv
Y3B1L2NvbW1vbi5jCj4gQEAgLTExNiw2ICsxMTYsMTEgQEAgYm9vbCBfX2luaXQgcHJvYmVfY3B1
aWRfZmF1bHRpbmcodm9pZCkKPiAgCXVpbnQ2NF90IHZhbDsKPiAgCWludCByYzsKPiAgCj4gKwlp
ZiAoKGJvb3RfY3B1X2RhdGEueDg2X3ZlbmRvciA9PSBYODZfVkVORE9SX0hZR09OIHx8Cj4gKwkg
ICAgIGJvb3RfY3B1X2RhdGEueDg2X3ZlbmRvciA9PSBYODZfVkVORE9SX0FNRCkgJiYKPiArCSAg
ICAhY3B1X2hhc19oeXBlcnZpc29yKQo+ICsJCXJldHVybiBmYWxzZTsKPiArCj4gIAlpZiAoKHJj
ID0gcmRtc3Jfc2FmZShNU1JfSU5URUxfUExBVEZPUk1fSU5GTywgdmFsKSkgPT0gMCkKPiAgCQly
YXdfbXNyX3BvbGljeS5wbGFmb3JtX2luZm8uY3B1aWRfZmF1bHRpbmcgPQo+ICAJCQl2YWwgJiBN
U1JfUExBVEZPUk1fSU5GT19DUFVJRF9GQVVMVElORzsKPiAtLSAKPiAyLjcuNAoKCgoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
