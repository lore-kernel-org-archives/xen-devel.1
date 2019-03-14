From: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v1] xen/balloon: Fix mapping PG_offline
 pages to user space
Date: Thu, 14 Mar 2019 16:59:50 +0100
Message-ID: <2268eedd-65f6-4715-792f-702bfca4659c__45117.1270267636$1552579260$gmane$org@redhat.com>
References: <20190314154025.21128-1-david@redhat.com>
 <20190314154907.wcwh5ricj6v7p23v@d104.suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=mfUP=RR=redhat.com=david@srs-us1.protection.inumbo.net>)
 id 1h4Slv-0004cY-Ij
 for xen-devel@lists.xenproject.org; Thu, 14 Mar 2019 15:59:55 +0000
In-Reply-To: <20190314154907.wcwh5ricj6v7p23v@d104.suse.de>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Oscar Salvador <osalvador@suse.de>
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Andrew Cooper <andrew.cooper3@citrix.com>, linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>, linux-mm@kvack.org, Julien Grall <julien.grall@arm.com>, Nadav Amit <namit@vmware.com>, xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>, akpm@linux-foundation.org
List-Id: xen-devel@lists.xenproject.org

T24gMTQuMDMuMTkgMTY6NDksIE9zY2FyIFNhbHZhZG9yIHdyb3RlOgo+IE9uIFRodSwgTWFyIDE0
LCAyMDE5IGF0IDA0OjQwOjI1UE0gKzAxMDAsIERhdmlkIEhpbGRlbmJyYW5kIHdyb3RlOgo+PiBA
QCAtNjQ2LDYgKzY0Nyw3IEBAIHZvaWQgZnJlZV94ZW5iYWxsb29uZWRfcGFnZXMoaW50IG5yX3Bh
Z2VzLCBzdHJ1Y3QgcGFnZSAqKnBhZ2VzKQo+PiAgCj4+ICAJZm9yIChpID0gMDsgaSA8IG5yX3Bh
Z2VzOyBpKyspIHsKPj4gIAkJaWYgKHBhZ2VzW2ldKQo+PiArCQkJX19TZXRQYWdlT2ZmbGluZShw
YWdlc1tpXSk7Cj4+ICAJCQliYWxsb29uX2FwcGVuZChwYWdlc1tpXSk7Cj4gCj4gZGlkbid0IHlv
dSBmb3JnZXQge30gdGhlcmU/IDstKQo+IAoKVGhhdCdzIHdoYXQgaGFwcGVucyB3aGVuIHlvdSBz
dGFzaGVkIHRoZSBvcmlnaW5hbCBwYXRjaCBhbmQgdHJ5IHRvCnJlY3JlYXRlIGl0IHF1aWNrbHkg
ZnJvbSBhIG1haWwgOykKClRoYW5rcyEKCgotLSAKClRoYW5rcywKCkRhdmlkIC8gZGhpbGRlbmIK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
