From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH v2 0/8] mm/kdump: allow to exclude pages
 that are logically offline
Date: Thu, 28 Feb 2019 11:45:35 -0800
Message-ID: <20190228114535.150dfaebbe4d00ae48716bf0__15914.7087646247$1551383212$gmane$org@linux-foundation.org>
References: <20181122100627.5189-1-david@redhat.com>
 <20190227053214.GA12302@dhcp-128-65.nay.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=RoGz=RD=linux-foundation.org=akpm@srs-us1.protection.inumbo.net>)
 id 1gzRcl-0003rH-Pp
 for xen-devel@lists.xenproject.org; Thu, 28 Feb 2019 19:45:43 +0000
In-Reply-To: <20190227053214.GA12302@dhcp-128-65.nay.redhat.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Dave Young <dyoung@redhat.com>
Cc: Pankaj gupta <pagupta@redhat.com>, Michal Hocko <mhocko@suse.com>, Lianbo Jiang <lijiang@redhat.com>, linux-doc@vger.kernel.org, pv-drivers@vmware.com, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Michal Hocko <mhocko@kernel.org>, linux-mm@kvack.org, Nadav Amit <namit@vmware.com>, Pavel Machek <pavel@ucw.cz>, Alexander Duyck <alexander.h.duyck@linux.intel.com>, "K. Y. Srinivasan" <kys@microsoft.com>, Omar Sandoval <osandov@fb.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Stefano Stabellini <sstabellini@kernel.org>, Stephen Hemminger <sthemmin@microsoft.com>, Baoquan He <bhe@redhat.com>, Jonathan Corbet <corbet@lwn.net>, David Hildenbrand <david@redhat.com>, Pavel Tatashin <pasha.tatashin@oracle.com>, Matthew Wilcox <willy@infradead.org>, Vlastimil Babka <vbabka@suse.cz>, David Rientjes <rientjes@google.com>, xen-devel@lists.xenproject.org, Alexey Dobriyan <adobriyan@gmail.>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCAyNyBGZWIgMjAxOSAxMzozMjoxNCArMDgwMCBEYXZlIFlvdW5nIDxkeW91bmdAcmVk
aGF0LmNvbT4gd3JvdGU6Cgo+IFRoaXMgc2VyaWVzIGhhdmUgYmVlbiBpbiAtbmV4dCBmb3Igc29t
ZSBkYXlzLCBjb3VsZCB3ZSBnZXQgdGhpcyBpbgo+IG1haW5saW5lPyAKCkl0J3MgYmVlbiBpbiAt
bmV4dCBmb3IgdHdvIG1vbnRocz8KCj4gQW5kcmV3LCBkbyB5b3UgaGF2ZSBwbGFuIGFib3V0IHRo
ZW0sIG1heWJlIG5leHQgcmVsZWFzZT8KClRoZXkncmUgYWxsIHJldmlld2VkIGV4Y2VwdCBmb3Ig
Inhlbi9iYWxsb29uOiBtYXJrIGluZmxhdGVkIHBhZ2VzClBHX29mZmxpbmUiLiAKKGh0dHBzOi8v
b3psYWJzLm9yZy9+YWtwbS9tbW90bS9icm9rZW4tb3V0L3hlbi1iYWxsb29uLW1hcmstaW5mbGF0
ZWQtcGFnZXMtcGdfb2ZmbGluZS5wYXRjaCkuClllcywgSSBwbGFuIG9uIHNlbmRpbmcgdGhlc2Ug
dG8gTGludXMgZHVyaW5nIHRoZSBtZXJnZSB3aW5kb3cgZm9yIDUuMQoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
