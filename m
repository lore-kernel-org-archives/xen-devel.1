Return-Path: <SRS0=0dJu=SH=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8373C4360F
	for <xen-devel@archiver.kernel.org>; Fri,  5 Apr 2019 07:02:07 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9368121850
	for <xen-devel@archiver.kernel.org>; Fri,  5 Apr 2019 07:02:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9368121850
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hCIrN-00024s-03; Fri, 05 Apr 2019 07:01:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=KiBs=SH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hCIrM-00024k-Bo
 for xen-devel@lists.xenproject.org; Fri, 05 Apr 2019 07:01:56 +0000
X-Inumbo-ID: af301af8-5770-11e9-b84c-13249199fb9e
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id af301af8-5770-11e9-b84c-13249199fb9e;
 Fri, 05 Apr 2019 07:01:50 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Fri, 05 Apr 2019 01:01:49 -0600
Message-Id: <5CA6FD5D0200007800224C46@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Fri, 05 Apr 2019 01:01:49 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "xen-devel" <xen-devel@lists.xenproject.org>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [Xen-devel] [PATCH] VT-d: posted interrupts require interrupt
 remapping
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
Cc: Kevin Tian <kevin.tian@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190405070149.W4dr6LWdC3tsaLD55D_yynhBRfZijU1kLnot_9-6lQ0@z>

SW5pdGlhbGx5IEkgaGFkIGp1c3Qgbm90aWNlZCB0aGUgdW5uZWNlc3NhcnkgaW5kaXJlY3Rpb24g
aW4gdGhlIGNhbGwKZnJvbSBwaV91cGRhdGVfaXJ0ZSgpLiBUaGUgZ2VuZXJpYyB3cmFwcGVyIGhh
dmluZyBhbiBpb21tdV9pbnRyZW1hcApjb25kaXRpb25hbCBtYWRlIG1lIGxvb2sgYXQgdGhlIHNl
dHVwIGNvZGUgdGhvdWdoLiBTbyBmaXJzdCBvZiBhbGwKZW5mb3JjZSB0aGUgbmVjZXNzYXJ5IGRl
cGVuZGVuY3kuCgpTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+
CgotLS0gYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC92dGQvaW50cmVtYXAuYworKysgYi94ZW4v
ZHJpdmVycy9wYXNzdGhyb3VnaC92dGQvaW50cmVtYXAuYwpAQCAtOTkzLDcgKzk5Myw4IEBAIGlu
dCBwaV91cGRhdGVfaXJ0ZShjb25zdCBzdHJ1Y3QgcGlfZGVzYwogICAgIHNwaW5fdW5sb2NrX2ly
cSgmZGVzYy0+bG9jayk7CiAKICAgICBBU1NFUlQocGNpZGV2c19sb2NrZWQoKSk7Ci0gICAgcmV0
dXJuIGlvbW11X3VwZGF0ZV9pcmVfZnJvbV9tc2kobXNpX2Rlc2MsICZtc2lfZGVzYy0+bXNnKTsK
KworICAgIHJldHVybiBtc2lfbXNnX3dyaXRlX3JlbWFwX3J0ZShtc2lfZGVzYywgJm1zaV9kZXNj
LT5tc2cpOwogCiAgdW5sb2NrX291dDoKICAgICBzcGluX3VubG9ja19pcnEoJmRlc2MtPmxvY2sp
OwotLS0gYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC92dGQvaW9tbXUuYworKysgYi94ZW4vZHJp
dmVycy9wYXNzdGhyb3VnaC92dGQvaW9tbXUuYwpAQCAtMjM0Miw3ICsyMzQyLDcgQEAgc3RhdGlj
IGludCBfX2luaXQgdnRkX3NldHVwKHZvaWQpCiAgICAgICAgICAqIG5vdCBzdXBwb3J0ZWQsIHNp
bmNlIHdlIGNvdW50IG9uIHRoaXMgZmVhdHVyZSB0bwogICAgICAgICAgKiBhdG9taWNhbGx5IHVw
ZGF0ZSAxNi1ieXRlIElSVEUgaW4gcG9zdGVkIGZvcm1hdC4KICAgICAgICAgICovCi0gICAgICAg
IGlmICggIWNhcF9pbnRyX3Bvc3QoaW9tbXUtPmNhcCkgfHwgIWNwdV9oYXNfY3gxNiApCisgICAg
ICAgIGlmICggIWNhcF9pbnRyX3Bvc3QoaW9tbXUtPmNhcCkgfHwgIWlvbW11X2ludHJlbWFwIHx8
ICFjcHVfaGFzX2N4MTYgKQogICAgICAgICAgICAgaW9tbXVfaW50cG9zdCA9IDA7CiAKICAgICAg
ICAgaWYgKCAhdnRkX2VwdF9wYWdlX2NvbXBhdGlibGUoaW9tbXUpICkKCgoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
