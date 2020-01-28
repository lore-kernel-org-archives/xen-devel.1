Return-Path: <SRS0=JAFy=3R=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27816C33CB3
	for <xen-devel@archiver.kernel.org>; Tue, 28 Jan 2020 16:18:50 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0087924681
	for <xen-devel@archiver.kernel.org>; Tue, 28 Jan 2020 16:18:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0087924681
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iwTZT-00062v-RP; Tue, 28 Jan 2020 16:18:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=iQoc=3R=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iwTZS-00062q-Ly
 for xen-devel@lists.xenproject.org; Tue, 28 Jan 2020 16:18:34 +0000
X-Inumbo-ID: d48ac94c-41e9-11ea-a933-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d48ac94c-41e9-11ea-a933-bc764e2007e4;
 Tue, 28 Jan 2020 16:18:34 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 72E1AB03C;
 Tue, 28 Jan 2020 16:18:33 +0000 (UTC)
To: Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200122202343.5703-1-liuwe@microsoft.com>
 <20200122202343.5703-7-liuwe@microsoft.com>
 <c73aa226-df1a-552c-caea-f6a781dc63c6@suse.com>
 <20200128155510.ruie6ck4i3hg5dub@debian>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <568d6410-ad85-74f8-84ab-2c5e47d2c314@suse.com>
Date: Tue, 28 Jan 2020 17:18:33 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200128155510.ruie6ck4i3hg5dub@debian>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v4 6/7] x86/hyperv: retrieve vp_index from
 Hyper-V
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
Cc: Xen Development List <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <liuwe@microsoft.com>, Michael Kelley <mikelley@microsoft.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjguMDEuMjAyMCAxNjo1NSwgV2VpIExpdSB3cm90ZToKPiBPbiBUaHUsIEphbiAyMywgMjAy
MCBhdCAwNDo0ODozOFBNICswMTAwLCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24gMjIuMDEuMjAy
MCAyMToyMywgV2VpIExpdSB3cm90ZToKPj4+IFRoaXMgd2lsbCBiZSB1c2VmdWwgd2hlbiBpbnZv
a2luZyBoeXBlcmNhbGwgdGhhdCB0YXJnZXRzIHNwZWNpZmljCj4+PiB2Y3B1KHMpLgo+Pj4KPj4+
IFNpZ25lZC1vZmYtYnk6IFdlaSBMaXUgPGxpdXdlQG1pY3Jvc29mdC5jb20+Cj4+PiBSZXZpZXdl
ZC1ieTogUGF1bCBEdXJyYW50IDxwYXVsQHhlbi5vcmc+Cj4+Cj4+IEZvciBmb3JtYWwgcmVhc29u
cwo+PiBBY2tlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+Pgo+PiBIb3dl
dmVyIEkgd29uZGVyIHdoZXRoZXIgdGhlIFZpcmlkaWFuIGVudHJ5IGluIE1BSU5UQUlORVJTIHNo
b3VsZG4ndAo+PiBiZSBleHRlbmRlZCBieQo+Pgo+PiBGOgl4ZW4vYXJjaC94ODYvZ3Vlc3QvaHlw
ZXJ2Lwo+Pgo+PiAoYW5kIHBvc3NpYmx5IGhhdmUgaXRzIHRpdGxlIGFkanVzdGVkKS4gVGhvdWdo
dHM/Cj4gCj4gVGhpcyBpc24ndCBhYm91dCBlbXVsYXRpbmcgSHlwZXItViBpbnNpZGUgWGVuLCBz
byBJIGRvbid0IHRoaW5rIHRoYXQncwo+IHRoZSByaWdodCBhcHByb2FjaCBoZXJlLgoKV2VsbCwg
aXQncyB0aGUgY29kZSBwcm9kdWNpbmcgdGhlIGludGVyZmFjZSBpbiBvbmUgY2FzZSwgYW5kCmNv
bnN1bWluZyBpdCBoZXJlLiBTbyB0aGVyZSBpcyBzb21lIG92ZXJsYXAgYXQgbGVhc3QuCgo+IFRo
YXQgc2FpZCwgaWYgUGF1bCB3YW50cyB0byB0YWtlIHRoaXMgdW5kZXIgaGlzIHB1cnZpZXcsIGl0
J3MgZmluZSBieSBtZQo+IC0tIHRoYXQgd291bGQgbWFrZSBtZSBlYXNpZXIgdG8gdXBzdHJlYW0g
bXkgcGF0Y2guIDstKSAgSSBhbHNvIHdvdWxkbid0Cj4gbWluZCBhZGRpbmcgbXlzZWxmIGFzIG1h
aW50YWluZXIgZm9yIHRoaXMgcGF0aC4KClBlcmhhcHMgYmVzdCBib3RoIG9mIHlvdT8gUGF1bCwg
QW5kcmV3LCB3aGF0IGRvIHlvdSB0aGluaz8KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
