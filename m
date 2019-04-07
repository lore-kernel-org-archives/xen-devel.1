Return-Path: <SRS0=0ivi=SJ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 098D8C10F0E
	for <xen-devel@archiver.kernel.org>; Sun,  7 Apr 2019 14:51:32 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C8F8620880
	for <xen-devel@archiver.kernel.org>; Sun,  7 Apr 2019 14:51:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C8F8620880
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hD98Q-0005im-7k; Sun, 07 Apr 2019 14:51:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=kOwd=SJ=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hD98P-0005ig-3L
 for xen-devel@lists.xenproject.org; Sun, 07 Apr 2019 14:51:01 +0000
X-Inumbo-ID: 8c5f5eb4-5944-11e9-a3f9-3bc27f873b50
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8c5f5eb4-5944-11e9-a3f9-3bc27f873b50;
 Sun, 07 Apr 2019 14:50:56 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 68C86AEE8;
 Sun,  7 Apr 2019 14:50:55 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: torvalds@linux-foundation.org
Date: Sun,  7 Apr 2019 16:50:48 +0200
Message-Id: <20190407145048.12116-1-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
Subject: [Xen-devel] [GIT PULL] xen: fixes for 5.1-rc4
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
Cc: xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com,
 linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190407145048.ADHFM5LAjE2eXSFzjfUTI1BI0GeqbRkBK3kkEPUqChw@z>

TGludXMsCgpQbGVhc2UgZ2l0IHB1bGwgdGhlIGZvbGxvd2luZyB0YWc6CgogZ2l0Oi8vZ2l0Lmtl
cm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3hlbi90aXAuZ2l0IGZvci1saW51cy01
LjFiLXJjNC10YWcKCnhlbjogZml4ZXMgZm9yIDUuMS1yYzQKCkl0IGNvbnRhaW5zIG9uZSBtaW5v
ciBmaXggYW5kIGEgc21hbGwgY2xlYW51cCBmb3IgdGhlIHhlbiBwcml2Y21kCmRyaXZlci4KCgpU
aGFua3MuCgpKdWVyZ2VuCgogYXJjaC94ODYvaW5jbHVkZS9hc20veGVuL2h5cGVyY2FsbC5oIHwg
MyArKysKIGRyaXZlcnMveGVuL3ByaXZjbWQtYnVmLmMgICAgICAgICAgICB8IDMgKy0tCiAyIGZp
bGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCkFuZHJlYSBSaWdo
aSAoMSk6CiAgICAgIHhlbjogdXNlIHN0cnVjdF9zaXplKCkgaGVscGVyIGluIGt6YWxsb2MoKQoK
RGFuIENhcnBlbnRlciAoMSk6CiAgICAgIHhlbjogUHJldmVudCBidWZmZXIgb3ZlcmZsb3cgaW4g
cHJpdmNtZCBpb2N0bAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
