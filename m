From: Paul Durrant <Paul.Durrant@citrix.com>
Subject: Re: [PATCH 7/7] x86: add iommu_ops to map and unmap
 pages, and also to flush the IOTLB
Date: Mon, 19 Mar 2018 16:57:03 +0000
Message-ID: <e34011bd5a674e0dbd3f396ec6f30348@AMSPEX02CL03.citrite.net>
References: <20180212104714.1922-1-paul.durrant@citrix.com>
 <20180212104714.1922-8-paul.durrant@citrix.com>
 <5AAFE13E02000078001B384A@prv-mh.provo.novell.com>
 <5334db673e44468394c93f4787702e5c@AMSPEX02CL03.citrite.net>
 <5AAFF80C02000078001B3953@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=chf4=gj=citrix.com=prvs=6096d3c21=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1exyKh-00061N-0I
 for xen-devel@lists.xenproject.org; Mon, 19 Mar 2018 17:12:27 +0000
In-Reply-To: <5AAFF80C02000078001B3953@prv-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: 'Jan Beulich' <JBeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim
 (Xen.org)" <tim@xen.org>, George Dunlap <George.Dunlap@citrix.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Ian Jackson <Ian.Jackson@citrix.com>
List-Id: xen-devel@lists.xenproject.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KW3NuaXBdDQo+ID4+IEhvdyBhcmUgeW91IG1h
a2luZyBzdXJlIHRoaXMgaXMgYSBtYXBwaW5nIHRoYXQgd2FzIGVzdGFibGlzaGVkIHZpYQ0KPiA+
PiB0aGUgbWFwIG9wPyBXaXRob3V0IHRoYXQgdGhpcyBjYW4gYmUgKGFiKXVzZWQgdG8gLi4uDQo+
ID4+DQo+ID4+ID4gKyAgICBwdXRfcGFnZShwYWdlKTsNCj4gPj4NCj4gPj4gLi4uIHVuZGVyZmxv
dyB0aGUgcmVmY291bnQgb2YgYSBwYWdlLg0KPiA+Pg0KPiA+DQo+ID4gWWVzLCBJIGd1ZXNzIEkg
bmVlZCB0byBlbnN1cmUgdGhhdCBvbmx5IG5vbi1SQU0gKGkuZS4gUk1SUiBhbmQgRTgyMA0KPiBy
ZXNlcnZlZA0KPiA+IGFyZWFzKSBhcmUgbWFwcGVkIHRocm91Z2ggdGhlIElPTU1VIG9yIHRoaXMg
Y291bGQgaW5kZWVkIGJlIGFidXNlZC4NCj4gDQo+IE5vdyBJJ20gY29uZnVzZWQgLSB0aGVuIHlv
dSBkb24ndCBuZWVkIHRvIGRlYWwgd2l0aCBzdHJ1Y3QgcGFnZV9pbmZvDQo+IGFuZCBwYWdlIHJl
ZmVyZW5jZXMgYXQgYWxsLiBOb3Igd291bGQgeW91IG5lZWQgdG8gY2FsbA0KPiBnZXRfcGFnZV9m
cm9tX2dmbigpIGFuZCBjaGVjayBwMm1faXNfYW55X3JhbSgpLiBBbHNvIC0gd2hhdCB1c2UNCj4g
d291bGQgdGhlIGludGVyZmFjZSBiZSBpZiB5b3UgY291bGRuJ3QgbWFwIGFueSBSQU0/DQo+IA0K
DQpTb3JyeSB0byBjb25mdXNlLi4uDQoNCldoYXQgSSBtZWFudCB3YXMgdGhhdCBzYWZldHkgKGFn
YWluc3QgdW5kZXJmbG93KSBpcyBwcmVkaWNhdGVkIG9uIGlvbW11X2xvb2t1cF9wYWdlKCkgZmFp
bGluZyBpZiB0aGUgbWFwcGluZyB3YXMgbm90IGVzdGFibGlzaGVkIHRocm91Z2ggYW4gaW9tbXUg
b3AgaHlwZXJjYWxsLiBTbywgdGhlIG9ubHkgdGhpbmdzIHRoYXQgc2hvdWxkIGJlIHZhbGlkIGlu
IHRoZSBpb21tdSAoYW5kIGhlbmNlIHRoYXQgaW9tbXVfbG9va3VwX3BhZ2UoKSB3b3VsZCBzdWNj
ZWVkIGZvcikgYXQgdGhlIHBvaW50IHdoZXJlIHRoZSBndWVzdCBzdGFydHMgdG8gYm9vdCBtdXN0
IGFsbCBmYWxsIHdpdGhpbiByZXNlcnZlZCByZWdpb25zLCBzbyB0aGF5IHRoZXkgYXJlIHJ1bGVk
IG91dCBieSB0aGUgZWFybGllciBjaGVjay4NCg0KICBQYXVsDQpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
