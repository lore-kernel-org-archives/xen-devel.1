Return-Path: <SRS0=7Zzv=TJ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 251EDC04AB1
	for <xen-devel@archiver.kernel.org>; Thu,  9 May 2019 19:49:37 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EA96421744
	for <xen-devel@archiver.kernel.org>; Thu,  9 May 2019 19:49:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="KtfgrCT+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EA96421744
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=invisiblethingslab.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hOp2T-00066e-EO; Thu, 09 May 2019 19:49:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=q/9x=TJ=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1hOp2R-00066U-Ua
 for xen-devel@lists.xenproject.org; Thu, 09 May 2019 19:49:07 +0000
X-Inumbo-ID: 809f12fa-7293-11e9-9fec-e32a96ebe78d
Received: from new1-smtp.messagingengine.com (unknown [66.111.4.221])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 809f12fa-7293-11e9-9fec-e32a96ebe78d;
 Thu, 09 May 2019 19:49:05 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailnew.nyi.internal (Postfix) with ESMTP id 682FB261D8;
 Thu,  9 May 2019 15:49:05 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Thu, 09 May 2019 15:49:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:references:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=m2eWrMn6gXEqmOHFz
 menZ6yBsyBsSQRlVvuad9ZOxwc=; b=KtfgrCT+U5fMLqcqnM8OI9AJb41q+J/k+
 lux1YsAB8zjYuzzVTgZPIy4BSg4L4ReukDjX2P/RYRvkpL0xJAIBeI+A9Uz0+vsZ
 maamX4aTRRCxWp8m9IppZGUdcTFZJZVbHQ9YcQPBSrP9ZLw0VB0Lfn69VougWrc8
 rZP85wYg+vY6Jtpl9ZLNEGYWUHVCjbafAdTMoTOt1SKKCQm9MSbF8Lkusq4Nk6fR
 lx8vzSj8muCDL5h78H5vUOCeCdY6nXyhyqyj+Ashlhosy4jijB4pLtFO7rzk8F9K
 2hiL2v68Hq+kSxkMEBmKsXaFwz60YdEbUaroWud8Nu/YjJE/7YHBQ==
X-ME-Sender: <xms:MYTUXBcPW8OEqIftQqBl8hXCjMy1AbMG2mnh3P9mtjh05LD6f-Hkow>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrkeeigdekudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenog
 fthfevqddqjfgurhdqufhushhpvggtthdqlhhoficuldehmdenucfjughrpefhvffufffk
 ofgjfhggjghftgfgsehtkeertdertdejnecuhfhrohhmpeforghrvghkucforghrtgiihi
 hkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvhhishhisghlvght
 hhhinhhgshhlrggsrdgtohhmqeenucfkphepledurdeihedrfeegrdeffeenucfrrghrrg
 hmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhs
 lhgrsgdrtghomhenucevlhhushhtvghrufhiiigvpedu
X-ME-Proxy: <xmx:MYTUXMXTnQ0v_E7yISAqeEfOqL1gSPlSBIZWkYIAt8Ui1nG1aDu3LQ>
 <xmx:MYTUXJiCDqxxSlYECCiF8P3ND1qIPDI-iklcLsg4IsKE65SeVUfPVA>
 <xmx:MYTUXL9y29Vkp9J-6N9MrUh6o7rW2nUnz0FgiADAHMXeqcCiCmPiIQ>
 <xmx:MYTUXAD73ebOig8EcjlNy0yS4GTPxHuY4EEDCfV63uLu8KXKzTcf7g>
Received: from localhost.localdomain (ip5b412221.dynamic.kabel-deutschland.de
 [91.65.34.33])
 by mail.messagingengine.com (Postfix) with ESMTPA id A2CFE103D8;
 Thu,  9 May 2019 15:49:03 -0400 (EDT)
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Date: Thu,  9 May 2019 21:48:53 +0200
Message-Id:
 <16cf5823fc9fa65e9161dd1c7a25455cdb60f139.1557431250.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <cover.1ff4fbcf3cedbe34db420b46be69328b299f325e.1557431250.git-series.marmarek@invisiblethingslab.com>
References: <cover.1ff4fbcf3cedbe34db420b46be69328b299f325e.1557431250.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
In-Reply-To: <cover.1ff4fbcf3cedbe34db420b46be69328b299f325e.1557431250.git-series.marmarek@invisiblethingslab.com>
References: <cover.1ff4fbcf3cedbe34db420b46be69328b299f325e.1557431250.git-series.marmarek@invisiblethingslab.com>
Subject: [Xen-devel] [PATCH v2 2/5] drivers/video: drop unused limits
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
 Ian Jackson <ian.jackson@eu.citrix.com>,
 =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190509194853.etVFYQi6qIszxCH6069aq_c5lmhqTTNgYXxvm8UGHPE@z>

TUFYX0JQUCwgTUFYX0ZPTlRfVywgTUFYX0ZPTlRfSCBhcmUgbm90IHVzZWQgaW4gdGhlIGNvZGUg
YXQgYWxsLgoKU2lnbmVkLW9mZi1ieTogTWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tpIDxtYXJt
YXJla0BpbnZpc2libGV0aGluZ3NsYWIuY29tPgpTdWdnZXN0ZWQtYnk6IEphbiBCZXVsaWNoIDxq
YmV1bGljaEBzdXNlLmNvbT4KQWNrZWQtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIz
QGNpdHJpeC5jb20+Ci0tLQogeGVuL2RyaXZlcnMvdmlkZW8vbGZiLmMgfCAzIC0tLQogMSBmaWxl
IGNoYW5nZWQsIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2RyaXZlcnMvdmlkZW8v
bGZiLmMgYi94ZW4vZHJpdmVycy92aWRlby9sZmIuYwppbmRleCBkMGM4YzQ5Li4wNDc1YTY4IDEw
MDY0NAotLS0gYS94ZW4vZHJpdmVycy92aWRlby9sZmIuYworKysgYi94ZW4vZHJpdmVycy92aWRl
by9sZmIuYwpAQCAtMTIsOSArMTIsNiBAQAogCiAjZGVmaW5lIE1BWF9YUkVTIDE5MDAKICNkZWZp
bmUgTUFYX1lSRVMgMTIwMAotI2RlZmluZSBNQVhfQlBQIDQKLSNkZWZpbmUgTUFYX0ZPTlRfVyA4
Ci0jZGVmaW5lIE1BWF9GT05UX0ggMTYKIAogc3RydWN0IGxmYl9zdGF0dXMgewogICAgIHN0cnVj
dCBsZmJfcHJvcCBsZmJwOwotLSAKZ2l0LXNlcmllcyAwLjkuMQoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
