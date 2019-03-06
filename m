From: Igor Druzhinin <igor.druzhinin@citrix.com>
Subject: [PATCH RESEND 0/3] Xen PCI passthrough fixes
Date: Wed, 6 Mar 2019 12:40:53 +0000
Message-ID: <1551876056-28223-1-git-send-email-igor.druzhinin@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/oGn=RJ=citrix.com=prvs=961469de7=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1h1VrB-00006V-EE
 for xen-devel@lists.xenproject.org; Wed, 06 Mar 2019 12:41:09 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: edk2-devel@lists.01.org
Cc: Igor Druzhinin <igor.druzhinin@citrix.com>, ard.biesheuvel@linaro.org, jordan.l.justen@intel.com, julien.grall@arm.com, anthony.perard@citrix.com, xen-devel@lists.xenproject.org, lersek@redhat.com
List-Id: xen-devel@lists.xenproject.org

UmVzZW5kIHRvIGluY2x1ZGUgeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIHRvIENDCgpJ
Z29yIERydXpoaW5pbiAoMyk6CiAgT3ZtZlBrZy9YZW5TdXBwb3J0OiByZW1vdmUgdXNhZ2Ugb2Yg
cHJlZmV0Y2hhYmxlIFBDSSBob3N0IGJyaWRnZQogICAgYXBlcnR1cmUKICBPdm1mUGtnL1hlblN1
cHBvcnQ6IHVzZSBhIGNvcnJlY3QgUENJIGhvc3QgYnJpZGdlIGFwZXJ0dXJlIGZvciBCQVI2NAog
IE92bWZQa2cvWGVuU3VwcG9ydDogdHVybiBvZmYgYWRkcmVzcyBkZWNvZGluZyBiZWZvcmUgQkFS
IHNpemluZwoKIE92bWZQa2cvTGlicmFyeS9QY2lIb3N0QnJpZGdlTGliL1hlblN1cHBvcnQuYyB8
IDQ0ICsrKysrKysrKysrKysrKysrKysrKystLS0tLQogMSBmaWxlIGNoYW5nZWQsIDM3IGluc2Vy
dGlvbnMoKyksIDcgZGVsZXRpb25zKC0pCgotLSAKMi43LjQKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
