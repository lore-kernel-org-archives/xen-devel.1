From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [Qemu-devel] [PATCH] Xen PCI passthrough: fix
 passthrough failure when irq map failure
Date: Thu, 18 Oct 2018 15:56:36 +0100
Message-ID: <20181018145636.k6ptvn4iszabjhxw@mac.bytemobile.com>
References: <20181016021439.6212-1-yan.y.zhao@intel.com>
 <F22B14EC3CFBB843AD3E03B6B78F2C6A4ACFD80C@SHSMSX104.ccr.corp.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=jcqf=m6=citrix.com=prvs=822dd159c=roger.pau@srs-us1.protection.inumbo.net>)
 id 1gD9kY-00059m-R8
 for xen-devel@lists.xenproject.org; Thu, 18 Oct 2018 14:58:10 +0000
Content-Disposition: inline
In-Reply-To: <F22B14EC3CFBB843AD3E03B6B78F2C6A4ACFD80C@SHSMSX104.ccr.corp.intel.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: "Zhao, Yan Y" <yan.y.zhao@intel.com>
Cc: "anthony.perard@citrix.com" <anthony.perard@citrix.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "sstabellini@kernel.org" <sstabellini@kernel.org>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBPY3QgMTgsIDIwMTggYXQgMDg6MjI6NDFBTSArMDAwMCwgWmhhbywgWWFuIFkgd3Jv
dGU6Cj4gSGkKPiBUaGUgYmFja2dyb3VuZCBmb3IgdGhpcyBwYXRjaCBpcyB0aGF0OiBmb3Igc29t
ZSBwY2kgZGV2aWNlLCBldmVuIGl0J3MgUENJX0lOVEVSUlVQVF9QSU4gaXMgbm90IDAsIGl0IGFj
dHVhbGx5IGRvZXMgbm90IHN1cHBvcnQgSU5UeCBtb2RlLCBzbyB3ZSBzaG91bGQganVzdCByZXBv
cnQgZXJyb3IsIGRpc2FibGUgSU5UeCBtb2RlIGFuZCBjb250aW51ZSB0aGUgcGFzc3Rocm91Z2gu
Cj4gSG93ZXZlciwgdGhlIGNvbW1pdCA1YTExZDBmNyByZWdhcmRzIHRoaXMgYXMgZXJyb3IgY29u
ZGl0aW9uIGFuZCBsZXQgcWVtdSBxdWl0IHBhc3N0aHJvdWdoLCB3aGljaCBpcyB0b28gcmlnb3Jv
dXMuCj4gCj4gRXJyb3IgbWVzc2FnZSBpcyBiZWxvdzoKPiBsaWJ4bDogZXJyb3I6IGxpYnhsX3Ft
cC5jOjI4NzpxbXBfaGFuZGxlX2Vycm9yX3Jlc3BvbnNlOiBEb21haW4gMjpyZWNlaXZlZCBhbiBl
cnJvciBtZXNzYWdlIGZyb20gUU1QIHNlcnZlcjogTWFwcGluZyBtYWNoaW5lIGlycSAwIHRvIHBp
cnEgLTEgZmFpbGVkOiBPcGVyYXRpb24gbm90IHBlcm1pdHRlZAoKSSdtIGhhdmluZyBpc3N1ZXMg
ZmlndXJpbmcgb3V0IHdoYXQncyBoYXBwZW5pbmcgaGVyZS4Kcy0+cmVhbF9kZXZpY2UuaXJxIGlz
IDAsIHlldCB0aGUgUENJIGNvbmZpZyBzcGFjZSByZWFkIG9mClBDSV9JTlRFUlJVUFRfUElOIHJl
dHVybnMgc29tZXRoaW5nIGRpZmZlcmVudCB0aGFuIDAuCgpBRkFJQ1QgdGhpcyBpcyBkdWUgdG8g
c29tZSBraW5kIG9mIGVycm9yIGluIExpbnV4LCBzbyB0aGF0IGV2ZW4gd2hlbgp0aGUgZGV2aWNl
IGlzIHN1cHBvc2VkIHRvIGhhdmUgYSB2YWxpZCBJUlEgdGhlIHN5c2ZzIG5vZGUgaXQgaXMgc2V0
IHRvCjAsIGRvIHlvdSBrbm93IHRoZSBhY3R1YWwgdW5kZXJseWluZyBjYXVzZSBvZiB0aGlzPwoK
VGhhbmtzLCBSb2dlci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
