Return-Path: <SRS0=q1ly=3F=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E593C33CB1
	for <xen-devel@archiver.kernel.org>; Thu, 16 Jan 2020 09:46:49 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1815D20661
	for <xen-devel@archiver.kernel.org>; Thu, 16 Jan 2020 09:46:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1815D20661
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1is1jW-0008JT-Qm; Thu, 16 Jan 2020 09:46:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=J9Dq=3F=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1is1jU-0008JI-QA
 for xen-devel@lists.xenproject.org; Thu, 16 Jan 2020 09:46:32 +0000
X-Inumbo-ID: 1266ccba-3845-11ea-86de-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1266ccba-3845-11ea-86de-12813bfff9fa;
 Thu, 16 Jan 2020 09:46:30 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 9868AAF3F;
 Thu, 16 Jan 2020 09:46:29 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200113175020.32730-4-andrew.cooper3@citrix.com>
 <20200115140801.29321-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e6f98379-6d6d-be5e-a4f3-0f36fbbd1a34@suse.com>
Date: Thu, 16 Jan 2020 10:46:30 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20200115140801.29321-1-andrew.cooper3@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 2/4] x86/page: Remove bifurcated
 PAGE_HYPERVISOR constant
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

T24gMTUuMDEuMjAyMCAxNTowOCwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBEZXNwaXRlIGJlaW5n
IHZhZ3VlbHkgYXdhcmUsIHRoZSBkaWZmZXJlbmNlIGJldHdlZW4gUEFHRV9IWVBFUlZJU09SIGlu
IEFTTSBhbmQKPiBDIGNvZGUgaGFzIG5ldmVydGhlbGVzcyBjYXVzZWQgc2V2ZXJhbCBidWdzIEkg
c2hvdWxkIGhhdmUga25vd24gYmV0dGVyIGFib3V0LAo+IGFuZCBjb250cmlidXRlZCB0byByZXZp
ZXcgY29uZnVzaW9uLgo+IAo+IFRoZXJlIGFyZSBleGFjdGx5IDQgdXNlcyBvZiB0aGVzZSBjb25z
dGFudHMgaW4gYXNtIGNvZGUgKGFuZCBvbmUgaXMgc2hvcnRseQo+IGdvaW5nIHRvIGRpc2FwcGVh
cikuCj4gCj4gSW5zdGVhZCBvZiBjcmVhdGluZyB0aGUgY29uc3RhbnRzIHdoaWNoIGJlaGF2ZSBk
aWZmZXJlbnRseSBiZXR3ZWVuIEFTTSBhbmQgQwo+IGNvZGUsIGV4cG9zZSBhbGwgdGhlIGNvbnN0
YW50cyBhbmQgdXNlIG5vbi1hbWJpZ3VvdXMgbm9uLU5YIG9uZXMgaW4gQVNNLgo+IEFkanVzdCB0
aGUgaGlkaW5nIHRvIGp1c3QgX1BBR0VfTlgsIHdoaWNoIGNvbnRhaW5zIGEgQyB0ZXJuYXJ5IGV4
cHJlc3Npb24uCj4gCj4gU2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3Bl
cjNAY2l0cml4LmNvbT4KClJldmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5j
b20+CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
