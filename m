From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v2] xen/balloon: Fix mapping PG_offline
 pages to user space
Date: Fri, 15 Mar 2019 15:53:54 +0100
Message-ID: <a889fdc1-c857-eb94-1f5e-21943c182e4f__32376.2205125362$1552661698$gmane$org@suse.com>
References: <20190314160256.21713-1-david@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=YWx5=RS=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1h4oDf-0007eg-BE
 for xen-devel@lists.xenproject.org; Fri, 15 Mar 2019 14:53:59 +0000
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
LmNvbT4KClB1c2hlZCB0byB4ZW4vdGlwLmdpdCBmb3ItbGludXMtNS4xYgoKCkp1ZXJnZW4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
