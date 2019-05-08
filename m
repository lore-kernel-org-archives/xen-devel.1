Return-Path: <SRS0=jkfT=TI=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74C2BC04A6B
	for <xen-devel@archiver.kernel.org>; Wed,  8 May 2019 13:13:32 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 50FBF214AF
	for <xen-devel@archiver.kernel.org>; Wed,  8 May 2019 13:13:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 50FBF214AF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hOMNp-0007md-Ep; Wed, 08 May 2019 13:13:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=RDkG=TI=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hOMNo-0007mM-6W
 for xen-devel@lists.xenproject.org; Wed, 08 May 2019 13:13:16 +0000
X-Inumbo-ID: 08ce4e5e-7193-11e9-affb-f712af7ee044
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 08ce4e5e-7193-11e9-affb-f712af7ee044;
 Wed, 08 May 2019 13:13:14 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Wed, 08 May 2019 07:13:13 -0600
Message-Id: <5CD2D5E7020000780022CD82@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Wed, 08 May 2019 07:13:11 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "xen-devel" <xen-devel@lists.xenproject.org>
References: <5CC6DD090200007800229E80@prv1-mh.provo.novell.com>
 <5CD2D2C8020000780022CCF2@prv1-mh.provo.novell.com>
In-Reply-To: <5CD2D2C8020000780022CCF2@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [Xen-devel] [PATCH v2 10/12] x86/IRQ: reduce unused space in struct
 arch_irq_desc
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
Message-ID: <20190508131311.i7MKn1PidHbnpmsVmKFHr3zMU4ECnrLY7zqfenO658E@z>

U2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgpBY2tlZC1ieTog
QW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KCi0tLSBhL3hlbi9pbmNs
dWRlL2FzbS14ODYvaXJxLmgKKysrIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9pcnEuaApAQCAtNDEs
OCArNDEsOCBAQCBzdHJ1Y3QgYXJjaF9pcnFfZGVzYyB7CiAgICAgICAgIGNwdW1hc2tfdmFyX3Qg
Y3B1X21hc2s7CiAgICAgICAgIGNwdW1hc2tfdmFyX3Qgb2xkX2NwdV9tYXNrOwogICAgICAgICBj
cHVtYXNrX3Zhcl90IHBlbmRpbmdfbWFzazsKLSAgICAgICAgdW5zaWduZWQgbW92ZV9jbGVhbnVw
X2NvdW50OwogICAgICAgICB2bWFza190ICp1c2VkX3ZlY3RvcnM7CisgICAgICAgIHVuc2lnbmVk
IG1vdmVfY2xlYW51cF9jb3VudDsKICAgICAgICAgdTggbW92ZV9pbl9wcm9ncmVzcyA6IDE7CiAg
ICAgICAgIHM4IHVzZWQ7CiB9OwoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
