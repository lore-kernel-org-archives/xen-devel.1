From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Subject: Re: [PATCH v4 3/4] x86: fix indirect thunk usage of
 CONFIG_INDIRECT_THUNK
Date: Tue, 20 Feb 2018 10:19:16 +0000
Message-ID: <20180220101916.ve5gcjq6c53tkiey@MacBook-Pro-de-Roger.local>
References: <20180219141620.20008-1-roger.pau@citrix.com>
 <20180219141620.20008-4-roger.pau@citrix.com>
 <5A8BF53C02000078001A97CE@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=6c15=fo=citrix.com=prvs=582a52a2f=roger.pau@srs-us1.protection.inumbo.net>)
 id 1eo51D-0004jT-6J
 for xen-devel@lists.xenproject.org; Tue, 20 Feb 2018 10:19:27 +0000
Content-Disposition: inline
In-Reply-To: <5A8BF53C02000078001A97CE@prv-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBGZWIgMjAsIDIwMTggYXQgMDI6MTU6MjRBTSAtMDcwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDE5LjAyLjE4IGF0IDE1OjE2LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdy
b3RlOgo+ID4gLS0tIGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9pbmRpcmVjdF90aHVua19hc20uaAo+
ID4gKysrIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9pbmRpcmVjdF90aHVua19hc20uaAo+ID4gQEAg
LTMsNiArMywxMCBAQAo+ID4gICAqIHVzdWFsICNpZmRlZidhcnkgdG8gdHVybiBpbnRvIGNvbW1l
bnRzLgo+ID4gICAqLwo+ID4gIAo+ID4gKy5pZm5kZWYgQ09ORklHX0lORElSRUNUX1RIVU5LCj4g
PiArICAgIC5lcXUgQ09ORklHX0lORElSRUNUX1RIVU5LLCAwCj4gPiArLmVuZGlmCj4gCj4gSSBo
YXZlIHRvIHdpdGhkcmF3IG15IFItYjogVGhpcyBmYWlscyB0byBidWlsZCAoSSdtIGdldHRpbmcg
YW4gZXJyb3IKPiBvbiB0aGUgLmlmbmRlZiBhYm92ZSBmb3IgbW9yZSB0aGFuIG9uZSBhc3NlbWJs
ZXIgc291cmNlKS4gSSBhc3N1bWUKPiB0aGF0J3MgYmVjYXVzZSB3aXRoIGluZGlyZWN0IHRodW5r
cyBlbmFibGVkIHRoZSBjb25zdGFudCBnZXRzCj4gcmVwbGFjZWQgYnkgbGl0ZXJhbCAxIGJ5IHRo
ZSBDIHByZXByb2Nlc3Nvci4KClJpZ2h0LCBJJ3ZlIGp1c3QgaW5zdGFsbGVkIGdjYzctZGV2ZWwg
YW5kIEknbSBzZWVpbmcgdGhlIHNhbWUuIFRoYW5rcwpmb3Igbm90aWNpbmcuIExldCBtZSB0cnkg
dG8gc29sdmUgdGhpcyBpbiBhbm90aGVyIHdheS4uLgoKUm9nZXIuCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
