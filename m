From: Michal Hocko <mhocko@kernel.org>
Subject: Re: [PATCH] mm: don't defer struct page initialization
 for Xen pv guests
Date: Fri, 16 Feb 2018 15:28:08 +0100
Message-ID: <20180216142808.GS7275__40782.461842946$1518791264$gmane$org@dhcp22.suse.cz>
References: <20180216133726.30813-1-jgross@suse.com>
 <20180216135940.GQ7275@dhcp22.suse.cz>
 <1424bb25-7d6a-ee21-83b4-0e90369d6132@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=rgff=fk=kernel.org=mhocko@srs-us1.protection.inumbo.net>)
 id 1emgzk-0005jy-UY
 for xen-devel@lists.xenproject.org; Fri, 16 Feb 2018 14:28:12 +0000
Content-Disposition: inline
In-Reply-To: <1424bb25-7d6a-ee21-83b4-0e90369d6132@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: Pavel Tatashin <pasha.tatashin@oracle.com>, stable@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, xen-devel@lists.xenproject.org, akpm@linux-foundation.org
List-Id: xen-devel@lists.xenproject.org

T24gRnJpIDE2LTAyLTE4IDE1OjAyOjE3LCBKdWVyZ2VuIEdyb3NzIHdyb3RlOgo+IE9uIDE2LzAy
LzE4IDE0OjU5LCBNaWNoYWwgSG9ja28gd3JvdGU6Cj4gPiBbQ0MgUGF2ZWxdCj4gPiAKPiA+IE9u
IEZyaSAxNi0wMi0xOCAxNDozNzoyNiwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiA+PiBDb21taXQg
ZjdmOTkxMDBkOGQ5NWRiY2YwOWUwMjE2YTE0MzIxMWU3OTQxOGI5ZiAoIm1tOiBzdG9wIHplcm9p
bmcKPiA+PiBtZW1vcnkgZHVyaW5nIGFsbG9jYXRpb24gaW4gdm1lbW1hcCIpIGJyb2tlIFhlbiBw
diBkb21haW5zIGluIHNvbWUKPiA+PiBjb25maWd1cmF0aW9ucywgYXMgdGhlICJQaW5uZWQiIGlu
Zm9ybWF0aW9uIGluIHN0cnVjdCBwYWdlIG9mIGVhcmx5Cj4gPj4gcGFnZSB0YWJsZXMgY291bGQg
Z2V0IGxvc3QuCj4gPiAKPiA+IENvdWxkIHlvdSBiZSBtb3JlIHNwZWNpZmljIHBsZWFzZT8KPiAK
PiBJbiB3aGljaCB3YXk/IERvIHlvdSB3YW50IHRvIHNlZSB0aGUgcmVzdWx0aW5nIGNyYXNoIGlu
IHRoZSBjb21taXQKPiBtZXNzYWdlIG9yIHNvbWUgbW9yZSBiYWNrZ3JvdW5kIGluZm9ybWF0aW9u
PwoKaWRlYWxseSBib3RoLgotLSAKTWljaGFsIEhvY2tvClNVU0UgTGFicwoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
