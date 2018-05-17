From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2 07/10] x86/SVM: Add interrupt management
 code via AVIC
Date: Thu, 17 May 2018 08:50:02 -0600
Message-ID: <5AFD969A02000078001C3AD9@prv1-mh.provo.novell.com>
References: <20180507210753.2280-1-Janakarajan.Natarajan@amd.com>
 <20180507210753.2280-8-Janakarajan.Natarajan@amd.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20180507210753.2280-8-Janakarajan.Natarajan@amd.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Janakarajan Natarajan <Janakarajan.Natarajan@amd.com>
Cc: Tim Deegan <tim@xen.org>, Kevin Tian <kevin.tian@intel.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, xen-devel@lists.xen.org, Julien Grall <julien.grall@arm.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA3LjA1LjE4IGF0IDIzOjA3LCA8SmFuYWthcmFqYW4uTmF0YXJhamFuQGFtZC5jb20+
IHdyb3RlOgo+ICt2b2lkIHN2bV9hdmljX2RlbGl2ZXJfcG9zdGVkX2ludHIoc3RydWN0IHZjcHUg
KnYsIHU4IHZlYykKPiArewo+ICsgICAgc3RydWN0IHZsYXBpYyAqdmxhcGljID0gdmNwdV92bGFw
aWModik7Cj4gKwo+ICsgICAgLyogRmFsbGJhY2sgdG8gdXNlIG5vbi1BVklDIGlmIHZjcHUgaXMg
bm90IGVuYWJsZWQgd2l0aCBBVklDLiAqLwo+ICsgICAgaWYgKCAhc3ZtX2F2aWNfdmNwdV9lbmFi
bGVkKHYpICkKPiArICAgIHsKPiArICAgICAgICBpZiAoICF2bGFwaWNfdGVzdF9hbmRfc2V0X3Zl
Y3Rvcih2ZWMsICZ2bGFwaWMtPnJlZ3MtPmRhdGFbQVBJQ19JUlJdKSApCj4gKyAgICAgICAgICAg
IHZjcHVfa2ljayh2KTsKPiArICAgICAgICByZXR1cm47Cj4gKyAgICB9Cj4gKwo+ICsgICAgLyog
SWYgaW50ZXJydXB0IGlzIGRpc2FibGVkLCBkbyBub3QgaWdub3JlIHRoZSBpbnRlcnJ1cHQgKi8K
PiArICAgIGlmICggIShndWVzdF9jcHVfdXNlcl9yZWdzKCktPmVmbGFncyAmIFg4Nl9FRkxBR1Nf
SUYpICkKPiArICAgICAgICByZXR1cm47CgpJdCBzZWVtcyB0byBtZSB0aGF0IEkgZGlkIGNvbW1l
bnQgb24gdGhpcyBiZWZvcmUgLSBJIGRvbid0IHRoaW5rIEVGTEFHUy5JRgpzaG91bGQgYmUgY29u
c2lkZXJlZCBoZXJlOgoKPiArICAgIGlmICggdmxhcGljX3Rlc3RfYW5kX3NldF92ZWN0b3IodmVj
LCAmdmxhcGljLT5yZWdzLT5kYXRhW0FQSUNfSVJSXSkgKQo+ICsgICAgICAgIHJldHVybjsKCkxh
dGNoaW5nIHRoZSBpbnRlcnJ1cHQgaW50byBJUlIgb3VnaHQgdG8ga2VlcCBpdCBwZW5kaW5nIHVu
dGlsIHRoZSBndWVzdCBzZXRzCkVGTEFHUy5JRiBhZ2Fpbi4KCkphbgoKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
