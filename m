From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH v2 14/23] Osstest/Debian: bootloader:
 Ignore `.config' files
Date: Wed, 23 May 2018 17:16:01 +0100
Message-ID: <1527092170-4111-15-git-send-email-ian.jackson@eu.citrix.com>
References: <1527092170-4111-1-git-send-email-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=gdxj=ik=citrix.com=prvs=674fbe803=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1fLWR5-0000PG-TP
 for xen-devel@lists.xenproject.org; Wed, 23 May 2018 16:16:23 +0000
In-Reply-To: <1527092170-4111-1-git-send-email-ian.jackson@eu.citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <Ian.Jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

U29tZSB2ZXJzaW9ucyBvZiB0aGUgYm9vdGxvYWRlciBzY3JpcHRzIHdpbGwgbWFrZSBtZW51IGVu
dHJpZXMgZm9yCmAuY29uZmlnJyBmaWxlcywgY29udGFpbmluZyB0aGUgaHlwZXJ2aXNvciBjb25m
aWcuICBUaGVzZSBzaG91bGQgYmUKaWdub3JlZC4KCihJdCBpcyBub3QgY2xlYXIgdG8gbWUsIGdp
dmVuIG91ciAyMF9saW51eF94ZW4gaGFjaywgd2hldGhlciB0aGlzIGlzCmluIGZhY3QgYW4gdXBz
dHJlYW0gYnVnLCBvciBhIGJ1ZyBpbiAyMF9saW51eF94ZW4uKQoKU2lnbmVkLW9mZi1ieTogSWFu
IEphY2tzb24gPElhbi5KYWNrc29uQGV1LmNpdHJpeC5jb20+Ci0tLQogT3NzdGVzdC9EZWJpYW4u
cG0gfCAzICsrKwogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBh
L09zc3Rlc3QvRGViaWFuLnBtIGIvT3NzdGVzdC9EZWJpYW4ucG0KaW5kZXggMDE5ODkzZC4uOTdk
NDUxZiAxMDA2NDQKLS0tIGEvT3NzdGVzdC9EZWJpYW4ucG0KKysrIGIvT3NzdGVzdC9EZWJpYW4u
cG0KQEAgLTQ3Niw2ICs0NzYsOSBAQCBzdWIgc2V0dXBib290X2dydWIyICgkJCQkKSB7CiAJCX0g
ZWxzaWYgKCRlbnRyeS0+e0h2fSA9fiBtL3hlbi1zeW1zLykgewogCQkgICAgbG9nbSgiKHNraXBw
aW5nIGVudHJ5IGF0ICRlbnRyeS0+e1N0YXJ0TGluZX0uLiQuOyIuCiAJCQkgIiBpcyB4ZW4tc3lt
cykiKTsKKwkJfSBlbHNpZiAoJGVudHJ5LT57SHZ9ID1+IG0vXC5jb25maWckLykgeworCQkgICAg
bG9nbSgiKHNraXBwaW5nIGVudHJ5IGF0ICRlbnRyeS0+e1N0YXJ0TGluZX0uLiQuOyIuCisJCQkg
IiBpcyAuY29uZmlnKSIpOwogCQl9IGVsc2lmIChkZWZpbmVkICR3YW50X2tlcm52ZXIgJiYKIAkJ
CSAkZW50cnktPntLZXJuVmVyfSBuZSAkd2FudF9rZXJudmVyKSB7CiAJCSAgICBsb2dtKCIoc2tp
cHBpbmcgZW50cnkgYXQgJGVudHJ5LT57U3RhcnRMaW5lfS4uJC47Ii4KLS0gCjIuMS40CgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
