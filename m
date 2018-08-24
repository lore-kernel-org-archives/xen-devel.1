From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH v7 4/6] mm: introduce a helper to get the
 memory type of a page
Date: Fri, 24 Aug 2018 12:49:52 +0200
Message-ID: <20180824104952.oha3evvl7vudh4t7@mac>
References: <20180822075200.50278-1-roger.pau@citrix.com>
 <20180822075200.50278-5-roger.pau@citrix.com>
 <20180822094534.omqbffzr5r3k6v5f@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=npre=lh=citrix.com=prvs=76755a058=roger.pau@srs-us1.protection.inumbo.net>)
 id 1ft9fE-0001t7-2k
 for xen-devel@lists.xenproject.org; Fri, 24 Aug 2018 10:50:00 +0000
Content-Disposition: inline
In-Reply-To: <20180822094534.omqbffzr5r3k6v5f@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBBdWcgMjIsIDIwMTggYXQgMTA6NDU6MzRBTSArMDEwMCwgV2VpIExpdSB3cm90ZToK
PiBPbiBXZWQsIEF1ZyAyMiwgMjAxOCBhdCAwOTo1MTo1OEFNICswMjAwLCBSb2dlciBQYXUgTW9u
bmUgd3JvdGU6Cj4gPiBSZXR1cm5zIGFsbCB0aGUgbWVtb3J5IHR5cGVzIGFwcGxpY2FibGUgdG8g
YSBwYWdlLgo+ID4gCj4gPiBUaGlzIGZ1bmN0aW9uIGlzIHVuaW1wbGVtZW50ZWQgZm9yIEFSTS4K
PiA+IAo+ID4gU2lnbmVkLW9mZi1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJp
eC5jb20+Cj4gPiBSZXZpZXdlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+
ID4gLS0tCj4gPiBDaGFuZ2VzIHNpbmNlIHY1Ogo+ID4gIC0gUmV0dXJuIGFsbCB0eXBlcyB0aGF0
IGFwcGx5IHRvIGEgcGFnZSwgc2luY2UgdGhlIHR5cGVzIHRoZW1zZWx2ZXMKPiA+ICAgIGFyZSBm
bGFncyB0aGF0IGNhbiBiZSBvcidlZCB0b2dldGhlci4KPiA+IC0tLQo+ID4gQ2M6IFN0ZWZhbm8g
U3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4KPiA+IENjOiBKdWxpZW4gR3JhbGwg
PGp1bGllbi5ncmFsbEBhcm0uY29tPgo+ID4gQ2M6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29w
ZXIzQGNpdHJpeC5jb20+Cj4gPiBDYzogR2VvcmdlIER1bmxhcCA8R2VvcmdlLkR1bmxhcEBldS5j
aXRyaXguY29tPgo+ID4gQ2M6IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29t
Pgo+ID4gQ2M6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPiA+IENjOiBLb25yYWQg
Unplc3p1dGVrIFdpbGsgPGtvbnJhZC53aWxrQG9yYWNsZS5jb20+Cj4gPiBDYzogVGltIERlZWdh
biA8dGltQHhlbi5vcmc+Cj4gPiBDYzogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KPiA+
IC0tLQo+ID4gIHhlbi9hcmNoL3g4Ni9tbS5jICAgIHwgNDIgKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrCj4gPiAgeGVuL2luY2x1ZGUveGVuL21tLmggfCAgMyArKysK
PiA+ICAyIGZpbGVzIGNoYW5nZWQsIDQ1IGluc2VydGlvbnMoKykKPiA+IAo+ID4gZGlmZiAtLWdp
dCBhL3hlbi9hcmNoL3g4Ni9tbS5jIGIveGVuL2FyY2gveDg2L21tLmMKPiA+IGluZGV4IDhhYzQ0
MTI1NTQuLmZjZjRiYjBhZmMgMTAwNjQ0Cj4gPiAtLS0gYS94ZW4vYXJjaC94ODYvbW0uYwo+ID4g
KysrIGIveGVuL2FyY2gveDg2L21tLmMKPiA+IEBAIC00MzAsNiArNDMwLDQ4IEBAIGludCBwYWdl
X2lzX3JhbV90eXBlKHVuc2lnbmVkIGxvbmcgbWZuLCB1bnNpZ25lZCBsb25nIG1lbV90eXBlKQo+
ID4gICAgICByZXR1cm4gMDsKPiA+ICB9Cj4gPiAgCj4gPiArdW5zaWduZWQgaW50IHBhZ2VfZ2V0
X3JhbV90eXBlKHVuc2lnbmVkIGxvbmcgbWZuKQo+IAo+IEl0IHdvdWxkIGJlIGJldHRlciBpZiB5
b3UgY2FuIHVzZSB0eXBlLXNhZmUgbWZuX3QgaGVyZS4KPiAKPiAKPiA+ICt7Cj4gPiArICAgIHVp
bnQ2NF90IGxhc3QgPSAwLCBtYWRkciA9IHBmbl90b19wYWRkcihtZm4pOwo+IAo+IEFuZCB0aGVu
Cj4gCj4gICAgIG1hZGRyID0gbWZuX3RvX21hZGRyKG1mbik7Cj4gCj4gVGhlIHJlc3QgbG9va3Mg
Z29vZCB0byBtZS4KCk9LLCBJIGhhdmVuJ3QgZG9uZSBpdCBiZWZvcmUgYmVjYXVzZSB0aGUgb25s
eSBjYWxsZXIgYWxyZWFkeSB1c2VzCnVuc2lnbmVkIGxvbmcgdG8gZGVhbCB3aXRoIG1mbnMsIGFu
ZCB0aGUgZnVuY3Rpb24gaXRzZWxmIHdpbGwgYWxzbwplbmQgdXAgdHJhbnNsYXRpbmcgdGhlIG1m
biBpbnRvIHVuc2lnbmVkIGxvbmcsIHNvIGl0IHNlZW1lZCB0byBtZQpxdWl0ZSBwb2ludGxlc3Mg
dG8gYWRkIHRoaXMgZXh0cmEgdHJhbnNsYXRpb24gdGhhdCBkb2Vzbid0IHNlZW0gdG8KYmVuZWZp
dCBlaXRoZXIgdGhlIGNhbGxlciBvciB0aGUgZnVuY3Rpb24gaXRzZWxmLCBidXQgd2lsbCBjaGFu
Z2UgaXQKbm93LgoKVGhhbmtzLCBSb2dlci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
