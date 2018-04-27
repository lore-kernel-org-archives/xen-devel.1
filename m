From: "Kang, Luwei" <luwei.kang@intel.com>
Subject: Re: [PATCH RESEND v1 1/7] x86: add a flag to enable
 Intel processor trace
Date: Fri, 27 Apr 2018 08:22:00 +0000
Message-ID: <82D7661F83C1A047AF7DC287873BF1E167F67364@SHSMSX101.ccr.corp.intel.com>
References: <1516039953-2988-1-git-send-email-luwei.kang@intel.com>
 <1516039953-2988-2-git-send-email-luwei.kang@intel.com>
 <20180426120909.6miciqgzuvxfxpyy@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20180426120909.6miciqgzuvxfxpyy@citrix.com>
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
PiArCj4gCj4gQWZ0ZXIgcmVhZGluZyB0aGUgbWFudWFsIGEgYml0IEkgdGhpbmsgdGhpcyBvcHRp
b24gbmVlZHMgdG8gYmUgbW9yZQo+IHNvcGhpc3RpY2F0ZWQuCj4gCj4gVGhlIHNlcmllcyBvbmx5
IGltcGxlbWVudHMgZ3Vlc3Qtb25seSB0cmFjaW5nLCB3aGlsZSBpbiB0aGUgZnV0dXJlIHdlIG1p
Z2h0Cj4gd2FudCBob3N0LW9ubHkgdHJhY2luZyBhbmQgc3lzdGVtIHdpZGUgdHJhY2luZy4KPiAK
PiBFdmVuIHRoZSBvdGhlciBtb2RlcyBhcmVuJ3QgaW1wbGVtZW50ZWQgeWV0IHdlIHNob3VsZCBs
ZWF2ZSByb29tIGZvcgo+IHRoZW0uCj4gCgpIaSBXZWksCiAgICAgVGhhbmtzIGZvciB0aGUgcmV2
aWV3LiBTbyB3aGF0IGFib3V0IGRlZmluZSBndWVzdCBtb2RlIGxpa2UgdGhpcyBhbmQgbWFrZSB0
aGUgb3B0aW9uIGFzIGEgc3RyaW5nLiBPdGhlciBtb2RlIGNhbiBiZSBhZGRlZCBsaWtlICdzeXN0
ZW0gfCBob3N0JyBpbiBmdXR1cmUuCgojIyMgSW50ZWxcX3B0Cj4gYD0gZ3Vlc3RgCgo8c29tZSBk
ZXNjcmlwdGlvbj4KCkJ5IHRoZSB3YXksIHlvdSBtZW50aW9uZWQgaW4gYW5vdGhlciBzYWlkIHRo
YXQsICAiTm8gZG9jdW1lbnQgZm9yIHRoaXMgb3B0aW9uIGhlcmU/Ii4gRG8geW91IG1lYW4gdGhl
IGRlc2NyaXB0aW9uIGlzIHRvbyBzaW1wbGUgaW4gdGhpcyBwYXRjaCBvciBJIG5lZWQgYWRkIHNv
bWUgd29yZHMgaW4gYSBhbm90aGVyIGRvY3VtZW50PwoKVGhhbmtzLApMdXdlaSBLYW5nCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
