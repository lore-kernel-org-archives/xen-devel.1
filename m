From: Tamas K Lengyel <tamas@tklengyel.com>
Subject: Re: [PATCH] xen: Add EFI_LOAD_OPTION support
Date: Thu, 4 Jan 2018 10:00:50 -0700
Message-ID: <CABfawh=15cMB4kEPfLmSt+3dm7X6+8zr29XssUrkj5z8VqNfSg@mail.gmail.com>
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
 <CABfawhnVCEpiNY=h7okgT0Lq-HgRu8o07F=NaWmGXbmtTpmKzA@mail.gmail.com>
 <5A4E683F020000780019B200@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=8sab=d7=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1eX8tb-0005V6-C2
 for xen-devel@lists.xenproject.org; Thu, 04 Jan 2018 17:01:35 +0000
Received: by mail-wm0-f41.google.com with SMTP id a79so4568893wma.0
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jan 2018 09:01:33 -0800 (PST)
Received: from mail-wr0-f178.google.com (mail-wr0-f178.google.com.
 [209.85.128.178])
 by smtp.gmail.com with ESMTPSA id m23sm2399865edc.27.2018.01.04.09.01.31
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 04 Jan 2018 09:01:31 -0800 (PST)
Received: by mail-wr0-f178.google.com with SMTP id p17so2093578wre.7
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jan 2018 09:01:31 -0800 (PST)
In-Reply-To: <5A4E683F020000780019B200@prv-mh.provo.novell.com>
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

