From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v2] xen/balloon: Fix mapping PG_offline
 pages to user space
Date: Thu, 14 Mar 2019 17:05:33 +0100
Message-ID: <d02a354b-6b40-6fd9-b09b-debfee7d2071__11969.083016605$1552579602$gmane$org@suse.com>
References: <20190314160256.21713-1-david@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=X/If=RR=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1h4SrS-0006CR-NQ
 for xen-devel@lists.xenproject.org; Thu, 14 Mar 2019 16:05:38 +0000
In-Reply-To: <20190314160256.21713-1-david@redhat.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: David Hildenbrand <david@redhat.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Andrew Cooper <andrew.cooper3@citrix.com>, linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>, linux-mm@kvack.org, Julien Grall <julien.grall@arm.com>, Nadav Amit <namit@vmware.com>, Jan Beulich <JBeulich@suse.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, akpm@linux-foundation.org, Oscar Salvador <osalvador@suse.de>
List-Id: xen-devel@lists.xenproject.org

T24gMTQvMDMvMjAxOSAxNzowMiwgRGF2aWQgSGlsZGVuYnJhbmQgd3JvdGU6Cj4gVGhlIFhFTiBi
YWxsb29uIGRyaXZlciAtIGluIGNvbnRyYXN0IHRvIG90aGVyIGJhbGxvb24gZHJpdmVycyAtIGFs
bG93cwo+IHRvIG1hcCBzb21lIGluZmxhdGVkIHBhZ2VzIHRvIHVzZXIgc3BhY2UuIFN1Y2ggcGFn
ZXMgYXJlIGFsbG9jYXRlZCB2aWEKPiBhbGxvY194ZW5iYWxsb29uZWRfcGFnZXMoKSBhbmQgZnJl
ZWQgdmlhIGZyZWVfeGVuYmFsbG9vbmVkX3BhZ2VzKCkuCj4gVGhlIHBmbiBzcGFjZSBvZiB0aGVz
ZSBhbGxvY2F0ZWQgcGFnZXMgaXMgdXNlZCB0byBtYXAgb3RoZXIgdGhpbmdzCj4gYnkgdGhlIGh5
cGVydmlzb3IgdXNpbmcgaHlwZXJjYWxscy4KPiAKPiBQYWdlcyBtYXJrZWQgd2l0aCBQR19vZmZs
aW5lIG11c3QgbmV2ZXIgYmUgbWFwcGVkIHRvIHVzZXIgc3BhY2UgKGFzCj4gdGhpcyBwYWdlIHR5
cGUgdXNlcyB0aGUgbWFwY291bnQgZmllbGQgb2Ygc3RydWN0IHBhZ2VzKS4KPiAKPiBTbyB3aGF0
IHdlIGNhbiBkbyBpcywgY2xlYXIvc2V0IFBHX29mZmxpbmUgd2hlbiBhbGxvY2F0aW5nL2ZyZWVp
bmcgYW4KPiBpbmZsYXRlZCBwYWdlcy4gVGhpcyB3YXksIG1vc3QgaW5mbGF0ZWQgcGFnZXMgY2Fu
IGJlIGV4Y2x1ZGVkIGJ5Cj4gZHVtcGluZyB0b29scyBhbmQgdGhlICJyZXVzZWQgZm9yIG90aGVy
IHB1cnBvc2UiIGJhbGxvb24gcGFnZXMgYXJlCj4gY29ycmVjdGx5IG5vdCBtYXJrZWQgYXMgUEdf
b2ZmbGluZS4KPiAKPiBGaXhlczogNzdjNGFkZjZhNmRmICh4ZW4vYmFsbG9vbjogbWFyayBpbmZs
YXRlZCBwYWdlcyBQR19vZmZsaW5lKQo+IFJlcG9ydGVkLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGll
bi5ncmFsbEBhcm0uY29tPgo+IFRlc3RlZC1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxA
YXJtLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBEYXZpZCBIaWxkZW5icmFuZCA8ZGF2aWRAcmVkaGF0
LmNvbT4KClJldmlld2VkLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+CgoKSnVl
cmdlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
