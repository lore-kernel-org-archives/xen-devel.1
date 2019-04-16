Return-Path: <SRS0=kbZc=SS=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D454DC10F13
	for <xen-devel@archiver.kernel.org>; Tue, 16 Apr 2019 15:45:05 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9A83A20868
	for <xen-devel@archiver.kernel.org>; Tue, 16 Apr 2019 15:45:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="WC9dm58W"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9A83A20868
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=oracle.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hGQGH-0002HU-RY; Tue, 16 Apr 2019 15:44:41 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=JLuC=SS=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1hGQGG-0002HP-NQ
 for xen-devel@lists.xenproject.org; Tue, 16 Apr 2019 15:44:40 +0000
X-Inumbo-ID: 8b110baf-605e-11e9-92d7-bc764e045a96
Received: from userp2120.oracle.com (unknown [156.151.31.85])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 8b110baf-605e-11e9-92d7-bc764e045a96;
 Tue, 16 Apr 2019 15:44:39 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x3GFi0NI017535;
 Tue, 16 Apr 2019 15:44:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2018-07-02;
 bh=pmzFJQSVTt2TMA1nNYmW6amCdNAiHpeqIW9A+IwR/28=;
 b=WC9dm58WZm5YVkj7SL5T0xxTycwioRGt+n2re6mT1LL6O2wTr4I3VAHKH4l2ZT6uFO4N
 kx8j3wstmngibdK3zElQO3qXGBqnZmWPLGVsPxRuoNCjWbdFFbFvoMIF//0ShFNSVurw
 mBmBVCVpMgjaCzd4pWILcjBdCm6oZVFx+HgVg/77EYYbR05HY/GaBBE+99RyJdnkjlPC
 QBi86i39/EjvdLzaZUZ6SadTsrNAzGtCulSluEnUSqE0ruZcojrLSPNmSEDuuWrga6LK
 CIlNDsutKjYjhh9mY9RoMYcLIkhinDh5mqVt+5f8l3uT78gpN7VyyHNSGP6nMT1GULOu oA== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by userp2120.oracle.com with ESMTP id 2rusneuj2h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 16 Apr 2019 15:44:30 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x3GFi6uJ086020;
 Tue, 16 Apr 2019 15:44:29 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by aserp3030.oracle.com with ESMTP id 2rwe79vdcd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 16 Apr 2019 15:44:29 +0000
Received: from abhmp0018.oracle.com (abhmp0018.oracle.com [141.146.116.24])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x3GFiPS8004757;
 Tue, 16 Apr 2019 15:44:25 GMT
Received: from dhcp-burlington7-2nd-B-east-10-152-55-162.usdhcp.oraclecorp.com
 (/10.152.32.65) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 16 Apr 2019 08:44:25 -0700
To: Yue Haibing <yuehaibing@huawei.com>, konrad.wilk@oracle.com,
 jgross@suse.com, sstabellini@kernel.org
References: <20190416144950.37952-1-yuehaibing@huawei.com>
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Openpgp: preference=signencrypt
Autocrypt: addr=boris.ostrovsky@oracle.com; prefer-encrypt=mutual; keydata=
 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
 Jg6OxFYd01z+a+oL
Message-ID: <2ea8f27b-3c1b-7491-f02a-1473476fdcdd@oracle.com>
Date: Tue, 16 Apr 2019 11:44:22 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190416144950.37952-1-yuehaibing@huawei.com>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=9228
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1904160105
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=9228
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1904160105
Subject: Re: [Xen-devel] [PATCH -next] xen-swiotlb: Make two functions static
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: xen-devel@lists.xenproject.org, iommu@lists.linux-foundation.org,
 linux-kernel@vger.kernel.org, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

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
