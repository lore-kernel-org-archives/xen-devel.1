From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [Notes for xen summit 2018 design session] Process
 changes: is the 6 monthly release Cadence too short, Security Process, ...
Date: Thu, 5 Jul 2018 09:19:10 +0100
Message-ID: <20180705081910.wik62aiqzxfoec4q@citrix.com>
References: <0920C595-DA2C-4C5E-B713-40ADB616CC93@citrix.com>
 <60433E7B-455A-45C9-8A6A-B26F5BD8F115@citrix.com>
 <20180703100733.mhfeia2vfywt6czx@mac.bytemobile.com>
 <FA03802B-3308-4BF8-B3D9-1E6DAB3DA64B@citrix.com>
 <20180705075351.zk3zsju3yq7xitad@citrix.com>
 <20180705080652.qkt6uq2njpgkdgiu@mac.bytemobile.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=rzas=jv=citrix.com=prvs=717a9f9c1=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1fazTu-0000oy-Gj
 for xen-devel@lists.xenproject.org; Thu, 05 Jul 2018 08:19:14 +0000
Content-Disposition: inline
In-Reply-To: <20180705080652.qkt6uq2njpgkdgiu@mac.bytemobile.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Cc: Lars Kurth <lars.kurth@citrix.com>, Wei Liu <wei.liu2@citrix.com>, "advisory-board@lists.xenproject.org" <advisory-board@lists.xenproject.org>, Doug Goldstein <cardoe@cardoe.com>, George Dunlap <George.Dunlap@citrix.com>, Rich Persaud <persaur@gmail.com>, "committers@xenproject.org" <committers@xenproject.org>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBKdWwgMDUsIDIwMTggYXQgMTA6MDY6NTJBTSArMDIwMCwgUm9nZXIgUGF1IE1vbm7D
qSB3cm90ZToKPiBPbiBUaHUsIEp1bCAwNSwgMjAxOCBhdCAwODo1Mzo1MUFNICswMTAwLCBXZWkg
TGl1IHdyb3RlOgo+ID4gT24gV2VkLCBKdWwgMDQsIDIwMTggYXQgMDM6MjY6MTZQTSArMDAwMCwg
R2VvcmdlIER1bmxhcCB3cm90ZToKPiA+ID4gU28gYSBmYWlyIGFtb3VudCBvZiB0aGUgZGlzY3Vz
c2lvbiB3YXMgYWJvdXQgd2hhdCBpdCB3b3VsZCBsb29rIGxpa2UsCj4gPiA+IGFuZCB3aGF0IGl0
IHdvdWxkIHRha2UsIHRvIG1ha2UgaXQgc3VjaCB0aGF0IGFsbW9zdCBhbnkgcHVzaCBmcm9tCj4g
PiA+IG9zc3Rlc3QgKG9yIHdoYXRldmVyIHRlc3RpbmcgaW5mcmFzY3RydWN0dXJlIHdlIHdlbnQg
d2l0aCkgY291bGQKPiA+ID4gcmVhc29uYWJseSBiZSByZWxlYXNlZCwgYW5kIHdvdWxkIGhhdmUg
YSB2ZXJ5IGxvdyBleHBlY3RhdGlvbiBvZgo+ID4gPiBoYXZpbmcgZXh0cmFuZW91cyBidWdzLgo+
ID4gCj4gPiBJIHdvdWxkIGFsc28gbGlrZSB0byBhZHZvY2F0ZSBjaGFuZ2luZyB0aGUgbWVudGFs
aXR5IGEgYml0LiBUaGUgY3VycmVudAo+ID4gbWVudGFsaXR5IGlzIHRoYXQgIndlIHdhbnQgdG8g
YmUgcmVhc29uYWJseSBzdXJlIHRoZXJlIGlzIGxvdwo+ID4gZXhwZWN0YXRpb24gb2YgYnVncyBi
ZWZvcmUgd2UgY2FuIHJlbGVhc2UiLiBXaHkgbm90IGNoYW5nZSB0byAid2UKPiA+IHJlbGVhc2Ug
d2hlbiB3ZSdyZSBzdXJlIHRoZXJlIGlzIGRlZmluaXRlbHkgaW1wcm92ZW1lbnQgaW4gdGhlIHRy
ZWUKPiA+IGNvbXBhcmVkIHRvIGxhc3QgcmVsZWFzZSI/Cj4gCj4gVGhlIGN1cnJlbnQgZ3VpZGVs
aW5lIGlzIHF1aXRlIG9iamVjdGl2ZSwgaWYgdGhlcmUgYXJlIG5vIHJlcG9ydGVkCj4gYnVncyBh
bmQgb3NzdGVzdCBmbGlnaHQgZG9lc24ndCBzaG93IGFueSByZWdyZXNzaW9ucyB3ZSBhcmUgcmVh
ZHkgdG8KPiByZWxlYXNlLiBPVE9IIGhvdyBzaG91bGQgdGhlIGltcHJvdmVtZW50cyB0byB0aGUg
dHJlZSBiZSBxdWFudGl6ZWQgYW5kCj4gbWVhc3VyZWQ/CgpTYXksIGEgc2VjdXJpdHkgYnVnIGlz
IGZpeGVkPyBBIG1ham9yIGJ1ZyBpcyBjbG9zZWQ/Cgo+IAo+IEF0IGFueSBwb2ludCBkdXJpbmcg
dGhlIGRldmVsb3BtZW50IG9yIHRoZSByZWxlYXNlIHByb2Nlc3MgdGhlIHRyZWUKPiB3aWxsIGNv
bnRhaW4gaW1wcm92ZW1lbnRzIGluIHNvbWUgYXJlYXMgY29tcGFyZWQgdG8gdGhlIGxhc3QKPiBy
ZWxlYXNlLgoKWWVzLCB0aGF0IGlzIHJpZ2h0LiBUaGF0J3Mgd2hhdCBDRCBkb2VzLCByaWdodD8K
CldlaS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
