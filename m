From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH v4 7/8] libxc/pvh: set default MTRR type to
 write-back
Date: Mon, 1 Oct 2018 17:52:02 +0200
Message-ID: <20181001155202.ochzfwbqnhze7jbh@mac.bytemobile.com>
References: <20180608095934.20995-1-roger.pau@citrix.com>
 <20180608095934.20995-8-roger.pau@citrix.com>
 <c346cae2-8919-26e7-400e-2a3625e3d40b@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=j/1z=mn=citrix.com=prvs=805c673d1=roger.pau@srs-us1.protection.inumbo.net>)
 id 1g70VA-00023C-Fu
 for xen-devel@lists.xenproject.org; Mon, 01 Oct 2018 15:52:52 +0000
Content-Disposition: inline
In-Reply-To: <c346cae2-8919-26e7-400e-2a3625e3d40b@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBTZXAgMjYsIDIwMTggYXQgMDE6Mjk6MjdQTSArMDEwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBPbiAwOC8wNi8xOCAxMDo1OSwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+ID4gQEAg
LTEwMTQsNiArMTAzNCwzMCBAQCBzdGF0aWMgaW50IHZjcHVfaHZtKHN0cnVjdCB4Y19kb21faW1h
Z2UgKmRvbSkKPiA+ICAgICAgaWYgKCBkb20tPnN0YXJ0X2luZm9fc2VnLnBmbiApCj4gPiAgICAg
ICAgICBic3BfY3R4LmNwdS5yYnggPSBkb20tPnN0YXJ0X2luZm9fc2VnLnBmbiA8PCBQQUdFX1NI
SUZUOwo+ID4gIAo+ID4gKyAgICAvKiBTZXQgdGhlIE1UUlIuICovCj4gPiArICAgIGJzcF9jdHgu
bXRycl9kLnR5cGVjb2RlID0gSFZNX1NBVkVfQ09ERShNVFJSKTsKPiA+ICsgICAgYnNwX2N0eC5t
dHJyX2QuaW5zdGFuY2UgPSAwOwo+ID4gKyAgICBic3BfY3R4Lm10cnJfZC5sZW5ndGggPSBIVk1f
U0FWRV9MRU5HVEgoTVRSUik7Cj4gPiArCj4gPiArICAgIG10cnJfcmVjb3JkID0gaHZtX2dldF9z
YXZlX3JlY29yZChmdWxsX2N0eCwgSFZNX1NBVkVfQ09ERShNVFJSKSwgMCk7Cj4gPiArICAgIGlm
ICggIW10cnJfcmVjb3JkICkKPiA+ICsgICAgewo+ID4gKyAgICAgICAgeGNfZG9tX3BhbmljKGRv
bS0+eGNoLCBYQ19JTlRFUk5BTF9FUlJPUiwKPiA+ICsgICAgICAgICAgICAgICAgICAgICAiJXM6
IHVuYWJsZSB0byBnZXQgTVRSUiBzYXZlIHJlY29yZCIsIF9fZnVuY19fKTsKPiA+ICsgICAgICAg
IGdvdG8gb3V0Owo+ID4gKyAgICB9Cj4gPiArCj4gPiArICAgIG1lbWNweSgmYnNwX2N0eC5tdHJy
LCBtdHJyX3JlY29yZCwgc2l6ZW9mKGJzcF9jdHgubXRycikpOwo+ID4gKwo+ID4gKyAgICAvKiBU
T0RPOiBtYXliZSB0aGlzIHNob3VsZCBiZSBhIGZpcm13YXJlIG9wdGlvbiBpbnN0ZWFkPyAqLwo+
ID4gKyAgICBpZiAoICFkb20tPmRldmljZV9tb2RlbCApCj4gPiArICAgICAgICAvKgo+ID4gKyAg
ICAgICAgICogRW5hYmxlIE1UUlIsIHNldCBkZWZhdWx0IHR5cGUgdG8gV0IuCj4gPiArICAgICAg
ICAgKiBUT0RPOiBhZGQgTU1JTyBhcmVhcyBhcyBVQyB3aGVuIHBhc3N0aHJvdWdoIGlzIHN1cHBv
cnRlZC4KPiA+ICsgICAgICAgICAqLwo+ID4gKyAgICAgICAgYnNwX2N0eC5tdHJyLm1zcl9tdHJy
X2RlZl90eXBlID0gTVRSUl9UWVBFX1dSQkFDSyB8Cj4gPiArICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBNVFJSX0RFRl9UWVBFX0VOQUJMRTsKPiAKPiBUaGlzIGlzIGJ1
Z2d5LsKgIE1UUlJzIGFyZSBwZXItdmNwdSBhbmQgZXhwZWN0ZWQgdG8gbWF0Y2guwqAgVGhpcyBv
bmx5Cj4gd29ya3MgYnkgY2hhbmNlIGluIHRoZSBIVk0gY2FzZSBiZWNhdXNlIGFsbCBzZXR0aW5n
cyBhcmUgc3RpbGwgMCBhdCB0aGlzCj4gcG9pbnQuCgpZZXMsIEkgd2lsbCBsb29rIGludG8gaXQg
QVNBUCwgYnV0IEknbSBub3Qgc3VyZSBpZiB0aGUgY3VycmVudApzYXZlL3Jlc3RvcmUgdHJpY2sg
dGhhdCdzIGRvbmUgaGVyZSB3aWxsIGJlIHBvc3NpYmxlIHdpdGggdmNwdXMgdGhhdAphcmUgZG93
biBvciBJIHdpbGwgbmVlZCB0byBleHBhbmQgdGhlIHNhdmUvcmVzdG9yZSBsb2dpYyB0byBhbGxv
dwpzZXR0aW5nIHRoZSBzdGF0ZSBvZiB2Y3B1cyB0aGF0IGFyZSBkb3duLgoKVGhhbmtzLCBSb2dl
ci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
