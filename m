From: Tamas K Lengyel <tamas@tklengyel.com>
Subject: Re: [PATCH] xen: Add EFI_LOAD_OPTION support
Date: Thu, 4 Jan 2018 09:35:22 -0700
Message-ID: <CABfawhnVCEpiNY=h7okgT0Lq-HgRu8o07F=NaWmGXbmtTpmKzA@mail.gmail.com>
References: <20180102155628.3007-1-tamas@tklengyel.com>
 <5A4CCA8C020000780019A74B@prv-mh.provo.novell.com>
 <CABfawhkNbLJNbxHxxne=AMPZanGh6V=+o5=WY1jT0POjCTLFoQ@mail.gmail.com>
 <5A4D14AD020000780019A971@prv-mh.provo.novell.com>
 <CABfawhkMKcOECtZcA4wmapUtaFerv4xBAkudeYYCLWoCrMPUxQ@mail.gmail.com>
 <5A4E136F020000780019AE06@prv-mh.provo.novell.com>
 <CABfawhk4CRHwZVj6Sy5WvkzzSTH-AUNxq83DBnYTH4sDbONfXA@mail.gmail.com>
 <5A4E4F85020000780019B1AB@prv-mh.provo.novell.com>
 <CABfawhmf1+97Mgduhs7TZ0hD76xMExnHnkK5sapsgAovQSAfkw@mail.gmail.com>
 <5A4E63A3020000780019B1ED@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=8sab=d7=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1eX8Uw-00038p-0W
 for xen-devel@lists.xenproject.org; Thu, 04 Jan 2018 16:36:06 +0000
Received: by mail-wm0-f47.google.com with SMTP id g130so2890979wme.0
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jan 2018 08:36:04 -0800 (PST)
Received: from mail-wr0-f181.google.com (mail-wr0-f181.google.com.
 [209.85.128.181])
 by smtp.gmail.com with ESMTPSA id l50sm2494133eda.85.2018.01.04.08.36.02
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 04 Jan 2018 08:36:03 -0800 (PST)
Received: by mail-wr0-f181.google.com with SMTP id p69so2001117wrb.8
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jan 2018 08:36:02 -0800 (PST)
In-Reply-To: <5A4E63A3020000780019B1ED@prv-mh.provo.novell.com>
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