T24gVGh1LCBKYW4gNCwgMjAxOCBhdCA5OjQ1IEFNLCBKYW4gQmV1bGljaCA8SkJldWxpY2hAc3Vz
ZS5jb20+IHdyb3RlOgo+Pj4+IE9uIDA0LjAxLjE4IGF0IDE3OjM1LCA8dGFtYXNAdGtsZW5neWVs
LmNvbT4gd3JvdGU6Cj4+IE9uIFRodSwgSmFuIDQsIDIwMTggYXQgOToyNSBBTSwgSmFuIEJldWxp
Y2ggPEpCZXVsaWNoQHN1c2UuY29tPiB3cm90ZToKPj4+Pj4+IE9uIDA0LjAxLjE4IGF0IDE3OjE2
LCA8dGFtYXNAdGtsZW5neWVsLmNvbT4gd3JvdGU6Cj4+Pj4gT24gVGh1LCBKYW4gNCwgMjAxOCBh
dCA4OjAwIEFNLCBKYW4gQmV1bGljaCA8SkJldWxpY2hAc3VzZS5jb20+IHdyb3RlOgo+Pj4+Pj4+
PiBPbiAwNC4wMS4xOCBhdCAxNTozOSwgPHRhbWFzQHRrbGVuZ3llbC5jb20+IHdyb3RlOgo+Pj4+
Pj4gT24gVGh1LCBKYW4gNCwgMjAxOCBhdCAzOjQzIEFNLCBKYW4gQmV1bGljaCA8SkJldWxpY2hA
c3VzZS5jb20+IHdyb3RlOgo+Pj4+Pj4+IEp1c3QgbG9va2luZyBhdCB0aGUgbG93IGJpdCBvZiB0
aGUgZmlyc3QKPj4+Pj4+PiBieXRlIGJlZm9yZSBhc3N1bWluZyB0aGlzIGNvdWxkIGJlIGEgbG9h
ZCBvcHRpb24gc3RydWN0dXJlLAo+Pj4+Pj4+IGhvd2V2ZXIsIGlzIHRvbyB3ZWFrIGEgY2hlY2sg
Zm9yIG15IHRhc3RlLgo+Pj4+Pj4KPj4+Pj4+IFRoZXJlIGlzIG1vcmUgZG9uZSBpbiB0aGlzIHBh
dGNoIHRoZW4ganVzdCBjaGVja2luZyB0aGUgbG93IGJpdCBvZiB0aGUKPj4+Pj4+IEF0dHJpYnV0
ZXMgZmllbGQ6IGNhbGN1bGF0aW5nIHdoZXJlIHRoZSBPcHRpb25hbERhdGEgc2hvdWxkIGJlIGlm
IHRoaXMKPj4+Pj4+IGlzIGluZGVlZCBhbiBFRklfTE9BRF9PUFRJT04gYW5kIHRoZW4gc2FuaXR5
IGNoZWNraW5nIGlmIHRoYXQgYWRkcmVzcwo+Pj4+Pj4gaXMgc2FuZSBvciBub3QuIFRoaXMgcmVx
dWlyZXMgdGhlIGJ1ZmZlciB0byBoYXZlIGEgbGF5b3V0IHRoYXQgYXQKPj4+Pj4+IGxlYXN0IHBh
cnNlcyBwcm9wZXJseSBhcyBhbiBFRklfTE9BRF9PUFRJT04sIGhlbmNlIGl0IGxpa2VseSBpcyBv
bmUuLgo+Pj4+Pgo+Pj4+PiBCdXQgdGhhdCBjYWxjdWxhdGlvbiBpcyBub3QgZG9pbmcgYWxsIHRo
ZSBjaGVja2luZyB0aGF0IHdvdWxkIGJlCj4+Pj4+IG5lZWRlZCB0byBiZSByZWFzb25hYmx5IHNh
ZmUuIEluIHBhcnRpY3VsYXIsIHlvdSBtdXN0bid0IGNhbGwKPj4+Pj4gd3N0cmxlbigpIHdoZW4g
eW91IGRvbid0IGtub3cgd2hldGhlciBhbGwgb2YgdGhlIHN1cHBvc2VkCj4+Pj4+IHN0cmluZyBp
cyBhY3R1YWxseSBpbnNpZGUgdGhlIGdpdmVuIG1lbW9yeSBibG9jayBzaXplLiBBbmQgSSdtCj4+
Pj4+IGFsc28gbm90IGVudGlyZWx5IGNlcnRhaW4gd2hldGhlciBjYXJpbmcgb2Ygb3ZlcmZsb3cg
aW4gb25seSBvbmUKPj4+Pj4gKGxhdGUpIHBsYWNlIGlzIHN1ZmZpY2llbnQuCj4+Pj4KPj4+PiBG
YWlyIGVub3VnaC4gSG93IGFib3V0IGlmIHdlIGNoZWNrIHdoZXRoZXIgdGhlIHN1cHBvc2VkIHN0
cmluZyBzdGFydAo+Pj4+IHNwb3QgaXMgd2l0aGluIHRoZSBidWZmZXIgYW5kIHRoZW4gdXNlIHdz
dHJubGVuIGluIHBsYWNlIHN1Y2ggdGhhdCBpdAo+Pj4+IGNhbid0IGdvIHBhc3QgdGhlIGJ1ZmZl
cj8gV291bGQgdGhhdCBiZSBlbm91Z2ggc2FuaXR5IGNoZWNraW5nPwo+Pj4KPj4+IFRoYXQgc2hv
dWxkIGJlIGVub3VnaCwgeWVzLiBEbyB3ZSBoYXZlIHdzdHJubGVuKCkgdGhvdWdoPwo+Pj4gUmF0
aGVyIHRoYW4gaW50cm9kdWNpbmcgaXQsIG9wZW4tY29kaW5nIHRoZSBzZWFyY2ggZm9yIHRoZSBu
dWwKPj4+IHRlcm1pbmF0b3IgbWF5IGJlIG1vcmUgYXBwcm9wcmlhdGUgaW4gYSBjYXNlIGxpa2Ug
dGhpcyBvbmUuCj4+Cj4+IFdlIGRvbid0IGhhdmUgaXQgY3VycmVudGx5LiBJIHdvdWxkIHByZWZl
ciBpbnRyb2R1Y2luZyBpdCBhcyBhCj4+IHNlcGFyYXRlIGZ1bmN0aW9uIGJ1dCBpZiB5b3UgZmVl
bCBzdHJvbmdseSBhYm91dCBpdCBiZWluZyBpbXBsZW1lbnRlZAo+PiBpbi1wbGFjZSwgSSBjYW4g
ZG8gdGhhdC4KPgo+IFRoZSBtYWluIHJlYXNvbiBJIHdvdWxkbid0IHdhbnQgaXQgdG8gYmUgaW50
cm9kdWNlZCBpbiB0aGlzIGNhc2UKPiBpcyB0aGF0IGl0J3Mgbm90IHN0cmljdGx5IHRoYXQgZnVu
Y3Rpb24gdGhhdCdzIG5lZWRlZC4gd21lbWNocigpCj4gb3Igd3N0cmNocigpIGNvdWxkIGJvdGgg
YmUgdXNlZCBhcyB3ZWxsIChhbmQgcGVyaGFwcyBhIGZldyBtb3JlKSwKPiBzbyB3aGljaCBvbmUg
aW4gcGFydGljdWxhciB0byB1c2UgdG8gYXZvaWQgdGhlIG9wZW4gY29kaW5nIEknZCBsaWtlCj4g
dG8gZGVjaWRlIGF0IHRoZSBwb2ludCB3aGVuIGFub3RoZXIgdXNlciBvZiBhbnkgb2YgdGhlIG9w
dGlvbnMKPiB3b3VsZCBhcHBlYXIuIFRoYXQgd2F5IHdlIGRvbid0IGVuZCB1cCB3aXRoIHR3byBm
dW5jdGlvbnMgdXNlZAo+IGp1c3Qgb25jZS4gQnV0IHRoZW4gYWdhaW4gSSBkb24ndCBmZWVsIF9y
ZWFsbHlfIHN0cm9uZ2x5IGFib3V0IHRoaXMuCj4KCk1ha2VzIHNlbnNlLgoKVGFtYXMKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
