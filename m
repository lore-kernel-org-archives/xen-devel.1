From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v7 4/6] mm: introduce a helper to get the
 memory type of a page
Date: Wed, 22 Aug 2018 10:45:34 +0100
Message-ID: <20180822094534.omqbffzr5r3k6v5f@citrix.com>
References: <20180822075200.50278-1-roger.pau@citrix.com>
 <20180822075200.50278-5-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=om3v=lf=citrix.com=prvs=7650e4d92=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1fsPhq-0003F2-H2
 for xen-devel@lists.xenproject.org; Wed, 22 Aug 2018 09:45:38 +0000
Content-Disposition: inline
In-Reply-To: <20180822075200.50278-5-roger.pau@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBBdWcgMjIsIDIwMTggYXQgMDk6NTE6NThBTSArMDIwMCwgUm9nZXIgUGF1IE1vbm5l
IHdyb3RlOgo+IFJldHVybnMgYWxsIHRoZSBtZW1vcnkgdHlwZXMgYXBwbGljYWJsZSB0byBhIHBh
Z2UuCj4gCj4gVGhpcyBmdW5jdGlvbiBpcyB1bmltcGxlbWVudGVkIGZvciBBUk0uCj4gCj4gU2ln
bmVkLW9mZi1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Cj4gUmV2
aWV3ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPiAtLS0KPiBDaGFuZ2Vz
IHNpbmNlIHY1Ogo+ICAtIFJldHVybiBhbGwgdHlwZXMgdGhhdCBhcHBseSB0byBhIHBhZ2UsIHNp
bmNlIHRoZSB0eXBlcyB0aGVtc2VsdmVzCj4gICAgYXJlIGZsYWdzIHRoYXQgY2FuIGJlIG9yJ2Vk
IHRvZ2V0aGVyLgo+IC0tLQo+IENjOiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtl
cm5lbC5vcmc+Cj4gQ2M6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+Cj4gQ2M6
IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Cj4gQ2M6IEdlb3JnZSBE
dW5sYXAgPEdlb3JnZS5EdW5sYXBAZXUuY2l0cml4LmNvbT4KPiBDYzogSWFuIEphY2tzb24gPGlh
bi5qYWNrc29uQGV1LmNpdHJpeC5jb20+Cj4gQ2M6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNl
LmNvbT4KPiBDYzogS29ucmFkIFJ6ZXN6dXRlayBXaWxrIDxrb25yYWQud2lsa0BvcmFjbGUuY29t
Pgo+IENjOiBUaW0gRGVlZ2FuIDx0aW1AeGVuLm9yZz4KPiBDYzogV2VpIExpdSA8d2VpLmxpdTJA
Y2l0cml4LmNvbT4KPiAtLS0KPiAgeGVuL2FyY2gveDg2L21tLmMgICAgfCA0MiArKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKPiAgeGVuL2luY2x1ZGUveGVuL21tLmgg
fCAgMyArKysKPiAgMiBmaWxlcyBjaGFuZ2VkLCA0NSBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAt
LWdpdCBhL3hlbi9hcmNoL3g4Ni9tbS5jIGIveGVuL2FyY2gveDg2L21tLmMKPiBpbmRleCA4YWM0
NDEyNTU0Li5mY2Y0YmIwYWZjIDEwMDY0NAo+IC0tLSBhL3hlbi9hcmNoL3g4Ni9tbS5jCj4gKysr
IGIveGVuL2FyY2gveDg2L21tLmMKPiBAQCAtNDMwLDYgKzQzMCw0OCBAQCBpbnQgcGFnZV9pc19y
YW1fdHlwZSh1bnNpZ25lZCBsb25nIG1mbiwgdW5zaWduZWQgbG9uZyBtZW1fdHlwZSkKPiAgICAg
IHJldHVybiAwOwo+ICB9Cj4gIAo+ICt1bnNpZ25lZCBpbnQgcGFnZV9nZXRfcmFtX3R5cGUodW5z
aWduZWQgbG9uZyBtZm4pCgpJdCB3b3VsZCBiZSBiZXR0ZXIgaWYgeW91IGNhbiB1c2UgdHlwZS1z
YWZlIG1mbl90IGhlcmUuCgoKPiArewo+ICsgICAgdWludDY0X3QgbGFzdCA9IDAsIG1hZGRyID0g
cGZuX3RvX3BhZGRyKG1mbik7CgpBbmQgdGhlbgoKICAgIG1hZGRyID0gbWZuX3RvX21hZGRyKG1m
bik7CgpUaGUgcmVzdCBsb29rcyBnb29kIHRvIG1lLgoKV2VpLgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
