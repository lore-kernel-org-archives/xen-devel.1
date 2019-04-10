Return-Path: <SRS0=ih+i=SM=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 246EFC10F11
	for <xen-devel@archiver.kernel.org>; Wed, 10 Apr 2019 14:28:46 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EE8B220830
	for <xen-devel@archiver.kernel.org>; Wed, 10 Apr 2019 14:28:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EE8B220830
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=eu.citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hEEDI-0003Lw-IW; Wed, 10 Apr 2019 14:28:32 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xn7x=SM=citrix.com=prvs=996f5bc6d=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hEEDG-0003Kw-PD
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2019 14:28:30 +0000
X-Inumbo-ID: 88570efa-5b9c-11e9-92d7-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 88570efa-5b9c-11e9-92d7-bc764e045a96;
 Wed, 10 Apr 2019 14:25:47 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,332,1549929600"; d="scan'208";a="83227757"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 10 Apr 2019 15:24:08 +0100
Message-ID: <20190410142408.22848-63-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190410142408.22848-1-ian.jackson@eu.citrix.com>
References: <20190410142408.22848-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [OSSTEST PATCH 62/62] Switch to Debian Stretch
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
Cc: Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190410142408.6Iee-Gy21mB01AlB8nbRya9jsYs9MQsSycLq1KgutCE@z>

RnJvbTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KClNpZ25lZC1vZmYtYnk6IFdlaSBM
aXUgPHdlaS5saXUyQGNpdHJpeC5jb20+ClNpZ25lZC1vZmYtYnk6IElhbiBKYWNrc29uIDxpYW4u
amFja3NvbkBldS5jaXRyaXguY29tPgotLS0KIE9zc3Rlc3QucG0gICAgICAgIHwgMiArLQogcHJv
ZHVjdGlvbi1jb25maWcgfCAyICsrCiAyIGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwg
MSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL09zc3Rlc3QucG0gYi9Pc3N0ZXN0LnBtCmluZGV4
IDkyYjFhMGVhLi43Y2U1M2ZjYiAxMDA2NDQKLS0tIGEvT3NzdGVzdC5wbQorKysgYi9Pc3N0ZXN0
LnBtCkBAIC04Nyw3ICs4Nyw3IEBAIG91ciAlYyA9IHF3KAogCiAgICAgSW1hZ2VzIGltYWdlcwog
Ci0gICAgRGViaWFuU3VpdGUgamVzc2llCisgICAgRGViaWFuU3VpdGUgc3RyZXRjaAogICAgIERl
Ymlhbk1pcnJvclN1YnBhdGggZGViaWFuCiAKICAgICBUZXN0SG9zdEtleXBhaXJQYXRoIGlkX3Jz
YV9vc3N0ZXN0CmRpZmYgLS1naXQgYS9wcm9kdWN0aW9uLWNvbmZpZyBiL3Byb2R1Y3Rpb24tY29u
ZmlnCmluZGV4IGZhZGZlOGI5Li41YjlmNWM4MiAxMDA2NDQKLS0tIGEvcHJvZHVjdGlvbi1jb25m
aWcKKysrIGIvcHJvZHVjdGlvbi1jb25maWcKQEAgLTkwLDEyICs5MCwxNCBAQCBUZnRwTmV0Ym9v
dEdyb3VwIG9zc3Rlc3QKICMgVXBkYXRlIHdpdGggLi9tZy1kZWJpYW4taW5zdGFsbGVyLXVwZGF0
ZSgtYWxsKQogVGZ0cERpVmVyc2lvbl93aGVlenkgMjAxNi0wNi0wOAogVGZ0cERpVmVyc2lvbl9q
ZXNzaWUgMjAxOC0wNi0yNgorVGZ0cERpVmVyc2lvbl9zdHJldGNoIDIwMTgtMTEtMjcKIAogRGVi
aWFuU25hcHNob3RCYWNrcG9ydHNfamVzc2llIGh0dHA6Ly9zbmFwc2hvdC5kZWJpYW4ub3JnL2Fy
Y2hpdmUvZGViaWFuLzIwMTkwMjA2VDIxMTMxNFovCiAKICMgRm9yIElTTyBpbnN0YWxscwogRGVi
aWFuSW1hZ2VWZXJzaW9uX3doZWV6eSA3LjIuMAogRGViaWFuSW1hZ2VWZXJzaW9uX2plc3NpZSA4
LjIuMAorRGViaWFuSW1hZ2VWZXJzaW9uX3N0cmV0Y2ggOS40LjAKIAogIyBUaGVzZSBzaG91bGQg
bm9ybWFsbHkgYmUgdGhlIHNhbWUuCiAjIFVwZGF0ZSB3aXRoIC4vbWctY3B1LW1pY3JvY29kZS11
cGRhdGUKLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
