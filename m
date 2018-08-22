From: "Tian, Kevin" <kevin.tian@intel.com>
Subject: Re: [PATCH v3 2/2] x86/dmar: zap DMAR signature for
 dom0 once in TBOOT case
Date: Wed, 22 Aug 2018 02:58:38 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D1912D3857@SHSMSX101.ccr.corp.intel.com>
References: <9dfa7b11-c451-482d-98db-9f6cdb7cd2fa@default>
 <5B7C063F02000078001E07C1@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <5B7C063F02000078001E07C1@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, Zhenzhong Duan <zhenzhong.duan@oracle.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Srinivas REDDY Eeda <srinivas.eeda@oracle.com>, "Wang,
 Shane" <shane.wang@intel.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Xen-Devel <xen-devel@lists.xen.org>, "Wei, Gang" <gang.wei@intel.com>
List-Id: xen-devel@lists.xenproject.org

PiBGcm9tOiBKYW4gQmV1bGljaCBbbWFpbHRvOkpCZXVsaWNoQHN1c2UuY29tXQo+IFNlbnQ6IFR1
ZXNkYXksIEF1Z3VzdCAyMSwgMjAxOCA4OjMyIFBNCj4gCj4gPj4+IE9uIDIxLjA4LjE4IGF0IDEx
OjExLCA8emhlbnpob25nLmR1YW5Ab3JhY2xlLmNvbT4gd3JvdGU6Cj4gPiBAQCAtNDkwLDEwICs0
ODgsNiBAQCBpbnQgX19pbml0Cj4gdGJvb3RfcGFyc2VfZG1hcl90YWJsZShhY3BpX3RhYmxlX2hh
bmRsZXIgZG1hcl9oYW5kbGVyKQo+ID4gICAgICByYyA9IGRtYXJfaGFuZGxlcihkbWFyX3RhYmxl
KTsKPiA+ICAgICAgeGZyZWUoZG1hcl90YWJsZSk7Cj4gPgo+ID4gLSAgICAvKiBhY3BpX3BhcnNl
X2RtYXIoKSB6YXBzIEFQQ0kgRE1BUiBzaWduYXR1cmUgaW4gVFhUIGhlYXAgdGFibGUgKi8KPiA+
IC0gICAgLyogYnV0IGRvbTAgd2lsbCByZWFkIHJlYWwgdGFibGUsIHNvIG11c3QgemFwIGl0IHRo
ZXJlIHRvbyAqLwo+ID4gLSAgICBhY3BpX2RtYXJfemFwKCk7Cj4gCj4gSW50ZXJlc3RpbmcgLSBu
b3cgeW91IHJlbW92ZSB0aGUgb3RoZXIgb25lLiBJIHRoaW5rIHRoaXMgaXMgYWN0dWFsbHkgY29y
cmVjdCwKPiBidXQgdW5kZXJzdGFuZGluZyB3aHkgY291bGQgX2FnYWluXyBoYXZlIGJlZW4gYSBs
b3QgZWFzaWVyIHdpdGggYSBiZXR0ZXIKPiBkZXNjcmlwdGlvbi4gQWZhaWN0IGNvbW1pdCA2YzI5
OGVjYzFmICgidnRkOiBSZWluc3RhdGUgQUNQSSBETUFSIG9uCj4gc3lzdGVtIHNodXRkb3duIG9y
IFMzL1M0L1M1IikgZGlkIGV2ZXJ5dGhpbmcgZm9yIHRoaXMgY2FsbCB0byBiZQo+IHVubmVjZXNz
YXJ5LCBleGNlcHQgZm9yIGludm9raW5nIHRoZSBmdW5jdGlvbiBmcm9tIGFjcGlfcGFyc2VfZG1h
cigpLAo+IHdoaWNoIDEyM2M3NzkzNzkgKCJWVGQvZG1hcjogVHdlYWsgaG93IHRoZSBETUFSIHRh
YmxlIGlzIGNsb2JiZXJlZCIpCj4gYWRkZWQgc2V2ZXJhbCB5ZWFycyBsYXRlci4KPiAKCnllcywg
YSBiZXR0ZXIgZGVzY3JpcHRpb24gaXMgZXhwZWN0ZWQgaGVyZS4KClRoYW5rcwpLZXZpbgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
