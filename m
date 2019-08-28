Return-Path: <SRS0=zV8R=WY=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6A37C3A5A1
	for <xen-devel@archiver.kernel.org>; Wed, 28 Aug 2019 08:00:57 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A2348205C9
	for <xen-devel@archiver.kernel.org>; Wed, 28 Aug 2019 08:00:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A2348205C9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i2ssm-0001j0-C3; Wed, 28 Aug 2019 08:00:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=laXa=WY=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1i2ssl-0001iu-QI
 for xen-devel@lists.xenproject.org; Wed, 28 Aug 2019 08:00:43 +0000
X-Inumbo-ID: eb240b00-c969-11e9-ae43-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id eb240b00-c969-11e9-ae43-12813bfff9fa;
 Wed, 28 Aug 2019 08:00:37 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id E54D4AE0C;
 Wed, 28 Aug 2019 08:00:35 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Date: Wed, 28 Aug 2019 10:00:24 +0200
Message-Id: <20190828080028.18205-1-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
Subject: [Xen-devel] [PATCH v3 0/4] xen: debugtrace cleanup and per-cpu
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
bmcgZGVidWdnaW5nLApwbHVzIHNvbWUgY2xlYW51cC4KCkNoYW5nZXMgaW4gVjM6Ci0gcmViYXNl
IHRvIGN1cnJlbnQgc3RhZ2luZwoKQ2hhbmdlcyBpbiBWMjoKLSBhZGRlZCBuZXcgcGF0Y2ggMSAo
cHJlcGFyaW5nIHRoZSBtb3ZlIG9mIGRlYnVndHJhY2UgY29kaW5nKQotIHBhdGNoIDQgKHYxIHBh
dGNoIDMpOiBhdm9pZCBsZWFraW5nIGJ1ZmZlcgoKSnVlcmdlbiBHcm9zcyAoNCk6CiAgeGVuOiB1
c2UgY29tbW9uIG91dHB1dCBmdW5jdGlvbiBpbiBkZWJ1Z3RyYWNlCiAgeGVuOiBtb3ZlIGRlYnVn
dHJhY2UgY29kaW5nIHRvIGNvbW1vbi9kZWJ1Z3RyYWNlLmMKICB4ZW46IHJlZmFjdG9yIGRlYnVn
dHJhY2UgZGF0YQogIHhlbjogYWRkIHBlci1jcHUgYnVmZmVyIG9wdGlvbiB0byBkZWJ1Z3RyYWNl
CgogZG9jcy9taXNjL3hlbi1jb21tYW5kLWxpbmUucGFuZG9jIHwgICA3ICstCiB4ZW4vY29tbW9u
L01ha2VmaWxlICAgICAgICAgICAgICAgfCAgIDEgKwogeGVuL2NvbW1vbi9kZWJ1Z3RyYWNlLmMg
ICAgICAgICAgIHwgMjY1ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCiB4
ZW4vZHJpdmVycy9jaGFyL2NvbnNvbGUuYyAgICAgICAgfCAxODYgKy0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0KIHhlbi9pbmNsdWRlL3hlbi9jb25zb2xlLmggICAgICAgICB8ICAgMyArCiA1IGZp
bGVzIGNoYW5nZWQsIDI3OCBpbnNlcnRpb25zKCspLCAxODQgZGVsZXRpb25zKC0pCiBjcmVhdGUg
bW9kZSAxMDA2NDQgeGVuL2NvbW1vbi9kZWJ1Z3RyYWNlLmMKCi0tIAoyLjE2LjQKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
