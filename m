From: Doug Goldstein <cardoe@cardoe.com>
Subject: [PATCH v2 4/4] automation: ensure created are not owned
 as root
Date: Fri,  3 Aug 2018 09:46:49 -0500
Message-ID: <ff993ec7c3b1289c54a54f1a33732727c548d462.1533307528.git-series.cardoe@cardoe.com>
References: <cover.4b23ba1ce92c90e0ac8ae709020c62a6ec0405b8.1533307528.git-series.cardoe@cardoe.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=axmp=ks=cardoe.com=cardoe@srs-us1.protection.inumbo.net>)
 id 1flbM2-0001bm-Oh
 for xen-devel@lists.xenproject.org; Fri, 03 Aug 2018 14:46:58 +0000
Received: by mail-qk0-x231.google.com with SMTP id z74-v6so4161086qkb.10
 for <xen-devel@lists.xenproject.org>; Fri, 03 Aug 2018 07:46:57 -0700 (PDT)
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

QnkgZGVmYXVsdCB0aGUgY29udGFpbmVyIHJ1bnMgYXMgdGhlIHJvb3QgdXNlciBhbmQgc2luY2Ug
dGhlIHNvdXJjZSB0cmVlCmlzIGJpbmQgbW91bnRlZCBpbnRvIHRoZSBjb250YWluZXIsIGFueSBm
aWxlIGlzIGNyZWF0ZWQgYW5kIG93bmVkIGJ5IHRoZQpyb290IHVzZXIgd2hpY2ggaGFybXMgZXJn
b25vbWljcyB3aGVuIHdvcmtpbmcgb3V0c2lkZSBvZiB0aGUgY29udGFpbmVyCmVudmlyb25tZW50
LiBUaGlzIG1hcHMgdGhlIHJvb3QgdXNlciB3aXRoaW4gdGhlIGNvbnRhaW5lciB0byB0aGUgdWlk
IG9mCnRoZSB1c2VyIG91dHNpZGUgb2YgdGhlIGNvbnRhaW5lciBzbyBmaWxlcyBhcmUgbm90IG93
bmVkIGJ5IHJvb3QuCgpTaWduZWQtb2ZmLWJ5OiBEb3VnIEdvbGRzdGVpbiA8Y2FyZG9lQGNhcmRv
ZS5jb20+ClJldmlld2VkLWJ5OiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgotLS0KIGF1
dG9tYXRpb24vc2NyaXB0cy9jb250YWluZXJpemUgfCAxICsKIDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKQoKZGlmZiAtLWdpdCBhL2F1dG9tYXRpb24vc2NyaXB0cy9jb250YWluZXJpemUg
Yi9hdXRvbWF0aW9uL3NjcmlwdHMvY29udGFpbmVyaXplCmluZGV4IDdiZGZjMjEuLmJmOWFmNTgg
MTAwNzU1Ci0tLSBhL2F1dG9tYXRpb24vc2NyaXB0cy9jb250YWluZXJpemUKKysrIGIvYXV0b21h
dGlvbi9zY3JpcHRzL2NvbnRhaW5lcml6ZQpAQCAtNzAsNiArNzAsNyBAQCBmaQogIyBLaWNrIG9m
ZiBEb2NrZXIKIGVpbmZvICIqKiogTGF1bmNoaW5nIGNvbnRhaW5lciAuLi4iCiBleGVjIGRvY2tl
ciBydW4gXAorICAgIC11ICQoaWQgLXUpIFwKICAgICAke1NTSF9BVVRIX1NPQ0s6Ky1lIFNTSF9B
VVRIX1NPQ0s9Ii90bXAvc3NoLWFnZW50LyR7U1NIX0FVVEhfTkFNRX0ifSBcCiAgICAgLXYgIiR7
Q09OVEFJTkVSX1BBVEh9IjovYnVpbGQ6cncgXAogICAgIC12ICIke0hPTUV9Ly5zc2giOi9yb290
Ly5zc2g6cm8gXAotLSAKZ2l0LXNlcmllcyAwLjkuMQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
