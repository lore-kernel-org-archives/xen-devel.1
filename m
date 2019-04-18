From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 07/12] xen/arm: cpuerrata: Match register
 size with value size in check_workaround_*
Date: Thu, 18 Apr 2019 12:04:48 -0700 (PDT)
Message-ID: <alpine.DEB.2.10.1904181203340.1370@sstabellini-ThinkPad-X260>
References: <20190327184531.30986-1-julien.grall@arm.com>
 <20190327184531.30986-8-julien.grall@arm.com>
 <alpine.DEB.2.10.1904171327100.1370@sstabellini-ThinkPad-X260>
 <970bfa4e-192e-967a-b211-16dee9cb7ed8@arm.com>
 <alpine.DEB.2.10.1904181104360.1370@sstabellini-ThinkPad-X260>
 <66c0b06a-bd34-9044-0aa4-35eee52c3d98@arm.com>
 <alpine.DEB.2.10.1904181148300.1370@sstabellini-ThinkPad-X260>
 <5414f6ea-b776-3dfa-682a-d6b63bf2374f@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tnl2=SU=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hHCL5-0000bQ-AA
 for xen-devel@lists.xenproject.org; Thu, 18 Apr 2019 19:04:51 +0000
In-Reply-To: <5414f6ea-b776-3dfa-682a-d6b63bf2374f@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: Artem_Mygaiev@epam.com, xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>, Andrii_Anisov@epam.com, Oleksandr_Tyshchenko@epam.com
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCAxOCBBcHIgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IE9uIDE4LzA0LzIwMTkg
MTk6NTIsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToKPiA+IE9uIFRodSwgMTggQXByIDIwMTks
IEp1bGllbiBHcmFsbCB3cm90ZToKPiA+ID4gT24gMTgvMDQvMjAxOSAxOToyMywgU3RlZmFubyBT
dGFiZWxsaW5pIHdyb3RlOgo+ID4gPiA+IE9uIFdlZCwgMTcgQXByIDIwMTksIEp1bGllbiBHcmFs
bCB3cm90ZToKPiA+ID4gPiA+IE9uIDQvMTcvMTkgOToyOCBQTSwgU3RlZmFubyBTdGFiZWxsaW5p
IHdyb3RlOgo+ID4gPiA+ID4gPiBPbiBXZWQsIDI3IE1hciAyMDE5LCBKdWxpZW4gR3JhbGwgd3Jv
dGU6Cj4gPiA+IElmIGl0IGlzIGNvbnNpZGVyZWQgY29tcGxpYW50LCB0aGVuIGl0IGRvZXMgbm90
IG1ha2Ugc2Vuc2UuCj4gPiAKPiA+IFllcywgSSB0aGluayB0aGlzIGlzIG5vdCBjb21wbGlhbnQg
dG9vLiBBbHNvLCBmcm9tIHdoYXQgSSBoYXZlIGJlZW4KPiA+IHRvbGQsIHRoaXMgZXhhbXBsZSBp
cyBmYW1vdXMgZm9yIGJlaW5nIG9uZSBvZiB0aGUgbW9zdCBleHRyZW1lIGV4YW1wbGVzCj4gPiBv
ZiBNSVNSQS1DIG5vbi1jb21wbGlhbmNlLiBJIHRoaW5rIHRoZSBjb21wbGlhbnQgdmVyc2lvbiB3
b3VsZCBiZToKPiA+IAo+ID4gYm9vbCBpc19ub256ZXJvKGludCBiKQo+ID4gewo+ID4gICAgICBp
ZiAoYiAhPSAwKQo+ID4gICAgICAgIHJldHVybiB0cnVlOwo+ID4gICAgICBlbHNlCj4gPiAgICAg
ICAgcmV0dXJuIGZhbHNlOwo+ID4gfQo+ID4gCj4gPiBUaGlzIGlzIGFsc28gY29tcGxpYW50Ogo+
ID4gCj4gPiBib29sIGlzX25vbnplcm8oaW50IGIpCj4gPiB7Cj4gPiAgICAgIHJldHVybiAoYiAh
PSAwKTsKPiA+IH0KPiA+IAo+IAo+IEkgd2lsbCB1c2UgISFiIGhlcmUgYW5kIGluIHRoZSBuZXh0
IHBhdGNoLiBCdXQgSSBzdGlsbCBkb3VidCB5b3Ugd2lsbCBiZSBhYmxlCj4gdG8gZW5mb3JjZSBp
dCBpbiBYZW4uIGlmICggbiApIGlzIHF1aXRlIGEgY29tbW9uIHBhdHRlcm4uCiAKVGhhbmtzLiBC
YWJ5IHN0ZXBzIDotKQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
