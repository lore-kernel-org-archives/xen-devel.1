From: Anthony Liguori <anthony@codemonkey.ws>
Subject: Re: [PATCH 10/22] vixen: do not permit access to
 physical IRQs if in Vixen mode
Date: Sun, 7 Jan 2018 07:28:55 -0800
Message-ID: <CA+aC4ktDNRfbFXt_aWJ4dgfVf_u__cSppZVhNJ1=GUyuX8Eb4Q@mail.gmail.com>
References: <1515279277-16301-1-git-send-email-aliguori@amzn.com>
 <1515279277-16301-11-git-send-email-aliguori@amzn.com>
 <20180107081806.rlv2zorbdmwhlard@MacBook-Pro-de-Roger.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=swlg=ec=codemonkey.ws=anthony@srs-us1.protection.inumbo.net>)
 id 1eYCsc-0007AM-CU
 for xen-devel@lists.xenproject.org; Sun, 07 Jan 2018 15:28:58 +0000
Received: by mail-lf0-x235.google.com with SMTP id y71so9651274lfd.12
 for <xen-devel@lists.xenproject.org>; Sun, 07 Jan 2018 07:28:57 -0800 (PST)
In-Reply-To: <20180107081806.rlv2zorbdmwhlard@MacBook-Pro-de-Roger.local>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Anthony Liguori <aliguori@amzn.com>, Wei Liu <wei.liu2@citrix.com>, Matt Wilson <msw@amazon.com>, KarimAllah Ahmed <karahmed@amazon.de>, Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Jan_H=2E_Sch=C3=B6nherr?= <jschoenh@amazon.de>, Anthony Liguori <aliguori@amazon.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gU3VuLCBKYW4gNywgMjAxOCBhdCAxMjoxOCBBTSwgUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIu
cGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+IE9uIFNhdCwgSmFuIDA2LCAyMDE4IGF0IDAyOjU0OjI1
UE0gLTA4MDAsIEFudGhvbnkgTGlndW9yaSB3cm90ZToKPj4gRnJvbTogQW50aG9ueSBMaWd1b3Jp
IDxhbGlndW9yaUBhbWF6b24uY29tPgo+Pgo+PiBPdXIgaW50ZW50aW9uIGlzIGZvciB0aGUgVml4
ZW4gZ3Vlc3QgdG8gYmUgZGVwcml2aWxlZ2VkIHNvIHdlIG5lZWQKPj4gdG8gYXZvaWQgcGVybWl0
dGluZyBhY2Nlc3MgdG8gZWFjaCBJUlEgZXZlbiB0aG91Z2ggaXQgaXMgdGVjaG5pY2FsbHkKPj4g
dGhlIGhhcmR3YXJlIGRvbWFpbi4KPgo+IEknbSBzdGlsbCBub3Qgc3VyZSBJIHNlZSB3aHkgeW91
IG5lZWQgdGhlIHZpeGVuIGd1ZXN0IHRvIGJlIHRoZQo+IGhhcmR3YXJlX2RvbWFpbi4gT24gdGhl
IHB2LXNoaW0gd29yayB3ZSBtYW5hZ2VkIHRvIG1ha2UgdGhlIGRvbXUgIT0KPiBoYXJkd2FyZV9k
b21haW4sIGFuZCB0aGF0IHNlZW1zIHRvIHdvcmsganVzdCBmaW5lLgoKSSBqdXN0IGhhdmVuJ3Qg
dHJpZWQgaXQgeWV0LiAgSSdsbCB0YWtlIGEgc2hvdCB0b2RheSBhbmQgc2VlIGhvdyBoYXJkIGl0
IGlzLgoKUmVnYXJkcywKCkFudGhvbnkgTGlndW9yaQoKPiBUaGFua3MsIFJvZ2VyLgo+Cj4gX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Cj4gWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCj4gaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
