Return-Path: <SRS0=ZD/N=Z2=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C97A9C43603
	for <xen-devel@archiver.kernel.org>; Wed,  4 Dec 2019 09:36:12 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A24BE206DF
	for <xen-devel@archiver.kernel.org>; Wed,  4 Dec 2019 09:36:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A24BE206DF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dingwall.me.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1icR4j-000391-DG; Wed, 04 Dec 2019 09:36:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Fd9d=Z2=dingwall.me.uk=james@srs-us1.protection.inumbo.net>)
 id 1icR4i-00038v-2v
 for xen-devel@lists.xenproject.org; Wed, 04 Dec 2019 09:36:00 +0000
X-Inumbo-ID: 78d03f74-1679-11ea-9c09-bc764e2007e4
Received: from know-smtprelay-omc-1.server.virginmedia.net (unknown
 [80.0.253.65]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 78d03f74-1679-11ea-9c09-bc764e2007e4;
 Wed, 04 Dec 2019 09:35:56 +0000 (UTC)
Received: from mail0.xen.dingwall.me.uk ([82.47.84.47]) by cmsmtp with ESMTPA
 id cR4diY7jaxs8ecR4eiohNM; Wed, 04 Dec 2019 09:35:56 +0000
X-Originating-IP: [82.47.84.47]
X-Authenticated-User: james.dingwall@blueyonder.co.uk
X-Spam: 0
X-Authority: v=2.3 cv=L98zvdb8 c=1 sm=1 tr=0 a=0bfgdX8EJi0Cr9X0x0jFDA==:117
 a=0bfgdX8EJi0Cr9X0x0jFDA==:17 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19
 a=xqWC_Br6kY4A:10 a=pxVhFHJ0LMsA:10 a=5IRWAbXhAAAA:8 a=mRPDriDQJ0hduQnMumMA:9
 a=xo7gz2vLY8DhO4BdlxfM:22
Received: from localhost (localhost [IPv6:::1])
 by mail0.xen.dingwall.me.uk (Postfix) with ESMTP id E713A159422;
 Wed,  4 Dec 2019 09:27:41 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at dingwall.me.uk
Received: from mail0.xen.dingwall.me.uk ([127.0.0.1])
 by localhost (mail0.xen.dingwall.me.uk [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DIq7iu0M9xbk; Wed,  4 Dec 2019 09:27:41 +0000 (UTC)
Received: from behemoth.dingwall.me.uk (behemoth.dingwall.me.uk [192.168.1.5])
 by dingwall.me.uk (Postfix) with ESMTP id 94175159416;
 Wed,  4 Dec 2019 09:27:41 +0000 (UTC)
Received: by behemoth.dingwall.me.uk (Postfix, from userid 1000)
 id 9A520140E1B; Wed,  4 Dec 2019 09:27:41 +0000 (UTC)
From: james-xen@dingwall.me.uk
To: xen-devel@lists.xenproject.org
Date: Wed,  4 Dec 2019 09:27:38 +0000
Message-Id: <20191204092739.18177-4-james-xen@dingwall.me.uk>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191204092739.18177-1-james-xen@dingwall.me.uk>
References: <20191204092739.18177-1-james-xen@dingwall.me.uk>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfFbKXe4h9U4sHtQw4v3QuvDrKLs+jDlRDl3PnRwK5sYfjFHy2JmrkLM1TmHYBeDkHyYahSKxz7nSwtkpaxoz10vl6jKpDkI8g7/fSb5sl3ujPm6GaAUo
 TUdmbkj2H5CP9mAeq3gZCFTiETlOaqNPQKOvJRiq/zSnqLu6Y3aVQlyaEOqC9EqLuyFqE2ODdz24l9ZbyL/f2irqFCsAWf1ZdDskZyLI0b9qAoxPzN9TKrWU
 moZUZs2DrXEmE0UG0+IfZ3sWOjPdsPf+Yxgmchox4lg=
Subject: [Xen-devel] [PATCH 3/4] xenstored logging: send trace messages to
 syslog
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
Cc: wei.liu2@citrix.com, ian.jackson@eu.citrix.com,
 James Dingwall <james@dingwall.me.uk>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogSmFtZXMgRGluZ3dhbGwgPGphbWVzQGRpbmd3YWxsLm1lLnVrPgoKVW5jb25kaXRpb25h
bGx5IG9wZW5sb2coKSBzaW5jZSB3ZSBhbGxvdyB0cmFjZXN5c2xvZyB0byBiZSBjaGFuZ2VkIGF0
IHJ1bnRpbWUuCk1vZGlmeSB0aGUgdHJhY2UoKSBjYWxsIHRvIHNlbmQgbWVzc2FnZXMgdG8gdnN5
c2xvZygpIHdoZW4gdHJhY2VzeXNsb2cgaXMKZW5hYmxlZC4KCk5vdGUgc29tZSB0cmFjZSgpIG1l
c3NhZ2VzIGNvbWUgaW4gc2V2ZXJhbCBjYWxscyBiZWZvcmUgdGhlICdcbicuICBUaGlzIHdvcmtz
CndlbGwgd2hlbiB0aGUgb3V0cHV0IGlzIGEgZmlsZSBzdHJlYW0gYnV0IG1heSBub3Qgc3VpdCB2
c3lzbG9nKCkgcXVpdGUgYXMgd2VsbC4KUHJpbWFyaWx5IHRoaXMgZmVhdHVyZSBpcyBmb3IgeGVu
c3RvcmVkIGluIGEgc3R1YmRvbSB3aGljaCBkb2Vzbid0IHdyYXAgdGhlCm1lc3NhZ2UgdW50aWwg
J1xuJyBzbyBubyBhdHRlbXB0IHRvIGNvYWxlc2NlIHRyYWNlKCkgY2FsbHMgdW50aWwgJ1xuJyBp
cwptYWRlLiAgKENvdWxkIHRyYWNlKCkgdXNlIHZmcHJpbnRmKCkgdG8gd3JpdGUgdG8gdGhlIGxv
ZyBmaWxlPykKLS0tCiB0b29scy94ZW5zdG9yZS94ZW5zdG9yZWRfY29yZS5jIHwgMTMgKysrKysr
KysrLS0tLQogMSBmaWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkK
CmRpZmYgLS1naXQgYS90b29scy94ZW5zdG9yZS94ZW5zdG9yZWRfY29yZS5jIGIvdG9vbHMveGVu
c3RvcmUveGVuc3RvcmVkX2NvcmUuYwppbmRleCBkMGIzODNiZWNjLi41MzIwZGIyNDk5IDEwMDY0
NAotLS0gYS90b29scy94ZW5zdG9yZS94ZW5zdG9yZWRfY29yZS5jCisrKyBiL3Rvb2xzL3hlbnN0
b3JlL3hlbnN0b3JlZF9jb3JlLmMKQEAgLTg5LDcgKzg5LDcgQEAgc3RhdGljIGNvbnN0IGNoYXIg
KnNvY2ttc2dfc3RyaW5nKGVudW0geHNkX3NvY2ttc2dfdHlwZSB0eXBlKTsKIAkJY2hhciAqcyA9
IHRhbGxvY19hc3ByaW50ZihOVUxMLCBfX1ZBX0FSR1NfXyk7CQlcCiAJCWlmIChzKSB7CQkJCQkJ
XAogCQkJdHJhY2UoIiVzXG4iLCBzKTsJCQkJXAotCQkJc3lzbG9nKExPR19FUlIsICIlcyIsICBz
KTsJCQlcCisJCQlzeXNsb2coTE9HX0VSUiwgIiVzXG4iLCBzKTsJCQlcCiAJCQl0YWxsb2NfZnJl
ZShzKTsJCQkJCVwKIAkJfSBlbHNlIHsJCQkJCQlcCiAJCQl0cmFjZSgidGFsbG9jIGZhaWx1cmUg
ZHVyaW5nIGxvZ2dpbmdcbiIpOwlcCkBAIC0xMTAsNiArMTEwLDEyIEBAIHZvaWQgdHJhY2UoY29u
c3QgY2hhciAqZm10LCAuLi4pCiAJY2hhciBzYnVmWzEwMjRdOwogCWludCByZXQsIGR1bW15Owog
CisJaWYgKHRyYWNlc3lzbG9nKSB7CisJCXZhX3N0YXJ0KGFyZ2xpc3QsIGZtdCk7CisJCXZzeXNs
b2coTE9HX0RFQlVHLCBmbXQsIGFyZ2xpc3QpOworCQl2YV9lbmQoYXJnbGlzdCk7CisJfQorCiAJ
aWYgKHRyYWNlZmQgPCAwKQogCQlyZXR1cm47CiAKQEAgLTE5ODcsMTAgKzE5OTMsOSBAQCBpbnQg
bWFpbihpbnQgYXJnYywgY2hhciAqYXJndltdKQogCW1rZGlyKHhzX2RhZW1vbl9ydW5kaXIoKSwg
MDc1NSk7CiAJbWtkaXIoeHNfZGFlbW9uX3Jvb3RkaXIoKSwgMDc1NSk7CiAKLQlpZiAoZG9mb3Jr
KSB7Ci0JCW9wZW5sb2coInhlbnN0b3JlZCIsIDAsIExPR19EQUVNT04pOworCW9wZW5sb2coInhl
bnN0b3JlZCIsIDAsIExPR19EQUVNT04pOworCWlmIChkb2ZvcmspCiAJCWRhZW1vbml6ZSgpOwot
CX0KIAlpZiAocGlkZmlsZSkKIAkJd3JpdGVfcGlkZmlsZShwaWRmaWxlKTsKIAotLSAKMi4yNC4w
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
