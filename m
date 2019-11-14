Return-Path: <SRS0=jwRU=ZG=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BAF2C432C3
	for <xen-devel@archiver.kernel.org>; Thu, 14 Nov 2019 08:28:23 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 39EAA206EF
	for <xen-devel@archiver.kernel.org>; Thu, 14 Nov 2019 08:28:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 39EAA206EF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iVATl-00067X-Uq; Thu, 14 Nov 2019 08:27:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=RDJJ=ZG=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iVATl-00067Q-9U
 for xen-devel@lists.xenproject.org; Thu, 14 Nov 2019 08:27:49 +0000
X-Inumbo-ID: a065944c-06b8-11ea-b678-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a065944c-06b8-11ea-b678-bc764e2007e4;
 Thu, 14 Nov 2019 08:27:42 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id B8AC7B1BF;
 Thu, 14 Nov 2019 08:27:41 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Date: Thu, 14 Nov 2019 09:27:37 +0100
Message-Id: <20191114082739.7928-1-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
Subject: [Xen-devel] [PATCH v2 0/2] xen: make more debugger support code
 conditional
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
Cc: Juergen Gross <jgross@suse.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

U3VwcG9ydCBmb3IgZGVidWdnaW5nIHRoZSBoeXBlcnZpc29yIG9mIGd1ZXN0cyB2aWEgZ2RiL2dk
YnN4IHNob3VsZCBiZQpjb25maWd1cmFibGUuCgpDaGFuZ2VzIGluIFYyOgotIHNwbGl0IHN1cHBv
cnQgZm9yIGdkYnN0dWIgYW5kIGdkYnN4IChBbmRyZXcgQ29vcGVyKQoKSnVlcmdlbiBHcm9zcyAo
Mik6CiAgeGVuOiBwdXQgbW9yZSBjb2RlIHVuZGVyIENPTkZJR19DUkFTSF9ERUJVRwogIHhlbjog
bWFrZSBnZGJzeCBzdXBwb3J0IGNvbmZpZ3VyYWJsZQoKIHhlbi9LY29uZmlnLmRlYnVnICAgICAg
ICAgICAgICB8ICA3ICsrKysrKwogeGVuL2FyY2gveDg2L0tjb25maWcgICAgICAgICAgIHwgIDEg
LQogeGVuL2FyY2gveDg2L01ha2VmaWxlICAgICAgICAgIHwgIDIgKy0KIHhlbi9hcmNoL3g4Ni9k
ZWJ1Zy5jICAgICAgICAgICB8IDUyICstLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLQogeGVuL2FyY2gveDg2L2RvbWN0bC5jICAgICAgICAgIHwgIDQgKysrKwogeGVuL2Nv
bW1vbi9LY29uZmlnICAgICAgICAgICAgIHwgIDMgLS0tCiB4ZW4vY29tbW9uL2RvbWFpbi5jICAg
ICAgICAgICAgfCAgMiArLQogeGVuL2luY2x1ZGUvYXNtLXg4Ni9kZWJ1Z2dlci5oIHwgMzIgKysr
KysrKysrKysrKysrKy0tLS0tLS0tLS0KIHhlbi9pbmNsdWRlL3hlbi9zY2hlZC5oICAgICAgICB8
ICA0ICsrKysKIDkgZmlsZXMgY2hhbmdlZCwgMzggaW5zZXJ0aW9ucygrKSwgNjkgZGVsZXRpb25z
KC0pCgotLSAKMi4xNi40CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
