Return-Path: <SRS0=3oPe=3D=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9D58C33CB1
	for <xen-devel@archiver.kernel.org>; Tue, 14 Jan 2020 09:37:45 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A58F12084D
	for <xen-devel@archiver.kernel.org>; Tue, 14 Jan 2020 09:37:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A58F12084D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1irIdS-0006z2-AE; Tue, 14 Jan 2020 09:37:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=XZPm=3D=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1irIdQ-0006yw-Ue
 for xen-devel@lists.xenproject.org; Tue, 14 Jan 2020 09:37:16 +0000
X-Inumbo-ID: 70b25ef1-36b1-11ea-835b-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 70b25ef1-36b1-11ea-835b-12813bfff9fa;
 Tue, 14 Jan 2020 09:37:12 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id F249DACAE;
 Tue, 14 Jan 2020 09:37:10 +0000 (UTC)
To: Julien Grall <julien@xen.org>
References: <20200113213342.8206-1-julien@xen.org>
 <20200113213342.8206-4-julien@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <9ec30bb8-49d5-0a3c-df8c-4cd9ababe972@suse.com>
Date: Tue, 14 Jan 2020 10:37:11 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20200113213342.8206-4-julien@xen.org>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 3/4] xen/domain: Remove #ifndef surrounding
 alloc_pirq_struct()
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
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <jgrall@amazon.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTMuMDEuMjAyMCAyMjozMywgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IC0tLSBhL3hlbi9pbmNs
dWRlL3hlbi9kb21haW4uaAo+ICsrKyBiL3hlbi9pbmNsdWRlL3hlbi9kb21haW4uaAo+IEBAIC00
MSw5ICs0MSw3IEBAIHN0cnVjdCB2Y3B1ICphbGxvY192Y3B1X3N0cnVjdChjb25zdCBzdHJ1Y3Qg
ZG9tYWluICpkKTsKPiAgdm9pZCBmcmVlX3ZjcHVfc3RydWN0KHN0cnVjdCB2Y3B1ICp2KTsKPiAg
Cj4gIC8qIEFsbG9jYXRlL2ZyZWUgYSBQSVJRIHN0cnVjdHVyZS4gKi8KPiAtI2lmbmRlZiBhbGxv
Y19waXJxX3N0cnVjdAo+ICBzdHJ1Y3QgcGlycSAqYWxsb2NfcGlycV9zdHJ1Y3Qoc3RydWN0IGRv
bWFpbiAqKTsKPiAtI2VuZGlmCj4gIHZvaWQgZnJlZV9waXJxX3N0cnVjdCh2b2lkICopOwoKSXMg
dGhpcyByZWFsbHkgYSBoZWxwZnVsIGNoYW5nZS4gQmFjayB0aGVuIGlhNjQgaGFkIGEgI2RlZmlu
ZSBmb3IKdGhpcywgYW5kIGEgZnV0dXJlIHBvcnQgbWF5IHdhbnQgdG8gZG8gc28gYXMgd2VsbC4g
SXMgdGhlcmUKYW55dGhpbmcgYWN0aXZlbHkgcHJvYmxlbWF0aWMgd2l0aCBsZWF2aW5nIHRoaXMg
dW50b3VjaGVkPwoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
