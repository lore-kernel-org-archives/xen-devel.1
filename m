Return-Path: <SRS0=7THE=S4=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46C0FC43218
	for <xen-devel@archiver.kernel.org>; Fri, 26 Apr 2019 16:41:33 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1E39720693
	for <xen-devel@archiver.kernel.org>; Fri, 26 Apr 2019 16:41:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1E39720693
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=eu.citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hK3uU-000825-Kl; Fri, 26 Apr 2019 16:41:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=6UZT=S4=citrix.com=prvs=0129f9400=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hK3uT-000820-LH
 for xen-devel@lists.xenproject.org; Fri, 26 Apr 2019 16:41:13 +0000
X-Inumbo-ID: 191018e2-6842-11e9-96ec-c7ae250bfa6f
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 191018e2-6842-11e9-96ec-c7ae250bfa6f;
 Fri, 26 Apr 2019 16:41:11 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,398,1549929600"; d="scan'208";a="84519646"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 26 Apr 2019 17:39:47 +0100
Message-ID: <20190426164002.22381-1-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [OSSTEST PATCH 00/15] Do armhf kernel builds on amd64
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
Cc: Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190426163947.CQGcecQzwmoZWKwdP0OavKypHfUWUKjqv6IsduhTkR8@z>

Q3Jvc3MgYnVpbGRpbmcgdGhpcyB3aWxsIGJlIG11Y2ggbXVjaCBmYXN0ZXIgYW5kIGhlbHAgd2l0
aCBvdXIgc2V2ZXJlCmFybWhmIHJlc291cmNlIHNob3J0YWdlLiAgVG8gYWNoaWV2ZSB0aGlzIGl0
IGlzIG5lY2Vzc2FyeSB0byBjbGVhbiB1cApzb21lIHRlY2huaWNhbCBkZWJ0LCBzbyB0aGF0IHdl
IGNhbiBzZXBhcmF0ZWx5IGNvbnRyb2wgaG9zdAphcmNoaXRlY3R1cmUsIHJhdGhlciB0aGFuIGp1
c3QgdXNpbmcgdGhlIGpvYidzIG1haW4gJHJ7YXJjaH0uCgpJYW4gSmFja3NvbiAoMTUpOgogIFRl
c3RTdXBwb3J0OiB0YXJnZXRfdmFyOiBSZWZhY3RvciB0byBhbGxvdyBmb3IgYW5vdGhlciBob3N0
IGNhc2UKICBUZXN0U3VwcG9ydDogdGFyZ2V0X3ZhcjogVXNlIGhvc3RfViBmb3IgaG9zdCB2YXJp
YWJsZXMKICBhcmNoIHJlcGx1bWJpbmc6IHRzLWhvc3QtaW5zdGFsbDogTW92ZSAka2Vybl9hcmNo
X2luZm8gc2V0dGluZwogIGFyY2ggcmVwbHVtYmluZzogUHJvdmlkZSAkaG8tPntBcmNofSBhbmQg
JGdoby0+e0FyY2h9CiAgYXJjaCByZXBsdW1iaW5nOiB0cy1kZWJpYW4tZGktaW5zdGFsbDogUmVt
b3ZlIHVuaWRpb21hdGljIHsgfQogIGFyY2ggcmVwbHVtYmluZzogdHMtbWVtZGlzay10cnktYXBw
ZW5kOiBSZW1vdmUgdW5pZGlvbWF0aWMgIiAiCiAgYXJjaCByZXBsdW1iaW5nOiBSZXBsYWNlIG1h
bnkgJHJ7YXJjaH0gd2l0aCAkW2ddaG8tPntBcmNofQogIGFyY2ggcmVwbHVtYmluZzogbWFrZS1m
bGlnaHQ6IEZpeCAkcnthcmNofSBjb21tZW50CiAgYXJjaCByZXBsdW1iaW5nOiB0cy1kZWJpYW4t
ZGktaW5zdGFsbDogVXNlICRnaG8tPntBcmNofQogIHRzLWtlcm5lbC1idWlsZDogSW50cm9kdWNl
IGNtZCgpCiAgY3Jvc3MgYnVpbGRzOiB0cy1rZXJuZWwtYnVpbGQ6IFN1cHBvcnQgY3Jvc3MgdGFy
Z2V0IGFybWhmCiAgY3Jvc3MgYnVpbGRzOiBtZmktY29tbW9uOiBCcmVhayBvdXQgc2V0X2J1aWxk
X2hvc3RmbGFncwogIGNyb3NzIGJ1aWxkczogbWZpLWNvbW1vbjogUHJlcGFyZSBmb3Iga2VybmVs
IGNyb3NzIGJ1aWxkaW5nCiAgY3Jvc3MgYnVpbGRzOiBCdWlsZCBhcm1oZiBrZXJuZWxzIG9uIGFt
ZDY0IGhvc3RzCiAgdHMta2VybmVsLWJ1aWxkOiBNb3ZlIG1haW4gcHJvZ3JhbSB0byBib3R0b20g
b2Ygc2NyaXB0CgogT3NzdGVzdC9EZWJpYW4ucG0gICAgICB8IDE0ICsrKysrLS0tLS0tCiBPc3N0
ZXN0L1Rlc3RTdXBwb3J0LnBtIHwgMjYgKysrKysrKysrKysrKy0tLS0tLS0KIG1ha2UtZmxpZ2h0
ICAgICAgICAgICAgfCAgNCArKy0tCiBtZmktY29tbW9uICAgICAgICAgICAgIHwgMzkgKysrKysr
KysrKysrKysrKysrKysrKysrKystLS0tCiB0cy1kZWJpYW4tZGktaW5zdGFsbCAgIHwgIDYgKyst
LS0KIHRzLWRlYmlhbi1pbnN0YWxsICAgICAgfCAgMiArLQogdHMtZnJlZWJzZC1idWlsZCAgICAg
ICB8ICAyICstCiB0cy1ob3N0LWluc3RhbGwgICAgICAgIHwgMjQgKysrKysrKysrKysrLS0tLS0t
LQogdHMta2VybmVsLWJ1aWxkICAgICAgICB8IDY0ICsrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKy0tLS0tLS0tLS0tLS0tLS0tCiB0cy1tZW1kaXNrLXRyeS1hcHBlbmQgIHwgIDIgKy0K
IHRzLXhlbi1idWlsZC1wcmVwICAgICAgfCAgNCArKy0tCiB0cy14ZW4taW5zdGFsbCAgICAgICAg
IHwgIDggKysrLS0tLQogMTIgZmlsZXMgY2hhbmdlZCwgMTMyIGluc2VydGlvbnMoKyksIDYzIGRl
bGV0aW9ucygtKQoKLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
