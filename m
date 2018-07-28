From: Doug Goldstein <cardoe@cardoe.com>
Subject: [PATCH 3/4] automation: remove dead code from
 containerize
Date: Sat, 28 Jul 2018 12:11:51 -0500
Message-ID: <401f3886ad82f7a0cc46df47a160b1f71e37067e.1532797834.git-series.cardoe@cardoe.com>
References: <cover.1acf9637303405d6bdb1a9ad450b2a4ea5a0307d.1532797834.git-series.cardoe@cardoe.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=vdf1=km=cardoe.com=cardoe@srs-us1.protection.inumbo.net>)
 id 1fjSlH-0004iW-5n
 for xen-devel@lists.xenproject.org; Sat, 28 Jul 2018 17:12:11 +0000
Received: by mail-qt0-x241.google.com with SMTP id m13-v6so8246672qth.1
 for <xen-devel@lists.xenproject.org>; Sat, 28 Jul 2018 10:12:10 -0700 (PDT)
In-Reply-To: <cover.1acf9637303405d6bdb1a9ad450b2a4ea5a0307d.1532797834.git-series.cardoe@cardoe.com>
In-Reply-To: <cover.1acf9637303405d6bdb1a9ad450b2a4ea5a0307d.1532797834.git-series.cardoe@cardoe.com>
References: <cover.1acf9637303405d6bdb1a9ad450b2a4ea5a0307d.1532797834.git-series.cardoe@cardoe.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Doug Goldstein <cardoe@cardoe.com>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

VGhpcyBpcyBtb3JlIGRlYWQgY29kZS4KClNpZ25lZC1vZmYtYnk6IERvdWcgR29sZHN0ZWluIDxj
YXJkb2VAY2FyZG9lLmNvbT4KLS0tCiBhdXRvbWF0aW9uL3NjcmlwdHMvY29udGFpbmVyaXplIHwg
NSAtLS0tLQogMSBmaWxlIGNoYW5nZWQsIDUgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYXV0
b21hdGlvbi9zY3JpcHRzL2NvbnRhaW5lcml6ZSBiL2F1dG9tYXRpb24vc2NyaXB0cy9jb250YWlu
ZXJpemUKaW5kZXggMmNiODAyMS4uZDE3ZjVmZiAxMDA3NTUKLS0tIGEvYXV0b21hdGlvbi9zY3Jp
cHRzL2NvbnRhaW5lcml6ZQorKysgYi9hdXRvbWF0aW9uL3NjcmlwdHMvY29udGFpbmVyaXplCkBA
IC0yMiwxMCArMjIsNiBAQCBjYXNlICJfJHtDT05UQUlORVJ9IiBpbgogICAgIF9zdHJldGNofF8p
IENPTlRBSU5FUj0iJHtCQVNFfS9kZWJpYW46c3RyZXRjaCIgOzsKIGVzYWMKIAotIyBnZXQgb3Vy
IGNvbnRhaW5lciBuYW1lIGFuZCB2ZXJzaW9uCi1jb250YWluaWQ9JHtDT05UQUlORVIlOip9Ci1j
b250YWludmVyPSR7Q09OVEFJTkVSIyo6fQotCiAjIFNhdmUgdGhlIGNvbW1hbmRzIGZvciBmdXR1
cmUgdXNlCiBjbWQ9JEAKIApAQCAtNzUsNyArNzEsNiBAQCBmaQogIyBLaWNrIG9mZiBEb2NrZXIK
IGVpbmZvICIqKiogTGF1bmNoaW5nIGNvbnRhaW5lciAuLi4iCiBleGVjIGRvY2tlciBydW4gXAot
ICAgICR7RE9DS0VSX0FSR1N9IFwKICAgICAke1NTSF9BVVRIX1NPQ0s6Ky1lIFNTSF9BVVRIX1NP
Q0s9Ii90bXAvc3NoLWFnZW50LyR7U1NIX0FVVEhfTkFNRX0ifSBcCiAgICAgLXYgIiR7Q09OVEFJ
TkVSX1BBVEh9IjovYnVpbGQ6cncgXAogICAgIC12ICIke0hPTUV9Ly5zc2giOi9yb290Ly5zc2g6
cm8gXAotLSAKZ2l0LXNlcmllcyAwLjkuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
