From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2] xen/vsprintf: Introduce %pd formatter
 for domains
Date: Mon, 01 Oct 2018 03:08:59 -0600
Message-ID: <5BB1E42B02000078001ED185@prv1-mh.provo.novell.com>
References: <1538155327-3194-1-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1538155327-3194-1-git-send-email-andrew.cooper3@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Xen-devel <xen-devel@lists.xen.org>, Julien Grall <julien.grall@arm.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI4LjA5LjE4IGF0IDE5OjIyLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gLS0tIGEveGVuL2NvbW1vbi92c3ByaW50Zi5jCj4gKysrIGIveGVuL2NvbW1vbi92c3By
aW50Zi5jCj4gQEAgLTI2NCw2ICsyNjQsNDcgQEAgc3RhdGljIGNoYXIgKnN0cmluZyhjaGFyICpz
dHIsIGNoYXIgKmVuZCwgY29uc3QgY2hhciAqcywKPiAgICAgIHJldHVybiBzdHI7Cj4gIH0KPiAg
Cj4gKy8qIFByaW50IGEgZG9tYWluIGlkLCB1c2luZyBuYW1lcyBmb3Igc3lzdGVtIGRvbWFpbnMu
ICAoZS5nLiBkMCBvciBkW0lETEVdKSAqLwo+ICtzdGF0aWMgY2hhciAqcHJpbnRfZG9tYWluKGNo
YXIgKnN0ciwgY2hhciAqZW5kLCBjb25zdCBzdHJ1Y3QgZG9tYWluICpkKQo+ICt7Cj4gKyAgICBj
b25zdCBjaGFyICpuYW1lID0gTlVMTDsKPiArCj4gKyAgICAvKiBTb21lIGRlYnVnZ2luZyBtYXkg
aGF2ZSBhbiBvcHRpb25hbGx5LU5VTEwgcG9pbnRlci4gKi8KPiArICAgIGlmICggdW5saWtlbHko
IWQpICkKPiArICAgICAgICByZXR1cm4gc3RyaW5nKHN0ciwgZW5kLCAiTlVMTCIsIC0xLCAtMSwg
MCk7Cj4gKwo+ICsgICAgaWYgKCBzdHIgPCBlbmQgKQo+ICsgICAgICAgICpzdHIgPSAnZCc7Cj4g
Kwo+ICsgICAgc3dpdGNoICggZC0+ZG9tYWluX2lkICkKPiArICAgIHsKPiArICAgIGNhc2UgRE9N
SURfSU86ICAgbmFtZSA9ICJbSU9dIjsgICBicmVhazsKPiArICAgIGNhc2UgRE9NSURfWEVOOiAg
bmFtZSA9ICJbWEVOXSI7ICBicmVhazsKPiArICAgIGNhc2UgRE9NSURfQ09XOiAgbmFtZSA9ICJb
Q09XXSI7ICBicmVhazsKPiArICAgIGNhc2UgRE9NSURfSURMRTogbmFtZSA9ICJbSURMRV0iOyBi
cmVhazsKCiAgICBkZWZhdWx0OiBBU1NFUlRfVU5SRUFDSEFCTEUoKTsKCj8KCj4gKyAgICB9CgpQ
ZXJoYXBzIHRoZSBpbnNlcnRpb24gb2YgJ2QnIG1pZ2h0IGJldHRlciBsaXZlIGhlcmUsIHRvIG1h
a2UgYQpiZXR0ZXIgY29ubmVjdGlvbiBiZXR3ZWVuIHRoZSBsYWNrIG9mIGEgKysgdGhlcmUgYW5k
IHRoZSArIDEKYmVsb3c/Cgo+ICsgICAgaWYgKCBuYW1lICkKPiArICAgICAgICByZXR1cm4gc3Ry
aW5nKHN0ciArIDEsIGVuZCwgbmFtZSwgLTEsIC0xLCAwKTsKPiArICAgIGVsc2UKPiArICAgICAg
ICByZXR1cm4gbnVtYmVyKHN0ciArIDEsIGVuZCwgZC0+ZG9tYWluX2lkLCAxMCwgLTEsIC0xLCAw
KTsKPiArfQoKQW55d2F5LCBldmVuIHdpdGhvdXQgdGhlIGFkanVzdG1lbnRzClJldmlld2VkLWJ5
OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgpKYW4KCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
