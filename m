From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH 0/2] gic-vgic optimizations
Date: Fri, 14 Dec 2018 15:28:33 +0000
Message-ID: <f4adc052-137f-214d-d275-c83215d6942a@arm.com>
References: <1544638855-9432-1-git-send-email-andrii.anisov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=16tG=OX=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1gXpOH-000785-Id
 for xen-devel@lists.xenproject.org; Fri, 14 Dec 2018 15:28:37 +0000
In-Reply-To: <1544638855-9432-1-git-send-email-andrii.anisov@gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrii Anisov <andrii.anisov@gmail.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Andrii Anisov <andrii_anisov@epam.com>
List-Id: xen-devel@lists.xenproject.org

SGksCgpJIGhhdmUgY29tbWl0dGVkIHRoZSAyIHBhdGNoZXMuCgpJbiB0aGUgZnV0dXJlLCBwbGVh
c2UgYWRkIHRoZSB2ZXJzaW9uIG9mIHRoZSBzZXJpZXMgaW4gdGhlIHRpdGxlIG9mIHRoZSAKY292
ZXIgbGV0dGVyLiBUaGlzIG1ha2VzIGVhc2llciBmb3IgdXMgdG8ga25vdyB3aGljaCBzZXJpZXMg
aXMgdGhlIGxhdGVzdC4KClRoaXMgY291bGQgYmUgZG9uZSBhdXRvbWF0aWNhbGx5IGlmIHlvdSB1
c2UgZ2l0LWZvcm1hdC1wYXRjaCB0byBnZW5lcmF0ZSAKdGhlIGNvdmVyIGxldHRlciBhdCB0aGUg
c2FtZSB0aW1lIGFzIHRoZSBwYXRjaGVzLgoKQ2hlZXJzLAoKT24gMTIvMTIvMTggNjoyMCBQTSwg
QW5kcmlpIEFuaXNvdiB3cm90ZToKPiBGcm9tOiBBbmRyaWkgQW5pc292IDxhbmRyaWlfYW5pc292
QGVwYW0uY29tPgo+IAo+IEhlcmUgYXJlIGZldyBwYXRjaGVzIGZyb20gUkZDIHNlcmllcyBbMV0g
Y3VycmVudGx5IGFwcHJvdmVkIHRvCj4gYmUgdXBzdHJlYW1lZCB3aXRoIGFwcHJvcHJpYXRlIGNo
YW5nZXMuCj4gCj4gQW5kcmlpIEFuaXNvdiAoMik6Cj4gICAgZ2ljLXZnaWM6IERyb3AgYW4gZXhj
ZXNzaXZlIGNsZWFyX2xycwo+ICAgICAgICAgIElzIGEgcGF0Y2ggIzUgWzJdLCB3aXRoIGEgY2hh
bmdlOgo+ICAgICAgICAgICAtIEtlZXAgTFIgY2xlYXIgZm9yIGRlYnVnIGJ1aWxkCj4gICAgICAg
ICAgTm8gY2hhbmdlcyBpbiB2MjoKPiAKPiAKPiAgICBhcm0vaXJxOiBza2lwIGFjdGlvbiBhdmFp
bGFiaWxpdHkgY2hlY2sgZm9yIG5vbi1kZWJ1ZyBidWlsZAo+ICAgICAgICAgIElzIGEgcGF0Y2gg
IzExIFszXSwgd2l0aCBhIGNoYW5nZToKPiAgICAgICAgICAgLSBDb21wbGV0ZWx5IHJlbW92ZSB0
aGUgY2hlY2sgZm9yIGEgbm9uLWRlYnVnIGJ1aWxkLAo+ICAgICAgICAgICAgIGJ1dCBwcmVzZXJ2
ZSBmb3IgZGVidWcuCj4gICAgICAgICAgQ2hhbmdlcyBpbiB2MjoKPiAgICAgICAgICAgLSByZXdv
cmRlZCB0aGUgY29tbWl0IHRpdGxlIGFuZCBtZXNzYWdlCj4gICAgICAgICAgIC0gcmVtb3ZlZCBh
biBSQiBwcmVtYXR1cmVseSBpbnNlcnRlZCBieSBtaXN0YWtlCj4gCj4gWzFdIGh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvYXJjaGl2ZXMvaHRtbC94ZW4tZGV2ZWwvMjAxOC0xMS9tc2cwMzMy
OC5odG1sCj4gWzJdIGh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvYXJjaGl2ZXMvaHRtbC94
ZW4tZGV2ZWwvMjAxOC0xMS9tc2cwMzI4NS5odG1sCj4gWzNdIGh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvYXJjaGl2ZXMvaHRtbC94ZW4tZGV2ZWwvMjAxOC0xMS9tc2cwMzI5MS5odG1sCj4g
Cj4gICB4ZW4vYXJjaC9hcm0vZ2ljLXZnaWMuYyB8IDIgKysKPiAgIHhlbi9hcmNoL2FybS9pcnEu
YyAgICAgIHwgMiArKwo+ICAgMiBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykKPiAKCi0t
IApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
