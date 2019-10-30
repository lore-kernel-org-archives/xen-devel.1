Return-Path: <SRS0=CYfj=YX=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78FFDCA9EAF
	for <xen-devel@archiver.kernel.org>; Wed, 30 Oct 2019 08:42:16 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4B514205ED
	for <xen-devel@archiver.kernel.org>; Wed, 30 Oct 2019 08:42:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4B514205ED
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iPjYG-0006CK-Fj; Wed, 30 Oct 2019 08:42:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=iUym=YX=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iPjYF-0006CF-Ho
 for xen-devel@lists.xenproject.org; Wed, 30 Oct 2019 08:41:59 +0000
X-Inumbo-ID: 2124faba-faf1-11e9-951e-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2124faba-faf1-11e9-951e-12813bfff9fa;
 Wed, 30 Oct 2019 08:41:56 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id B3B58B5F2;
 Wed, 30 Oct 2019 08:41:55 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20191023135812.21348-1-andrew.cooper3@citrix.com>
 <20191023135812.21348-6-andrew.cooper3@citrix.com>
 <36bbdcf7-28c3-b924-3d3a-145b6282bd0f@suse.com>
 <1f0bd38c-d1c4-fa45-d13e-55615be4188e@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ffa68df2-0f4c-da6c-cd57-29746ae5f889@suse.com>
Date: Wed, 30 Oct 2019 09:41:57 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1f0bd38c-d1c4-fa45-d13e-55615be4188e@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 5/7] x86/livepatch: Fail the build if
 duplicate symbols exist
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
Cc: Juergen Gross <jgross@suse.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Norbert Manthey <nmanthey@amazon.de>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjkuMTAuMjAxOSAxODowNiwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAyNC8xMC8yMDE5
IDEzOjAzLCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24gMjMuMTAuMjAxOSAxNTo1OCwgQW5kcmV3
IENvb3BlciB3cm90ZToKPj4+IC0tLSBhL3hlbi9jb21tb24vS2NvbmZpZwo+Pj4gKysrIGIveGVu
L2NvbW1vbi9LY29uZmlnCj4+PiBAQCAtMzYxLDkgKzM2MSwyMyBAQCBjb25maWcgRkFTVF9TWU1C
T0xfTE9PS1VQCj4+PiAgCj4+PiAgCSAgSWYgdW5zdXJlLCBzYXkgWS4KPj4+ICAKPj4+ICtjb25m
aWcgRU5GT1JDRV9VTklRVUVfU1lNQk9MUwo+Pj4gKwlib29sICJFbmZvcmNlIHVuaXF1ZSBzeW1i
b2xzIiBpZiBMSVZFUEFUQ0gKPj4+ICsJZGVmYXVsdCB5IGlmIExJVkVQQVRDSAo+PiBJbnN0ZWFk
IG9mIHR3byBpZGVudGljYWwgImlmIiwgd2h5IG5vdCAiZGVwZW5kcyBvbiBMSVZFUEFUQ0giPwo+
Pgo+Pj4gKwktLS1oZWxwLS0tCj4+PiArCSAgTXVsdGlwbGUgc3ltYm9scyB3aXRoIHRoZSBzYW1l
IG5hbWUgYXJlbid0IGdlbmVyYWxseSBhIHByb2JsZW0KPj4+ICsJICB1bmxlc3MgTGl2ZSBwYXRj
aGluZyBpcyB0byBiZSB1c2VkLgo+Pj4gKwo+Pj4gKwkgIExpdmVwYXRjaCBsb2FkaW5nIGludm9s
dmVzIHJlc29sdmluZyByZWxvY2F0aW9ucyBhZ2FpbnN0IHN5bWJvbAo+Pj4gKwkgIG5hbWVzLCBh
bmQgYXR0ZW1wdGluZyB0byBhIGR1cGxpY2F0ZSBzeW1ib2wgaW4gYSBsaXZlcGF0Y2ggd2lsbAo+
Pj4gKwkgIHJlc3VsdCBpbiBpbmNvcnJlY3QgbGl2ZXBhdGNoIGFwcGxpY2F0aW9uLgo+Pj4gKwo+
Pj4gKwkgIFRoaXMgb3B0aW9uIHNob3VsZCBiZSB1c2VkIHRvIGVuc3VyZSB0aGF0IGEgYnVpbGQg
b2YgWGVuIGNhbiBoYXZlIGEKPj4+ICsJICBsaXZlcGF0Y2ggYnVpbGQgYW5kIGFwcGx5IGNvcnJl
Y3RseS4KPj4+ICsKPj4+ICBjb25maWcgU1VQUFJFU1NfRFVQTElDQVRFX1NZTUJPTF9XQVJOSU5H
Uwo+Pj4gLQlib29sICJTdXBwcmVzcyBkdXBsaWNhdGUgc3ltYm9sIHdhcm5pbmdzIiBpZiAhTElW
RVBBVENICj4+PiAtCWRlZmF1bHQgeSBpZiAhTElWRVBBVENICj4+PiArCWJvb2wgIlN1cHByZXNz
IGR1cGxpY2F0ZSBzeW1ib2wgd2FybmluZ3MiIGlmICFFTkZPUkNFX1VOSVFVRV9TWU1CT0xTCj4+
PiArCWRlZmF1bHQgeSBpZiAhRU5GT1JDRV9VTklRVUVfU1lNQk9MUwo+PiBTaW1pbGFybHkgaGVy
ZSB0aGVuLiBXaXRoIHRoaXMgY2hhbmdlZCwgb3Igd2l0aCBhIHByb3BlciByZWFzb24KPj4gc3Vw
cGxpZWQKPj4gUmV2aWV3ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPiAK
PiBUaGF0J3MgYSBxdWVzdGlvbiBmb3IgdGhlIGF1dGhvciBvZiBjL3MgMDY0YTI2NTIyMzMgdG8g
YW5zd2VyLi4uwqAgSSdtCj4gbWVyZWx5IGZvbGxvd2luZyB0aGUgcHJldmFpbGluZyBzdHlsZS4K
CiJQcmV2YWlsaW5nIHN0eWxlIiBzZWVtcyBhIGxpdHRsZSBib2xkIGNvbnNpZGVyaW5nIHRoYXQg
YWNjb3JkaW5nIHRvCm15IGdyZXAtaW5nIHRoZXJlJ3MgZXhhY3RseSBvbiBvdGhlciBzdWNoIGlu
c3RhbmNlIChWR0EpLiBJLmUuIHlvdSdkCmdyb3cgdGhlICJiYWRuZXNzIiBieSA1MCUgd2hlbiB5
b3UgY291bGQgZXF1YWxseSB3ZWxsIHNocmluayBpdCBieQp0aGlzIHNhbWUgcGVyY2VudGFnZS4K
CkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
