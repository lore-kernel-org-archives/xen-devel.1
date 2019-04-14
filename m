From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH V3 4/5] xen/arm: Extend SCIF early prink
 code to handle other interfaces
Date: Sun, 14 Apr 2019 18:48:50 +0100
Message-ID: <69c402ec-3a78-edf4-354d-1413b3c9c603@arm.com>
References: <1554718489-11318-1-git-send-email-olekstysh@gmail.com>
 <1554718489-11318-5-git-send-email-olekstysh@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=bMma=SQ=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hFjFP-0001Dr-9o
 for xen-devel@lists.xenproject.org; Sun, 14 Apr 2019 17:48:55 +0000
In-Reply-To: <1554718489-11318-5-git-send-email-olekstysh@gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Oleksandr Tyshchenko <olekstysh@gmail.com>, xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, sstabellini@kernel.org
List-Id: xen-devel@lists.xenproject.org

SGksCgpPbiA0LzgvMTkgMTE6MTQgQU0sIE9sZWtzYW5kciBUeXNoY2hlbmtvIHdyb3RlOgo+IEZy
b206IE9sZWtzYW5kciBUeXNoY2hlbmtvIDxvbGVrc2FuZHJfdHlzaGNoZW5rb0BlcGFtLmNvbT4K
PiAKPiBFeHRlbmQgZWFybHkgcHJpbmsgY29kZSB0byBiZSBhYmxlIHRvIGhhbmRsZSBvdGhlciBT
Q0lGKFgpCj4gY29tcGF0aWJsZSBpbnRlcmZhY2VzIGFzIHdlbGwuIFRoZXNlIGludGVyZmFjZXMg
aGF2ZSBsb3QgaW4gY29tbW9uLAo+IGJ1dCBtb3N0bHkgZGlmZmVyIGluIG9mZnNldHMgYW5kIGJp
dHMgZm9yIHNvbWUgcmVnaXN0ZXJzLgo+IAo+IEludHJvZHVjZSAiRUFSTFlfUFJJTlRLX1ZFUlNJ
T04iIGNvbmZpZyBvcHRpb24gdG8gY2hvb3NlIHdoaWNoCj4gaW50ZXJmYWNlIHZlcnNpb24gc2hv
dWxkIGJlIHVzZWQgKHRvIHByb3Blcmx5IGFwcGx5IHJlZ2lzdGVyIG9mZnNldHMpLgo+IAo+IFBs
ZWFzZSBub3RlLCBub3RoaW5nIGhhcyBiZWVuIHRlY2huaWNhbGx5IGNoYW5nZWQgZm9yIFJlbmVz
YXMgIkxhZ2VyIgo+IGFuZCBvdGhlciBzdXBwb3J0ZWQgYm9hcmRzIChTQ0lGKS4KPiAKPiBUaGUg
IkVBUkxZX1BSSU5US19WRVJTSU9OIiBvcHRpb24gZm9yIHRoYXQgYm9hcmQgc2hvdWxkIGJlIGVt
cHR5Ogo+IENPTkZJR19FQVJMWV9QUklOVEs9c2NpZiwweGU2ZTYwMDAwCj4gCj4gU2lnbmVkLW9m
Zi1ieTogT2xla3NhbmRyIFR5c2hjaGVua28gPG9sZWtzYW5kcl90eXNoY2hlbmtvQGVwYW0uY29t
Pgo+IENDOiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgo+IAo+IC0tLQo+ICAg
ICAgQ2hhbmdlcyBpbiB2MzoKPiAgICAgICAgICAtIEl0IHdhcyBkZWNpZGVkIG5vdCB0byBpbnRy
b2R1Y2UgbmV3IGRlYnVnLXNjaWZhLmluYwo+ICAgICAgICAgICAgZm9yIGhhbmRsaW5nIFNDSUZB
IGludGVyZmFjZSwgYnV0IHRvIGV4dGVuZCBleGlzdGluZwo+ICAgICAgICAgICAgZGVidWctc2Np
Zi5pbmMgZm9yIGhhbmRsaW5nIGJvdGggaW50ZXJmYWNlcy4KPiAgICAgICAgICAgIFRoaXMgcGF0
Y2ggaXMgYSByZXN1bHQgb2Ygc3BsaXR0aW5nIGFuIGluaXRpYWwgcGF0Y2gKPiAgICAgICAgICAg
ICJ4ZW4vYXJtOiBBZGQgU0NJRkEgVUFSVCBzdXBwb3J0IGZvciBlYXJseSBwcmludGsiCj4gICAg
ICAgICAgICBhbmQgb25seSByZXdvcmtzIGEgY29kZQo+IC0tLQo+ICAgeGVuL2FyY2gvYXJtL1J1
bGVzLm1rICAgICAgICAgICAgIHwgIDcgKysrKysrKwo+ICAgeGVuL2FyY2gvYXJtL2FybTMyL2Rl
YnVnLXNjaWYuaW5jIHwgMTMgKysrKysrKysrLS0tLQoKWW91IHdhbnQgdG8gdXBkYXRlIGRvY3Mv
bWlzYy9hcm0vZWFybHktcHJpbnRrLnR4dCB3aXRoIHRoZSBuZXcgb3B0aW9uLgoKT3RoZXJ3aXNl
LCB0aGUgY29kZSBsb29rcyBnb29kIHRvIG1lLgoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
