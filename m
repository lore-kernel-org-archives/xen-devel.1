From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH v4 3/9] xen/balloon: Share common memory
 reservation routines
Date: Fri, 15 Jun 2018 16:58:14 -0400
Message-ID: <0b7f2260-de99-56e2-b3d1-ee0a0bd88668__12667.9530636922$1529096273$gmane$org@oracle.com>
References: <20180615062753.9229-1-andr2000@gmail.com>
 <20180615062753.9229-4-andr2000@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=if9m=jb=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1fTvnt-00068h-In
 for xen-devel@lists.xenproject.org; Fri, 15 Jun 2018 20:58:42 +0000
In-Reply-To: <20180615062753.9229-4-andr2000@gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Oleksandr Andrushchenko <andr2000@gmail.com>, xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, jgross@suse.com, konrad.wilk@oracle.com
Cc: daniel.vetter@intel.com, matthew.d.roper@intel.com, dongwon.kim@intel.com, Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDYvMTUvMjAxOCAwMjoyNyBBTSwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6Cj4g
RnJvbTogT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gPG9sZWtzYW5kcl9hbmRydXNoY2hlbmtvQGVw
YW0uY29tPgo+Cj4gTWVtb3J5IHtpbmNyZWFzZXxkZWNyZWFzZX1fcmVzZXJ2YXRpb24gYW5kIFZB
IG1hcHBpbmdzIHVwZGF0ZS9yZXNldAo+IGNvZGUgdXNlZCBpbiBiYWxsb29uIGRyaXZlciBjYW4g
YmUgbWFkZSBjb21tb24sIHNvIG90aGVyIGRyaXZlcnMgY2FuCj4gYWxzbyByZS11c2UgdGhlIHNh
bWUgZnVuY3Rpb25hbGl0eSB3aXRob3V0IG9wZW4tY29kaW5nLgo+IENyZWF0ZSBhIGRlZGljYXRl
ZCBmaWxlIGZvciB0aGUgc2hhcmVkIGNvZGUgYW5kIGV4cG9ydCBjb3JyZXNwb25kaW5nCj4gc3lt
Ym9scyBmb3Igb3RoZXIga2VybmVsIG1vZHVsZXMuCj4KPiBTaWduZWQtb2ZmLWJ5OiBPbGVrc2Fu
ZHIgQW5kcnVzaGNoZW5rbyA8b2xla3NhbmRyX2FuZHJ1c2hjaGVua29AZXBhbS5jb20+Cj4KClJl
dmlld2VkLWJ5OiBCb3JpcyBPc3Ryb3Zza3kgPGJvcmlzLm9zdHJvdnNreUBvcmFjbGUuY29tPgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
