From: Stefan Weil <sw@weilnetz.de>
Subject: Re: [Qemu-ppc] [PATCH] qemu: include generated files
 with <> and not ""
Date: Wed, 21 Mar 2018 14:15:20 +0100
Message-ID: <7890493f-cbda-f56a-54a1-448cde871a14__13700.9001723074$1521638071$gmane$org@weilnetz.de>
References: <1521510562-529051-1-git-send-email-mst@redhat.com>
 <8f06e1e3-4823-d8e8-43bd-c092c523849e@vivier.eu>
 <20180320135548-mutt-send-email-mst@kernel.org>
 <459fa95d-8f0a-22fa-80fb-4af22ccf49b3@redhat.com>
 <20180321150543-mutt-send-email-mst@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=8syp=gl=weilnetz.de=sw@srs-us1.protection.inumbo.net>)
 id 1eydaR-0007pl-T0
 for xen-devel@lists.xenproject.org; Wed, 21 Mar 2018 13:15:27 +0000
In-Reply-To: <20180321150543-mutt-send-email-mst@kernel.org>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: "Michael S. Tsirkin" <mst@redhat.com>, Thomas Huth <thuth@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, Dmitry Fleytman <dmitry.fleytman@gmail.com>, sheepdog@lists.wpkg.org, Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, Li Zhijian <lizhijian@cn.fujitsu.com>, David Hildenbrand <david@redhat.com>, Jeff Cody <jcody@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org, BALATON Zoltan <balaton@eik.bme.hu>, Keith Busch <keith.busch@intel.com>, Max Filippov <jcmvbkbc@gmail.com>, Hannes Reinecke <hare@suse.com>, Gerd Hoffmann <kraxel@redhat.com>, Fam Zheng <famz@redhat.com>, Max Reitz <mreitz@redhat.com>, Eric Blake <eblake@redhat.com>, Josh Durgin <jdurgin@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>, Alberto Garcia <berto@igalia.com>, zhanghailiang <zhang.zhanghailiang@huawei.com>, Ben Warren <ben@skyportsystems.com>, Stefan Berger <stefanb@linux.vnet.ibm.com>, Yongbok Kim <yongbok.kim@mips.com>, Michael
List-Id: xen-devel@lists.xenproject.org

QW0gMjEuMDMuMjAxOCB1bSAxNDowOCBzY2hyaWViIE1pY2hhZWwgUy4gVHNpcmtpbjoKPiBJdCBz
dGlsbCBsZWF2ZXMgdXMgd2l0aCBhIGhvc3Qgb2YgcHJvYmxlbXMgZS5nLiB0aGUgcHJvYmxlbSBv
ZiBzdGFsZQo+IGhlYWRlcnMgaW4gdGhlIHNvdXJjZSBkaXJlY3RvcnkuCgpUaGVyZSBoYXZlIGFs
cmVhZHkgYmVlbiBzdWdnZXN0aW9ucyBpbiB0aGUgcGFzdCB0byBmb3JiaWQgaW4tdHJlZQpidWls
ZHMuIFdvdWxkIGl0IGhlbHAgaWYgY29uZmlndXJlIHdvdWxkIHJlZnVzZSB0byBydW4gZnJvbSB0
aGUgcm9vdApzb3VyY2UgZGlyZWN0b3J5PyBBdCBsZWFzdCAuZ2l0aWdub3JlIGNvdWxkIGJlIG11
Y2ggc21hbGxlciB0aGVuLgoKU3RlZmFuCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
