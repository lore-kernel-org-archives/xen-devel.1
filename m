From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] xen: avoid link error on ARM
Date: Tue, 5 Mar 2019 10:19:42 +0100
Message-ID: <CAK8P3a0qaeyYfKdPXdu8NXmXKVuYvr2NWXkYjnpb+UZzuRD5=w__2361.4886844129$1551777661$gmane$org@mail.gmail.com>
References: <20190304204826.2414365-1-arnd@arndb.de>
 <0eaa0d35-0be8-0053-1dcb-feb61d441bd2@suse.com>
 <CAK8P3a3vbjOzKAD6zce09Gc438tW=nYuMAJCE0MrODhBjO71xg@mail.gmail.com>
 <a1ff4ef4-f20f-ff0c-f779-0c8a3c1acd39@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=3mnY=RI=gmail.com=arndbergmann@srs-us1.protection.inumbo.net>)
 id 1h16F1-0006kp-7w
 for xen-devel@lists.xenproject.org; Tue, 05 Mar 2019 09:20:03 +0000
Received: by mail-qk1-f193.google.com with SMTP id m9so4408041qkl.4
 for <xen-devel@lists.xenproject.org>; Tue, 05 Mar 2019 01:20:01 -0800 (PST)
In-Reply-To: <a1ff4ef4-f20f-ff0c-f779-0c8a3c1acd39@suse.com>
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

T24gVHVlLCBNYXIgNSwgMjAxOSBhdCAxMDowNSBBTSBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3Vz
ZS5jb20+IHdyb3RlOgo+Cj4gT24gMDUvMDMvMjAxOSAwOTozNCwgQXJuZCBCZXJnbWFubiB3cm90
ZToKPiA+IE9uIFR1ZSwgTWFyIDUsIDIwMTkgYXQgNzozOSBBTSBKdWVyZ2VuIEdyb3NzIDxqZ3Jv
c3NAc3VzZS5jb20+IHdyb3RlOgo+ID4KPiA+Pgo+ID4+IENhbiB3ZSBhdm9pZCB0aGF0IGlmZGVm
IGluIHRoZSBNYWtlZmlsZT8KPiA+Pgo+ID4+IEknZCByYXRoZXIgaGF2ZSBhbiBhcmNoaXRlY3R1
cmUgaW5kZXBlbmRhbnQgYnVpbHRpbiBkcml2ZXIgYWRkZWQgd2hpY2gKPiA+PiBpcyBhbHdheXMg
aW5jbHVkZWQgZm9yIENPTkZJR19YRU4uIFRoaXMgd291bGQgYWxsb3cgdG8gbW92ZSByZWR1bmRh
bnQKPiA+PiBzdHVmZiBmcm9tIGFyY2gvKi94ZW4vIGludG8gaXQgKGUuZy4geGVuX3ZjcHVfaWQp
Lgo+ID4+Cj4gPj4gU286IHJlbmFtZSBtbS5jIHRvIHhlbi1idWlsdGluLmMsIHVzZToKPiA+Pgo+
ID4+IG9iai0kKENPTkZJR19YRU4pICs9IHhlbi1idWlsdGluLm8KPiA+Cj4gPiBTdXJlLCBJJ20g
aGFwcHkgdG8gY2hhbmdlIHRoZSBuYW1pbmcgYW5kIHRoZSBNYWtlZmlsZSBsb2dpYy4gVGhlIHdh
eSB5b3UKPiA+IHN1Z2dlc3RlZCBzb3VuZHMgZmluZSB0byBtZSwgYnV0IGl0IHdpbGwgbWFrZSB0
aGUgeGVuIGNvZGUgc2xpZ2h0bHkgYmlnZ2VyCj4gPiBldmVuIGlmIHRoYXQgY29kZSBpcyBub3Qg
dXNlZC4gV2UgY291bGQgYWxzbyBoYXZlIGEgc2lsZW50IEtjb25maWcgc3ltYm9sCj4gPiB0aGF0
IHR1cm5zIHRoaXMgb24gYW5kIHN0aWxsIGF2b2lkIHRoZSBpZmRlZjoKPiA+Cj4gPiBvYmotJChD
T05GSUdfWEVOX0JVSUxUSU4pICs9IHhlbi1idWlsdGluLm8KPgo+IFRoYXQgd2FzIG15IGZpcnN0
IHRob3VnaHQuCj4KPiBCdXQgbG9va2luZyB0aHJvdWdoIGFyY2gvW2FybXx4ODZdL3hlbi9lbmxp
Z2h0ZW4uYyBJIGZvdW5kIHNldmVyYWwKPiBnbG9iYWwgdmFyaWFibGVzIGRlZmluZWQgdGhlIHNh
bWUgd2F5LiBJJ2QgbGlrZSB0byBtZXJnZSB0aG9zZSwgdG9vLgo+Cj4gU28gbXkgcHJlZmVyZW5j
ZSBpcyBhIGNvbW1vbiBzb3VyY2UgZm9yIGFsbCB0aGlzIHN0dWZmLgoKT2ssIG1ha2VzIHNlbnNl
LiBJJ3ZlIHByZXBhcmVkIHRoYXQgcGF0Y2ggbm93IGFuZCB3aWxsIHNlbmQgaXQKYWZ0ZXIgc29t
ZSBtb3JlIGJ1aWxkIHRlc3RpbmcuCgogICAgICAgIEFybmQKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
