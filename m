Return-Path: <SRS0=7RrO=SN=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1033BC10F14
	for <xen-devel@archiver.kernel.org>; Thu, 11 Apr 2019 10:48:00 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D7A95217D4
	for <xen-devel@archiver.kernel.org>; Thu, 11 Apr 2019 10:47:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D7A95217D4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hEXFD-0005RN-S9; Thu, 11 Apr 2019 10:47:47 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=i7IS=SN=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hEXFC-0005RI-VS
 for xen-devel@lists.xenproject.org; Thu, 11 Apr 2019 10:47:47 +0000
X-Inumbo-ID: 3d239ed1-5c47-11e9-92d7-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 3d239ed1-5c47-11e9-92d7-bc764e045a96;
 Thu, 11 Apr 2019 10:47:45 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Thu, 11 Apr 2019 04:45:44 -0600
Message-Id: <5CAF1AD502000078002268CA@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Thu, 11 Apr 2019 04:45:41 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "xen-devel" <xen-devel@lists.xenproject.org>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [Xen-devel] [PATCH] timers: move back migrate_timers_from_cpu()
 invocation
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190411104541.Yi0JJ1DH3e6Wjh_14PWrU4E_mIg7K5ca_SSmbEcbLMk@z>

Q29tbWl0IDU5N2ZiYjhiZTYgKCJ4ZW4vdGltZXJzOiBGaXggbWVtb3J5IGxlYWsgd2l0aCBjcHUg
dW5wbHVnL3BsdWciKQp3ZW50IGEgbGl0dGxlIHRvbyBmYXI6IE1pZ3JhdGluZyB0aW1lcnMgYXdh
eSBmcm9tIGEgQ1BVIGJlaW5nIG9mZmxpbmVkCm5lZWRzIHRvIGhlcHBlbiBpbmRlcGVuZGVudCBv
ZiB3aGV0aGVyIGl0IGdldCBwYXJrZWQgb3IgZnVsbHkgb2ZmbGluZWQuCgpTaWduZWQtb2ZmLWJ5
OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgotLS0gYS94ZW4vY29tbW9uL3RpbWVy
LmMKKysrIGIveGVuL2NvbW1vbi90aW1lci5jCkBAIC02MTksOCArNjE5LDYgQEAgc3RhdGljIHZv
aWQgZnJlZV9wZXJjcHVfdGltZXJzKHVuc2lnbmVkCiB7CiAgICAgc3RydWN0IHRpbWVycyAqdHMg
PSAmcGVyX2NwdSh0aW1lcnMsIGNwdSk7CiAKLSAgICBtaWdyYXRlX3RpbWVyc19mcm9tX2NwdShj
cHUpOwotCiAgICAgQVNTRVJUKGhlYXBfbWV0YWRhdGEodHMtPmhlYXApLT5zaXplID09IDApOwog
ICAgIGlmICggaGVhcF9tZXRhZGF0YSh0cy0+aGVhcCktPmxpbWl0ICkKICAgICB7CkBAIC02NDgs
NiArNjQ2LDggQEAgc3RhdGljIGludCBjcHVfY2FsbGJhY2soCiAgICAgY2FzZSBDUFVfVVBfQ0FO
Q0VMRUQ6CiAgICAgY2FzZSBDUFVfREVBRDoKICAgICBjYXNlIENQVV9SRVNVTUVfRkFJTEVEOgor
ICAgICAgICBtaWdyYXRlX3RpbWVyc19mcm9tX2NwdShjcHUpOworCiAgICAgICAgIGlmICggIXBh
cmtfb2ZmbGluZV9jcHVzICYmIHN5c3RlbV9zdGF0ZSAhPSBTWVNfU1RBVEVfc3VzcGVuZCApCiAg
ICAgICAgICAgICBmcmVlX3BlcmNwdV90aW1lcnMoY3B1KTsKICAgICAgICAgYnJlYWs7CgoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
