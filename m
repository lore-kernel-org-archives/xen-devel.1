From: Doug Goldstein <cardoe@cardoe.com>
Subject: [PATCH 0/4] This series improves the containerize
 script to hopefully make it more
Date: Mon, 30 Jul 2018 09:02:34 -0500
Message-ID: <cover.1acf9637303405d6bdb1a9ad450b2a4ea5a0307d.1532959347.git-series.cardoe@cardoe.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=kzam=ko=cardoe.com=cardoe@srs-us1.protection.inumbo.net>)
 id 1fk8kv-0003mb-Uu
 for xen-devel@lists.xenproject.org; Mon, 30 Jul 2018 14:02:37 +0000
Received: by mail-yb0-x22f.google.com with SMTP id e9-v6so4779171ybq.1
 for <xen-devel@lists.xenproject.org>; Mon, 30 Jul 2018 07:02:36 -0700 (PDT)
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Doug Goldstein <cardoe@cardoe.com>
List-Id: xen-devel@lists.xenproject.org

ZnJpZW5kbHkgZm9yIGZvbGtzIHRvIHVzZSB0byBsb2NhbGx5IGRvIGJ1aWxkIHRlc3RzIHVuZGVy
IGRpZmZlcmVudApkaXN0cm9zLgoKRG91ZyBHb2xkc3RlaW4gKDQpOgogIGF1dG9tYXRpb246IHN0
YW5kYXJkaXplIGNvbnRhaW5lcml6ZSBlbnYgbmFtZXMKICBhdXRvbWF0aW9uOiBkcm9wIGNvbnRh
aW5lciBuYW1lIGZyb20gY29udGFpbmVyaXplCiAgYXV0b21hdGlvbjogcmVtb3ZlIGRlYWQgY29k
ZSBmcm9tIGNvbnRhaW5lcml6ZQogIGF1dG9tYXRpb246IGVuc3VyZSBjcmVhdGVkIGFyZSBub3Qg
b3duZWQgYXMgcm9vdAoKIGF1dG9tYXRpb24vYnVpbGQvUkVBRE1FLm1kICAgICAgfCAxNSArKysr
Ky0tLS0tLS0tLS0KIGF1dG9tYXRpb24vc2NyaXB0cy9jb250YWluZXJpemUgfCAyMSArKysrKyst
LS0tLS0tLS0tLS0tLS0KIDIgZmlsZXMgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKSwgMjUgZGVs
ZXRpb25zKC0pCgpiYXNlLWNvbW1pdDogYWNkMDBhMzAzMzc4Y2U0OGJkNmJiZDhhNTc5ZjFmZTJm
MWIyMWE3ZAotLSAKZ2l0LXNlcmllcyAwLjkuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
