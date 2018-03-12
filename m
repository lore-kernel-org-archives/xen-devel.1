From: "Kang, Luwei" <luwei.kang@intel.com>
Subject: Re: [PATCH RESEND v1 1/7] x86: add a flag to enable
 Intel processor trace
Date: Mon, 12 Mar 2018 09:25:40 +0000
Message-ID: <82D7661F83C1A047AF7DC287873BF1E167EF4937@SHSMSX101.ccr.corp.intel.com>
References: <1516039953-2988-1-git-send-email-luwei.kang@intel.com>
 <1516039953-2988-2-git-send-email-luwei.kang@intel.com>
 <20180309165309.pimwqyilkik2oi7a@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20180309165309.pimwqyilkik2oi7a@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: "Tian, Kevin" <kevin.tian@intel.com>, "sstabellini@kernel.org" <sstabellini@kernel.org>, "jbeulich@suse.com" <jbeulich@suse.com>, "George.Dunlap@eu.citrix.com" <George.Dunlap@eu.citrix.com>, "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>, "tim@xen.org" <tim@xen.org>, "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>, "Nakajima,
 Jun" <jun.nakajima@intel.com>
List-Id: xen-devel@lists.xenproject.org

PiA+IGRpZmYgLS1naXQgYS9kb2NzL21pc2MveGVuLWNvbW1hbmQtbGluZS5tYXJrZG93bgo+ID4g
Yi9kb2NzL21pc2MveGVuLWNvbW1hbmQtbGluZS5tYXJrZG93bgo+ID4gaW5kZXggNzgxMTEwZC4u
OTU0MTFjZiAxMDA2NDQKPiA+IC0tLSBhL2RvY3MvbWlzYy94ZW4tY29tbWFuZC1saW5lLm1hcmtk
b3duCj4gPiArKysgYi9kb2NzL21pc2MveGVuLWNvbW1hbmQtbGluZS5tYXJrZG93bgo+ID4gQEAg
LTEwMDksNiArMTAwOSwxMyBAQCBkZWJ1ZyBoeXBlcnZpc29yIG9ubHkpLgo+ID4gICMjIyBpZGxl
XF9sYXRlbmN5XF9mYWN0b3IKPiA+ICA+IGA9IDxpbnRlZ2VyPmAKPiA+Cj4gPiArIyMjIGludGVs
XF9wdAo+ID4gKz4gYD0gPGJvb2xlYW4+YAo+ID4gKwo+ID4gKz4gRGVmYXVsdDogYHRydWVgCj4g
PiArCj4gPiArRmxhZyB0byBlbmFibGUgSW50ZWwgUHJvY2Vzc29yIFRyYWNlLgo+ID4gKwo+ID4g
ICMjIyBpb2FwaWNcX2Fjawo+ID4gID4gYD0gb2xkIHwgbmV3YAo+ID4KPiAKPiBObyBkb2N1bWVu
dCBmb3IgdGhpcyBvcHRpb24/CgpUaGFua3MgZm9yIHRoZSBjb2RlIHJldmlldy4gV2lsbCBhZGQg
YSBzaW1wbGUgZGVzY3JpcHRpb24gaGVyZS4KCj4gCj4gPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gv
eDg2L2NwdS9NYWtlZmlsZSBiL3hlbi9hcmNoL3g4Ni9jcHUvTWFrZWZpbGUKPiA+IGluZGV4IDc0
ZjIzYWUuLjMzZDdhNzQgMTAwNjQ0Cj4gPiAtLS0gYS94ZW4vYXJjaC94ODYvY3B1L01ha2VmaWxl
Cj4gPiArKysgYi94ZW4vYXJjaC94ODYvY3B1L01ha2VmaWxlCj4gPiBAQCAtOCwzICs4LDQgQEAg
b2JqLXkgKz0gaW50ZWwubwo+ID4gIG9iai15ICs9IGludGVsX2NhY2hlaW5mby5vCj4gPiAgb2Jq
LXkgKz0gbXdhaXQtaWRsZS5vCj4gPiAgb2JqLXkgKz0gdnBtdS5vIHZwbXVfYW1kLm8gdnBtdV9p
bnRlbC5vCj4gPiArb2JqLXkgKz0gaW50ZWxfcHQubwo+IAo+IE1vdmUgdGhpcyBhZnRlciBpbnRl
bF9jYWNoZWluZm8gcGxlYXNlLgo+IAo+IFdlIG9yZGVyIHRoaW5ncyBhbHBoYWJldGljYWxseS4K
CldpbGwgY2hlY2sgYW5kIHJlb3JkZXIgYWxsIHRoZSB0aGluZ3MgaW4gbmV4dCB2ZXJzaW9uLgoK
PiA+ICsKPiA+ICsvKiBpbnRlbF9wdDogRmxhZyB0byBlbmFibGUgSW50ZWwgUHJvY2Vzc29yIFRy
YWNlIChkZWZhdWx0IG9uKS4gKi8KPiA+ICtib29sX3QgX19yZWFkX21vc3RseSBvcHRfaW50ZWxf
cHQgPSAxOwo+IAo+IFVzZSBwbGFpbiBib29sIGFuZCB0cnVlIHBsZWFzZS4KCldpbGwgZml4IGl0
LiBCVFcsIEkgYW0gdGhpbmtpbmcgb2YgbWFrZSBpdCAiZmFsc2UiIGFzIGRlZmF1bHQgdG8gcmVk
dWNlIG92ZXJoZWFkLgoKVGhhbmtzLApMdXdlaSBLYW5nCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
