Return-Path: <SRS0=EGNL=YL=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59235CA9EA0
	for <xen-devel@archiver.kernel.org>; Fri, 18 Oct 2019 07:46:19 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 31F0821897
	for <xen-devel@archiver.kernel.org>; Fri, 18 Oct 2019 07:46:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 31F0821897
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iLMxQ-0007nM-1g; Fri, 18 Oct 2019 07:45:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=D0pS=YL=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iLMxO-0007mT-AW
 for xen-devel@lists.xenproject.org; Fri, 18 Oct 2019 07:45:54 +0000
X-Inumbo-ID: 4f2d5cec-f17b-11e9-beca-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4f2d5cec-f17b-11e9-beca-bc764e2007e4;
 Fri, 18 Oct 2019 07:45:52 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id C8E74B6D9;
 Fri, 18 Oct 2019 07:45:51 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Fri, 18 Oct 2019 09:45:49 +0200
Message-Id: <20191018074549.4778-1-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
Subject: [Xen-devel] [PATCH] xen/netback: fix error path of
 xenvif_connect_data()
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
Cc: Juergen Gross <jgross@suse.com>, Wei Liu <wei.liu@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, stable@vger.kernel.org,
 Paul Durrant <paul@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

eGVudmlmX2Nvbm5lY3RfZGF0YSgpIGNhbGxzIG1vZHVsZV9wdXQoKSBpbiBjYXNlIG9mIGVycm9y
LiBUaGlzIGlzCndyb25nIGFzIHRoZXJlIGlzIG5vIHJlbGF0ZWQgbW9kdWxlX2dldCgpLgoKUmVt
b3ZlIHRoZSBzdXBlcmZsdW91cyBtb2R1bGVfcHV0KCkuCgpGaXhlczogMjc5ZjQzOGUzNmMwYTcg
KCJ4ZW4tbmV0YmFjazogRG9uJ3QgZGVzdHJveSB0aGUgbmV0ZGV2IHVudGlsIHRoZSB2aWYgaXMg
c2h1dCBkb3duIikKQ2M6IDxzdGFibGVAdmdlci5rZXJuZWwub3JnPiAjIDMuMTIKU2lnbmVkLW9m
Zi1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgpSZXZpZXdlZC1ieTogUGF1bCBE
dXJyYW50IDxwYXVsQHhlbi5vcmc+Ci0tLQogZHJpdmVycy9uZXQveGVuLW5ldGJhY2svaW50ZXJm
YWNlLmMgfCAxIC0KIDEgZmlsZSBjaGFuZ2VkLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9uZXQveGVuLW5ldGJhY2svaW50ZXJmYWNlLmMgYi9kcml2ZXJzL25ldC94ZW4tbmV0
YmFjay9pbnRlcmZhY2UuYwppbmRleCAyNDBmNzYyYjM3NDkuLjEwM2VkMDA3NzVlYiAxMDA2NDQK
LS0tIGEvZHJpdmVycy9uZXQveGVuLW5ldGJhY2svaW50ZXJmYWNlLmMKKysrIGIvZHJpdmVycy9u
ZXQveGVuLW5ldGJhY2svaW50ZXJmYWNlLmMKQEAgLTcxOSw3ICs3MTksNiBAQCBpbnQgeGVudmlm
X2Nvbm5lY3RfZGF0YShzdHJ1Y3QgeGVudmlmX3F1ZXVlICpxdWV1ZSwKIAl4ZW52aWZfdW5tYXBf
ZnJvbnRlbmRfZGF0YV9yaW5ncyhxdWV1ZSk7CiAJbmV0aWZfbmFwaV9kZWwoJnF1ZXVlLT5uYXBp
KTsKIGVycjoKLQltb2R1bGVfcHV0KFRISVNfTU9EVUxFKTsKIAlyZXR1cm4gZXJyOwogfQogCi0t
IAoyLjE2LjQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
