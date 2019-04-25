Return-Path: <SRS0=w6oi=S3=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80221C43219
	for <xen-devel@archiver.kernel.org>; Thu, 25 Apr 2019 15:51:18 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C2D7F20891
	for <xen-devel@archiver.kernel.org>; Thu, 25 Apr 2019 15:51:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C2D7F20891
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=eu.citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hJgeR-0002pj-Kf; Thu, 25 Apr 2019 15:51:07 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=JXZu=S3=citrix.com=prvs=011b70836=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hJgeP-0002op-N8
 for xen-devel@lists.xenproject.org; Thu, 25 Apr 2019 15:51:05 +0000
X-Inumbo-ID: ee815c5e-6771-11e9-843c-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id ee815c5e-6771-11e9-843c-bc764e045a96;
 Thu, 25 Apr 2019 15:51:04 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,394,1549929600"; d="scan'208";a="84415677"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 25 Apr 2019 16:50:55 +0100
Message-ID: <20190425155056.23145-6-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190425155056.23145-1-ian.jackson@eu.citrix.com>
References: <20190425155056.23145-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [OSSTEST PATCH 5/6] Debian: preferred arch: Apply
 setarch to sshd
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
Message-ID: <20190425155055.sazHR6gCb1zUWPH4ay17KPp9Y6AE8PkRuKysZ3lPizw@z>

