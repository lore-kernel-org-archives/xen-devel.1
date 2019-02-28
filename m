From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH v2 0/8] mm/kdump: allow to exclude pages
 that are logically offline
Date: Thu, 28 Feb 2019 14:54:47 -0500
Message-ID: <2d46475b-4f7e-7a71-b74e-abeaf31fca15__28019.0056467958$1551383820$gmane$org@oracle.com>
References: <20181122100627.5189-1-david@redhat.com>
 <20190227053214.GA12302@dhcp-128-65.nay.redhat.com>
 <20190228114535.150dfaebbe4d00ae48716bf0@linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=si1U=RD=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1gzRmj-0004tU-J4
 for xen-devel@lists.xenproject.org; Thu, 28 Feb 2019 19:56:01 +0000
In-Reply-To: <20190228114535.150dfaebbe4d00ae48716bf0@linux-foundation.org>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Morton <akpm@linux-foundation.org>, Dave Young <dyoung@redhat.com>
Cc: Pankaj gupta <pagupta@redhat.com>, Michal Hocko <mhocko@suse.com>, Lianbo Jiang <lijiang@redhat.com>, linux-doc@vger.kernel.org, pv-drivers@vmware.com, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Michal Hocko <mhocko@kernel.org>, linux-mm@kvack.org, Nadav Amit <namit@vmware.com>, Pavel Machek <pavel@ucw.cz>, Alexander Duyck <alexander.h.duyck@linux.intel.com>, "K. Y. Srinivasan" <kys@microsoft.com>, Omar Sandoval <osandov@fb.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Stefano Stabellini <sstabellini@kernel.org>, Stephen Hemminger <sthemmin@microsoft.com>, Baoquan He <bhe@redhat.com>, Jonathan Corbet <corbet@lwn.net>, David Hildenbrand <david@redhat.com>, Pavel Tatashin <pasha.tatashin@oracle.com>, Matthew Wilcox <willy@infradead.org>, Vlastimil Babka <vbabka@suse.cz>, David Rientjes <rientjes@google.com>, xen-devel@lists.xenproject.org, Alexey Dobriyan <adobriyan@gmail.>
List-Id: xen-devel@lists.xenproject.org

T24gMi8yOC8xOSAyOjQ1IFBNLCBBbmRyZXcgTW9ydG9uIHdyb3RlOgo+IE9uIFdlZCwgMjcgRmVi
IDIwMTkgMTM6MzI6MTQgKzA4MDAgRGF2ZSBZb3VuZyA8ZHlvdW5nQHJlZGhhdC5jb20+IHdyb3Rl
Ogo+Cj4+IFRoaXMgc2VyaWVzIGhhdmUgYmVlbiBpbiAtbmV4dCBmb3Igc29tZSBkYXlzLCBjb3Vs
ZCB3ZSBnZXQgdGhpcyBpbgo+PiBtYWlubGluZT8gCj4gSXQncyBiZWVuIGluIC1uZXh0IGZvciB0
d28gbW9udGhzPwo+Cj4+IEFuZHJldywgZG8geW91IGhhdmUgcGxhbiBhYm91dCB0aGVtLCBtYXli
ZSBuZXh0IHJlbGVhc2U/Cj4gVGhleSdyZSBhbGwgcmV2aWV3ZWQgZXhjZXB0IGZvciAieGVuL2Jh
bGxvb246IG1hcmsgaW5mbGF0ZWQgcGFnZXMKPiBQR19vZmZsaW5lIi4gCj4gKGh0dHBzOi8vb3ps
YWJzLm9yZy9+YWtwbS9tbW90bS9icm9rZW4tb3V0L3hlbi1iYWxsb29uLW1hcmstaW5mbGF0ZWQt
cGFnZXMtcGdfb2ZmbGluZS5wYXRjaCkuCj4gWWVzLCBJIHBsYW4gb24gc2VuZGluZyB0aGVzZSB0
byBMaW51cyBkdXJpbmcgdGhlIG1lcmdlIHdpbmRvdyBmb3IgNS4xCj4KCgpUaGlzIHdhcyByZXZp
ZXdlZDoKCmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xrbWwvM2Q1MjUwYjctODcwZS1lNzAyLWE2
ZTQtOTM3ZDIzNjJmZWE0QHN1c2UuY29tLwoKCgotYm9yaXMKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
