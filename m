Return-Path: <SRS0=w8Ow=ZH=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C11BC43141
	for <xen-devel@archiver.kernel.org>; Fri, 15 Nov 2019 20:14:32 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DE5C3206D9
	for <xen-devel@archiver.kernel.org>; Fri, 15 Nov 2019 20:14:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DE5C3206D9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dornerworks.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iVhz3-0007TC-K8; Fri, 15 Nov 2019 20:14:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=NJS8=ZH=dornerworks.com=stewart.hildebrand@srs-us1.protection.inumbo.net>)
 id 1iVhz2-0007T3-ES
 for xen-devel@lists.xenproject.org; Fri, 15 Nov 2019 20:14:20 +0000
X-Inumbo-ID: 7eff7278-07e4-11ea-adbe-bc764e2007e4
Received: from webmail.dornerworks.com (unknown [12.207.209.150])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 7eff7278-07e4-11ea-adbe-bc764e2007e4;
 Fri, 15 Nov 2019 20:14:16 +0000 (UTC)
From: Stewart Hildebrand <stewart.hildebrand@dornerworks.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 15 Nov 2019 15:14:07 -0500
Message-ID: <20191115201407.45042-2-stewart.hildebrand@dornerworks.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191115200115.44890-1-stewart.hildebrand@dornerworks.com>
References: <20191115200115.44890-1-stewart.hildebrand@dornerworks.com>
MIME-Version: 1.0
X-Originating-IP: [172.27.14.58]
X-ClientProxiedBy: Mcbain.dw.local (172.27.1.45) To Mcbain.dw.local
 (172.27.1.45)
Subject: [Xen-devel] [HACK XEN PATCH v3 11/11] HACK: Force virt timer to
 PPI0 (IRQ16)
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
Cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Ian Campbell <ian.campbell@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogSWFuIENhbXBiZWxsIDxpYW4uY2FtcGJlbGxAY2l0cml4LmNvbT4KCkp1c3QgZm9yIHRl
c3Rpbmcgc28gdGhlIGd1ZXN0IHZ0aW1lciBwcGkgaXQgaXNuJ3QgdGhlIHNhbWUgYXMgdGhlCnBo
eXNpY2FsIHZpcnQgdGltZXIgUFBJIG9uIG15IHBsYXRmb3JtLCBhbmQgdGhlcmVmb3JlIGFsbG93
cyB0bwpleGVyY2lzZSB0aGUgbm9uLTE6MSBiaXRzIG9mIHRoZSBjb2RlLgotLS0KIHhlbi9pbmNs
dWRlL3B1YmxpYy9hcmNoLWFybS5oIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9u
KCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUvcHVibGljL2FyY2gt
YXJtLmggYi94ZW4vaW5jbHVkZS9wdWJsaWMvYXJjaC1hcm0uaAppbmRleCBjMzY1YjFiMzllLi5l
N2FiOTg0YTNiIDEwMDY0NAotLS0gYS94ZW4vaW5jbHVkZS9wdWJsaWMvYXJjaC1hcm0uaAorKysg
Yi94ZW4vaW5jbHVkZS9wdWJsaWMvYXJjaC1hcm0uaApAQCAtNDUxLDcgKzQ1MSw3IEBAIHR5cGVk
ZWYgdWludDY0X3QgeGVuX2NhbGxiYWNrX3Q7CiAjZGVmaW5lIEdVRVNUX01BWF9WQ1BVUyAxMjgK
IAogLyogSW50ZXJydXB0cyAqLwotI2RlZmluZSBHVUVTVF9USU1FUl9WSVJUX1BQSSAgICAyNwor
I2RlZmluZSBHVUVTVF9USU1FUl9WSVJUX1BQSSAgICAxNgogI2RlZmluZSBHVUVTVF9USU1FUl9Q
SFlTX1NfUFBJICAyOQogI2RlZmluZSBHVUVTVF9USU1FUl9QSFlTX05TX1BQSSAzMAogI2RlZmlu
ZSBHVUVTVF9FVlRDSE5fUFBJICAgICAgICAzMQotLSAKMi4yNC4wCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
