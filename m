Return-Path: <SRS0=bRyV=TX=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E1C4C282DD
	for <xen-devel@archiver.kernel.org>; Thu, 23 May 2019 12:07:05 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 23C5920881
	for <xen-devel@archiver.kernel.org>; Thu, 23 May 2019 12:07:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 23C5920881
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hTmUj-0004aU-Ga; Thu, 23 May 2019 12:06:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=oIoO=TX=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hTmUh-0004aP-TR
 for xen-devel@lists.xenproject.org; Thu, 23 May 2019 12:06:47 +0000
X-Inumbo-ID: 3bf601f2-7d53-11e9-9672-43a666158bf2
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3bf601f2-7d53-11e9-9672-43a666158bf2;
 Thu, 23 May 2019 12:06:46 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Thu, 23 May 2019 06:06:44 -0600
Message-Id: <5CE68CD30200007800231B01@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Thu, 23 May 2019 06:06:43 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "xen-devel" <xen-devel@lists.xenproject.org>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [Xen-devel] [PATCH 0/5] x86: CPU idle management adjustments
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190523120643.nfGjnJuuM3RdYYuETRiKkCFIlPkfD7o_DQx3Kd_CtfQ@z>

VGhlIGZpcnN0IHBhdGNoIGlzIHNvbWV0aGluZyBJIGhhZCBtZWFudCB0byBkbyBmb3JldmVyIHNp
bmNlIHRoZSBpbnRyb2R1Y3Rpb24Kb2YgbXdhaXQtaWRsZS4gVGhlIDJuZCBwYXRjaCBhZGRyZXNz
ZXMgYSBsYXRlbnQgcHJvYmxlbSAoYmVjb21pbmcgYW4gYWN0aXZlCm9uZSB3aXRoIHBhdGNoIDMp
IGluIEMtc3RhdGUgc2VsZWN0aW9uIHdoZW4gYWN0dWFsbHkgZW50ZXJpbmcgYW4gaWRsZSBzdGF0
ZS4KVGhlIDNyZCBwYXRjaCBpcyBteSBjb3VudGVycHJvcG9zYWwgdG8gQnJpYW4ncyBpbnRlbmRl
ZCBhYnVzZSAoYXMgSSB3b3VsZApjYWxsIGl0KSBvZiB0aGUgbXdhaXQtaWRsZSBkcml2ZXIuIFRo
ZSBmaW5hbCB0d28gcGF0Y2hlcyBhcmUgb25lcyBJJ3ZlIGJlZW4KY2FycnlpbmcgZm9yIGFib3V0
IDUgeWVhcnMgbm93LCBpbml0aWFsbHkgd2FpdGluZyBmb3IgYSByZXNwb25zZSB0byBteQpwcm9w
b3NlZCBlZGl0cyB0byBSb3NzJ2VzIHBhdGNoZXMsIGFuZCBldmVudHVhbGx5IHNvcnQgb2YgZm9y
Z290dGVuIChidXQKcmUtYmFzZWQgYXMgbmVlZGVkKS4KCjE6IHg4Ni9jcHVpZGxlOiBzd2l0Y2gg
dG8gdW5pZm9ybSBtZWFuaW5nIG9mICJtYXhfY3N0YXRlPSIKMjogeDg2L2NwdWlkbGU6IHJlYWxs
eSB1c2UgQzEgZm9yICJ1cmdlbnQiIENQVXMKMzogeDg2L0FNRDogbWFrZSBDLXN0YXRlIGhhbmRs
aW5nIGluZGVwZW5kZW50IG9mIERvbTAKNDogeDg2OiBhbGxvdyBsaW1pdGluZyB0aGUgbWF4IEMt
c3RhdGUgc3ViLXN0YXRlCjU6IHRvb2xzL2xpYnhjOiBhbGxvdyBjb250cm9sbGluZyB0aGUgbWF4
IEMtc3RhdGUgc3ViLXN0YXRlCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
