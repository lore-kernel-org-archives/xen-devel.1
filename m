From: Pu Wen <puwen@hygon.cn>
Subject: Re: [PATCH v3 01/14] x86/cpu: Create Hygon Dhyana
 architecture support file
Date: Wed, 27 Mar 2019 18:08:25 +0800
Message-ID: <f811c31f-ad7f-c94b-bc59-b3bb8a329fea@hygon.cn>
References: <cover.1553520193.git.puwen@hygon.cn>
 <14dcae729e8d2ed9ba54565a61e027c83b9df529.1553520193.git.puwen@hygon.cn>
 <5C9A49DA0200007800221F7F@prv1-mh.provo.novell.com>
 <f8aa80d5-5a5e-b8b9-932b-bc9310f75a59@hygon.cn>
 <5C9B34BC0200007800222113@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Vk7p=R6=hygon.cn=puwen@srs-us1.protection.inumbo.net>)
 id 1h95Yx-0005vd-PT
 for xen-devel@lists.xenproject.org; Wed, 27 Mar 2019 10:13:39 +0000
In-Reply-To: <5C9B34BC0200007800222113@prv1-mh.provo.novell.com>
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

T24gMjAxOS8zLzI3IDE2OjMxLCBKYW4gQmV1bGljaCB3cm90ZToKPiBPbiAyNy4wMy4xOSBhdCAw
OToxNCwgPHB1d2VuQGh5Z29uLmNuPiB3cm90ZToKPj4gT24gMjAxOS8zLzI2IDIzOjQ5LCBKYW4g
QmV1bGljaCB3cm90ZToKPj4+IE9uIDI1LjAzLjE5IGF0IDE0OjI5LCA8cHV3ZW5AaHlnb24uY24+
IHdyb3RlOgo+Pj4+IEBAIC0xMTYsNiArMTIxLDkgQEAgYm9vbCBfX2luaXQgcHJvYmVfY3B1aWRf
ZmF1bHRpbmcodm9pZCkKPj4+PiAgICAJdWludDY0X3QgdmFsOwo+Pj4+ICAgIAlpbnQgcmM7Cj4+
Pj4gICAgCj4+Pj4gKwlpZihib290X2NwdV9kYXRhLng4Nl92ZW5kb3IgPT0gWDg2X1ZFTkRPUl9I
WUdPTikKPj4+PiArCQlyZXR1cm4gZmFsc2U7Cj4+Pj4gKwo+Pj4+ICAgIAlpZiAoKHJjID0gcmRt
c3Jfc2FmZShNU1JfSU5URUxfUExBVEZPUk1fSU5GTywgdmFsKSkgPT0gMCkKPj4+Cj4+PiBJc24n
dCB0aGlzIHNpbWlsYXJseSB0cnVlIGZvciBBTUQsIGluIHdoaWNoIGNhc2UgYWRkaW5nIGJvdGgg
YXQgdGhlCj4+Cj4+IFRoZXJlIGlzIG5vIE1TUl9JTlRFTF9QTEFURk9STV9JTkZPIGZvciBBTUQg
ZmFtaWx5IDE3aCBhbmQgSHlnb24gZmFtaWx5Cj4+IDE4aC4gUmVhZGluZyB0aGlzIE1TUiB3aWxs
IHN0YWxsIG9uIEh5Z29uIHN5c3RlbS4gSSBkb24ndCBrbm93IGlmIGl0Cj4+IHdvdWxkIHN1Y2Nl
c3NmdWxseSByZXR1cm5lZCB3aGVuIHJlYWRpbmcgaXQgb24gQU1EIHN5c3RlbS4KPiAKPiBXaGF0
IGRvIHlvdSBtZWFuIGJ5ICJzdGFsbCI/IFJlYWRpbmcgYW4gdW5pbXBsZW1lbnRlZCBNU1IKPiBz
aG91bGQgcHJvZHVjZSAjR1AoMCkuCgpPbiBjZXJ0YWluIG9sZCBIeWdvbiBzeXN0ZW0gdGhlcmUg
aXMgbm8gI0dQIHByb2R1Y2VkLiBBbmQgdGhlIFhlbgppbml0aWFsaXphdGlvbiBwcm9jZXNzIGlz
IHN0b3BwZWQuCgpCZXlvbmQgdGhhdCBpdCB3aWxsIGluZGVlZCBwcm9kdWNlOgoidHJhcHMuYzox
NTc0OiBHUEYgKDAwMDApIgphbmQgcmV0dXJuIGZhbHNlIGZyb20gdGhlIGxhc3QgaWYoKSBjb25k
aXRpb25hbC4KCj4+PiBzYW1lIHRpbWUgaW4gYSBzZXBhcmF0ZSBwYXRjaCB3b3VsZCBzZWVtIGJl
dHRlcj8gWWV0IHRoZW4gYWdhaW4gLQo+Pgo+PiBJbiBhIHNlcGFyYXRlIHBhdGNoIGlzIGZpbmUu
Cj4+Cj4+PiBkaWQgeW91IGxvb2sgYXQgdGhlIGRlc2NyaXB0aW9uIG9mIHRoZSBjb21taXQgbW92
aW5nIHRoZSBmdW5jdGlvbgo+Pj4gaGVyZSAoNmUyZmRjMGY4OSBbIng4NjogQ29tbW9uIGNwdWlk
IGZhdWx0aW5nIHN1cHBvcnQiXSk/IEhlbmNlCj4+PiBpZiBhbnl0aGluZyB0aGlzIHdvdWxkIG5l
ZWQgcXVhbGlmeWluZyBieSAhY3B1X2hhc19oeXBlcnZpc29yLgo+Pgo+PiBUaGVuIGl0IHdvdWxk
IGJlIGxpa2UgdGhpczoKPj4gCWlmIChib290X2NwdV9kYXRhLng4Nl92ZW5kb3IgPT0gWDg2X1ZF
TkRPUl9IWUdPTiAmJgo+PiAJICAgICFjcHVfaGFzX2h5cGVydmlzb3IpCj4+IAkJcmV0dXJuIGZh
bHNlOwo+IAo+IFJpZ2h0LCBwbHVzIHBlcmhhcHMgc2FpZCBBTUQgYWRkaXRpb24sIHVubGVzcyBB
bmRyZXcgb2JqZWN0cyB0byBpdAo+IGZvciBzb21lIHJlYXNvbi4KClRoZW4gaXQgd291bGQgYmUg
bGlrZSB0aGlzOgoJaWYgKChib290X2NwdV9kYXRhLng4Nl92ZW5kb3IgPT0gWDg2X1ZFTkRPUl9I
WUdPTiB8fAoJICAgICBib290X2NwdV9kYXRhLng4Nl92ZW5kb3IgPT0gWDg2X1ZFTkRPUl9BTUQp
ICYmCgkgICAgIWNwdV9oYXNfaHlwZXJ2aXNvcikKCQlyZXR1cm4gZmFsc2U7CgpBbmRyZXcsIGFu
eSBvYmplY3Rpb25zPwoKLS0gClJlZ2FyZHMsClB1IFdlbgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
