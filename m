From: George Dunlap <dunlapg@umich.edu>
Subject: Re: reboot driver domain, vifX.Y = NO-CARRIER?
Date: Mon, 30 Apr 2018 17:38:55 +0100
Message-ID: <CAFLBxZadX15mEQbFCa_C94WneY0NiaNfgXhz=Vw0xkjjmf4zqQ@mail.gmail.com>
References: <20180427150346.GA17249@io.lakedaemon.net>
 <1735e92a-7a38-a08d-2b5b-1481409b3dbd@citrix.com>
 <20180427153526.GB17249@io.lakedaemon.net>
 <d8a69ce8-f4ab-63a1-70d8-dc0ad73ef192@citrix.com>
 <20180427161416.GC17249@io.lakedaemon.net>
 <f8d5d228-ff93-c388-6e64-5e1d92c85f22@citrix.com>
 <20180427171352.wftxapwflz2gm6qn@citrix.com>
 <23271.13494.638544.432776@mariner.uk.xensource.com>
 <20180430161609.GH17249@io.lakedaemon.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=b5i8=ht=gmail.com=dunlapg@srs-us1.protection.inumbo.net>)
 id 1fDBpK-0004xZ-Ac
 for xen-devel@lists.xenproject.org; Mon, 30 Apr 2018 16:38:58 +0000
Received: by mail-qk0-x22e.google.com with SMTP id x22so7058225qkb.12
 for <xen-devel@lists.xenproject.org>; Mon, 30 Apr 2018 09:38:56 -0700 (PDT)
In-Reply-To: <20180430161609.GH17249@io.lakedaemon.net>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jason Cooper <xen@lakedaemon.net>
Cc: Ian Jackson <ian.jackson@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBBcHIgMzAsIDIwMTggYXQgNToxNiBQTSwgSmFzb24gQ29vcGVyIDx4ZW5AbGFrZWRh
ZW1vbi5uZXQ+IHdyb3RlOgo+IEhpIElhbiwKPgo+IE9uIE1vbiwgQXByIDMwLCAyMDE4IGF0IDA0
OjIyOjMwUE0gKzAxMDAsIElhbiBKYWNrc29uIHdyb3RlOgo+PiBXZWkgTGl1IHdyaXRlcyAoIlJl
OiBbWGVuLWRldmVsXSByZWJvb3QgZHJpdmVyIGRvbWFpbiwgdmlmWC5ZID0gTk8tQ0FSUklFUj8i
KToKPj4gPiBUbyBpbXBsZW1lbnQgcmV1c2VfZG9taWQgaW4gYSBzYW5lIHdheSwgZWl0aGVyIHRo
ZSB0b29sc3RhY2sgbmVlZHMgdG8KPj4gPiBtYW5hZ2UgYWxsIGRvbWlkcyBhbmQgYWx3YXlzIHNl
dHMgZG9taWQgd2hlbiBjcmVhdGluZyBkb21haW4gb3IgdGhlCj4+ID4gaHlwZXJ2aXNvciBuZWVk
cyB0byBjb29wZXJhdGUgLS0gdG8gaGF2ZSBpbnRlcmZhY2UgdG8gcmVzZXJ2ZSAvCj4+ID4gcHJl
LWFsbG9jYXRlIGRvbWlkcy4KPj4KPj4gSSB0aGluayB0aGlzIGlzIGVudGlyZWx5IHRoZSB3cm9u
ZyBhcHByb2FjaC4KPgo+IFdoZXcuICBHbGFkIEkgZGlkbid0IHN0YXJ0IGhhY2tpbmcgeWV0Li4u
Cj4KPj4gSSB0aGluayB0aGUgcmlnaHQgYW5zd2VyIGlzIHRoYXQgdGhpcyBpcyBzaW1wbHkgYSBi
dWcgaW4gdGhlCj4+IGZyb250ZW5kcy4gIGZyb250ZW5kcyBzaG91bGQgY29wZSBpZiB0aGUgYmFj
a2VuZCBwYXRoIHBvaW50ZXIgaW4gdGhlCj4+IGZyb250ZW5kIGRpcmVjdG9yeSBpcyB1cGRhdGVk
LCBhbmQgc2hvdWxkIHN0YXJ0IHJlYWRpbmcgdGhlIG5ldwo+PiBiYWNrZW5kIGluc3RlYWQuCj4K
PiBPaywgc28gSSdtIG5ldyB0byB0aGUgZ3V0cyBvZiBYZW4uICBUaGUgYnVnLCBhdCBhIGhpZ2gg
bGV2ZWwsIGlzIHRoYXQKPiAiV2hlbiBhIGRyaXZlciBkb21haW4gaXMgcmVib290ZWQgKGRvbWlk
IGNoYW5nZWQpLCBwcmV2aW91c2x5IGNvbm5lY3RlZAo+IGNsaWVudCBkb21VcyBjYW4ndCBnYWlu
IG5ldHdvcmsgY29ubmVjdGl2aXR5IHRvL3Rocm91Z2ggdGhlIGRyaXZlcgo+IGRvbWFpbiB2aWEg
J3hsIG5ldHdvcmstYXR0YWNoIGNsaWVudF9kb211IG1hYz0uLi4gYnJpZGdlPS4uLgo+IGJhY2tl
bmQ9ZHJ2X2RvbSciCgpIYW5nIG9uIC0tIGp1c3QgdG8gY2xhcmlmeSwgc29tZXRoaW5nIGxpa2Ug
dGhlIGZvbGxvd2luZyBkb2Vzbid0IHdvcmsKKG9yIHdvdWxkbid0LCB5b3Ugc3VzcGVjdCwgd29y
ayk/CgoqIFN0YXJ0IGRyaXZlciBkb21haW4KKiBTdGFydCBkb21VIEEgd2l0aCBubyBuZXR3b3Jr
CiogeGwgbmV0d29yay1hdHRhY2ggQSBiYWNrZW5kPWRydl9kb20KKiBbZG8gc29tZSBzdHVmZl0K
KiB4bCBuZXR3b3JrLWRldGFjaCBBIFtuZXR3b3JrIGRldmlkXQoqIFJlc3RhcnQgZHJpdmVyIGRv
bWFpbgoqIHhsIG5ldHdvcmstYXR0YWNoIEEgYmFja2VuZD1kcnZfZG9tCgogLUdlb3JnZQoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
