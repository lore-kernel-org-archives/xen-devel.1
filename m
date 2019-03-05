From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] xen: avoid link error on ARM
Date: Tue, 5 Mar 2019 10:05:33 +0100
Message-ID: <a1ff4ef4-f20f-ff0c-f779-0c8a3c1acd39__40043.862960168$1551776814$gmane$org@suse.com>
References: <20190304204826.2414365-1-arnd@arndb.de>
 <0eaa0d35-0be8-0053-1dcb-feb61d441bd2@suse.com>
 <CAK8P3a3vbjOzKAD6zce09Gc438tW=nYuMAJCE0MrODhBjO71xg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=rV4c=RI=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1h1614-0005fJ-Kp
 for xen-devel@lists.xenproject.org; Tue, 05 Mar 2019 09:05:38 +0000
In-Reply-To: <CAK8P3a3vbjOzKAD6zce09Gc438tW=nYuMAJCE0MrODhBjO71xg@mail.gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Matthew Wilcox <willy@infradead.org>, Paul Durrant <paul.durrant@citrix.com>, Souptick Joarder <jrdr.linux@gmail.com>, xen-devel <xen-devel@lists.xenproject.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDUvMDMvMjAxOSAwOTozNCwgQXJuZCBCZXJnbWFubiB3cm90ZToKPiBPbiBUdWUsIE1hciA1
LCAyMDE5IGF0IDc6MzkgQU0gSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToK
PiAKPj4KPj4gQ2FuIHdlIGF2b2lkIHRoYXQgaWZkZWYgaW4gdGhlIE1ha2VmaWxlPwo+Pgo+PiBJ
J2QgcmF0aGVyIGhhdmUgYW4gYXJjaGl0ZWN0dXJlIGluZGVwZW5kYW50IGJ1aWx0aW4gZHJpdmVy
IGFkZGVkIHdoaWNoCj4+IGlzIGFsd2F5cyBpbmNsdWRlZCBmb3IgQ09ORklHX1hFTi4gVGhpcyB3
b3VsZCBhbGxvdyB0byBtb3ZlIHJlZHVuZGFudAo+PiBzdHVmZiBmcm9tIGFyY2gvKi94ZW4vIGlu
dG8gaXQgKGUuZy4geGVuX3ZjcHVfaWQpLgo+Pgo+PiBTbzogcmVuYW1lIG1tLmMgdG8geGVuLWJ1
aWx0aW4uYywgdXNlOgo+Pgo+PiBvYmotJChDT05GSUdfWEVOKSArPSB4ZW4tYnVpbHRpbi5vCj4g
Cj4gU3VyZSwgSSdtIGhhcHB5IHRvIGNoYW5nZSB0aGUgbmFtaW5nIGFuZCB0aGUgTWFrZWZpbGUg
bG9naWMuIFRoZSB3YXkgeW91Cj4gc3VnZ2VzdGVkIHNvdW5kcyBmaW5lIHRvIG1lLCBidXQgaXQg
d2lsbCBtYWtlIHRoZSB4ZW4gY29kZSBzbGlnaHRseSBiaWdnZXIKPiBldmVuIGlmIHRoYXQgY29k
ZSBpcyBub3QgdXNlZC4gV2UgY291bGQgYWxzbyBoYXZlIGEgc2lsZW50IEtjb25maWcgc3ltYm9s
Cj4gdGhhdCB0dXJucyB0aGlzIG9uIGFuZCBzdGlsbCBhdm9pZCB0aGUgaWZkZWY6Cj4gCj4gb2Jq
LSQoQ09ORklHX1hFTl9CVUlMVElOKSArPSB4ZW4tYnVpbHRpbi5vCgpUaGF0IHdhcyBteSBmaXJz
dCB0aG91Z2h0LgoKQnV0IGxvb2tpbmcgdGhyb3VnaCBhcmNoL1thcm18eDg2XS94ZW4vZW5saWdo
dGVuLmMgSSBmb3VuZCBzZXZlcmFsCmdsb2JhbCB2YXJpYWJsZXMgZGVmaW5lZCB0aGUgc2FtZSB3
YXkuIEknZCBsaWtlIHRvIG1lcmdlIHRob3NlLCB0b28uCgpTbyBteSBwcmVmZXJlbmNlIGlzIGEg
Y29tbW9uIHNvdXJjZSBmb3IgYWxsIHRoaXMgc3R1ZmYuCgpJJ2xsIHNlbmQgYSBmb2xsb3d1cCBw
YXRjaCB0byBtb3ZlIHRoZSBtZW50aW9uZWQgdmFyaWFibGVzIGludG8gdGhlIG5ldwpzb3VyY2Uu
CgoKSnVlcmdlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
