From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 1/3] resource allocation:
 PropCompareBase: Break out _get_val
Date: Wed, 4 Jul 2018 11:56:29 +0100
Message-ID: <1530701791-32462-1-git-send-email-ian.jackson@eu.citrix.com>
References: <23356.42924.671628.339753@mariner.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=8qzb=ju=citrix.com=prvs=716786cb2=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1fafSk-00018o-IJ
 for xen-devel@lists.xenproject.org; Wed, 04 Jul 2018 10:56:42 +0000
In-Reply-To: <23356.42924.671628.339753@mariner.uk.xensource.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <royger@FreeBSD.org>, Ian Jackson <Ian.Jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

VGhpcyBpcyBnb2luZyB0byBtYWtlIGRlZmF1bHRpbmcgZXRjLiBhIGJpdCBlYXNpZXIuCgpObyBm
dW5jdGlvbmFsIGNoYW5nZS4KClNpZ25lZC1vZmYtYnk6IElhbiBKYWNrc29uIDxJYW4uSmFja3Nv
bkBldS5jaXRyaXguY29tPgpDQzogUm9nZXIgUGF1IE1vbm7DqSA8cm95Z2VyQEZyZWVCU0Qub3Jn
PgotLS0KIE9zc3Rlc3QvUmVzb3VyY2VDb25kaXRpb24vUHJvcENvbXBhcmVCYXNlLnBtIHwgMTEg
KysrKysrKystLS0KIDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25z
KC0pCgpkaWZmIC0tZ2l0IGEvT3NzdGVzdC9SZXNvdXJjZUNvbmRpdGlvbi9Qcm9wQ29tcGFyZUJh
c2UucG0gYi9Pc3N0ZXN0L1Jlc291cmNlQ29uZGl0aW9uL1Byb3BDb21wYXJlQmFzZS5wbQppbmRl
eCA1MzA2YmI4Li4xZTNhYTg1IDEwMDY0NAotLS0gYS9Pc3N0ZXN0L1Jlc291cmNlQ29uZGl0aW9u
L1Byb3BDb21wYXJlQmFzZS5wbQorKysgYi9Pc3N0ZXN0L1Jlc291cmNlQ29uZGl0aW9uL1Byb3BD
b21wYXJlQmFzZS5wbQpAQCAtNDQsNyArNDQsNyBAQCBzdWIgbmV3IHsKICAgICB9LCAkY2xhc3M7
CiB9CiAKLXN1YiBjaGVjayB7CitzdWIgX2dldF92YWwgKCQkJCkgewogICAgIG15ICgkcGMsICRy
ZXN0eXBlLCAkcmVzbmFtZSkgPSBAXzsKIAogICAgICMgVXNpbmcgX2NhY2hlZCBhdm9pZHMgbmVl
ZGluZyB0byB3b3JyeSBhYm91dCAkZGJoX3Rlc3RzIGJlaW5nCkBAIC01Nyw5ICs1NywxNCBAQCBF
TkQKIAogICAgIG15ICRyb3c9ICRocHJvcHEtPmZldGNocm93X2FycmF5cmVmKCk7CiAgICAgJGhw
cm9wcS0+ZmluaXNoKCk7CisgICAgCisgICAgbXkgJHYgPSAkcm93LT5bMF07CisgICAgcmV0dXJu
ICR2OworfQogCi0gICAgbXkgJHByb3B2YWwgPSAkcm93LT5bMF07Ci0KK3N1YiBjaGVjayB7Cisg
ICAgbXkgKCRwYywgJHJlc3R5cGUsICRyZXNuYW1lKSA9IEBfOworICAgIG15ICRwcm92YWwgPSAk
cGMtPl9nZXRfdmFsKCRwYywgJHJlc3R5cGUsICRyZXNuYW1lKTsKICAgICByZXR1cm4gJHBjLT5f
Y2hlY2soJHByb3B2YWwpOwogfQogCi0tIAoyLjEuNAoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
