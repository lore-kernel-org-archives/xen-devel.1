Return-Path: <SRS0=IKXj=VO=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75634C76186
	for <xen-devel@archiver.kernel.org>; Wed, 17 Jul 2019 06:47:05 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 52E512173B
	for <xen-devel@archiver.kernel.org>; Wed, 17 Jul 2019 06:47:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 52E512173B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hndiC-0006XI-9c; Wed, 17 Jul 2019 06:46:48 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=pZ7V=VO=perches.com=joe@srs-us1.protection.inumbo.net>)
 id 1hndiB-0006XB-41
 for xen-devel@lists.xenproject.org; Wed, 17 Jul 2019 06:46:47 +0000
X-Inumbo-ID: a4a34c73-a85e-11e9-8980-bc764e045a96
Received: from smtprelay.hostedemail.com (unknown [216.40.44.87])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id a4a34c73-a85e-11e9-8980-bc764e045a96;
 Wed, 17 Jul 2019 06:46:45 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay07.hostedemail.com (Postfix) with ESMTP id 17059181D12ED;
 Wed, 17 Jul 2019 06:46:45 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: copy28_7d036c1ef63
X-Filterd-Recvd-Size: 1561
Received: from XPS-9350 (cpe-23-242-196-136.socal.res.rr.com [23.242.196.136])
 (Authenticated sender: joe@perches.com)
 by omf01.hostedemail.com (Postfix) with ESMTPA;
 Wed, 17 Jul 2019 06:46:43 +0000 (UTC)
Message-ID: <9791d12717bba784f24f35c29ddfaab9ccb78965.camel@perches.com>
From: Joe Perches <joe@perches.com>
To: Zhenzhong Duan <zhenzhong.duan@oracle.com>, linux-kernel@vger.kernel.org
Date: Tue, 16 Jul 2019 23:46:41 -0700
In-Reply-To: <1563251169-30740-1-git-send-email-zhenzhong.duan@oracle.com>
References: <1563251169-30740-1-git-send-email-zhenzhong.duan@oracle.com>
User-Agent: Evolution 3.30.5-0ubuntu0.18.10.1 
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v8 4/5] x86/paravirt: Remove const mark from
 x86_hyper_xen_hvm variable
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
Cc: jgross@suse.com, sstabellini@kernel.org, x86@kernel.org, mingo@redhat.com,
 bp@alien8.de, xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com,
 tglx@linutronix.de
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCAyMDE5LTA3LTE2IGF0IDEyOjI2ICswODAwLCBaaGVuemhvbmcgRHVhbiB3cm90ZToK
PiAuLiBhcyAibm9wdiIgc3VwcG9ydCBuZWVkcyBpdCB0byBiZSBjaGFuZ2VhYmxlIGF0IGJvb3Qg
dXAgc3RhZ2UuCj4gCj4gQ2hlY2twYXRjaCByZXBvcnRzIHdhcm5pbmcsIHNvIG1vdmUgdmFyaWFi
bGUgZGVjbGFyYXRpb25zIGZyb20KPiBoeXBlcnZpc29yLmMgdG8gaHlwZXJ2aXNvci5oCltdCj4g
ZGlmZiAtLWdpdCBhL2FyY2gveDg2L3hlbi9lbmxpZ2h0ZW5faHZtLmMgYi9hcmNoL3g4Ni94ZW4v
ZW5saWdodGVuX2h2bS5jCltdCj4gQEAgLTI1OSw3ICsyNTksNyBAQCBzdGF0aWMgX19pbml0IHZv
aWQgeGVuX2h2bV9ndWVzdF9sYXRlX2luaXQodm9pZCkKPiAgI2VuZGlmCj4gIH0KPiAgCj4gLWNv
bnN0IF9faW5pdGNvbnN0IHN0cnVjdCBoeXBlcnZpc29yX3g4NiB4ODZfaHlwZXJfeGVuX2h2bSA9
IHsKPiArc3RydWN0IGh5cGVydmlzb3JfeDg2IHg4Nl9oeXBlcl94ZW5faHZtIF9faW5pdGRhdGEg
PSB7CgpzdGF0aWM/CgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
