From: Pavel Tatashin <pasha.tatashin@ORACLE.COM>
Subject: Re: [PATCH] mm: don't defer struct page initialization
 for Xen pv guests
Date: Fri, 16 Feb 2018 09:21:57 -0500
Message-ID: <b277a7be-05d4-67e7-f8ad-50f7865e87fe__45460.0270525136$1518802938$gmane$org@oracle.com>
References: <20180216133726.30813-1-jgross@suse.com>
 <20180216135940.GQ7275@dhcp22.suse.cz>
 <1424bb25-7d6a-ee21-83b4-0e90369d6132@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=daew=fk=oracle.com=pasha.tatashin@srs-us1.protection.inumbo.net>)
 id 1emk2c-0006QU-MG
 for xen-devel@lists.xenproject.org; Fri, 16 Feb 2018 17:43:22 +0000
In-Reply-To: <1424bb25-7d6a-ee21-83b4-0e90369d6132@suse.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>, Michal Hocko <mhocko@kernel.org>
Cc: linux-mm@kvack.org, akpm@linux-foundation.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gMDIvMTYvMjAxOCAwOTowMiBBTSwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBPbiAxNi8wMi8x
OCAxNDo1OSwgTWljaGFsIEhvY2tvIHdyb3RlOgo+PiBbQ0MgUGF2ZWxdCj4+Cj4+IE9uIEZyaSAx
Ni0wMi0xOCAxNDozNzoyNiwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPj4+IENvbW1pdCBmN2Y5OTEw
MGQ4ZDk1ZGJjZjA5ZTAyMTZhMTQzMjExZTc5NDE4YjlmICgibW06IHN0b3AgemVyb2luZwo+Pj4g
bWVtb3J5IGR1cmluZyBhbGxvY2F0aW9uIGluIHZtZW1tYXAiKSBicm9rZSBYZW4gcHYgZG9tYWlu
cyBpbiBzb21lCj4+PiBjb25maWd1cmF0aW9ucywgYXMgdGhlICJQaW5uZWQiIGluZm9ybWF0aW9u
IGluIHN0cnVjdCBwYWdlIG9mIGVhcmx5Cj4+PiBwYWdlIHRhYmxlcyBjb3VsZCBnZXQgbG9zdC4K
Pj4KPj4gQ291bGQgeW91IGJlIG1vcmUgc3BlY2lmaWMgcGxlYXNlPwo+IAo+IEluIHdoaWNoIHdh
eT8gRG8geW91IHdhbnQgdG8gc2VlIHRoZSByZXN1bHRpbmcgY3Jhc2ggaW4gdGhlIGNvbW1pdAo+
IG1lc3NhZ2Ugb3Igc29tZSBtb3JlIGJhY2tncm91bmQgaW5mb3JtYXRpb24/CgpIaSBKdWVyZ2Vu
LAoKQ291bGQgeW91IHBsZWFzZSBwcm92aWRlIGRldGFpbHMgaG93IHRvIHJlcHJvZHVjZSB0aGUg
cHJvYmxlbSwgYW5kIGNyYXNoIAptZXNzYWdlLiBBbHNvLCBpbmZvcm1hdGlvbiBhYm91dCB3aGVy
ZSBleGFjdGx5IHhlbiBhY2Nlc3Mgc3RydWN0IHBhZ2VzIApiZWZvcmUgZGVmZXJyZWQgcGFnZXMg
YXJlIGluaXRpYWxpemVkLgoKVGhhbmsgeW91LApQYXNoYQoKPiAKPj4KPj4+IEF2b2lkIHRoaXMg
cHJvYmxlbSBieSBub3QgZGVmZXJyaW5nIHN0cnVjdCBwYWdlIGluaXRpYWxpemF0aW9uIHdoZW4K
Pj4+IHJ1bm5pbmcgYXMgWGVuIHB2IGd1ZXN0Lgo+Pj4KPj4+IENjOiA8c3RhYmxlQHZnZXIua2Vy
bmVsLm9yZz4gIzQuMTUKPj4gRml4ZXM6IGY3Zjk5MTAwZDhkOSAoIm1tOiBzdG9wIHplcm9pbmcg
bWVtb3J5IGR1cmluZyBhbGxvY2F0aW9uIGluIHZtZW1tYXAiKQo+Pgo+PiBwbGVhc2UKPiAKPiBP
a2F5Lgo+IAo+IAo+IEp1ZXJnZW4KPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
