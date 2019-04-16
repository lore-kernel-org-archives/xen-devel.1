From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH -next] xen-swiotlb: Make two functions static
Date: Tue, 16 Apr 2019 11:44:22 -0400
Message-ID: <2ea8f27b-3c1b-7491-f02a-1473476fdcdd__9521.36781286157$1555429547$gmane$org@oracle.com>
References: <20190416144950.37952-1-yuehaibing@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=JLuC=SS=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1hGQGG-0002HP-NQ
 for xen-devel@lists.xenproject.org; Tue, 16 Apr 2019 15:44:40 +0000
In-Reply-To: <20190416144950.37952-1-yuehaibing@huawei.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Yue Haibing <yuehaibing@huawei.com>, konrad.wilk@oracle.com, jgross@suse.com, sstabellini@kernel.org
Cc: xen-devel@lists.xenproject.org, iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org, Christoph Hellwig <hch@lst.de>
List-Id: xen-devel@lists.xenproject.org

T24gNC8xNi8xOSAxMDo0OSBBTSwgWXVlIEhhaWJpbmcgd3JvdGU6Cj4gRnJvbTogWXVlSGFpYmlu
ZyA8eXVlaGFpYmluZ0BodWF3ZWkuY29tPgo+Cj4gRml4IHNwYXJzZSB3YXJuaW5nczoKPgo+IGRy
aXZlcnMveGVuL3N3aW90bGIteGVuLmM6NDg5OjE6IHdhcm5pbmc6Cj4gIHN5bWJvbCAneGVuX3N3
aW90bGJfc3luY19zaW5nbGVfZm9yX2NwdScgd2FzIG5vdCBkZWNsYXJlZC4gU2hvdWxkIGl0IGJl
IHN0YXRpYz8KPiBkcml2ZXJzL3hlbi9zd2lvdGxiLXhlbi5jOjQ5NjoxOiB3YXJuaW5nOgo+ICBz
eW1ib2wgJ3hlbl9zd2lvdGxiX3N5bmNfc2luZ2xlX2Zvcl9kZXZpY2UnIHdhcyBub3QgZGVjbGFy
ZWQuIFNob3VsZCBpdCBiZSBzdGF0aWM/Cj4KPiBSZXBvcnRlZC1ieTogSHVsayBSb2JvdCA8aHVs
a2NpQGh1YXdlaS5jb20+Cj4gU2lnbmVkLW9mZi1ieTogWXVlSGFpYmluZyA8eXVlaGFpYmluZ0Bo
dWF3ZWkuY29tPgoKCkkgdGhpbmsgbGF0ZXN0IHBhdGNoZXMgZnJvbSBDaHJpc3RvcGggdGFrZSBj
YXJlIG9mIHRoaXMuCgotYm9yaXMKCgo+IC0tLQo+ICBkcml2ZXJzL3hlbi9zd2lvdGxiLXhlbi5j
IHwgNCArKy0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25z
KC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy94ZW4vc3dpb3RsYi14ZW4uYyBiL2RyaXZlcnMv
eGVuL3N3aW90bGIteGVuLmMKPiBpbmRleCA4NzdiYWYyLi5lNzQxZGY0IDEwMDY0NAo+IC0tLSBh
L2RyaXZlcnMveGVuL3N3aW90bGIteGVuLmMKPiArKysgYi9kcml2ZXJzL3hlbi9zd2lvdGxiLXhl
bi5jCj4gQEAgLTQ4NSwxNCArNDg1LDE0IEBAIHhlbl9zd2lvdGxiX3N5bmNfc2luZ2xlKHN0cnVj
dCBkZXZpY2UgKmh3ZGV2LCBkbWFfYWRkcl90IGRldl9hZGRyLAo+ICAJCXhlbl9kbWFfc3luY19z
aW5nbGVfZm9yX2RldmljZShod2RldiwgZGV2X2FkZHIsIHNpemUsIGRpcik7Cj4gIH0KPiAgCj4g
LXZvaWQKPiArc3RhdGljIHZvaWQKPiAgeGVuX3N3aW90bGJfc3luY19zaW5nbGVfZm9yX2NwdShz
dHJ1Y3QgZGV2aWNlICpod2RldiwgZG1hX2FkZHJfdCBkZXZfYWRkciwKPiAgCQkJCXNpemVfdCBz
aXplLCBlbnVtIGRtYV9kYXRhX2RpcmVjdGlvbiBkaXIpCj4gIHsKPiAgCXhlbl9zd2lvdGxiX3N5
bmNfc2luZ2xlKGh3ZGV2LCBkZXZfYWRkciwgc2l6ZSwgZGlyLCBTWU5DX0ZPUl9DUFUpOwo+ICB9
Cj4gIAo+IC12b2lkCj4gK3N0YXRpYyB2b2lkCj4gIHhlbl9zd2lvdGxiX3N5bmNfc2luZ2xlX2Zv
cl9kZXZpY2Uoc3RydWN0IGRldmljZSAqaHdkZXYsIGRtYV9hZGRyX3QgZGV2X2FkZHIsCj4gIAkJ
CQkgICBzaXplX3Qgc2l6ZSwgZW51bSBkbWFfZGF0YV9kaXJlY3Rpb24gZGlyKQo+ICB7CgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
