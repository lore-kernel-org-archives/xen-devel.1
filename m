From: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: [RFC PATCH v2 13/17] xenconsoled: add support for
 up to 3 secondary consoles [and 1 more messages]
Date: Fri, 2 Nov 2018 17:50:03 +0000
Message-ID: <23516.36427.111887.98509@mariner.uk.xensource.com>
References: <cover.f20f4d9289206c83fc15e632ed8ec76ac4e8c8cd.1533608042.git-series.marmarek@invisiblethingslab.com>
 <58fad8fc7a60c5f9a6e107dafb52df2ef3d15665.1533608042.git-series.marmarek@invisiblethingslab.com>
 <23515.14438.209179.640957@mariner.uk.xensource.com>
 <alpine.DEB.2.10.1811011324460.7220@sstabellini-ThinkPad-X260>
 <20181101182559.GE1638@mail-itl>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=vtjf=nn=citrix.com=prvs=837fd0aa5=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1gIdaA-0001GC-Ul
 for xen-devel@lists.xenproject.org; Fri, 02 Nov 2018 17:50:06 +0000
In-Reply-To: <20181101182559.GE1638@mail-itl>,
 <alpine.DEB.2.10.1811011324460.7220@sstabellini-ThinkPad-X260>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Stefano Stabellini <stefano.stabellini@xilinx.com>, Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?= <marmarek@invisiblethingslab.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

TWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tpIHdyaXRlcyAoIlJlOiBbUkZDIFBBVENIIHYyIDEz
LzE3XSB4ZW5jb25zb2xlZDogYWRkIHN1cHBvcnQgZm9yIHVwIHRvIDMgc2Vjb25kYXJ5IGNvbnNv
bGVzIik6Cj4gT24gVGh1LCBOb3YgMDEsIDIwMTggYXQgMDU6MzE6MThQTSArMDAwMCwgSWFuIEph
Y2tzb24gd3JvdGU6Cj4gPiBJJ20gY29uZnVzZWQuICBJIHRob3VnaHQgd2UgYWxyZWFkeSBoYWQg
c3VwcG9ydCBmb3IgbXVsdGlwbGUgUFYKPiA+IGNvbnNvbGVzLiAgSXMgdGhlIHByb2JsZW0gdGhh
dCB0aGUgYmFja2VuZCBpcyBpbiBxZW11IHJhdGhlciB0aGFuCj4gPiB4ZW5jb25zb2xlZCA/ICAK
PiAKPiBPbmUgb2YgbWFpbiByZWFzb25zIGZvciB0aGlzIHdob2xlIHRoaW5nIGlzIHRvIGdldCBy
aWQgb2YgcWVtdSBmcm9tIGRvbTAKPiBhdCBhbGwuIFJlZ2FyZGxlc3MgaWYgaXQncyBoYW5kbGlu
ZyBvbmx5IGNvbnNvbGUsIG9ubHkgZGlzayBvciBvdGhlcgo+IHN0dWZmLiBUaGlzIGlzIGEgbG90
IG9mIGNvZGUgYW5kIEkgZG9uJ3QgY29uc2lkZXIgYXNraW5nIGl0IG5pY2VseQo+ICJwbGVhc2Ug
ZG9uJ3QgbGV0IHJvZ3VlIGRvbWFpbiBsZXQgYXR0YWNrIGFueSBvdGhlciBxZW11IGNvbXBvbmVu
dCIgdG8KPiBiZSBlbm91Z2guIAoKVGhhdCBtYWtlcyBwZXJmZWN0IHNlbnNlLgoKSSdtIHNvcnJ5
IG15IHJlc3BvbnNlcyBvbiB0aGlzIGNvbnNvbGUgc3R1ZmYgd2VyZSBzbyBjb25mdXNlZAp5ZXN0
ZXJkYXkuICBJIHRoaW5rIEkgbmVlZCB0byBnbyBiYWNrIGFuZCByZWFkIHRoaXMgbG90IGFnYWlu
LgoKU3RlZmFubyBTdGFiZWxsaW5pIHdyaXRlcyAoIlJlOiBbUkZDIFBBVENIIHYyIDEzLzE3XSB4
ZW5jb25zb2xlZDogYWRkIHN1cHBvcnQgZm9yIHVwIHRvIDMgc2Vjb25kYXJ5IGNvbnNvbGVzIik6
Cj4gSSBoYXZlbid0IHJlYWQgdGhpcyBwYXRjaCwgYnV0IHllcywgaXQgaXMgYXMgeW91IHdyb3Rl
LiBNdWx0aXBsZSBQVgo+IGNvbnNvbGVzIGFyZSBvbmx5IHN1cHBvcmVkIGJ5IFFFTVUsIHdpdGgg
dGhlIGludGVyZmFjZSBkZXNjcmliZWQgaW4KPiBkb2NzL21pc2MvY29uc29sZS50eHQuIEl0IGNv
dWxkIGJlIG5pY2UgdG8gYmUgYWJsZSB0byBzdXBwb3J0IHRoZW0gd2l0aAo+IHhlbmNvbnNvbGVk
LCBidXQgd2UgbmVlZCB0byBiZSBjYXJlZnVsIHRoZXkgZG9uJ3QgY29uZmxpY3QuIFRoZXJlIGlz
IGEKPiB3YXkgdG8gc3BlY2lmeSB0aGUgZGVzaXJlZCBjb25zb2xlIGJhY2tlbmQsIGVpdGhlciBR
RU1VIG9yIHhlbmNvbnNvbGVkLAo+IHNvIGl0IHNob3VsZG4ndCBiZSBhIHByb2JsZW0gdG8gaGF2
ZSBib3RoIGJhY2tlbmRzIGJlaW5nIGFibGUgdG8gZG8KPiBtdWx0aXBsZSBjb25zb2xlcy4gQnV0
IHdlIHdvdWxkbid0IHdhbnQgdG8gaGF2ZSBhIGRpZmZlcmVudCBpbnRlcmZhY2UKPiBmcm9tIHRo
ZSBvbmUgZGVzY3JpYmVkIGluIGRvY3MvbWlzYy9jb25zb2xlLnR4dCwgb3RoZXJ3aXNlIHdlJ2xs
IGJyZWFrCj4gZXhpc3RpbmcgZ3Vlc3RzIChMaW51eCBmb3IgaW5zdGFuY2UuKQoKUmlnaHQuCgpU
aGFua3MsCklhbi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
