From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v3 4/4] libxc: Pass e820 map to PVH guest
 via hvm_start_info
Date: Wed, 21 Mar 2018 16:00:29 +0000
Message-ID: <20180321160028.iyhnwgk4ayhucigr@citrix.com>
References: <1521149589-21200-1-git-send-email-maran.wilson@oracle.com>
 <1521149718-21290-3-git-send-email-maran.wilson@oracle.com>
 <20180316182924.m66vxbe35mbljts4@MacBook-Pro-de-Roger.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Content-Disposition: inline
In-Reply-To: <20180316182924.m66vxbe35mbljts4@MacBook-Pro-de-Roger.local>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Cc: wei.liu2@citrix.com, boris.ostrovsky@oracle.com, xen-devel@lists.xen.org, ian.jackson@eu.citrix.com, Maran Wilson <maran.wilson@oracle.com>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBNYXIgMTYsIDIwMTggYXQgMDY6Mjk6MjRQTSArMDAwMCwgUm9nZXIgUGF1IE1vbm7D
qSB3cm90ZToKPiBPbiBUaHUsIE1hciAxNSwgMjAxOCBhdCAwMjozNToxOFBNIC0wNzAwLCBNYXJh
biBXaWxzb24gd3JvdGU6Cj4gPiBGcm9tOiBCb3JpcyBPc3Ryb3Zza3kgPGJvcmlzLm9zdHJvdnNr
eUBvcmFjbGUuY29tPgo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBCb3JpcyBPc3Ryb3Zza3kgPGJv
cmlzLm9zdHJvdnNreUBvcmFjbGUuY29tPgo+ID4gU2lnbmVkLW9mZi1ieTogTWFyYW4gV2lsc29u
IDxtYXJhbi53aWxzb25Ab3JhY2xlLmNvbT4KPiA+IC0tLQo+ID4gIHRvb2xzL2xpYnhjL3hjX2Rv
bV94ODYuYyB8IDMwICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrLQo+ID4gIDEgZmlsZSBj
aGFuZ2VkLCAyOSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gPiAKPiA+IGRpZmYgLS1n
aXQgYS90b29scy9saWJ4Yy94Y19kb21feDg2LmMgYi90b29scy9saWJ4Yy94Y19kb21feDg2LmMK
PiA+IEBAIC0xNzE4LDYgKzE3MjQsMjcgQEAgc3RhdGljIGludCBib290bGF0ZV9odm0oc3RydWN0
IHhjX2RvbV9pbWFnZSAqZG9tKQo+ID4gIAo+ID4gICAgICAgICAgLyogQUNQSSBtb2R1bGUgMCBp
cyB0aGUgUlNEUCAqLwo+ID4gICAgICAgICAgc3RhcnRfaW5mby0+cnNkcF9wYWRkciA9IGRvbS0+
YWNwaV9tb2R1bGVzWzBdLmd1ZXN0X2FkZHJfb3V0ID8gOiAwOwo+ID4gKwo+ID4gKyAgICAgICAg
LyoKPiA+ICsgICAgICAgICAqIENoZWNrIGEgY291cGxlIG9mIFhFTl9IVk1fTUVNTUFQX1RZUEVz
IHRvIHZlcmlmeSBjb25zaXN0ZW5jeSB3aXRoCj4gPiArICAgICAgICAgKiB0aGVpciBjb3JyZXNw
b25kaW5nIGU4MjAgbnVtZXJpY2FsIHZhbHVlcy4KPiA+ICsgICAgICAgICAqLwo+ID4gKyAgICAg
ICAgQlVJTERfQlVHX09OKFhFTl9IVk1fTUVNTUFQX1RZUEVfUkFNICE9IEU4MjBfUkFNKTsKPiA+
ICsgICAgICAgIEJVSUxEX0JVR19PTihYRU5fSFZNX01FTU1BUF9UWVBFX0FDUEkgIT0gRTgyMF9B
Q1BJKTsKPiAKPiBJIGd1ZXNzIHlvdSBjb3VsZCB0ZXN0IGFsbCB0aGUgdHlwZXMsIGJ1dCBJJ20g
bm90IHN1cmUgaWYgaXQncyB3b3J0aAo+IGl0LCBsZXQncyBzZWUgd2hhdCBvdGhlcnMgdGhpbmsu
CgpUQkggSSBkb24ndCByZWFsbHkgY2FyZSBhYm91dCB0aGlzLiBJdCBpcyBlYXN5IGVub3VnaCB0
byBzcG90IHNvbWV0aGluZwppcyB3cm9uZyBpbiB0aGUgRTgyMCB0YWJsZS4KCldlaS4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
