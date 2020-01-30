Return-Path: <SRS0=pEfl=3T=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA03CC2D0DB
	for <xen-devel@archiver.kernel.org>; Thu, 30 Jan 2020 14:01:28 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AACE62083E
	for <xen-devel@archiver.kernel.org>; Thu, 30 Jan 2020 14:01:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AACE62083E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ixANU-0006jI-Sy; Thu, 30 Jan 2020 14:01:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Ezal=3T=xen.org=wl@srs-us1.protection.inumbo.net>)
 id 1ixANT-0006jD-16
 for xen-devel@lists.xenproject.org; Thu, 30 Jan 2020 14:01:03 +0000
X-Inumbo-ID: f2863476-4368-11ea-8a73-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f2863476-4368-11ea-8a73-12813bfff9fa;
 Thu, 30 Jan 2020 14:01:01 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1ixANP-0005py-Mu; Thu, 30 Jan 2020 14:00:59 +0000
Received: from 41.142.6.51.dyn.plus.net ([51.6.142.41] helo=debian)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1ixANP-0006jW-DJ; Thu, 30 Jan 2020 14:00:59 +0000
Date: Thu, 30 Jan 2020 14:00:56 +0000
From: Wei Liu <wl@xen.org>
To: "Durrant, Paul" <pdurrant@amazon.co.uk>
Message-ID: <20200130140056.ljub3ywkvbokvug5@debian>
References: <20200129202034.15052-1-liuwe@microsoft.com>
 <20200129202034.15052-13-liuwe@microsoft.com>
 <e899b1596ef245bba2d0c19313c6f3bc@EX13D32EUC003.ant.amazon.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e899b1596ef245bba2d0c19313c6f3bc@EX13D32EUC003.ant.amazon.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH v5 12/12] x86/hyperv: setup VP assist page
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
Cc: Wei Liu <liuwe@microsoft.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Michael Kelley <mikelley@microsoft.com>,
 Xen Development List <xen-devel@lists.xenproject.org>,
 Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBKYW4gMzAsIDIwMjAgYXQgMTA6MzQ6MjlBTSArMDAwMCwgRHVycmFudCwgUGF1bCB3
cm90ZToKPiA+ICsKPiA+ICsgICAgdmFsID0gKHZpcnRfdG9fbWZuKG1hcHBpbmcpIDw8IEhWX0hZ
UF9QQUdFX1NISUZUKQo+ID4gKyAgICAgICAgfCBIVl9YNjRfTVNSX1ZQX0FTU0lTVF9QQUdFX0VO
QUJMRTsKPiAKCj4gUGVyaGFwcyBpdCB3b3VsZCBiZSBuZWF0ZXIgdG8gcHV0IHRoZSB2aXJpZGlh
bl9wYWdlX21zciB1bmlvbiBpbnRvCj4gaHlwZXJ2LXRsZnMuaCBhbmQgdGhlbiB1c2UgdGhhdC4K
CkRvbmUuIE5vdyB0aGlzIHNlcmllcyBpcyBvbmUgcGF0Y2ggbG9uZ2VyLi4uCgpXZWkuCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
