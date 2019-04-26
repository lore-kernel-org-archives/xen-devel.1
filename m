Return-Path: <SRS0=7THE=S4=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDF46C43219
	for <xen-devel@archiver.kernel.org>; Fri, 26 Apr 2019 16:42:02 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B777620693
	for <xen-devel@archiver.kernel.org>; Fri, 26 Apr 2019 16:42:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B777620693
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=eu.citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hK3v5-0008WJ-LU; Fri, 26 Apr 2019 16:41:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=6UZT=S4=citrix.com=prvs=0129f9400=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hK3v4-0008Ug-6d
 for xen-devel@lists.xenproject.org; Fri, 26 Apr 2019 16:41:50 +0000
X-Inumbo-ID: 2f03bac8-6842-11e9-9eaf-070597e24fe2
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2f03bac8-6842-11e9-9eaf-070597e24fe2;
 Fri, 26 Apr 2019 16:41:47 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,398,1549929600"; d="scan'208";a="84519767"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 26 Apr 2019 17:40:01 +0100
Message-ID: <20190426164002.22381-15-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190426164002.22381-1-ian.jackson@eu.citrix.com>
References: <20190426164002.22381-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [OSSTEST PATCH 14/15] cross builds: Build armhf kernels
 on amd64 hosts
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
Cc: Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190426164001.O2AjMBlO8AOh7Jc56EXFYuxI88O8P2wU5eZS4Vj5XCU@z>

T3VyIGFybWhmIGhvc3RzIGFyZSBkZXZib2FyZHMgYW5kIHZlcnkgc2xvdywgYXMgd2VsbCBhcyBz
Y2FyY2UuICBJdAo1dGFrZXMgMTdrcyBvciBzbyBmb3IgYSBrZXJuZWwgYnVpbGQuICBUaGlzIHdp
bGwgZ28gKm11Y2gqIGZhc3RlciBvbgphbiBhbWQ2NCBib3ggYW5kIHdlIGhhdmUgbG90cyBvZiB0
aG9zZSB0b28uCgpzdGFuZGFsb25lLWdlbmVyYXRlLWR1bXAtZmxpZ2h0LXJ1bnZhcnMgc2hvd3Mg
dGhhdCB0aGUgb25seSBjaGFuZ2UgaXMKdG8gY2hhbmdlIGhvc3RfYXJjaCBmcm9tIGFybWhmIHRv
IGFtZDY0IGluIGJ1aWxkLWFybWhmLXB2b3BzIGpvYnMuCgpTaWduZWQtb2ZmLWJ5OiBJYW4gSmFj
a3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT4KQ0M6IEp1bGllbiBHcmFsbCA8anVsaWVu
LmdyYWxsQGFybS5jb20+CkNDOiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5l
bC5vcmc+Ci0tLQogbWZpLWNvbW1vbiB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlv
bigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL21maS1jb21tb24gYi9tZmktY29tbW9u
CmluZGV4IDdiNWM4OTRmLi4zMGYyNjkyZCAxMDA2NDQKLS0tIGEvbWZpLWNvbW1vbgorKysgYi9t
ZmktY29tbW9uCkBAIC00MjQsNyArNDI0LDcgQEAgY3JlYXRlX2J1aWxkX2pvYnMgKCkgewogICAg
IGZpCiAKICAgICBqb2JfY3JlYXRlX2J1aWxkX2Nyb3NzYWJsZSBidWlsZC0kYXJjaC1wdm9wcyBi
dWlsZC1rZXJuICRhcmNoICAgICAgICAgICAgXAotICAgICAgICAgICAgICAgIC0gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCisgICAg
ICAgICAgICAgICAgYXJtaGYgYW1kNjQgLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIFwKICAgICAgICAgICAgICAgICBrY29uZmlnaG93PXhlbi1lbmFibGUt
eGVuLWNvbmZpZyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAogICAgICAgICAgICAgICAg
ICRSVU5WQVJTICRCVUlMRF9SVU5WQVJTICRCVUlMRF9MSU5VWF9SVU5WQVJTICRhcmNoX3J1bnZh
cnMgICBcCiAgICAgICAgICAgICAgICAgJGhvc3Rvc19ydW52YXJzICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
