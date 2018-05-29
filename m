From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 3/8] drm/xen-front: fix 32-bit build warning
Date: Tue, 29 May 2018 09:59:46 +0200
Message-ID: <CAK8P3a0_PgaQV-gK0aX6p45cvCXh4t_CYCgxqk2ERp1pt7uojA__19832.1324344308$1527580728$gmane$org@mail.gmail.com>
References: <20180525155030.3667352-1-arnd@arndb.de>
 <20180525155030.3667352-3-arnd@arndb.de>
 <d08e0200-f431-8713-0286-cd5bbf3441c8@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <d08e0200-f431-8713-0286-cd5bbf3441c8@gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Oleksandr Andrushchenko <andr2000@gmail.com>
Cc: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, xen-devel@lists.xen.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Dan Carpenter <dan.carpenter@oracle.com>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBNYXkgMjksIDIwMTggYXQgNzo1OCBBTSwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28K
PGFuZHIyMDAwQGdtYWlsLmNvbT4gd3JvdGU6Cj4gT24gMDUvMjUvMjAxOCAwNjo1MCBQTSwgQXJu
ZCBCZXJnbWFubiB3cm90ZToKCj4+IGIvZHJpdmVycy9ncHUvZHJtL3hlbi94ZW5fZHJtX2Zyb250
X3NoYnVmLmMKPj4gaW5kZXggODA5OWNiMzQzYWUzLi5kMzMzYjY3Y2MxYTAgMTAwNjQ0Cj4+IC0t
LSBhL2RyaXZlcnMvZ3B1L2RybS94ZW4veGVuX2RybV9mcm9udF9zaGJ1Zi5jCj4+ICsrKyBiL2Ry
aXZlcnMvZ3B1L2RybS94ZW4veGVuX2RybV9mcm9udF9zaGJ1Zi5jCj4+IEBAIC0xMjIsNyArMTIy
LDcgQEAgc3RhdGljIHZvaWQgZ3Vlc3RfY2FsY19udW1fZ3JlZnMoc3RydWN0Cj4+IHhlbl9kcm1f
ZnJvbnRfc2hidWYgKmJ1ZikKPj4gICB9Cj4+ICAgICAjZGVmaW5lIHhlbl9wYWdlX3RvX3ZhZGRy
KHBhZ2UpIFwKPj4gLSAgICAgICAgICAgICAgICgocGh5c19hZGRyX3QpcGZuX3RvX2thZGRyKHBh
Z2VfdG9feGVuX3BmbihwYWdlKSkpCj4+ICsgICAgICAgICAgICAgICAoKHVpbnRwdHJfdClwZm5f
dG9fa2FkZHIocGFnZV90b194ZW5fcGZuKHBhZ2UpKSkKPj4gICAgIHN0YXRpYyBpbnQgYmFja2Vu
ZF91bm1hcChzdHJ1Y3QgeGVuX2RybV9mcm9udF9zaGJ1ZiAqYnVmKQo+PiAgIHsKPgo+IFRoYW5r
IHlvdSBmb3IgeW91ciBwYXRjaDogdGhpcyBpc3N1ZSB3YXMgYWxyZWFkeSBkaXNjdXNzZWQgWzFd
IGFuZCBhcHBsaWVkCj4gWzJdIHRvCj4gZHJtLW1pc2MtbmV4dC4KCk9rLCB0aGFua3MsIGFuZCBz
b3JyeSBmb3IgdGhlIGR1cGxpY2F0ZS4gTGludXgtbmV4dCByZWxlYXNlcyBoYXZlIGJlZW4KYSBi
aXQgc3BvcmFkaWMgcmVjZW50bHkgc28gSSBkaWRuJ3QgcnVuIHRoZSBsYXRlc3QgdHJlZSBmb3Ig
YWxsIGNhc2VzLgoKICAgIEFybmQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
