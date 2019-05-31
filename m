Return-Path: <SRS0=e+jd=T7=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DD6AC28CC0
	for <xen-devel@archiver.kernel.org>; Fri, 31 May 2019 03:19:01 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 50B26262D3
	for <xen-devel@archiver.kernel.org>; Fri, 31 May 2019 03:19:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 50B26262D3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mxnavi.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hWY3t-0005aM-7r; Fri, 31 May 2019 03:18:33 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=USVC=T7=mxnavi.com=chenbaodong@srs-us1.protection.inumbo.net>)
 id 1hWY3s-0005aH-Bf
 for xen-devel@lists.xenproject.org; Fri, 31 May 2019 03:18:32 +0000
X-Inumbo-ID: c2fa98d9-8352-11e9-8980-bc764e045a96
Received: from mxnavi-mail.mxnavi.com (unknown [116.90.87.199])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id c2fa98d9-8352-11e9-8980-bc764e045a96;
 Fri, 31 May 2019 03:18:30 +0000 (UTC)
Received: from localhost.localdomain (61.161.186.150) by
 mxnavi-mail.mxnavi.com (116.90.87.199) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1591.10; Fri, 31 May 2019 11:16:17 +0800
From: Baodong Chen <chenbaodong@mxnavi.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 31 May 2019 11:18:22 +0800
Message-ID: <1559272702-13459-1-git-send-email-chenbaodong@mxnavi.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [61.161.186.150]
X-ClientProxiedBy: mxnavi-mail.mxnavi.com (116.90.87.199) To
 mxnavi-mail.mxnavi.com (116.90.87.199)
Subject: [Xen-devel] [PATCH] xen: put cpupool's member 'n_dom' after
 'cpupool_id'
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 Baodong Chen <chenbaodong@mxnavi.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190531031822.pi9YpJFx_V8fWUUJ9fBUjisvpALLTys3GRqaQ3tM-gw@z>

VGh1cywgc2l6ZW9mKHN0cnVjdCBjcHVwb29sKSB3aWxsIHNhdmUgOCBieXRlcyBmb3IgNjQtYml0
IHN5c3RlbS4KClNpZ25lZC1vZmYtYnk6IEJhb2RvbmcgQ2hlbiA8Y2hlbmJhb2RvbmdAbXhuYXZp
LmNvbT4KLS0tCiB4ZW4vaW5jbHVkZS94ZW4vc2NoZWQtaWYuaCB8IDIgKy0KIDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3hlbi9pbmNs
dWRlL3hlbi9zY2hlZC1pZi5oIGIveGVuL2luY2x1ZGUveGVuL3NjaGVkLWlmLmgKaW5kZXggOTJi
YzdhMC4uZjBjZjIxMCAxMDA2NDQKLS0tIGEveGVuL2luY2x1ZGUveGVuL3NjaGVkLWlmLmgKKysr
IGIveGVuL2luY2x1ZGUveGVuL3NjaGVkLWlmLmgKQEAgLTIxMyw5ICsyMTMsOSBAQCBzdGF0aWMg
aW5saW5lIHZvaWQgc2NoZWRfZnJlZV9kb21kYXRhKGNvbnN0IHN0cnVjdCBzY2hlZHVsZXIgKnMs
CiBzdHJ1Y3QgY3B1cG9vbAogewogICAgIGludCAgICAgICAgICAgICAgY3B1cG9vbF9pZDsKKyAg
ICB1bnNpZ25lZCBpbnQgICAgIG5fZG9tOwogICAgIGNwdW1hc2tfdmFyX3QgICAgY3B1X3ZhbGlk
OyAgICAgIC8qIGFsbCBjcHVzIGFzc2lnbmVkIHRvIHBvb2wgKi8KICAgICBzdHJ1Y3QgY3B1cG9v
bCAgICpuZXh0OwotICAgIHVuc2lnbmVkIGludCAgICAgbl9kb207CiAgICAgc3RydWN0IHNjaGVk
dWxlciAqc2NoZWQ7CiAgICAgYXRvbWljX3QgICAgICAgICByZWZjbnQ7CiB9OwotLSAKMi43LjQK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
