From: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v1] mm/memory_hotplug: drop "online"
 parameter from add_memory_resource()
Date: Fri, 23 Nov 2018 13:58:16 +0100
Message-ID: <a97fcf28-ef71-2b49-c25c-bc96cff8366b__41599.6538628407$1542977829$gmane$org@redhat.com>
References: <20181123123740.27652-1-david@redhat.com>
 <20181123125400.GL8625@dhcp22.suse.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=np75=oc=redhat.com=david@srs-us1.protection.inumbo.net>)
 id 1gQB2N-00057G-2z
 for xen-devel@lists.xenproject.org; Fri, 23 Nov 2018 12:58:23 +0000
In-Reply-To: <20181123125400.GL8625@dhcp22.suse.cz>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Michal Hocko <mhocko@kernel.org>
Cc: Juergen Gross <jgross@suse.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Stefano Stabellini <sstabellini@kernel.org>, Mathieu Malaterre <malat@debian.org>, Joonsoo Kim <iamjoonsoo.kim@lge.com>, Dan Williams <dan.j.williams@intel.com>, linux-kernel@vger.kernel.org, Pavel Tatashin <pasha.tatashin@oracle.com>, linux-mm@kvack.org, Arun KS <arunks@codeaurora.org>, xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Andrew Morton <akpm@linux-foundation.org>, Oscar Salvador <osalvador@suse.de>
List-Id: xen-devel@lists.xenproject.org

T24gMjMuMTEuMTggMTM6NTQsIE1pY2hhbCBIb2NrbyB3cm90ZToKPiBPbiBGcmkgMjMtMTEtMTgg
MTM6Mzc6NDAsIERhdmlkIEhpbGRlbmJyYW5kIHdyb3RlOgo+PiBVc2VyIHNwYWNlIHNob3VsZCBh
bHdheXMgYmUgaW4gY2hhcmdlIG9mIGhvdyB0byBvbmxpbmUgbWVtb3J5IGFuZAo+PiBpZiBtZW1v
cnkgc2hvdWxkIGJlIG9ubGluZWQgYXV0b21hdGljYWxseSBpbiB0aGUga2VybmVsLiBMZXQncyBk
cm9wIHRoZQo+PiBwYXJhbWV0ZXIgdG8gb3ZlcndyaXRlIHRoaXMgLSBYRU4gcGFzc2VzIG1lbWhw
X2F1dG9fb25saW5lLCBqdXN0IGxpa2UKPj4gYWRkX21lbW9yeSgpLCBzbyB3ZSBjYW4gZGlyZWN0
bHkgdXNlIHRoYXQgaW5zdGVhZCBpbnRlcm5hbGx5Lgo+IAo+IEhlaCwgSSB3YW50ZWQgdG8gZ2V0
IHJpZCBvZiBtZW1ocF9hdXRvX29ubGluZSBzbyBtdWNoIGFuZCBub3cgd2UgaGF2ZSBpdAo+IGlu
IHRoZSBjb3JlIG1lbW9yeV9ob3RwbHVnLiBOb3QgYSB3aW4gb24gbXkgc2lkZSBJIHdvdWxkIHNh
eSA6LwoKVGhhdCBpcyBhY3R1YWxseSBhIGdvb2QgcG9pbnQ6IENhbiB3ZSByZW1vdmUgbWVtaHBf
YXV0b19vbmxpbmUgb3IgaXMgaXQKYWxyZWFkeSBzb21lIHNvcnQgb2Yga2VybmVsIEFCST8KCihh
cyBpdCBpcyBleHBvcnRlZCB2aWEgL3N5cy9kZXZpY2VzL3N5c3RlbS9tZW1vcnkvYXV0b19vbmxp
bmVfYmxvY2tzKQoKPiBPbiB0aGUgb3RoZXIgaGFuZCB0aGlzIGNhbiBiZSBzZWVuIGFzIGEgY2xl
YW51cCBiZWNhdXNlIGl0IHJlbW92ZXMgdGhhdAo+IGFtYmlndWl0eSB0aGF0IHNvbWUgY2FsbGVy
cyBtaWdodCBiZSB1bmF3YXJlIG9mIHRoZSBtZW1ocF9hdXRvX29ubGluZQo+IGxlYWRpbmcgdG8g
YSBkaWZmZXJlbnQgYmVoYXZpb3IuCgpJIHdvdWxkIHNheSB0aGlzIHBhdGNoIGlzIGEgc3RlcCBp
bnRvIHRoZSByaWdodCBkaXJlY3Rpb24gLSByZW1vdmUgdGhlCmZsYWcgZnJvbSB0aGUgaW50ZXJm
YWNlcywgdGhlbiBkcm9wIGl0IChldmVudHVhbGx5LCBhcyBzdGF0ZWQgbm90IHN1cmUKaWYgdGhh
dCB0cmFpbiBoYXMgbGVmdCB0aGUgc3RhdGlvbikuCgo+IAo+PiBDYzogQm9yaXMgT3N0cm92c2t5
IDxib3Jpcy5vc3Ryb3Zza3lAb3JhY2xlLmNvbT4KPj4gQ2M6IEp1ZXJnZW4gR3Jvc3MgPGpncm9z
c0BzdXNlLmNvbT4KPj4gQ2M6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVs
Lm9yZz4KPj4gQ2M6IEFuZHJldyBNb3J0b24gPGFrcG1AbGludXgtZm91bmRhdGlvbi5vcmc+Cj4+
IENjOiBEYW4gV2lsbGlhbXMgPGRhbi5qLndpbGxpYW1zQGludGVsLmNvbT4KPj4gQ2M6IE9zY2Fy
IFNhbHZhZG9yIDxvc2FsdmFkb3JAc3VzZS5kZT4KPj4gQ2M6IFBhdmVsIFRhdGFzaGluIDxwYXNo
YS50YXRhc2hpbkBvcmFjbGUuY29tPgo+PiBDYzogTWljaGFsIEhvY2tvIDxtaG9ja29Ac3VzZS5j
b20+Cj4+IENjOiBEYXZpZCBIaWxkZW5icmFuZCA8ZGF2aWRAcmVkaGF0LmNvbT4KPj4gQ2M6IEpv
b25zb28gS2ltIDxpYW1qb29uc29vLmtpbUBsZ2UuY29tPgo+PiBDYzogQXJ1biBLUyA8YXJ1bmtz
QGNvZGVhdXJvcmEub3JnPgo+PiBDYzogTWF0aGlldSBNYWxhdGVycmUgPG1hbGF0QGRlYmlhbi5v
cmc+Cj4+IENjOiBTdGVwaGVuIFJvdGh3ZWxsIDxzZnJAY2FuYi5hdXVnLm9yZy5hdT4KPj4gU2ln
bmVkLW9mZi1ieTogRGF2aWQgSGlsZGVuYnJhbmQgPGRhdmlkQHJlZGhhdC5jb20+Cj4gCj4gQWNr
ZWQtYnk6IE1pY2hhbCBIb2NrbyA8bWhvY2tvQHN1c2UuY29tPgo+IAoKCi0tIAoKVGhhbmtzLAoK
RGF2aWQgLyBkaGlsZGVuYgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
