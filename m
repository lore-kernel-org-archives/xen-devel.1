From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [PATCH 03/12] gdbsx: Honour LDFLAGS when linking
Date: Fri, 12 Oct 2018 16:12:06 +0100
Message-ID: <20181012151215.32455-4-ian.jackson@eu.citrix.com>
References: <20181012151215.32455-1-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=pszq=my=citrix.com=prvs=81651eb4b=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1gAz70-00018H-BV
 for xen-devel@lists.xenproject.org; Fri, 12 Oct 2018 15:12:22 +0000
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
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>, Ian Jackson <ian.jackson@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

RnJvbTogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGNpdHJpeC5jb20+CgpUaGlzIGNvbW1hbmQg
ZG9lcyB0aGUgbGluaywgc28gaXQgbmVlZHMgTERGTEFHUy4KClNpZ25lZC1vZmYtYnk6IElhbiBK
YWNrc29uIDxpYW4uamFja3NvbkBjaXRyaXguY29tPgotLS0KIHRvb2xzL2RlYnVnZ2VyL2dkYnN4
L01ha2VmaWxlIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0
aW9uKC0pCgpkaWZmIC0tZ2l0IGEvdG9vbHMvZGVidWdnZXIvZ2Ric3gvTWFrZWZpbGUgYi90b29s
cy9kZWJ1Z2dlci9nZGJzeC9NYWtlZmlsZQppbmRleCA3MjNhMjc0M2NjLi44ZDdjZDk0YTMxIDEw
MDY0NAotLS0gYS90b29scy9kZWJ1Z2dlci9nZGJzeC9NYWtlZmlsZQorKysgYi90b29scy9kZWJ1
Z2dlci9nZGJzeC9NYWtlZmlsZQpAQCAtMjYsNyArMjYsNyBAQCB1bmluc3RhbGw6CiAJcm0gLWYg
JChERVNURElSKSQoc2JpbmRpcikvZ2Ric3gKIAogZ2Ric3g6IGd4L2d4X2FsbC5hIHhnL3hnX2Fs
bC5hIAotCSQoQ0MpIC1vICRAICReCisJJChDQykgJChMREZMQUdTKSAtbyAkQCAkXgogCiB4Zy94
Z19hbGwuYToKIAkkKE1BS0UpIC1DIHhnCi0tIAoyLjExLjAKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
