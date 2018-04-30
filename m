From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH v2 1/2] SVM: re-work VMCB sync-ing
Date: Mon, 30 Apr 2018 11:56:22 -0400
Message-ID: <efe20d13-bbb1-3376-0e6c-4df376dc241f@oracle.com>
References: <5AE6ED2302000078001BF867@prv1-mh.provo.novell.com>
 <5AE6FFEA02000078001BF8A2@prv1-mh.provo.novell.com>
 <2eb0fe3c-7ff5-e731-d64c-8d04d082acce@oracle.com>
 <5AE73B5602000078001BFAEF@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=zpnp=ht=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1fDB7U-0008Q3-2Q
 for xen-devel@lists.xenproject.org; Mon, 30 Apr 2018 15:53:40 +0000
In-Reply-To: <5AE73B5602000078001BFAEF@prv1-mh.provo.novell.com>
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
Cc: Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMDQvMzAvMjAxOCAxMTo1MCBBTSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMzAuMDQu
MTggYXQgMTc6MzAsIDxib3Jpcy5vc3Ryb3Zza3lAb3JhY2xlLmNvbT4gd3JvdGU6Cj4+IE9uIDA0
LzMwLzIwMTggMDc6MzcgQU0sIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4gQEAgLTExNjgsNiArMTE2
OSw5IEBAIHN0YXRpYyB2b2lkIG5vcmV0dXJuIHN2bV9kb19yZXN1bWUoc3RydWMKPj4+ICAKPj4+
ICAgICAgaHZtX2RvX3Jlc3VtZSh2KTsKPj4+ICAKPj4+ICsgICAgaWYgKCB2LT5hcmNoLmh2bV9z
dm0udm1jYl9zeW5jX3N0YXRlID09IHZtY2JfbmVlZHNfdm1sb2FkICkKPj4+ICsgICAgICAgIHN2
bV9zeW5jX3ZtY2Iodiwgdm1jYl9uZWVkc192bXNhdmUpOwo+Pgo+PiBJcyBpdCBub3QgcG9zc2li
bGUgKG9yIGFkdmlzYWJsZSkgdG8gbW92ZSB0aGUgdGVzdCBpbnRvIHN2bV9zeW5jX3ZtY2IoKQo+
PiAoYW5kIGRyb3AgdGhlIEFTU0VSVCB0aGVyZSk/Cj4gSXQgaXMgcG9zc2libGU7IEknbSBub3Qg
c3VyZSBteXNlbGYgaWYgaXQncyBhZHZpc2FibGUsIGJ1dCBJIHRha2UgeW91IGFza2luZyB0aGUK
PiBxdWVzdGlvbiBhcyB5b3UgdGhpbmtpbmcgaXQgaXMsIHNvIEknbGwgY2hhbmdlIGl0LgoKVGhh
dCB3YXMgcmVhbGx5IHRoZSBtYWluIHJlYXNvbiBmb3IgbWUgYXNraW5nIHRvIG1vdmUgc3ZtX3Zt
bG9hZCBpbnRvCnN2bV9zeW5jX3ZtY2IoKSAtLS0gdG8gaGlkZSBhbGwgbG9naWMgcmVsYXRlZCB0
byB0aGUgc3luYyBzdGF0ZSBtYWNoaW5lCnRoZXJlLgoKCi1ib3JpcwoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
