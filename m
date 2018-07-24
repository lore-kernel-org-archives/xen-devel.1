From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 3/6] x86/HVM: implement memory read caching
Date: Tue, 24 Jul 2018 04:28:52 -0600
Message-ID: <5B56FF6402000078001D7220@prv1-mh.provo.novell.com>
References: <5B506A6E02000078001D5D17@prv1-mh.provo.novell.com>
 <5B506C8502000078001D5D52@prv1-mh.provo.novell.com>
 <dff1fdb2547a4229855aaf101c833a77@AMSPEX02CL03.citrite.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=vgmm=ki=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fhuYs-0007tV-B4
 for xen-devel@lists.xenproject.org; Tue, 24 Jul 2018 10:28:58 +0000
In-Reply-To: <dff1fdb2547a4229855aaf101c833a77@AMSPEX02CL03.citrite.net>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <paul.durrant@citrix.com>
Cc: Kevin Tian <kevin.tian@intel.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, george.dunlap@citrix.com, Jun Nakajima <jun.nakajima@intel.com>, xen-devel <xen-devel@lists.xenproject.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Brian Woods <brian.woods@amd.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE5LjA3LjE4IGF0IDE2OjIwLCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+IHdyb3Rl
Ogo+PiBGcm9tOiBKYW4gQmV1bGljaCBbbWFpbHRvOkpCZXVsaWNoQHN1c2UuY29tXQo+PiBTZW50
OiAxOSBKdWx5IDIwMTggMTE6NDkKPj4gQEAgLTEwNDYsNiArMTA2MCw4IEBAIHN0YXRpYyBpbnQg
X19odm1lbXVsX3JlYWQoCj4+ICAgICAgICAgIHBmZWMgfD0gUEZFQ19pbXBsaWNpdDsKPj4gICAg
ICBlbHNlIGlmICggaHZtZW11bF9jdHh0LT5zZWdfcmVnW3g4Nl9zZWdfc3NdLmRwbCA9PSAzICkK
Pj4gICAgICAgICAgcGZlYyB8PSBQRkVDX3VzZXJfbW9kZTsKPj4gKyAgICBpZiAoIGFjY2Vzc190
eXBlID09IGh2bV9hY2Nlc3NfaW5zbl9mZXRjaCApCj4+ICsgICAgICAgIHBmZWMgfD0gUEZFQ19p
bnNuX2ZldGNoOwo+IAo+IFNpbmNlIHlvdSBPUiB0aGUgaW5zbl9mZXRjaCBmbGFnIGluIGhlcmUu
Li4KPiAKPj4gCj4+ICAgICAgcmMgPSBodm1lbXVsX3ZpcnR1YWxfdG9fbGluZWFyKAo+PiAgICAg
ICAgICBzZWcsIG9mZnNldCwgYnl0ZXMsICZyZXBzLCBhY2Nlc3NfdHlwZSwgaHZtZW11bF9jdHh0
LCAmYWRkcik7Cj4+IEBAIC0xMDU5LDcgKzEwNzUsOCBAQCBzdGF0aWMgaW50IF9faHZtZW11bF9y
ZWFkKAo+PiAKPj4gICAgICByYyA9ICgoYWNjZXNzX3R5cGUgPT0gaHZtX2FjY2Vzc19pbnNuX2Zl
dGNoKSA/Cj4+ICAgICAgICAgICAgaHZtX2ZldGNoX2Zyb21fZ3Vlc3RfbGluZWFyKHBfZGF0YSwg
YWRkciwgYnl0ZXMsIHBmZWMsICZwZmluZm8pIDoKPiAKPiAuLi5jb3VsZCB5b3Ugbm90IGp1c3Qg
dXNlIGh2bV9jb3B5X2Zyb21fZ3Vlc3RfbGluZWFyKCkgaGVyZSByZWdhcmRsZXNzIG9mIAo+IGFj
Y2Vzc190eXBlIChhbmQganVzdCBOVUxMIG91dCB0aGUgY2FjaGUgYXJndW1lbnQgaWYgaXQgaXMg
YW4gaW5zbl9mZXRjaCk/Cj4gCj4gQUZBSUNUIHRoZSBvbmx5IHJlYXNvbiBodm1fZmV0Y2hfZnJv
bV9ndWVzdF9saW5lYXIoKSBleGlzdHMgaXMgdG8gT1IgdGhlIAo+IGV4dHJhIGZsYWcgaW4uCgpX
ZWxsLCB0ZWNobmljYWxseSBpdCBsb29rcyBsaWtlIEkgaW5kZWVkIGNvdWxkLiBJJ20gbm90IHN1
cmUgdGhhdCdzIGdvb2QgaWRlYQp0aG91Z2ggLSB0aGUgdmlzdWFsIHNlcGFyYXRpb24gb2YgImNv
cHkiIHZzICJmZXRjaCIgaXMgaGVscGZ1bCBJIHRoaW5rLiBMZXQncwpzZWUgaWYgSSBnZXQgYW55
IG9waW5pb25zIGJ5IG90aGVycyBpbiBvbmUgb3IgdGhlIG90aGVyIGRpcmVjdGlvbi4KCkphbgoK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
