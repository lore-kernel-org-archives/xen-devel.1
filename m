Return-Path: <SRS0=W8S1=2O=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E76E3C2D0CF
	for <xen-devel@archiver.kernel.org>; Tue, 24 Dec 2019 13:27:13 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AEFE220643
	for <xen-devel@archiver.kernel.org>; Tue, 24 Dec 2019 13:27:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="b2NZkyXp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AEFE220643
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ijkCy-0007bo-G7; Tue, 24 Dec 2019 13:26:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zdcS=2O=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1ijkCx-0007bj-Ft
 for xen-devel@lists.xenproject.org; Tue, 24 Dec 2019 13:26:43 +0000
X-Inumbo-ID: 00e1b65e-2651-11ea-b6f1-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 00e1b65e-2651-11ea-b6f1-bc764e2007e4;
 Tue, 24 Dec 2019 13:26:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1577193994;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=tkK1Ebbcqa1hzaDWkUWDGvMZZ0GuD2YZz2FcrKd64TU=;
 b=b2NZkyXpjDVJ2LVvDbnwqi1jfFsUh0uwEXWxqQczWjPTXPUCnvcsjLsq
 wDH9BxKTfoDLVQR62xJZdCQ1bUqtKSsphWzAR9bNjlARhqOf51+0oHSxa
 2iCFot5O2xkGsVh0c+9LFz4pUtjPljy3+ocQOZczE8dZ3kedwpxOxb9+i 8=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: i9Mos5eXf20f4PkgUNgnNnxsIPgjZI/23UwFh9kdGhezvxnnJia8PpCeeFdlBTkGSgWx+ZFX/l
 taLpH0jOm+AmkUEYbirjPZ3ezERun2vlmXjzauXnU9f4QFwRfW2N7ZTO0EoASPFSCAuuYm9Nz6
 Ic1zGEDjYtU2P6iajB0MCOBlfhChdSTWJ8lPtnM9kRnnoRPBAKRc+gIs1CSQGSsnW5v/lM1eNU
 Q8N62Clw9j8wJV8JztREigQwefvytW2ggzBTIWM33md46Gg04sQCberMhd3Q4ldEQw/3kmZaXr
 TcY=
X-SBRS: 2.7
X-MesageID: 10698882
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,351,1571716800"; d="scan'208";a="10698882"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Tue, 24 Dec 2019 14:26:14 +0100
Message-ID: <20191224132616.47441-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 0/2] x86: improve assisted tlb flush and use it
 in guest mode
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGVsbG8sCgpUaGUgZm9sbG93aW5nIHNlcmllcyBhaW1zIHRvIGltcHJvdmUgdGhlIHRsYiBmbHVz
aCB0aW1lcyB3aGVuIHJ1bm5pbmcKbmVzdGVkIFhlbiwgYW5kIGl0J3Mgc3BlY2lhbGx5IGJlbmVm
aWNpYWwgd2hlbiBydW5uaW5nIGluIHNoaW0gbW9kZS4KClNlZSBwYXRjaCAjMiBmb3IgYSBjb21w
YXJpc29uIG9uIHRoZSBwZXJmb3JtYW5jZSBvZiB0aGUgTDAgYXNzaXN0ZWQKZmx1c2ggdnMgdXNp
bmcgeDJBUElDIHNob3J0aGFuZC4KClRoYW5rcywgUm9nZXIuCgpSb2dlciBQYXUgTW9ubmUgKDIp
OgogIHg4Ni9odm06IGltcHJvdmUgcGVyZm9ybWFuY2Ugb2YgSFZNT1BfZmx1c2hfdGxicwogIHg4
Ni90bGI6IHVzZSBYZW4gTDAgYXNzaXN0ZWQgVExCIGZsdXNoIHdoZW4gYXZhaWxhYmxlCgogeGVu
L2FyY2gveDg2L2d1ZXN0L3hlbi94ZW4uYyAgICB8IDExICsrKysrKysKIHhlbi9hcmNoL3g4Ni9o
dm0vaHZtLmMgICAgICAgICAgfCA1NSArKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0K
IHhlbi9hcmNoL3g4Ni9zbXAuYyAgICAgICAgICAgICAgfCAgNiArKysrCiB4ZW4vaW5jbHVkZS9h
c20teDg2L2d1ZXN0L3hlbi5oIHwgIDcgKysrKysKIDQgZmlsZXMgY2hhbmdlZCwgNjEgaW5zZXJ0
aW9ucygrKSwgMTggZGVsZXRpb25zKC0pCgotLSAKMi4yNC4xCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
