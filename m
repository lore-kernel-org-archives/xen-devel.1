Return-Path: <SRS0=Lk9n=XE=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59E64C49ED4
	for <xen-devel@archiver.kernel.org>; Mon,  9 Sep 2019 09:25:33 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 353AE21924
	for <xen-devel@archiver.kernel.org>; Mon,  9 Sep 2019 09:25:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 353AE21924
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i7FvB-0005AE-OC; Mon, 09 Sep 2019 09:25:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=m/oR=XE=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1i7FvA-0005A7-89
 for xen-devel@lists.xenproject.org; Mon, 09 Sep 2019 09:25:16 +0000
X-Inumbo-ID: b8513ac5-d2e3-11e9-ac09-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b8513ac5-d2e3-11e9-ac09-12813bfff9fa;
 Mon, 09 Sep 2019 09:25:10 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 9478FADBF;
 Mon,  9 Sep 2019 09:25:09 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Date: Mon,  9 Sep 2019 11:25:01 +0200
Message-Id: <20190909092506.24792-1-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
Subject: [Xen-devel] [PATCH v7 0/5] xen: debugtrace cleanup and per-cpu
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
bmcgZGVidWdnaW5nLApwbHVzIHNvbWUgY2xlYW51cC4KCkNoYW5nZXMgaW4gVjc6Ci0gc29tZSBj
b21tZW50cyBieSBKYW4gYWRkcmVzc2VkCgpDaGFuZ2VzIGluIFY2OgotIHNvbWUgY29tbWVudHMg
YnkgSmFuIGFkZHJlc3NlZAotIGFkZGVkIHBhdGNoIDUKCkNoYW5nZXMgaW4gVjU6Ci0gc2V2ZXJh
bCBjb21tZW50cyBieSBKYW4gYWRkcmVzc2VkIChjb2RlOiBwYXRjaGVzIDEgYW5kIDQsIGNvbW1p
dAogIG1lc3NhZ2Ugb2YgcGF0Y2ggMykKCkNoYW5nZXMgaW4gVjQ6Ci0gcmVwbGFjZWQgcGF0Y2gg
MSAob3JpZ2luYWwgb25lIHdhcyBjb21taXR0ZWQsIG5ldyBvbmUgcmVxdWVzdGVkIGJ5CiAgSmFu
IEJldWxpY2gpCi0gc2V2ZXJhbCBjb21tZW50cyBieSBKYW4gYWRkcmVzc2VkCgpDaGFuZ2VzIGlu
IFYzOgotIHJlYmFzZSB0byBjdXJyZW50IHN0YWdpbmcKCkNoYW5nZXMgaW4gVjI6Ci0gYWRkZWQg
bmV3IHBhdGNoIDEgKHByZXBhcmluZyB0aGUgbW92ZSBvZiBkZWJ1Z3RyYWNlIGNvZGluZykKLSBw
YXRjaCA0ICh2MSBwYXRjaCAzKTogYXZvaWQgbGVha2luZyBidWZmZXIKCkp1ZXJnZW4gR3Jvc3Mg
KDUpOgogIHhlbjogZml4IGRlYnVndHJhY2UgY2xlYXJpbmcKICB4ZW46IG1vdmUgZGVidWd0cmFj
ZSBjb2RpbmcgdG8gY29tbW9uL2RlYnVndHJhY2UuYwogIHhlbjogcmVmYWN0b3IgZGVidWd0cmFj
ZSBkYXRhCiAgeGVuOiBhZGQgcGVyLWNwdSBidWZmZXIgb3B0aW9uIHRvIGRlYnVndHJhY2UKICB4
ZW46IGFkZCBkZWJ1Z3RyYWNlIGVudHJ5IHdoZW4gZW50cnkgY291bnQgaXMgd3JhcHBpbmcKCiBk
b2NzL21pc2MveGVuLWNvbW1hbmQtbGluZS5wYW5kb2MgfCAgIDcgKy0KIHhlbi9jb21tb24vTWFr
ZWZpbGUgICAgICAgICAgICAgICB8ICAgMSArCiB4ZW4vY29tbW9uL2RlYnVndHJhY2UuYyAgICAg
ICAgICAgfCAzMDMgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKIHhlbi9k
cml2ZXJzL2NoYXIvY29uc29sZS5jICAgICAgICB8IDE3OCArLS0tLS0tLS0tLS0tLS0tLS0tLS0t
CiA0IGZpbGVzIGNoYW5nZWQsIDMwOSBpbnNlcnRpb25zKCspLCAxODAgZGVsZXRpb25zKC0pCiBj
cmVhdGUgbW9kZSAxMDA2NDQgeGVuL2NvbW1vbi9kZWJ1Z3RyYWNlLmMKCi0tIAoyLjE2LjQKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
