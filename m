Return-Path: <SRS0=chTg=5F=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75171C4332D
	for <xen-devel@archiver.kernel.org>; Fri, 20 Mar 2020 13:37:22 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4F25620739
	for <xen-devel@archiver.kernel.org>; Fri, 20 Mar 2020 13:37:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4F25620739
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jFHpn-000383-9s; Fri, 20 Mar 2020 13:37:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=LPue=5F=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jFHpm-00037x-0d
 for xen-devel@lists.xenproject.org; Fri, 20 Mar 2020 13:37:10 +0000
X-Inumbo-ID: e55a41aa-6aaf-11ea-bd66-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e55a41aa-6aaf-11ea-bd66-12813bfff9fa;
 Fri, 20 Mar 2020 13:37:09 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 46931ADBB;
 Fri, 20 Mar 2020 13:37:08 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200319152622.31758-1-andrew.cooper3@citrix.com>
 <20200319152622.31758-5-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <5bc79b55-37c6-005f-2dd9-ac929d3627fb@suse.com>
Date: Fri, 20 Mar 2020 14:37:07 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200319152622.31758-5-andrew.cooper3@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 4/6] x86/ucode: Rationalise startup and
 family/model checks
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

T24gMTkuMDMuMjAyMCAxNjoyNiwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBEcm9wIG1pY3JvY29k
ZV9pbml0X3tpbnRlbCxhbWR9KCksIGV4cG9ydCB7aW50ZWwsYW1kfV91Y29kZV9vcHMsIGFuZCB1
c2UgYQo+IHN3aXRjaCBzdGF0ZW1lbnQgaW4gZWFybHlfbWljcm9jb2RlX2luaXQoKSByYXRoZXIg
dGhhbiBwcm9iaW5nIGVhY2ggdmVuZG9yIGluCj4gdHVybi4gIFRoaXMgYWxsb3dzIHRoZSBtaWNy
b2NvZGVfb3BzIHBvaW50ZXIgdG8gYmVjb21lIGxvY2FsIHRvIGNvcmUuYy4KPiAKPiBBcyB0aGVy
ZSBhcmUgbm8gZXh0ZXJuYWwgdXNlcnMgb2YgbWljcm9jb2RlX29wcywgdGhlcmUgaXMgbm8gbmVl
ZCBmb3IKPiBjb2xsZWN0X2NwdV9pbmZvKCkgdG8gaW1wbGVtZW50IHNhbml0eSBjaGVja3MuICBN
b3ZlIGFwcGxpY2FibGUgY2hlY2tzIHRvCj4gZWFybHlfbWljcm9jb2RlX2luaXQoKSBzbyB0aGV5
IGFyZSBwZXJmb3JtZWQgb25jZSwgcmF0aGVyIHRoYW4gcmVwZWF0ZWRseS4KPiAKPiBJdGVtcyB0
byBub3RlOgo+ICAqIFRoZSBBTUQgdWNvZGUgZHJpdmVyIGRvZXMgaGF2ZSBhbiB1cHBlciBmYW1p
bGl5IGxpbWl0IG9mIDB4MTcsIGFzIGEgc2lkZQo+ICAgIGVmZmVjdCBvZiB0aGUgbG9naWMgaW4g
dmVyaWZ5X3BhdGNoX3NpemUoKSB3aGljaCBkb2VzIG5lZWQgdXBkYXRpbmcgZm9yCj4gICAgZWFj
aCBuZXcgbW9kZWwuCgpJIGRvbid0IHNlZSB0aGlzIGJlaW5nIHRoZSBjYXNlLCBhbmQgaGVuY2Ug
SSB0aGluayBpdCBpcyB0aGlzIHBhdGNoCndoaWNoIGludHJvZHVjZXMgc3VjaCBhIHJlc3RyaWN0
aW9uLiBBcyBsb25nIGEgcGF0Y2hlcyBhcmUgbGVzcwp0aGFuIDJrLCBhbGwgdW5zcGVjaWZpZWQg
ZmFtaWxpZXMgYXJlIHN1cHBvcnRlZCBieSB2ZXJpZnlfcGF0Y2hfc2l6ZSgpCnRocm91Z2ggaXRz
IGRlZmF1bHQ6IGNhc2UgbGFiZWwuIChBcmd1YWJseSB0aGUgbmFtZSBGMVhIX01QQl9NQVhfU0la
RQpkb2Vzbid0IHJlYWxseSBmaXQgaG93IGl0IGlzIGJlaW5nIHVzZWQuKQoKSSdtIGhhcHB5IGFi
b3V0IGFsbCBvdGhlciBjaGFuZ2VzIG1hZGUgaGVyZS4KCkphbgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
