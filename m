Return-Path: <SRS0=w6oi=S3=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 163ACC43219
	for <xen-devel@archiver.kernel.org>; Thu, 25 Apr 2019 17:52:28 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 99BCC206A3
	for <xen-devel@archiver.kernel.org>; Thu, 25 Apr 2019 17:52:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="0plhF/26"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 99BCC206A3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hJiXR-0005EF-2U; Thu, 25 Apr 2019 17:52:01 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xa9b=S3=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hJiXP-0005EA-Ni
 for xen-devel@lists.xenproject.org; Thu, 25 Apr 2019 17:51:59 +0000
X-Inumbo-ID: d1ff7d9d-6782-11e9-843c-bc764e045a96
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id d1ff7d9d-6782-11e9-843c-bc764e045a96;
 Thu, 25 Apr 2019 17:51:58 +0000 (UTC)
Received: from sstabellini-ThinkPad-X260.xilinx.com
 (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 10E1C205F4;
 Thu, 25 Apr 2019 17:51:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1556214718;
 bh=uUIkrfGfwD9p46Awz0gpzEkDuq7/nDp6be3QGZ8Wi98=;
 h=From:To:Cc:Subject:Date:From;
 b=0plhF/26+p9sDSA8SQN91gcq6x70/AbH+6gdmo/cdNWq8dHOmEv1dbpquqOdzKssL
 tXvnH4Djh2I2j860NmgL5slAb3PRF8W4ZurYVVkHnyQkZRDyWVmgo+fhE0sWGGxrtB
 0GjmHslrvcn2hwYiVP9cT/dwVTA8CWaMTskG+ANQ=
From: Stefano Stabellini <sstabellini@kernel.org>
To: xen-devel@lists.xenproject.org
Date: Thu, 25 Apr 2019 10:51:55 -0700
Message-Id: <1556214715-22030-1-git-send-email-sstabellini@kernel.org>
X-Mailer: git-send-email 1.9.1
Subject: [Xen-devel] [PATCH] xen/arm: skip first page when RAM starts at 0x0
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
Cc: Stefano Stabellini <stefanos@xilinx.com>, julien.grall@arm.com,
 sstabellini@kernel.org, 206497@studenti.unimore.it
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190425175155.1LHNNM6u-LYANroTHOunPRLIeGn6q2aMTLyAUCWNH-A@z>

WGVuIGFzc3VtZXMgdGhhdCBSQU0gc3RhcnRzIGF0IGFkZHJlc3NlcyBncmVhdGVyIHRoYW4gMHgw
IGluIGEgZmV3CnBsYWNlcy4gVGhlIFBEWCBjb2RlIGlzIG9uZSBvZiB0aGVtIGJ1dCB0aGVyZSBh
cmUgbW9yZS4KCkZvciBub3csIHNraXAgdGhlIGZpcnN0IHBhZ2UgaW4gbWVtb3J5IHdoZW4gdGhl
IHN0YXJ0IGFkZGVzcyBpcyAweDAuCgpTaWduZWQtb2ZmLWJ5OiBTdGVmYW5vIFN0YWJlbGxpbmkg
PHN0ZWZhbm9zQHhpbGlueC5jb20+Ci0tLQogeGVuL2FyY2gvYXJtL2Jvb3RmZHQuYyB8IDcgKysr
KysrKwogMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL3hlbi9h
cmNoL2FybS9ib290ZmR0LmMgYi94ZW4vYXJjaC9hcm0vYm9vdGZkdC5jCmluZGV4IDg5MWI0YjYu
LjJhZTQyMzggMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL2FybS9ib290ZmR0LmMKKysrIGIveGVuL2Fy
Y2gvYXJtL2Jvb3RmZHQuYwpAQCAtMTU3LDYgKzE1NywxMyBAQCBzdGF0aWMgdm9pZCBfX2luaXQg
cHJvY2Vzc19tZW1vcnlfbm9kZShjb25zdCB2b2lkICpmZHQsIGludCBub2RlLAogICAgICAgICBk
ZXZpY2VfdHJlZV9nZXRfcmVnKCZjZWxsLCBhZGRyZXNzX2NlbGxzLCBzaXplX2NlbGxzLCAmc3Rh
cnQsICZzaXplKTsKICAgICAgICAgaWYgKCAhc2l6ZSApCiAgICAgICAgICAgICBjb250aW51ZTsK
KworICAgICAgICAvKgorICAgICAgICAgKiBYZW4gY2Fubm90IGRlYWwgd2l0aCBtZW1vcnkgc3Rh
cnRpbmcgYXQgMHgwLiBCdXJuIHRoZSBmaXJzdAorICAgICAgICAgKiBwYWdlLgorICAgICAgICAg
Ki8KKyAgICAgICAgaWYgKCBzdGFydCA9PSAwICkKKyAgICAgICAgICAgIHN0YXJ0ICs9IFBBR0Vf
U0laRTsKICAgICAgICAgYm9vdGluZm8ubWVtLmJhbmtbYm9vdGluZm8ubWVtLm5yX2JhbmtzXS5z
dGFydCA9IHN0YXJ0OwogICAgICAgICBib290aW5mby5tZW0uYmFua1tib290aW5mby5tZW0ubnJf
YmFua3NdLnNpemUgPSBzaXplOwogICAgICAgICBib290aW5mby5tZW0ubnJfYmFua3MrKzsKLS0g
CjEuOS4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
