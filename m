From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] fix uninitialized variable error in
 do_poll()
Date: Fri, 05 Oct 2018 05:56:52 -0600
Message-ID: <5BB7518402000078001EED34@prv1-mh.provo.novell.com>
References: <5BB738FA02000078001EEB89@prv1-mh.provo.novell.com>
 <20181005102855.vldsq4kolbs2diuy@zion.uk.xensource.com>
 <5BB7497502000078001EEC9A@prv1-mh.provo.novell.com>
 <20181005112508.4xueqrjv7bysjnpi@zion.uk.xensource.com>
 <4d37e20b-4465-4138-0712-df0de2fa57e7@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=vier=mr=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1g8Oj2-0000y7-Es
 for xen-devel@lists.xenproject.org; Fri, 05 Oct 2018 11:56:56 +0000
In-Reply-To: <4d37e20b-4465-4138-0712-df0de2fa57e7@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA1LjEwLjE4IGF0IDEzOjQzLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMDUvMTAvMTggMTI6MjUsIFdlaSBMaXUgd3JvdGU6Cj4+IE9uIEZyaSwgT2N0IDA1
LCAyMDE4IGF0IDA1OjIyOjI5QU0gLTA2MDAsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+Pj4gT24g
MDUuMTAuMTggYXQgMTI6MjgsIDx3ZWkubGl1MkBjaXRyaXguY29tPiB3cm90ZToKPj4+PiBPbiBG
cmksIE9jdCAwNSwgMjAxOCBhdCAwNDoxMjoxMEFNIC0wNjAwLCBKYW4gQmV1bGljaCB3cm90ZToK
Pj4+Pj4gTm93IHRoYXQgQ09ORklHX0hWTSBjYW4gKGFuZCBzaG91bGQpIGJlIHR1cm5lZCBvZmYg
Zm9yIHRoZSBzaGltLCBnY2MgOC4yCj4+Pj4+IGFwcGFyZW50bHkgaXMgbm8gbG9uZ2VyIHN1cmUg
dGhhdCAicG9ydCIgaXMgaW5kZWVkIGluaXRpYWxpemVkIGF0Cj4+Pj4+Cj4+Pj4+ICAgICBpZiAo
IHNjaGVkX3BvbGwtPm5yX3BvcnRzID09IDEgKQo+Pj4+PiAgICAgICAgIHYtPnBvbGxfZXZ0Y2hu
ID0gcG9ydDsKPj4+Pj4KPj4+Pj4gSXQgZG9lc24ndCBsb29rIHRvIGJlIGltcG9zc2libGUgZm9y
IHRoZSBjb21waWxlciB0byBwcm92ZSBpdCBpcyBub3QsCj4+Pj4+IGJ1dCB3ZSBhbHNvIGNhbid0
IHJlbHkgb24gdGhhdCB0byBiZSB0aGUgY2FzZS4gQWRkIGFuIGluaXRpYWxpemVyLgo+Pj4+Pgo+
Pj4+PiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4+Pj4g
VEJIIEkgZmFpbCB0byBzZWUgaG93IENPTkZJR19IVk0gd291bGQgYWZmZWN0IGRvX3BvbGwuIEFs
c28gdGhlcmUgaXMKPj4+PiBhbHJlYWR5IGJ1aWxkIHRlc3Qgd2l0aCBnY2MgOC4yIHdoaWNoIG5l
dmVyIGRpc2NvdmVyZWQgdGhlIGlzc3VlIHlvdQo+Pj4+IGRlc2NyaWJlZC4KPj4+IEkgY2FuJ3Qg
ZXhwbGFpbiB0aGUgc3VkZGVuIGRpYWdub3N0aWMgdG9vICh3aXRob3V0IHRha2luZyBhcGFydCB3
aGF0Cj4+PiBleGFjdGx5IHRoZSBjb21waWxlciBkb2VzKSwgYnV0IHRoZSBzYW1lIGNvbmZpZyAo
anVzdCB3aXRoIEhWTT15KQo+Pj4gYnVpbHQgZmluZSBiZWZvcmUuIFdpdGhvdXQgYW55IGZ1cnRo
ZXIgaW5zaWdodCAod2hpY2ggSSBkb24ndCB0aGluayBpcwo+Pj4gd29ydGggdGhlIHRpbWUpIEkg
ZG9uJ3Qgc2VlIGhvdyBJIGNvdWxkIGltcHJvdmUgdGhlIGRlc2NyaXB0aW9uLgo+PiBPaCB3ZWxs
Lgo+Pgo+PiBBY2tlZC1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KPiAKPiBUQkgs
IEknbSBub3Qgc3VyZSB0aGF0IHJlbHlpbmcgb24gRENFIGlzIGEgZ29vZCBsb25ndGVybSBvcHRp
b24uCgpXZWxsLCB3ZSdsbCBoYXZlIHRvbyBzZWUgaG93IHdlbGwgaXQgZmFyZXMuIElmIHdlIGdl
dCBpbnRvIGluY3JlYXNpbmcKdHJvdWJsZSwgd2UgbWF5IGluZGVlZCB3YW50IHRvIC4uLgoKPiBJ
dCB3aWxsIGFsbW9zdCBjZXJ0YWlubHkgYnJlYWsgdGhlIGJ1aWxkIGF0IC1PMCwKCi4uLiBhbGxv
dyBmb3IgdGhpcy4KCj4gYW5kIG91ciBjb2RlIHJlYWxseSBzaG91bGQgYnVpbGQgYXQgYWxsIG9w
dGltaXNhdGlvbiBsZXZlbHMuCgpJJ2Qgc2F5IGl0IGlzIHVzIHRvIGVzdGFibGlzaCBob3cgbXVj
aCBvcHRpbWl6YXRpb24gd2Ugd2FudCB0bwpzdXBwb3J0IGJlaW5nIGVuYWJsZWQuCgpKYW4KCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
