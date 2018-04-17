From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 5/8] x86/SVM: Add interrupt management code
 via AVIC
Date: Tue, 17 Apr 2018 07:06:23 -0600
Message-ID: <5AD5F14F02000078001BC16D@prv1-mh.provo.novell.com>
References: <cover.1522794651.git.Janakarajan.Natarajan@amd.com>
 <b402eb9dd2e9cd7c3b36f4a8beac86362e20883a.1522794651.git.Janakarajan.Natarajan@amd.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <b402eb9dd2e9cd7c3b36f4a8beac86362e20883a.1522794651.git.Janakarajan.Natarajan@amd.com>
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

Pj4+IE9uIDA0LjA0LjE4IGF0IDAxOjAxLCA8SmFuYWthcmFqYW4uTmF0YXJhamFuQGFtZC5jb20+
IHdyb3RlOgo+ICt2b2lkIHN2bV9hdmljX2RlbGl2ZXJfcG9zdGVkX2ludHIoc3RydWN0IHZjcHUg
KnYsIHU4IHZlYykKPiArewo+ICsgICAgc3RydWN0IHZsYXBpYyAqdmxhcGljID0gdmNwdV92bGFw
aWModik7Cj4gKwo+ICsgICAgLyogRmFsbGJhY2sgdG8gdXNlIG5vbi1BVklDIGlmIHZjcHUgaXMg
bm90IGVuYWJsZWQgd2l0aCBBVklDLiAqLwo+ICsgICAgaWYgKCAhc3ZtX2F2aWNfdmNwdV9lbmFi
bGVkKHYpICkKPiArICAgIHsKPiArICAgICAgICBpZiAoICF2bGFwaWNfdGVzdF9hbmRfc2V0X3Zl
Y3Rvcih2ZWMsICZ2bGFwaWMtPnJlZ3MtPmRhdGFbQVBJQ19JUlJdKSApCj4gKyAgICAgICAgICAg
IHZjcHVfa2ljayh2KTsKPiArICAgICAgICByZXR1cm47Cj4gKyAgICB9Cj4gKwo+ICsgICAgLyog
SWYgaW50ZXJydXB0IGlzIGRpc2FibGVkLCBkbyBub3QgaWdub3JlIHRoZSBpbnRlcnJ1cHQgKi8K
PiArICAgIGlmICggIShndWVzdF9jcHVfdXNlcl9yZWdzKCktPmVmbGFncyAmIFg4Nl9FRkxBR1Nf
SUYpICkKPiArICAgICAgICByZXR1cm47CgpJJ20gY29uZnVzZWQgYnkgdGhlIGNvbW1lbnQ6IEhv
dyBpcyByZXR1cm5pbmcgaGVyZSB3aXRob3V0IGFueSBpbmRpY2F0aW9uCnRvIHRoZSBjYWxsZXIg
ZGlmZmVyZW50IGZyb20gaWdub3JpbmcgdGhlIGludGVycnVwdD8gSG93IGNvbWUgRUZMQUdTLklG
Cm1hdHRlcnMgaGVyZSBpbiB0aGUgZmlyc3QgcGxhY2U/CgpKYW4KCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
