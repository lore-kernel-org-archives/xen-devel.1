Return-Path: <SRS0=MgWH=SZ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AF30C10F03
	for <xen-devel@archiver.kernel.org>; Tue, 23 Apr 2019 15:50:21 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E85882175B
	for <xen-devel@archiver.kernel.org>; Tue, 23 Apr 2019 15:50:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E85882175B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hIxgH-0007Ip-Br; Tue, 23 Apr 2019 15:50:01 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=RGA1=SZ=citrix.com=prvs=00953f314=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hIxgF-0007Ie-GJ
 for xen-devel@lists.xenproject.org; Tue, 23 Apr 2019 15:49:59 +0000
X-Inumbo-ID: 720ff71b-65df-11e9-92d7-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 720ff71b-65df-11e9-92d7-bc764e045a96;
 Tue, 23 Apr 2019 15:49:58 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,386,1549929600"; d="scan'208";a="84208328"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Tue, 23 Apr 2019 16:49:53 +0100
Message-ID: <1556034593-3692-1-git-send-email-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] xen/timers: Fix memory leak with cpu
 unplug/plug (take 2)
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
 Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <JBeulich@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190423154953.GALG-XW2bMMWh28xrtRbBAgCVfE83AU6cW3jbrXIS0Y@z>

UHJldmlvdXMgYXR0ZW1wdHMgdG8gZml4IHRoaXMgbGVhayBmYWlsZWQgdG8gaWRlbnRpZnkgdGhl
IHJvb3QgY2F1c2UsIGFuZAp1bHRpbWF0ZWx5IGZhaWxlZC4gIFRoZSBjYXVzZSBpcyB0aGUgQ1BV
X1VQX1BSRVBBUkUgY2FzZSAocmUpaW5pdGlhbGlzaW5nCnRzLT5oZWFwIGJhY2sgdG8gZHVtbXlf
aGVhcCwgd2hpY2ggbGVha3MgdGhlIHByZXZpb3VzIGFsbG9jYXRpb24uCgpSZWFycmFuZ2UgdGhl
IGxvZ2ljIHRvIG9ubHkgaW5pdGlhbGlzZSB0cyBvbmNlLiAgVGhpcyBhbHNvIGF2b2lkcyB0aGUK
cmVkdW5kYW50IChidXQgYmVuaWduLCBkdWUgdG8gdHMtPmluYWN0aXZlIGFsd2F5cyBiZWluZyBl
bXB0eSkgaW5pdGlhbGlzaW5nIG9mCnRoZSBvdGhlciB0cyBmaWVsZHMuCgpTaWduZWQtb2ZmLWJ5
OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgotLS0KQ0M6IEdlb3Jn
ZSBEdW5sYXAgPEdlb3JnZS5EdW5sYXBAZXUuY2l0cml4LmNvbT4KQ0M6IEphbiBCZXVsaWNoIDxK
QmV1bGljaEBzdXNlLmNvbT4KQ0M6IEtvbnJhZCBSemVzenV0ZWsgV2lsayA8a29ucmFkLndpbGtA
b3JhY2xlLmNvbT4KQ0M6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9y
Zz4KQ0M6IFRpbSBEZWVnYW4gPHRpbUB4ZW4ub3JnPgpDQzogV2VpIExpdSA8d2VpLmxpdTJAY2l0
cml4LmNvbT4KQ0M6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+Ci0tLQogeGVu
L2NvbW1vbi90aW1lci5jIHwgMTAgKysrKysrKy0tLQogMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0
aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vY29tbW9uL3RpbWVyLmMg
Yi94ZW4vY29tbW9uL3RpbWVyLmMKaW5kZXggZjYwNzEyYS4uNjUwZTM5OCAxMDA2NDQKLS0tIGEv
eGVuL2NvbW1vbi90aW1lci5jCisrKyBiL3hlbi9jb21tb24vdGltZXIuYwpAQCAtNjU3LDkgKzY1
NywxMyBAQCBzdGF0aWMgaW50IGNwdV9jYWxsYmFjaygKICAgICBzd2l0Y2ggKCBhY3Rpb24gKQog
ICAgIHsKICAgICBjYXNlIENQVV9VUF9QUkVQQVJFOgotICAgICAgICBJTklUX0xJU1RfSEVBRCgm
dHMtPmluYWN0aXZlKTsKLSAgICAgICAgc3Bpbl9sb2NrX2luaXQoJnRzLT5sb2NrKTsKLSAgICAg
ICAgdHMtPmhlYXAgPSBkdW1teV9oZWFwOworICAgICAgICAvKiBPbmx5IGluaXRpYWxpc2UgdHMg
b25jZS4gKi8KKyAgICAgICAgaWYgKCAhdHMtPmhlYXAgKQorICAgICAgICB7CisgICAgICAgICAg
ICBJTklUX0xJU1RfSEVBRCgmdHMtPmluYWN0aXZlKTsKKyAgICAgICAgICAgIHNwaW5fbG9ja19p
bml0KCZ0cy0+bG9jayk7CisgICAgICAgICAgICB0cy0+aGVhcCA9IGR1bW15X2hlYXA7CisgICAg
ICAgIH0KICAgICAgICAgYnJlYWs7CiAKICAgICBjYXNlIENQVV9VUF9DQU5DRUxFRDoKLS0gCjIu
MS40CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
