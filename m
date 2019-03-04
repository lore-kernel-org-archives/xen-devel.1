From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v2 0/8] mm/kdump: allow to exclude pages
 that are logically offline
Date: Mon, 4 Mar 2019 08:14:52 +0100
Message-ID: <2fb07c46-79c8-a49e-1b05-ffb33ad6c7da__47523.8906148419$1551683778$gmane$org@suse.com>
References: <20181122100627.5189-1-david@redhat.com>
 <20190227053214.GA12302@dhcp-128-65.nay.redhat.com>
 <20190228114535.150dfaebbe4d00ae48716bf0@linux-foundation.org>
 <20190304062118.GA31037@dhcp-128-65.nay.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=5FLX=RH=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1h0hoZ-0000sM-EM
 for xen-devel@lists.xenproject.org; Mon, 04 Mar 2019 07:15:07 +0000
In-Reply-To: <20190304062118.GA31037@dhcp-128-65.nay.redhat.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Dave Young <dyoung@redhat.com>, Andrew Morton <akpm@linux-foundation.org>
Cc: Pankaj gupta <pagupta@redhat.com>, Michal Hocko <mhocko@suse.com>, Lianbo Jiang <lijiang@redhat.com>, linux-doc@vger.kernel.org, pv-drivers@vmware.com, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Michal Hocko <mhocko@kernel.org>, linux-mm@kvack.org, Nadav Amit <namit@vmware.com>, Pavel Machek <pavel@ucw.cz>, Alexander Duyck <alexander.h.duyck@linux.intel.com>, "K. Y. Srinivasan" <kys@microsoft.com>, Omar Sandoval <osandov@fb.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Stefano Stabellini <sstabellini@kernel.org>, Stephen Hemminger <sthemmin@microsoft.com>, Baoquan He <bhe@redhat.com>, Jonathan Corbet <corbet@lwn.net>, David Hildenbrand <david@redhat.com>, Pavel Tatashin <pasha.tatashin@oracle.com>, Matthew Wilcox <willy@infradead.org>, Vlastimil Babka <vbabka@suse.cz>, David Rientjes <rientjes@google.com>, xen-devel@lists.xenproject.org, Alexey Dobriyan <adobriyan@gmail.>
List-Id: xen-devel@lists.xenproject.org

T24gMDQvMDMvMjAxOSAwNzoyMSwgRGF2ZSBZb3VuZyB3cm90ZToKPiBPbiAwMi8yOC8xOSBhdCAx
MTo0NWFtLCBBbmRyZXcgTW9ydG9uIHdyb3RlOgo+PiBPbiBXZWQsIDI3IEZlYiAyMDE5IDEzOjMy
OjE0ICswODAwIERhdmUgWW91bmcgPGR5b3VuZ0ByZWRoYXQuY29tPiB3cm90ZToKPj4KPj4+IFRo
aXMgc2VyaWVzIGhhdmUgYmVlbiBpbiAtbmV4dCBmb3Igc29tZSBkYXlzLCBjb3VsZCB3ZSBnZXQg
dGhpcyBpbgo+Pj4gbWFpbmxpbmU/IAo+Pgo+PiBJdCdzIGJlZW4gaW4gLW5leHQgZm9yIHR3byBt
b250aHM/Cj4gCj4gU2hvdWxkIGJlIGFyb3VuZCAzIG1vbnRocwo+IAo+Pgo+Pj4gQW5kcmV3LCBk
byB5b3UgaGF2ZSBwbGFuIGFib3V0IHRoZW0sIG1heWJlIG5leHQgcmVsZWFzZT8KPj4KPj4gVGhl
eSdyZSBhbGwgcmV2aWV3ZWQgZXhjZXB0IGZvciAieGVuL2JhbGxvb246IG1hcmsgaW5mbGF0ZWQg
cGFnZXMKPj4gUEdfb2ZmbGluZSIuIAo+PiAoaHR0cHM6Ly9vemxhYnMub3JnL35ha3BtL21tb3Rt
L2Jyb2tlbi1vdXQveGVuLWJhbGxvb24tbWFyay1pbmZsYXRlZC1wYWdlcy1wZ19vZmZsaW5lLnBh
dGNoKS4KCkkgZGlkIHJldmlldyB0aGF0IG9uZToKCmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xr
bWwvM2Q1MjUwYjctODcwZS1lNzAyLWE2ZTQtOTM3ZDIzNjJmZWE0QHN1c2UuY29tLwoKCkp1ZXJn
ZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
