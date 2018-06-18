From: Andre Przywara <andre.przywara@arm.com>
Subject: Re: [PATCH v2] drm/xen-front: fix pointer casts
Date: Mon, 18 Jun 2018 11:06:42 +0100
Message-ID: <ad523698-9c33-3fe1-9eeb-165cc775a936__11908.3870937631$1529316335$gmane$org@arm.com>
References: <20180523113630.29811-1-andr2000@gmail.com>
 <b516542b-a0f5-cbce-d351-25b88a7f3288@suse.com>
 <a8cff47d-a990-924a-0a63-b6f3aea3279b@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=4ndw=je=arm.com=andre.przywara@srs-us1.protection.inumbo.net>)
 id 1fUr3b-0005g8-CP
 for xen-devel@lists.xenproject.org; Mon, 18 Jun 2018 10:06:43 +0000
In-Reply-To: <a8cff47d-a990-924a-0a63-b6f3aea3279b@gmail.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Oleksandr Andrushchenko <andr2000@gmail.com>, Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, daniel.vetter@intel.com, boris.ostrovsky@oracle.com
Cc: David Airlie <airlied@linux.ie>, Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
List-Id: xen-devel@lists.xenproject.org

SGksCgpPbiAyNS8wNS8xOCAwNjozMiwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6Cj4g
T24gMDUvMjMvMjAxOCAwMjo0NiBQTSwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPj4gT24gMjMvMDUv
MTggMTM6MzYsIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOgo+Pj4gRnJvbTogT2xla3Nh
bmRyIEFuZHJ1c2hjaGVua28gPG9sZWtzYW5kcl9hbmRydXNoY2hlbmtvQGVwYW0uY29tPgo+Pj4K
Pj4+IEJ1aWxkaW5nIGZvciBhIDMyLWJpdCB0YXJnZXQgcmVzdWx0cyBpbiB3YXJuaW5ncyBmcm9t
IGNhc3RpbmcKPj4+IGJldHdlZW4gYSAzMi1iaXQgcG9pbnRlciBhbmQgYSA2NC1iaXQgaW50ZWdl
ci4gRml4IHRoZSB3YXJuaW5ncwo+Pj4gYnkgY2FzdGluZyB0aG9zZSBwb2ludGVycyB0byB1aW50
cHRyX3QgZmlyc3QuCj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogT2xla3NhbmRyIEFuZHJ1c2hjaGVu
a28KPj4+IDxvbGVrc2FuZHJfYW5kcnVzaGNoZW5rb0BlcGFtLmNvbT4KPj4gUmV2aWV3ZWQtYnk6
IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KCj4gVGhhbmsgeW91LCBhcHBsaWVkIHRv
IGRybS1taXNjLW5leHQKCklzIHRoaXMgdGhlIHJpZ2h0IGJyYW5jaD8gU2hvdWxkbid0IHRoaXMg
Z28gdG8gZHJtLW1pc2MtZml4ZXMgaW5zdGVhZCwKc28gaXQgcmVhY2hlcyB0aGUgdHJlZSBiZWZv
cmUgdGhlIDQuMTggcmVsZWFzZT8KSnVzdCBzdHVtYmxlZCBvdmVyIHRoZSBpc3N1ZSB3aGVuIGNv
bXBpbGluZyA0LjE4LXJjMSBmb3IgYXJtMzIsIHNvIGl0CmRlZmluaXRlbHkgbmVlZHMgZml4aW5n
IGluIHRoaXMgY3ljbGUuCgpDaGVlcnMsCkFuZHJlLgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
