From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2 09/16] x86: don't setup PV hypercall
 stubs and entries when !CONFIG_PV
Date: Mon, 29 Oct 2018 08:33:48 -0600
Message-ID: <5BD71A4C02000078001F5DA8@prv1-mh.provo.novell.com>
References: <cover.a9d086fddeb7425fc8cbb3d907dbe8d99a55b46c.1539959287.git-series.wei.liu2@citrix.com>
 <d56160401792b0f11ab83892907435b2346c2524.1539959287.git-series.wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=m5uw=nj=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gH8c7-0006H8-Kd
 for xen-devel@lists.xenproject.org; Mon, 29 Oct 2018 14:33:55 +0000
In-Reply-To: <d56160401792b0f11ab83892907435b2346c2524.1539959287.git-series.wei.liu2@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE5LjEwLjE4IGF0IDE2OjI4LCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4g
QEAgLTMwMywxNCArMzA1LDE3IEBAIHZvaWQgY3N0YXJfZW50ZXIodm9pZCk7Cj4gIAo+ICB2b2lk
IHN1YmFyY2hfcGVyY3B1X3RyYXBzX2luaXQodm9pZCkKPiAgewo+ICsjaWZkZWYgQ09ORklHX1BW
Cj4gICAgICB1bnNpZ25lZCBsb25nIHN0YWNrX2JvdHRvbSA9IGdldF9zdGFja19ib3R0b20oKTsK
PiAgICAgIHVuc2lnbmVkIGxvbmcgc3R1Yl92YSA9IHRoaXNfY3B1KHN0dWJzLmFkZHIpOwo+ICAg
ICAgdW5zaWduZWQgY2hhciAqc3R1Yl9wYWdlOwo+ICAgICAgdW5zaWduZWQgaW50IG9mZnNldDsK
PiArI2VuZGlmCj4gIAo+ICAgICAgLyogSVNUX01BWCBJU1QgcGFnZXMgKyBhdCBsZWFzdCAxIGd1
YXJkIHBhZ2UgKyBwcmltYXJ5IHN0YWNrLiAqLwo+ICAgICAgQlVJTERfQlVHX09OKChJU1RfTUFY
ICsgMSkgKiBQQUdFX1NJWkUgKyBQUklNQVJZX1NUQUNLX1NJWkUgPiBTVEFDS19TSVpFKTsKCkJ5
IG1vdmluZyB0aGlzIHRvIHRoZSBlbmQgb2YgdGhlIGZ1bmN0aW9uLCBvbmUgbGVzcyAjaWYvI2Vu
ZGlmCnBhaXIgd291bGQgYmUgbmVlZGVkLgoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
