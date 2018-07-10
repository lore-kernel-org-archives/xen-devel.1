From: Doug Goldstein <cardoe@cardoe.com>
Subject: [PATCH] automation: fix builds with clang
Date: Tue, 10 Jul 2018 17:58:58 -0500
Message-ID: <20180710225858.22501-1-cardoe@cardoe.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=rs53=j2=cardoe.com=cardoe@srs-us1.protection.inumbo.net>)
 id 1fd1bC-0006t2-Ew
 for xen-devel@lists.xenproject.org; Tue, 10 Jul 2018 22:59:10 +0000
Received: by mail-qt0-x244.google.com with SMTP id d4-v6so4365538qtn.13
 for <xen-devel@lists.xenproject.org>; Tue, 10 Jul 2018 15:59:08 -0700 (PDT)
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

YTc1NzAzYjJmMGY1ODVhMmZjNmE3YmNkYjdkMTZhNjFiY2Y1ZTZiMCB1bmNvbmRpdGlvbmFsbHkg
ZW5hYmxlZApidWlsZGluZyBvZiByb21iaW9zIGFuZCBzdHViZG9tcyBidXQgdW5mb3J0dW5hdGVs
eSB0aGVzZSB0d28gcGllY2VzIGRvCm5vdCBidWlsZCBzdWNjZXNzZnVsbHkgd2l0aCBjbGFuZy4g
cm9tYmlvcyB1bmNvbmRpdGlvbmFsbHkgZGVwZW5kcyBvbgp0aGUgYnVpbGQgb2YgaVBYRSBhbmQg
dXBzdHJlYW0gaVBYRSBkb2VzIG5vdCBzdXBwb3J0IGJ1aWxkaW5nIHdpdGgKY2xhbmcuIFNpbWls
aWFybHkgdGhlIGJ1aWxkIG9mIHRoZSBzdHViZG9tcyBkZXBlbmRzIG9uIHRoZSBidWlsZCBvZgpu
ZXdsaWIgd2hpY2ggZG9lcyBub3Qgc3VwcG9ydCBiZWluZyBidWlsdCB3aXRoIGNsYW5nLgoKU2ln
bmVkLW9mZi1ieTogRG91ZyBHb2xkc3RlaW4gPGNhcmRvZUBjYXJkb2UuY29tPgotLS0KIGF1dG9t
YXRpb24vc2NyaXB0cy9idWlsZCB8IDYgKysrKystCiAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRp
b25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvYXV0b21hdGlvbi9zY3JpcHRzL2J1
aWxkIGIvYXV0b21hdGlvbi9zY3JpcHRzL2J1aWxkCmluZGV4IGI5ZTRjMWUzMjkuLjhiYmNhMTVh
NTEgMTAwNzU1Ci0tLSBhL2F1dG9tYXRpb24vc2NyaXB0cy9idWlsZAorKysgYi9hdXRvbWF0aW9u
L3NjcmlwdHMvYnVpbGQKQEAgLTEzLDkgKzEzLDEzIEBAIGZpCiBjZmdhcmdzPSgpCiBjZmdhcmdz
Kz0oIi0tZW5hYmxlLWRvY3MiKQogCi0jIFNlYUJJT1MgY2Fubm90IGJlIGJ1aWx0IHdpdGggY2xh
bmcKIGlmIFtbICIke0NDfSIgPT0gImNsYW5nIiBdXTsgdGhlbgorICAgICMgU2VhQklPUyBjYW5u
b3QgYmUgYnVpbHQgd2l0aCBjbGFuZwogICAgIGNmZ2FyZ3MrPSgiLS13aXRoLXN5c3RlbS1zZWFi
aW9zPS91c3Ivc2hhcmUvc2VhYmlvcy9iaW9zLmJpbiIpCisgICAgIyBpUFhFIGNhbm5vdCBiZSBi
dWlsdCB3aXRoIGNsYW5nIHNvIHdlIGNhbm5vdCBidWlsZCByb21iaW9zCisgICAgY2ZnYXJncys9
KCItLWRpc2FibGUtcm9tYmlvcyIpCisgICAgIyBuZXdsaWIgY2Fubm90IGJlIGJ1aWx0IHdpdGgg
Y2xhbmcgc28gd2UgY2Fubm90IGJ1aWxkIHN0dWJkb21zCisgICAgY2ZnYXJncys9KCItLWRpc2Fi
bGUtc3R1YmRvbSIpCiBmaQogCiBpZiBbWyAiJHtYRU5fVEFSR0VUX0FSQ0h9IiA9PSAiYXJtNjQi
IHx8ICIke1hFTl9UQVJHRVRfQVJDSH0iID09ICJhcm0zMiIgXV07IHRoZW4KLS0gCjIuMTYuMQoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
