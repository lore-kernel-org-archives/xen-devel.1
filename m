From: Anthony Liguori <anthony@codemonkey.ws>
Subject: Re: [PATCH 07/22] vixen: introduce is_vixen() to allow
 altering behavior
Date: Sat, 6 Jan 2018 16:26:17 -0800
Message-ID: <CA+aC4ksH=CrHdh0D9cKTpDvrhqJ4020upcRUE-qL+5AFwmcoBQ@mail.gmail.com>
References: <1515279277-16301-1-git-send-email-aliguori@amzn.com>
 <1515279277-16301-8-git-send-email-aliguori@amzn.com>
 <20180107000618.GB13546@ued668862963453.ant.amazon.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=swlg=ec=codemonkey.ws=anthony@srs-us1.protection.inumbo.net>)
 id 1eXyn7-0008Lx-Qb
 for xen-devel@lists.xenproject.org; Sun, 07 Jan 2018 00:26:21 +0000
Received: by mail-lf0-x243.google.com with SMTP id d19so391786lfj.5
 for <xen-devel@lists.xenproject.org>; Sat, 06 Jan 2018 16:26:19 -0800 (PST)
In-Reply-To: <20180107000618.GB13546@ued668862963453.ant.amazon.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Matt Wilson <msw@amzn.com>
Cc: Anthony Liguori <aliguori@amzn.com>, Wei Liu <wei.liu2@citrix.com>, Matt Wilson <msw@amazon.com>, KarimAllah Ahmed <karahmed@amazon.de>, Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Jan_H=2E_Sch=C3=B6nherr?= <jschoenh@amazon.de>, Anthony Liguori <aliguori@amazon.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gU2F0LCBKYW4gNiwgMjAxOCBhdCA0OjA2IFBNLCBNYXR0IFdpbHNvbiA8bXN3QGFtem4uY29t
PiB3cm90ZToKPiBPbiBTYXQsIEphbiAwNiwgMjAxOCBhdCAwMjo1NDoyMlBNIC0wODAwLCBBbnRo
b255IExpZ3Vvcmkgd3JvdGU6Cj4+IEZyb206IEFudGhvbnkgTGlndW9yaSA8YWxpZ3VvcmlAYW1h
em9uLmNvbT4KPj4KPj4gVml4ZW4gKFZpcnR1YWxpemVkIFhlbikgaXMgYSBwYXJhdmlydHVhbCBt
b2RlIG9mIFhlbiB3aGVyZQo+PiBwYXJhdmlydHVhbCBJL08gaXMgcGFzc2VkIHRocm91Z2ggZnJv
bSB0aGUgcGFyZW50IGh5cGVydmlzb3IKPj4gYWxsIHRoZSB3YXkgdGhyb3VnaCB0aGUgZG9tMCBn
dWVzdC4gIFRoZSBkb20wIGd1ZXN0IGlzIGFsc28KPj4gZGVwcml2aWxlZ2VkIGFuZCByZW51bWJl
cmVkIHRvIGdpdmUgdGhlIGFwcGVhcmFuY2UgdGhhdCBpdAo+PiBpcyBydW5uaW5nIGFzIGEgbm9y
bWFsIFBWIGd1ZXN0Lgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBBbnRob255IExpZ3VvcmkgPGFsaWd1
b3JpQGFtYXpvbi5jb20+Cj4+IC0tLQo+PiAgeGVuL2FyY2gveDg2L2d1ZXN0L01ha2VmaWxlICAg
ICAgIHwgIDEgKwo+PiAgeGVuL2FyY2gveDg2L2d1ZXN0L3ZpeGVuLmMgICAgICAgIHwgMzAgKysr
KysrKysrKysrKysrKwo+PiAgeGVuL2luY2x1ZGUvYXNtLXg4Ni9ndWVzdC92aXhlbi5oIHwgNzMg
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4+ICAzIGZpbGVzIGNoYW5n
ZWQsIDEwNCBpbnNlcnRpb25zKCspCj4+ICBjcmVhdGUgbW9kZSAxMDA2NDQgeGVuL2FyY2gveDg2
L2d1ZXN0L3ZpeGVuLmMKPj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCB4ZW4vaW5jbHVkZS9hc20teDg2
L2d1ZXN0L3ZpeGVuLmgKPgo+IFRoaXMgd2lsbCBicmVhayBBUk0gYnVpbGRzIGluIGZ1dHVyZSBw
YXRjaGVzIHRoYXQgdXNlIGlzX3ZpeGVuKCkuCgpodHRwczovL2dpdGh1Yi5jb20vYWxpZ3Vvcmkv
eGVuL3RyZWUvdml4ZW4tdXBzdHJlYW0ubmV4dAoKRml4ZXMgdGhlIEFSTSBidWlsZCBhbmQgd2ls
bCBiZSBpbiB2MiBvZiB0aGlzIHNlcmllcy4KClJlZ2FyZHMsCgpBbnRob255IExpZ3VvcmkKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
