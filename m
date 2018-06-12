From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 08/11] ts-xen-install:
 DebianExtraPackages: call apt-get -f install
Date: Tue, 12 Jun 2018 12:37:42 +0100
Message-ID: <1528803465-31661-9-git-send-email-ian.jackson@eu.citrix.com>
References: <1528803465-31661-1-git-send-email-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=hfe/=i6=citrix.com=prvs=694d9f8cf=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1fShd6-0001sD-Sx
 for xen-devel@lists.xenproject.org; Tue, 12 Jun 2018 11:38:28 +0000
In-Reply-To: <1528803465-31661-1-git-send-email-ian.jackson@eu.citrix.com>
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

Q3VycmVudGx5IHRoaXMgaXMganVzdCBhIHByZWNhdXRpb24uCgpTaWduZWQtb2ZmLWJ5OiBJYW4g
SmFja3NvbiA8SWFuLkphY2tzb25AZXUuY2l0cml4LmNvbT4KLS0tCiB0cy14ZW4taW5zdGFsbCB8
IDEgKwogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCgpkaWZmIC0tZ2l0IGEvdHMteGVu
LWluc3RhbGwgYi90cy14ZW4taW5zdGFsbAppbmRleCBkM2E5ZDExLi45OTEzZTg1IDEwMDc1NQot
LS0gYS90cy14ZW4taW5zdGFsbAorKysgYi90cy14ZW4taW5zdGFsbApAQCAtOTksNiArOTksNyBA
QCBzdWIgc29tZV9leHRyYWRlYnMgKCQpIHsKIAl0YXJnZXRfY21kX3Jvb3QoJGhvLAogCQkJImRw
a2cgLS1mb3JjZS1jb25mb2xkICRkcGtnb3B0cyAkb250YXJnZXQgPC9kZXYvbnVsbCIsCiAJCQkz
MDApOworCXRhcmdldF9ydW5fYXB0KCRobywgcXcoLWYgaW5zdGFsbCkpOwogICAgIH0KIH0KIAot
LSAKMi4xLjQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
