From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v3 14/16] x86: expose CONFIG_HVM
Date: Fri, 14 Sep 2018 11:36:12 +0100
Message-ID: <20180914103612.zfuueqmryjiawlgp@zion.uk.xensource.com>
References: <20180904161533.11575-1-wei.liu2@citrix.com>
 <20180904161533.11575-15-wei.liu2@citrix.com>
 <5B92257902000078001E629F@prv1-mh.provo.novell.com>
 <20180913160118.yyffhgco5eg7m3jw@zion.uk.xensource.com>
 <5B9B6C4E02000078001E8820@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=bn9z=l4=citrix.com=prvs=7887e1b83=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1g0lSX-0001cv-Fn
 for xen-devel@lists.xenproject.org; Fri, 14 Sep 2018 10:36:21 +0000
Content-Disposition: inline
In-Reply-To: <5B9B6C4E02000078001E8820@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBTZXAgMTQsIDIwMTggYXQgMDI6MDc6NDJBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDEzLjA5LjE4IGF0IDE4OjAxLCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gPiBPbiBGcmksIFNlcCAwNywgMjAxOCBhdCAwMToxNTowNUFNIC0wNjAwLCBKYW4gQmV1
bGljaCB3cm90ZToKPiA+PiA+Pj4gT24gMDQuMDkuMTggYXQgMTg6MTUsIDx3ZWkubGl1MkBjaXRy
aXguY29tPiB3cm90ZToKPiA+PiA+IFNpZ25lZC1vZmYtYnk6IFdlaSBMaXUgPHdlaS5saXUyQGNp
dHJpeC5jb20+Cj4gPj4gPiAtLS0KPiA+PiA+IHYzOiBsb25nZXIgdGV4dAo+ID4+ID4gdjI6IHVz
ZSB0YWIgdG8gaW5kZW50Cj4gPj4gPiAKPiA+PiA+IEhhdmVuJ3QgYWRkZWQgYSBkZXBlbmRlbmN5
IG9uIFBWX1NISU1fRVhDTFVTSVZFIGJlY2F1c2UgYWdyZWVtZW50IGlzCj4gPj4gPiBub3QgeWV0
IHJlYWNoZWQuCj4gPj4gCj4gPj4gSG1tLCBidXQgdGhlbiBJIHdvdWxkIGhhdmUgZXhwZWN0ZWQg
eW91IHRvIGF0IGxlYXN0IGRvIHRoZSBtaW5pbWFsCj4gPj4gYWdyZWVkIHVwb24gY2hhbmdlICht
b2RpZnlpbmcgdGhhdCBvdGhlciBvcHRpb24ncyBkZWZhdWx0KS4gQmV5b25kCj4gPj4gdGhhdCBJ
J20gYWZyYWlkIHdlJ3JlIG1vdmluZyB0b3dhcmRzIGEgZGVhZCBlbmQgaGVyZS4KPiA+PiAKPiA+
IAo+ID4gSSBleHRlbmRlZCB0aGUgaGVscCB0ZXh0IHRvIGFkZHJlc3MgQW5kcmV3J3MgY29tbWVu
dC4gT3RoZXIgdGhhbiB0aGF0LCBJCj4gPiBkaWRuJ3Qgc2VlIGFuIGFncmVlbWVudCBvbiAib3Ro
ZXIgb3B0aW9uJ3MgZGVmYXVsdCIuIFdoYXQgZGlkIEkgbWlzcz8KPiAKPiBJIGRvbid0IHRoaW5r
IHRoZXJlIHdhcyBkaXNhZ3JlZW1lbnQgb24gdGhpcyBtaW5pbWFsIGNoYW5nZSAoaW4gZmFjdAo+
IGlpcmMgQW5kcmV3IGV4cGxpY2l0bHkgYWdyZWVkIHRvIGl0IFsxXSkuIFdoYXQgd2UgY2FuJ3Qg
c2VlbSB0byBhZ3JlZQo+IG9uIGlzIHdoZXRoZXIgdG8gYWRkIGEgImRlcGVuZHMgb24gIVBWX1NI
SU1fRVhDTFVTSVZFIiB0byBIVk0uCj4gCj4gSmFuCj4gCj4gWzFdIGh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvYXJjaGl2ZXMvaHRtbC94ZW4tZGV2ZWwvMjAxOC0wOC9tc2cwMjQwOC5odG1s
Cj4gCgpPaCwgdGhlbiB0aGF0J3MgbW9yZSBvciBsZXNzIHdoYXQgSSBzYWlkIGluIHY0IHBhdGNo
LiBJIHByb3Bvc2VkCgogICBkZWZfYm9vbCB5IGlmICFQVl9TSElNX0VYQ0xVU0lWRQoKaW4gdGhl
IHRoYXQgcGF0Y2ggYXMgYSBjb21wcm9taXNlLgoKV2VpLgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
