From: "Jan Beulich" <jbeulich@suse.com>
Subject: Re: [PATCH v4 08/16] xen/mm: Drop the parameter mfn
 from populate_pt_range
Date: Mon, 12 Mar 2018 00:36:25 -0600
Message-ID: <5AA61FE90200007800129BAE@prv-mh.provo.novell.com>
References: <20180221140259.29360-9-julien.grall@arm.com>
 <20180222163505.enzgrp4alo7pibeh@citrix.com>
 <445bc932-044d-eacf-a487-0410e8fdb22d@arm.com>
 <20180222165124.zaufci7dew2dp23n@citrix.com>
 <f3384413-021b-e12e-b602-c3e5fd619282@arm.com>
 <5A9973D402000078001ADDA8@prv-mh.provo.novell.com>
 <ca1b2cfa-67b5-f6d7-038b-d95305189176@arm.com>
 <5A9D5B8F02000078001AE8DF@prv-mh.provo.novell.com>
 <403b56c9-f337-9330-3f6a-5e5f4a69a238@arm.com>
 <5A9D647C02000078001AE959@prv-mh.provo.novell.com>
 <20180309172957.lbzthnrhc4wz4t4s@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20180309172957.lbzthnrhc4wz4t4s@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: julien.grall@arm.com, wei.liu2@citrix.com
Cc: sstabellini@kernel.org, George.Dunlap@eu.citrix.com, andrew.cooper3@citrix.com, tim@xen.org, xen-devel@lists.xen.org, ian.jackson@eu.citrix.com
List-Id: xen-devel@lists.xenproject.org

Pj4+IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+IDAzLzA5LzE4IDY6MzAgUE0gPj4+Cj5P
biBNb24sIE1hciAwNSwgMjAxOCBhdCAwNzozODozNkFNIC0wNzAwLCBKYW4gQmV1bGljaCB3cm90
ZToKPj4gPj4+IE9uIDA1LjAzLjE4IGF0IDE1OjExLCA8anVsaWVuLmdyYWxsQGFybS5jb20+IHdy
b3RlOgo+PiA+IE9uIDA1LzAzLzE4IDE0OjAwLCBKYW4gQmV1bGljaCB3cm90ZToKPj4gPj4+Pj4g
T24gMDUuMDMuMTggYXQgMTQ6NDMsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4gd3JvdGU6Cj4+ID4+
PiBBbnl3YXksIEkgZG9uJ3QgaGF2ZSBtdWNoIGtub3dsZWRnZSBvbiB0aGUgeDg2IHRvIG1ha2Ug
dGhlIG1vZGlmaWNhdGlvbgo+PiA+Pj4gdGhhdCB5b3Ugc3VnZ2VzdGVkLiBTbyBJIGFtIGdvaW5n
IHRvIHJldmVydCB0byBfbWZuKDApIGZvciB4ODYuCj4+ID4+IAo+PiA+PiBJJ2QgcHJlZmVyIGlm
IHlvdSBkaWRuJ3QsIGJ1dCB3ZWxsLCBpdCdsbCBiZSBvbmUgb2YgdXMgdG8gY2xlYW4gaXQgdXAK
Pj4gPj4gdGhlbi4KPj4gPiBJIGNhbiBrZWVwIGFzIElOVkFMSURfTUZOLiBCdXQgdGhlbiBlaXRo
ZXIgeW91IG9yIEFuZHJldyAob3IgYW55b25lIHg4NiAKPj4gPiBmb2xrcykgd291bGQgaGF2ZSB0
byBwcm92aWRlIHRoZSBwYXRjaCB0byBza2lwIGluY3JlbWVudGluZyBpbnZhbGlkIE1GTiAKPj4g
PiAoaWYgSSB1bmRlcnN0b29kIGNvcnJlY3RseSB5b3VyIHJlcXVlc3QpLgo+PiAKPj4gU2lnaCAt
IHRoaXMgc2hvdWxkIGdvIHRvZ2V0aGVyIGltby4gV2hpbGUgd3JvbmdseSBpbmNyZW1lbnRpbmcg
ZnJvbQo+PiB6ZXJvIHdhcyBiYWQsIHdyb25nbHkgd3JhcHBpbmcgZnJvbSBJTlZBTElEX01GTiBt
YWtlcyB0aGluZ3MKPj4gd29yc2UuCj4KPlRyeSB0aGlzIHBhdGNoPwoKTG9va3MgZmluZTsgSnVs
aWVuLCBkbyB5b3Ugd2FudCB0byBmb2xkIHRoaXMgaW4/CgpKYW4KCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
