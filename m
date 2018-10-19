From: Wei Liu <wei.liu2@citrix.com>
Subject: [PATCH v2 16/16] x86: update help string for CONFIG_HVM
Date: Fri, 19 Oct 2018 15:28:42 +0100
Message-ID: <eef811a9adaa6ef2a21dfeef32f1fc6431b81778.1539959287.git-series.wei.liu2@citrix.com>
References: <cover.a9d086fddeb7425fc8cbb3d907dbe8d99a55b46c.1539959287.git-series.wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=jk7c=m7=citrix.com=prvs=8230e4c9f=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1gDWEY-0006Eu-Ow
 for xen-devel@lists.xenproject.org; Fri, 19 Oct 2018 14:58:38 +0000
In-Reply-To: <cover.a9d086fddeb7425fc8cbb3d907dbe8d99a55b46c.1539959287.git-series.wei.liu2@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

Q2hhbmdlICJndWVzdCIgdG8gImRvbWFpbiIgd2hlcmUgYXBwcm9wcmlhdGUgYmVjYXVzZSAiZ3Vl
c3QiIGRvZXNuJ3QKaW5jbHVkZSBEb21haW4gMC4KClNpZ25lZC1vZmYtYnk6IFdlaSBMaXUgPHdl
aS5saXUyQGNpdHJpeC5jb20+Ci0tLQp2MjogbmV3Ci0tLQogeGVuL2FyY2gveDg2L0tjb25maWcg
fCA4ICsrKystLS0tCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9u
cygtKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9LY29uZmlnIGIveGVuL2FyY2gveDg2L0tj
b25maWcKaW5kZXggYzdlOTdlMi4uYjRiZDgzZSAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L0tj
b25maWcKKysrIGIveGVuL2FyY2gveDg2L0tjb25maWcKQEAgLTcwLDEyICs3MCwxMiBAQCBjb25m
aWcgSFZNCiAJZGVmX2Jvb2wgIVBWX1NISU1fRVhDTFVTSVZFCiAJcHJvbXB0ICJIVk0gc3VwcG9y
dCIKIAktLS1oZWxwLS0tCi0JICBJbnRlcmZhY2VzIHRvIHN1cHBvcnQgSFZNIGd1ZXN0cyB3aGlj
aCByZXF1aXJlIGhhcmR3YXJlCisJICBJbnRlcmZhY2VzIHRvIHN1cHBvcnQgSFZNIGRvbWFpbnMg
d2hpY2ggcmVxdWlyZSBoYXJkd2FyZQogCSAgc3VwcG9ydCBsaWtlIEludGVsJ3MgVlQteCBvciBB
TUQncyBTVk0uIE5vdGUgdGhlIGh5cGVydmlzb3IKLQkgIGRvZXNuJ3QgZGlzdGluZ3Vpc2ggSFZN
IG9yIFBWSCBndWVzdCB0eXBlcy4gUFZIIGd1ZXN0IHR5cGUKLQkgIGlzIG9ubHkgYSBjb25jZXB0
IGZvciBlbmQgdXNlcnMuCisJICBkb2Vzbid0IGRpc3Rpbmd1aXNoIEhWTSBvciBQVkguIFBWSCBp
cyBvbmx5IGEgY29uY2VwdCBmb3IKKwkgIGVuZCB1c2Vycy4KIAotCSAgVGhpcyBvcHRpb24gaXMg
bmVlZGVkIGlmIHlvdSB3YW50IHRvIHJ1biBIVk0gb3IgUFZIIGd1ZXN0cy4KKwkgIFRoaXMgb3B0
aW9uIGlzIG5lZWRlZCBpZiB5b3Ugd2FudCB0byBydW4gSFZNIG9yIFBWSCBkb21haW5zLgogCiAJ
ICBJZiB1bnN1cmUsIHNheSBZLgogCi0tIApnaXQtc2VyaWVzIDAuOS4xCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
