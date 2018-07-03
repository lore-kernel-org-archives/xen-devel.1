From: "Kang, Luwei" <luwei.kang@intel.com>
Subject: Re: [PATCH v2 09/10] x86: Disable Intel Processor Trace
 when VMXON in L1 guest
Date: Tue, 3 Jul 2018 10:19:04 +0000
Message-ID: <82D7661F83C1A047AF7DC287873BF1E16804820D@SHSMSX101.ccr.corp.intel.com>
References: <1527686884-5917-1-git-send-email-luwei.kang@intel.com>
 <1527686884-5917-10-git-send-email-luwei.kang@intel.com>
 <5B364CEF02000078001CF416@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <5B364CEF02000078001CF416@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Tim Deegan <tim@xen.org>, "Tian, Kevin" <kevin.tian@intel.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>, Julien Grall <julien.grall@arm.com>, "Nakajima, Jun" <jun.nakajima@intel.com>
List-Id: xen-devel@lists.xenproject.org

PiA+IEBAIC0xNTE5LDYgKzE1MjAsMTQgQEAgaW50IG52bXhfaGFuZGxlX3ZteG9uKHN0cnVjdCBj
cHVfdXNlcl9yZWdzICpyZWdzKQo+ID4gICAgICB2LT5hcmNoLmh2bV92bXgubGF1bmNoZWQgPSAw
Owo+ID4gICAgICB2bXN1Y2NlZWQocmVncyk7Cj4gPgo+ID4gKyAgICBpZiAoIHYtPmFyY2guaHZt
X3ZteC5pcHRfZGVzYyApCj4gPiArICAgIHsKPiA+ICsgICAgICAgIHYtPmFyY2guaHZtX3ZteC5p
cHRfZGVzYy0+aXB0X2d1ZXN0LmN0bCA9IDA7Cj4gPiArICAgICAgICB2bXhfdm1jc19lbnRlcihj
dXJyZW50KTsKPiA+ICsgICAgICAgIF9fdm13cml0ZShHVUVTVF9JQTMyX1JUSVRfQ1RMLCAwKTsK
PiA+ICsgICAgICAgIHZteF92bWNzX2V4aXQoY3VycmVudCk7Cj4gPiArICAgIH0KPiAKPiBJIGFn
YWluIGRvbid0IHVuZGVyc3RhbmQgd2h5IGVudGVyIGFuZCBleGl0IHRoZSBWTUNTIGhlcmUuCj4g
CldpbGwgcmVtb3ZlIHRoaXMgYmVjYXVzZSBpdCBpbiB2bXhfdm1lbnRlcl9oZWxwZXIoKS4gCgpU
aGFua3MsCkx1d2VpIEthbmcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
