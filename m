From: Roger Pau Monne <roger.pau@citrix.com>
Subject: [PATCH for-4.11] kconfig: don't select VPCI if building
 a shim-only binary
Date: Tue, 27 Mar 2018 15:56:22 +0100
Message-ID: <20180327145622.93137-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=jyqu=gr=citrix.com=prvs=617bf0025=roger.pau@srs-us1.protection.inumbo.net>)
 id 1f0q1e-0004kT-ED
 for xen-devel@lists.xenproject.org; Tue, 27 Mar 2018 14:56:38 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

UmVwb3J0ZWQtYnk6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+ClNpZ25lZC1vZmYtYnk6
IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgotLS0KQ2M6IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KQ2M6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIz
QGNpdHJpeC5jb20+CkNjOiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgotLS0KIHhlbi9h
cmNoL3g4Ni9LY29uZmlnIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAx
IGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L0tjb25maWcgYi94ZW4vYXJj
aC94ODYvS2NvbmZpZwppbmRleCBjNDA1YzRiZjRmLi5mNjRmYzU2NzM5IDEwMDY0NAotLS0gYS94
ZW4vYXJjaC94ODYvS2NvbmZpZworKysgYi94ZW4vYXJjaC94ODYvS2NvbmZpZwpAQCAtMjMsNyAr
MjMsNyBAQCBjb25maWcgWDg2CiAJc2VsZWN0IEhBU19QQ0kKIAlzZWxlY3QgSEFTX1BEWAogCXNl
bGVjdCBIQVNfVUJTQU4KLQlzZWxlY3QgSEFTX1ZQQ0kKKwlzZWxlY3QgSEFTX1ZQQ0kgaWYgIVBW
X1NISU1fRVhDTFVTSVZFCiAJc2VsZWN0IE5VTUEKIAogY29uZmlnIEFSQ0hfREVGQ09ORklHCi0t
IAoyLjE2LjMKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
