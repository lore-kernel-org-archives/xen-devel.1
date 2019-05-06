Return-Path: <SRS0=pwZ6=TG=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B221C04AAD
	for <xen-devel@archiver.kernel.org>; Mon,  6 May 2019 06:57:16 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 484F7206A3
	for <xen-devel@archiver.kernel.org>; Mon,  6 May 2019 06:57:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 484F7206A3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hNXYe-000225-SA; Mon, 06 May 2019 06:57:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=XZcu=TG=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hNXYc-0001xo-VK
 for xen-devel@lists.xenproject.org; Mon, 06 May 2019 06:57:02 +0000
X-Inumbo-ID: 2270701c-6fcc-11e9-a899-c71b92f5a7ed
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2270701c-6fcc-11e9-a899-c71b92f5a7ed;
 Mon, 06 May 2019 06:56:55 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id B459CAF03;
 Mon,  6 May 2019 06:56:52 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Date: Mon,  6 May 2019 08:56:13 +0200
Message-Id: <20190506065644.7415-15-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20190506065644.7415-1-jgross@suse.com>
References: <20190506065644.7415-1-jgross@suse.com>
Subject: [Xen-devel] [PATCH RFC V2 14/45] xen/sched: add id to struct
 sched_item
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
Cc: Juergen Gross <jgross@suse.com>, Tim Deegan <tim@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190506065613.ABUAOEJD9tq_1FFiv3Tbu00J5xuUQjNZEKtKW_yMdmA@z>

QWRkIGFuIGlkZW50aWZpZXIgdG8gc2NoZWRfaXRlbS4gRm9yIG5vdyBpdCB3aWxsIGJlIHRoZSBz
YW1lIGFzIHRoZQpyZWxhdGVkIHZjcHVfaWQuCgpTaWduZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdyb3Nz
IDxqZ3Jvc3NAc3VzZS5jb20+Ci0tLQogeGVuL2NvbW1vbi9zY2hlZHVsZS5jICAgfCAzICsrLQog
eGVuL2luY2x1ZGUveGVuL3NjaGVkLmggfCAxICsKIDIgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRp
b25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9zY2hlZHVsZS5j
IGIveGVuL2NvbW1vbi9zY2hlZHVsZS5jCmluZGV4IDUzYWFjMTA3ZTEuLmZmYzA5MjBlNWYgMTAw
NjQ0Ci0tLSBhL3hlbi9jb21tb24vc2NoZWR1bGUuYworKysgYi94ZW4vY29tbW9uL3NjaGVkdWxl
LmMKQEAgLTI4OSwxMiArMjg5LDEzIEBAIHN0YXRpYyBzdHJ1Y3Qgc2NoZWRfaXRlbSAqc2NoZWRf
YWxsb2NfaXRlbShzdHJ1Y3QgdmNwdSAqdikKIAogICAgIHYtPnNjaGVkX2l0ZW0gPSBpdGVtOwog
ICAgIGl0ZW0tPnZjcHUgPSB2OworICAgIGl0ZW0tPml0ZW1faWQgPSB2LT52Y3B1X2lkOwogICAg
IGl0ZW0tPmRvbWFpbiA9IGQ7CiAKICAgICBmb3IgKCBwcmV2X2l0ZW0gPSAmZC0+c2NoZWRfaXRl
bV9saXN0OyAqcHJldl9pdGVtOwogICAgICAgICAgIHByZXZfaXRlbSA9ICYoKnByZXZfaXRlbSkt
Pm5leHRfaW5fbGlzdCApCiAgICAgICAgIGlmICggKCpwcmV2X2l0ZW0pLT5uZXh0X2luX2xpc3Qg
JiYKLSAgICAgICAgICAgICAoKnByZXZfaXRlbSktPm5leHRfaW5fbGlzdC0+dmNwdS0+dmNwdV9p
ZCA+IHYtPnZjcHVfaWQgKQorICAgICAgICAgICAgICgqcHJldl9pdGVtKS0+bmV4dF9pbl9saXN0
LT5pdGVtX2lkID4gaXRlbS0+aXRlbV9pZCApCiAgICAgICAgICAgICBicmVhazsKIAogICAgIGl0
ZW0tPm5leHRfaW5fbGlzdCA9ICpwcmV2X2l0ZW07CmRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS94
ZW4vc2NoZWQuaCBiL3hlbi9pbmNsdWRlL3hlbi9zY2hlZC5oCmluZGV4IDgzZDc2NDYwODguLmNl
N2VhZDk5NzEgMTAwNjQ0Ci0tLSBhL3hlbi9pbmNsdWRlL3hlbi9zY2hlZC5oCisrKyBiL3hlbi9p
bmNsdWRlL3hlbi9zY2hlZC5oCkBAIC0yNjYsNiArMjY2LDcgQEAgc3RydWN0IHNjaGVkX2l0ZW0g
ewogICAgIHZvaWQgICAgICAgICAgICAgICAgICAqcHJpdjsgICAgICAvKiBzY2hlZHVsZXIgcHJp
dmF0ZSBkYXRhICovCiAgICAgc3RydWN0IHNjaGVkX2l0ZW0gICAgICpuZXh0X2luX2xpc3Q7CiAg
ICAgc3RydWN0IHNjaGVkX3Jlc291cmNlICpyZXM7CisgICAgaW50ICAgICAgICAgICAgICAgICAg
ICBpdGVtX2lkOwogCiAgICAgLyogTGFzdCB0aW1lIHdoZW4gaXRlbSBoYXMgYmVlbiBzY2hlZHVs
ZWQgb3V0LiAqLwogICAgIHVpbnQ2NF90ICAgICAgICAgICAgICAgbGFzdF9ydW5fdGltZTsKLS0g
CjIuMTYuNAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
