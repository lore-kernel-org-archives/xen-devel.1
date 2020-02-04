Return-Path: <SRS0=o/65=3Y=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B0DBC2D0B1
	for <xen-devel@archiver.kernel.org>; Tue,  4 Feb 2020 13:35:55 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 46DBB20661
	for <xen-devel@archiver.kernel.org>; Tue,  4 Feb 2020 13:35:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 46DBB20661
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iyyMj-0006hX-3f; Tue, 04 Feb 2020 13:35:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=fS9R=3Y=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iyyMi-0006hQ-1F
 for xen-devel@lists.xenproject.org; Tue, 04 Feb 2020 13:35:44 +0000
X-Inumbo-ID: 3579a37c-4753-11ea-8f44-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3579a37c-4753-11ea-8f44-12813bfff9fa;
 Tue, 04 Feb 2020 13:35:30 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id CD5E9AC53;
 Tue,  4 Feb 2020 13:35:28 +0000 (UTC)
To: Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>
References: <63005C11-CF8C-4794-B9E4-C3856CCF41C1@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <9f2c8dae-532d-5ddf-de2d-244e3c6a8531@suse.com>
Date: Tue, 4 Feb 2020 14:35:34 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <63005C11-CF8C-4794-B9E4-C3856CCF41C1@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [Vote] For Xen Project Code of Conduct (deadline
 March 31st)
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
Cc: "xen-api@lists.xenproject.org" <xen-api@lists.xenproject.org>,
 "minios-devel@lists.xenproject.org" <minios-devel@lists.xenproject.org>,
 "committers@xenproject.org" <committers@xenproject.org>,
 "mirageos-devel@lists.xenproject.org" <mirageos-devel@lists.xenproject.org>,
 xen-devel <xen-devel@lists.xenproject.org>,
 "win-pv-devel@lists.xenproject.org" <win-pv-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTcuMDEuMjAyMCAyMDoxMiwgTGFycyBLdXJ0aCB3cm90ZToKPiBQZW9wbGUgYWxsb3dlZCB0
byB2b3RlIG9uIGJlaGFsZiBvZiB0aGUgSHlwZXJ2aXNvciBwcm9qZWN0IGFyZToKPiBKdWxpZW4g
R3JhbGwsIEFuZHkgQ29vcGVyLCBHZW9yZ2UgRHVubGFwLCBJYW4gSmFja3NvbiwgSmFuIEJldWxp
Y2gsIEtvbnJhZCBSCj4gV2lsaywgU3RlZmFubyBTdGFiZWxsaW5pLCBXZWkgTGl1IGFuZCBQYXVs
IER1cnJhbnQgKGFzIFJlbGVhc2UgTWFuYWdlcikuCgpJIGhhdmUgdG8gYWRtaXQgdGhhdCB3aXRo
IGNlcnRhaW4gcGFydHMgb2YgdGhpcywgYXMgcGVyIGVhcmxpZXIgZGlzY3Vzc2lvbiwKSSdtIG9u
IHRoZSBlZGdlLCBhbmQgaGVuY2UgSSdkIGxpa2UgdG8gZ2l2ZSBhICswLjUgdm90ZSBoZXJlLiBX
aGF0ZXZlciB5b3UKY2FuIHRoZW4gbWFrZSBvZiB0aGlzIC4uLgoKSmFuCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
