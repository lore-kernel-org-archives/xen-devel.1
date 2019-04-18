Return-Path: <SRS0=LbOi=SU=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C90CDC10F14
	for <xen-devel@archiver.kernel.org>; Thu, 18 Apr 2019 16:32:26 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A25A82183F
	for <xen-devel@archiver.kernel.org>; Thu, 18 Apr 2019 16:32:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A25A82183F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=eu.citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hH9xN-00026J-Vt; Thu, 18 Apr 2019 16:32:13 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tvKn=SU=citrix.com=prvs=004dc2360=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hH9xM-00023B-8j
 for xen-devel@lists.xenproject.org; Thu, 18 Apr 2019 16:32:12 +0000
X-Inumbo-ID: 83e60480-61f7-11e9-92d7-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 83e60480-61f7-11e9-92d7-bc764e045a96;
 Thu, 18 Apr 2019 16:32:11 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,366,1549929600"; d="scan'208";a="83913785"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 18 Apr 2019 17:31:38 +0100
Message-ID: <20190418163158.11408-2-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190418163158.11408-1-ian.jackson@eu.citrix.com>
References: <20190418163158.11408-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [OSSTEST PATCH 01/21] ts-hosts-allocate-Executive: with
 -U, just append to the same logfile
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
Cc: Ian Jackson <Ian.Jackson@eu.citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190418163138.Ae_CClkevZCQD6_Y1k3ryCDpHvXpbD32_a_acDm4E5E@z>

VGhpcyBpcyBtdWNoIG1vcmUgY29udmVuaWVudCBmb3IgYWQtaG9jIHVzZS4KClNpZ25lZC1vZmYt
Ynk6IElhbiBKYWNrc29uIDxJYW4uSmFja3NvbkBldS5jaXRyaXguY29tPgotLS0KIHRzLWhvc3Rz
LWFsbG9jYXRlLUV4ZWN1dGl2ZSB8IDggKysrKystLS0KIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2Vy
dGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvdHMtaG9zdHMtYWxsb2NhdGUt
RXhlY3V0aXZlIGIvdHMtaG9zdHMtYWxsb2NhdGUtRXhlY3V0aXZlCmluZGV4IGRjZmM3MGYyLi4z
ZGExMzhiMSAxMDA3NTUKLS0tIGEvdHMtaG9zdHMtYWxsb2NhdGUtRXhlY3V0aXZlCisrKyBiL3Rz
LWhvc3RzLWFsbG9jYXRlLUV4ZWN1dGl2ZQpAQCAtNzUsMTYgKzc1LDE4IEBAIHN1YiBzZXR1cCAo
KSB7CiAKICAgICAkdGFza2lkPSBmaW5kdGFzaygpOwogCi0gICAgbXkgJGxvZ2Jhc2UgPSAiaG9z
dHMtYWxsb2NhdGUuZGVidWciLigkY29tcHJlc3NkZWJ1Zz8iLmd6IjoiIik7Ci0gICAgbXkgJGxv
Z2ZoID0gb3Blbl91bmlxdWVfc3Rhc2hmaWxlIFwkbG9nYmFzZTsKKyAgICBteSAkbG9nYmFzZSA9
ICJob3N0cy1hbGxvY2F0ZS5kZWJ1ZyI7CiAgICAgaWYgKCRjb21wcmVzc2RlYnVnKSB7CisJJGxv
Z2Jhc2UgLj0gIi5neiI7CisJbXkgJGxvZ2ZoID0gb3Blbl91bmlxdWVfc3Rhc2hmaWxlIFwkbG9n
YmFzZTsKIAlteSAkbG9nY2hpbGQgPSBvcGVuIERFQlVHLCAifC0iOyAgZGVmaW5lZCAkbG9nY2hp
bGQgb3IgZGllICQhOwogCWlmICghJGxvZ2NoaWxkKSB7CiAJICAgIG9wZW4gU1RET1VULCAiPiYi
LCAkbG9nZmggb3IgZGllICQhOwogCSAgICBleGVjICJnemlwIiBvciBkaWUgJCE7CiAJfQogICAg
IH0gZWxzZSB7Ci0Jb3BlbiBERUJVRywgIj4mIiwgJGxvZ2ZoIG9yIGRpZSAkITsKKwlteSAkbG9n
ZmggPSAiJHN0YXNoLyRsb2diYXNlIjsKKwlvcGVuIERFQlVHLCAiPj4iLCAkbG9nZmggb3IgZGll
ICQhOwogICAgIH0KICAgICBERUJVRy0+YXV0b2ZsdXNoKDEpOwogICAgIGxvZ20oImhvc3QgYWxs
b2NhdGlvbiBkZWJ1ZyBsb2cgaW4gJGxvZ2Jhc2UiKTsKLS0gCjIuMTEuMAoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
