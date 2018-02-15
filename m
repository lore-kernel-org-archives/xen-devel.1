From: Wei Liu <wei.liu2@citrix.com>
Subject: [PATCH RFC 1/4] x86: introduce cpu_has_invpcid
Date: Thu, 15 Feb 2018 12:10:37 +0000
Message-ID: <20180215121040.20585-2-wei.liu2@citrix.com>
References: <20180215121040.20585-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=zbre=fj=citrix.com=prvs=57767c78e=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1emINF-0002Vf-8N
 for xen-devel@lists.xenproject.org; Thu, 15 Feb 2018 12:10:49 +0000
In-Reply-To: <20180215121040.20585-1-wei.liu2@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <JBeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

U2lnbmVkLW9mZi1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KLS0tCiB4ZW4vaW5j
bHVkZS9hc20teDg2L2NwdWZlYXR1cmUuaCB8IDEgKwogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspCgpkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9jcHVmZWF0dXJlLmggYi94
ZW4vaW5jbHVkZS9hc20teDg2L2NwdWZlYXR1cmUuaAppbmRleCA1NWI2OTZlZDA3Li5kYjgwNzIy
NzlkIDEwMDY0NAotLS0gYS94ZW4vaW5jbHVkZS9hc20teDg2L2NwdWZlYXR1cmUuaAorKysgYi94
ZW4vaW5jbHVkZS9hc20teDg2L2NwdWZlYXR1cmUuaApAQCAtOTMsNiArOTMsNyBAQAogI2RlZmlu
ZSBjcHVfaGFzX2F2eDIgICAgICAgICAgICBib290X2NwdV9oYXMoWDg2X0ZFQVRVUkVfQVZYMikK
ICNkZWZpbmUgY3B1X2hhc19zbWVwICAgICAgICAgICAgYm9vdF9jcHVfaGFzKFg4Nl9GRUFUVVJF
X1NNRVApCiAjZGVmaW5lIGNwdV9oYXNfYm1pMiAgICAgICAgICAgIGJvb3RfY3B1X2hhcyhYODZf
RkVBVFVSRV9CTUkyKQorI2RlZmluZSBjcHVfaGFzX2ludnBjaWQgICAgICAgICBib290X2NwdV9o
YXMoWDg2X0ZFQVRVUkVfSU5WUENJRCkKICNkZWZpbmUgY3B1X2hhc19ydG0gICAgICAgICAgICAg
Ym9vdF9jcHVfaGFzKFg4Nl9GRUFUVVJFX1JUTSkKICNkZWZpbmUgY3B1X2hhc19mcHVfc2VsICAg
ICAgICAgKCFib290X2NwdV9oYXMoWDg2X0ZFQVRVUkVfTk9fRlBVX1NFTCkpCiAjZGVmaW5lIGNw
dV9oYXNfbXB4ICAgICAgICAgICAgIGJvb3RfY3B1X2hhcyhYODZfRkVBVFVSRV9NUFgpCi0tIAoy
LjExLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
