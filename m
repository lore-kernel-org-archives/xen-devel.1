Return-Path: <SRS0=mnwC=3K=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82222C2D0CE
	for <xen-devel@archiver.kernel.org>; Tue, 21 Jan 2020 10:13:50 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5A27420882
	for <xen-devel@archiver.kernel.org>; Tue, 21 Jan 2020 10:13:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5A27420882
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1itqXN-0004hF-J6; Tue, 21 Jan 2020 10:13:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=4mp0=3K=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1itqXN-0004h9-0g
 for xen-devel@lists.xenproject.org; Tue, 21 Jan 2020 10:13:33 +0000
X-Inumbo-ID: a6fe2932-3c36-11ea-9fd7-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a6fe2932-3c36-11ea-9fd7-bc764e2007e4;
 Tue, 21 Jan 2020 10:13:22 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 05D9DB302;
 Tue, 21 Jan 2020 10:13:21 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Date: Tue, 21 Jan 2020 11:12:59 +0100
Message-Id: <20200121101301.421-1-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
Subject: [Xen-devel] [PATCH v3 0/2] xen: fix CONFIG_DEBUG_LOCKS
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
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Q09ORklHX0RFQlVHX0xPQ0tTIGlzIHVzaW5nIEFTU0VSVCgpIGZvciBjYXRjaGluZyBpc3N1ZXMg
bWFraW5nIGl0CmRlcGVuZCBvbiBDT05GSUdfREVCVUcuCgpUaGlzIHNlcmllcyBmaXhlcyB0aGF0
IGJ5IHVzaW5nIEJVR19PTigpIGluc3RlYWQuIEluIG9yZGVyIG5vdCB0byBsb3NlCnRoZSByYXRo
ZXIgbmljZSBkZWJ1Z2dpbmcgaW5mb3JtYXRpb24gd2hpY2ggY29uZGl0aW9uIHdhcyBoaXQgYWRk
IGEKY29uZmlnIG9wdGlvbiB0byBpbmNsdWRlIGEgbWVzc2FnZSBzaW1pbGFyIHRvIHRoZSBvbmUg
QVNTRVJUKCkgaXMKcHJpbnRpbmcgaW4gY2FzZSBvZiBCVUdfT04oKSB0cmlnZ2VyaW5nLgoKSnVl
cmdlbiBHcm9zcyAoMik6CiAgeGVuOiBhZGQgY29uZmlnIG9wdGlvbiB0byBpbmNsdWRlIGZhaWxp
bmcgY29uZGl0aW9uIGluIEJVR19PTigpCiAgICBtZXNzYWdlCiAgeGVuOiBtYWtlIENPTkZJR19E
RUJVR19MT0NLUyB1c2FibGUgd2l0aG91dCBDT05GSUdfREVCVUcKCiB4ZW4vS2NvbmZpZy5kZWJ1
ZyAgICAgICAgIHwgOCArKysrKysrLQogeGVuL2NvbW1vbi9zcGlubG9jay5jICAgICB8IDIgKy0K
IHhlbi9pbmNsdWRlL2FzbS1hcm0vYnVnLmggfCA2ICsrKystLQogeGVuL2luY2x1ZGUvYXNtLXg4
Ni9idWcuaCB8IDUgKysrLS0KIHhlbi9pbmNsdWRlL3hlbi9saWIuaCAgICAgfCA0ICsrKysKIDUg
ZmlsZXMgY2hhbmdlZCwgMTkgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKCi0tIAoyLjE2
LjQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
