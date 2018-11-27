From: Srikanth Boddepalli <boddepalli.srikanth@gmail.com>
Subject: [PATCH] xen: xlate_mmu: add missing header to fix 'W=1'
 warning
Date: Tue, 27 Nov 2018 19:53:27 +0530
Message-ID: <1543328607-10546-1-git-send-email-boddepalli.srikanth__27959.7851251767$1543328848$gmane$org@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=y2md=og=gmail.com=boddepalli.srikanth@srs-us1.protection.inumbo.net>)
 id 1gReHM-0001yw-D0
 for xen-devel@lists.xenproject.org; Tue, 27 Nov 2018 14:23:56 +0000
Received: by mail-pl1-x643.google.com with SMTP id x21-v6so15682603pln.9
 for <xen-devel@lists.xenproject.org>; Tue, 27 Nov 2018 06:23:55 -0800 (PST)
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: boris.ostrovsky@oracle.com
Cc: jgross@suse.com, xen-devel@lists.xenproject.org, sstabellini@kernel.org, linux-kernel@vger.kernel.org, boddepalli.srikanth@gmail.com
List-Id: xen-devel@lists.xenproject.org

QWRkIGEgbWlzc2luZyBoZWFkZXIgb3RoZXJ3aXNlIGNvbXBpbGVyIHdhcm5zIGFib3V0IG1pc3Nl
ZCBwcm90b3R5cGU6Cgpkcml2ZXJzL3hlbi94bGF0ZV9tbXUuYzoxODM6NTogd2FybmluZzogbm8g
cHJldmlvdXMgcHJvdG90eXBlIGZvciAneGVuX3hsYXRlX3VubWFwX2dmbl9yYW5nZT8nIFstV21p
c3NpbmctcHJvdG90eXBlc10KICBpbnQgeGVuX3hsYXRlX3VubWFwX2dmbl9yYW5nZShzdHJ1Y3Qg
dm1fYXJlYV9zdHJ1Y3QgKnZtYSwKICAgICAgXn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fgoKU2ln
bmVkLW9mZi1ieTogU3Jpa2FudGggQm9kZGVwYWxsaSA8Ym9kZGVwYWxsaS5zcmlrYW50aEBnbWFp
bC5jb20+Ci0tLQogZHJpdmVycy94ZW4veGxhdGVfbW11LmMgfCAxICsKIDEgZmlsZSBjaGFuZ2Vk
LCAxIGluc2VydGlvbigrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMveGVuL3hsYXRlX21tdS5jIGIv
ZHJpdmVycy94ZW4veGxhdGVfbW11LmMKaW5kZXggMjNmMTM4Ny4uZTdkZjY1ZCAxMDA2NDQKLS0t
IGEvZHJpdmVycy94ZW4veGxhdGVfbW11LmMKKysrIGIvZHJpdmVycy94ZW4veGxhdGVfbW11LmMK
QEAgLTM2LDYgKzM2LDcgQEAKICNpbmNsdWRlIDxhc20veGVuL2h5cGVydmlzb3IuaD4KIAogI2lu
Y2x1ZGUgPHhlbi94ZW4uaD4KKyNpbmNsdWRlIDx4ZW4veGVuLW9wcy5oPgogI2luY2x1ZGUgPHhl
bi9wYWdlLmg+CiAjaW5jbHVkZSA8eGVuL2ludGVyZmFjZS94ZW4uaD4KICNpbmNsdWRlIDx4ZW4v
aW50ZXJmYWNlL21lbW9yeS5oPgotLSAKMi43LjQKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