T24gVGh1LCBKYW4gNCwgMjAxOCBhdCA5OjI1IEFNLCBKYW4gQmV1bGljaCA8SkJldWxpY2hAc3Vz
ZS5jb20+IHdyb3RlOgo+Pj4+IE9uIDA0LjAxLjE4IGF0IDE3OjE2LCA8dGFtYXNAdGtsZW5neWVs
LmNvbT4gd3JvdGU6Cj4+IE9uIFRodSwgSmFuIDQsIDIwMTggYXQgODowMCBBTSwgSmFuIEJldWxp
Y2ggPEpCZXVsaWNoQHN1c2UuY29tPiB3cm90ZToKPj4+Pj4+IE9uIDA0LjAxLjE4IGF0IDE1OjM5
LCA8dGFtYXNAdGtsZW5neWVsLmNvbT4gd3JvdGU6Cj4+Pj4gT24gVGh1LCBKYW4gNCwgMjAxOCBh
dCAzOjQzIEFNLCBKYW4gQmV1bGljaCA8SkJldWxpY2hAc3VzZS5jb20+IHdyb3RlOgo+Pj4+PiBK
dXN0IGxvb2tpbmcgYXQgdGhlIGxvdyBiaXQgb2YgdGhlIGZpcnN0Cj4+Pj4+IGJ5dGUgYmVmb3Jl
IGFzc3VtaW5nIHRoaXMgY291bGQgYmUgYSBsb2FkIG9wdGlvbiBzdHJ1Y3R1cmUsCj4+Pj4+IGhv
d2V2ZXIsIGlzIHRvbyB3ZWFrIGEgY2hlY2sgZm9yIG15IHRhc3RlLgo+Pj4+Cj4+Pj4gVGhlcmUg
aXMgbW9yZSBkb25lIGluIHRoaXMgcGF0Y2ggdGhlbiBqdXN0IGNoZWNraW5nIHRoZSBsb3cgYml0
IG9mIHRoZQo+Pj4+IEF0dHJpYnV0ZXMgZmllbGQ6IGNhbGN1bGF0aW5nIHdoZXJlIHRoZSBPcHRp
b25hbERhdGEgc2hvdWxkIGJlIGlmIHRoaXMKPj4+PiBpcyBpbmRlZWQgYW4gRUZJX0xPQURfT1BU
SU9OIGFuZCB0aGVuIHNhbml0eSBjaGVja2luZyBpZiB0aGF0IGFkZHJlc3MKPj4+PiBpcyBzYW5l
IG9yIG5vdC4gVGhpcyByZXF1aXJlcyB0aGUgYnVmZmVyIHRvIGhhdmUgYSBsYXlvdXQgdGhhdCBh
dAo+Pj4+IGxlYXN0IHBhcnNlcyBwcm9wZXJseSBhcyBhbiBFRklfTE9BRF9PUFRJT04sIGhlbmNl
IGl0IGxpa2VseSBpcyBvbmUuLgo+Pj4KPj4+IEJ1dCB0aGF0IGNhbGN1bGF0aW9uIGlzIG5vdCBk
b2luZyBhbGwgdGhlIGNoZWNraW5nIHRoYXQgd291bGQgYmUKPj4+IG5lZWRlZCB0byBiZSByZWFz
b25hYmx5IHNhZmUuIEluIHBhcnRpY3VsYXIsIHlvdSBtdXN0bid0IGNhbGwKPj4+IHdzdHJsZW4o
KSB3aGVuIHlvdSBkb24ndCBrbm93IHdoZXRoZXIgYWxsIG9mIHRoZSBzdXBwb3NlZAo+Pj4gc3Ry
aW5nIGlzIGFjdHVhbGx5IGluc2lkZSB0aGUgZ2l2ZW4gbWVtb3J5IGJsb2NrIHNpemUuIEFuZCBJ
J20KPj4+IGFsc28gbm90IGVudGlyZWx5IGNlcnRhaW4gd2hldGhlciBjYXJpbmcgb2Ygb3ZlcmZs
b3cgaW4gb25seSBvbmUKPj4+IChsYXRlKSBwbGFjZSBpcyBzdWZmaWNpZW50Lgo+Pgo+PiBGYWly
IGVub3VnaC4gSG93IGFib3V0IGlmIHdlIGNoZWNrIHdoZXRoZXIgdGhlIHN1cHBvc2VkIHN0cmlu
ZyBzdGFydAo+PiBzcG90IGlzIHdpdGhpbiB0aGUgYnVmZmVyIGFuZCB0aGVuIHVzZSB3c3Rybmxl
biBpbiBwbGFjZSBzdWNoIHRoYXQgaXQKPj4gY2FuJ3QgZ28gcGFzdCB0aGUgYnVmZmVyPyBXb3Vs
ZCB0aGF0IGJlIGVub3VnaCBzYW5pdHkgY2hlY2tpbmc/Cj4KPiBUaGF0IHNob3VsZCBiZSBlbm91
Z2gsIHllcy4gRG8gd2UgaGF2ZSB3c3RybmxlbigpIHRob3VnaD8KPiBSYXRoZXIgdGhhbiBpbnRy
b2R1Y2luZyBpdCwgb3Blbi1jb2RpbmcgdGhlIHNlYXJjaCBmb3IgdGhlIG51bAo+IHRlcm1pbmF0
b3IgbWF5IGJlIG1vcmUgYXBwcm9wcmlhdGUgaW4gYSBjYXNlIGxpa2UgdGhpcyBvbmUuCgpXZSBk
b24ndCBoYXZlIGl0IGN1cnJlbnRseS4gSSB3b3VsZCBwcmVmZXIgaW50cm9kdWNpbmcgaXQgYXMg
YQpzZXBhcmF0ZSBmdW5jdGlvbiBidXQgaWYgeW91IGZlZWwgc3Ryb25nbHkgYWJvdXQgaXQgYmVp
bmcgaW1wbGVtZW50ZWQKaW4tcGxhY2UsIEkgY2FuIGRvIHRoYXQuCgpUYW1hcwoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
