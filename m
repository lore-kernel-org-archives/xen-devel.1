Return-Path: <SRS0=7ods=SL=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FB64C10F0E
	for <xen-devel@archiver.kernel.org>; Tue,  9 Apr 2019 16:46:04 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DBFED2084C
	for <xen-devel@archiver.kernel.org>; Tue,  9 Apr 2019 16:46:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DBFED2084C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hDtsb-00088O-Qh; Tue, 09 Apr 2019 16:45:49 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=+Yc4=SL=citrix.com=prvs=99536ed25=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1hDtsb-00088D-1I
 for xen-devel@lists.xenproject.org; Tue, 09 Apr 2019 16:45:49 +0000
X-Inumbo-ID: ec6ee936-5ae6-11e9-92d7-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id ec6ee936-5ae6-11e9-92d7-bc764e045a96;
 Tue, 09 Apr 2019 16:45:47 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,330,1549929600"; d="scan'208";a="83137609"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Tue, 9 Apr 2019 17:45:35 +0100
Message-ID: <20190409164542.30274-3-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190409164542.30274-1-anthony.perard@citrix.com>
References: <20190409164542.30274-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 2/9] libxl: Pointer on usage of
 libxl__domain_userdata_lock
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
Message-ID: <20190409164535.TVA4VxkArkLS5qdY-H0wKrr3PnD9W9rmole92TTVtu8@z>

SXQgaXMgY3VycmVudGx5IGRpZmZpY3VsdCB0byBrbm93IGhvdy93aGVuL3doeSB0aGUgdXNlcmRh
dGEgbG9jayBpcwpzdXBwb3NlZCB0byBiZSB1c2VkLiBBZGQgc29tZSBwb2ludGVycyB0byB0aGUg
aG90cGx1ZyBjb21tZW50cy4KClNpZ25lZC1vZmYtYnk6IEFudGhvbnkgUEVSQVJEIDxhbnRob255
LnBlcmFyZEBjaXRyaXguY29tPgotLS0KIHRvb2xzL2xpYnhsL2xpYnhsX2ludGVybmFsLmggfCA2
ICsrKysrKwogMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL3Rv
b2xzL2xpYnhsL2xpYnhsX2ludGVybmFsLmggYi90b29scy9saWJ4bC9saWJ4bF9pbnRlcm5hbC5o
CmluZGV4IDk4YTFlZTYxNTkuLjcwMmFjYzZkNWQgMTAwNjQ0Ci0tLSBhL3Rvb2xzL2xpYnhsL2xp
YnhsX2ludGVybmFsLmgKKysrIGIvdG9vbHMvbGlieGwvbGlieGxfaW50ZXJuYWwuaApAQCAtNDUw
MCw2ICs0NTAwLDEyIEBAIHZvaWQgbGlieGxfX3VubG9ja19kb21haW5fdXNlcmRhdGEobGlieGxf
X2RvbWFpbl91c2VyZGF0YV9sb2NrICpsb2NrKTsKICAqIGRhdGEgc3RvcmUuIFRoZSByZWdpc3Ry
eSBlbnRyeSBpbiBsaWJ4bCBwcml2YXRlIGRhdGEgc3RvcmUKICAqIGlzICJsaWJ4bC1qc29uIi4K
ICAqIENhbGxlciBtdXN0IGhvbGQgdXNlciBkYXRhIGxvY2suCisgKgorICogT3RoZXIgbmFtZXMg
dXNlZCBmb3IgdGhpcyBsb2NrIHRocm91Z2hvdXQgdGhlIGxpYnhsIGNvZGUgYXJlIGpzb25fbG9j
aywKKyAqIGxpYnhsX19kb21haW5fdXNlcmRhdGFfbG9jaywgImxpYnhsLWpzb24iLCBkYXRhIHN0
b3JlIGxvY2suCisgKgorICogU2VlIGNvbW1lbnRzIGFib3V0IGxpYnhsX19hb19kZXZpY2UgYW5k
ICJBbGdvcml0aG0gZm9yIGhhbmRsaW5nIGRldmljZQorICogcmVtb3ZhbCIgb24gaG93IHRoZSBs
aWJ4bC1qc29uIGxvY2sgLyBqc29uX2xvY2sgY2FuIGJlIHVzZWQuCiAgKi8KIGludCBsaWJ4bF9f
Z2V0X2RvbWFpbl9jb25maWd1cmF0aW9uKGxpYnhsX19nYyAqZ2MsIHVpbnQzMl90IGRvbWlkLAog
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbGlieGxfZG9tYWluX2NvbmZpZyAq
ZF9jb25maWcpOwotLSAKQW50aG9ueSBQRVJBUkQKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
