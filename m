From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH v2] xen: setup pv irq ops vector earlier
Date: Thu, 12 Jul 2018 13:28:46 -0400
Message-ID: <3ba34cbe-b9f8-91bb-03dc-efe5ae44991f__35040.0678850294$1531416438$gmane$org@oracle.com>
References: <20180712154034.28010-1-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=jz0u=j4=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1fdfOI-00086q-I1
 for xen-devel@lists.xenproject.org; Thu, 12 Jul 2018 17:28:30 +0000
In-Reply-To: <20180712154034.28010-1-jgross@suse.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>, linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, x86@kernel.org
Cc: tglx@linutronix.de, mingo@redhat.com, stable@vger.kernel.org, hpa@zytor.com
List-Id: xen-devel@lists.xenproject.org

T24gMDcvMTIvMjAxOCAxMTo0MCBBTSwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBTZXR0aW5nIHB2
X2lycV9vcHMgZm9yIFhlbiBQViBkb21haW5zIHNob3VsZCBiZSBkb25lIGFzIGVhcmx5IGFzCj4g
cG9zc2libGUgaW4gb3JkZXIgdG8gc3VwcG9ydCBlLmcuIHZlcnkgZWFybHkgcHJpbnRrKCkgdXNh
Z2UuCj4KPiBUaGUgc2FtZSBhcHBsaWVzIHRvIHhlbl92Y3B1X2luZm9fcmVzZXQoMCksIGFzIGl0
IGlzIG5lZWRlZCBmb3IgdGhlCj4gcHYgaXJxIG9wcy4KPgo+IE1vdmUgdGhlIGNhbGwgb2YgeGVu
X3NldHVwX21hY2hwaHlzX21hcHBpbmcoKSBhZnRlciBpbml0aWFsaXppbmcgdGhlCj4gcHYgZnVu
Y3Rpb25zIGFzIGl0IGNvbnRhaW5zIGEgV0FSTl9PTigpLCB0b28uCj4KPiBSZW1vdmUgdGhlIG5v
IGxvbmdlciBuZWNlc3NhcnkgY29uZGl0aW9uYWwgaW4geGVuX2luaXRfaXJxX29wcygpCj4gZnJv
bSBQVkggVjEgdGltZXMgdG8gbWFrZSBjbGVhciB0aGlzIGlzIGEgUFYgb25seSBmdW5jdGlvbi4K
Pgo+IENjOiA8c3RhYmxlQHZnZXIua2VybmVsLm9yZz4gIyA0LjE0Cj4gU2lnbmVkLW9mZi1ieTog
SnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgoKUmV2aWV3ZWQtYnk6IEJvcmlzIE9zdHJv
dnNreSA8Ym9yaXMub3N0cm92c2t5QG9yYWNsZS5jb20+CgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
