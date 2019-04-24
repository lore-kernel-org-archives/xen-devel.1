From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH 0/2] Misc vcpu_op() adjustments
Date: Wed, 24 Apr 2019 19:10:56 +0100
Message-ID: <1556129458-11418-1-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=bPtL=S2=citrix.com=prvs=0106169aa=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hJMMz-00064c-3G
 for xen-devel@lists.xenproject.org; Wed, 24 Apr 2019 18:11:45 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien.grall@arm.com>, Norbert Manthey <nmanthey@amazon.de>, Jan Beulich <JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

QW5kcmV3IENvb3BlciAoMik6CiAgeGVuL2RvbWFpbjogQmxvY2sgbW9yZSBzcGVjdWxhdGl2ZSBv
dXQtb2YtYm91bmQgYWNjZXNzZXMKICB4ZW4vYXJtOiBNaXNjIGltcHJvdmVtZW50cyB0byBkb19j
b21tb25fY3B1X29uKCkKCiB4ZW4vYXJjaC9hcm0vdnBzY2kuYyAgICAgICB8IDggKysrLS0tLS0K
IHhlbi9jb21tb24vY29tcGF0L2RvbWFpbi5jIHwgMiArLQogMiBmaWxlcyBjaGFuZ2VkLCA0IGlu
c2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCgotLSAKMi4xLjQKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
