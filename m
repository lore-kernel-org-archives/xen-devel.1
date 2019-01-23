From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] xen/sched: Introduce domain_vcpu() helper
Date: Wed, 23 Jan 2019 17:44:57 +0000
Message-ID: <c37e5578-845d-e029-7362-b456db84dc7c@citrix.com>
References: <1548255569-23334-1-git-send-email-andrew.cooper3@citrix.com>
 <5C489DD8020000780021088F@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <5C489DD8020000780021088F@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Xen-devel <xen-devel@lists.xen.org>, Julien Grall <julien.grall@arm.com>, nmanthey@amazon.de, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjMvMDEvMjAxOSAxNzowMSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMjMuMDEuMTkg
YXQgMTU6NTksIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPiB3cm90ZToKPj4gK3N0YXRpYyBp
bmxpbmUgc3RydWN0IHZjcHUgKmRvbWFpbl92Y3B1KGNvbnN0IHN0cnVjdCBkb21haW4gKmQsCj4+
ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBpbnQgdmNw
dV9pZCkKPj4gK3sKPj4gKyAgICB1bnNpZ25lZCBpbnQgaWR4ID0gYXJyYXlfaW5kZXhfbm9zcGVj
KHZjcHVfaWQsIGQtPm1heF92Y3B1cyk7Cj4+ICsKPj4gKyAgICByZXR1cm4gaWR4ID49IGQtPm1h
eF92Y3B1cyA/IE5VTEwgOiBkLT52Y3B1W2lkeF07Cj4+ICt9Cj4gRm9yIGFuIG91dCBvZiBib3Vu
ZHMgaW5jb21pbmcgdmNwdV9pZCwgaXNuJ3QgaXQgdGhlIGNhc2UgdGhhdAo+IGlkeCB0aGVuIHdv
dWxkIGJlIHplcm8/IEluIHdoaWNoIGNhc2UgeW91J2QgcmV0dXJuIGQtPnZjcHVbMF0KPiBpbnN0
ZWFkIG9mIE5VTEw/CgpTcGVjdWxhdGl2ZWx5LCB5ZXMuwqAgYXJyYXlfaW5kZXhfbm9zcGVjKCkg
d29ya3MgYnkgZm9yY2luZyBzcGVjdWxhdGl2ZQptaXMtYWNjZXNzZXMgdG8gb3BlcmF0ZSBhcyBp
ZiBpdCByZXF1ZXN0IGhhZCBiZWVuIGZvciBpbmRleCAwLgoKV2hhdCBtYXR0ZXJzIGZyb20gYSBk
YXRhLWxlYWtpbmcgcGVyc3BlY3RpdmUgaXMgd2hldGhlciBkLT52Y3B1W2lkeF0sCndoZW4gZXhl
Y3V0ZWQgc3BlY3VsYXRpdmUsIGVuZHMgdXAgYmVpbmcgb3V0LW9mLWJvdW5kcyBvciBub3QuwqAg
aS5lLgp3aGV0aGVyIGl0IGlzIGRpc3Rpbmd1aXNoYWJsZSBmcm9tIGEgcGF0aCB3aGljaCBjYW4g
YXJjaGl0ZWN0dXJhbGx5IGJlCnRha2VuLgoKfkFuZHJldwoKUC5TLiBpbmRleCAwIGlzIGFjdHVh
bGx5IGJldHRlciB0aGFuIE5VTEwgb24gYW55IGhhcmR3YXJlIGxhY2tpbmcgU01BUCwKYmVjYXVz
ZSB5b3Ugd29uJ3QgcG90ZW50aWFsbHkgdXNlIGd1ZXN0LWNvbnRyb2xsZWQgZGF0YSBmcm9tIDAg
ZHVyaW5nCnRoZSBzdWJzZXF1ZW50IHNwZWN1bGF0aW9uLgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
