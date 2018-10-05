From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] fix uninitialized variable error in
 do_poll()
Date: Fri, 5 Oct 2018 12:43:13 +0100
Message-ID: <4d37e20b-4465-4138-0712-df0de2fa57e7@citrix.com>
References: <5BB738FA02000078001EEB89@prv1-mh.provo.novell.com>
 <20181005102855.vldsq4kolbs2diuy@zion.uk.xensource.com>
 <5BB7497502000078001EEC9A@prv1-mh.provo.novell.com>
 <20181005112508.4xueqrjv7bysjnpi@zion.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=wiz4=mr=citrix.com=prvs=8095139d5=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1g8OVo-0008Q8-JH
 for xen-devel@lists.xenproject.org; Fri, 05 Oct 2018 11:43:16 +0000
In-Reply-To: <20181005112508.4xueqrjv7bysjnpi@zion.uk.xensource.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>, Jan Beulich <JBeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMDUvMTAvMTggMTI6MjUsIFdlaSBMaXUgd3JvdGU6Cj4gT24gRnJpLCBPY3QgMDUsIDIwMTgg
YXQgMDU6MjI6MjlBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+IE9uIDA1LjEwLjE4
IGF0IDEyOjI4LCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4+PiBPbiBGcmksIE9jdCAw
NSwgMjAxOCBhdCAwNDoxMjoxMEFNIC0wNjAwLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+PiBOb3cg
dGhhdCBDT05GSUdfSFZNIGNhbiAoYW5kIHNob3VsZCkgYmUgdHVybmVkIG9mZiBmb3IgdGhlIHNo
aW0sIGdjYyA4LjIKPj4+PiBhcHBhcmVudGx5IGlzIG5vIGxvbmdlciBzdXJlIHRoYXQgInBvcnQi
IGlzIGluZGVlZCBpbml0aWFsaXplZCBhdAo+Pj4+Cj4+Pj4gICAgIGlmICggc2NoZWRfcG9sbC0+
bnJfcG9ydHMgPT0gMSApCj4+Pj4gICAgICAgICB2LT5wb2xsX2V2dGNobiA9IHBvcnQ7Cj4+Pj4K
Pj4+PiBJdCBkb2Vzbid0IGxvb2sgdG8gYmUgaW1wb3NzaWJsZSBmb3IgdGhlIGNvbXBpbGVyIHRv
IHByb3ZlIGl0IGlzIG5vdCwKPj4+PiBidXQgd2UgYWxzbyBjYW4ndCByZWx5IG9uIHRoYXQgdG8g
YmUgdGhlIGNhc2UuIEFkZCBhbiBpbml0aWFsaXplci4KPj4+Pgo+Pj4+IFNpZ25lZC1vZmYtYnk6
IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPj4+IFRCSCBJIGZhaWwgdG8gc2VlIGhv
dyBDT05GSUdfSFZNIHdvdWxkIGFmZmVjdCBkb19wb2xsLiBBbHNvIHRoZXJlIGlzCj4+PiBhbHJl
YWR5IGJ1aWxkIHRlc3Qgd2l0aCBnY2MgOC4yIHdoaWNoIG5ldmVyIGRpc2NvdmVyZWQgdGhlIGlz
c3VlIHlvdQo+Pj4gZGVzY3JpYmVkLgo+PiBJIGNhbid0IGV4cGxhaW4gdGhlIHN1ZGRlbiBkaWFn
bm9zdGljIHRvbyAod2l0aG91dCB0YWtpbmcgYXBhcnQgd2hhdAo+PiBleGFjdGx5IHRoZSBjb21w
aWxlciBkb2VzKSwgYnV0IHRoZSBzYW1lIGNvbmZpZyAoanVzdCB3aXRoIEhWTT15KQo+PiBidWls
dCBmaW5lIGJlZm9yZS4gV2l0aG91dCBhbnkgZnVydGhlciBpbnNpZ2h0ICh3aGljaCBJIGRvbid0
IHRoaW5rIGlzCj4+IHdvcnRoIHRoZSB0aW1lKSBJIGRvbid0IHNlZSBob3cgSSBjb3VsZCBpbXBy
b3ZlIHRoZSBkZXNjcmlwdGlvbi4KPiBPaCB3ZWxsLgo+Cj4gQWNrZWQtYnk6IFdlaSBMaXUgPHdl
aS5saXUyQGNpdHJpeC5jb20+CgpUQkgsIEknbSBub3Qgc3VyZSB0aGF0IHJlbHlpbmcgb24gRENF
IGlzIGEgZ29vZCBsb25ndGVybSBvcHRpb24uwqAgSXQKd2lsbCBhbG1vc3QgY2VydGFpbmx5IGJy
ZWFrIHRoZSBidWlsZCBhdCAtTzAsIGFuZCBvdXIgY29kZSByZWFsbHkgc2hvdWxkCmJ1aWxkIGF0
IGFsbCBvcHRpbWlzYXRpb24gbGV2ZWxzLsKgIChUaGVyZSBpcyBzdGlsbCBhIGZhaXIgY2h1bmsg
b2Ygd29yawp0byBtYWtlIC1PMyB3b3JrLCB3aGljaCBJIGhhdmVuJ3QgZ290IHRpbWUgZm9yIGF0
bSkuCgp+QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
