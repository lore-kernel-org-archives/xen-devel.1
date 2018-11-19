From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v5 01/47] x86emul: introduce IMPOSSIBLE()
Date: Mon, 19 Nov 2018 18:11:54 +0000
Message-ID: <2db64166-9ea3-7d41-5f35-6a9517085541@citrix.com>
References: <5B6BF83602000078001DC548@prv1-mh.provo.novell.com>
 <5BF289D802000078001FD3DF@prv1-mh.provo.novell.com>
 <5BF28CBF02000078001FD3FF@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Gnyi=N6=citrix.com=prvs=8544ffb4f=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1gOo55-0008Ch-M6
 for xen-devel@lists.xenproject.org; Mon, 19 Nov 2018 18:15:31 +0000
In-Reply-To: <5BF28CBF02000078001FD3FF@prv1-mh.provo.novell.com>
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTkvMTEvMjAxOCAxMDoxMywgSmFuIEJldWxpY2ggd3JvdGU6Cj4gQEAgLTg4MjgsMTIgKzg4
MzcsNyBAQCB4ODZfZW11bGF0ZSgKPiAgICAgICAgICAgICAgICAgIGRzdC50eXBlID0gT1BfTk9O
RTsKPiAgICAgICAgICAgICAgICAgIGJyZWFrOwo+ICAgICAgICAgICAgICBkZWZhdWx0Ogo+IC0g
ICAgICAgICAgICAgICAgaWYgKCAoZCAmIERzdE1hc2spICE9IERzdE1lbSApCj4gLSAgICAgICAg
ICAgICAgICB7Cj4gLSAgICAgICAgICAgICAgICAgICAgQVNTRVJUX1VOUkVBQ0hBQkxFKCk7Cj4g
LSAgICAgICAgICAgICAgICAgICAgcmMgPSBYODZFTVVMX1VOSEFORExFQUJMRTsKPiAtICAgICAg
ICAgICAgICAgICAgICBnb3RvIGRvbmU7Cj4gLSAgICAgICAgICAgICAgICB9Cj4gKyAgICAgICAg
ICAgICAgICBJTVBPU1NJQkxFKChkICYgRHN0TWFzaykgIT0gRHN0TWVtKTsKCklNUE9TU0lCTEUo
KSBkb2Vzbid0IHJlYWxseSBjb252ZXkgdGhlIGNvcnJlY3QgbWVhbmluZyBoZXJlIElNTywgYmVj
YXVzZQp0aGUgcHVycG9zZSBvZiB0aGUgY29uc3RydWN0IGlzIHRvIHRyeSBhbmQgZG8gc29tZXRo
aW5nIHNhZmUgaW4gdGhlIGNhc2UKdGhhdCB0aGUgaW1wb3NzaWJsZSBkb2VzIGhhcHBlbi4KCklu
c3RlYWQsIEknZCBzdWdnZXN0IEVYUEVDVCgpIG9yIFJFUVVJUkUoKSB3aXRoIGFuIGludmVydGVk
IGNvbmRpdGlvbiwKYmVjYXVzZSB0aGF0IGJldHRlciBlbmNhcHN1bGF0ZXMgdGhlIG1lYW5pbmcg
dGhhdCB3ZSBleHBlY3QgdGhpcyBhbHdheXMKdG8gYmUgdHJ1ZSwgYnV0IHRoYXQgaXQgbWlnaHQg
bm90IGJlLgoKV2l0aCBhIHN1aXRhYmxlIG5hbWUsIFJldmlld2VkLWJ5OiBBbmRyZXcgQ29vcGVy
IDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
