From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2] xen: add DEBUG_INFO Kconfig symbol
Date: Fri, 31 Aug 2018 09:51:50 +0100
Message-ID: <ee5f404d-c8b3-7f7f-b188-a9097fae65ec@citrix.com>
References: <20180831082921.11208-1-olaf@aepfle.de>
 <20180831083216.gxvhuunogisdiinx@zion.uk.xensource.com>
 <5B88FF3A02000078001E3C75@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=rvsg=lo=citrix.com=prvs=7748f1fea=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1fvf9m-0003Jj-85
 for xen-devel@lists.xenproject.org; Fri, 31 Aug 2018 08:51:54 +0000
In-Reply-To: <5B88FF3A02000078001E3C75@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, Wei Liu <wei.liu2@citrix.com>
Cc: Olaf Hering <olaf@aepfle.de>, Stefano Stabellini <sstabellini@kernel.org>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMzEvMDgvMTggMDk6NDEsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDMxLjA4LjE4IGF0
IDEwOjMyLCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4+IE9uIEZyaSwgQXVnIDMxLCAy
MDE4IGF0IDEwOjI5OjIxQU0gKzAyMDAsIE9sYWYgSGVyaW5nIHdyb3RlOgo+Pj4gQ3JlYXRpbmcg
ZGVidWcgaW5mbyBkdXJpbmcgYnVpbGQgaXMgbm90IHN0cmljdGx5IHJlcXVpcmVkIGF0IHJ1bnRp
bWUuCj4+PiBNYWtlIGl0IG9wdGlvbmFsIGJ5IGludHJvZHVjaW5nIGEgbmV3IEtjb25maWcga25v
YiAiREVCVUdfSU5GTyIuCj4+PiBUaGlzIHNsaWdodGx5IHJlZHVjZXMgYnVpbGQgdGltZSBhbmQg
ZGlza3VzYWdlLCBpZiBkaXNhYmxlZC4KPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBPbGFmIEhlcmlu
ZyA8b2xhZkBhZXBmbGUuZGU+Cj4+PiAtLS0KPj4+ICB4ZW4vS2NvbmZpZy5kZWJ1ZyB8IDcgKysr
KysrKwo+Pj4gIHhlbi9SdWxlcy5tayAgICAgIHwgNSArKysrLQo+Pj4gIDIgZmlsZXMgY2hhbmdl
ZCwgMTEgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+Pj4KPj4+IGRpZmYgLS1naXQgYS94
ZW4vS2NvbmZpZy5kZWJ1ZyBiL3hlbi9LY29uZmlnLmRlYnVnCj4+PiBpbmRleCAzODBjNGU4ZDc1
Li4xZDhjMmM5NGE5IDEwMDY0NAo+Pj4gLS0tIGEveGVuL0tjb25maWcuZGVidWcKPj4+ICsrKyBi
L3hlbi9LY29uZmlnLmRlYnVnCj4+PiBAQCAtMTEsNiArMTEsMTMgQEAgY29uZmlnIERFQlVHCj4+
PiAgCj4+PiAgCSAgWW91IHByb2JhYmx5IHdhbnQgdG8gc2F5ICdOJyBoZXJlLgo+Pj4gIAo+Pj4g
K2NvbmZpZyBERUJVR19JTkZPCj4+PiArCWJvb2wgIkNvbXBpbGUgWGVuIHdpdGggZGVidWcgaW5m
byIKPj4+ICsJZGVmYXVsdCB5Cj4+IEF0IHRoZSB2ZXJ5IGxlYXN0IHRoaXMgc2hvdWxkIGJlIGRl
ZmF1bHQgREVCVUcKPiBJIGRpc2FncmVlIC0gLWcgaXMgYmVpbmcgcGFzc2VkIHRvIHRoZSBjb21w
aWxlciB1bmNvbmRpdGlvbmFsbHkgYXQKPiBwcmVzZW50LgoKKzEKCkRpc3RybyBwYWNrYWdlcnMg
bmVlZCB0byBidWlsZCBkZWJ1Z2luZm8gcGFja2FnZXMsIGFuZCBoYXZpbmcgYSByZWxlYXNlCmJ1
aWxkIG9mIFhlbiB3aXRoIHhlbi1zeW1zIGxhY2tpbmcgYWxsIHRoZSBkZWJ1ZyBzeW1ib2xzIGlz
IHF1aXRlIHVzZWxlc3MuCgp+QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
