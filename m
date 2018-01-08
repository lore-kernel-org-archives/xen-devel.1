From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v2 07/23] vixen: introduce is_vixen() to
 allow altering behavior
Date: Mon, 8 Jan 2018 12:18:37 +0000
Message-ID: <20180108121837.mrwww6hdmks6amsx@citrix.com>
References: <1515356919-922-1-git-send-email-aliguori@amzn.com>
 <1515356919-922-8-git-send-email-aliguori@amzn.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=9h6o=ed=citrix.com=prvs=53941dece=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1eYWOJ-0003Uq-C0
 for xen-devel@lists.xenproject.org; Mon, 08 Jan 2018 12:18:59 +0000
Content-Disposition: inline
In-Reply-To: <1515356919-922-8-git-send-email-aliguori@amzn.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Anthony Liguori <aliguori@amzn.com>
Cc: Wei Liu <wei.liu2@citrix.com>, Anthony Liguori <aliguori@amazon.com>, KarimAllah Ahmed <karahmed@amazon.de>, Andrew Cooper <andrew.cooper3@citrix.com>, Jan =?iso-8859-1?Q?H=2E_Sch=F6nherr?= <jschoenh@amazon.de>, Matt Wilson <msw@amazon.com>, xen-devel@lists.xenproject.org, Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gU3VuLCBKYW4gMDcsIDIwMTggYXQgMTI6Mjg6MjNQTSAtMDgwMCwgQW50aG9ueSBMaWd1b3Jp
IHdyb3RlOgo+IEZyb206IEFudGhvbnkgTGlndW9yaSA8YWxpZ3VvcmlAYW1hem9uLmNvbT4KPiAK
PiBWaXhlbiAoVmlydHVhbGl6ZWQgWGVuKSBpcyBhIHBhcmF2aXJ0dWFsIG1vZGUgb2YgWGVuIHdo
ZXJlCj4gcGFyYXZpcnR1YWwgSS9PIGlzIHBhc3NlZCB0aHJvdWdoIGZyb20gdGhlIHBhcmVudCBo
eXBlcnZpc29yCj4gYWxsIHRoZSB3YXkgdGhyb3VnaCB0aGUgZG9tMCBndWVzdC4gIFRoZSBkb20w
IGd1ZXN0IGlzIGFsc28KPiBkZXByaXZpbGVnZWQgYW5kIHJlbnVtYmVyZWQgdG8gZ2l2ZSB0aGUg
YXBwZWFyYW5jZSB0aGF0IGl0Cj4gaXMgcnVubmluZyBhcyBhIG5vcm1hbCBQViBndWVzdC4KPiAK
PiBTaWduZWQtb2ZmLWJ5OiBBbnRob255IExpZ3VvcmkgPGFsaWd1b3JpQGFtYXpvbi5jb20+Cj4g
KwpbLi4uXQo+ICtzdGF0aWMgaW5saW5lIGJvb2wgaXNfdml4ZW4odm9pZCkKPiArewo+ICsgICAg
cmV0dXJuIGZhbHNlOwo+ICt9Cj4gKwo+ICtzdGF0aWMgaW5saW5lIGJvb2wgdml4ZW5faGFzX3Bl
cl9jcHVfbm90aWZpY2F0aW9ucyh2b2lkKQo+ICt7Cj4gKyAgICByZXR1cm4gZmFsc2U7Cj4gK30K
PiArCj4gK3N0YXRpYyBpbmxpbmUgYm9vbCB2aXhlbl9yaW5nX3Byb2Nlc3ModWludDE2X3QgcG9y
dCkKPiArewo+ICsgICAgcmV0dXJuIGZhbHNlOwo+ICt9CgpBRkFJQ1Qgb25seSB0aGVzZSBhcmUg
dml4ZW4gc3BlY2lmaWMuIFRoZSByZXN0IGNhbiBiZSBtZXJnZWQgd2l0aApwdi1pbi1wdmggY29k
ZS4KCkknbSBub3Qgc3VyZSB3aHkgdGhleSBhcmUgbmVlZGVkIHlldC4gSWYgSSBjYW4gZmlndXJl
IHRoYXQgb3V0IGxhdGVyIEkKd2lsbCBhc2sgcXVlc3Rpb25zIGhlcmUuCgpXZWkuCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
