Return-Path: <SRS0=ih+i=SM=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00138C282CE
	for <xen-devel@archiver.kernel.org>; Wed, 10 Apr 2019 14:25:39 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CE59620854
	for <xen-devel@archiver.kernel.org>; Wed, 10 Apr 2019 14:25:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CE59620854
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=eu.citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hEEAF-0006Ia-Ud; Wed, 10 Apr 2019 14:25:23 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xn7x=SM=citrix.com=prvs=996f5bc6d=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hEEAC-0006D1-Sm
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2019 14:25:20 +0000
X-Inumbo-ID: 782a590e-5b9c-11e9-92d7-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 782a590e-5b9c-11e9-92d7-bc764e045a96;
 Wed, 10 Apr 2019 14:25:20 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,332,1549929600"; d="scan'208";a="83227684"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 10 Apr 2019 15:23:22 +0100
Message-ID: <20190410142408.22848-17-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190410142408.22848-1-ian.jackson@eu.citrix.com>
References: <20190410142408.22848-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [OSSTEST PATCH 16/62] make-flight: guest should use
 jessie to test pvgrub
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
Cc: Juergen Gross <jgross@suse.com>, Wei Liu <wei.liu2@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190410142322.sh40UJeMRJ7yyxU1lMXoLVs_xMRdtX72F7SO6xEvLeg@z>

RnJvbTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KCnN0cmV0Y2ggaGFzIDY0Yml0IGZl
YXR1cmUgZW5hYmxlZCBmb3IgZXh0NCwgd2hpY2ggcHZncnViIGNhbid0IGNvcGUuCldlIHdhbnQg
dG8gY29udGludWUgdG8gdGVzdCBwdmdydWIsIHNvIHNwZWNpZnkgamVzc2llIGluIHRoZSBndWVz
dApzdWl0ZSBmaWVsZC4KCkEgY29uc2VxdWVuY2UgaXMgdGhhdCB0aGlzIHRlc3Qgd2lsbCB0ZXN0
IGplc3NpZSBmb3JldmVyLiAgRXZlbnR1YWxseQpqZXNzaWUgd2lsbCByb3Qgc28gYmFkbHkgdGhh
dCB0aGlzIHRlc3QgZmFpbHMgYW5kIHRoZW4gd2Ugd2lsbCBubwpsb25nZXIgYmUgdGVzdGluZyBw
dmdydWIxLiAgSG9wZWZ1bGx5IGJ5IHRoZW4gbm8tb25lIHdpbGwgYmUgdXNpbmcgaXQuCgpDQzog
SnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgpTaWduZWQtb2ZmLWJ5OiBXZWkgTGl1IDx3
ZWkubGl1MkBjaXRyaXguY29tPgpBY2tlZC1ieTogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1
LmNpdHJpeC5jb20+Ci0tLQp2NDogQWRqdXN0IGNvbW1pdCBtZXNzYWdlIHNsaWdodGx5LgotLS0K
IG1ha2UtZmxpZ2h0IHwgOCArKysrLS0tLQogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygr
KSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9tYWtlLWZsaWdodCBiL21ha2UtZmxpZ2h0
CmluZGV4IDkzYzgyYTIxLi4yZjg3NTEyNSAxMDA3NTUKLS0tIGEvbWFrZS1mbGlnaHQKKysrIGIv
bWFrZS1mbGlnaHQKQEAgLTYwOCw4ICs2MDgsOCBAQCBkb19wdmdydWJfdGVzdHMgKCkgewogICBq
b2JfY3JlYXRlX3Rlc3QgdGVzdC0keGVuYXJjaCRrZXJuLSRkb20wYXJjaC1hbWQ2NC1wdmdydWIg
ICAgIFwKICAgICB0ZXN0LWRlYmlhbi1kaSB4bCAkeGVuYXJjaCAkZG9tMGFyY2ggICAgICAgICAg
ICAgICAgICAgICAgICBcCiAgICAgICBkZWJpYW5fYXJjaD1hbWQ2NCAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgXAotICAgICAgZGViaWFuX3N1aXRlPSRndWVzdHN1aXRl
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKLSAgICAgIGRlYmlhbl9kaV92ZXJz
aW9uPSRndWVzdF9kaV92ZXJzaW9uICAgICAgICAgICAgICAgICAgICAgICBcCisgICAgICBkZWJp
YW5fc3VpdGU9amVzc2llICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAor
ICAgICAgZGViaWFuX2RpX3ZlcnNpb249YGdldGNvbmZpZ19UZnRwRGlWZXJzaW9uX3N1aXRlIGpl
c3NpZWAgIFwKICAgICAgIGRlYmlhbl9tZXRob2Q9bmV0Ym9vdCAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBcCiAgICAgICBkZWJpYW5fYm9vdGxvYWRlcj1wdmdydWIgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgXAogICAgICAgYWxsX2hvc3RmbGFncz0kbW9zdF9o
b3N0ZmxhZ3MgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKQEAgLTYxNyw4ICs2MTcsOCBA
QCBkb19wdmdydWJfdGVzdHMgKCkgewogICBqb2JfY3JlYXRlX3Rlc3QgdGVzdC0keGVuYXJjaCRr
ZXJuLSRkb20wYXJjaC1pMzg2LXB2Z3J1YiAgICAgIFwKICAgICB0ZXN0LWRlYmlhbi1kaSB4bCAk
eGVuYXJjaCAkZG9tMGFyY2ggICAgICAgICAgICAgICAgICAgICAgICBcCiAgICAgICBkZWJpYW5f
YXJjaD1pMzg2ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAotICAg
ICAgZGViaWFuX3N1aXRlPSRndWVzdHN1aXRlICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIFwKLSAgICAgIGRlYmlhbl9kaV92ZXJzaW9uPSRndWVzdF9kaV92ZXJzaW9uICAgICAgICAg
ICAgICAgICAgICAgICBcCisgICAgICBkZWJpYW5fc3VpdGU9amVzc2llICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgXAorICAgICAgZGViaWFuX2RpX3ZlcnNpb249YGdldGNv
bmZpZ19UZnRwRGlWZXJzaW9uX3N1aXRlIGplc3NpZWAgIFwKICAgICAgIGRlYmlhbl9tZXRob2Q9
bmV0Ym9vdCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCiAgICAgICBkZWJp
YW5fYm9vdGxvYWRlcj1wdmdydWIgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAog
ICAgICAgYWxsX2hvc3RmbGFncz0kbW9zdF9ob3N0ZmxhZ3MKLS0gCjIuMTEuMAoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
