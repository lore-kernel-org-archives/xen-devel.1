From: Sergey Dyasli <sergey.dyasli@citrix.com>
Subject: Re: [PATCH v1 1/6] x86/vvmx: introduce vvmcx_valid()
Date: Thu, 1 Nov 2018 08:52:43 +0000
Message-ID: <b90a2e08-ab43-d839-0a76-e627703c5680@citrix.com>
References: <20181012152800.7921-1-sergey.dyasli@citrix.com>
 <20181012152800.7921-2-sergey.dyasli@citrix.com>
 <AADFC41AFE54684AB9EE6CBC0274A5D19BE2BCE7@SHSMSX101.ccr.corp.intel.com>
 <5b830f56-cab8-4651-10f6-b07e5bae4c30@citrix.com>
 <AADFC41AFE54684AB9EE6CBC0274A5D19BE33F65@SHSMSX101.ccr.corp.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <AADFC41AFE54684AB9EE6CBC0274A5D19BE33F65@SHSMSX101.ccr.corp.intel.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: "Tian, Kevin" <kevin.tian@intel.com>, "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>
Cc: Andrew Cooper <Andrew.Cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, "Nakajima, Jun" <jun.nakajima@intel.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDEvMTEvMjAxOCAwMjoyMiwgVGlhbiwgS2V2aW4gd3JvdGU6Cj4+IEZyb206IFNlcmdleSBE
eWFzbGkgW21haWx0bzpzZXJnZXkuZHlhc2xpQGNpdHJpeC5jb21dCj4+IFNlbnQ6IFR1ZXNkYXks
IE9jdG9iZXIgMzAsIDIwMTggODo0MSBQTQo+Pgo+PiBPbiAzMC8xMC8yMDE4IDA3OjQxLCBUaWFu
LCBLZXZpbiB3cm90ZToKPj4+PiBGcm9tOiBTZXJnZXkgRHlhc2xpIFttYWlsdG86c2VyZ2V5LmR5
YXNsaUBjaXRyaXguY29tXQo+Pj4+IFNlbnQ6IEZyaWRheSwgT2N0b2JlciAxMiwgMjAxOCAxMToy
OCBQTQo+Pj4+Cj4+Pj4gQXMgYSBjb252ZW5pZW50IGhlbHBlciBmdW5jdGlvbiBhbmQgcmVmYWN0
b3IgdGhlIGNvZGUgdG8gdXNlIGl0Lgo+Pj4+Cj4+Pj4gTm8gZnVuY3Rpb25hbCBjaGFuZ2UuCj4+
Pj4KPj4+PiBTaWduZWQtb2ZmLWJ5OiBTZXJnZXkgRHlhc2xpIDxzZXJnZXkuZHlhc2xpQGNpdHJp
eC5jb20+Cj4+Pgo+Pj4gc2luY2Ugdm1jeCBpcyBodm0gYWJzdHJhY3RlZCB0ZXJtLCB3aGF0IGFi
b3V0IHVzaW5nIHRoaXMKPj4+IGhlbHBlciBpbiBzdm0gc2lkZSB0b28/Cj4+Cj4+IEkgY291bGRu
J3QgZmluZCBhbnkgY29kZSBpbiBuZXN0ZWRzdm0uYyB0aGF0IHdvdWxkIGJlbmVmaXQgZnJvbSB0
aGlzIG5ldwo+PiBoZWxwZXIuCj4+Cj4gCj4ganVzdCBhIHF1aWNrIGNoZWNrOgo+IAo+ICAgICBp
ZiAobnYtPm52X3Z2bWN4ICE9IE5VTEwgJiYgbnYtPm52X3Z2bWN4YWRkciAhPSB2bWNiYWRkcikg
ewo+ICAgICAgICAgQVNTRVJUKG52LT5udl92dm1jeGFkZHIgIT0gSU5WQUxJRF9QQUREUik7Cj4g
ICAgICAgICBodm1fdW5tYXBfZ3Vlc3RfZnJhbWUobnYtPm52X3Z2bWN4LCAxKTsKPiAgICAgICAg
IG52LT5udl92dm1jeCA9IE5VTEw7Cj4gICAgICAgICBudi0+bnZfdnZtY3hhZGRyID0gSU5WQUxJ
RF9QQUREUjsKPiAgICAgfQoKWWVzLCB0aGF0J3MgdGhlIG9ubHkgdXNhZ2UgYW5kIGl0IGxvb2tz
IGJldHRlciBvcGVuIGNvZGVkIElNSE8uIEJ1dCBJCmNhbiB1c2UgdGhlIG5ldyBoZWxwZXIgaGVy
ZSBhbHNvLCBpZiB5b3UgaW5zaXN0LgoKVGhhbmtzLApTZXJnZXkKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
