Return-Path: <SRS0=e+jd=T7=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 590B1C04AB6
	for <xen-devel@archiver.kernel.org>; Fri, 31 May 2019 13:56:24 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 31406269DD
	for <xen-devel@archiver.kernel.org>; Fri, 31 May 2019 13:56:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 31406269DD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hWi0y-0003Xp-J6; Fri, 31 May 2019 13:56:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Qdqe=T7=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hWi0x-0003Xh-Jc
 for xen-devel@lists.xenproject.org; Fri, 31 May 2019 13:56:11 +0000
X-Inumbo-ID: d638ab58-83ab-11e9-8357-17a3966ef96d
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d638ab58-83ab-11e9-8357-17a3966ef96d;
 Fri, 31 May 2019 13:56:07 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 576FCAF10;
 Fri, 31 May 2019 13:56:06 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: torvalds@linux-foundation.org
Date: Fri, 31 May 2019 15:56:03 +0200
Message-Id: <20190531135603.3403-1-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
Subject: [Xen-devel] [GIT PULL] xen: fixes for 5.2-rc3
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

TGludXMsCgpQbGVhc2UgZ2l0IHB1bGwgdGhlIGZvbGxvd2luZyB0YWc6CgogZ2l0Oi8vZ2l0Lmtl
cm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3hlbi90aXAuZ2l0IGZvci1saW51cy01
LjJiLXJjMy10YWcKCnhlbjogZml4ZXMgZm9yIDUuMi1yYzMKCkl0IGNvbnRhaW5zIG9uZSBtaW5v
ciBjbGVhbnVwIHBhdGNoIGFuZCBhIGZpeCBmb3IgaGFuZGxpbmcgb2YgbGl2ZQptaWdyYXRpb24g
d2hlbiBydW5uaW5nIGFzIFhlbiBndWVzdC4KClRoYW5rcy4KCkp1ZXJnZW4KCiBkcml2ZXJzL3hl
bi9wdmNhbGxzLWZyb250LmMgICAgICAgICAgICAgIHwgIDQgLS0tLQogZHJpdmVycy94ZW4veGVu
YnVzL3hlbmJ1cy5oICAgICAgICAgICAgICB8ICAzICsrKwogZHJpdmVycy94ZW4veGVuYnVzL3hl
bmJ1c19kZXZfZnJvbnRlbmQuYyB8IDE4ICsrKysrKysrKysrKysrKysrKwogZHJpdmVycy94ZW4v
eGVuYnVzL3hlbmJ1c194cy5jICAgICAgICAgICB8ICA3ICsrKysrLS0KIDQgZmlsZXMgY2hhbmdl
ZCwgMjYgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKClJvc3MgTGFnZXJ3YWxsICgxKToK
ICAgICAgeGVuYnVzOiBBdm9pZCBkZWFkbG9jayBkdXJpbmcgc3VzcGVuZCBkdWUgdG8gb3BlbiB0
cmFuc2FjdGlvbnMKCll1ZUhhaWJpbmcgKDEpOgogICAgICB4ZW4vcHZjYWxsczogUmVtb3ZlIHNl
dCBidXQgbm90IHVzZWQgdmFyaWFibGUKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