TWFueSBidWlsZCBzeXN0ZW1zIChpbmNsdWRpbmcgWGVuJ3MsIGFuZCBhdXRvY29uZikgdXNlIHVu
YW1lIHRvIHRyeSB0bwpkaXNjZXJuIHRoZSBzeXN0ZW0ncyBhcmNoaXRlY3R1cmUuICBXaGVuIHJ1
bm5pbmcgaTM4NiB1c2VybGFuZCBvbiBhbgphbWQ2NCBrZXJuZWwsIHRoaXMgZ2l2ZXMgdGhlIHdy
b25nIGFuc3dlci4gIFRoZXNlIGJ1aWxkIHN5c3RlbXMgdGhlbgpnbyBvZmYgYW5kIHRyeSB0byBk
byBhIHNvcnQgb2YgY3Jvc3MgY29tcGlsZSB0aGluZywgYW5kLCBnZW5lcmFsbHksCmZhbGwgb3Zl
ci4KClRoZSB1bmFtZSAtbSB2YWx1ZSAod2hpY2ggaXMgd2hhdCBpcyBhdCBpc3N1ZSkgaXMgYW4g
aW5oZXJpdGVkIHByb2Nlc3MKcHJvcGVydHkuICBMaW51eCBwcm92aWRlcyBhIHV0aWxpdHkgYHNl
dGFyY2gnIHdoaWNoIGNoYW5nZXMgdGhpcy4gIFdlCm5lZWQgdG8gYXBwbHkgdGhpcyB0byBhbGwg
YnVpbGRzOyBhbmQgaXQgaXMgbm90IHJlYWxseSBjb252ZW5pZW50IHRvCmFkZCBhbiBhZHZlcmJp
YWwgY29tbWFuZCB0byBldmVyeSBidWlsZCB2aWEgdGhlIGV4aXN0aW5nIHNzaCBidWlsZApzaGVs
bCBydW5lIG1lY2hhbmlzbXMuCgpBIGZhaXJseSBzaW1wbGUgd2F5IHRvIGdldCB0aGUgcmlnaHQg
YmVoYXZpb3VyIGlzIHRvIHdyYXAgc3NoZAppbnN0ZWFkLiAgc3NoZCBkb2Vzbid0IG1pbmQgd2hh
dCBgcGVyc29uYWxpdHknIGl0IHNlZXMuICBSZXBsYWNpbmcKL3Vzci9iaW4vc3NoZCB3aXRoIGEg
d3JhcHBlciBzaGVsbCBzY3JpcHQgbWlnaHQgYnJlYWsKc3RhcnQtc3RvcC1kYWVtb24ncyBhdHRl
bXB0cyB0byBzaHV0IGRvd24gb3IgcmVzdGFydCBzc2hkIGJ1dCB3ZSBkb24ndApjYXJlIGFib3V0
IHRoYXQgaW4gb3NzdGVzdCAoY2VydGFpbmx5IG5vdCBvbiBidWlsZCBpbnN0YWxscywgd2hlcmUK
dGhpcyBmZWF0dXJlIGlzIHRvIGJlIHVzZWQpLgoKTm90aGluZyB1c2VzIHRoaXMgeWV0LgoKU2ln
bmVkLW9mZi1ieTogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+Ci0tLQog
T3NzdGVzdC9EZWJpYW4ucG0gfCAxMSArKysrKysrKysrLQogMSBmaWxlIGNoYW5nZWQsIDEwIGlu
c2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9Pc3N0ZXN0L0RlYmlhbi5w
bSBiL09zc3Rlc3QvRGViaWFuLnBtCmluZGV4IGFkZGFhYWQyLi44YWJkNmFlZCAxMDA2NDQKLS0t
IGEvT3NzdGVzdC9EZWJpYW4ucG0KKysrIGIvT3NzdGVzdC9EZWJpYW4ucG0KQEAgLTEzMzcsNiAr
MTMzNyw3IEBAIEVORAogICAgIG15ICRrZXJuX2FyY2hfaW5mbyA9ICR4b3B0c3tMaW51eEtlcm5Q
cmVmZXJyZWRBcmNoSW5mb307CiAgICAgIyBMaW51eEtlcm5QcmVmZXJyZWRBcmNoSW5mbyBjb250
YWlucwogICAgICMgICAgS2VybmVsX0RlYmlhbiAgICAgdGhlIERlYmlhbiBhcmNoIGZvciB0aGUg
a2VybmVsIHdlIHdvdWxkIHByZWZlcgorICAgICMgICAgVXNlcmxhbmRfc2V0YXJjaCAgcGVyc29u
YWxpdHkgdG8gcmVzdG9yZSB1c2luZyBzZXRhcmNoCiAgICAgbXkgJGtlcm5fYXJjaCA9ICRrZXJu
X2FyY2hfaW5mby0+e0tlcm5lbF9EZWJpYW59OwogICAgIGlmICgka2Vybl9hcmNoICYmCiAJJGhv
LT57RmxhZ3N9eyJhcmNoLSRye2FyY2h9In0gJiYgISRoby0+e0ZsYWdzfXsiYXJjaC0ka2Vybl9h
cmNoIn0pIHsKQEAgLTEzNTQsMTAgKzEzNTUsMTYgQEAgRU5ECiAJJGtlcm5fYXJjaCA9IHVuZGVm
OwogICAgIH0KICAgICBpZiAoJGtlcm5fYXJjaCkgewotCWxvZ20oIlVzaW5nICRrZXJuX2FyY2gg
a2VybmVsIGZvciAkcnthcmNofSB1c2VybGFuZCIpOworCW15ICRzZXRhcmNoID0gInNldGFyY2gg
JGtlcm5fYXJjaF9pbmZvLT57VXNlcmxhbmRfc2V0YXJjaH0iOworCWxvZ20oIlVzaW5nICRrZXJu
X2FyY2gga2VybmVsIGZvciAkcnthcmNofSB1c2VybGFuZCAoJHNldGFyY2gpIik7CiAJcHJlc2Vl
ZF9ob29rX2NvbW1hbmQoJGhvLCAnbGF0ZV9jb21tYW5kJywgJHNmeCwgPDxFTkQpOwogIyEvYmlu
L3NoCiBzZXQgLWV4CitjYXQgPDwnRU5EVycgPi90YXJnZXQvdXNyL3NiaW4vc3NoZC5vc3N0ZXN0
LXdyYXAKKyMhL2Jpbi9zaAorZXhlYyAkc2V0YXJjaCAvdXNyL3NiaW4vc3NoZC5kaXN0cmliICJc
JEAiCitFTkRXCitjaG1vZCBhK3ggL3RhcmdldC91c3Ivc2Jpbi9zc2hkLm9zc3Rlc3Qtd3JhcAog
aW4tdGFyZ2V0IHNoIC14ZWMgJwogICAgICMgdGhlICRye2FyY2h9IGtlcm5lbHMgZW5kIHVwIGJl
aW5nIHRoZSBkZWZhdWx0IHNvIHNodWZmbGUgdGhlbQogICAgICMgd2hlcmUgdXBkYXRlLWdydWIg
d2lsbCBub3QgZmluZCB0aGVtCkBAIC0xMzY4LDYgKzEzNzUsOCBAQCBpbi10YXJnZXQgc2ggLXhl
YyAnCiAgICAgYXB0LWdldCB1cGRhdGUKICAgICBhcHQtZ2V0IGluc3RhbGwgLWYgLXkgbGludXgt
aW1hZ2UtJGtlcm5fYXJjaAogICAgIHVwZGF0ZS1ncnViCisgICAgZHBrZy1kaXZlcnQgLS1yZW5h
bWUgL3Vzci9zYmluL3NzaGQKKyAgICBsbiAtcyBzc2hkLm9zc3Rlc3Qtd3JhcCAvdXNyL3NiaW4v
c3NoZAogJwogRU5ECiAgICAgfQotLSAKMi4xMS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
