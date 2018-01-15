From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Subject: Re: [PATCH] docs: note default for timer_mode in xl.cfg
 man
Date: Mon, 15 Jan 2018 09:56:36 +0000
Message-ID: <20180115095636.qoaoz2wyccau7ngc@MacBook-Pro-de-Roger.local>
References: <20180115052815.19255-1-cardoe@cardoe.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=ye/h=ek=citrix.com=prvs=54622e440=roger.pau@srs-us1.protection.inumbo.net>)
 id 1eb1VX-0001CD-TY
 for xen-devel@lists.xenproject.org; Mon, 15 Jan 2018 09:56:47 +0000
Content-Disposition: inline
In-Reply-To: <20180115052815.19255-1-cardoe@cardoe.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Doug Goldstein <cardoe@cardoe.com>
Cc: George Dunlap <george.dunlap@eu.citrix.com>, xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gU3VuLCBKYW4gMTQsIDIwMTggYXQgMTE6Mjg6MTVQTSAtMDYwMCwgRG91ZyBHb2xkc3RlaW4g
d3JvdGU6Cj4gVGhlcmUgd2FzIG5vIGRlZmF1bHQgZG9jdW1lbnRlZCBidXQgdGhlIGhlYWRlciBh
dAo+IHhlbi9pbmNsdWRlL3B1YmxpYy9odm0vcGFyYW1zLmggc3RhdGVkIHdoaWNoIHRoZSBkZWZh
dWx0IHdhcywgc28gYWRkIGl0Cj4gdG8gdGhlIGRvY3MuCj4gCj4gU2lnbmVkLW9mZi1ieTogRG91
ZyBHb2xkc3RlaW4gPGNhcmRvZUBjYXJkb2UuY29tPgo+IC0tLQo+IENDOiBXZWkgTGl1IDx3ZWku
bGl1MkBjaXRyaXguY29tPgo+IENDOiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4
LmNvbT4KPiAjIEdlb3JnZSBmb3IgdGhlIDQuOCBhbmQgNC45IGJhY2twb3J0Cj4gQ0M6IEdlb3Jn
ZSBEdW5sYXAgPGdlb3JnZS5kdW5sYXBAZXUuY2l0cml4LmNvbT4KPiAtLS0KPiAgZG9jcy9tYW4v
eGwuY2ZnLnBvZC41LmluIHwgMyArKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygr
KSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9kb2NzL21hbi94bC5jZmcucG9kLjUu
aW4gYi9kb2NzL21hbi94bC5jZmcucG9kLjUuaW4KPiBpbmRleCBiN2I5MWQ4NjI3Li4zNThhMzc4
ZTFlIDEwMDY0NAo+IC0tLSBhL2RvY3MvbWFuL3hsLmNmZy5wb2QuNS5pbgo+ICsrKyBiL2RvY3Mv
bWFuL3hsLmNmZy5wb2QuNS5pbgo+IEBAIC0yMzQ4LDcgKzIzNDgsOCBAQCBTcGVjaWZpZXMgdGhl
IG1vZGUgZm9yIFZpcnR1YWwgVGltZXJzLiBUaGUgdmFsaWQgdmFsdWVzIGFyZSBhcyBmb2xsb3dz
Ogo+ICBEZWxheSBmb3IgbWlzc2VkIHRpY2tzLiBEbyBub3QgYWR2YW5jZSBhIHZDUFUncyB0aW1l
IGJleW9uZCB0aGUKPiAgY29ycmVjdCBkZWxpdmVyeSB0aW1lIGZvciBpbnRlcnJ1cHRzIHRoYXQg
aGF2ZSBiZWVuIG1pc3NlZCBkdWUgdG8KPiAgcHJlZW1wdGlvbi4gRGVsaXZlciBtaXNzZWQgaW50
ZXJydXB0cyB3aGVuIHRoZSB2Q1BVIGlzIHJlc2NoZWR1bGVkIGFuZAo+IC1hZHZhbmNlIHRoZSB2
Q1BVJ3MgdmlydHVhbCB0aW1lIHN0ZXB3aXNlIGZvciBlYWNoIG9uZS4KPiArYWR2YW5jZSB0aGUg
dkNQVSdzIHZpcnR1YWwgdGltZSBzdGVwd2lzZSBmb3IgZWFjaCBvbmUuIFRoaXMgaXMgdGhlCj4g
K2RlZmF1bHQuCgpUaGlzIEFGQUlDVCBhbHNvIG5lZWRzIHRvIGJlIGZpeGVkIGZvciBIVk0gZ3Vl
c3RzLCBhcm91bmQgbGluZSB+MTkyMQppbiB0aGUgc2FtZSBkb2MuCgpUaGFua3MsIFJvZ2VyLgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
