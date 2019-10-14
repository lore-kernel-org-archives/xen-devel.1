Return-Path: <SRS0=i1rf=YH=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 534F1ECE58D
	for <xen-devel@archiver.kernel.org>; Mon, 14 Oct 2019 09:09:33 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 32193207FF
	for <xen-devel@archiver.kernel.org>; Mon, 14 Oct 2019 09:09:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 32193207FF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iJwM0-0005np-0V; Mon, 14 Oct 2019 09:09:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=XCkI=YH=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iJwLy-0005nY-7w
 for xen-devel@lists.xenproject.org; Mon, 14 Oct 2019 09:09:22 +0000
X-Inumbo-ID: 4aea7209-ee62-11e9-9375-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4aea7209-ee62-11e9-9375-12813bfff9fa;
 Mon, 14 Oct 2019 09:09:14 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id C447DB64B;
 Mon, 14 Oct 2019 09:09:13 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Mon, 14 Oct 2019 11:09:08 +0200
Message-Id: <20191014090910.9701-1-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
Subject: [Xen-devel] [PATCH 0/2] xen/netback: bug fix and cleanup
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
Cc: Juergen Gross <jgross@suse.com>, Wei Liu <wei.liu@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, "# 3 . 12" <stable@vger.kernel.org>,
 Paul Durrant <paul@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T25lIGJ1Z2ZpeCAocGF0Y2ggMSkgSSBzdHVtYmxlZCBvdmVyIHdoaWxlIGRvaW5nIGEgY2xlYW51
cCAocGF0Y2ggMikKb2YgdGhlIHhlbi1uZXRiYWNrIGluaXQvZGVpbml0IGNvZGUuCgpKdWVyZ2Vu
IEdyb3NzICgyKToKICB4ZW4vbmV0YmFjazogZml4IGVycm9yIHBhdGggb2YgeGVudmlmX2Nvbm5l
Y3RfZGF0YSgpCiAgeGVuL25ldGJhY2s6IGNsZWFudXAgaW5pdCBhbmQgZGVpbml0IGNvZGUKCiBk
cml2ZXJzL25ldC94ZW4tbmV0YmFjay9pbnRlcmZhY2UuYyB8IDExNSArKysrKysrKysrKysrKysr
Ky0tLS0tLS0tLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA1NCBpbnNlcnRpb25zKCspLCA2
MSBkZWxldGlvbnMoLSkKCi0tIAoyLjE2LjQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
