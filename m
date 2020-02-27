Return-Path: <SRS0=CJRG=4P=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B830C4BA24
	for <xen-devel@archiver.kernel.org>; Thu, 27 Feb 2020 08:12:30 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 048A62467F
	for <xen-devel@archiver.kernel.org>; Thu, 27 Feb 2020 08:12:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 048A62467F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j7EHJ-0008Nh-IN; Thu, 27 Feb 2020 08:12:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Qtag=4P=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j7EHI-0008NZ-2a
 for xen-devel@lists.xenproject.org; Thu, 27 Feb 2020 08:12:16 +0000
X-Inumbo-ID: dce8ef72-5938-11ea-95ed-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id dce8ef72-5938-11ea-95ed-12813bfff9fa;
 Thu, 27 Feb 2020 08:12:15 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 48411AC1D;
 Thu, 27 Feb 2020 08:12:14 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200226202221.6555-1-andrew.cooper3@citrix.com>
 <20200226202221.6555-8-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <b3a3ef2e-bf0a-0f88-1dfb-3ed0498bd7ff@suse.com>
Date: Thu, 27 Feb 2020 09:12:23 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200226202221.6555-8-andrew.cooper3@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 07/10] x86/cpuid: Compile out unused
 logic/objects
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjYuMDIuMjAyMCAyMToyMiwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBDUFVJRCBQb2xpY3kg
b2JqZWN0cyBhcmUgbGFyZ2UgKDE4NjAgYnl0ZXMgYXQgdGhlIHRpbWUgb2Ygd3JpdGluZyksIHNv
Cj4gY29tcGlsaW5nIHRoZW0gb3V0IGJhc2VkIG9uIENPTkZJR197UFYsSFZNfSBtYWtlcyBhIGxv
dCBvZiBzZW5zZS4KPiAKPiBUaGlzIGludm9sdmVzIGEgYml0IG9mIGNvbXBsZXhpdHkgaW4gaW5p
dF9kb21haW5fY3B1aWRfcG9saWN5KCkgYW5kCj4gcmVjYWxjdWxhdGVfY3B1aWRfcG9saWN5KCkg
YXMgaXNfcHZfZG9tYWluKCkgY2FuJ3QgYmUgZXZhdWxhdGVkIGF0IGNvbXBpbGUKPiB0aW1lLgo+
IAo+IFNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5j
b20+CgpXaXRoIHRoZSBzYW1lIHJlbWFyayBhcyBmb3IgdGhlIE1TUiBzaWRlClJldmlld2VkLWJ5
OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgpKYW4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
