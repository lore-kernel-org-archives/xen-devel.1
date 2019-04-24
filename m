From: Roger Pau Monne <roger.pau@citrix.com>
Subject: [PATCH] tools/include: propagate python interpreter path
Date: Wed, 24 Apr 2019 11:20:37 +0200
Message-ID: <20190424092037.72003-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Rs1d=S2=citrix.com=prvs=010ed0f85=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hJE5K-0004Ax-0z
 for xen-devel@lists.xenproject.org; Wed, 24 Apr 2019 09:20:58 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Wei Liu <wei.liu2@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

VG8gdGhlIE1ha2VmaWxlIHRoYXQgZ2VuZXJhdGVzIHRoZSBjcHVpZCBwb2xpY3kuIFdpdGhvdXQg
dGhpcyBmaXggaWYKdGhlIHRvb2xzIHB5dGhvbiBpbnRlcnByZXRlciBpcyBkaWZmZXJlbnQgdGhh
biB0aGUgZGVmYXVsdCAncHl0aG9uJyBpdAp3b24ndCBiZSBjb3JyZWN0bHkgcHJvcGFnYXRlZC4K
ClNpZ25lZC1vZmYtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgot
LS0KQ2M6IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPgpDYzogV2VpIExp
dSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KLS0tCiB0b29scy9pbmNsdWRlL01ha2VmaWxlIHwgMiAr
LQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0t
Z2l0IGEvdG9vbHMvaW5jbHVkZS9NYWtlZmlsZSBiL3Rvb2xzL2luY2x1ZGUvTWFrZWZpbGUKaW5k
ZXggZDY5MzgxMDA1My4uNzE1MzhlMWNlMiAxMDA2NDQKLS0tIGEvdG9vbHMvaW5jbHVkZS9NYWtl
ZmlsZQorKysgYi90b29scy9pbmNsdWRlL01ha2VmaWxlCkBAIC0zMiw3ICszMiw3IEBAIGVuZGlm
CiAJdG91Y2ggJEAKIAogYWxsLSQoQ09ORklHX1g4Nik6IHhlbi8uZGlyCi0JJChNQUtFKSAtQyB4
ZW4vbGliL3g4NiBhbGwgWEVOX1JPT1Q9JChYRU5fUk9PVCkKKwkkKE1BS0UpIC1DIHhlbi9saWIv
eDg2IGFsbCBYRU5fUk9PVD0kKFhFTl9ST09UKSBQWVRIT049JChQWVRIT04pCiAKICMgTm90IHhl
bi94c20gYXMgdGhhdCBjbGFzaGVzIHdpdGggbGluayB0bwogIyAkKFhFTl9ST09UKS94ZW4vaW5j
bHVkZS9wdWJsaWMveHNtIGFib3ZlLgotLSAKMi4xNy4yIChBcHBsZSBHaXQtMTEzKQoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
