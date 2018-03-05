From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v4 08/16] xen/mm: Drop the parameter mfn
 from populate_pt_range
Date: Mon, 05 Mar 2018 07:38:36 -0700
Message-ID: <5A9D647C02000078001AE959@prv-mh.provo.novell.com>
References: <20180221140259.29360-1-julien.grall@arm.com>
 <20180221140259.29360-9-julien.grall@arm.com>
 <20180222163505.enzgrp4alo7pibeh@citrix.com>
 <445bc932-044d-eacf-a487-0410e8fdb22d@arm.com>
 <20180222165124.zaufci7dew2dp23n@citrix.com>
 <f3384413-021b-e12e-b602-c3e5fd619282@arm.com>
 <5A9973D402000078001ADDA8@prv-mh.provo.novell.com>
 <ca1b2cfa-67b5-f6d7-038b-d95305189176@arm.com>
 <5A9D5B8F02000078001AE8DF@prv-mh.provo.novell.com>
 <403b56c9-f337-9330-3f6a-5e5f4a69a238@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <403b56c9-f337-9330-3f6a-5e5f4a69a238@arm.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA1LjAzLjE4IGF0IDE1OjExLCA8anVsaWVuLmdyYWxsQGFybS5jb20+IHdyb3RlOgo+
IE9uIDA1LzAzLzE4IDE0OjAwLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+Pj4gT24gMDUuMDMuMTgg
YXQgMTQ6NDMsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4gd3JvdGU6Cj4+PiBBbnl3YXksIEkgZG9u
J3QgaGF2ZSBtdWNoIGtub3dsZWRnZSBvbiB0aGUgeDg2IHRvIG1ha2UgdGhlIG1vZGlmaWNhdGlv
bgo+Pj4gdGhhdCB5b3Ugc3VnZ2VzdGVkLiBTbyBJIGFtIGdvaW5nIHRvIHJldmVydCB0byBfbWZu
KDApIGZvciB4ODYuCj4+IAo+PiBJJ2QgcHJlZmVyIGlmIHlvdSBkaWRuJ3QsIGJ1dCB3ZWxsLCBp
dCdsbCBiZSBvbmUgb2YgdXMgdG8gY2xlYW4gaXQgdXAKPj4gdGhlbi4KPiBJIGNhbiBrZWVwIGFz
IElOVkFMSURfTUZOLiBCdXQgdGhlbiBlaXRoZXIgeW91IG9yIEFuZHJldyAob3IgYW55b25lIHg4
NiAKPiBmb2xrcykgd291bGQgaGF2ZSB0byBwcm92aWRlIHRoZSBwYXRjaCB0byBza2lwIGluY3Jl
bWVudGluZyBpbnZhbGlkIE1GTiAKPiAoaWYgSSB1bmRlcnN0b29kIGNvcnJlY3RseSB5b3VyIHJl
cXVlc3QpLgoKU2lnaCAtIHRoaXMgc2hvdWxkIGdvIHRvZ2V0aGVyIGltby4gV2hpbGUgd3Jvbmds
eSBpbmNyZW1lbnRpbmcgZnJvbQp6ZXJvIHdhcyBiYWQsIHdyb25nbHkgd3JhcHBpbmcgZnJvbSBJ
TlZBTElEX01GTiBtYWtlcyB0aGluZ3MKd29yc2UuCgpKYW4KCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
