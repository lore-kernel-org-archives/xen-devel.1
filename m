From: Doug Goldstein <cardoe@cardoe.com>
Subject: [PATCH v2 3/4] automation: remove dead code from
 containerize
Date: Fri,  3 Aug 2018 09:46:48 -0500
Message-ID: <9bc620bbb1a2e391b61245c43aeaa5e9f1a86c19.1533307528.git-series.cardoe@cardoe.com>
References: <cover.4b23ba1ce92c90e0ac8ae709020c62a6ec0405b8.1533307528.git-series.cardoe@cardoe.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=axmp=ks=cardoe.com=cardoe@srs-us1.protection.inumbo.net>)
 id 1flbM1-0001b1-Ck
 for xen-devel@lists.xenproject.org; Fri, 03 Aug 2018 14:46:57 +0000
Received: by mail-qt0-x242.google.com with SMTP id n6-v6so6400153qtl.4
 for <xen-devel@lists.xenproject.org>; Fri, 03 Aug 2018 07:46:55 -0700 (PDT)
In-Reply-To: <cover.4b23ba1ce92c90e0ac8ae709020c62a6ec0405b8.1533307528.git-series.cardoe@cardoe.com>
In-Reply-To: <cover.4b23ba1ce92c90e0ac8ae709020c62a6ec0405b8.1533307528.git-series.cardoe@cardoe.com>
References: <cover.4b23ba1ce92c90e0ac8ae709020c62a6ec0405b8.1533307528.git-series.cardoe@cardoe.com>
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

VGhpcyBpcyBtb3JlIGRlYWQgY29kZS4KClNpZ25lZC1vZmYtYnk6IERvdWcgR29sZHN0ZWluIDxj
YXJkb2VAY2FyZG9lLmNvbT4KUmV2aWV3ZWQtYnk6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5j
b20+Ci0tLQogYXV0b21hdGlvbi9zY3JpcHRzL2NvbnRhaW5lcml6ZSB8IDUgLS0tLS0KIDEgZmls
ZSBjaGFuZ2VkLCA1IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2F1dG9tYXRpb24vc2NyaXB0
cy9jb250YWluZXJpemUgYi9hdXRvbWF0aW9uL3NjcmlwdHMvY29udGFpbmVyaXplCmluZGV4IDdm
MGViMGEuLjdiZGZjMjEgMTAwNzU1Ci0tLSBhL2F1dG9tYXRpb24vc2NyaXB0cy9jb250YWluZXJp
emUKKysrIGIvYXV0b21hdGlvbi9zY3JpcHRzL2NvbnRhaW5lcml6ZQpAQCAtMjMsMTAgKzIzLDYg
QEAgY2FzZSAiXyR7Q09OVEFJTkVSfSIgaW4KICAgICBfc3RyZXRjaHxfKSBDT05UQUlORVI9IiR7
QkFTRX0vZGViaWFuOnN0cmV0Y2giIDs7CiBlc2FjCiAKLSMgZ2V0IG91ciBjb250YWluZXIgbmFt
ZSBhbmQgdmVyc2lvbgotY29udGFpbmlkPSR7Q09OVEFJTkVSJToqfQotY29udGFpbnZlcj0ke0NP
TlRBSU5FUiMqOn0KLQogIyBTYXZlIHRoZSBjb21tYW5kcyBmb3IgZnV0dXJlIHVzZQogY21kPSRA
CiAKQEAgLTc0LDcgKzcwLDYgQEAgZmkKICMgS2ljayBvZmYgRG9ja2VyCiBlaW5mbyAiKioqIExh
dW5jaGluZyBjb250YWluZXIgLi4uIgogZXhlYyBkb2NrZXIgcnVuIFwKLSAgICAke0RPQ0tFUl9B
UkdTfSBcCiAgICAgJHtTU0hfQVVUSF9TT0NLOistZSBTU0hfQVVUSF9TT0NLPSIvdG1wL3NzaC1h
Z2VudC8ke1NTSF9BVVRIX05BTUV9In0gXAogICAgIC12ICIke0NPTlRBSU5FUl9QQVRIfSI6L2J1
aWxkOnJ3IFwKICAgICAtdiAiJHtIT01FfS8uc3NoIjovcm9vdC8uc3NoOnJvIFwKLS0gCmdpdC1z
ZXJpZXMgMC45LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
