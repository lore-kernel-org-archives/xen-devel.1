Return-Path: <SRS0=7THE=S4=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9363AC43218
	for <xen-devel@archiver.kernel.org>; Fri, 26 Apr 2019 08:35:57 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 706D6206E0
	for <xen-devel@archiver.kernel.org>; Fri, 26 Apr 2019 08:35:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 706D6206E0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hJwKX-0008OS-Dh; Fri, 26 Apr 2019 08:35:37 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Yv7G=S4=citrix.com=prvs=01296b64e=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1hJwKV-0008OJ-Ts
 for xen-devel@lists.xenproject.org; Fri, 26 Apr 2019 08:35:35 +0000
X-Inumbo-ID: 42388273-67fe-11e9-843c-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 42388273-67fe-11e9-843c-bc764e045a96;
 Fri, 26 Apr 2019 08:35:34 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,396,1549929600"; d="scan'208";a="84482510"
Date: Fri, 26 Apr 2019 09:35:09 +0100
From: Wei Liu <wei.liu2@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <20190426083509.GM30543@zion.uk.xensource.com>
References: <1556210685-2549-1-git-send-email-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1556210685-2549-1-git-send-email-andrew.cooper3@citrix.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: Re: [Xen-devel] [PATCH] x86/vvmx: Simplify per-CPU memory
 allocations
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
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>,
 Jan Beulich <JBeulich@suse.com>, Jun Nakajima <jun.nakajima@intel.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190426083509.2E3JGNMRw8cf0LZFPhuqxhn9EBg2n6YRfsaSlQSrgBk@z>

T24gVGh1LCBBcHIgMjUsIDIwMTkgYXQgMDU6NDQ6NDVQTSArMDEwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiAgKiBVc2UgWEZSRUUoKSBpbnN0ZWFkIG9mIG9wZW5jb2RpbmcgaXQgaW4gbnZteF9j
cHVfZGVhZCgpCj4gICogQXZvaWQgcmVkdW5kYW50IGV2YWx1YXRpb25zIG9mIHBlcl9jcHUoKQo+
ICAqIERvbid0IGFsbG9jYXRlIHZ2bWNzX2J1ZiBhdCBhbGwgaWYgaXQgaXNuJ3QgZ29pbmcgdG8g
YmUgdXNlZC4gIEl0IGlzIG5ldmVyCj4gICAgdG91Y2hlZCBvbiBoYXJkd2FyZSBsYWNraW5nIHRo
ZSBWTUNTIFNoYWRvd2luZyBmZWF0dXJlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29w
ZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+CgpSZXZpZXdlZC1ieTogV2VpIExpdSA8d2Vp
LmxpdTJAY2l0cml4LmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
