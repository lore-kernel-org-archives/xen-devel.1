Return-Path: <SRS0=pwZ6=TG=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19CFEC04A6B
	for <xen-devel@archiver.kernel.org>; Mon,  6 May 2019 15:03:53 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DED282053B
	for <xen-devel@archiver.kernel.org>; Mon,  6 May 2019 15:03:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="xvnk5erm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DED282053B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=invisiblethingslab.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hNf9W-0004LN-A6; Mon, 06 May 2019 15:03:38 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=SrHI=TG=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1hNf9U-0004LI-Cm
 for xen-devel@lists.xenproject.org; Mon, 06 May 2019 15:03:36 +0000
X-Inumbo-ID: 1f0808e2-7010-11e9-843c-bc764e045a96
Received: from new1-smtp.messagingengine.com (unknown [66.111.4.221])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 1f0808e2-7010-11e9-843c-bc764e045a96;
 Mon, 06 May 2019 15:03:35 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailnew.nyi.internal (Postfix) with ESMTP id 218B713BDD;
 Mon,  6 May 2019 11:03:35 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Mon, 06 May 2019 11:03:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:references:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=VHzPyhnUf5nGOMlnb
 HdZtF24wULqOF7nx5tDykzyxvA=; b=xvnk5ermldkWWaAOOiDWVD/ssDW6GGfSq
 A2sutjnO05WAum1LfCt2BWYPw+XgCA5IvO/adLc3q4QlOXT/3T2Oxv3FgZgfbdMc
 UfcvYLR/YDZjBs87Xz8VKqU8IS7EbkqXJwZt2R53nc9a+sJBIPznLAeu+LYgqe3z
 LiD5GiKbSExV2SS6RunFr/M0dqzGZa5Z06+QnhHUHtFhp6bt8hTH3jtT3puem6GT
 YLE3SECXKumP2b0QIDEU8KTdNn47gJ9iT6hUcqHJR5PZWvjJ6frXbvaYhIdwpfJK
 bFFfCjSquqIJ4QmwQg2SglSK1D8g02+vIXlWqyVS7uULF00rdMl1A==
X-ME-Sender: <xms:xkzQXKeaAdq96WGNgVfEaVl8FfAD3QV1d0qbABboMfqSAmmtniUVNw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrjeejgdekiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenog
 fthfevqddqjfgurhdqufhushhpvggtthdqlhhoficuldehmdenucfjughrpefhvffufffk
 ofgjfhggjghftgfgsehtkeertdertdejnecuhfhrohhmpeforghrvghkucforghrtgiihi
 hkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvhhishhisghlvght
 hhhinhhgshhlrggsrdgtohhmqeenucfkphepledurdeihedrfeegrdeffeenucfrrghrrg
 hmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhs
 lhgrsgdrtghomhenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:xkzQXKNal4BvyPtFhVcpWTDVsvJssU3Dhs0zMXyARuzlm4vF0a2Xhw>
 <xmx:xkzQXGVy5DcUzuDGHRTVCZjHRhDqDglIIKrbXCUcVpP5Va28W0woog>
 <xmx:xkzQXKyDmdh8PCBYVUX8L8tPD76JfwvE7QEP15tW_cAYef1jDMf-5g>
 <xmx:x0zQXCDP98Xw7Bzb_CIH_VkSAIKj4RkgytxTpL2D10uD3hIQoe2-oA>
Received: from localhost.localdomain (ip5b412221.dynamic.kabel-deutschland.de
 [91.65.34.33])
 by mail.messagingengine.com (Postfix) with ESMTPA id 51EFD103CB;
 Mon,  6 May 2019 11:03:33 -0400 (EDT)
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Date: Mon,  6 May 2019 16:50:18 +0200
Message-Id:
 <dc79bf966c2079b42d62483b5a5e985ef5a36e50.1557154206.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <cover.5027956268821f50401d0ecdfad2447cbe4fdd6c.1557154206.git-series.marmarek@invisiblethingslab.com>
References: <cover.5027956268821f50401d0ecdfad2447cbe4fdd6c.1557154206.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
In-Reply-To: <cover.5027956268821f50401d0ecdfad2447cbe4fdd6c.1557154206.git-series.marmarek@invisiblethingslab.com>
References: <cover.5027956268821f50401d0ecdfad2447cbe4fdd6c.1557154206.git-series.marmarek@invisiblethingslab.com>
Subject: [Xen-devel] [PATCH 2/5] drivers/video: drop unused limits
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
Message-ID: <20190506145018.nGB9LkoVjk28-W-V4VBM0Q4afnED2rDa8aAAhsS5l6A@z>

TUFYX0JQUCwgTUFYX0ZPTlRfVywgTUFYX0ZPTlRfSCBhcmUgbm90IHVzZWQgaW4gdGhlIGNvZGUg
YXQgYWxsLgoKU2lnbmVkLW9mZi1ieTogTWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tpIDxtYXJt
YXJla0BpbnZpc2libGV0aGluZ3NsYWIuY29tPgotLS0KIHhlbi9kcml2ZXJzL3ZpZGVvL2xmYi5j
IHwgMyAtLS0KIDEgZmlsZSBjaGFuZ2VkLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hl
bi9kcml2ZXJzL3ZpZGVvL2xmYi5jIGIveGVuL2RyaXZlcnMvdmlkZW8vbGZiLmMKaW5kZXggZDBj
OGM0OS4uMDQ3NWE2OCAxMDA2NDQKLS0tIGEveGVuL2RyaXZlcnMvdmlkZW8vbGZiLmMKKysrIGIv
eGVuL2RyaXZlcnMvdmlkZW8vbGZiLmMKQEAgLTEyLDkgKzEyLDYgQEAKIAogI2RlZmluZSBNQVhf
WFJFUyAxOTAwCiAjZGVmaW5lIE1BWF9ZUkVTIDEyMDAKLSNkZWZpbmUgTUFYX0JQUCA0Ci0jZGVm
aW5lIE1BWF9GT05UX1cgOAotI2RlZmluZSBNQVhfRk9OVF9IIDE2CiAKIHN0cnVjdCBsZmJfc3Rh
dHVzIHsKICAgICBzdHJ1Y3QgbGZiX3Byb3AgbGZicDsKLS0gCmdpdC1zZXJpZXMgMC45LjEKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
