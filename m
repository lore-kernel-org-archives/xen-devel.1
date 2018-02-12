From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Subject: Re: [PATCH v4 07/28] x86/hvm: Introduce a emulated VTD
	for HVM
Date: Mon, 12 Feb 2018 10:35:53 +0000
Message-ID: <20180212103553.g67aiozomigdyz3d@MacBook-Pro-de-Roger.local>
References: <1510899755-40237-1-git-send-email-chao.gao@intel.com>
 <1510899755-40237-8-git-send-email-chao.gao@intel.com>
 <20180209162754.udtnnij4cmcrntft@MacBook-Pro-de-Roger.local>
 <20180209171228.GG30322@skl-4s-chao.sh.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Content-Disposition: inline
In-Reply-To: <20180209171228.GG30322@skl-4s-chao.sh.intel.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xen.org, George Dunlap <george.dunlap@eu.citrix.com>, Kevin Tian <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>, Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Jan Beulich <jbeulich@suse.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Lan Tianyu <tianyu.lan@intel.com>
List-Id: xen-devel@lists.xenproject.org

T24gU2F0LCBGZWIgMTAsIDIwMTggYXQgMDE6MTI6MjhBTSArMDgwMCwgQ2hhbyBHYW8gd3JvdGU6
Cj4gT24gRnJpLCBGZWIgMDksIDIwMTggYXQgMDQ6Mjc6NTRQTSArMDAwMCwgUm9nZXIgUGF1IE1v
bm7DqSB3cm90ZToKPiA+T24gRnJpLCBOb3YgMTcsIDIwMTcgYXQgMDI6MjI6MTRQTSArMDgwMCwg
Q2hhbyBHYW8gd3JvdGU6Cj4gPj4gKyAgICBpZiAoICF2dnRkICkKPiA+PiArICAgICAgICByZXR1
cm4gRU5PTUVNOwo+ID4+ICsKPiA+PiArICAgIHZ2dGRfcmVzZXQodnZ0ZCk7Cj4gPj4gKyAgICB2
dnRkLT5iYXNlX2FkZHIgPSB2aW9tbXUtPmJhc2VfYWRkcmVzczsKPiA+Cj4gPkkgdGhpbmsgaXQg
d291bGQgYmUgZ29vZCB0byBoYXZlIHNvbWUgY2hlY2sgaGVyZSwgc28gdGhhdCB0aGUgdklPTU1V
Cj4gPmlzIG5vdCBmb3IgZXhhbXBsZSBwb3NpdGlvbmVkIG9uIHRvcCBvZiBhIFJBTSByZWdpb24u
IElkZWFsbHkgeW91Cj4gPnNob3VsZCBjaGVjayB0aGF0IHRoZSBnZm5zIFtiYXNlX2FkZHJlc3Ms
IGJhc2VfYWRkcmVzcyArIHNpemUpIGFyZQo+ID51bnBvcHVsYXRlZC4KPiAKPiBZZXMuIEV4Y2Vw
dCBzb21lIGNoZWNrcyBoZXJlLCB0aGlzIHBhZ2Ugc2hvdWxkIGJlIHJlc2VydmVkIGluIGd1ZXN0
IGU4MjAsCj4gd2hpY2ggaW1wbGllcyBzb21lIHdvcmsgaW4gcWVtdSBvciB0b29sIHN0YWNrLgoK
UmlnaHQuLi4gSSBndWVzcyBzaW5jZSB0aGUgdG9vbHN0YWNrIGlzIHRoZSBvbmUgdGhhdCBhY3R1
YWxseQpwb3B1bGF0ZXMgbWVtb3J5ICZjIGl0IHNob3VsZCBiZSB0aGUgb25lIHRvIHBvc2l0aW9u
IHRoZSB2SU9NTVUsIHNvCmp1c3QgbGVhdmUgdGhpcyBhcy1pcyBmb3IgdGhlIHRpbWUgYmVpbmcs
IGxldCdzIHNlZSBvdGhlcidzIHBlb3BsZQpvcGluaW9uLgoKT3V0IG9mIGN1cmlvc2l0eSwgaXMg
dGhlIElPTU1VIG9uIHJlYWwgaGFyZHdhcmUgYWx3YXlzIGF0IHRoZSBzYW1lCm1lbW9yeSBhZGRy
ZXNzPwoKVGhhbmtzLCBSb2dlci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
