From: Oleksandr <olekstysh@gmail.com>
Subject: Re: [PATCH v2 0/2] CPU hotplug fixes for ARM32
Date: Fri, 7 Dec 2018 14:21:09 +0200
Message-ID: <99c1e962-59ec-5a8e-bd8c-97da13dc85ed@gmail.com>
References: <1544175931-17047-1-git-send-email-olekstysh@gmail.com>
 <f7b7d683-c44d-ad52-2487-64be088ab7d0@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=PsOz=OQ=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1gVF85-0004hp-Rf
 for xen-devel@lists.xenproject.org; Fri, 07 Dec 2018 12:21:13 +0000
Received: by mail-lf1-x143.google.com with SMTP id b20so2849375lfa.12
 for <xen-devel@lists.xenproject.org>; Fri, 07 Dec 2018 04:21:12 -0800 (PST)
In-Reply-To: <f7b7d683-c44d-ad52-2487-64be088ab7d0@arm.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, sstabellini@kernel.org, mirela.simonovic@aggios.com
List-Id: xen-devel@lists.xenproject.org

Ck9uIDA3LjEyLjE4IDEyOjAyLCBKdWxpZW4gR3JhbGwgd3JvdGU6CgpIaSwgSnVsaWVuLgoKPgo+
IE9uIDA3LzEyLzIwMTggMDk6NDUsIE9sZWtzYW5kciBUeXNoY2hlbmtvIHdyb3RlOgo+PiBGcm9t
OiBPbGVrc2FuZHIgVHlzaGNoZW5rbyA8b2xla3NhbmRyX3R5c2hjaGVua29AZXBhbS5jb20+Cj4+
Cj4+IEhpLCBhbGwuCj4+Cj4+IFRoaXMgaXMgc21hbGwgcGF0Y2ggc2VyaWVzIGZvciBBUk0zMiB3
aGljaCBuZWVkZWQgdG8gYmUgYWJsZSB0byBicmluZwo+PiBzZWNvbmRhcnkgQ1BVcyB1cCBub3Qg
b25seSBkdXJpbmcgdGhlIGluaXRpYWwgYm9vdCwgYnV0IGF0IHJ1bnRpbWUgYWxzby4KPj4gRm9y
IGV4YW1wbGUsIGR1cmluZyBDUFUgaG90cGx1Zy4KPgo+IE9PSSwgd2UgZG9uJ3QgaGF2ZSBDUFUg
aG90cGx1ZyBpbiBYZW4gYXQgdGhlIG1vbWVudC4gU28gZG8geW91IGhhdmUgCj4gQ1BVIGhvdHBs
dWcgcGF0Y2ggY29taW5nIHVwPwoKTm8sIEkgZG9uJ3QuIFRoZXNlIHBhdGNoZXMgYXJlIHJlc3Vs
dCBvZiBteSBwbGF5aW5nIHdpdGggUFNDSSkuIEkganVzdCAKd2FudGVkIHRvIGJlIHN1cmUgdGhh
dCBzZWNvbmQgQ1BVX09OIHJlcXVlc3Qgd291bGQgcHJvcGVybHkgYnJpbmcgQ1BVIHVwIAphZ2Fp
biBhZnRlciBwZXJmb3JtaW5nIENQVV9PRkYgcmVxdWVzdC4gRm9yIHRoYXQgcmVhc29uLCBJIGp1
c3QgaGFja2VkIApYZW4gdG8gaXNzdWUgY3B1X3VwKCkvY3B1X2Rvd24oKSBieSBwcmVzc2luZyBh
IGtleS4gU28gdGhpcyBpcyAKZGVmaW5pdGVseSBub3QgZm9yIHVwc3RyZWFtKQoKPgo+IENoZWVy
cywKPgotLSAKUmVnYXJkcywKCk9sZWtzYW5kciBUeXNoY2hlbmtvCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
