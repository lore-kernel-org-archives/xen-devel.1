From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 1/2] x86: report if PCID and INVPCID are
	supported
Date: Mon, 05 Mar 2018 05:37:38 -0700
Message-ID: <5A9D482202000078001AE7ED@prv-mh.provo.novell.com>
References: <20180305095032.30062-1-wei.liu2@citrix.com>
 <20180305095032.30062-2-wei.liu2@citrix.com>
 <5A9D362002000078001AE74F@suse.com>
 <fdc238ab-ad02-69a0-0e3a-3c2e643a40e7@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=zn8f=f3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1espND-0003RP-RF
 for xen-devel@lists.xenproject.org; Mon, 05 Mar 2018 12:37:47 +0000
In-Reply-To: <fdc238ab-ad02-69a0-0e3a-3c2e643a40e7@suse.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>, Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA1LjAzLjE4IGF0IDEyOjQzLCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPiBPbiAw
NS8wMy8xOCAxMjoyMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+IE9uIDA1LjAzLjE4IGF0IDEw
OjUwLCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4+PiAtLS0gYS94ZW4vYXJjaC94ODYv
c2V0dXAuYwo+Pj4gKysrIGIveGVuL2FyY2gveDg2L3NldHVwLmMKPj4+IEBAIC0xNzAxLDYgKzE3
MDEsMTMgQEAgdm9pZCBfX2luaXQgbm9yZXR1cm4gX19zdGFydF94ZW4odW5zaWduZWQgbG9uZyBt
YmlfcCkKPj4+ICAgICAgICAgICAgIGNwdV9oYXNfbnggPyBYRU5MT0dfSU5GTyA6IFhFTkxPR19X
QVJOSU5HICJXYXJuaW5nOiAiLAo+Pj4gICAgICAgICAgICAgY3B1X2hhc19ueCA/ICIiIDogIm5v
dCAiKTsKPj4+ICAKPj4+ICsKPj4+ICsgICAgcHJpbnRrKFhFTkxPR19JTkZPCj4+PiArICAgICAg
ICAgICAiUENJRCAoUHJvY2Vzcy1Db250ZXh0IElEZW50aWZpZXIpICVzc3VwcG9ydGVkXG4iLAo+
Pj4gKyAgICAgICAgICAgY3B1X2hhc19wY2lkID8gIiIgOiAibm90ICIpOwo+Pj4gKwo+Pj4gKyAg
ICBwcmludGsoWEVOTE9HX0lORk8gIklOVlBDSUQgJXNzdXBwb3J0ZWRcbiIsIGNwdV9oYXNfaW52
cGNpZCA/ICIiIDogIm5vdCAiKTsKPj4gCj4+IERvIHdlIHJlYWxseSBuZWVkIHRoaXM/IFdlIGxv
ZyBhIG1lc3NhZ2UgZm9yIE5YIGFzIGFuIGV4Y2VwdGlvbiwKPj4gd2UgZG9uJ3QgZG8gc28gZm9y
IG90aGVyIGZlYXR1cmVzIChhbmQgdGhpbmdzIHdvdWxkIGdldCBwcmV0dHkKPj4gdW53aWVsZHkg
aWYgd2UgZGlkKS4KPiAKPiBJJ2QgcmF0aGVyIGtlZXAgdGhpcyBtZXNzYWdlLiBBcyB3ZSBhcmUg
aGlkaW5nIFBDSUQgYW5kIElOUENJRCBmcm9tIGRvbTAKPiB0aGlzIGlzIHRoZSBvbmx5IGluZGlj
YXRvciBvZiB0aG9zZSBmZWF0dXJlcyBiZWluZyBzdXBwb3J0ZWQuIEluIGNhc2Ugb2YKPiBhbiBl
cnJvciByZWxhdGVkIHRvIFRMQiBjb25zaXN0ZW5jeSB0aGlzIGluZm9ybWF0aW9uIGlzIGltcG9y
dGFudCBJTU8uCgpXZWxsLCB0aGlzIGFyZ3VtZW50IHdvdWxkIGhvbGQgZm9yIGFsbW9zdCBldmVy
eSBvdGhlciBhZHZhbmNlZApmZWF0dXJlIHdlIHVzZS4KCkphbgoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
