Return-Path: <SRS0=IXL8=37=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71C68C352A3
	for <xen-devel@archiver.kernel.org>; Tue, 11 Feb 2020 15:40:22 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4B39C2051A
	for <xen-devel@archiver.kernel.org>; Tue, 11 Feb 2020 15:40:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4B39C2051A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j1Xdn-0007kS-Rg; Tue, 11 Feb 2020 15:39:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=zfJQ=37=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1j1Xdm-0007kJ-Ir
 for xen-devel@lists.xenproject.org; Tue, 11 Feb 2020 15:39:58 +0000
X-Inumbo-ID: c15d46b4-4ce4-11ea-b5c7-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c15d46b4-4ce4-11ea-b5c7-12813bfff9fa;
 Tue, 11 Feb 2020 15:39:57 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 57BFCC1FB;
 Tue, 11 Feb 2020 15:39:56 +0000 (UTC)
To: xen-devel@lists.xenproject.org
References: <20200128142818.27200-1-jgross@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <11156f81-f538-9e42-9950-804e9dffd7c0@suse.com>
Date: Tue, 11 Feb 2020 16:39:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20200128142818.27200-1-jgross@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 0/3] tools/xenstore
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
Cc: Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjguMDEuMjAgMTU6MjgsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4gU29tZSBwYXRjaGVzIGZv
ciBYZW5zdG9yZS1zdHViZG9tIHdoaWNoIGhhdmUgYmVlbiBseWluZyBhcm91bmQgaW4gbXkKPiBs
b2NhbCB0cmVlIGZvciBzb21lIHRpbWUgbm93Lgo+IAo+IEp1ZXJnZW4gR3Jvc3MgKDMpOgo+ICAg
IHhlbnN0b3JlOiBzZXR1cCB4ZW5zdG9yZSBzdHViZG9tIGNvbnNvbGUgaW50ZXJmYWNlIHByb3Bl
cmx5Cj4gICAgeGVuc3RvcmU6IGFkZCBjb25zb2xlIHhlbnN0b3JlIGVudHJpZXMgZm9yIHhlbnN0
b3JlIHN0dWJkb20KPiAgICB4ZW5zdG9yZTogcmVtb3ZlIG5vdCBhcHBsaWNhYmxlIGNvbnRyb2wg
Y29tbWFuZHMgaW4gc3R1YmRvbQo+IAo+ICAgdG9vbHMvaGVscGVycy9pbml0LXhlbnN0b3JlLWRv
bWFpbi5jIHwgNDQgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKystCj4gICB0b29s
cy94ZW5zdG9yZS94ZW5zdG9yZWRfY29udHJvbC5jICAgfCAxOCArKysrKysrKysrKysrKysKPiAg
IDIgZmlsZXMgY2hhbmdlZCwgNjEgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+IAoKUGlu
Zz8KCgpKdWVyZ2VuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
