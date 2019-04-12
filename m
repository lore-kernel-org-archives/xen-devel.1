Return-Path: <SRS0=b7Gi=SO=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EF1EC10F0E
	for <xen-devel@archiver.kernel.org>; Fri, 12 Apr 2019 16:54:55 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4730A2171F
	for <xen-devel@archiver.kernel.org>; Fri, 12 Apr 2019 16:54:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4730A2171F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hEzRd-0007jQ-3D; Fri, 12 Apr 2019 16:54:29 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=o30B=SO=citrix.com=prvs=99869dea8=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hEzRb-0007jL-R7
 for xen-devel@lists.xenproject.org; Fri, 12 Apr 2019 16:54:27 +0000
X-Inumbo-ID: a15564ea-5d43-11e9-92d7-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id a15564ea-5d43-11e9-92d7-bc764e045a96;
 Fri, 12 Apr 2019 16:54:26 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,342,1549929600"; d="scan'208";a="83459424"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23728.49855.459934.890575@mariner.uk.xensource.com>
Date: Fri, 12 Apr 2019 17:54:23 +0100
To: <julien.grall@arm.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: [Xen-devel] arndale 4.14 test flight
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
Cc: xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190412165423.WoYest2J21c9YvVU2IEuxkY7xfTHW0P3MQlJkq4tCQY@z>

SSBoYXZlIGp1c3QgZG9uZSB0aGlzOgoKKHRlc3QtbGFiKWl3akBvc3N0ZXN0On4vMnRlc3Rpbmcu
Z2l0JCBmbGlnaHQ9YE9TU1RFU1RfSk9CU19PTkxZPScuKmFybWhmLionIC4vbWFrZS1mbGlnaHQg
b3NzdGVzdCB4ZW4tdW5zdGFibGUgY29tbWlzc2lvbi1hcm5kYWxlYDsgZWNobyAkZmxpZ2h0Cndh
cm5pbmc6IG5vdGhpbmcgYW5vaW50ZWQgZnJlZWJzZCBidWlsZCBtYXN0ZXIgaTM4Ngp3YXJuaW5n
OiBub3RoaW5nIGFub2ludGVkIGZyZWVic2QgYnVpbGQgbWFzdGVyIGFybWhmCndhcm5pbmc6IG5v
dGhpbmcgYW5vaW50ZWQgZnJlZWJzZCBidWlsZCBtYXN0ZXIgYXJtNjQKd2FybmluZzogbm90aGlu
ZyBhbm9pbnRlZCBmcmVlYnNkIGJ1aWxkIG1hc3RlciBpMzg2Cndhcm5pbmc6IG5vdGhpbmcgYW5v
aW50ZWQgZnJlZWJzZCBidWlsZCBtYXN0ZXIgYXJtaGYKd2FybmluZzogbm90aGluZyBhbm9pbnRl
ZCBmcmVlYnNkIGJ1aWxkIG1hc3RlciBhcm02NAoxMzQ3MDkKKHRlc3QtbGFiKWl3akBvc3N0ZXN0
On4vMnRlc3RpbmcuZ2l0JCAuL2NzLWFkanVzdC1mbGlnaHQgJGZsaWdodCBydW52YXItY2hhbmdl
IC4gcmV2aXNpb25feGVuICcnIGNiNzBhMjZmNzg4NDhmZTQ1ZjU5M2Y3ZWJjOWNmYWFjNzYwYTc5
MWIgcnVudmFyLWNoYW5nZSAuIHRyZWVfbGludXggZ2l0Oi8veGVuYml0cy54ZW4ub3JnL2xpbnV4
LXB2b3BzLmdpdCBnaXQ6Ly94ZW5iaXRzLnhlbi5vcmcvYXJtL2xpbnV4LmdpdCBydW52YXItY2hh
bmdlIC4gcmV2aXNpb25fbGludXggdGVzdGVkL2xpbnV4LWFybS14ZW4gZTY0YWMyNjc0OWRjMmMw
ZjM5MGNhY2NkMDQyNzQ2MDhhYjMxYzhjZgoodGVzdC1sYWIpaXdqQG9zc3Rlc3Q6fi8ydGVzdGlu
Zy5naXQkIC4vbWctZXhlY3V0ZS1mbGlnaHQgLUJwbGF5IC1FaWFuLmphY2tzb25AY2l0cml4LmNv
bSxqdWxpZW4uZ3JhbGxAYXJtLmNvbSAtUCAkZmxpZ2h0CgpUbyBydW4gc3VjaCBhIHRlc3QgeW91
IHdpbGwgbmVlZCB0byBoYXZlIHRoZSBzYW1lIG9zc3Rlc3QgcmV2aXNpb24gYXMKSSBoYXZlIHRo
ZXJlLCBub3Qgb3NzdGVzdCBtYXN0ZXIuICBUaGF0IHRyZWUgaGFzIHNvbWUgZXh0cmEgc3BlY2lh
bApib2RnZSBjb21taXRzIHRvIG1ha2UgaXQgdXNlIGhvc3RzIG5vdCBhcHBhcmVudGx5IHN1aXRh
Ymx5IGJsZXNzZWQuCgpZb3UnbGwgcHJvYmFibHkgbmVlZCB0byBmZXRjaCB0aGF0IHJldmlzaW9u
IGludG8geW91ciBvd24gdHJlZS4KSSBoYXZlIGdpdmVuIGl0IHRoZSBicmFuY2ggbmFtZSBgdCcg
dGhlcmUgZm9yIG5vdywgYnV0IHRoZSByZXZpc2lvbgp5b3Ugd2FudCBpcyBmNjE0ODNjZDU1NTlj
OTg1MDc0MzI2Njk1NjI5YWZjNTBkNzVhZGVmLgoKVGhlIHN0dWZmIHRvIGNoYW5nZSByZXZpc2lv
bl94ZW4gaXMgdG8gbWFrZSBpdCB1c2UgY3VycmVudCBYZW4gbWFzdGVyLgoKSWFuLgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
