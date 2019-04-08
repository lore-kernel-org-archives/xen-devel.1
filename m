Return-Path: <SRS0=fn8+=SK=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36806C10F13
	for <xen-devel@archiver.kernel.org>; Mon,  8 Apr 2019 15:17:16 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1471B214C6
	for <xen-devel@archiver.kernel.org>; Mon,  8 Apr 2019 15:17:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1471B214C6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hDW0r-0008GL-C0; Mon, 08 Apr 2019 15:16:45 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=p7a1=SK=citrix.com=prvs=9940f4835=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1hDW0q-0008GF-At
 for xen-devel@lists.xenproject.org; Mon, 08 Apr 2019 15:16:44 +0000
X-Inumbo-ID: 4fec1a87-5a11-11e9-92d7-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 4fec1a87-5a11-11e9-92d7-bc764e045a96;
 Mon, 08 Apr 2019 15:16:43 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,325,1549929600"; d="scan'208";a="83016879"
From: Paul Durrant <paul.durrant@citrix.com>
To: <qemu-devel@nongnu.org>, <qemu-block@nongnu.org>,
 <xen-devel@lists.xenproject.org>
Date: Mon, 8 Apr 2019 16:16:14 +0100
Message-ID: <20190408151617.13025-1-paul.durrant@citrix.com>
X-Mailer: git-send-email 2.20.1.2.gb21ebb6
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 0/3] Support IOThread polling for PV shared rings
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
Cc: Kevin Wolf <kwolf@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Max Reitz <mreitz@redhat.com>, Paul Durrant <paul.durrant@citrix.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Q3VycmVudGx5IHhlbi1ibG9jayB1c2VzIGFuIElPVGhyZWFkIHRvIGhhbmRsZSBBSU8gYnV0IHRo
ZSBldmVudCBjaGFubmVscwphcmUgZGVhbHQgd2l0aCBvbiBRRU1VJ3MgbWFpbiB0aHJlYWQuIFRo
aXMgc2VyaWVzIGFsbG93cyB0aGVtIHRvIGJlCmRlYWx0IHdpdGggaW4gdGhlIHNhbWUgY29udGV4
dC4KClBhdWwgRHVycmFudCAoMyk6CiAgeGVuLWJ1czogdXNlIGEgc2VwYXJhdGUgZmQgZm9yIGVh
Y2ggZXZlbnQgY2hhbm5lbAogIHhlbi1idXM6IGFsbG93IEFpb0NvbnRleHQgdG8gYmUgc3BlY2lm
aWVkIGZvciBlYWNoIGV2ZW50IGNoYW5uZWwKICB4ZW4tYnVzIC8geGVuLWJsb2NrOiBhZGQgc3Vw
cG9ydCBmb3IgZXZlbnQgY2hhbm5lbCBwb2xsaW5nCgogaHcvYmxvY2svZGF0YXBsYW5lL3hlbi1i
bG9jay5jIHwgMTkgKysrLS0tLQogaHcveGVuL3hlbi1idXMuYyAgICAgICAgICAgICAgIHwgOTIg
KysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLQogaW5jbHVkZS9ody94ZW4veGVuLWJ1
cy5oICAgICAgIHwgIDkgKystLQogMyBmaWxlcyBjaGFuZ2VkLCA2NiBpbnNlcnRpb25zKCspLCA1
NCBkZWxldGlvbnMoLSkKLS0tCkNjOiBBbnRob255IFBlcmFyZCA8YW50aG9ueS5wZXJhcmRAY2l0
cml4LmNvbT4KQ2M6IEtldmluIFdvbGYgPGt3b2xmQHJlZGhhdC5jb20+CkNjOiBNYXggUmVpdHog
PG1yZWl0ekByZWRoYXQuY29tPgpDYzogU3RlZmFuIEhham5vY3ppIDxzdGVmYW5oYUByZWRoYXQu
Y29tPgpDYzogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPgotLQoy
LjIwLjEuMi5nYjIxZWJiNgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
