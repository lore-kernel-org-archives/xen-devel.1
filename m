From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v1] mm/memory_hotplug: drop "online"
 parameter from add_memory_resource()
Date: Fri, 23 Nov 2018 14:23:16 +0100
Message-ID: <60a53b1b-bfbc-79d1-6151-e0779577ab6c__31546.6535314501$1542979337$gmane$org@suse.com>
References: <20181123123740.27652-1-david@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=H732=OC=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1gQBQc-0008UK-Kc
 for xen-devel@lists.xenproject.org; Fri, 23 Nov 2018 13:23:26 +0000
In-Reply-To: <20181123123740.27652-1-david@redhat.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: David Hildenbrand <david@redhat.com>, linux-mm@kvack.org
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Stefano Stabellini <sstabellini@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Mathieu Malaterre <malat@debian.org>, Joonsoo Kim <iamjoonsoo.kim@lge.com>, linux-kernel@vger.kernel.org, Pavel Tatashin <pasha.tatashin@oracle.com>, Michal Hocko <mhocko@suse.com>, Arun KS <arunks@codeaurora.org>, xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Dan Williams <dan.j.williams@intel.com>, Oscar Salvador <osalvador@suse.de>
List-Id: xen-devel@lists.xenproject.org

T24gMjMvMTEvMjAxOCAxMzozNywgRGF2aWQgSGlsZGVuYnJhbmQgd3JvdGU6Cj4gVXNlciBzcGFj
ZSBzaG91bGQgYWx3YXlzIGJlIGluIGNoYXJnZSBvZiBob3cgdG8gb25saW5lIG1lbW9yeSBhbmQK
PiBpZiBtZW1vcnkgc2hvdWxkIGJlIG9ubGluZWQgYXV0b21hdGljYWxseSBpbiB0aGUga2VybmVs
LiBMZXQncyBkcm9wIHRoZQo+IHBhcmFtZXRlciB0byBvdmVyd3JpdGUgdGhpcyAtIFhFTiBwYXNz
ZXMgbWVtaHBfYXV0b19vbmxpbmUsIGp1c3QgbGlrZQo+IGFkZF9tZW1vcnkoKSwgc28gd2UgY2Fu
IGRpcmVjdGx5IHVzZSB0aGF0IGluc3RlYWQgaW50ZXJuYWxseS4KPiAKPiBDYzogQm9yaXMgT3N0
cm92c2t5IDxib3Jpcy5vc3Ryb3Zza3lAb3JhY2xlLmNvbT4KPiBDYzogSnVlcmdlbiBHcm9zcyA8
amdyb3NzQHN1c2UuY29tPgo+IENjOiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtl
cm5lbC5vcmc+Cj4gQ2M6IEFuZHJldyBNb3J0b24gPGFrcG1AbGludXgtZm91bmRhdGlvbi5vcmc+
Cj4gQ2M6IERhbiBXaWxsaWFtcyA8ZGFuLmoud2lsbGlhbXNAaW50ZWwuY29tPgo+IENjOiBPc2Nh
ciBTYWx2YWRvciA8b3NhbHZhZG9yQHN1c2UuZGU+Cj4gQ2M6IFBhdmVsIFRhdGFzaGluIDxwYXNo
YS50YXRhc2hpbkBvcmFjbGUuY29tPgo+IENjOiBNaWNoYWwgSG9ja28gPG1ob2Nrb0BzdXNlLmNv
bT4KPiBDYzogRGF2aWQgSGlsZGVuYnJhbmQgPGRhdmlkQHJlZGhhdC5jb20+Cj4gQ2M6IEpvb25z
b28gS2ltIDxpYW1qb29uc29vLmtpbUBsZ2UuY29tPgo+IENjOiBBcnVuIEtTIDxhcnVua3NAY29k
ZWF1cm9yYS5vcmc+Cj4gQ2M6IE1hdGhpZXUgTWFsYXRlcnJlIDxtYWxhdEBkZWJpYW4ub3JnPgo+
IENjOiBTdGVwaGVuIFJvdGh3ZWxsIDxzZnJAY2FuYi5hdXVnLm9yZy5hdT4KPiBTaWduZWQtb2Zm
LWJ5OiBEYXZpZCBIaWxkZW5icmFuZCA8ZGF2aWRAcmVkaGF0LmNvbT4KCkFja2VkLWJ5OiBKdWVy
Z2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+CgoKSnVlcmdlbgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
