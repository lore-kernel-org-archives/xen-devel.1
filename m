Return-Path: <SRS0=EJ/f=ZO=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45BDCC432C0
	for <xen-devel@archiver.kernel.org>; Fri, 22 Nov 2019 13:08:55 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1B2BA20714
	for <xen-devel@archiver.kernel.org>; Fri, 22 Nov 2019 13:08:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1B2BA20714
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iY8fq-0004Cz-Oi; Fri, 22 Nov 2019 13:08:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=28IZ=ZO=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iY8fp-0004Cu-Hk
 for xen-devel@lists.xenproject.org; Fri, 22 Nov 2019 13:08:33 +0000
X-Inumbo-ID: 2f162316-0d29-11ea-a351-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2f162316-0d29-11ea-a351-12813bfff9fa;
 Fri, 22 Nov 2019 13:08:32 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id D3470AB98;
 Fri, 22 Nov 2019 13:08:31 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20191121221551.1175-1-andrew.cooper3@citrix.com>
 <20191121221551.1175-2-andrew.cooper3@citrix.com>
 <20191122123716.GX72134@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <581b0f48-cd25-7a80-1b13-2bbe51fc2904@suse.com>
Date: Fri, 22 Nov 2019 14:08:34 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191122123716.GX72134@Air-de-Roger>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 1/2] x86/vtx: Fix fault semantics for early
 task switch failures
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
Cc: Juergen Gross <jgross@suse.com>, Kevin Tian <kevin.tian@intel.com>,
 Wei Liu <wl@xen.org>, Jun Nakajima <jun.nakajima@intel.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjIuMTEuMjAxOSAxMzozNywgUm9nZXIgUGF1IE1vbm7DqSAgd3JvdGU6Cj4gT24gVGh1LCBO
b3YgMjEsIDIwMTkgYXQgMTA6MTU6NTBQTSArMDAwMCwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4g
VGhlIFZULXggdGFzayBzd2l0Y2ggaGFuZGxlciBhZGRzIGluc3RfbGVuIHRvIHJpcCBiZWZvcmUg
Y2FsbGluZwo+PiBodm1fdGFza19zd2l0Y2goKS4gIFRoaXMgY2F1c2VzIGVhcmx5IGZhdWx0cyB0
byBiZSBkZWxpdmVyZWQgdG8gdGhlIGd1ZXN0IHdpdGgKPj4gdHJhcCBzZW1hbnRpY3MsIGFuZCBi
cmVhayByZXN0YXJ0aWJpbGl0eS4KPj4KPj4gSW5zdGVhZCwgcGFzcyB0aGUgaW5zdHJ1Y3Rpb24g
bGVuZ3RoIGludG8gaHZtX3Rhc2tfc3dpdGNoKCkgYW5kIHdyaXRlIGl0IGludG8KPj4gdGhlIG91
dGdvaW5nIHRzcyBvbmx5LCBsZWF2aW5nIHJpcCBpbiBpdHMgb3JpZ2luYWwgbG9jYXRpb24uCj4+
Cj4+IEZvciBub3csIHBhc3MgMCBvbiB0aGUgU1ZNIHNpZGUuICBUaGlzIGhpZ2hsaWdodHMgYSBz
ZXBhcmF0ZSBwcmVleGlzdGluZyBidWcKPj4gd2hpY2ggd2lsbCBiZSBhZGRyZXNzZWQgaW4gdGhl
IGZvbGxvd2luZyBwYXRjaC4KPj4KPj4gV2hpbGUgYWRqdXN0aW5nIGNhbGwgc2l0ZXMsIGRyb3Ag
dGhlIHVubmVjZXNzYXJ5IHVpbnQxNl90IGNhc3QuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEFuZHJl
dyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Cj4gCj4gQ29kZSBMR1RNOgo+IAo+
IFJldmlld2VkLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KCkFj
a2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
