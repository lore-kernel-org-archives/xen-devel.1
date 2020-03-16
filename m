Return-Path: <SRS0=vogb=5B=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4386C0044D
	for <xen-devel@archiver.kernel.org>; Mon, 16 Mar 2020 09:10:40 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7E88220663
	for <xen-devel@archiver.kernel.org>; Mon, 16 Mar 2020 09:10:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7E88220663
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jDllT-0005q8-HF; Mon, 16 Mar 2020 09:10:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=+XhT=5B=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jDllS-0005q2-FJ
 for xen-devel@lists.xenproject.org; Mon, 16 Mar 2020 09:10:26 +0000
X-Inumbo-ID: f8bae2ce-6765-11ea-b7d4-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f8bae2ce-6765-11ea-b7d4-12813bfff9fa;
 Mon, 16 Mar 2020 09:10:25 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id C5B86AFF4;
 Mon, 16 Mar 2020 09:10:24 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <60130f14-3fc5-e40d-fec6-2448fefa6fc4@suse.com>
 <513e4f93-a8a0-ae72-abcc-aa28531eca97@suse.com>
 <bab16aee-bb0c-1e7b-62b8-4a70c54314a8@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <59fb3a7c-dd03-d9f6-2588-aae300b3d28f@suse.com>
Date: Mon, 16 Mar 2020 10:10:24 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <bab16aee-bb0c-1e7b-62b8-4a70c54314a8@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 4/4] x86/APIC: restrict certain messages to
 BSP
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTMuMDMuMjAyMCAxNzoxOCwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAxMy8wMy8yMDIw
IDA5OjI2LCBKYW4gQmV1bGljaCB3cm90ZToKPj4gQWxsIENQVXMgZ2V0IGFuIGVxdWFsIHNldHRp
bmcgb2YgRU9JIGJyb2FkY2FzdCBzdXBwcmVzc2lvbjsgbm8gbmVlZCB0bwo+PiBsb2cgb25lIG1l
c3NhZ2UgcGVyIENQVSwgZXZlbiBpZiBpdCdzIG9ubHkgaW4gdmVyYm9zZSBBUElDIG1vZGUuCj4+
Cj4+IE9ubHkgdGhlIEJTUCBpcyBlbGlnaWJsZSB0byBwb3NzaWJseSBnZXQgRXh0SU5UIGVuYWJs
ZWQ7IG5vIG5lZWQgdG8gbG9nCj4+IHRoYXQgaXQgZ2V0cyBkaXNhYmxlZCBvbiBhbGwgQVBzLCBl
dmVuIGlmIC0gYWdhaW4gLSBpdCdzIG9ubHkgaW4gdmVyYm9zZQo+PiBBUElDIG1vZGUuCj4gCj4g
SG93IHRydWUgaXMgdGhpcyBpbiBwcmFjdGljZT8KCkkgZ3Vlc3MgeW91IHJlYWQgImVsaWdpYmxl
IiBhcyAiaW4gdGhlb3J5Iiwgd2hlcmVhcyBpdCBpcyBtZWFudCBhcyAid2l0aApob3cgb3VyIFth
bmQgaW4gcGFydGljdWxhciB0aGlzXSBjb2RlIGlzIHdvcmtpbmcgcmlnaHQgbm93Ii4gRXZlbiBp
ZiB3ZQpkZWNpZGVkIHRvIHN3aXRjaCB0aGUgQ1BVIHRvIGhhbmRsZSBFeHRJTlQsIGl0IHN0aWxs
IHdvdWxkbid0IG5lZWQgdG8gYmUKb25lIG1lc3NhZ2UgcGVyIENQVSAtIGl0IHdvdWxkIHN1ZmZp
Y2UgdG8gaXNzdWUgdGhlIG1lc3NhZ2UgZm9yIHRoZSBvbmUKQ1BVIGdldHRpbmcgRXh0SU5UIGVu
YWJsZWQuCgpKYW4KCj4gSSBrbm93IGl0IGlzIGNlcnRhaW5seSB0aGUgcmVjb21tZW5kZWQgY29u
ZmlndXJhdGlvbiwgYnV0IGludGVycnVwdAo+IHJlbWFwcGluZyBjYW4gZGVmaW5pdGVseSBwb2lu
dCBFeHRJTlQgYXQgYXJiaXRyYXJ5IENQVXMsIGFuZCBJSVJDLCB0aGUKPiBNUCBzcGVjIHNpbXBs
eSBzYXlzIHRoYXQgIm9ubHkgb25lIENQVSBzaG91bGQgYmUgY29uZmlndXJlZCB0byByZWNlaXZl
Cj4gRXh0SU5UIi4KPiAKPiBJIGtub3cgd2UgZGVmaW5pdGVseSBoYXZlIGJ1Z3Mgd2l0aCBFeGlJ
TlQgaGFuZGxpbmcsIGJ1dCBJIGhhdmVuJ3QgaGFkCj4gdGltZSB0byBkZWJ1ZyBmdXJ0aGVyLgo+
IAo+IH5BbmRyZXcKPiAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
