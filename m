From: Anthony Liguori <anthony@codemonkey.ws>
Subject: Re: [PATCH v2 13/23] vixen: Use SCHEDOP_shutdown to
 shutdown the machine
Date: Sun, 7 Jan 2018 16:27:59 -0800
Message-ID: <CA+aC4kvrYFDNwO3eW9AUi=zKdvTdpcbycpQbL7SMpBvEd14+yg@mail.gmail.com>
References: <1515356919-922-1-git-send-email-aliguori@amzn.com>
 <1515356919-922-14-git-send-email-aliguori@amzn.com>
 <20180108002253.GA21689@char.us.oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=h9h4=ed=codemonkey.ws=anthony@srs-us1.protection.inumbo.net>)
 id 1eYLII-0007Gg-M3
 for xen-devel@lists.xenproject.org; Mon, 08 Jan 2018 00:28:02 +0000
Received: by mail-lf0-x243.google.com with SMTP id c19so10416667lfg.3
 for <xen-devel@lists.xenproject.org>; Sun, 07 Jan 2018 16:28:01 -0800 (PST)
In-Reply-To: <20180108002253.GA21689@char.us.oracle.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Cc: Anthony Liguori <aliguori@amzn.com>, Wei Liu <wei.liu2@citrix.com>, KarimAllah Ahmed <karahmed@amazon.de>, Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Jan_H=2E_Sch=C3=B6nherr?= <jschoenh@amazon.de>, Matt Wilson <msw@amazon.com>, xen-devel <xen-devel@lists.xenproject.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gU3VuLCBKYW4gNywgMjAxOCBhdCA0OjIyIFBNLCBLb25yYWQgUnplc3p1dGVrIFdpbGsKPGtv
bnJhZC53aWxrQG9yYWNsZS5jb20+IHdyb3RlOgo+IE9uIFN1biwgSmFuIDA3LCAyMDE4IGF0IDEy
OjI4OjI5UE0gLTA4MDAsIEFudGhvbnkgTGlndW9yaSB3cm90ZToKPj4gRnJvbTogSmFuIEguIFNj
aMO2bmhlcnIgPGpzY2hvZW5oQGFtYXpvbi5kZT4KPj4KPj4gV2hpbGUgdGhlIGh3ZG9tX3NodXRk
b3duKCkgaXMgYWJsZSB0byByZWJvb3QgdGhlIHN5c3RlbSwgaXQgZmFpbHMgdG8KPj4gcHJvcGVy
bHkgcG93ZXIgaXQgb2ZmLiBXaXRoIFNDSEVET1Bfc2h1dGRvd24sIHdlIGRlbGVnYXRlIHRoZSBw
cm9ibGVtLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBKYW4gSC4gU2Now7ZuaGVyciA8anNjaG9lbmhA
YW1hem9uLmRlPgo+PiAtLS0KPj4gIHhlbi9jb21tb24vZG9tYWluLmMgfCAxNCArKysrKysrKysr
KysrKwo+PiAgMSBmaWxlIGNoYW5nZWQsIDE0IGluc2VydGlvbnMoKykKPj4KPj4gZGlmZiAtLWdp
dCBhL3hlbi9jb21tb24vZG9tYWluLmMgYi94ZW4vY29tbW9uL2RvbWFpbi5jCj4+IGluZGV4IGI0
ZDY3OWUuLmVkZTM3N2MgMTAwNjQ0Cj4+IC0tLSBhL3hlbi9jb21tb24vZG9tYWluLmMKPj4gKysr
IGIveGVuL2NvbW1vbi9kb21haW4uYwo+PiBAQCAtNDIsNiArNDIsNyBAQAo+PiAgI2luY2x1ZGUg
PHhlbi90cmFjZS5oPgo+PiAgI2luY2x1ZGUgPHhlbi90bWVtLmg+Cj4+ICAjaW5jbHVkZSA8YXNt
L3NldHVwLmg+Cj4+ICsjaW5jbHVkZSA8YXNtL2d1ZXN0L3ZpeGVuLmg+Cj4+Cj4+ICAvKiBMaW51
eCBjb25maWcgb3B0aW9uOiBwcm9wYWdldGVkIHRvIGRvbWFpbjAgKi8KPj4gIC8qIHhlbl9wcm9j
ZXNzb3JfcG1iaXRzOiB4ZW4gY29udHJvbCBDeCwgUHgsIC4uLiAqLwo+PiBAQCAtNjkzLDYgKzY5
NCwxNyBAQCB2b2lkIF9fZG9tYWluX2NyYXNoX3N5bmNocm9ub3VzKHZvaWQpCj4+ICB9Cj4+Cj4+
Cj4+ICtzdGF0aWMgdm9pZCB2aXhlbl9zaHV0ZG93bih1OCByZWFzb24pCj4+ICt7Cj4+ICsgICAg
c3RydWN0IHNjaGVkX3NodXRkb3duIHNjaGVkX3NodXRkb3duID0geyAucmVhc29uID0gcmVhc29u
IH07Cj4+ICsKPj4gKyAgICBpZiAoIW9wdF9ub3JlYm9vdCkKPgo+IEZvcmdvdCB0aGUgc3BhY2Vz
IGFyb3VuZCBpdC4uCj4gKE5vdCB0aGF0IHRoaXMgbWF0dGVycyB0aGF0IG11Y2gpLgoKQmxhcmcs
IEkgd2lsbCB0YWtlIGEgcGFzcyB0aHJvdWdoIGFsbCBvZiB0aGUgcGF0Y2hlcyBhbmQgc2NydWIg
dGhlbS4KClJlZ2FyZHMsCgpBbnRob255IExpZ3VvcmkKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
