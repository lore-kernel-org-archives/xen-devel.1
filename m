Return-Path: <SRS0=7ods=SL=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DC73C10F13
	for <xen-devel@archiver.kernel.org>; Tue,  9 Apr 2019 03:00:22 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E8AE020883
	for <xen-devel@archiver.kernel.org>; Tue,  9 Apr 2019 03:00:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E8AE020883
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=zhaoxin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hDgzC-0004mM-RL; Tue, 09 Apr 2019 02:59:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=iHqD=SL=zhaoxin.com=fionali-oc@srs-us1.protection.inumbo.net>)
 id 1hDgzC-0004mB-5i
 for xen-devel@lists.xenproject.org; Tue, 09 Apr 2019 02:59:46 +0000
X-Inumbo-ID: 8242371e-5a73-11e9-9dc5-330ef5c92a36
Received: from ZXSHCAS1.zhaoxin.com (unknown [203.148.12.81])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8242371e-5a73-11e9-9dc5-330ef5c92a36;
 Tue, 09 Apr 2019 02:59:39 +0000 (UTC)
Received: from zxbjmbx1.zhaoxin.com (10.29.252.163) by ZXSHCAS1.zhaoxin.com
 (10.28.252.161) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1261.35; Tue, 9 Apr
 2019 10:59:29 +0800
Received: from localhost.localdomain (10.29.8.62) by zxbjmbx1.zhaoxin.com
 (10.29.252.163) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1261.35; Tue, 9 Apr
 2019 10:59:29 +0800
From: FionaLi-oc <fionali-oc@zhaoxin.com>
To: <xen-devel@lists.xenproject.org>
Date: Tue, 9 Apr 2019 10:59:27 +0800
Message-ID: <1554778767-3480-1-git-send-email-fionali-oc@zhaoxin.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.29.8.62]
X-ClientProxiedBy: zxbjmbx1.zhaoxin.com (10.29.252.163) To
 zxbjmbx1.zhaoxin.com (10.29.252.163)
Subject: [Xen-devel] [PATCH 0/2] x86/iommu: support IOMMU for Zhaoxin CPU
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
Cc: wei.liu2@citrix.com, andrew.cooper3@citrix.com, cobechen@zhaoxin.com,
 FionaLi-oc <fionali-oc@zhaoxin.com>, jbeulich@suse.com, roger.pau@citrix.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190409025927.DW8jVglS6s3_dGgE6xRf4jPIW_w4qi0t7fb5p8B8M1A@z>

VGhlIHBhdGNoc2V0IHN1cHBvcnRzIHNvbWUgZmVhdHVyZXMgZm9yIFpoYW94aW4gQ1BVIHdob3Nl
IHZlbmRvcgpJRCBpcyAnU2hhbmdoYWknLiBaaGFveGluIHg4NiBTT0Mgc3VwcG9ydHMgSS9PIHZp
cnR1YWxpemF0aW9uCndoaWNoIGlzIGNvbXBhdGlibGUgd2l0aCBJbnRlbCBJL08gdmlydHVsaXph
aXRvbi4KCkluZGVudCB3aXRoIGZvdXIgc3BhY2VzLgoKU2lnbmVkLW9mZi1ieTogRmlvbmFMaS1v
YyA8ZmlvbmFsaS1vY0B6aGFveGluLmNvbT4KLS0tCiB4ZW4vaW5jbHVkZS9hc20teDg2L2lvbW11
LmggfCA5ICsrKysrLS0tLQogMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgNCBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9hc20teDg2L2lvbW11LmggYi94ZW4v
aW5jbHVkZS9hc20teDg2L2lvbW11LmgKaW5kZXggOGRjMzkyNC4uZWM1YTAwOSAxMDA2NDQKLS0t
IGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9pb21tdS5oCisrKyBiL3hlbi9pbmNsdWRlL2FzbS14ODYv
aW9tbXUuaApAQCAtNzEsMTAgKzcxLDExIEBAIHN0YXRpYyBpbmxpbmUgaW50IGlvbW11X2hhcmR3
YXJlX3NldHVwKHZvaWQpCiB7CiAgICAgc3dpdGNoICggYm9vdF9jcHVfZGF0YS54ODZfdmVuZG9y
ICkKICAgICB7Ci0gICAgY2FzZSBYODZfVkVORE9SX0lOVEVMOgotICAgICAgICByZXR1cm4gaW50
ZWxfdnRkX3NldHVwKCk7Ci0gICAgY2FzZSBYODZfVkVORE9SX0FNRDoKLSAgICAgICAgcmV0dXJu
IGFtZF9pb3ZfZGV0ZWN0KCk7CisgICAgICAgIGNhc2UgWDg2X1ZFTkRPUl9JTlRFTDoKKyAgICAg
ICAgY2FzZSBYODZfVkVORE9SX1NIQU5HSEFJOgorICAgICAgICAgICAgcmV0dXJuIGludGVsX3Z0
ZF9zZXR1cCgpOworICAgICAgICBjYXNlIFg4Nl9WRU5ET1JfQU1EOgorICAgICAgICAgICAgcmV0
dXJuIGFtZF9pb3ZfZGV0ZWN0KCk7CiAgICAgfQogCiAgICAgcmV0dXJuIC1FTk9ERVY7Ci0tIAox
LjguMy4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
