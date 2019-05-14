Return-Path: <SRS0=qwBA=TO=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40DF1C04AB4
	for <xen-devel@archiver.kernel.org>; Tue, 14 May 2019 14:22:54 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1C03521473
	for <xen-devel@archiver.kernel.org>; Tue, 14 May 2019 14:22:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1C03521473
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hQYKF-0008CW-QF; Tue, 14 May 2019 14:22:39 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=pH1X=TO=citrix.com=prvs=030624cdf=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1hQYKE-0008CF-Rh
 for xen-devel@lists.xenproject.org; Tue, 14 May 2019 14:22:38 +0000
X-Inumbo-ID: b8da85f2-7653-11e9-8980-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id b8da85f2-7653-11e9-8980-bc764e045a96;
 Tue, 14 May 2019 14:22:37 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,469,1549929600"; d="scan'208";a="85442566"
From: Wei Liu <wei.liu2@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Tue, 14 May 2019 15:22:31 +0100
Message-ID: <20190514142233.23165-2-wei.liu2@citrix.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190514142233.23165-1-wei.liu2@citrix.com>
References: <20190514142233.23165-1-wei.liu2@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 1/3] gitignore: ignore .vscode directory
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
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190514142231.9thzHdmOpMcgjMMkyHdNY1RZGErbOQAZKrxuB1sMKXM@z>

VGhlIGRpcmVjdG9yeSBpcyBjcmVhdGVkIGJ5IFZpc3VhbCBTdHVkaW8gQ29kZSBlZGl0b3IgdG8g
c3RvcmUgaXRzCmxvY2FsIHN0YXRlLgoKU2lnbmVkLW9mZi1ieTogV2VpIExpdSA8d2VpLmxpdTJA
Y2l0cml4LmNvbT4KLS0tCiAuZ2l0aWdub3JlIHwgMSArCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNl
cnRpb24oKykKCmRpZmYgLS1naXQgYS8uZ2l0aWdub3JlIGIvLmdpdGlnbm9yZQppbmRleCAyNmJj
NTgzZjc0Li4zODIyYmI3NWJhIDEwMDY0NAotLS0gYS8uZ2l0aWdub3JlCisrKyBiLy5naXRpZ25v
cmUKQEAgLTMwLDYgKzMwLDcgQEAgY3Njb3BlLm91dAogY3Njb3BlLnBvLm91dAogLmNvbmZpZwog
LnZpbXJjCisudnNjb2RlCiAKIGRpc3QKIHN0dWJkb20vKi50YXIuZ3oKLS0gCjIuMjAuMQoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
