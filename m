From: Anthony Liguori <anthony@codemonkey.ws>
Subject: Re: [PATCH v2 09/23] vixen: modify the e820 table to
 advertise HVM special pages as RAM
Date: Sun, 7 Jan 2018 16:27:03 -0800
Message-ID: <CA+aC4kvzjnaMC6LYVXX0aiRPtrQ1tgZ6=yrrxeTj9q1q36y9RA@mail.gmail.com>
References: <1515356919-922-1-git-send-email-aliguori@amzn.com>
 <1515356919-922-10-git-send-email-aliguori@amzn.com>
 <20180108001837.GZ21689@char.us.oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=h9h4=ed=codemonkey.ws=anthony@srs-us1.protection.inumbo.net>)
 id 1eYLHP-00078V-IL
 for xen-devel@lists.xenproject.org; Mon, 08 Jan 2018 00:27:07 +0000
Received: by mail-lf0-x241.google.com with SMTP id c19so10415445lfg.3
 for <xen-devel@lists.xenproject.org>; Sun, 07 Jan 2018 16:27:05 -0800 (PST)
In-Reply-To: <20180108001837.GZ21689@char.us.oracle.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Cc: Anthony Liguori <aliguori@amzn.com>, Wei Liu <wei.liu2@citrix.com>, Anthony Liguori <aliguori@amazon.com>, KarimAllah Ahmed <karahmed@amazon.de>, Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Jan_H=2E_Sch=C3=B6nherr?= <jschoenh@amazon.de>, Matt Wilson <msw@amazon.com>, xen-devel <xen-devel@lists.xenproject.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gU3VuLCBKYW4gNywgMjAxOCBhdCA0OjE4IFBNLCBLb25yYWQgUnplc3p1dGVrIFdpbGsKPGtv
bnJhZC53aWxrQG9yYWNsZS5jb20+IHdyb3RlOgo+IE9uIFN1biwgSmFuIDA3LCAyMDE4IGF0IDEy
OjI4OjI1UE0gLTA4MDAsIEFudGhvbnkgTGlndW9yaSB3cm90ZToKPj4gRnJvbTogQW50aG9ueSBM
aWd1b3JpIDxhbGlndW9yaUBhbWF6b24uY29tPgo+Cj4gLi5zbmlwLgo+PiBkaWZmIC0tZ2l0IGEv
eGVuL2FyY2gveDg2L2d1ZXN0L3ZpeGVuLmMgYi94ZW4vYXJjaC94ODYvZ3Vlc3Qvdml4ZW4uYwo+
PiBpbmRleCBjMGE4MWRkLi5jYWNiZTY5IDEwMDY0NAo+PiAtLS0gYS94ZW4vYXJjaC94ODYvZ3Vl
c3Qvdml4ZW4uYwo+PiArKysgYi94ZW4vYXJjaC94ODYvZ3Vlc3Qvdml4ZW4uYwo+PiBAQCAtMjMs
NiArMjMsNyBAQAo+Pgo+PiAgc3RhdGljIGludCBpbl92aXhlbjsKPj4gIHN0YXRpYyBpbnQgdml4
ZW5fZG9taWQgPSAxOwo+PiArc3RhdGljIHVpbnQzMl90IHZpeGVuX3Jlc2VydmVkX21lbV9wZ3N0
YXJ0ID0gMHhmZWZmMDAwMDsKPgo+IFRoaXMgaXMgaW50ZXJlc3RpbmcuIFdvdWxkIGl0IG1ha2Ug
c2Vuc2UgdG8gaGF2ZSB0aGlzIGJlCj4gYXV0by1kZXRlY3RlZD8gT3IgYSBib290IHBhcmFtZXRl
ciB0byBvdmVyLXdyaXRlPwoKVGhpcyBpcyBkb25lIGluIGEgbGF0ZXIgcGF0Y2ggKHRoZSBvbmUg
dGhhdCBzZXRzIHVwIGV2ZW50IGNoYW5uZWxzKS4KCkl0IGNhbm5vdCBiZSBkb25lIGhlcmUgYmVj
YXVzZSB3ZSBkb24ndCBoYXZlIGVub3VnaCBpbmZyYXN0cnVjdHVyZS4KCj4+ICBpbnRlZ2VyX3Bh
cmFtKCJ2aXhlbl9kb21pZCIsIHZpeGVuX2RvbWlkKTsKPj4KPj4gQEAgLTM1LDMgKzM2LDExIEBA
IGludCB2aXhlbl9nZXRfZG9taWQodm9pZCkKPj4gIHsKPj4gICAgICByZXR1cm4gdml4ZW5fZG9t
aWQ7Cj4+ICB9Cj4+ICsKPj4gK3ZvaWQgdml4ZW5fZ2V0X3Jlc2VydmVkX21lbSh1bnNpZ25lZCBs
b25nICpzdGFydF9wZm4sIHVuc2lnbmVkIGxvbmcgKmVuZF9wZm4pCj4+ICt7Cj4+ICsgICAgKnN0
YXJ0X3BmbiA9IHZpeGVuX3Jlc2VydmVkX21lbV9wZ3N0YXJ0ID4+IFhFTl9QQUdFX1NISUZUOwo+
PiArCj4+ICsgICAgLyogVGhpcyBpcyBwYXJ0IG9mIHRoZSBYZW4gQUJJICovCj4KPiAuLiB3aGlj
aCBvbmUgOi0pID8KCmluY2x1ZGUvcHVibGljL2h2bS9odm1faW5mb190YWJsZS5oLiAgU2VlIHRo
ZSBjb21tZW50IGFyb3VuZApyZXNlcnZlZF9tZW1fcGdzdGFydC4KClJlZ2FyZHMsCgpBbnRob255
IExpZ3VvcmkKCj4+ICsgICAgKmVuZF9wZm4gICA9IDB4MTAwMDAwOwo+PiArfQo+Cj4gX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Cj4gWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCj4gaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
