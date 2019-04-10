Return-Path: <SRS0=ih+i=SM=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 861B5C10F11
	for <xen-devel@archiver.kernel.org>; Wed, 10 Apr 2019 14:25:33 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5E7A120850
	for <xen-devel@archiver.kernel.org>; Wed, 10 Apr 2019 14:25:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5E7A120850
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=eu.citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hEEAB-0006Bz-I8; Wed, 10 Apr 2019 14:25:19 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xn7x=SM=citrix.com=prvs=996f5bc6d=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hEEA9-0006BE-Rc
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2019 14:25:17 +0000
X-Inumbo-ID: 766c0ef6-5b9c-11e9-92d7-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 766c0ef6-5b9c-11e9-92d7-bc764e045a96;
 Wed, 10 Apr 2019 14:25:17 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,332,1549929600"; d="scan'208";a="83227667"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 10 Apr 2019 15:23:15 +0100
Message-ID: <20190410142408.22848-10-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190410142408.22848-1-ian.jackson@eu.citrix.com>
References: <20190410142408.22848-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [OSSTEST PATCH 09/62] ts-debian-fixup: merge origin
 extra= to our own if necessary
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
Cc: Wei Liu <wei.liu2@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190410142315.L1EQVdWfVGl30nQgFu8bmpZPZ99FcuMx9hGApiBuUhQ@z>

RnJvbTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KClRoZSBvcmlnaW5hbCBleHRyYT0g
d2FzIG5vdCByZW1vdmVkLCBzbyB0aGVyZSB3ZXJlIHR3byBleHRyYT0gaW4gdGhlCnJlc3VsdGlu
ZyBjb25maWcgZmlsZS4KCkl0IHdhc24ndCBhIHByb2JsZW0gZm9yIHhsIGJlY2F1c2UgdGhlIHNl
Y29uZCBleHRyYT0gdG9vayBwcmVjZWRlbmNlLgpIb3dldmVyIGxpYnZpcnQgdGVzdHMgd291bGQg
b25seSBwaWNrIHVwIHRoZSBmaXJzdCBleHRyYT0gc28gdGhleQp3b3JrZWQgYnkgY2hhbmNlLgoK
Rml4IHRoaXMgaXNzdWUgYnkgbWVyZ2luZyB0aGUgb3JpZ2luYWwuIElmIHRoZXJlIGlzbid0IGFs
cmVhZHkgZXh0cmE9CmluICRjZmcsIHVzZSBvdXIgb3duLgoKU2lnbmVkLW9mZi1ieTogV2VpIExp
dSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KQWNrZWQtYnk6IElhbiBKYWNrc29uIDxpYW4uamFja3Nv
bkBldS5jaXRyaXguY29tPgotLS0KdjM6IGhhbmRsZSBzaXR1YXRpb24gd2hlbiBubyBleHRyYT0g
aXMgaW4gJGNmZwotLS0KIHRzLWRlYmlhbi1maXh1cCB8IDYgKysrKystCiAxIGZpbGUgY2hhbmdl
ZCwgNSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvdHMtZGViaWFu
LWZpeHVwIGIvdHMtZGViaWFuLWZpeHVwCmluZGV4IDNlNWNkYjk3Li40NzhkYzJhZiAxMDA3NTUK
LS0tIGEvdHMtZGViaWFuLWZpeHVwCisrKyBiL3RzLWRlYmlhbi1maXh1cApAQCAtMTc4LDcgKzE3
OCwxMSBAQCBzdWIgb3RoZXJmaXh1cGNmZyAoKSB7CiAgICAgICAgICRleHRyYSAuPSAiIGlvbW11
PXNvZnQiOwogICAgIH0KIAotICAgICRjZmcgLj0gIlxuZXh0cmE9JyRleHRyYSdcbiI7CisgICAg
aWYgKCRjZmcgPX4gbS9leHRyYVxzKj1ccypbJyJdKC4qKVsnIl0vKSB7CisJJGNmZyA9fiBzL2V4
dHJhXHMqPVxzKlsnIl0oLiopWyciXS9leHRyYSA9ICckMSAkZXh0cmEnLzsKKyAgICB9IGVsc2Ug
eworCSRjZmcgLj0gImV4dHJhID0gJyRleHRyYSdcbiI7CisgICAgfQogfTsKIAogc3ViIHdyaXRl
Y2ZnICgpIHsKLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
