From: Tamas K Lengyel <tamas@tklengyel.com>
Subject: [PATCH v5 3/4] x86/mem_sharing: enable mem_share audit
 mode only in debug builds
Date: Thu, 16 May 2019 15:37:51 -0600
Message-ID: <20190516213752.1701-3-tamas@tklengyel.com>
References: <20190516213752.1701-1-tamas@tklengyel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ykOh=TQ=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1hRO4t-0000Dq-GM
 for xen-devel@lists.xenproject.org; Thu, 16 May 2019 21:38:15 +0000
Received: by mail-it1-f194.google.com with SMTP id g71so8723660ita.5
 for <xen-devel@lists.xenproject.org>; Thu, 16 May 2019 14:38:14 -0700 (PDT)
In-Reply-To: <20190516213752.1701-1-tamas@tklengyel.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Tamas K Lengyel <tamas@tklengyel.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

SW1wcm92ZXMgcGVyZm9ybWFuY2UgZm9yIHJlbGVhc2UgYnVpbGRzLgoKU2lnbmVkLW9mZi1ieTog
VGFtYXMgSyBMZW5neWVsIDx0YW1hc0B0a2xlbmd5ZWwuY29tPgpDYzogSmFuIEJldWxpY2ggPGpi
ZXVsaWNoQHN1c2UuY29tPgpDYzogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4
LmNvbT4KQ2M6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+CkNjOiBSb2dlciBQYXUgTW9u
bmUgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgotLS0KIHhlbi9pbmNsdWRlL2FzbS14ODYvbWVtX3No
YXJpbmcuaCB8IDQgKysrKwogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQoKZGlmZiAt
LWdpdCBhL3hlbi9pbmNsdWRlL2FzbS14ODYvbWVtX3NoYXJpbmcuaCBiL3hlbi9pbmNsdWRlL2Fz
bS14ODYvbWVtX3NoYXJpbmcuaAppbmRleCA5ZjlmN2U5M2UzLi5hZmQwYzE3MjkyIDEwMDY0NAot
LS0gYS94ZW4vaW5jbHVkZS9hc20teDg2L21lbV9zaGFyaW5nLmgKKysrIGIveGVuL2luY2x1ZGUv
YXNtLXg4Ni9tZW1fc2hhcmluZy5oCkBAIC0yNSw3ICsyNSwxMSBAQAogI2luY2x1ZGUgPHB1Ymxp
Yy9tZW1vcnkuaD4KIAogLyogQXVkaXRpbmcgb2YgbWVtb3J5IHNoYXJpbmcgY29kZT8gKi8KKyNp
Zm5kZWYgTkRFQlVHCiAjZGVmaW5lIE1FTV9TSEFSSU5HX0FVRElUIDEKKyNlbHNlCisjZGVmaW5l
IE1FTV9TSEFSSU5HX0FVRElUIDAKKyNlbmRpZgogCiB0eXBlZGVmIHVpbnQ2NF90IHNocl9oYW5k
bGVfdDsgCiAKLS0gCjIuMjAuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
