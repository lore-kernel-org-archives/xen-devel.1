From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH v4 08/16] xen/mm: Drop the parameter mfn
 from populate_pt_range
Date: Wed, 14 Mar 2018 15:22:29 +0000
Message-ID: <c9bc3af8-da93-dede-b66f-576dd0b0375c@arm.com>
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
 <5AA61FE90200007800129BAE@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <5AA61FE90200007800129BAE@prv-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <jbeulich@suse.com>, wei.liu2@citrix.com
Cc: sstabellini@kernel.org, George.Dunlap@eu.citrix.com, andrew.cooper3@citrix.com, tim@xen.org, xen-devel@lists.xen.org, ian.jackson@eu.citrix.com
List-Id: xen-devel@lists.xenproject.org

SGkgSmFuLAoKT24gMDMvMTIvMjAxOCAwNjozNiBBTSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4g
V2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4gMDMvMDkvMTggNjozMCBQTSA+Pj4KPj4gT24g
TW9uLCBNYXIgMDUsIDIwMTggYXQgMDc6Mzg6MzZBTSAtMDcwMCwgSmFuIEJldWxpY2ggd3JvdGU6
Cj4+Pj4+PiBPbiAwNS4wMy4xOCBhdCAxNToxMSwgPGp1bGllbi5ncmFsbEBhcm0uY29tPiB3cm90
ZToKPj4+PiBPbiAwNS8wMy8xOCAxNDowMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+Pj4+IE9u
IDA1LjAzLjE4IGF0IDE0OjQzLCA8anVsaWVuLmdyYWxsQGFybS5jb20+IHdyb3RlOgo+Pj4+Pj4g
QW55d2F5LCBJIGRvbid0IGhhdmUgbXVjaCBrbm93bGVkZ2Ugb24gdGhlIHg4NiB0byBtYWtlIHRo
ZSBtb2RpZmljYXRpb24KPj4+Pj4+IHRoYXQgeW91IHN1Z2dlc3RlZC4gU28gSSBhbSBnb2luZyB0
byByZXZlcnQgdG8gX21mbigwKSBmb3IgeDg2Lgo+Pj4+Pgo+Pj4+PiBJJ2QgcHJlZmVyIGlmIHlv
dSBkaWRuJ3QsIGJ1dCB3ZWxsLCBpdCdsbCBiZSBvbmUgb2YgdXMgdG8gY2xlYW4gaXQgdXAKPj4+
Pj4gdGhlbi4KPj4+PiBJIGNhbiBrZWVwIGFzIElOVkFMSURfTUZOLiBCdXQgdGhlbiBlaXRoZXIg
eW91IG9yIEFuZHJldyAob3IgYW55b25lIHg4Ngo+Pj4+IGZvbGtzKSB3b3VsZCBoYXZlIHRvIHBy
b3ZpZGUgdGhlIHBhdGNoIHRvIHNraXAgaW5jcmVtZW50aW5nIGludmFsaWQgTUZOCj4+Pj4gKGlm
IEkgdW5kZXJzdG9vZCBjb3JyZWN0bHkgeW91ciByZXF1ZXN0KS4KPj4+Cj4+PiBTaWdoIC0gdGhp
cyBzaG91bGQgZ28gdG9nZXRoZXIgaW1vLiBXaGlsZSB3cm9uZ2x5IGluY3JlbWVudGluZyBmcm9t
Cj4+PiB6ZXJvIHdhcyBiYWQsIHdyb25nbHkgd3JhcHBpbmcgZnJvbSBJTlZBTElEX01GTiBtYWtl
cyB0aGluZ3MKPj4+IHdvcnNlLgo+Pgo+PiBUcnkgdGhpcyBwYXRjaD8KPiAKPiBMb29rcyBmaW5l
OyBKdWxpZW4sIGRvIHlvdSB3YW50IHRvIGZvbGQgdGhpcyBpbj8KClJhdGhlciB0aGFuIGZvbGRp
bmcgdGhpcyBpbiwgIEkgYW0gcGxhbm5pbmcgdG8gYWRkIHRoaXMgcGF0Y2ggYXQgdGhlIApiZWdp
bm5pbmcgb2YgdGhlIHNlcmllcy4KCkNoZWVycywKCj4gCj4gSmFuCj4gCgotLSAKSnVsaWVuIEdy
YWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
