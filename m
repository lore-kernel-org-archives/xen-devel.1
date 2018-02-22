From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2] VT-d: use two 32-bit writes to update
 DMAR fault address registers
Date: Thu, 22 Feb 2018 02:50:09 -0700
Message-ID: <5A8EA06102000078001AA492@prv-mh.provo.novell.com>
References: <20171011030345.14408-1-haozhong.zhang@intel.com>
 <59DE1C290200007800184DFD@prv-mh.provo.novell.com>
 <20180222094403.44nivrhg7uwzj2lq@MacBook-Pro-de-Roger.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20180222094403.44nivrhg7uwzj2lq@MacBook-Pro-de-Roger.local>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: =?UTF-8?Q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Kevin Tian <kevin.tian@intel.com>, xen-devel@lists.xen.org, Haozhong Zhang <haozhong.zhang@intel.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIyLjAyLjE4IGF0IDEwOjQ0LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IE9uIFdlZCwgT2N0IDExLCAyMDE3IGF0IDA1OjI3OjA1QU0gLTA2MDAsIEphbiBCZXVsaWNoIHdy
b3RlOgo+PiA+Pj4gT24gMTEuMTAuMTcgYXQgMDU6MDMsIDxoYW96aG9uZy56aGFuZ0BpbnRlbC5j
b20+IHdyb3RlOgo+PiA+IC0tLSBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3Z0ZC9pb21tdS5j
Cj4+ID4gKysrIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvdnRkL2lvbW11LmMKPj4gPiBAQCAt
MTEwNSw3ICsxMTA1LDEzIEBAIHN0YXRpYyB2b2lkIGRtYV9tc2lfc2V0X2FmZmluaXR5KHN0cnVj
dCBpcnFfZGVzYyAKPj4gPiAqZGVzYywgY29uc3QgY3B1bWFza190ICptYXNrKQo+PiA+ICAKPj4g
PiAgICAgIHNwaW5fbG9ja19pcnFzYXZlKCZpb21tdS0+cmVnaXN0ZXJfbG9jaywgZmxhZ3MpOwo+
PiA+ICAgICAgZG1hcl93cml0ZWwoaW9tbXUtPnJlZywgRE1BUl9GRURBVEFfUkVHLCBtc2cuZGF0
YSk7Cj4+ID4gLSAgICBkbWFyX3dyaXRlcShpb21tdS0+cmVnLCBETUFSX0ZFQUREUl9SRUcsIG1z
Zy5hZGRyZXNzKTsKPj4gPiArICAgIGRtYXJfd3JpdGVsKGlvbW11LT5yZWcsIERNQVJfRkVBRERS
X1JFRywgbXNnLmFkZHJlc3NfbG8pOwo+PiA+ICsgICAgLyoKPj4gPiArICAgICAqIFdoZW4geDJB
UElDIGlzIG5vdCBlbmFibGVkLCBETUFSX0ZFVUFERFJfUkVHIGlzIHJlc2VydmVkIGFuZAo+PiA+
ICsgICAgICogaXQncyBub3QgbmVjZXNzYXJ5IHRvIHVwZGF0ZSBpdC4KPj4gPiArICAgICAqLwo+
PiA+ICsgICAgaWYgKHgyYXBpY19lbmFibGVkKQo+PiAKPj4gSSdtIHByZXR0eSBzdXJlIGl0IHdh
cyBwb2ludGVkIG91dCBiZWZvcmUgdGhhdCB0aGUgc3R5bGUgaGVyZSBpcwo+PiB3cm9uZyAobWlz
c2luZyBzcGFjZXMpLiBUaGF0J3MgZWFzeSB0byBmaXggd2hpbGUgY29tbWl0dGluZywgYnV0Cj4+
IGFueXdheS4KPiAKPiBJdCBzZWVtcyBsaWtlIHRoaXMgd2FzIG5vdCBhcHBsaWVkLiBDYW4gc29t
ZW9uZSBmaXggdGhlIHN0eWxlIGFuZAo+IGFwcGx5IGl0PwoKSSB3b3VsZCBoYXZlIGZpeGVkIHRo
ZSBzdHlsZSBpc3N1ZSwgYnV0IEkgaGF2ZSBubyBWVC1kIG1haW50YWluZXIKYWNrIG9uIHJlY29y
ZC4gSXQgaXMgdGhlIHBhdGNoIHN1Ym1pdHRlciB0byBnbyBodW50IGZvciBhY2tzLgoKSmFuCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
