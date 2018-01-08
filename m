From: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Subject: Re: [PATCH v2 09/23] vixen: modify the e820 table to
 advertise HVM special pages as RAM
Date: Sun, 7 Jan 2018 19:18:37 -0500
Message-ID: <20180108001837.GZ21689@char.us.oracle.com>
References: <1515356919-922-1-git-send-email-aliguori@amzn.com>
 <1515356919-922-10-git-send-email-aliguori@amzn.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=45m3=ed=oracle.com=konrad.wilk@srs-us1.protection.inumbo.net>)
 id 1eYL9L-0006IS-VI
 for xen-devel@lists.xenproject.org; Mon, 08 Jan 2018 00:18:48 +0000
Content-Disposition: inline
In-Reply-To: <1515356919-922-10-git-send-email-aliguori@amzn.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Anthony Liguori <aliguori@amzn.com>
Cc: Wei Liu <wei.liu2@citrix.com>, Matt Wilson <msw@amazon.com>, KarimAllah Ahmed <karahmed@amazon.de>, Andrew Cooper <andrew.cooper3@citrix.com>, Jan =?iso-8859-1?Q?H=2E_Sch=F6nherr?= <jschoenh@amazon.de>, Anthony Liguori <aliguori@amazon.com>, xen-devel@lists.xenproject.org, Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gU3VuLCBKYW4gMDcsIDIwMTggYXQgMTI6Mjg6MjVQTSAtMDgwMCwgQW50aG9ueSBMaWd1b3Jp
IHdyb3RlOgo+IEZyb206IEFudGhvbnkgTGlndW9yaSA8YWxpZ3VvcmlAYW1hem9uLmNvbT4KCi4u
c25pcC4KPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2d1ZXN0L3ZpeGVuLmMgYi94ZW4vYXJj
aC94ODYvZ3Vlc3Qvdml4ZW4uYwo+IGluZGV4IGMwYTgxZGQuLmNhY2JlNjkgMTAwNjQ0Cj4gLS0t
IGEveGVuL2FyY2gveDg2L2d1ZXN0L3ZpeGVuLmMKPiArKysgYi94ZW4vYXJjaC94ODYvZ3Vlc3Qv
dml4ZW4uYwo+IEBAIC0yMyw2ICsyMyw3IEBACj4gIAo+ICBzdGF0aWMgaW50IGluX3ZpeGVuOwo+
ICBzdGF0aWMgaW50IHZpeGVuX2RvbWlkID0gMTsKPiArc3RhdGljIHVpbnQzMl90IHZpeGVuX3Jl
c2VydmVkX21lbV9wZ3N0YXJ0ID0gMHhmZWZmMDAwMDsKClRoaXMgaXMgaW50ZXJlc3RpbmcuIFdv
dWxkIGl0IG1ha2Ugc2Vuc2UgdG8gaGF2ZSB0aGlzIGJlCmF1dG8tZGV0ZWN0ZWQ/IE9yIGEgYm9v
dCBwYXJhbWV0ZXIgdG8gb3Zlci13cml0ZT8KCj4gIAo+ICBpbnRlZ2VyX3BhcmFtKCJ2aXhlbl9k
b21pZCIsIHZpeGVuX2RvbWlkKTsKPiAgCj4gQEAgLTM1LDMgKzM2LDExIEBAIGludCB2aXhlbl9n
ZXRfZG9taWQodm9pZCkKPiAgewo+ICAgICAgcmV0dXJuIHZpeGVuX2RvbWlkOwo+ICB9Cj4gKwo+
ICt2b2lkIHZpeGVuX2dldF9yZXNlcnZlZF9tZW0odW5zaWduZWQgbG9uZyAqc3RhcnRfcGZuLCB1
bnNpZ25lZCBsb25nICplbmRfcGZuKQo+ICt7Cj4gKyAgICAqc3RhcnRfcGZuID0gdml4ZW5fcmVz
ZXJ2ZWRfbWVtX3Bnc3RhcnQgPj4gWEVOX1BBR0VfU0hJRlQ7Cj4gKwo+ICsgICAgLyogVGhpcyBp
cyBwYXJ0IG9mIHRoZSBYZW4gQUJJICovCgouLiB3aGljaCBvbmUgOi0pID8KPiArICAgICplbmRf
cGZuICAgPSAweDEwMDAwMDsKPiArfQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
