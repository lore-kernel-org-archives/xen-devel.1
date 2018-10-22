From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH] x86: Consolidate the storage of
 MSR_AMD64_DR{0-3}_ADDRESS_MASK
Date: Mon, 22 Oct 2018 11:58:59 +0100
Message-ID: <20181022105859.utlqwg6p6xlg2yp4@zion.uk.xensource.com>
References: <1539962062-9406-1-git-send-email-andrew.cooper3@citrix.com>
 <f864baa1-c151-4437-ebf4-c0ada29b147b@oracle.com>
 <20181022105317.nlvizgox4wcmschg@zion.uk.xensource.com>
 <c1d2445c-928f-5b67-8b17-77099eaefc15@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Content-Disposition: inline
In-Reply-To: <c1d2445c-928f-5b67-8b17-77099eaefc15@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Wei Liu <wei.liu2@citrix.com>, Jan Beulich <JBeulich@suse.com>, Xen-devel <xen-devel@lists.xen.org>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Brian Woods <brian.woods@amd.com>, Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBPY3QgMjIsIDIwMTggYXQgMTE6NTc6MTdBTSArMDEwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBPbiAyMi8xMC8xOCAxMTo1MywgV2VpIExpdSB3cm90ZToKPiA+IE9uIEZyaSwgT2N0
IDE5LCAyMDE4IGF0IDA2OjUyOjAyUE0gLTA0MDAsIEJvcmlzIE9zdHJvdnNreSB3cm90ZToKPiA+
PiBPbiAxMC8xOS8xOCAxMToxNCBBTSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiA+Pj4gZGlmZiAt
LWdpdCBhL3hlbi9pbmNsdWRlL2FzbS14ODYvbXNyLmggYi94ZW4vaW5jbHVkZS9hc20teDg2L21z
ci5oCj4gPj4+IGluZGV4IDdhMDYxYjIuLmMxY2IzOGYgMTAwNjQ0Cj4gPj4+IC0tLSBhL3hlbi9p
bmNsdWRlL2FzbS14ODYvbXNyLmgKPiA+Pj4gKysrIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9tc3Iu
aAo+ID4+PiBAQCAtMjg3LDYgKzI4NywxMiBAQCBzdHJ1Y3QgdmNwdV9tc3JzCj4gPj4+ICAgICAg
ICAgICAgICBib29sIGNwdWlkX2ZhdWx0aW5nOjE7Cj4gPj4+ICAgICAgICAgIH07Cj4gPj4+ICAg
ICAgfSBtaXNjX2ZlYXR1cmVzX2VuYWJsZXM7Cj4gPj4+ICsKPiA+Pj4gKyAgICAvKgo+ID4+PiAr
ICAgICAqIDB4YzAwMTEwezI3LDE5LTFifSBNU1JfQU1ENjRfRFJ7MC0zfV9BRERSRVNTX01BU0sK
PiA+Pj4gKyAgICAgKiBUT0RPOiBOb3QgeWV0IGhhbmRsZWQgYnkgZ3Vlc3Rfe3JkLHdyfW1zcigp
IGluZnJhc3RydWN0dXJlLgo+ID4+PiArICAgICAqLwo+ID4+PiArICAgIHVpbnQzMl90IGRyX21h
c2tbNF07Cj4gPj4+ICB9Owo+ID4+PiAgCj4gPj4gWW91IGRvbid0IHRoaW5rIHdyYXBwaW5nIHRo
ZXNlIGludG8gYW4gaW50ZWwvYW1kIHVuaW9uIHdvdWxkIGJlIHVzZWZ1bD8KPiA+IFNhbWUgcXVl
c3Rpb24gaGVyZS4gRFIgbWFza3Mgc2VlbSB0byBiZSBBTUQgc3BlY2lmaWMuCj4gCj4gRG9lcyB0
aGUgc3ZtL3Z0LXggaGVyZSBwZXJ0YWluIHRvIHRoZSBob3N0IHByb2Nlc3Nvciwgb3IgdGhlIGd1
ZXN0Cj4gY3Jvc3MtdmVuZG9yIHNldHRpbmc/wqAgKFRoYXQncyBhIHJoZXRvcmljYWwgcXVlc3Rp
b24uwqAgSXRzIGEgY29tcGxldGUKPiBjYW4gb2Ygd29ybXMgd2hpY2ggSSBkb24ndCB3YW50IHRv
IG9wZW4pLgo+IAo+IEZvciB0aGUgc2FrZSBvZiAxNiBieXRlcywgSSBkb24ndCB0aGluayBpdHMg
d29ydGggaXQuwqAgV2UgY2FuIGFsd2F5cwo+IHJldmlzaXQgdGhpcyBpbiB0aGUgZnV0dXJlIGlm
IG5lY2Vzc2FyeS4KClN1cmUuIEZlZWwgZnJlZSB0byBhZGQgbXkgUmIgdG8geW91ciBwYXRjaC4K
CldlaS4KCj4gCj4gfkFuZHJldwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
