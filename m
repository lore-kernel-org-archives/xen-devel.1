From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] xen: avoid link error on ARM
Date: Tue, 5 Mar 2019 09:34:33 +0100
Message-ID: <CAK8P3a3vbjOzKAD6zce09Gc438tW=nYuMAJCE0MrODhBjO71xg__36697.3365236603$1551774957$gmane$org@mail.gmail.com>
References: <20190304204826.2414365-1-arnd@arndb.de>
 <0eaa0d35-0be8-0053-1dcb-feb61d441bd2@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=3mnY=RI=gmail.com=arndbergmann@srs-us1.protection.inumbo.net>)
 id 1h15XH-0003I9-Ui
 for xen-devel@lists.xenproject.org; Tue, 05 Mar 2019 08:34:51 +0000
Received: by mail-qt1-f195.google.com with SMTP id v10so8156888qtp.8
 for <xen-devel@lists.xenproject.org>; Tue, 05 Mar 2019 00:34:50 -0800 (PST)
In-Reply-To: <0eaa0d35-0be8-0053-1dcb-feb61d441bd2@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Matthew Wilcox <willy@infradead.org>, Paul Durrant <paul.durrant@citrix.com>, Souptick Joarder <jrdr.linux@gmail.com>, xen-devel <xen-devel@lists.xenproject.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBNYXIgNSwgMjAxOSBhdCA3OjM5IEFNIEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNl
LmNvbT4gd3JvdGU6Cgo+Cj4gQ2FuIHdlIGF2b2lkIHRoYXQgaWZkZWYgaW4gdGhlIE1ha2VmaWxl
Pwo+Cj4gSSdkIHJhdGhlciBoYXZlIGFuIGFyY2hpdGVjdHVyZSBpbmRlcGVuZGFudCBidWlsdGlu
IGRyaXZlciBhZGRlZCB3aGljaAo+IGlzIGFsd2F5cyBpbmNsdWRlZCBmb3IgQ09ORklHX1hFTi4g
VGhpcyB3b3VsZCBhbGxvdyB0byBtb3ZlIHJlZHVuZGFudAo+IHN0dWZmIGZyb20gYXJjaC8qL3hl
bi8gaW50byBpdCAoZS5nLiB4ZW5fdmNwdV9pZCkuCj4KPiBTbzogcmVuYW1lIG1tLmMgdG8geGVu
LWJ1aWx0aW4uYywgdXNlOgo+Cj4gb2JqLSQoQ09ORklHX1hFTikgKz0geGVuLWJ1aWx0aW4ubwoK
U3VyZSwgSSdtIGhhcHB5IHRvIGNoYW5nZSB0aGUgbmFtaW5nIGFuZCB0aGUgTWFrZWZpbGUgbG9n
aWMuIFRoZSB3YXkgeW91CnN1Z2dlc3RlZCBzb3VuZHMgZmluZSB0byBtZSwgYnV0IGl0IHdpbGwg
bWFrZSB0aGUgeGVuIGNvZGUgc2xpZ2h0bHkgYmlnZ2VyCmV2ZW4gaWYgdGhhdCBjb2RlIGlzIG5v
dCB1c2VkLiBXZSBjb3VsZCBhbHNvIGhhdmUgYSBzaWxlbnQgS2NvbmZpZyBzeW1ib2wKdGhhdCB0
dXJucyB0aGlzIG9uIGFuZCBzdGlsbCBhdm9pZCB0aGUgaWZkZWY6CgpvYmotJChDT05GSUdfWEVO
X0JVSUxUSU4pICs9IHhlbi1idWlsdGluLm8KCihvciB1c2luZyBhbnkgb3RoZXIgc3ltYm9sIG5h
bWUgdGhhdCBtYWtlcyBtb3JlIHNlbnNlIHRoYW4gdGhhdC4KCkxldCBtZSBrbm93IHlvdXIgcHJl
ZmVyZW5jZSBhbmQgSSdsbCByZXN1Ym1pdC4KCiAgICAgIEFybmQKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
