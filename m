From: Doug Goldstein <cardoe@cardoe.com>
Subject: [PATCH 4/4] automation: ensure created are not owned as
 root
Date: Sat, 28 Jul 2018 12:11:52 -0500
Message-ID: <88ff24cc128fae7475a17b91cb3597c76d66e30a.1532797834.git-series.cardoe@cardoe.com>
References: <cover.1acf9637303405d6bdb1a9ad450b2a4ea5a0307d.1532797834.git-series.cardoe@cardoe.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=vdf1=km=cardoe.com=cardoe@srs-us1.protection.inumbo.net>)
 id 1fjSlH-0004iZ-DB
 for xen-devel@lists.xenproject.org; Sat, 28 Jul 2018 17:12:11 +0000
Received: by mail-qt0-x241.google.com with SMTP id t5-v6so8242158qtn.3
 for <xen-devel@lists.xenproject.org>; Sat, 28 Jul 2018 10:12:10 -0700 (PDT)
In-Reply-To: <cover.1acf9637303405d6bdb1a9ad450b2a4ea5a0307d.1532797834.git-series.cardoe@cardoe.com>
In-Reply-To: <cover.1acf9637303405d6bdb1a9ad450b2a4ea5a0307d.1532797834.git-series.cardoe@cardoe.com>
References: <cover.1acf9637303405d6bdb1a9ad450b2a4ea5a0307d.1532797834.git-series.cardoe@cardoe.com>
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

QnkgZGVmYXVsdCB0aGUgY29udGFpbmVyIHJ1bnMgYXMgdGhlIHJvb3QgdXNlciBhbmQgc2luY2Ug
dGhlIHNvdXJjZSB0cmVlCmlzIGJpbmQgbW91bnRlZCBpbnRvIHRoZSBjb250YWluZXIsIGFueSBm
aWxlIGlzIGNyZWF0ZWQgYW5kIG93bmVkIGJ5IHRoZQpyb290IHVzZXIgd2hpY2ggaGFybXMgZXJn
b25vbWljcyB3aGVuIHdvcmtpbmcgb3V0c2lkZSBvZiB0aGUgY29udGFpbmVyCmVudmlyb25tZW50
LiBUaGlzIG1hcHMgdGhlIHJvb3QgdXNlciB3aXRoaW4gdGhlIGNvbnRhaW5lciB0byB0aGUgdWlk
IG9mCnRoZSB1c2VyIG91dHNpZGUgb2YgdGhlIGNvbnRhaW5lciBzbyBmaWxlcyBhcmUgbm90IG93
bmVkIGJ5IHJvb3QuCgpTaWduZWQtb2ZmLWJ5OiBEb3VnIEdvbGRzdGVpbiA8Y2FyZG9lQGNhcmRv
ZS5jb20+Ci0tLQogYXV0b21hdGlvbi9zY3JpcHRzL2NvbnRhaW5lcml6ZSB8IDEgKwogMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCgpkaWZmIC0tZ2l0IGEvYXV0b21hdGlvbi9zY3JpcHRz
L2NvbnRhaW5lcml6ZSBiL2F1dG9tYXRpb24vc2NyaXB0cy9jb250YWluZXJpemUKaW5kZXggZDE3
ZjVmZi4uN2QyOTdkNyAxMDA3NTUKLS0tIGEvYXV0b21hdGlvbi9zY3JpcHRzL2NvbnRhaW5lcml6
ZQorKysgYi9hdXRvbWF0aW9uL3NjcmlwdHMvY29udGFpbmVyaXplCkBAIC03MSw2ICs3MSw3IEBA
IGZpCiAjIEtpY2sgb2ZmIERvY2tlcgogZWluZm8gIioqKiBMYXVuY2hpbmcgY29udGFpbmVyIC4u
LiIKIGV4ZWMgZG9ja2VyIHJ1biBcCisgICAgLXUgJChpZCAtdSkgXAogICAgICR7U1NIX0FVVEhf
U09DSzorLWUgU1NIX0FVVEhfU09DSz0iL3RtcC9zc2gtYWdlbnQvJHtTU0hfQVVUSF9OQU1FfSJ9
IFwKICAgICAtdiAiJHtDT05UQUlORVJfUEFUSH0iOi9idWlsZDpydyBcCiAgICAgLXYgIiR7SE9N
RX0vLnNzaCI6L3Jvb3QvLnNzaDpybyBcCi0tIApnaXQtc2VyaWVzIDAuOS4xCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
