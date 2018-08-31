From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2] xen: add DEBUG_INFO Kconfig symbol
Date: Fri, 31 Aug 2018 02:41:30 -0600
Message-ID: <5B88FF3A02000078001E3C75@prv1-mh.provo.novell.com>
References: <20180831082921.11208-1-olaf@aepfle.de>
 <20180831083216.gxvhuunogisdiinx@zion.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=ynna=lo=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fvezl-00026s-PI
 for xen-devel@lists.xenproject.org; Fri, 31 Aug 2018 08:41:33 +0000
In-Reply-To: <20180831083216.gxvhuunogisdiinx@zion.uk.xensource.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: Olaf Hering <olaf@aepfle.de>, Stefano Stabellini <sstabellini@kernel.org>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDMxLjA4LjE4IGF0IDEwOjMyLCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4g
T24gRnJpLCBBdWcgMzEsIDIwMTggYXQgMTA6Mjk6MjFBTSArMDIwMCwgT2xhZiBIZXJpbmcgd3Jv
dGU6Cj4+IENyZWF0aW5nIGRlYnVnIGluZm8gZHVyaW5nIGJ1aWxkIGlzIG5vdCBzdHJpY3RseSBy
ZXF1aXJlZCBhdCBydW50aW1lLgo+PiBNYWtlIGl0IG9wdGlvbmFsIGJ5IGludHJvZHVjaW5nIGEg
bmV3IEtjb25maWcga25vYiAiREVCVUdfSU5GTyIuCj4+IFRoaXMgc2xpZ2h0bHkgcmVkdWNlcyBi
dWlsZCB0aW1lIGFuZCBkaXNrdXNhZ2UsIGlmIGRpc2FibGVkLgo+PiAKPj4gU2lnbmVkLW9mZi1i
eTogT2xhZiBIZXJpbmcgPG9sYWZAYWVwZmxlLmRlPgo+PiAtLS0KPj4gIHhlbi9LY29uZmlnLmRl
YnVnIHwgNyArKysrKysrCj4+ICB4ZW4vUnVsZXMubWsgICAgICB8IDUgKysrKy0KPj4gIDIgZmls
ZXMgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+PiAKPj4gZGlmZiAt
LWdpdCBhL3hlbi9LY29uZmlnLmRlYnVnIGIveGVuL0tjb25maWcuZGVidWcKPj4gaW5kZXggMzgw
YzRlOGQ3NS4uMWQ4YzJjOTRhOSAxMDA2NDQKPj4gLS0tIGEveGVuL0tjb25maWcuZGVidWcKPj4g
KysrIGIveGVuL0tjb25maWcuZGVidWcKPj4gQEAgLTExLDYgKzExLDEzIEBAIGNvbmZpZyBERUJV
Rwo+PiAgCj4+ICAJICBZb3UgcHJvYmFibHkgd2FudCB0byBzYXkgJ04nIGhlcmUuCj4+ICAKPj4g
K2NvbmZpZyBERUJVR19JTkZPCj4+ICsJYm9vbCAiQ29tcGlsZSBYZW4gd2l0aCBkZWJ1ZyBpbmZv
Igo+PiArCWRlZmF1bHQgeQo+IAo+IEF0IHRoZSB2ZXJ5IGxlYXN0IHRoaXMgc2hvdWxkIGJlIGRl
ZmF1bHQgREVCVUcKCkkgZGlzYWdyZWUgLSAtZyBpcyBiZWluZyBwYXNzZWQgdG8gdGhlIGNvbXBp
bGVyIHVuY29uZGl0aW9uYWxseSBhdApwcmVzZW50LgoKPiBCdXQgd2hhdCBpcyB0aGUgZGlmZmVy
ZW5jZSBiZXR3ZWVuIHRoaXMgYW5kIERFQlVHIGFueXdheT8KCkRFQlVHX0lORk8gY29udHJvbHMg
dXNlIG9mIHRoZSAtZyBjb21waWxlciBvcHRpb24uIERFQlVHIGNvbnRyb2xzCmhvdyBlLmcuIEFT
U0VSVCgpcyBiZWhhdmUuCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
