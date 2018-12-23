From: Julia Lawall <Julia.Lawall@lip6.fr>
Subject: [PATCH 00/20] drop useless LIST_HEAD
Date: Sun, 23 Dec 2018 09:56:55 +0100
Message-ID: <1545555435-24576-1-git-send-email-Julia.Lawall__49723.1219582774$1545557575$gmane$org@lip6.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=HuYs=PA=lip6.fr=julia.lawall@srs-us1.protection.inumbo.net>)
 id 1gb08y-0007y7-7E
 for xen-devel@lists.xenproject.org; Sun, 23 Dec 2018 09:33:56 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-wireless@vger.kernel.org, linux-nfs@vger.kernel.org, Stefano Stabellini <sstabellini@kernel.org>, linux-scsi@vger.kernel.org, linux-rdma@vger.kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, linux-xfs@vger.kernel.org, linux-btrfs@vger.kernel.org, dmaengine@vger.kernel.org, xen-devel@lists.xenproject.org, Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org
List-Id: xen-devel@lists.xenproject.org

RHJvcCBMSVNUX0hFQUQgd2hlcmUgdGhlIHZhcmlhYmxlIGl0IGRlY2xhcmVzIGlzIG5ldmVyIHVz
ZWQuCgotLS0KCiBkcml2ZXJzL2RtYS9hdF9oZG1hYy5jICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICB8ICAgIDUgLS0tLS0KIGRyaXZlcnMvZG1hL2R3L2NvcmUuYyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHwgICAgMSAtCiBkcml2ZXJzL2RtYS9wbDMzMC5jICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgIDEgLQogZHJpdmVycy9kbWEvc2ExMXgwLWRt
YS5jICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgICAyIC0tCiBkcml2ZXJzL2RtYS9z
dF9mZG1hLmMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgIDMgLS0tCiBkcml2
ZXJzL2luZmluaWJhbmQvdWxwL2lwb2liL2lwb2liX2liLmMgICAgICAgICAgICAgICB8ICAgIDEg
LQogZHJpdmVycy9uZXQvZXRoZXJuZXQvbWVsbGFub3gvbWx4NC9yZXNvdXJjZV90cmFja2VyLmMg
fCAgICA1IC0tLS0tCiBkcml2ZXJzL25ldC9ldGhlcm5ldC9tZWxsYW5veC9tbHg1L2NvcmUvZW5f
dGMuYyAgICAgICB8ICAgIDMgLS0tCiBkcml2ZXJzL25ldC9ldGhlcm5ldC9tZWxsYW5veC9tbHhz
dy9zcGVjdHJ1bS5jICAgICAgICB8ICAgIDEgLQogZHJpdmVycy9uZXQvd2lyZWxlc3Mvc3QvY3cx
MjAwL3F1ZXVlLmMgICAgICAgICAgICAgICAgfCAgICAxIC0KIGRyaXZlcnMvc2NzaS9scGZjL2xw
ZmNfbnZtZS5jICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAgMiAtLQogZHJpdmVycy9zY3Np
L2xwZmMvbHBmY19zY3NpLmMgICAgICAgICAgICAgICAgICAgICAgICAgfCAgICAyIC0tCiBkcml2
ZXJzL3Njc2kvbHBmYy9scGZjX3NsaS5jICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgIDEg
LQogZHJpdmVycy9zY3NpL3FsYTJ4eHgvcWxhX2luaXQuYyAgICAgICAgICAgICAgICAgICAgICAg
fCAgICAxIC0KIGRyaXZlcnMveGVuL3hlbmJ1cy94ZW5idXNfZGV2X2Zyb250ZW5kLmMgICAgICAg
ICAgICAgIHwgICAgMiAtLQogZnMvYnRyZnMvcmVsb2NhdGlvbi5jICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgfCAgICAxIC0KIGZzL25mcy9uZnM0Y2xpZW50LmMgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHwgICAgMSAtCiBmcy9uZnNkL25mczRsYXlvdXRzLmMgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgIDEgLQogZnMveGZzL3hmc19idWYuYyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgICAxIC0KIGZzL3hmcy94ZnNf
ZnNvcHMuYyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAgMSAtCiAyMCBm
aWxlcyBjaGFuZ2VkLCAzNiBkZWxldGlvbnMoLSkKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
