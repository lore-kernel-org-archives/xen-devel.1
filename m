From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH 2/8] x86/HVM/SVM: Add AVIC initialization
 code
Date: Mon, 16 Apr 2018 17:15:00 +0100
Message-ID: <20180416161500.wvkgmfdrp7kooyjr@MacBook-Pro-de-Roger.local>
References: <cover.1522794651.git.Janakarajan.Natarajan@amd.com>
 <25d739b732adb329166f7cca3633473f4ad08b39.1522794651.git.Janakarajan.Natarajan@amd.com>
 <5AD4C76802000078001BBCD7@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Content-Disposition: inline
In-Reply-To: <5AD4C76802000078001BBCD7@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Kevin Tian <kevin.tian@intel.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Janakarajan Natarajan <Janakarajan.Natarajan@amd.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, xen-devel@lists.xen.org, Julien Grall <julien.grall@arm.com>, Jun Nakajima <jun.nakajima@intel.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBBcHIgMTYsIDIwMTggYXQgMDk6NTU6MjBBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDA0LjA0LjE4IGF0IDAxOjAxLCA8SmFuYWthcmFqYW4uTmF0YXJhamFuQGFt
ZC5jb20+IHdyb3RlOgo+ID4gRnJvbTogU3VyYXZlZSBTdXRoaWt1bHBhbml0IDxzdXJhdmVlLnN1
dGhpa3VscGFuaXRAYW1kLmNvbT4KPiA+ICsvKgo+ID4gKyAqIE5vdGU6IEN1cnJlbnQgbWF4IGlu
ZGV4IGFsbG93ZWQgZm9yIHBoeXNpY2FsIEFQSUMgSUQgdGFibGUgaXMgMjU1Lgo+ID4gKyAqLwo+
IAo+IFRoaXMgaXMgYSBzaW5nbGUgbGluZSBjb21tZW50Lgo+IAo+ID4gKyNkZWZpbmUgQVZJQ19Q
SFlfQVBJQ19JRF9NQVggICAgMHhGRgo+IAo+IElzIHRoaXMgcmVhbGx5IGFuIEFWSUMtc3BlY2lm
aWMgY29uc3RhbnQsIHJhdGhlciB0aGFuIGUuZy4KPiBHRVRfeEFQSUNfSUQoQVBJQ19JRF9NQVNL
KT8KCkFsc28sIHRoaXMgaXMgbm90IHRoZSBtYXggQVBJQyBJRCwgbWF4IEFQSUMgSUQgd291bGQg
YmUgMHhmZSwgMjU1IGlzCnRoZSBBUElDIGJyb2FkY2FzdCBpZC4gWW91IGNhbm5vdCBoYXZlIGEg
cGh5c2ljYWwgQVBJQyB3aXRoIElEIDI1NSBpbgp4QVBJQyBtb2RlLgoKVGhhbmtzLCBSb2dlci4K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
