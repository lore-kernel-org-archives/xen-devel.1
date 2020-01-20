Return-Path: <SRS0=qyBi=3J=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98E4EC2D0DB
	for <xen-devel@archiver.kernel.org>; Mon, 20 Jan 2020 10:01:52 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 75AEA20684
	for <xen-devel@archiver.kernel.org>; Mon, 20 Jan 2020 10:01:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 75AEA20684
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1itTsF-0004zx-Jf; Mon, 20 Jan 2020 10:01:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=xaUo=3J=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1itTsE-0004zs-F2
 for xen-devel@lists.xen.org; Mon, 20 Jan 2020 10:01:34 +0000
X-Inumbo-ID: d49ba566-3b6b-11ea-b93e-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d49ba566-3b6b-11ea-b93e-12813bfff9fa;
 Mon, 20 Jan 2020 10:01:30 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id BCF70B25E;
 Mon, 20 Jan 2020 10:01:29 +0000 (UTC)
To: Sergey Dyasli <sergey.dyasli@citrix.com>
References: <20200117164432.32245-1-sergey.dyasli@citrix.com>
 <20200117164432.32245-2-sergey.dyasli@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <7049fbf6-9bac-d9bf-4505-a80a8171dd40@suse.com>
Date: Mon, 20 Jan 2020 11:01:35 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20200117164432.32245-2-sergey.dyasli@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 2/2] xsm: hide detailed Xen version from
 unprivileged guests
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Doug Goldstein <cardoe@cardoe.com>,
 xen-devel@lists.xen.org, Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Ian Jackson <ian.jackson@eu.citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTcuMDEuMjAyMCAxNzo0NCwgU2VyZ2V5IER5YXNsaSB3cm90ZToKPiB2MiAtLT4gdjM6Cj4g
LSBSZW1vdmUgaHZtbG9hZGVyIGZpbHRlcmluZwoKV2h5PyBTZWVpbmcgdGhlIHByaW9yIGRpc2N1
c3Npb24sIGhvdyBhYm91dCBhZGRpbmcgWEVOVkVSX2RlbmllZCB0bwpyZXR1cm4gdGhlICJkZW5p
ZWQiIHN0cmluZywgYWxsb3dpbmcgY29tcG9uZW50cyB3aGljaCB3YW50IHRvIGZpbHRlcgp0byBr
bm93IGV4YWN0bHkgd2hhdCB0byBsb29rIGZvcj8gQW5kIHRoZW4gcmUtYWRkIHRoZSBmaWx0ZXJp
bmcgeW91CmhhZD8gKFRoZSBoZWxwIHRleHQgb2YgdGhlIGNvbmZpZyBvcHRpb24gc2hvdWxkIHRo
ZW4gcGVyaGFwcyBiZQpleHRlbmRlZCB0byBtYWtlIHZlcnkgY2xlYXIgdGhhdCB0aGUgY2hvc2Vu
IHN0cmluZyBzaG91bGQgbm90IG1hdGNoCmFueXRoaW5nIHRoYXQgY291bGQgcG90ZW50aWFsbHkg
YmUgcmV0dXJuZWQgYnkgYW55IG9mIHRoZSBYRU5WRVJfCnN1Yi1vcHMuKQoKSmFuCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
