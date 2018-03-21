From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH for-4.11 1/2] libxc/x86: fix mapping of the
 start_info area
Date: Wed, 21 Mar 2018 18:09:57 +0000
Message-ID: <20180321180957.v6unr7yhw564i2b4@citrix.com>
References: <20180321144211.57274-1-roger.pau@citrix.com>
 <20180321144211.57274-2-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=24tk=gl=citrix.com=prvs=6111f1d8b=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1eyiDy-0000Kf-0J
 for xen-devel@lists.xenproject.org; Wed, 21 Mar 2018 18:12:34 +0000
Content-Disposition: inline
In-Reply-To: <20180321144211.57274-2-roger.pau@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBNYXIgMjEsIDIwMTggYXQgMDI6NDI6MTBQTSArMDAwMCwgUm9nZXIgUGF1IE1vbm5l
IHdyb3RlOgo+IFRoZSBzdGFydF9pbmZvIHNpemUgY2FsY3VsYXRlZCBpbiBib290bGF0ZV9odm0g
aXMgd3JvbmcuIEl0IHNob3VsZCB1c2UKPiBIVk1MT0FERVJfTU9EVUxFX01BWF9DT1VOVCBpbnN0
ZWFkIG9mIGRvbS0+bnVtX21vZHVsZXMgYW5kIGl0IGRvZXNuJ3QKPiB0YWtlIGludG8gYWNjb3Vu
dCB0aGUgc2l6ZSBvZiB0aGUgbW9kdWxlcyBjb21tYW5kIGxpbmUuCj4gCj4gVGhpcyBpcyBub3Qg
YSBwcm9ibGVtIHNvIGZhciBiZWNhdXNlIHRoZSBhY3R1YWxseSB1c2VkIGFtb3VudCBvZgo+IG1l
bW9yeSBkb2Vzbid0IGNyb3NzIGEgcGFnZSBib3VuZGFyeSwgYW5kIHNvIG5vIHBhZ2UtZmF1bHQg
aXMKPiB0cmlnZ2VyZWQuCgpJIGdldCB0aGUgY21kbGluZSBiaXQuCgpXaGF0IGRvZXMgaXQgbmVl
ZCB0byBiZSBIVk1MT0FERVJfTU9EVUxFX01BWF9DT1VOVD8gSXNuJ3QgYmV0dGVyIHRvIGp1c3QK
bWFwIHdoYXQgd2UgbmVlZCBoZXJlPwoKV2VpLgoKPiAKPiBTaWduZWQtb2ZmLWJ5OiBSb2dlciBQ
YXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KPiAtLS0KPiBDYzogSWFuIEphY2tzb24g
PGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+Cj4gQ2M6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJp
eC5jb20+Cj4gLS0tCj4gIHRvb2xzL2xpYnhjL3hjX2RvbV94ODYuYyB8IDYgKysrKystCj4gIDEg
ZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0t
Z2l0IGEvdG9vbHMvbGlieGMveGNfZG9tX3g4Ni5jIGIvdG9vbHMvbGlieGMveGNfZG9tX3g4Ni5j
Cj4gaW5kZXggMGI2NWRhYjRiYy4uZTI5YzY2NmI4OSAxMDA2NDQKPiAtLS0gYS90b29scy9saWJ4
Yy94Y19kb21feDg2LmMKPiArKysgYi90b29scy9saWJ4Yy94Y19kb21feDg2LmMKPiBAQCAtMTY3
MSw3ICsxNjcxLDExIEBAIHN0YXRpYyBpbnQgYm9vdGxhdGVfaHZtKHN0cnVjdCB4Y19kb21faW1h
Z2UgKmRvbSkKPiAgICAgIHVuc2lnbmVkIGludCBpOwo+ICAKPiAgICAgIHN0YXJ0X2luZm9fc2l6
ZSA9IHNpemVvZigqc3RhcnRfaW5mbykgKyBkb20tPmNtZGxpbmVfc2l6ZTsKPiAtICAgIHN0YXJ0
X2luZm9fc2l6ZSArPSBzaXplb2Yoc3RydWN0IGh2bV9tb2RsaXN0X2VudHJ5KSAqIGRvbS0+bnVt
X21vZHVsZXM7Cj4gKyAgICBzdGFydF9pbmZvX3NpemUgKz0gc2l6ZW9mKHN0cnVjdCBodm1fbW9k
bGlzdF9lbnRyeSkgKgo+ICsgICAgICAgICAgICAgICAgICAgICAgIEhWTUxPQURFUl9NT0RVTEVf
TUFYX0NPVU5UOwo+ICsgICAgc3RhcnRfaW5mb19zaXplICs9IEhWTUxPQURFUl9NT0RVTEVfQ01E
TElORV9TSVpFICoKPiArICAgICAgICAgICAgICAgICAgICAgICBIVk1MT0FERVJfTU9EVUxFX01B
WF9DT1VOVDsKPiArCj4gIAo+ICAgICAgaWYgKCBzdGFydF9pbmZvX3NpemUgPgo+ICAgICAgICAg
ICBkb20tPnN0YXJ0X2luZm9fc2VnLnBhZ2VzIDw8IFhDX0RPTV9QQUdFX1NISUZUKGRvbSkgKQo+
IC0tIAo+IDIuMTYuMgo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
