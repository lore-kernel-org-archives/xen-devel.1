Return-Path: <SRS0=aUBB=UN=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CC04C31E44
	for <xen-devel@archiver.kernel.org>; Fri, 14 Jun 2019 11:37:19 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DAE5E2082C
	for <xen-devel@archiver.kernel.org>; Fri, 14 Jun 2019 11:37:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DAE5E2082C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hbkVz-0001Se-62; Fri, 14 Jun 2019 11:37:03 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Gode=UN=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hbkVy-0001SZ-Nn
 for xen-devel@lists.xenproject.org; Fri, 14 Jun 2019 11:37:02 +0000
X-Inumbo-ID: b9b10fe1-8e98-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id b9b10fe1-8e98-11e9-8980-bc764e045a96;
 Fri, 14 Jun 2019 11:37:01 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Fri, 14 Jun 2019 05:37:00 -0600
Message-Id: <5D0386DC0200007800238470@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Fri, 14 Jun 2019 05:37:00 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "xen-devel" <xen-devel@lists.xenproject.org>
References: <5D03853F0200007800238448@prv1-mh.provo.novell.com>
In-Reply-To: <5D03853F0200007800238448@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [Xen-devel] [PATCH 1/3] x86/ACPI: re-park previously parked CPUs
 upon resume from S3
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QWl1aSB3aGVuIHJlc3VtaW5nIGZyb20gUzMsIENQVXMgY29tZSBiYWNrIG91dCBvZiBSRVNFVC9J
TklULiBUaGVyZWZvcmUKdGhleSBuZWVkIHRvIHVuZGVyZ28gdGhlIHNhbWUgcHJvY2VkdXJlIGFz
IHdhcyBhZGRlZCBlbHNld2hlcmUgYnkKY29tbWl0cyBkOGY5NzRmMWE2ICgieDg2OiBjb21tYW5k
IGxpbmUgb3B0aW9uIHRvIGF2b2lkIHVzZSBvZiBzZWNvbmRhcnkKaHlwZXItdGhyZWFkcyIpIGFu
ZCA4Nzk3ZDIwYTZlICgieDg2OiBwb3NzaWJseSBicmluZyB1cCBhbGwgQ1BVcyBldmVuCmlmIG5v
dCBhbGwgYXJlIHN1cHBvc2VkIHRvIGJlIHVzZWQiKS4KClNpZ25lZC1vZmYtYnk6IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCi0tLSBhL3hlbi9jb21tb24vY3B1LmMKKysrIGIveGVu
L2NvbW1vbi9jcHUuYwpAQCAtMTA1LDcgKzEwNSw3IEBAIGludCBjcHVfZG93bih1bnNpZ25lZCBp
bnQgY3B1KQogICAgIGlmICggZXJyICkKICAgICAgICAgZ290byBmYWlsOwogCi0gICAgaWYgKCB1
bmxpa2VseShzeXN0ZW1fc3RhdGUgPCBTWVNfU1RBVEVfYWN0aXZlKSApCisgICAgaWYgKCBzeXN0
ZW1fc3RhdGUgPCBTWVNfU1RBVEVfYWN0aXZlIHx8IHN5c3RlbV9zdGF0ZSA9PSBTWVNfU1RBVEVf
cmVzdW1lICkKICAgICAgICAgb25fc2VsZWN0ZWRfY3B1cyhjcHVtYXNrX29mKGNwdSksIF90YWtl
X2NwdV9kb3duLCBOVUxMLCB0cnVlKTsKICAgICBlbHNlIGlmICggKGVyciA9IHN0b3BfbWFjaGlu
ZV9ydW4odGFrZV9jcHVfZG93biwgTlVMTCwgY3B1KSkgPCAwICkKICAgICAgICAgZ290byBmYWls
OwpAQCAtMjA3LDE1ICsyMDcsMTkgQEAgdm9pZCBlbmFibGVfbm9uYm9vdF9jcHVzKHZvaWQpCiAK
ICAgICBwcmludGsoIkVuYWJsaW5nIG5vbi1ib290IENQVXMgIC4uLlxuIik7CiAKLSAgICBmb3Jf
ZWFjaF9jcHUgKCBjcHUsICZmcm96ZW5fY3B1cyApCisgICAgZm9yX2VhY2hfcHJlc2VudF9jcHUg
KCBjcHUgKQogICAgIHsKKyAgICAgICAgaWYgKCBwYXJrX29mZmxpbmVfY3B1cyA/IGNwdSA9PSBz
bXBfcHJvY2Vzc29yX2lkKCkKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA6ICFjcHVt
YXNrX3Rlc3RfY3B1KGNwdSwgJmZyb3plbl9jcHVzKSApCisgICAgICAgICAgICBjb250aW51ZTsK
ICAgICAgICAgaWYgKCAoZXJyb3IgPSBjcHVfdXAoY3B1KSkgKQogICAgICAgICB7CiAgICAgICAg
ICAgICBwcmludGsoIkVycm9yIGJyaW5naW5nIENQVSVkIHVwOiAlZFxuIiwgY3B1LCBlcnJvcik7
CiAgICAgICAgICAgICBCVUdfT04oZXJyb3IgPT0gLUVCVVNZKTsKICAgICAgICAgfQotICAgICAg
ICBlbHNlCi0gICAgICAgICAgICBfX2NwdW1hc2tfY2xlYXJfY3B1KGNwdSwgJmZyb3plbl9jcHVz
KTsKKyAgICAgICAgZWxzZSBpZiAoICFfX2NwdW1hc2tfdGVzdF9hbmRfY2xlYXJfY3B1KGNwdSwg
JmZyb3plbl9jcHVzKSAmJgorICAgICAgICAgICAgICAgICAgKGVycm9yID0gY3B1X2Rvd24oY3B1
KSkgKQorICAgICAgICAgICAgcHJpbnRrKCJFcnJvciByZS1vZmZsaW5pbmcgQ1BVJWQ6ICVkXG4i
LCBjcHUsIGVycm9yKTsKICAgICB9CiAKICAgICBmb3JfZWFjaF9jcHUgKCBjcHUsICZmcm96ZW5f
Y3B1cyApCgoKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
