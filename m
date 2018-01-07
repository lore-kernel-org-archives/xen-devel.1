From: Anthony Liguori <anthony@codemonkey.ws>
Subject: Re: [PATCH 09/22] vixen: modify the e820 table to
 advertise HVM special pages as RAM
Date: Sun, 7 Jan 2018 07:27:48 -0800
Message-ID: <CA+aC4ksDPKRHxfyKoNKQ83qb3g-urorevh1JDJLGpE7ivaNSWw@mail.gmail.com>
References: <1515279277-16301-1-git-send-email-aliguori@amzn.com>
 <1515279277-16301-10-git-send-email-aliguori@amzn.com>
 <20180107081627.taa5o4pak4zetfh4@MacBook-Pro-de-Roger.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=swlg=ec=codemonkey.ws=anthony@srs-us1.protection.inumbo.net>)
 id 1eYCrY-00076j-Vl
 for xen-devel@lists.xenproject.org; Sun, 07 Jan 2018 15:27:53 +0000
Received: by mail-lf0-x244.google.com with SMTP id m8so3606168lfc.6
 for <xen-devel@lists.xenproject.org>; Sun, 07 Jan 2018 07:27:51 -0800 (PST)
In-Reply-To: <20180107081627.taa5o4pak4zetfh4@MacBook-Pro-de-Roger.local>
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

T24gU3VuLCBKYW4gNywgMjAxOCBhdCAxMjoxNiBBTSwgUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIu
cGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+IE9uIFNhdCwgSmFuIDA2LCAyMDE4IGF0IDAyOjU0OjI0
UE0gLTA4MDAsIEFudGhvbnkgTGlndW9yaSB3cm90ZToKPj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNo
L3g4Ni9tbS5jIGIveGVuL2FyY2gveDg2L21tLmMKPj4gaW5kZXggYTU2Zjg3NS4uOTM1OTAxYiAx
MDA2NDQKPj4gLS0tIGEveGVuL2FyY2gveDg2L21tLmMKPj4gKysrIGIveGVuL2FyY2gveDg2L21t
LmMKPj4gQEAgLTEyMiw2ICsxMjIsNyBAQAo+PiAgI2luY2x1ZGUgPGFzbS9maXhtYXAuaD4KPj4g
ICNpbmNsdWRlIDxhc20vaW9fYXBpYy5oPgo+PiAgI2luY2x1ZGUgPGFzbS9wY2kuaD4KPj4gKyNp
bmNsdWRlIDxhc20vZ3Vlc3QuaD4KPj4KPj4gICNpbmNsdWRlIDxhc20vaHZtL2dyYW50X3RhYmxl
Lmg+Cj4+ICAjaW5jbHVkZSA8YXNtL3B2L2dyYW50X3RhYmxlLmg+Cj4+IEBAIC05NDUsNyArOTQ2
LDcgQEAgZ2V0X3BhZ2VfZnJvbV9sMWUoCj4+ICAgICAgICAgICAgICBjYXNlIDA6Cj4+ICAgICAg
ICAgICAgICAgICAgYnJlYWs7Cj4+ICAgICAgICAgICAgICBjYXNlIDE6Cj4+IC0gICAgICAgICAg
ICAgICAgaWYgKCAhaXNfaGFyZHdhcmVfZG9tYWluKGwxZV9vd25lcikgKQo+PiArICAgICAgICAg
ICAgICAgIGlmICggIWlzX3ZpeGVuKCkgJiYgIWlzX2hhcmR3YXJlX2RvbWFpbihsMWVfb3duZXIp
ICkKPj4gICAgICAgICAgICAgICAgICAgICAgYnJlYWs7Cj4+ICAgICAgICAgICAgICAgICAgLyog
ZmFsbHRocm91Z2ggKi8KPj4gICAgICAgICAgICAgIGNhc2UgLTE6Cj4+IEBAIC01NTM2LDYgKzU1
MzcsMjEgQEAgdm9pZCBhcmNoX2R1bXBfc2hhcmVkX21lbV9pbmZvKHZvaWQpCj4+ICAgICAgICAg
ICAgICBtZW1fc2hhcmluZ19nZXRfbnJfc2F2ZWRfbWZucygpKTsKPj4gIH0KPj4KPj4gK2NvbnN0
IHVuc2lnbmVkIGxvbmcgKl9faW5pdAo+PiArdml4ZW5fZ2V0X3BsYXRmb3JtX2JhZHBhZ2VzKHVu
c2lnbmVkIGludCAqYXJyYXlfc2l6ZSkKPj4gK3sKPj4gKyAgICBzdGF0aWMgdW5zaWduZWQgbG9u
ZyBfX2luaXRkYXRhIGJhZF9wYWdlc1tdID0gewo+PiArICAgICAgICAweGZlZmZjMDAwLAo+PiAr
ICAgICAgICAweGZlZmZkMDAwLAo+PiArICAgICAgICAweGZlZmZlMDAwLAo+PiArICAgICAgICAw
eGZlZmZmMDAwLAo+Cj4gVGhpcyB2YWx1ZXMgc2hvdWxkbid0IGJlIGhhcmRjb2RlZC4gSU1ITyBp
dCB3b3VsZCBhbHNvIGJlIGdvb2QgdG8KPiBwbGFjZSBhbGwgdGhlIHZpeGVuXyBoZWxwZXJzIGlu
IGEgc2luZ2xlIGZpbGUuCgpBY2sgb24gbW92aW5nIHRvIGEgaGVscGVyLgoKSSBkb24ndCBrbm93
IG9mIGEgd2F5IHRvIGNhbGwgdGhlIGh5cGVydmlzb3IgdG8gYXNrICJ3aGF0J3MgdGhlCnNwZWNp
YWwgcGFnZSByYW5nZT8iLiAgSSBjYW4gZmluZCBzcGVjaWFsIHBhZ2VzIHZpYSB0aGUgaHZtIGdl
dApwYXJhbWV0ZXJzIGNhbGxzIGJ1dCB0aGVyZSdzIG5vIGd1YXJhbnRlZSB0aGV5IGFyZSBjb250
aWd1b3VzIHNvIHRoZQpyZXN1bHRpbmcgY29kZSB0byBwdW5jaCBob2xlcyBpbiB0aGUgZTgyMCBi
ZWNhdXNlIGZhaXJseSBjb21wbGV4LiAgQW55CmlkZWFzIGhvdyB0byBkbyB0aGlzIG5pY2VseT8K
ClJlZ2FyZHMsCgpBbnRob255IExpZ3VvcmkKCj4gVGhhbmtzLCBSb2dlci4KPgo+IF9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gWGVuLWRldmVsIG1haWxp
bmcgbGlzdAo+IFhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwo+IGh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWwKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
