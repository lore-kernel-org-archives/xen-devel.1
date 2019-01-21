From: Andrii Anisov <andrii.anisov@gmail.com>
Subject: [PATCH 0/2] Dangling fixes for ARM iommu
Date: Mon, 21 Jan 2019 19:04:05 +0200
Message-ID: <1548090247-20078-1-git-send-email-andrii.anisov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8+6Q=P5=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1glcze-0007qm-EW
 for xen-devel@lists.xenproject.org; Mon, 21 Jan 2019 17:04:14 +0000
Received: by mail-lf1-x142.google.com with SMTP id v5so16010894lfe.7
 for <xen-devel@lists.xenproject.org>; Mon, 21 Jan 2019 09:04:13 -0800 (PST)
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Andrii Anisov <andrii_anisov@epam.com>
List-Id: xen-devel@lists.xenproject.org

RnJvbTogQW5kcmlpIEFuaXNvdiA8YW5kcmlpX2FuaXNvdkBlcGFtLmNvbT4KCkRlYXIgQWxsLAoK
V2l0aCBtb3Zpbmcgb3VyIHdvcmtpbmcgc2V0dXAgdG8gNC4xMi1yYzIgKElQTU1VIHNlcmllcyBl
c3BlY2lhbGx5KSxJJ3ZlCnJlYWxpemVkIHRoYXQgd2UgaGF2ZSBhIGNvdXBsZSBvZiBwYXRjaGVz
IGZyb20gSVBNTVUgc2VyaWVzIFsxXSB3aGljaCBhcmUKZml4ZXMsIGdvdCBSQi9BQiwgYnV0IG5v
dCByZWFjaGVkIG1haW5saW5lIHlldC4gSSByZWFsbHkgaG9wZSB0aG9zZSBSQi9BQgp3b3VsZCBu
b3QgYmUgdHJlYXRlZCBhcyBzdGFsZSwgYW5kIHBhdGNoZXMgYXJlIE9LIHRvIGdvIGludG8gNC4x
MiByZWxlYXNlLgoKT2xla3NhbmRyIFR5c2hjaGVua28gKDIpOgogIGlvbW11L2FybTogTWlzYyBm
aXhlcyBmb3IgYXJjaCBzcGVjaWZpYyBwYXJ0CiAgICAgICAgUkIgZnJvbSBKdWxpZW4gaXMgaGVy
ZSBbMl0KICB4ZW4vYXJtOiBkb21haW5fYnVpbGQ6IERvbid0IGV4cG9zZSBJT01NVSBzcGVjaWZp
YyBwcm9wZXJ0aWVzIHRvIHRoZQogICAgZ3Vlc3QKICAgICAgICBBQiBmcm9tIEp1bGllbiBpcyBo
ZXJlIFszXQoKWzFdIGh0dHBzOi8vbGlzdHMueGVuLm9yZy9hcmNoaXZlcy9odG1sL3hlbi1kZXZl
bC8yMDE3LTA3L21zZzAyNTQ1Lmh0bWwKWzJdIGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcv
cGF0Y2gvOTg2MjU2Ny8KWzNdIGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcGF0Y2gvOTg2
MjU2NS8KCgogeGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jICAgICAgICAgfCAxMCArKysrKysr
KysrCiB4ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hcm0vaW9tbXUuYyB8ICA3ICsrKysrLS0KIDIg
ZmlsZXMgY2hhbmdlZCwgMTUgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCi0tIAoyLjcu
NAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
