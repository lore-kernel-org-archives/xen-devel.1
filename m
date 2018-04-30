From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Subject: [PATCH 0/6] Fix XSA-155-like bugs in frontend drivers
Date: Mon, 30 Apr 2018 23:01:44 +0200
Message-ID: <cover.7ee732ab822b728ec486a3118ec12e9c06f0f325.1525122026.git-series.marmarek__46278.0710579411$1525122107$gmane$org@invisiblethingslab.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=ssrj=ht=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1fDFwn-0007QY-9n
 for xen-devel@lists.xenproject.org; Mon, 30 Apr 2018 21:02:57 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Jens Axboe <axboe@kernel.dk>, Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>, stable@vger.kernel.org, open list <linux-kernel@vger.kernel.org>, "open list:BLOCK LAYER" <linux-block@vger.kernel.org>, "open list:NETWORKING DRIVERS" <netdev@vger.kernel.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

UGF0Y2hlcyBpbiBvcmlnaW5hbCBYZW4gU2VjdXJpdHkgQWR2aXNvcnkgMTU1IGNhcmVkIG9ubHkg
YWJvdXQgYmFja2VuZCBkcml2ZXJzCndoaWxlIGxlYXZpbmcgZnJvbnRlbmQgcGF0Y2hlcyB0byBi
ZSAiZGV2ZWxvcGVkIGFuZCByZWxlYXNlZCAocHVibGljbHkpIGFmdGVyCnRoZSBlbWJhcmdvIGRh
dGUiLiBUaGlzIGlzIHNhaWQgc2VyaWVzLgoKTWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tpICg2
KToKICB4ZW46IEFkZCBSSU5HX0NPUFlfUkVTUE9OU0UoKQogIHhlbi1uZXRmcm9udDogY29weSBy
ZXNwb25zZSBvdXQgb2Ygc2hhcmVkIGJ1ZmZlciBiZWZvcmUgYWNjZXNzaW5nIGl0CiAgeGVuLW5l
dGZyb250OiBkbyBub3QgdXNlIGRhdGEgYWxyZWFkeSBleHBvc2VkIHRvIGJhY2tlbmQKICB4ZW4t
bmV0ZnJvbnQ6IGFkZCByYW5nZSBjaGVjayBmb3IgVHggcmVzcG9uc2UgaWQKICB4ZW4tYmxrZnJv
bnQ6IG1ha2UgbG9jYWwgY29weSBvZiByZXNwb25zZSBiZWZvcmUgdXNpbmcgaXQKICB4ZW4tYmxr
ZnJvbnQ6IHByZXBhcmUgcmVxdWVzdCBsb2NhbGx5LCBvbmx5IHRoZW4gcHV0IGl0IG9uIHRoZSBz
aGFyZWQgcmluZwoKIGRyaXZlcnMvYmxvY2sveGVuLWJsa2Zyb250LmMgICAgfCAxMTAgKysrKysr
KysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tCiBkcml2ZXJzL25ldC94ZW4tbmV0ZnJvbnQuYyAg
ICAgIHwgIDYxICsrKysrKysrKy0tLS0tLS0tLQogaW5jbHVkZS94ZW4vaW50ZXJmYWNlL2lvL3Jp
bmcuaCB8ICAxNCArKysrLQogMyBmaWxlcyBjaGFuZ2VkLCAxMDYgaW5zZXJ0aW9ucygrKSwgNzkg
ZGVsZXRpb25zKC0pCgpiYXNlLWNvbW1pdDogNmQwOGIwNmU2N2NkMTE3ZjY5OTJjNDY2MTFkZmI0
Y2UyNjdjZDcxZQotLSAKZ2l0LXNlcmllcyAwLjkuMQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
