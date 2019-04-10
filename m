Return-Path: <SRS0=ih+i=SM=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2E0CC10F14
	for <xen-devel@archiver.kernel.org>; Wed, 10 Apr 2019 14:25:40 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9B47520850
	for <xen-devel@archiver.kernel.org>; Wed, 10 Apr 2019 14:25:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9B47520850
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=eu.citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hEEAG-0006KP-TK; Wed, 10 Apr 2019 14:25:24 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xn7x=SM=citrix.com=prvs=996f5bc6d=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hEEAE-0006F4-41
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2019 14:25:22 +0000
X-Inumbo-ID: 788403be-5b9c-11e9-92d7-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 788403be-5b9c-11e9-92d7-bc764e045a96;
 Wed, 10 Apr 2019 14:25:20 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,332,1549929600"; d="scan'208";a="83227685"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 10 Apr 2019 15:23:23 +0100
Message-ID: <20190410142408.22848-18-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190410142408.22848-1-ian.jackson@eu.citrix.com>
References: <20190410142408.22848-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [OSSTEST PATCH 17/62] stretch: Use chainloading when
 booting using GRUB on Arm64
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
Cc: Julien Grall <julien.grall@arm.com>, Wei Liu <wei.liu2@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190410142323.Bvj3qO8A9006FvVh0iwv0nYBh00_iL8Yxv6JcjmrSaE@z>

RnJvbTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KClRoZSBHUlVCIHBhY2th
Z2UgaW4gc3RyZXRjaCBpcyBub3QgYWJsZSB0byBib290IFhlbiBvbiBBcm02NC4KVXNlIGNoYWlu
bG9hZGluZyBhcyB3ZSBkaWQgZm9yIGplc3NpZSBmb3IgdGhlIHRpbWUgYmVpbmcuCgpOb3RlIHRo
YXQgYSBidWcgaGFzIGJlZW4gZmlsbGVkIG9uIERlYmlhbiB0byBpbnRlZ3JhdGUgWGVuCnBhY3Rj
aGVzIGZvciB0aGUgbmV4dCByZWxlYXNlIChzZWUgWzFdKS4KClsxXSBodHRwczovL2J1Z3MuZGVi
aWFuLm9yZy9jZ2ktYmluL2J1Z3JlcG9ydC5jZ2k/YnVnPTg4NDc3MAoKU2lnbmVkLW9mZi1ieTog
SnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KU2lnbmVkLW9mZi1ieTogV2VpIExp
dSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KQWNrZWQtYnk6IElhbiBKYWNrc29uIDxpYW4uamFja3Nv
bkBldS5jaXRyaXguY29tPgotLS0KdjQ6IENvcnJlY3Qgc3VpdGUgbmFtZSBjYXBpdGFsaXNhdGlv
biBpbiBjb21taXQgbWVzc2FnZSBhbmQgY29tbWVudC4KLS0tCiBPc3N0ZXN0L0RlYmlhbi5wbSB8
IDQgKystLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkK
CmRpZmYgLS1naXQgYS9Pc3N0ZXN0L0RlYmlhbi5wbSBiL09zc3Rlc3QvRGViaWFuLnBtCmluZGV4
IDg1YjE4OTBkLi44MGI0Y2YzNyAxMDA2NDQKLS0tIGEvT3NzdGVzdC9EZWJpYW4ucG0KKysrIGIv
T3NzdGVzdC9EZWJpYW4ucG0KQEAgLTQzNSwxMCArNDM1LDEwIEBAIHN1YiBzZXR1cGJvb3RfZ3J1
YjIgKCQkJCQpIHsKICAgICBteSAkcm1lbnU9ICcvYm9vdC9ncnViL2dydWIuY2ZnJzsKICAgICBt
eSAka2VybmtleT0gKGRlZmluZWQgJHhlbmhvcHQgPyAnS2VybkRvbTAnIDogJ0tlcm5Pbmx5Jyk7
CiAKLSAgICAjIEdydWIyIG9uIEplc3NpZS9hcm0qIGRvZXNuJ3QgZG8gbXVsdGlib290LCBzbyB3
ZSBtdXN0IGNoYWlubG9hZC4KKyAgICAjIEdydWIyIG9uIGplc3NpZS9zdHJldGNoIEFSTSogZG9l
c24ndCBkbyBtdWx0aWJvb3QsIHNvIHdlIG11c3QgY2hhaW5sb2FkLgogICAgIG15ICRuZWVkX3Vl
ZmlfY2hhaW5sb2FkID0KICAgICAgICAgZ2V0X2hvc3RfcHJvcGVydHkoJGhvLCAiZmlybXdhcmUi
LCAiIikgZXEgInVlZmkiICYmCi0gICAgICAgICRoby0+e1N1aXRlfSA9fiBtL2plc3NpZS8gJiYg
JHJ7YXJjaH0gPX4gbS9eYXJtLzsKKyAgICAgICAgJGhvLT57U3VpdGV9ID1+IG0vamVzc2llfHN0
cmV0Y2gvICYmICRye2FyY2h9ID1+IG0vXmFybS87CiAKICAgICBteSAkcGFyc2VtZW51PSBzdWIg
ewogICAgICAgICBteSAkZj0gYmxfZ2V0bWVudV9vcGVuKCRobywgJHJtZW51LCAiJHN0YXNoLyRo
by0+e05hbWV9LS1ncnViLmNmZy4xIik7Ci0tIAoyLjExLjAKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
