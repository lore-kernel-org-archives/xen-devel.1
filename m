Return-Path: <SRS0=MKw+=S2=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4402AC282E1
	for <xen-devel@archiver.kernel.org>; Wed, 24 Apr 2019 18:12:16 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 223B920652
	for <xen-devel@archiver.kernel.org>; Wed, 24 Apr 2019 18:12:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 223B920652
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hJMN1-000653-8T; Wed, 24 Apr 2019 18:11:47 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=bPtL=S2=citrix.com=prvs=0106169aa=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hJMMz-00064m-LA
 for xen-devel@lists.xenproject.org; Wed, 24 Apr 2019 18:11:45 +0000
X-Inumbo-ID: 6aea94f8-66bc-11e9-92d7-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 6aea94f8-66bc-11e9-92d7-bc764e045a96;
 Wed, 24 Apr 2019 18:11:44 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,390,1549929600"; d="scan'208";a="84328023"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Wed, 24 Apr 2019 19:10:57 +0100
Message-ID: <1556129458-11418-2-git-send-email-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1556129458-11418-1-git-send-email-andrew.cooper3@citrix.com>
References: <1556129458-11418-1-git-send-email-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 1/2] xen/domain: Block more speculative
 out-of-bound accesses
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
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien.grall@arm.com>,
 Norbert Manthey <nmanthey@amazon.de>, Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190424181057.CSJgjFQlyhez4StMjH91ISqMJPhkdzCSv6kwxxhcTM8@z>

Yy9zIGY4MzAzNDU4IHJlc3RyaWN0ZWQgc3BlY3VsYXRpdmUgYWNjZXNzIGZvciBkb192Y3B1X29w
KCksIGJ1dCBuZWdsZWN0ZWQgaXRzCmNvbXBhdCBjb3VudGVycGFydCwgd2hpY2ggaXMgcmVhY2hh
YmxlIGJ5IGd1ZXN0cyB1c2luZyB0aGUgMzJiaXQgQUJJLgoKTWFrZSBhbiBpZGVudGljYWwgYWRq
dXN0bWVudC4KClNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNp
dHJpeC5jb20+Ci0tLQpDQzogSmFuIEJldWxpY2ggPEpCZXVsaWNoQHN1c2UuY29tPgpDQzogV2Vp
IExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KQ0M6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBh
dUBjaXRyaXguY29tPgpDQzogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwu
b3JnPgpDQzogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KQ0M6IE5vcmJlcnQg
TWFudGhleSA8bm1hbnRoZXlAYW1hem9uLmRlPgotLS0KIHhlbi9jb21tb24vY29tcGF0L2RvbWFp
bi5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0p
CgpkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9jb21wYXQvZG9tYWluLmMgYi94ZW4vY29tbW9uL2Nv
bXBhdC9kb21haW4uYwppbmRleCA4OGJmZGM4Li4zOTg3N2IzIDEwMDY0NAotLS0gYS94ZW4vY29t
bW9uL2NvbXBhdC9kb21haW4uYworKysgYi94ZW4vY29tbW9uL2NvbXBhdC9kb21haW4uYwpAQCAt
MzksNyArMzksNyBAQCBpbnQgY29tcGF0X3ZjcHVfb3AoaW50IGNtZCwgdW5zaWduZWQgaW50IHZj
cHVpZCwgWEVOX0dVRVNUX0hBTkRMRV9QQVJBTSh2b2lkKSBhcgogICAgIHN0cnVjdCB2Y3B1ICp2
OwogICAgIGludCByYyA9IDA7CiAKLSAgICBpZiAoIHZjcHVpZCA+PSBkLT5tYXhfdmNwdXMgfHwg
KHYgPSBkLT52Y3B1W3ZjcHVpZF0pID09IE5VTEwgKQorICAgIGlmICggKHYgPSBkb21haW5fdmNw
dShkLCB2Y3B1aWQpKSA9PSBOVUxMICkKICAgICAgICAgcmV0dXJuIC1FTk9FTlQ7CiAKICAgICBz
d2l0Y2ggKCBjbWQgKQotLSAKMi4xLjQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
