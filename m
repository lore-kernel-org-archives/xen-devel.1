From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Subject: Re: [PATCH 09/22] vixen: modify the e820 table to
 advertise HVM special pages as RAM
Date: Sun, 7 Jan 2018 08:16:27 +0000
Message-ID: <20180107081627.taa5o4pak4zetfh4@MacBook-Pro-de-Roger.local>
References: <1515279277-16301-1-git-send-email-aliguori@amzn.com>
 <1515279277-16301-10-git-send-email-aliguori@amzn.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=mhr6=ec=citrix.com=prvs=538008ad2=roger.pau@srs-us1.protection.inumbo.net>)
 id 1eY68I-00026j-HQ
 for xen-devel@lists.xenproject.org; Sun, 07 Jan 2018 08:16:42 +0000
Content-Disposition: inline
In-Reply-To: <1515279277-16301-10-git-send-email-aliguori@amzn.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Anthony Liguori <aliguori@amzn.com>
Cc: Wei Liu <wei.liu2@citrix.com>, Anthony Liguori <aliguori@amazon.com>, KarimAllah Ahmed <karahmed@amazon.de>, Andrew Cooper <andrew.cooper3@citrix.com>, Jan =?iso-8859-1?Q?H=2E_Sch=F6nherr?= <jschoenh@amazon.de>, Matt Wilson <msw@amazon.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gU2F0LCBKYW4gMDYsIDIwMTggYXQgMDI6NTQ6MjRQTSAtMDgwMCwgQW50aG9ueSBMaWd1b3Jp
IHdyb3RlOgo+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvbW0uYyBiL3hlbi9hcmNoL3g4Ni9t
bS5jCj4gaW5kZXggYTU2Zjg3NS4uOTM1OTAxYiAxMDA2NDQKPiAtLS0gYS94ZW4vYXJjaC94ODYv
bW0uYwo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9tbS5jCj4gQEAgLTEyMiw2ICsxMjIsNyBAQAo+ICAj
aW5jbHVkZSA8YXNtL2ZpeG1hcC5oPgo+ICAjaW5jbHVkZSA8YXNtL2lvX2FwaWMuaD4KPiAgI2lu
Y2x1ZGUgPGFzbS9wY2kuaD4KPiArI2luY2x1ZGUgPGFzbS9ndWVzdC5oPgo+ICAKPiAgI2luY2x1
ZGUgPGFzbS9odm0vZ3JhbnRfdGFibGUuaD4KPiAgI2luY2x1ZGUgPGFzbS9wdi9ncmFudF90YWJs
ZS5oPgo+IEBAIC05NDUsNyArOTQ2LDcgQEAgZ2V0X3BhZ2VfZnJvbV9sMWUoCj4gICAgICAgICAg
ICAgIGNhc2UgMDoKPiAgICAgICAgICAgICAgICAgIGJyZWFrOwo+ICAgICAgICAgICAgICBjYXNl
IDE6Cj4gLSAgICAgICAgICAgICAgICBpZiAoICFpc19oYXJkd2FyZV9kb21haW4obDFlX293bmVy
KSApCj4gKyAgICAgICAgICAgICAgICBpZiAoICFpc192aXhlbigpICYmICFpc19oYXJkd2FyZV9k
b21haW4obDFlX293bmVyKSApCj4gICAgICAgICAgICAgICAgICAgICAgYnJlYWs7Cj4gICAgICAg
ICAgICAgICAgICAvKiBmYWxsdGhyb3VnaCAqLwo+ICAgICAgICAgICAgICBjYXNlIC0xOgo+IEBA
IC01NTM2LDYgKzU1MzcsMjEgQEAgdm9pZCBhcmNoX2R1bXBfc2hhcmVkX21lbV9pbmZvKHZvaWQp
Cj4gICAgICAgICAgICAgIG1lbV9zaGFyaW5nX2dldF9ucl9zYXZlZF9tZm5zKCkpOwo+ICB9Cj4g
IAo+ICtjb25zdCB1bnNpZ25lZCBsb25nICpfX2luaXQKPiArdml4ZW5fZ2V0X3BsYXRmb3JtX2Jh
ZHBhZ2VzKHVuc2lnbmVkIGludCAqYXJyYXlfc2l6ZSkKPiArewo+ICsgICAgc3RhdGljIHVuc2ln
bmVkIGxvbmcgX19pbml0ZGF0YSBiYWRfcGFnZXNbXSA9IHsKPiArICAgICAgICAweGZlZmZjMDAw
LAo+ICsgICAgICAgIDB4ZmVmZmQwMDAsCj4gKyAgICAgICAgMHhmZWZmZTAwMCwKPiArICAgICAg
ICAweGZlZmZmMDAwLAoKVGhpcyB2YWx1ZXMgc2hvdWxkbid0IGJlIGhhcmRjb2RlZC4gSU1ITyBp
dCB3b3VsZCBhbHNvIGJlIGdvb2QgdG8KcGxhY2UgYWxsIHRoZSB2aXhlbl8gaGVscGVycyBpbiBh
IHNpbmdsZSBmaWxlLgoKVGhhbmtzLCBSb2dlci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
