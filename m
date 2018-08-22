From: Oleksandr Tyshchenko <olekstysh@gmail.com>
Subject: Re: [PATCH v1 0/4] Renesas Stout board support (R-Car
 Gen2)
Date: Wed, 22 Aug 2018 18:53:10 +0300
Message-ID: <CAPD2p-kqX-iUMZL3YQegbYq0Xu49SDfTay5V9VxJNXhmX-tz_w@mail.gmail.com>
References: <1533580552-938-1-git-send-email-olekstysh@gmail.com>
 <0a4bcf37-e9f6-0705-cf3d-8de3f8be6d3e@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=ri1z=lf=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1fsVRZ-00017k-3g
 for xen-devel@lists.xenproject.org; Wed, 22 Aug 2018 15:53:13 +0000
Received: by mail-it0-x242.google.com with SMTP id t69-v6so2857812itb.4
 for <xen-devel@lists.xenproject.org>; Wed, 22 Aug 2018 08:53:11 -0700 (PDT)
In-Reply-To: <0a4bcf37-e9f6-0705-cf3d-8de3f8be6d3e@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: Artem Mygaiev <Artem_Mygaiev@epam.com>, xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>, Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBBdWcgMjIsIDIwMTggYXQgNjo0OCBQTSwgSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3Jh
bGxAYXJtLmNvbT4gd3JvdGU6Cj4gT24gMDYvMDgvMTggMTk6MzUsIE9sZWtzYW5kciBUeXNoY2hl
bmtvIHdyb3RlOgo+Pgo+PiBIaSwgYWxsLgo+Cj4KPiBIaSwKSGksIEp1bGllbgoKPgo+IENhbiB5
b3UgQ0MgcmVsZXZhbnQgcGVvcGxlIG9uIHRoZSBjb3ZlciBsZXR0ZXI/IEl0IHdvdWxkIHNhdmUg
bWUgdGltZSB0byBkaWcKPiBpbnRvIG15IGUtbWFpbCA6KS4KU3VyZS4KCj4KPj4KPj4gVGhlIHB1
cnBvc2Ugb2YgdGhpcyBwYXRjaCBzZXJpZXMgaXMgdG8gYWRkIHJlcXVpcmVkIHN1cHBvcnQgdG8g
YmUgYWJsZSB0bwo+PiBydW4gWGVuIG9uCj4+IFJlbmVzYXMgU3RvdXQgYm9hcmQgWzFdIHdoaWNo
IHVzZXMgU0NJRkEgY29tcGF0aWJsZSBVQVJUIGFzIGEgY29uc29sZQo+PiBpbnRlcmZhY2UuCj4+
Cj4+IEFjdHVhbGx5IFhlbiBhbHJlYWR5IGhhcyBzdXBwb3J0IGZvciBTQ0lGIGNvbXBhdGlibGUg
VUFSVHMgd2hpY2ggYXJlIHVzZWQKPj4gb24gUmVuZXNhcyBMYWdlciAoUi1DYXIgR2VuMiksCj4+
IFNhbHZhdG9yLVgsIEgzVUxDQi9NM1VMQ0IgKFItQ2FyIEdlbjMpIGFuZCBvdGhlciBkZXZlbG9w
bWVudCBib2FyZHMuCj4+IFNvIHRoaXMgcGF0Y2ggc2VyaWVzIGV4dGVuZHMgZXhpc3Rpbmcgc3Vw
cG9ydCB0byBiZSBhYmxlIHRvIGhhbmRsZSBib3RoCj4+IGludGVyZmFjZXMuCj4+Cj4+IFRlc3Rl
ZCBvbiBTdG91dCAoQVJNMzIpIGFuZCBIM1VMQ0IgKEFSTTY0KSBib2FyZHMgdXNpbmcgY3VycmVu
dCBtYXN0ZXIuCj4+IEhhdmUgYSBwbGFuIHRvIHVwZGF0ZSBYZW4gV2lraSByZWdhcmRpbmcgdGhp
cyBib2FyZC4KPj4KPj4gWW91IGNhbiBmaW5kIGN1cnJlbnQgcGF0Y2ggc2VyaWVzIGhlcmU6Cj4+
IHJlcG86IGh0dHBzOi8vZ2l0aHViLmNvbS9vdHlzaGNoZW5rbzEveGVuLmdpdCBicmFuY2g6Cj4+
IHN0b3V0X3hlbl80LjEyX3Vuc3RhYmxlCj4+Cj4+IFsxXSBodHRwczovL2VsaW51eC5vcmcvUi1D
YXIvQm9hcmRzL1N0b3V0Cj4+Cj4+IE9sZWtzYW5kciBUeXNoY2hlbmtvICg0KToKPj4gICAgeGVu
L2FybTogZHJpdmVyczogc2NpZjogUmVtb3ZlIHVudXNlZCAjZGVmaW5lLXMKPgo+Cj4gSSBoYXZl
IGNvbW1pdHRlZCB0aGlzIHBhdGNoLiBUaGUgcmVzdCByZXF1aXJlcyBhIHJlc3Bpbi4KVGhhbmsg
eW91LgoKPgo+IENoZWVycywKPgo+IC0tCj4gSnVsaWVuIEdyYWxsCgoKCi0tIApSZWdhcmRzLAoK
T2xla3NhbmRyIFR5c2hjaGVua28KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
