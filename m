From: Oscar Salvador <osalvador@suse.de>
Subject: Re: [PATCH v1] xen/balloon: Fix mapping PG_offline
 pages to user space
Date: Thu, 14 Mar 2019 16:49:10 +0100
Message-ID: <20190314154907.wcwh5ricj6v7p23v__22496.3623144262$1552578613$gmane$org@d104.suse.de>
References: <20190314154025.21128-1-david@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=gUzQ=RR=suse.de=osalvador@srs-us1.protection.inumbo.net>)
 id 1h4Sba-0003bV-As
 for xen-devel@lists.xenproject.org; Thu, 14 Mar 2019 15:49:14 +0000
Content-Disposition: inline
In-Reply-To: <20190314154025.21128-1-david@redhat.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: David Hildenbrand <david@redhat.com>
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Andrew Cooper <andrew.cooper3@citrix.com>, linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>, linux-mm@kvack.org, Julien Grall <julien.grall@arm.com>, Nadav Amit <namit@vmware.com>, xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>, akpm@linux-foundation.org
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBNYXIgMTQsIDIwMTkgYXQgMDQ6NDA6MjVQTSArMDEwMCwgRGF2aWQgSGlsZGVuYnJh
bmQgd3JvdGU6Cj4gQEAgLTY0Niw2ICs2NDcsNyBAQCB2b2lkIGZyZWVfeGVuYmFsbG9vbmVkX3Bh
Z2VzKGludCBucl9wYWdlcywgc3RydWN0IHBhZ2UgKipwYWdlcykKPiAgCj4gIAlmb3IgKGkgPSAw
OyBpIDwgbnJfcGFnZXM7IGkrKykgewo+ICAJCWlmIChwYWdlc1tpXSkKPiArCQkJX19TZXRQYWdl
T2ZmbGluZShwYWdlc1tpXSk7Cj4gIAkJCWJhbGxvb25fYXBwZW5kKHBhZ2VzW2ldKTsKCmRpZG4n
dCB5b3UgZm9yZ2V0IHt9IHRoZXJlPyA7LSkKCj4gIAl9Cj4gIAo+IC0tIAo+IDIuMTcuMgo+IAoK
LS0gCk9zY2FyIFNhbHZhZG9yClNVU0UgTDMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
