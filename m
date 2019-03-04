From: Dave Young <dyoung@redhat.com>
Subject: Re: [PATCH v2 0/8] mm/kdump: allow to exclude pages
 that are logically offline
Date: Mon, 4 Mar 2019 14:21:18 +0800
Message-ID: <20190304062118.GA31037__28301.1753622972$1551680580$gmane$org@dhcp-128-65.nay.redhat.com>
References: <20181122100627.5189-1-david@redhat.com>
 <20190227053214.GA12302@dhcp-128-65.nay.redhat.com>
 <20190228114535.150dfaebbe4d00ae48716bf0@linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=seE6=RH=redhat.com=dyoung@srs-us1.protection.inumbo.net>)
 id 1h0gz0-0005yk-60
 for xen-devel@lists.xenproject.org; Mon, 04 Mar 2019 06:21:50 +0000
Content-Disposition: inline
In-Reply-To: <20190228114535.150dfaebbe4d00ae48716bf0@linux-foundation.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Pankaj gupta <pagupta@redhat.com>, Michal Hocko <mhocko@suse.com>, Lianbo Jiang <lijiang@redhat.com>, linux-doc@vger.kernel.org, pv-drivers@vmware.com, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Michal Hocko <mhocko@kernel.org>, linux-mm@kvack.org, Nadav Amit <namit@vmware.com>, Pavel Machek <pavel@ucw.cz>, Alexander Duyck <alexander.h.duyck@linux.intel.com>, "K. Y. Srinivasan" <kys@microsoft.com>, Omar Sandoval <osandov@fb.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Stefano Stabellini <sstabellini@kernel.org>, Stephen Hemminger <sthemmin@microsoft.com>, Baoquan He <bhe@redhat.com>, Jonathan Corbet <corbet@lwn.net>, David Hildenbrand <david@redhat.com>, Pavel Tatashin <pasha.tatashin@oracle.com>, Matthew Wilcox <willy@infradead.org>, Vlastimil Babka <vbabka@suse.cz>, David Rientjes <rientjes@google.com>, xen-devel@lists.xenproject.org, Alexey Dobriyan <adobriyan@gmail.>
List-Id: xen-devel@lists.xenproject.org

T24gMDIvMjgvMTkgYXQgMTE6NDVhbSwgQW5kcmV3IE1vcnRvbiB3cm90ZToKPiBPbiBXZWQsIDI3
IEZlYiAyMDE5IDEzOjMyOjE0ICswODAwIERhdmUgWW91bmcgPGR5b3VuZ0ByZWRoYXQuY29tPiB3
cm90ZToKPiAKPiA+IFRoaXMgc2VyaWVzIGhhdmUgYmVlbiBpbiAtbmV4dCBmb3Igc29tZSBkYXlz
LCBjb3VsZCB3ZSBnZXQgdGhpcyBpbgo+ID4gbWFpbmxpbmU/IAo+IAo+IEl0J3MgYmVlbiBpbiAt
bmV4dCBmb3IgdHdvIG1vbnRocz8KClNob3VsZCBiZSBhcm91bmQgMyBtb250aHMKCj4gCj4gPiBB
bmRyZXcsIGRvIHlvdSBoYXZlIHBsYW4gYWJvdXQgdGhlbSwgbWF5YmUgbmV4dCByZWxlYXNlPwo+
IAo+IFRoZXkncmUgYWxsIHJldmlld2VkIGV4Y2VwdCBmb3IgInhlbi9iYWxsb29uOiBtYXJrIGlu
ZmxhdGVkIHBhZ2VzCj4gUEdfb2ZmbGluZSIuIAo+IChodHRwczovL296bGFicy5vcmcvfmFrcG0v
bW1vdG0vYnJva2VuLW91dC94ZW4tYmFsbG9vbi1tYXJrLWluZmxhdGVkLXBhZ2VzLXBnX29mZmxp
bmUucGF0Y2gpLgo+IFllcywgSSBwbGFuIG9uIHNlbmRpbmcgdGhlc2UgdG8gTGludXMgZHVyaW5n
IHRoZSBtZXJnZSB3aW5kb3cgZm9yIDUuMQo+IAoKVGhhbmtzIQoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
