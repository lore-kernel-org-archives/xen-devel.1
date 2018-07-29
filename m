From: Doug Goldstein <cardoe@cardoe.com>
Subject: [PATCH 2/2] ci: enable builds with CentOS 7.x
Date: Sun, 29 Jul 2018 16:53:16 -0500
Message-ID: <d9ad7cef24c8c87029e2b8f8bd915ef10121bd3f.1532901193.git-series.cardoe@cardoe.com>
References: <cover.e43916f2eba30c83ee3f3fa8bf4d1a71917c71d8.1532901193.git-series.cardoe@cardoe.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=jown=kn=cardoe.com=cardoe@srs-us1.protection.inumbo.net>)
 id 1fjtd5-00044e-UG
 for xen-devel@lists.xenproject.org; Sun, 29 Jul 2018 21:53:32 +0000
Received: by mail-yw0-x242.google.com with SMTP id e23-v6so3699714ywe.13
 for <xen-devel@lists.xenproject.org>; Sun, 29 Jul 2018 14:53:30 -0700 (PDT)
In-Reply-To: <cover.e43916f2eba30c83ee3f3fa8bf4d1a71917c71d8.1532901193.git-series.cardoe@cardoe.com>
In-Reply-To: <cover.e43916f2eba30c83ee3f3fa8bf4d1a71917c71d8.1532901193.git-series.cardoe@cardoe.com>
References: <cover.e43916f2eba30c83ee3f3fa8bf4d1a71917c71d8.1532901193.git-series.cardoe@cardoe.com>
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

QWRkIHRoZSBDZW50T1MgNy54IGltYWdlcyB0byBiZSB1c2VkIGZvciBidWlsZCB0ZXN0aW5nLgoK
U2lnbmVkLW9mZi1ieTogRG91ZyBHb2xkc3RlaW4gPGNhcmRvZUBjYXJkb2UuY29tPgotLS0KIC5n
aXRsYWItY2kueW1sIHwgMTYgKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDE2IGlu
c2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS8uZ2l0bGFiLWNpLnltbCBiLy5naXRsYWItY2kueW1s
CmluZGV4IDFiOTg3N2IuLjYzMjhkYTkgMTAwNjQ0Ci0tLSBhLy5naXRsYWItY2kueW1sCisrKyBi
Ly5naXRsYWItY2kueW1sCkBAIC0zOSw2ICszOSwyMiBAQCBjZW50b3MtNy0yLWdjYy1kZWJ1ZzoK
ICAgICBkZWJ1ZzogeQogICAgIFhFTl9UQVJHRVRfQVJDSDogeDg2XzY0CiAKK2NlbnRvcy03LWdj
YzoKKyAgPDw6ICpidWlsZAorICB2YXJpYWJsZXM6CisgICAgPDw6ICpnY2MKKyAgICBDT05UQUlO
RVI6IGNlbnRvczo3CisgICAgZGVidWc6IG4KKyAgICBYRU5fVEFSR0VUX0FSQ0g6IHg4Nl82NAor
CitjZW50b3MtNy1nY2MtZGVidWc6CisgIDw8OiAqYnVpbGQKKyAgdmFyaWFibGVzOgorICAgIDw8
OiAqZ2NjCisgICAgQ09OVEFJTkVSOiBjZW50b3M6NworICAgIGRlYnVnOiB5CisgICAgWEVOX1RB
UkdFVF9BUkNIOiB4ODZfNjQKKwogZGViaWFuLWplc3NpZS1jbGFuZzoKICAgPDw6ICpidWlsZAog
ICB2YXJpYWJsZXM6Ci0tIApnaXQtc2VyaWVzIDAuOS4xCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
