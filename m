Return-Path: <SRS0=ih+i=SM=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73595C282CE
	for <xen-devel@archiver.kernel.org>; Wed, 10 Apr 2019 14:26:16 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4EBDA20850
	for <xen-devel@archiver.kernel.org>; Wed, 10 Apr 2019 14:26:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4EBDA20850
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=eu.citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hEEAs-0007ns-Ot; Wed, 10 Apr 2019 14:26:02 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xn7x=SM=citrix.com=prvs=996f5bc6d=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hEEAZ-00072B-O6
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2019 14:25:43 +0000
X-Inumbo-ID: 851507c6-5b9c-11e9-92d7-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 851507c6-5b9c-11e9-92d7-bc764e045a96;
 Wed, 10 Apr 2019 14:25:42 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,332,1549929600"; d="scan'208";a="83227754"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 10 Apr 2019 15:24:06 +0100
Message-ID: <20190410142408.22848-61-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190410142408.22848-1-ian.jackson@eu.citrix.com>
References: <20190410142408.22848-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [OSSTEST PATCH 60/62] Debian: Fix
 /lib/udev/ifupdown-hotplug in guests from debootstrap
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
Cc: Ian Jackson <ian.jackson@eu.citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190410142406.wQge9EhOwEAbb1YQIIZmWv85kY968CVDM7jt71AyciA@z>

VGhlIGlmdXBkb3duLWhvdHBsdWcgcHJvYmxlbSBqdXN0IGRlc2NyaWJlZCBhZmZlY3RzIGd1ZXN0
cyB0b28uCgpFbXBpcmljYWxseSwgdGhpcyBvY2N1cnMgb25seSB3aXRoIHRoZSBndWVzdHMgZnJv
bSB4ZW4tdG9vbHMuICBJbiBteQpvc3N0ZXN0IHN0cmV0Y2ggc2VyaWVzIGRldmVsb3BtZW50IHRl
c3RzIHRoaXMgcmVzdWx0ZWQgaW4gb2NjYXNpb25hbApmYWlsdXJlcyBvZiB0cy1ndWVzdC1zdGFy
dC4gIFRoZSBwcm9ibGVtIGlzIG5vdCBkZXRlcm1pbmlzdGljOyBhbmQgaXQKbWF5IGJlIHRoYXQg
aXQgaXMgYSByYWNlIGJldHdlZW4gdGhlIGd1ZXN0J3MgcmFuZG9tIGRoY3AgcmV0cnkgYW5kCm9z
c3Rlc3QncyB0aW1lb3V0LCBvciBzb21ldGhpbmcuICBUaGUgcmFjZSBhZmZlY3RlZCBib3RoIHg4
NiBhbmQgQVJNLgoKSSBjb25qZWN0dXJlIHRoYXQgaXQgb25seSBhZmZlY3RzIHhlbi10b29scyBj
cmVhdGVkIGd1ZXN0cyBiZWNhdXNlCnRob3NlIGd1ZXN0cyB1c2Ugc3lzdmluaXQuICBQcmVzdW1h
Ymx5IHRoZSBvdGhlciBndWVzdHMgaGF2ZSBzeXN0ZW1kCndoaWNoIGhhcyBzb21lIGRpZmZlcmVu
dCBvcmRlcmluZy4gIEkgY29uamVjdHVyZSB0aGF0IHRoZSBzeXN2aW5pdApib290IGFycmFuZ2Vt
ZW50cyB3ZXJlIGRhbWFnZWQgYnkgc29tZSBjaGFuZ2VzIG1hZGUgaW4gc3RyZXRjaCB0bwpzaGFy
ZWQgY29tcG9uZW50cyAodWRldiwgcHJvYmFibHkpIHRvIHN1cHBvcnQgc3lzdGVtZC4KCkFuIGFs
dGVybmF0aXZlIGV4cGxhbmF0aW9uIGZvciBzZWVpbmcgdGhlIGZhaWx1cmUgb25seSB3aXRoIHhl
bi10b29scwpjcmVhdGVkIGd1ZXN0cyBtaWdodCBiZSB0aGF0IGFsbCBndWVzdHMgYXJlIGFmZmVj
dGVkLCBidXQgb25seQp4ZW4tdG9vbHMgY3JlYXRlZCBndWVzdHMgYXJlIGJvb3RlZCB3aXRoIGEg
c2hvcnQgdGltZW91dDsgd2hlcmVhcyB0aGUKZC1pIGNyZWF0ZWQgb25lcyBoYXZlIGEgbG9uZyB0
aW1lb3V0IGZvciBmaXJzdGJvb3QgYXQgbGVhc3QuICBJIGRvbid0CmJlbGlldmUgdGhpcyB0aGVv
cnkgYmVjYXVzZSBhbGwgZ3Vlc3RzIGFyZSByZXN0YXJ0ZWQgd2l0aAp0cy1ndWVzdC1zdGFydCBh
bmQgYSBzaG9ydCB0aW1lb3V0LgoKU286IGluIHRzLWRlYmlhbi1maXh1cCwgZXhlY3V0ZSB0aGUg
c2VkIHJ1bmUgdG8gZml4Ci9saWIvdWRldi9pZnVwZG93bi1ob3RwbHVnLiAgVGhpcyB0aGVuIGhh
cHBlbnMgYmVmb3JlIGZpcnN0IGJvb3QuCgpEZWJpYW4gZ3Vlc3RzIGluc3RhbGxlZCB2aWEgZC1p
IGFyZSBub3QgYWZmZWN0ZWQgYnkgdGhpcyBwYXRjaC4KClNpZ25lZC1vZmYtYnk6IElhbiBKYWNr
c29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPgotLS0KIHRzLWRlYmlhbi1maXh1cCB8IDIg
KysKIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS90cy1kZWJp
YW4tZml4dXAgYi90cy1kZWJpYW4tZml4dXAKaW5kZXggN2Q5ZDAzOTguLmZlZjk4MzZlIDEwMDc1
NQotLS0gYS90cy1kZWJpYW4tZml4dXAKKysrIGIvdHMtZGViaWFuLWZpeHVwCkBAIC0yMTIsNiAr
MjEyLDggQEAgdGFyZ2V0X2NtZF9yb290KCRobywgPDxFTkQuZGViaWFuX292ZXJsYXlzX2ZpeHVw
X2NtZCgkaG8sICRtb3VudHBvaW50KSk7CiBzZXQgLWV4CiBFTkQKIAordGFyZ2V0X2NtZF9yb290
KCRobywgZGViaWFuX2RoY3Bfcm9mc19maXgoJGhvLCAkbW91bnRwb2ludCkpOworCiBjb25zb2xl
KCk7CiBmaWxlc3lzdGVtcygpOwogb3RoZXJmaXh1cGNmZygpOwotLSAKMi4xMS4wCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
