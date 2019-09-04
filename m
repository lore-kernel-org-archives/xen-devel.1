Return-Path: <SRS0=pR42=W7=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00E1DC3A5A7
	for <xen-devel@archiver.kernel.org>; Wed,  4 Sep 2019 13:53:54 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CE1CF22CED
	for <xen-devel@archiver.kernel.org>; Wed,  4 Sep 2019 13:53:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CE1CF22CED
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i5Vj8-0005Mc-B6; Wed, 04 Sep 2019 13:53:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Tt/v=W7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i5Vj7-0005MS-1U
 for xen-devel@lists.xenproject.org; Wed, 04 Sep 2019 13:53:37 +0000
X-Inumbo-ID: 63d4029a-cf1b-11e9-abb6-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 63d4029a-cf1b-11e9-abb6-12813bfff9fa;
 Wed, 04 Sep 2019 13:53:36 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 32259AD7B;
 Wed,  4 Sep 2019 13:53:35 +0000 (UTC)
To: Juergen Gross <jgross@suse.com>
References: <20190904134608.18425-1-jgross@suse.com>
 <20190904134608.18425-2-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <4c0f9d4d-d458-078a-7b21-681695e0efbf@suse.com>
Date: Wed, 4 Sep 2019 15:53:40 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190904134608.18425-2-jgross@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v4 1/4] xen: fix debugtrace clearing
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
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDQuMDkuMjAxOSAxNTo0NiwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBAQCAtMTI4MSwxNCAr
MTI4MCwxNCBAQCB2b2lkIGRlYnVndHJhY2VfcHJpbnRrKGNvbnN0IGNoYXIgKmZtdCwgLi4uKQo+
ICAgICAgewo+ICAgICAgICAgIGlmICggc3RyY21wKGJ1ZiwgbGFzdF9idWYpICkKPiAgICAgICAg
ICB7Cj4gLSAgICAgICAgICAgIGxhc3RfcHJkID0gZGVidWd0cmFjZV9wcmQ7Cj4gKyAgICAgICAg
ICAgIGRlYnVndHJhY2VfcHJkX2xhc3QgPSBkZWJ1Z3RyYWNlX3ByZDsKPiAgICAgICAgICAgICAg
bGFzdF9jb3VudCA9ICsrY291bnQ7Cj4gICAgICAgICAgICAgIHNhZmVfc3RyY3B5KGxhc3RfYnVm
LCBidWYpOwo+ICAgICAgICAgICAgICBzbnByaW50ZihjbnRidWYsIHNpemVvZihjbnRidWYpLCAi
JXUgIiwgY291bnQpOwo+ICAgICAgICAgIH0KPiAgICAgICAgICBlbHNlCj4gICAgICAgICAgewo+
IC0gICAgICAgICAgICBkZWJ1Z3RyYWNlX3ByZCA9IGxhc3RfcHJkOwo+ICsgICAgICAgICAgICBk
ZWJ1Z3RyYWNlX3ByZCA9IGRlYnVndHJhY2VfcHJkX2xhc3Q7Cj4gICAgICAgICAgICAgIHNucHJp
bnRmKGNudGJ1Ziwgc2l6ZW9mKGNudGJ1ZiksICIldS0ldSAiLCBsYXN0X2NvdW50LCArK2NvdW50
KTsKPiAgICAgICAgICB9Cj4gICAgICAgICAgZGVidWd0cmFjZV9hZGRfdG9fYnVmKGNudGJ1Zik7
CgpJJ20gYWZyYWlkIGl0IGlzIHJhdGhlciBsYXN0X2J1ZltdIHdoaWNoIG5lZWRzIGludmFsaWRh
dGluZywgYXQKd2hpY2ggcG9pbnQgbGFzdF9wcmQgY291bGQgaW1vIHJlbWFpbiBsb2NhbCB0byB0
aGlzIGZ1bmN0aW9uLgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
