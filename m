Return-Path: <SRS0=MgWH=SZ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFBA9C10F14
	for <xen-devel@archiver.kernel.org>; Tue, 23 Apr 2019 13:05:07 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B3C79206A3
	for <xen-devel@archiver.kernel.org>; Tue, 23 Apr 2019 13:05:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B3C79206A3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hIv69-00025Q-QN; Tue, 23 Apr 2019 13:04:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=hJhn=SZ=citrix.com=prvs=009aac223=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hIv69-00025L-EN
 for xen-devel@lists.xenproject.org; Tue, 23 Apr 2019 13:04:33 +0000
X-Inumbo-ID: 550fe858-65c8-11e9-9e63-277f32663a6f
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 550fe858-65c8-11e9-9e63-277f32663a6f;
 Tue, 23 Apr 2019 13:04:31 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,385,1549929600"; d="scan'208";a="84185201"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <linux-kernel@vger.kernel.org>
Date: Tue, 23 Apr 2019 15:04:15 +0200
Message-ID: <20190423130416.68935-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.17.2 (Apple Git-113)
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 1/2] xen/pvh: set xen_domain_type to HVM in
 xen_pvh_init
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
Cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T3IgZWxzZSB4ZW5fZG9tYWluKCkgcmV0dXJucyBmYWxzZSBkZXNwaXRlIHhlbl9wdmggYmVpbmcg
c2V0LgoKU2lnbmVkLW9mZi1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5j
b20+Ci0tLQpDYzogQm9yaXMgT3N0cm92c2t5IDxib3Jpcy5vc3Ryb3Zza3lAb3JhY2xlLmNvbT4K
Q2M6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KQ2M6IHhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwotLS0KIGFyY2gveDg2L3hlbi9lbmxpZ2h0ZW5fcHZoLmMgfCAxICsKIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQoKZGlmZiAtLWdpdCBhL2FyY2gveDg2L3hlbi9l
bmxpZ2h0ZW5fcHZoLmMgYi9hcmNoL3g4Ni94ZW4vZW5saWdodGVuX3B2aC5jCmluZGV4IDM1Yjc1
OTlkMmQwYi4uYmJmZmE0MDllMGU4IDEwMDY0NAotLS0gYS9hcmNoL3g4Ni94ZW4vZW5saWdodGVu
X3B2aC5jCisrKyBiL2FyY2gveDg2L3hlbi9lbmxpZ2h0ZW5fcHZoLmMKQEAgLTI3LDYgKzI3LDcg
QEAgdm9pZCBfX2luaXQgeGVuX3B2aF9pbml0KHZvaWQpCiAJdTY0IHBmbjsKIAogCXhlbl9wdmgg
PSAxOworCXhlbl9kb21haW5fdHlwZSA9IFhFTl9IVk1fRE9NQUlOOwogCXhlbl9zdGFydF9mbGFn
cyA9IHB2aF9zdGFydF9pbmZvLmZsYWdzOwogCiAJbXNyID0gY3B1aWRfZWJ4KHhlbl9jcHVpZF9i
YXNlKCkgKyAyKTsKLS0gCjIuMTcuMiAoQXBwbGUgR2l0LTExMykKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
