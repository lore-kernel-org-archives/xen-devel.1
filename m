Return-Path: <SRS0=ih+i=SM=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB6C8C10F11
	for <xen-devel@archiver.kernel.org>; Wed, 10 Apr 2019 14:25:45 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 94CB620850
	for <xen-devel@archiver.kernel.org>; Wed, 10 Apr 2019 14:25:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 94CB620850
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=eu.citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hEEAQ-0006eQ-Gy; Wed, 10 Apr 2019 14:25:34 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xn7x=SM=citrix.com=prvs=996f5bc6d=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hEEAN-0006X3-AT
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2019 14:25:31 +0000
X-Inumbo-ID: 7dc99734-5b9c-11e9-92d7-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 7dc99734-5b9c-11e9-92d7-bc764e045a96;
 Wed, 10 Apr 2019 14:25:30 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,332,1549929600"; d="scan'208";a="83227706"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 10 Apr 2019 15:23:39 +0100
Message-ID: <20190410142408.22848-34-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190410142408.22848-1-ian.jackson@eu.citrix.com>
References: <20190410142408.22848-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [OSSTEST PATCH 33/62] ts-xen-build: Enable ITS driver
 in Xen
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
Cc: Julien Grall <julien.grall@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190410142339.x6pkA8Al0jhB5Lsr_w0T4dn-GZbelHm3LqfV-QKxNYw@z>

RnJvbTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KClRoZSBJVFMgZHJpdmVy
IHdhcyBhZGRlZCBpbiBYZW4gNC4xMCBhcyBhIHRlY2huaWNhbCBwcmV2aWV3IGZlYXR1cmUuCkhv
d2V2ZXIsIGl0IGlzIHJlcXVpcmVkIGluIG9yZGVyIHRvIGJvb3QgWGVuIGFzIFRodW5kZXItWCBi
ZWNhdXNlClBDSSBkZXZpY2VzIGRvbid0IHN1cHBvcnQgbGVnYWN5IGludGVycnVwdC4KClNvIGVu
YWJsZSBDT05GSUdfSVRTIGluIG91ciBYZW4gYnVpbGQuCgpTaWduZWQtb2ZmLWJ5OiBKdWxpZW4g
R3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgotLS0KIHRzLXhlbi1idWlsZCB8IDQgKysrKwog
MSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL3RzLXhlbi1idWls
ZCBiL3RzLXhlbi1idWlsZAppbmRleCA2ZGRmYzUzMy4uMTc2MmNkNjEgMTAwNzU1Ci0tLSBhL3Rz
LXhlbi1idWlsZAorKysgYi90cy14ZW4tYnVpbGQKQEAgLTEyOCw2ICsxMjgsMTAgQEAgRU5ECiAJ
CWVjaG8gPj54ZW4vLmNvbmZpZyBDT05GSUdfRVhQRVJUPXkKIAkJZWNobyA+Pnhlbi8uY29uZmln
IENPTkZJR19IVk1fRkVQPXkKIAkJZWNobyA+Pnhlbi8uY29uZmlnIENPTkZJR19WRVJCT1NFX0RF
QlVHPXkKKwkJIyBJVFMgZHJpdmVyIGlzIHJlcXVpcmVkIHRvIGJvb3QgdGhlIEhhcmR3YXJlIERv
bWFpbgorCQkjIG9uIFhlbi4gRm9yIG5vdyAoWGVuIDQuMTAvNC4xMSBhdCBhdCBsZWFzdCksCisJ
CSMgd2lsbCBiZSBub3QgYnVpbHQgYnkgZGVmYXVsdCBhbmQgZ2F0ZWQgYnkgZXhwZXJ0IG1vZGUK
KwkJZWNobyA+Pnhlbi8uY29uZmlnIENPTkZJR19IQVNfSVRTPXkKIAlmaQogRU5ECiAgICAgICAg
ICAgICAgICApOwotLSAKMi4xMS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
