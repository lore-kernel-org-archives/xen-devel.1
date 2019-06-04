Return-Path: <SRS0=m2Ej=UD=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A7ADC282CE
	for <xen-devel@archiver.kernel.org>; Tue,  4 Jun 2019 19:51:52 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 508202070D
	for <xen-devel@archiver.kernel.org>; Tue,  4 Jun 2019 19:51:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 508202070D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hYFT3-0006gc-Ct; Tue, 04 Jun 2019 19:51:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=KH14=UD=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hYFT2-0006gX-Fn
 for xen-devel@lists.xenproject.org; Tue, 04 Jun 2019 19:51:32 +0000
X-Inumbo-ID: 24e3aace-8702-11e9-a857-dbf0ece6b4ef
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 24e3aace-8702-11e9-a857-dbf0ece6b4ef;
 Tue, 04 Jun 2019 19:51:29 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=23.29.105.83; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 23.29.105.83 as
 permitted sender) identity=mailfrom; client-ip=23.29.105.83;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:23.29.105.83 ip4:162.221.156.50 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=23.29.105.83; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: TZHocZaHXNdUlZmHfG2EITJgW70sNL8FFZ1B1V1l5TzkM98lXU/OxGmZhum8YtgytWT4lhJB0W
 udZQAaNVTP8vi8mdU7ivgMjxrzBjy3waN7BMFudH/NS3NLwCIdjLDZ6FsWYfLWFCQChCI/fIXr
 U4oFCMzCCaiBzPB8NcELHy1ydHW3MULazLJGURPgTHMfbH53t9maK/4Lp9wzvunaAymJeCN4b3
 RvP1PvBdrWFSReU2LNBGkrvAgq49ozlMXbtpuGPD8WEDtLswAdxiwZJfGvU4xThUbzXFj4Dn5X
 Jkc=
X-SBRS: 2.7
X-MesageID: 1323681
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,550,1549947600"; 
   d="scan'208";a="1323681"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Tue, 4 Jun 2019 20:51:23 +0100
Message-ID: <1559677885-10731-1-git-send-email-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 0/2] libx86: Fuzzing harness
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Sergey Dyasli <sergey.dyasli@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlc2UgYXJlIHRoZSBmaW5hbCBwaWVjZXMgdG8gZ2V0dGluZyB0aGUgZnV6emluZyBoYXJuZXNz
IHdvcmtpbmcgY29ycmVjdGx5LgoKSSBhY2NpZGVudGFsbHkgbGVmdCBBRkwgcnVubmluZyBmb3Ig
YSB3ZWVrIHdoaWxlIEkgd2FzIHRyYXZlbGxpbmcsIHNvIHRoaXMKY2VydGlmaWVkICI4ZCAxNWgg
Y3Jhc2gtZnJlZSIuCgpBbmRyZXcgQ29vcGVyICgyKToKICBsaWJ4ODY6IEhlbHBlciBmb3IgY2xl
YXJpbmcgb3V0LW9mLXJhbmdlIENQVUlEIGxlYXZlcwogIHRvb2xzL2Z1eno6IEFkZCBhIGNwdS1w
b2xpY3kgZnV6emluZyBoYXJuZXNzCgogdG9vbHMvZnV6ei9jcHUtcG9saWN5Ly5naXRpZ25vcmUg
ICAgICAgICAgfCAgIDEgKwogdG9vbHMvZnV6ei9jcHUtcG9saWN5L01ha2VmaWxlICAgICAgICAg
ICAgfCAgMjggKysrKysKIHRvb2xzL2Z1enovY3B1LXBvbGljeS9hZmwtcG9saWN5LWZ1enplci5j
IHwgMTg3ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwogdG9vbHMvdGVzdHMvY3B1LXBv
bGljeS90ZXN0LWNwdS1wb2xpY3kuYyAgfCAxNjEgKysrKysrKysrKysrKysrKysrKysrKysrLQog
eGVuL2luY2x1ZGUveGVuL2xpYi94ODYvY3B1aWQuaCAgICAgICAgICAgfCAgMTYgKysrCiB4ZW4v
bGliL3g4Ni9jcHVpZC5jICAgICAgICAgICAgICAgICAgICAgICB8ICA2NiArKysrKysrKysrLQog
eGVuL2xpYi94ODYvcHJpdmF0ZS5oICAgICAgICAgICAgICAgICAgICAgfCAgIDEgKwogNyBmaWxl
cyBjaGFuZ2VkLCA0NTQgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKIGNyZWF0ZSBtb2Rl
IDEwMDY0NCB0b29scy9mdXp6L2NwdS1wb2xpY3kvLmdpdGlnbm9yZQogY3JlYXRlIG1vZGUgMTAw
NjQ0IHRvb2xzL2Z1enovY3B1LXBvbGljeS9NYWtlZmlsZQogY3JlYXRlIG1vZGUgMTAwNjQ0IHRv
b2xzL2Z1enovY3B1LXBvbGljeS9hZmwtcG9saWN5LWZ1enplci5jCgotLSAKMi4xLjQKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
