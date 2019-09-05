Return-Path: <SRS0=DRPg=XA=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4F24C3A5A5
	for <xen-devel@archiver.kernel.org>; Thu,  5 Sep 2019 11:40:12 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8E57920825
	for <xen-devel@archiver.kernel.org>; Thu,  5 Sep 2019 11:40:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8E57920825
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i5q7N-00018D-V1; Thu, 05 Sep 2019 11:40:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=K5dO=XA=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1i5q7M-000153-CT
 for xen-devel@lists.xenproject.org; Thu, 05 Sep 2019 11:40:00 +0000
X-Inumbo-ID: e3dceb6c-cfd1-11e9-abc7-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e3dceb6c-cfd1-11e9-abc7-12813bfff9fa;
 Thu, 05 Sep 2019 11:39:59 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 5CFFEAD07;
 Thu,  5 Sep 2019 11:39:58 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Date: Thu,  5 Sep 2019 13:39:51 +0200
Message-Id: <20190905113955.24870-1-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
Subject: [Xen-devel] [PATCH v5 0/4] xen: debugtrace cleanup and per-cpu
 buffer support
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
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QW5vdGhlciBkZWJ1Z3RyYWNlIGVuaGFuY2VtZW50IEkgbmVlZGVkIGZvciBjb3JlIHNjaGVkdWxp
bmcgZGVidWdnaW5nLApwbHVzIHNvbWUgY2xlYW51cC4KCkNoYW5nZXMgaW4gVjU6Ci0gc2V2ZXJh
bCBjb21tZW50cyBieSBKYW4gYWRkcmVzc2VkIChjb2RlOiBwYXRjaGVzIDEgYW5kIDQsIGNvbW1p
dAogIG1lc3NhZ2Ugb2YgcGF0Y2ggMykKCkNoYW5nZXMgaW4gVjQ6Ci0gcmVwbGFjZWQgcGF0Y2gg
MSAob3JpZ2luYWwgb25lIHdhcyBjb21taXR0ZWQsIG5ldyBvbmUgcmVxdWVzdGVkIGJ5CiAgSmFu
IEJldWxpY2gpCi0gc2V2ZXJhbCBjb21tZW50cyBieSBKYW4gYWRkcmVzc2VkCgpDaGFuZ2VzIGlu
IFYzOgotIHJlYmFzZSB0byBjdXJyZW50IHN0YWdpbmcKCkNoYW5nZXMgaW4gVjI6Ci0gYWRkZWQg
bmV3IHBhdGNoIDEgKHByZXBhcmluZyB0aGUgbW92ZSBvZiBkZWJ1Z3RyYWNlIGNvZGluZykKLSBw
YXRjaCA0ICh2MSBwYXRjaCAzKTogYXZvaWQgbGVha2luZyBidWZmZXIKCkp1ZXJnZW4gR3Jvc3Mg
KDQpOgogIHhlbjogZml4IGRlYnVndHJhY2UgY2xlYXJpbmcKICB4ZW46IG1vdmUgZGVidWd0cmFj
ZSBjb2RpbmcgdG8gY29tbW9uL2RlYnVndHJhY2UuYwogIHhlbjogcmVmYWN0b3IgZGVidWd0cmFj
ZSBkYXRhCiAgeGVuOiBhZGQgcGVyLWNwdSBidWZmZXIgb3B0aW9uIHRvIGRlYnVndHJhY2UKCiBk
b2NzL21pc2MveGVuLWNvbW1hbmQtbGluZS5wYW5kb2MgfCAgIDcgKy0KIHhlbi9jb21tb24vTWFr
ZWZpbGUgICAgICAgICAgICAgICB8ICAgMSArCiB4ZW4vY29tbW9uL2RlYnVndHJhY2UuYyAgICAg
ICAgICAgfCAyNzYgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKIHhlbi9k
cml2ZXJzL2NoYXIvY29uc29sZS5jICAgICAgICB8IDE3OCArLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0KIDQgZmlsZXMgY2hhbmdlZCwgMjgyIGluc2VydGlvbnMoKyksIDE4MCBkZWxldGlvbnMoLSkK
IGNyZWF0ZSBtb2RlIDEwMDY0NCB4ZW4vY29tbW9uL2RlYnVndHJhY2UuYwoKLS0gCjIuMTYuNAoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
