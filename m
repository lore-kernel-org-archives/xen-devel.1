Return-Path: <SRS0=ZpmR=ST=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5DABC282DA
	for <xen-devel@archiver.kernel.org>; Wed, 17 Apr 2019 16:31:01 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ADF2E20663
	for <xen-devel@archiver.kernel.org>; Wed, 17 Apr 2019 16:31:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ADF2E20663
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hGnSK-0004nw-GD; Wed, 17 Apr 2019 16:30:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Uj5y=ST=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hGnSJ-0004nr-DL
 for xen-devel@lists.xenproject.org; Wed, 17 Apr 2019 16:30:39 +0000
X-Inumbo-ID: 21d54800-612e-11e9-9f43-8f7c22cabe99
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 21d54800-612e-11e9-9f43-8f7c22cabe99;
 Wed, 17 Apr 2019 16:30:38 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3F4C2A78;
 Wed, 17 Apr 2019 09:30:37 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 96AB33F557;
 Wed, 17 Apr 2019 09:30:36 -0700 (PDT)
To: Stefano Stabellini <sstabellini@kernel.org>
References: <20190319232753.26521-1-julien.grall@arm.com>
 <alpine.DEB.2.10.1904161406550.1370@sstabellini-ThinkPad-X260>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <c9689104-c58d-8c4f-2470-2852967f25bc@arm.com>
Date: Wed, 17 Apr 2019 17:30:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.10.1904161406550.1370@sstabellini-ThinkPad-X260>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] xen/arm64: head: Combine lsl and str
 instructions in a single one
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
Cc: xen-devel@lists.xenproject.org, Julien Grall <julien.grall@linaro.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="UTF-8"; format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190417163035.EhcVq6kzADeWLnXELDGwCyKosxDhKw-HqyDjACwnEyU@z>

SGksCgpPbiAxNi8wNC8yMDE5IDIyOjA3LCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6Cj4gT24g
VHVlLCAxOSBNYXIgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+PiBGcm9tOiBKdWxpZW4gR3Jh
bGwgPGp1bGllbi5ncmFsbEBsaW5hcm8ub3JnPgo+Pgo+PiBXZSBjYW4gb3B0aW1pemUgYSBiaXQg
dGhlIGFzc2VtYmx5IGNvZGUgYnkgY29tYmluaW5nIHRoZSAyIGluc3RydWN0aW9ucwo+PiBpbiBh
IHNpbmdsZSBvbmUuIFRoaXMgbGlrZWx5IG5vdCBnb2luZyB0byBtYWtlIHRoZSBjb2RlIGZhc3Rl
ciwgYnV0Cj4+IGxpa2VseSBtYWtlIGVhc2llciB0byByZWFkIHRoZSBhc3NlbWJseS4KPj4KPj4g
U2lnbmVkLW9mZi1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAbGluYXJvLm9yZz4KPiAK
PiBSZXZpZXdlZC1ieTogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3Jn
PgoKVGhhbmsgeW91ISBJIGhhdmUgcHVzaGVkIHRvIG15IGJyYW5jaCBuZXh0LTQuMTMgZm9yIG5v
dy4gSXQgd2lsbCBiZSBtZXJnZWQgb25jZSAKdGhlIGNvbW1pdCBtb3JhdG9yaXVtIGlzIGxpZnRl
ZC4KCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
