From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 04/10] x86/HVM/SVM: Add AVIC
 initialization code
Date: Wed, 16 May 2018 16:41:38 +0100
Message-ID: <97ef1e96-19c8-5828-13c0-a4531158f5df@citrix.com>
References: <20180507210753.2280-1-Janakarajan.Natarajan@amd.com>
 <20180507210753.2280-5-Janakarajan.Natarajan@amd.com>
 <5AFC4E6302000078001C357F@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=6zah=id=citrix.com=prvs=667472785=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1fIyco-00056m-Da
 for xen-devel@lists.xenproject.org; Wed, 16 May 2018 15:45:58 +0000
In-Reply-To: <5AFC4E6302000078001C357F@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, Janakarajan Natarajan <Janakarajan.Natarajan@amd.com>
Cc: Kevin Tian <kevin.tian@intel.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>, Jun Nakajima <jun.nakajima@intel.com>, xen-devel <xen-devel@lists.xenproject.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTYvMDUvMTggMTY6MjksIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDA3LjA1LjE4IGF0
IDIzOjA3LCA8SmFuYWthcmFqYW4uTmF0YXJhamFuQGFtZC5jb20+IHdyb3RlOgo+Pj4+Cj4+ICsg
ICAgcy0+YXZpY19sYXN0X3BoeV9pZCA9IGF2aWNfZ2V0X3BoeXNpY2FsX2lkX2VudHJ5KGQsIEdF
VF94QVBJQ19JRChhcGljX2lkKSk7Cj4gWW91IGRvbid0IGFwcGVhciB0byByZWFkIHRoaXMgdmFs
dWUgb3V0c2lkZSBvZiB0aGlzIGZ1bmN0aW9uLiBQbGVhc2Ugc3RvcmUKPiB2YWx1ZXMgaW4gc3Ry
dWN0IGRvbWFpbiAvIHN0cnVjdCB2Y3B1IG9ubHkgaWYgeW91IGluIGZhY3QgcmVhZCB0aGVtLCBh
bmQKPiBpZiB0aGVpciBjYWxjdWxhdGlvbiBpc24ndCB0cml2aWFsLgo+Cj4gSSBhbHNvIGRvbid0
IGFwcGVhciB0byB1bmRlcnN0YW5kIHRoZSBwdXJwb3NlIG9mIHRoZSAibGFzdCIgaW4gdGhlIG5h
bWUuCgpzLT5hdmljX2xhc3RfcGh5X2lkIGlzIG5vdCBuZWVkZWQuwqAgSXQgaXMgYSBjYWNoZWQg
dW5jaGFuZ2luZyBwb2ludGVyCmludG8gdGhlIHBoeXNpZCB0YWJsZS4KClJlbW92aW5nIGl0IHdp
bGwgaGVscCBjbGVhbiB1cCBzb21lIG9mIHRoZSBsYXRlciBwYXRjaGVzLgoKU3RyaWN0bHkgc3Bl
YWtpbmcsIEknbSBub3Qgc3VyZSB0aGlzIGlzIHRydWUgaWYgd2UgZGVjaWRlIHRvIHBlcm1pdCBh
Cmd1ZXN0IHRvIHVwZGF0ZSBpdHMgbG9jYWwgQVBJQyBJRCwgYnV0IHdlIGRvbid0IGN1cnJlbnRs
eSBhbGxvdyB0aGlzIGFuZApJIHNlZSBubyBiZW5lZml0IGZyb20gc3VwcG9ydGluZyBpdC4KCn5B
bmRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
