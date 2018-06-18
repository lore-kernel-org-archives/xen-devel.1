From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH v2] drm/xen-front: fix pointer casts
Date: Mon, 18 Jun 2018 13:17:32 +0300
Message-ID: <4a66887e-744d-d14f-85e0-e3cdb78934bf__23883.1370290884$1529317000$gmane$org@epam.com>
References: <20180523113630.29811-1-andr2000@gmail.com>
 <b516542b-a0f5-cbce-d351-25b88a7f3288@suse.com>
 <a8cff47d-a990-924a-0a63-b6f3aea3279b@gmail.com>
 <ad523698-9c33-3fe1-9eeb-165cc775a936@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=jri7=je=epam.com=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1fUrEK-0006Sc-Hg
 for xen-devel@lists.xenproject.org; Mon, 18 Jun 2018 10:17:48 +0000
In-Reply-To: <ad523698-9c33-3fe1-9eeb-165cc775a936@arm.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Juergen Gross <jgross@suse.com>, Oleksandr Andrushchenko <andr2000@gmail.com>, Andre Przywara <andre.przywara@arm.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>, daniel.vetter@intel.com, xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com
List-Id: xen-devel@lists.xenproject.org

T24gMDYvMTgvMjAxOCAwMTowNiBQTSwgQW5kcmUgUHJ6eXdhcmEgd3JvdGU6Cj4gSGksCj4KPiBP
biAyNS8wNS8xOCAwNjozMiwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6Cj4+IE9uIDA1
LzIzLzIwMTggMDI6NDYgUE0sIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+PiBPbiAyMy8wNS8xOCAx
MzozNiwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6Cj4+Pj4gRnJvbTogT2xla3NhbmRy
IEFuZHJ1c2hjaGVua28gPG9sZWtzYW5kcl9hbmRydXNoY2hlbmtvQGVwYW0uY29tPgo+Pj4+Cj4+
Pj4gQnVpbGRpbmcgZm9yIGEgMzItYml0IHRhcmdldCByZXN1bHRzIGluIHdhcm5pbmdzIGZyb20g
Y2FzdGluZwo+Pj4+IGJldHdlZW4gYSAzMi1iaXQgcG9pbnRlciBhbmQgYSA2NC1iaXQgaW50ZWdl
ci4gRml4IHRoZSB3YXJuaW5ncwo+Pj4+IGJ5IGNhc3RpbmcgdGhvc2UgcG9pbnRlcnMgdG8gdWlu
dHB0cl90IGZpcnN0Lgo+Pj4+Cj4+Pj4gU2lnbmVkLW9mZi1ieTogT2xla3NhbmRyIEFuZHJ1c2hj
aGVua28KPj4+PiA8b2xla3NhbmRyX2FuZHJ1c2hjaGVua29AZXBhbS5jb20+Cj4+PiBSZXZpZXdl
ZC1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgo+PiBUaGFuayB5b3UsIGFwcGxp
ZWQgdG8gZHJtLW1pc2MtbmV4dAo+IElzIHRoaXMgdGhlIHJpZ2h0IGJyYW5jaD8gU2hvdWxkbid0
IHRoaXMgZ28gdG8gZHJtLW1pc2MtZml4ZXMgaW5zdGVhZCwKPiBzbyBpdCByZWFjaGVzIHRoZSB0
cmVlIGJlZm9yZSB0aGUgNC4xOCByZWxlYXNlPwo+IEp1c3Qgc3R1bWJsZWQgb3ZlciB0aGUgaXNz
dWUgd2hlbiBjb21waWxpbmcgNC4xOC1yYzEgZm9yIGFybTMyLCBzbyBpdAo+IGRlZmluaXRlbHkg
bmVlZHMgZml4aW5nIGluIHRoaXMgY3ljbGUuCk1hYXJ0ZW4sIGNhbiB0aGlzIGJlIGRvbmUgcGxl
YXNlPwo+IENoZWVycywKPiBBbmRyZS4KVGhhbmsgeW91LApPbGVrc2FuZHIKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
