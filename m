From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [PATCH 04/12] pygrub fsimage.so: Honour LDFLAGS when
 building
Date: Fri, 12 Oct 2018 16:12:07 +0100
Message-ID: <20181012151215.32455-5-ian.jackson@eu.citrix.com>
References: <20181012151215.32455-1-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=pszq=my=citrix.com=prvs=81651eb4b=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1gAz71-00018V-5J
 for xen-devel@lists.xenproject.org; Fri, 12 Oct 2018 15:12:23 +0000
In-Reply-To: <20181012151215.32455-1-ian.jackson@eu.citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <ian.jackson@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

RnJvbTogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGNpdHJpeC5jb20+CgpUaGlzIHNlZW1zIHRv
IGhhdmUgYmVlbiBzaW1wbHkgb21pdHRlZC4gIE9idmlvdXNseSB0aGlzIGlzIG5lZWRlZCB3aGVu
CmJ1aWxkaW5nIGFuZCBub3QganVzdCB3aGVuIGluc3RhbGxpbmcuICBQYXNzaW5nIG9ubHkgd2hl
biBpbnN0YWxsaW5nCmlzIGluZWZmZWN0aXZlLgoKU2lnbmVkLW9mZi1ieTogSWFuIEphY2tzb24g
PGlhbi5qYWNrc29uQGNpdHJpeC5jb20+Ci0tLQogdG9vbHMvcHlncnViL01ha2VmaWxlIHwgMiAr
LQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0t
Z2l0IGEvdG9vbHMvcHlncnViL01ha2VmaWxlIGIvdG9vbHMvcHlncnViL01ha2VmaWxlCmluZGV4
IDUzNmFmMDc5MzIuLjMwNjNjNDk5OGYgMTAwNjQ0Ci0tLSBhL3Rvb2xzL3B5Z3J1Yi9NYWtlZmls
ZQorKysgYi90b29scy9weWdydWIvTWFrZWZpbGUKQEAgLTEwLDcgKzEwLDcgQEAgSU5TVEFMTF9M
T0cgPSBidWlsZC9pbnN0YWxsZWRfZmlsZXMudHh0CiBhbGw6IGJ1aWxkCiAuUEhPTlk6IGJ1aWxk
CiBidWlsZDoKLQlDQz0iJChDQykiIENGTEFHUz0iJChQWV9DRkxBR1MpIiAkKFBZVEhPTikgc2V0
dXAucHkgYnVpbGQKKwlDQz0iJChDQykiIENGTEFHUz0iJChQWV9DRkxBR1MpIiBMREZMQUdTPSIk
KFBZX0xERkxBR1MpIiAkKFBZVEhPTikgc2V0dXAucHkgYnVpbGQKIAogLlBIT05ZOiBpbnN0YWxs
CiBpbnN0YWxsOiBhbGwKLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
