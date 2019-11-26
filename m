Return-Path: <SRS0=lwom=ZS=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC385C432C3
	for <xen-devel@archiver.kernel.org>; Tue, 26 Nov 2019 15:45:11 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 958642071E
	for <xen-devel@archiver.kernel.org>; Tue, 26 Nov 2019 15:45:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 958642071E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZd1N-0000ot-RP; Tue, 26 Nov 2019 15:44:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=EMZS=ZS=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iZd1M-0000on-SG
 for xen-devel@lists.xenproject.org; Tue, 26 Nov 2019 15:44:56 +0000
X-Inumbo-ID: b179ddec-1063-11ea-a3a3-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b179ddec-1063-11ea-a3a3-12813bfff9fa;
 Tue, 26 Nov 2019 15:44:55 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id E9DE1BBD1;
 Tue, 26 Nov 2019 15:44:54 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20191126120357.13398-1-andrew.cooper3@citrix.com>
 <20191126120357.13398-4-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <593d3349-56c9-6faa-94b1-eb41c34fa40a@suse.com>
Date: Tue, 26 Nov 2019 16:45:00 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191126120357.13398-4-andrew.cooper3@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 3/3] x86/svm: Write the correct %eip into
 the outgoing task
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
Cc: Juergen Gross <jgross@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjYuMTEuMjAxOSAxMzowMywgQW5kcmV3IENvb3BlciB3cm90ZToKPiBUaGUgVEFTS19TV0lU
Q0ggdm1leGl0IGhhcyBmYXVsdCBzZW1hbnRpY3MsIGFuZCBkb2Vzbid0IHByb3ZpZGUgYW55IE5S
SVBzCj4gYXNzaXN0YW5jZSB3aXRoIGluc3RydWN0aW9uIGxlbmd0aC4gIEFzIGEgcmVzdWx0LCBh
bnkgaW5zdHJ1Y3Rpb24taW5kdWNlZCB0YXNrCj4gc3dpdGNoIGhhcyB0aGUgb3V0Z29pbmcgdGFz
aydzICVlaXAgcG9pbnRpbmcgYXQgdGhlIGluc3RydWN0aW9uIHN3aXRjaCBjYXVzZWQKPiB0aGUg
c3dpdGNoLCByYXRoZXIgdGhhbiBhZnRlciBpdC4KPiAKPiBUaGlzIGNhdXNlcyBjYWxsZXJzIG9m
IHRhc2sgZ2F0ZXMgdG8gbGl2ZWxvY2sgKHJlcGVhdGVkbHkgZXhlY3V0ZSB0aGUgY2FsbC9qbXAK
PiB0byBlbnRlciB0aGUgdGFzayksIGFuZCBhbnkgcmVzdGFydGFibGUgdGFzayB0byBiZWNvbWUg
YSBub3AgYWZ0ZXIgaXRzIGZpcnN0Cj4gdXNlICh0aGUgKHJlKWVudHJ5IHN0YXRlIHBvaW50cyBh
dCB0aGUgcmV0L2lyZXQgdXNlZCB0byBleGl0IHRoZSB0YXNrKS4KPiAKPiAzMmJpdCBXaW5kb3dz
IGluIHBhcnRpY3VsYXIgaXMga25vd24gdG8gdXNlIHRhc2sgZ2F0ZXMgZm9yIE5NSSBoYW5kbGlu
ZywgYW5kCj4gdG8gdXNlIE5NSSBJUElzLgo+IAo+IEluIHRoZSB0YXNrIHN3aXRjaCBoYW5kbGVy
LCBkaXN0aW5ndWlzaCBpbnN0cnVjdGlvbi1pbmR1Y2VkIGZyb20KPiBpbnRlcnJ1cHQvZXhjZXB0
aW9uLWluZHVjZWQgdGFzayBzd2l0Y2hlcywgYW5kIGRlY29kZSB0aGUgaW5zdHJ1Y3Rpb24gdW5k
ZXIKPiAlcmlwIHRvIGNhbGN1bGF0ZSBpdHMgbGVuZ3RoLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEFu
ZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+CgpSZXZpZXdlZC1ieTogSmFu
IEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
