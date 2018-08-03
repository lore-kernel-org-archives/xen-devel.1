From: Doug Goldstein <cardoe@cardoe.com>
Subject: [PATCH v2 0/4] This series improves the containerize
 script to hopefully make it more
Date: Fri,  3 Aug 2018 09:46:45 -0500
Message-ID: <cover.4b23ba1ce92c90e0ac8ae709020c62a6ec0405b8.1533307528.git-series.cardoe@cardoe.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=axmp=ks=cardoe.com=cardoe@srs-us1.protection.inumbo.net>)
 id 1flbLy-0001a0-Ps
 for xen-devel@lists.xenproject.org; Fri, 03 Aug 2018 14:46:54 +0000
Received: by mail-qt0-x22a.google.com with SMTP id f18-v6so6357866qtp.10
 for <xen-devel@lists.xenproject.org>; Fri, 03 Aug 2018 07:46:52 -0700 (PDT)
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

ZnJpZW5kbHkgZm9yIGZvbGtzIHRvIHVzZSB0byBsb2NhbGx5IGRvIGJ1aWxkIHRlc3RzIHVuZGVy
IGRpZmZlcmVudApkaXN0cm9zLgoKY2hhbmdlIGZyb20gdjE6Ci0gZmlyc3QgcGF0Y2ggc3dpdGNo
IHRvIC16IGFzIGl0IG1ha2VzIG1vcmUgc2Vuc2UKCkRvdWcgR29sZHN0ZWluICg0KToKICBhdXRv
bWF0aW9uOiBzdGFuZGFyZGl6ZSBjb250YWluZXJpemUgZW52IG5hbWVzCiAgYXV0b21hdGlvbjog
ZHJvcCBjb250YWluZXIgbmFtZSBmcm9tIGNvbnRhaW5lcml6ZQogIGF1dG9tYXRpb246IHJlbW92
ZSBkZWFkIGNvZGUgZnJvbSBjb250YWluZXJpemUKICBhdXRvbWF0aW9uOiBlbnN1cmUgY3JlYXRl
ZCBhcmUgbm90IG93bmVkIGFzIHJvb3QKCiBhdXRvbWF0aW9uL2J1aWxkL1JFQURNRS5tZCAgICAg
IHwgMTUgKysrKystLS0tLS0tLS0tCiBhdXRvbWF0aW9uL3NjcmlwdHMvY29udGFpbmVyaXplIHwg
MjEgKysrKystLS0tLS0tLS0tLS0tLS0tCiAyIGZpbGVzIGNoYW5nZWQsIDEwIGluc2VydGlvbnMo
KyksIDI2IGRlbGV0aW9ucygtKQoKYmFzZS1jb21taXQ6IDAwOGE4ZmIyNDliOWQ0MzNhNjRiYzU5
YTkzMDc1YmNiNGIwMWUzZDMKLS0gCmdpdC1zZXJpZXMgMC45LjEKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
