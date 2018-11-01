From: "Tian, Kevin" <kevin.tian@intel.com>
Subject: Re: [PATCH v1 1/6] x86/vvmx: introduce vvmcx_valid()
Date: Thu, 1 Nov 2018 02:22:14 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D19BE33F65@SHSMSX101.ccr.corp.intel.com>
References: <20181012152800.7921-1-sergey.dyasli@citrix.com>
 <20181012152800.7921-2-sergey.dyasli@citrix.com>
 <AADFC41AFE54684AB9EE6CBC0274A5D19BE2BCE7@SHSMSX101.ccr.corp.intel.com>
 <5b830f56-cab8-4651-10f6-b07e5bae4c30@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <5b830f56-cab8-4651-10f6-b07e5bae4c30@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Sergey Dyasli <sergey.dyasli@citrix.com>, "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>
Cc: Andrew Cooper <Andrew.Cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, "Nakajima, Jun" <jun.nakajima@intel.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

PiBGcm9tOiBTZXJnZXkgRHlhc2xpIFttYWlsdG86c2VyZ2V5LmR5YXNsaUBjaXRyaXguY29tXQ0K
PiBTZW50OiBUdWVzZGF5LCBPY3RvYmVyIDMwLCAyMDE4IDg6NDEgUE0NCj4gDQo+IE9uIDMwLzEw
LzIwMTggMDc6NDEsIFRpYW4sIEtldmluIHdyb3RlOg0KPiA+PiBGcm9tOiBTZXJnZXkgRHlhc2xp
IFttYWlsdG86c2VyZ2V5LmR5YXNsaUBjaXRyaXguY29tXQ0KPiA+PiBTZW50OiBGcmlkYXksIE9j
dG9iZXIgMTIsIDIwMTggMTE6MjggUE0NCj4gPj4NCj4gPj4gQXMgYSBjb252ZW5pZW50IGhlbHBl
ciBmdW5jdGlvbiBhbmQgcmVmYWN0b3IgdGhlIGNvZGUgdG8gdXNlIGl0Lg0KPiA+Pg0KPiA+PiBO
byBmdW5jdGlvbmFsIGNoYW5nZS4NCj4gPj4NCj4gPj4gU2lnbmVkLW9mZi1ieTogU2VyZ2V5IER5
YXNsaSA8c2VyZ2V5LmR5YXNsaUBjaXRyaXguY29tPg0KPiA+DQo+ID4gc2luY2Ugdm1jeCBpcyBo
dm0gYWJzdHJhY3RlZCB0ZXJtLCB3aGF0IGFib3V0IHVzaW5nIHRoaXMNCj4gPiBoZWxwZXIgaW4g
c3ZtIHNpZGUgdG9vPw0KPiANCj4gSSBjb3VsZG4ndCBmaW5kIGFueSBjb2RlIGluIG5lc3RlZHN2
bS5jIHRoYXQgd291bGQgYmVuZWZpdCBmcm9tIHRoaXMgbmV3DQo+IGhlbHBlci4NCj4gDQoNCmp1
c3QgYSBxdWljayBjaGVjazoNCg0KICAgIGlmIChudi0+bnZfdnZtY3ggIT0gTlVMTCAmJiBudi0+
bnZfdnZtY3hhZGRyICE9IHZtY2JhZGRyKSB7DQogICAgICAgIEFTU0VSVChudi0+bnZfdnZtY3hh
ZGRyICE9IElOVkFMSURfUEFERFIpOw0KICAgICAgICBodm1fdW5tYXBfZ3Vlc3RfZnJhbWUobnYt
Pm52X3Z2bWN4LCAxKTsNCiAgICAgICAgbnYtPm52X3Z2bWN4ID0gTlVMTDsNCiAgICAgICAgbnYt
Pm52X3Z2bWN4YWRkciA9IElOVkFMSURfUEFERFI7DQogICAgfQ0KDQpUaGFua3MNCktldmluDQpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
