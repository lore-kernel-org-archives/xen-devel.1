Return-Path: <SRS0=PJHi=TW=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE434C18E7D
	for <xen-devel@archiver.kernel.org>; Wed, 22 May 2019 09:46:11 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AD54C217D9
	for <xen-devel@archiver.kernel.org>; Wed, 22 May 2019 09:46:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AD54C217D9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hTNos-0006Vi-I4; Wed, 22 May 2019 09:45:58 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=aAGA=TW=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hTNoq-0006VJ-A3
 for xen-devel@lists.xenproject.org; Wed, 22 May 2019 09:45:56 +0000
X-Inumbo-ID: 6402ac35-7c76-11e9-8980-bc764e045a96
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 6402ac35-7c76-11e9-8980-bc764e045a96;
 Wed, 22 May 2019 09:45:54 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 714D6AF21;
 Wed, 22 May 2019 09:45:53 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Date: Wed, 22 May 2019 11:45:48 +0200
Message-Id: <20190522094549.28397-3-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20190522094549.28397-1-jgross@suse.com>
References: <20190522094549.28397-1-jgross@suse.com>
Subject: [Xen-devel] [PATCH 2/3] xen: drop preempt_count() for non-debug
 builds
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
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190522094548.dB4lUnXg493cO0p99XelRnZKeIEOpoIwB_beG_k3K2w@z>

cHJlZW1wdF9jb3VudCgpIGFuZCB0aGUgYXNzb2NpYXRlZCBwZXItY3B1IHZhcmlhYmxlIF9fcHJl
ZW1wdF9jb3VudAphcmUgdGVzdGVkIGluIGRlYnVnIGJ1aWxkIG9ubHkuIFNvIGRyb3AgdGhlbSBm
b3Igbm9uLWRlYnVnIGJ1aWxkcy4KClNpZ25lZC1vZmYtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9z
c0BzdXNlLmNvbT4KLS0tCiB4ZW4vY29tbW9uL3ByZWVtcHQuYyAgICAgIHwgMiArLQogeGVuL2lu
Y2x1ZGUveGVuL3ByZWVtcHQuaCB8IDYgKysrKystCiAyIGZpbGVzIGNoYW5nZWQsIDYgaW5zZXJ0
aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vY29tbW9uL3ByZWVtcHQu
YyBiL3hlbi9jb21tb24vcHJlZW1wdC5jCmluZGV4IDIwOTEzZTIwZDMuLjMwNzdjNTFkNTIgMTAw
NjQ0Ci0tLSBhL3hlbi9jb21tb24vcHJlZW1wdC5jCisrKyBiL3hlbi9jb21tb24vcHJlZW1wdC5j
CkBAIC0yMyw5ICsyMyw5IEBACiAjaW5jbHVkZSA8eGVuL2lycS5oPgogI2luY2x1ZGUgPGFzbS9z
eXN0ZW0uaD4KIAorI2lmbmRlZiBOREVCVUcKIERFRklORV9QRVJfQ1BVKHVuc2lnbmVkIGludCwg
X19wcmVlbXB0X2NvdW50KTsKIAotI2lmbmRlZiBOREVCVUcKIHZvaWQgQVNTRVJUX05PVF9JTl9B
VE9NSUModm9pZCkKIHsKICAgICBBU1NFUlQoIXByZWVtcHRfY291bnQoKSk7CmRpZmYgLS1naXQg
YS94ZW4vaW5jbHVkZS94ZW4vcHJlZW1wdC5oIGIveGVuL2luY2x1ZGUveGVuL3ByZWVtcHQuaApp
bmRleCBmNzE1Y2EwOWJjLi4wYmY0OWNjOTc5IDEwMDY0NAotLS0gYS94ZW4vaW5jbHVkZS94ZW4v
cHJlZW1wdC5oCisrKyBiL3hlbi9pbmNsdWRlL3hlbi9wcmVlbXB0LmgKQEAgLTEyLDYgKzEyLDgg
QEAKICNpbmNsdWRlIDx4ZW4vdHlwZXMuaD4KICNpbmNsdWRlIDx4ZW4vcGVyY3B1Lmg+CiAKKyNp
Zm5kZWYgTkRFQlVHCisKIERFQ0xBUkVfUEVSX0NQVSh1bnNpZ25lZCBpbnQsIF9fcHJlZW1wdF9j
b3VudCk7CiAKICNkZWZpbmUgcHJlZW1wdF9jb3VudCgpICh0aGlzX2NwdShfX3ByZWVtcHRfY291
bnQpKQpAQCAtMjYsOSArMjgsMTEgQEAgREVDTEFSRV9QRVJfQ1BVKHVuc2lnbmVkIGludCwgX19w
cmVlbXB0X2NvdW50KTsKICAgICBwcmVlbXB0X2NvdW50KCktLTsgICAgICAgICAgICAgICAgICAg
ICAgICAgIFwKIH0gd2hpbGUgKDApCiAKLSNpZm5kZWYgTkRFQlVHCiB2b2lkIEFTU0VSVF9OT1Rf
SU5fQVRPTUlDKHZvaWQpOworCiAjZWxzZQorI2RlZmluZSBwcmVlbXB0X2Rpc2FibGUoKSAgICBi
YXJyaWVyKCk7CisjZGVmaW5lIHByZWVtcHRfZW5hYmxlKCkgICAgIGJhcnJpZXIoKTsKICNkZWZp
bmUgQVNTRVJUX05PVF9JTl9BVE9NSUMoKSAoKHZvaWQpMCkKICNlbmRpZgogCi0tIAoyLjE2LjQK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
