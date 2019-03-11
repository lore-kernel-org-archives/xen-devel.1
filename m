From: Jason Andryuk <jandryuk@gmail.com>
Subject: [PATCH 4/6] xen: Set HVM_PARAM_DM_DOMAIN for stubdom on
 older Xen
Date: Mon, 11 Mar 2019 14:02:14 -0400
Message-ID: <20190311180216.18811-5-jandryuk@gmail.com>
References: <20190311180216.18811-1-jandryuk@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=TSWV=RO=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1h3PGn-0001Fw-Ro
 for xen-devel@lists.xenproject.org; Mon, 11 Mar 2019 18:03:25 +0000
Received: by mail-qk1-x743.google.com with SMTP id b74so3222394qkg.9
 for <xen-devel@lists.xenproject.org>; Mon, 11 Mar 2019 11:03:24 -0700 (PDT)
In-Reply-To: <20190311180216.18811-1-jandryuk@gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: qemu-devel@nongnu.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Jason Andryuk <jandryuk@gmail.com>, marmarek@invisiblethingslab.com, Paul Durrant <paul.durrant@citrix.com>, Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

V2hlbiBydW5uaW5nIGluIGEgc3R1YmRvbSwgd2UgaGF2ZSB0byBpbmZvcm0gdGhlIGh5cGVydmlz
b3IgdGhhdCB0aGUKc3R1YmRvbSBhbmQgbm90IGRvbTAgaXMgaGFuZGxpbmcgdGhlIGRldmljZSBt
b2RlbC4gIEV4cGxpY2l0bHkgY3JlYXRlZAppb3JlcSBzZXJ2ZXJzIGFyZSBmaW5lLCBidXQgYSBj
YWxsIHRvIEhWTV9QQVJBTV9ETV9ET01BSU4gaXMgbmVlZGVkIGZvcgp0aGUgZGVmYXVsdCBpb3Jl
cSBzZXJ2ZXIuCgpYZW4gNC4xMiByZW1vdmVzIHRoZSBkZWZhdWx0IGlvcmVxIHNlcnZlci4gIFdp
dGggdGhhdCwgWGVuIHN0YXJ0ZWQKcmV0dXJuaW5nIGFuIGVycm9yIHdoZW4gc2V0dGluZyBIVk1f
UEFSQU1fRE1fRE9NQUlOLiAgUHV0IHRoZQpIVk1fUEFSQU1fRE1fRE9NQUlOIGNhbGwgaW4gdGhl
IHZlcnNpb24gY29tcGF0aWJpbGl0eSBoZWFkZXIuICBXaGVuIHdlCmZhbGxiYWNrIHRvIHRoZSBk
ZWZhdWx0IGlvcmVxIHNlcnZlciwgaXNzdWUgdGhlIGNhbGwgYW5kIGRvbid0IGJvdGhlciB0bwpj
aGVjayB0aGUgcmV0dXJuIHZhbHVlLgoKT3JpZ2luYWwgcGF0Y2ggYnkgQW50aG9ueSBQRVJBUkQg
PGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+CgpTaWduZWQtb2ZmLWJ5OiBKYXNvbiBBbmRyeXVr
IDxqYW5kcnl1a0BnbWFpbC5jb20+Ci0tLQogaW5jbHVkZS9ody94ZW4veGVuX2NvbW1vbi5oIHwg
NSArKysrKwogMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2lu
Y2x1ZGUvaHcveGVuL3hlbl9jb21tb24uaCBiL2luY2x1ZGUvaHcveGVuL3hlbl9jb21tb24uaApp
bmRleCA5YTgxNTVlMTcyLi5mNTlmODQxYTQzIDEwMDY0NAotLS0gYS9pbmNsdWRlL2h3L3hlbi94
ZW5fY29tbW9uLmgKKysrIGIvaW5jbHVkZS9ody94ZW4veGVuX2NvbW1vbi5oCkBAIC02MTYsNiAr
NjE2LDExIEBAIHN0YXRpYyBpbmxpbmUgdm9pZCB4ZW5fY3JlYXRlX2lvcmVxX3NlcnZlcihkb21p
ZF90IGRvbSwKIAogICAgICppb3NlcnZpZCA9IDA7CiAgICAgdXNlX2RlZmF1bHRfaW9yZXFfc2Vy
dmVyID0gdHJ1ZTsKKworICAgIGlmICh4ZW5fc3R1YmRvbV9lbmFibGVkKCkpIHsKKyAgICAgICAg
eGNfaHZtX3BhcmFtX3NldCh4ZW5feGMsIHhlbl9kb21pZCwgSFZNX1BBUkFNX0RNX0RPTUFJTiwg
RE9NSURfU0VMRik7CisgICAgfQorCiAgICAgdHJhY2VfeGVuX2RlZmF1bHRfaW9yZXFfc2VydmVy
KCk7CiB9CiAKLS0gCjIuMjAuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
