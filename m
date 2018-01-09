From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH RFC v1 53/74] xen/pvshim: modify Dom0
 builder in order to build a DomU
Date: Tue, 09 Jan 2018 09:26:55 -0700
Message-ID: <5A54FB5F020000780019CD41@prv-mh.provo.novell.com>
References: <20180104130625.28605-1-wei.liu2@citrix.com>
 <20180104130625.28605-54-wei.liu2@citrix.com>
 <5A5388E6020000780019C40D@prv-mh.provo.novell.com>
 <20180109160933.6ekwrmpv7ux6bkiy@MacBook-Pro-de-Roger.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=o7xp=ee=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1eYwjs-0002tu-Dd
 for xen-devel@lists.xenproject.org; Tue, 09 Jan 2018 16:27:00 +0000
In-Reply-To: <20180109160933.6ekwrmpv7ux6bkiy@MacBook-Pro-de-Roger.local>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: =?UTF-8?Q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, wei.liu2@citrix.com
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA5LjAxLjE4IGF0IDE3OjA5LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IE9uIE1vbiwgSmFuIDA4LCAyMDE4IGF0IDA3OjA2OjE0QU0gLTA3MDAsIEphbiBCZXVsaWNoIHdy
b3RlOgo+PiA+Pj4gT24gMDQuMDEuMTggYXQgMTQ6MDYsIDx3ZWkubGl1MkBjaXRyaXguY29tPiB3
cm90ZToKPj4gPiBGcm9tOiBSb2dlciBQYXUgTW9ubmUgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgo+
PiA+IC0tLSBhL3hlbi9hcmNoL3g4Ni9wdi9kb20wX2J1aWxkLmMKPj4gPiArKysgYi94ZW4vYXJj
aC94ODYvcHYvZG9tMF9idWlsZC5jCj4+ID4gQEAgLTMxLDkgKzMxLDggQEAKPj4gPiAgI2RlZmlu
ZSBMM19QUk9UIChCQVNFX1BST1R8X1BBR0VfRElSVFkpCj4+ID4gICNkZWZpbmUgTDRfUFJPVCAo
QkFTRV9QUk9UfF9QQUdFX0RJUlRZKQo+PiA+ICAKPj4gPiAtc3RhdGljIF9faW5pdCB2b2lkIGRv
bTBfdXBkYXRlX3BoeXNtYXAoc3RydWN0IGRvbWFpbiAqZCwgdW5zaWduZWQgbG9uZyBwZm4sCj4+
ID4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcg
bWZuLAo+PiA+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25l
ZCBsb25nIHZwaHlzbWFwX3MpCj4+ID4gK19faW5pdCB2b2lkIGRvbTBfdXBkYXRlX3BoeXNtYXAo
c3RydWN0IGRvbWFpbiAqZCwgdW5zaWduZWQgbG9uZyBwZm4sCj4+IAo+PiBQbGVhc2UgZG9uJ3Qg
cmUtb3JkZXIgdHlwZSBhbmQgYW5ub3RhdGlvbi4KPiAKPiBJJ20gbm90IHJlLW9yZGVyaW5nIGFu
eXRoaW5nIGhlcmUsIGp1c3QgcmVtb3ZpbmcgInN0YXRpYyIuCgpPb3BzLCBJJ20gc29ycnkuIFRo
aW5ncyBiZWluZyBtaXMtb3JkZXJlZCBzaW1wbHkgYmVjb21lcyBtb3JlCm9idmlvdXMgd2l0aCB0
aGUgInN0YXRpYyBnb25lIi4KCj4gRG8geW91IG1lYW4gdGhhdCB5b3UgcHJlZmVyICJ2b2lkIF9f
aW5pdCAuLi4iPwoKWWVzLgoKSmFuCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
