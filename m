From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] xen: Fix inconsistent callers of panic()
Date: Mon, 10 Sep 2018 03:33:09 -0600
Message-ID: <5B963A5502000078001E6A7E@prv1-mh.provo.novell.com>
References: <1535632297-29549-1-git-send-email-andrew.cooper3@citrix.com>
 <5B87FA3102000078001E38B7@prv1-mh.provo.novell.com>
 <e5ad89df-4408-259b-7a34-1c242c3fb931@citrix.com>
 <5B88E15002000078001E3BBD@prv1-mh.provo.novell.com>
 <18cd971c-d5c3-9cc0-0bfe-10a295e87665@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <18cd971c-d5c3-9cc0-0bfe-10a295e87665@citrix.com>
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
Cc: Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA3LjA5LjE4IGF0IDE4OjQyLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gW01lcmdpbmcgcGFydCBvZiB0aGUgbGF0ZXIgY29udmVyc2lvbl0KPiAKPiBSZWR1Y2lu
ZyB0aGUgbnVtYmVyIG9mIGxpbmVzIHByaW50ZWQgZnJvbSBhIHBhbmljL2JhY2t0cmFjZSBtYXkg
YmUgYQo+IGdvb2QgdGhpbmcsIGJ1dCBwbGVhc2UgY2FuIHdlIG5vdCBjb25mbGF0ZSBpdCB3aXRo
IHRoaXMgd2hpY2ggaXMgZml4IGFuCj4gQVBJIGluY29uc2lzdGVuY3kuCgpXZWxsLCBsYXRlciBv
biBpbiB0aGUgY29udmVyc2lvbiBJJ3ZlIGFsc28gYWdyZWVkIHRoYXQgZHVlIHRvIHRoZQpleHRy
YSBzdHVmZiBnZXR0aW5nIGxvZ2dlZCwgeW91ciBjaGFuZ2UgaXMgcGVyaGFwcyB0aGUgYmVzdCB0
aGF0CmNhbiBiZSBkb25lIGF0IHRoaXMgcG9pbnQgaW4gdGltZS4gRmVlbCBmcmVlIHRvIHJlYWQg
dGhpcyBhcwpBY2tlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKSmFuCgoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
