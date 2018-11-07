From: Wei Liu <wei.liu2@citrix.com>
Subject: [PATCH 3/3] automation: lift tools build restriction in
 build script
Date: Wed, 7 Nov 2018 12:31:49 +0000
Message-ID: <20181107123149.4751-4-wei.liu2@citrix.com>
References: <20181107123149.4751-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=eq5n=ns=citrix.com=prvs=8424bdc41=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1gKMzz-0004eh-53
 for xen-devel@lists.xenproject.org; Wed, 07 Nov 2018 12:31:55 +0000
In-Reply-To: <20181107123149.4751-1-wei.liu2@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Lars Kurth <lars.kurth@citrix.com>, Julien Grall <julien.grall@arm.com>, Wei Liu <wei.liu2@citrix.com>, Doug Goldstein <cardoe@cardoe.com>
List-Id: xen-devel@lists.xenproject.org

VGhlIHJlc3RyaWN0aW9ucyBhcmUgbW9zdGx5IGZyb20gVHJhdmlzIENJIGRheXMgd2hlbiBjcm9z
cy1jb21waWxhdGlvbgp3YXMgbm90IGZlYXNpYmxlLiBOb3cgd2Ugd2lsbCBiZSBidWlsZGluZyBu
YXRpdmVseSBvbiBBcm0sIHJlbW92ZQp0aG9zZSBsaW5lcy4KClNpZ25lZC1vZmYtYnk6IFdlaSBM
aXUgPHdlaS5saXUyQGNpdHJpeC5jb20+Ci0tLQogYXV0b21hdGlvbi9zY3JpcHRzL2J1aWxkIHwg
NiAtLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA2IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2F1
dG9tYXRpb24vc2NyaXB0cy9idWlsZCBiL2F1dG9tYXRpb24vc2NyaXB0cy9idWlsZAppbmRleCBj
NDYzYjA2MGQ0Li40ODJlZDQ4MjAxIDEwMDc1NQotLS0gYS9hdXRvbWF0aW9uL3NjcmlwdHMvYnVp
bGQKKysrIGIvYXV0b21hdGlvbi9zY3JpcHRzL2J1aWxkCkBAIC0yMiwxMiArMjIsNiBAQCBpZiBb
WyAiJHtDQ30iID09ICJjbGFuZyIgXV07IHRoZW4KICAgICBjZmdhcmdzKz0oIi0tZGlzYWJsZS1z
dHViZG9tIikKIGZpCiAKLWlmIFtbICIke1hFTl9UQVJHRVRfQVJDSH0iID09ICJhcm02NCIgfHwg
IiR7WEVOX1RBUkdFVF9BUkNIfSIgPT0gImFybTMyIiBdXTsgdGhlbgotICAgIGNmZ2FyZ3MrPSgi
LS1kaXNhYmxlLXRvb2xzIikgIyB3ZSBkb24ndCBoYXZlIHRoZSBjcm9zcyBkZXBlbmRzIGluc3Rh
bGxlZAotZWxpZiBbWyAiJHtDQ30iICE9ICJjbGFuZyIgXV07IHRoZW4KLSAgICBjZmdhcmdzKz0o
Ii0tZW5hYmxlLW92bWYiKSAjIGJ1aWxkIG92bWYgd2l0aCBnY2Mgb24geDg2LCBhcm0gZG9lc24n
dCB1c2UgaW4tdHJlZSBvdm1mCi1maQotCiAuL2NvbmZpZ3VyZSAiJHtjZmdhcmdzW0BdfSIKIAog
bWFrZSAtaiQobnByb2MpIGRpc3QKLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
