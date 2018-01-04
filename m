From: Tamas K Lengyel <tamas@tklengyel.com>
Subject: Re: [PATCH] xen: Add EFI_LOAD_OPTION support
Date: Thu, 4 Jan 2018 09:16:22 -0700
Message-ID: <CABfawhmf1+97Mgduhs7TZ0hD76xMExnHnkK5sapsgAovQSAfkw@mail.gmail.com>
References: <20180102155628.3007-1-tamas@tklengyel.com>
 <5A4CCA8C020000780019A74B@prv-mh.provo.novell.com>
 <CABfawhkNbLJNbxHxxne=AMPZanGh6V=+o5=WY1jT0POjCTLFoQ@mail.gmail.com>
 <5A4D14AD020000780019A971@prv-mh.provo.novell.com>
 <CABfawhkMKcOECtZcA4wmapUtaFerv4xBAkudeYYCLWoCrMPUxQ@mail.gmail.com>
 <5A4E136F020000780019AE06@prv-mh.provo.novell.com>
 <CABfawhk4CRHwZVj6Sy5WvkzzSTH-AUNxq83DBnYTH4sDbONfXA@mail.gmail.com>
 <5A4E4F85020000780019B1AB@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=8sab=d7=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1eX8Cc-0001MS-QT
 for xen-devel@lists.xenproject.org; Thu, 04 Jan 2018 16:17:10 +0000
Received: by mail-wm0-f53.google.com with SMTP id b141so4474815wme.1
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jan 2018 08:17:04 -0800 (PST)
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com.
 [74.125.82.45])
 by smtp.gmail.com with ESMTPSA id o60sm2301010edb.79.2018.01.04.08.17.03
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 04 Jan 2018 08:17:03 -0800 (PST)
Received: by mail-wm0-f45.google.com with SMTP id y82so2800832wmg.1
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jan 2018 08:17:03 -0800 (PST)
In-Reply-To: <5A4E4F85020000780019B1AB@prv-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, openxt <openxt@googlegroups.com>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBKYW4gNCwgMjAxOCBhdCA4OjAwIEFNLCBKYW4gQmV1bGljaCA8SkJldWxpY2hAc3Vz
ZS5jb20+IHdyb3RlOgo+Pj4+IE9uIDA0LjAxLjE4IGF0IDE1OjM5LCA8dGFtYXNAdGtsZW5neWVs
LmNvbT4gd3JvdGU6Cj4+IE9uIFRodSwgSmFuIDQsIDIwMTggYXQgMzo0MyBBTSwgSmFuIEJldWxp
Y2ggPEpCZXVsaWNoQHN1c2UuY29tPiB3cm90ZToKPj4+IEp1c3QgbG9va2luZyBhdCB0aGUgbG93
IGJpdCBvZiB0aGUgZmlyc3QKPj4+IGJ5dGUgYmVmb3JlIGFzc3VtaW5nIHRoaXMgY291bGQgYmUg
YSBsb2FkIG9wdGlvbiBzdHJ1Y3R1cmUsCj4+PiBob3dldmVyLCBpcyB0b28gd2VhayBhIGNoZWNr
IGZvciBteSB0YXN0ZS4KPj4KPj4gVGhlcmUgaXMgbW9yZSBkb25lIGluIHRoaXMgcGF0Y2ggdGhl
biBqdXN0IGNoZWNraW5nIHRoZSBsb3cgYml0IG9mIHRoZQo+PiBBdHRyaWJ1dGVzIGZpZWxkOiBj
YWxjdWxhdGluZyB3aGVyZSB0aGUgT3B0aW9uYWxEYXRhIHNob3VsZCBiZSBpZiB0aGlzCj4+IGlz
IGluZGVlZCBhbiBFRklfTE9BRF9PUFRJT04gYW5kIHRoZW4gc2FuaXR5IGNoZWNraW5nIGlmIHRo
YXQgYWRkcmVzcwo+PiBpcyBzYW5lIG9yIG5vdC4gVGhpcyByZXF1aXJlcyB0aGUgYnVmZmVyIHRv
IGhhdmUgYSBsYXlvdXQgdGhhdCBhdAo+PiBsZWFzdCBwYXJzZXMgcHJvcGVybHkgYXMgYW4gRUZJ
X0xPQURfT1BUSU9OLCBoZW5jZSBpdCBsaWtlbHkgaXMgb25lLi4KPgo+IEJ1dCB0aGF0IGNhbGN1
bGF0aW9uIGlzIG5vdCBkb2luZyBhbGwgdGhlIGNoZWNraW5nIHRoYXQgd291bGQgYmUKPiBuZWVk
ZWQgdG8gYmUgcmVhc29uYWJseSBzYWZlLiBJbiBwYXJ0aWN1bGFyLCB5b3UgbXVzdG4ndCBjYWxs
Cj4gd3N0cmxlbigpIHdoZW4geW91IGRvbid0IGtub3cgd2hldGhlciBhbGwgb2YgdGhlIHN1cHBv
c2VkCj4gc3RyaW5nIGlzIGFjdHVhbGx5IGluc2lkZSB0aGUgZ2l2ZW4gbWVtb3J5IGJsb2NrIHNp
emUuIEFuZCBJJ20KPiBhbHNvIG5vdCBlbnRpcmVseSBjZXJ0YWluIHdoZXRoZXIgY2FyaW5nIG9m
IG92ZXJmbG93IGluIG9ubHkgb25lCj4gKGxhdGUpIHBsYWNlIGlzIHN1ZmZpY2llbnQuCgpGYWly
IGVub3VnaC4gSG93IGFib3V0IGlmIHdlIGNoZWNrIHdoZXRoZXIgdGhlIHN1cHBvc2VkIHN0cmlu
ZyBzdGFydApzcG90IGlzIHdpdGhpbiB0aGUgYnVmZmVyIGFuZCB0aGVuIHVzZSB3c3RybmxlbiBp
biBwbGFjZSBzdWNoIHRoYXQgaXQKY2FuJ3QgZ28gcGFzdCB0aGUgYnVmZmVyPyBXb3VsZCB0aGF0
IGJlIGVub3VnaCBzYW5pdHkgY2hlY2tpbmc/CgpUYW1hcwoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
