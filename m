Return-Path: <SRS0=7ods=SL=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D168C10F0E
	for <xen-devel@archiver.kernel.org>; Tue,  9 Apr 2019 16:46:04 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 363802084C
	for <xen-devel@archiver.kernel.org>; Tue,  9 Apr 2019 16:46:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 363802084C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hDtsb-00088I-Hn; Tue, 09 Apr 2019 16:45:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=+Yc4=SL=citrix.com=prvs=99536ed25=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1hDtsZ-000888-QN
 for xen-devel@lists.xenproject.org; Tue, 09 Apr 2019 16:45:47 +0000
X-Inumbo-ID: ebbb6544-5ae6-11e9-80c6-23aff8652bf9
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ebbb6544-5ae6-11e9-80c6-23aff8652bf9;
 Tue, 09 Apr 2019 16:45:46 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,330,1549929600"; d="scan'208";a="83137607"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Tue, 9 Apr 2019 17:45:33 +0100
Message-ID: <20190409164542.30274-1-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 0/9] libxl: New slow lock + fix
 libxl_cdrom_insert with QEMU depriv
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
Cc: Anthony PERARD <anthony.perard@citrix.com>, Wei Liu <wei.liu2@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190409164533.3MHWoNaGSVDub9lU9BPbABW1Bddz_pC_YKFTGrZ4Jkw@z>

SGksCgpUaGlzIHBhdGNoIHNlcmllcyBmaXggbGlieGxfY2Ryb21faW5zZXJ0IHRvIHdvcmsgd2l0
aCBhIGRlcHJpdmlsZWRnZSBRRU1VLiBGb3IKdGhhdCwgd2UgbmVlZCB0byB1c2UgbGlieGxfX2V2
X3FtcC4gIEZvciB0aGF0LCB3ZSBuZWVkIGEgbmV3IGxvY2sgYmVjYXVzZQp1c2VyZGF0YV9sb2Nr
IGNhbid0IGJlIHVzZWQgYW55bW9yZS4KClBhdGNoIHNlcmllcyBhdmFpbGFibGUgaW4gdGhpcyBn
aXQgYnJhbmNoOgpodHRwczovL3hlbmJpdHMueGVuLm9yZy9naXQtaHR0cC9wZW9wbGUvYXBlcmFy
ZC94ZW4tdW5zdGFibGUuZ2l0IGJyLmxpYnhsLXNsb3ctbG9jay12MQoKQW50aG9ueSBQRVJBUkQg
KDkpOgogIGxpYnhsX2ludGVybmFsOiBSZW1vdmUgbG9zdCBjb21tZW50CiAgbGlieGw6IFBvaW50
ZXIgb24gdXNhZ2Ugb2YgbGlieGxfX2RvbWFpbl91c2VyZGF0YV9sb2NrCiAgbGlieGxfaW50ZXJu
YWw6IFNwbGl0IG91dCB1c2VyZGF0YSBsb2NrIGZ1bmN0aW9uCiAgbGlieGxfaW50ZXJuYWw6IENy
ZWF0ZSBuZXcgbG9jayBmb3IgZGV2aWNlcyBob3RwbHVnIHZpYSBRTVAKICBsaWJ4bF9kaXNrOiBS
ZW9yZ2FuaXNlIGxpYnhsX2Nkcm9tX2luc2VydAogIGxpYnhsX2Rpc2s6IEN1dCBsaWJ4bF9jZHJv
bV9pbnNlcnQgaW50byBzdGVwcyAuLgogIGxpYnhsOiBNb3ZlIHFtcF9wYXJhbWV0ZXJzXyogcHJv
dG90eXBlcyB0byBsaWJ4bF9pbnRlcm5hbC5oCiAgbGlieGxfZGlzazogVXNlIGV2X3FtcCBpbiBs
aWJ4bF9jZHJvbV9pbnNlcnQKICBsaWJ4bF9kaXNrOiBJbXBsZW1lbnQgbWlzc2luZyB0aW1lb3V0
IGZvciBsaWJ4bF9jZHJvbV9pbnNlcnQKCiB0b29scy9saWJ4bC9saWJ4bF9kaXNrLmMgICAgIHwg
MzMwICsrKysrKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0tCiB0b29scy9saWJ4bC9saWJ4
bF9pbnRlcm5hbC5jIHwgIDc3ICsrKysrKystCiB0b29scy9saWJ4bC9saWJ4bF9pbnRlcm5hbC5o
IHwgIDczICsrKysrKy0tCiB0b29scy9saWJ4bC9saWJ4bF9xbXAuYyAgICAgIHwgIDg5ICsrKyst
LS0tLS0KIDQgZmlsZXMgY2hhbmdlZCwgNDI2IGluc2VydGlvbnMoKyksIDE0MyBkZWxldGlvbnMo
LSkKCi0tIApBbnRob255IFBFUkFSRAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
