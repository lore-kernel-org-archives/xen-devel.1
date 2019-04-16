Return-Path: <SRS0=kbZc=SS=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 597D8C10F13
	for <xen-devel@archiver.kernel.org>; Tue, 16 Apr 2019 14:50:32 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2FCC120821
	for <xen-devel@archiver.kernel.org>; Tue, 16 Apr 2019 14:50:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2FCC120821
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hGPPX-0006eU-Ke; Tue, 16 Apr 2019 14:50:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=5Jry=SS=huawei.com=yuehaibing@srs-us1.protection.inumbo.net>)
 id 1hGPPW-0006eP-9q
 for xen-devel@lists.xenproject.org; Tue, 16 Apr 2019 14:50:10 +0000
X-Inumbo-ID: eb31f9c4-6056-11e9-b06f-87afc11ac9b1
Received: from huawei.com (unknown [45.249.212.190])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id eb31f9c4-6056-11e9-b06f-87afc11ac9b1;
 Tue, 16 Apr 2019 14:50:07 +0000 (UTC)
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id C5372D550CFA91E781BA;
 Tue, 16 Apr 2019 22:50:02 +0800 (CST)
Received: from localhost (10.177.31.96) by DGGEMS412-HUB.china.huawei.com
 (10.3.19.212) with Microsoft SMTP Server id 14.3.408.0; Tue, 16 Apr 2019
 22:49:55 +0800
From: Yue Haibing <yuehaibing@huawei.com>
To: <konrad.wilk@oracle.com>, <boris.ostrovsky@oracle.com>, <jgross@suse.com>, 
 <sstabellini@kernel.org>
Date: Tue, 16 Apr 2019 22:49:50 +0800
Message-ID: <20190416144950.37952-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
X-Originating-IP: [10.177.31.96]
X-CFilter-Loop: Reflected
Subject: [Xen-devel] [PATCH -next] xen-swiotlb: Make two functions static
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
 YueHaibing <yuehaibing@huawei.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogWXVlSGFpYmluZyA8eXVlaGFpYmluZ0BodWF3ZWkuY29tPgoKRml4IHNwYXJzZSB3YXJu
aW5nczoKCmRyaXZlcnMveGVuL3N3aW90bGIteGVuLmM6NDg5OjE6IHdhcm5pbmc6CiBzeW1ib2wg
J3hlbl9zd2lvdGxiX3N5bmNfc2luZ2xlX2Zvcl9jcHUnIHdhcyBub3QgZGVjbGFyZWQuIFNob3Vs
ZCBpdCBiZSBzdGF0aWM/CmRyaXZlcnMveGVuL3N3aW90bGIteGVuLmM6NDk2OjE6IHdhcm5pbmc6
CiBzeW1ib2wgJ3hlbl9zd2lvdGxiX3N5bmNfc2luZ2xlX2Zvcl9kZXZpY2UnIHdhcyBub3QgZGVj
bGFyZWQuIFNob3VsZCBpdCBiZSBzdGF0aWM/CgpSZXBvcnRlZC1ieTogSHVsayBSb2JvdCA8aHVs
a2NpQGh1YXdlaS5jb20+ClNpZ25lZC1vZmYtYnk6IFl1ZUhhaWJpbmcgPHl1ZWhhaWJpbmdAaHVh
d2VpLmNvbT4KLS0tCiBkcml2ZXJzL3hlbi9zd2lvdGxiLXhlbi5jIHwgNCArKy0tCiAxIGZpbGUg
Y2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMveGVuL3N3aW90bGIteGVuLmMgYi9kcml2ZXJzL3hlbi9zd2lvdGxiLXhlbi5jCmluZGV4
IDg3N2JhZjIuLmU3NDFkZjQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMveGVuL3N3aW90bGIteGVuLmMK
KysrIGIvZHJpdmVycy94ZW4vc3dpb3RsYi14ZW4uYwpAQCAtNDg1LDE0ICs0ODUsMTQgQEAgeGVu
X3N3aW90bGJfc3luY19zaW5nbGUoc3RydWN0IGRldmljZSAqaHdkZXYsIGRtYV9hZGRyX3QgZGV2
X2FkZHIsCiAJCXhlbl9kbWFfc3luY19zaW5nbGVfZm9yX2RldmljZShod2RldiwgZGV2X2FkZHIs
IHNpemUsIGRpcik7CiB9CiAKLXZvaWQKK3N0YXRpYyB2b2lkCiB4ZW5fc3dpb3RsYl9zeW5jX3Np
bmdsZV9mb3JfY3B1KHN0cnVjdCBkZXZpY2UgKmh3ZGV2LCBkbWFfYWRkcl90IGRldl9hZGRyLAog
CQkJCXNpemVfdCBzaXplLCBlbnVtIGRtYV9kYXRhX2RpcmVjdGlvbiBkaXIpCiB7CiAJeGVuX3N3
aW90bGJfc3luY19zaW5nbGUoaHdkZXYsIGRldl9hZGRyLCBzaXplLCBkaXIsIFNZTkNfRk9SX0NQ
VSk7CiB9CiAKLXZvaWQKK3N0YXRpYyB2b2lkCiB4ZW5fc3dpb3RsYl9zeW5jX3NpbmdsZV9mb3Jf
ZGV2aWNlKHN0cnVjdCBkZXZpY2UgKmh3ZGV2LCBkbWFfYWRkcl90IGRldl9hZGRyLAogCQkJCSAg
IHNpemVfdCBzaXplLCBlbnVtIGRtYV9kYXRhX2RpcmVjdGlvbiBkaXIpCiB7Ci0tIAoyLjcuNAoK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
