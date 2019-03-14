From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v1] xen/balloon: Fix mapping PG_offline
 pages to user space
Date: Thu, 14 Mar 2019 09:49:17 -0600
Message-ID: <5C8A77FD020000780021EC87__13583.6961607978$1552578613$gmane$org@prv1-mh.provo.novell.com>
References: <20190314154025.21128-1-david@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=U6t1=RR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1h4Sbg-0003bn-QS
 for xen-devel@lists.xenproject.org; Thu, 14 Mar 2019 15:49:20 +0000
In-Reply-To: <20190314154025.21128-1-david@redhat.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: David Hildenbrand <david@redhat.com>
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Andrew Cooper <andrew.cooper3@citrix.com>, linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>, linux-mm@kvack.org, Julien Grall <julien.grall@arm.com>, Nadav Amit <namit@vmware.com>, xen-devel <xen-devel@lists.xenproject.org>, akpm@linux-foundation.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE0LjAzLjE5IGF0IDE2OjQwLCA8ZGF2aWRAcmVkaGF0LmNvbT4gd3JvdGU6Cj4gLS0t
IGEvZHJpdmVycy94ZW4vYmFsbG9vbi5jCj4gKysrIGIvZHJpdmVycy94ZW4vYmFsbG9vbi5jCj4g
QEAgLTYwNCw2ICs2MDQsNyBAQCBpbnQgYWxsb2NfeGVuYmFsbG9vbmVkX3BhZ2VzKGludCBucl9w
YWdlcywgc3RydWN0IHBhZ2UgKipwYWdlcykKPiAgCXdoaWxlIChwZ25vIDwgbnJfcGFnZXMpIHsK
PiAgCQlwYWdlID0gYmFsbG9vbl9yZXRyaWV2ZSh0cnVlKTsKPiAgCQlpZiAocGFnZSkgewo+ICsJ
CQlfX0NsZWFyUGFnZU9mZmxpbmUocGFnZSk7Cj4gIAkJCXBhZ2VzW3Bnbm8rK10gPSBwYWdlOwoK
V2hpbGUgdGhpcyBvbmUncyBmaW5lLCAuLi4KCj4gQEAgLTY0Niw2ICs2NDcsNyBAQCB2b2lkIGZy
ZWVfeGVuYmFsbG9vbmVkX3BhZ2VzKGludCBucl9wYWdlcywgc3RydWN0IHBhZ2UgKipwYWdlcykK
PiAgCj4gIAlmb3IgKGkgPSAwOyBpIDwgbnJfcGFnZXM7IGkrKykgewo+ICAJCWlmIChwYWdlc1tp
XSkKPiArCQkJX19TZXRQYWdlT2ZmbGluZShwYWdlc1tpXSk7Cj4gIAkJCWJhbGxvb25fYXBwZW5k
KHBhZ2VzW2ldKTsKPiAgCX0KCi4uLiBJIHRoaW5rIHlvdSB3YW50IHRvIGFkZCBhIHBhaXIgb2Yg
YnJhY2VzIGhlcmUuCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
