Return-Path: <SRS0=M1Mj=4W=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40FFAC3F2D1
	for <xen-devel@archiver.kernel.org>; Thu,  5 Mar 2020 11:35:08 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1B88D2073D
	for <xen-devel@archiver.kernel.org>; Thu,  5 Mar 2020 11:35:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1B88D2073D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j9om9-00023T-Gs; Thu, 05 Mar 2020 11:34:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=eGB2=4W=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1j9om7-00023O-Ut
 for xen-devel@lists.xenproject.org; Thu, 05 Mar 2020 11:34:47 +0000
X-Inumbo-ID: 50f21fa0-5ed5-11ea-a571-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 50f21fa0-5ed5-11ea-a571-12813bfff9fa;
 Thu, 05 Mar 2020 11:34:47 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 44BCEAD5F;
 Thu,  5 Mar 2020 11:34:46 +0000 (UTC)
To: Ian Jackson <ian.jackson@citrix.com>, Dario Faggioli <dfaggioli@suse.com>
References: <E1j9RHW-0007Ya-1K@osstest.test-lab.xenproject.org>
 <ae66ce58d2548deaab15d1f430e2aa7a41448ce1.camel@suse.com>
 <24160.57771.145327.230573@mariner.uk.xensource.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <cc800b05-955b-038d-06c5-577917d1205f@suse.com>
Date: Thu, 5 Mar 2020 12:34:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <24160.57771.145327.230573@mariner.uk.xensource.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [linux-linus bisection] complete
 test-amd64-amd64-xl-credit2
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
Cc: xen-devel@lists.xenproject.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDUuMDMuMjAgMTI6MjUsIElhbiBKYWNrc29uIHdyb3RlOgo+IERhcmlvIEZhZ2dpb2xpIHdy
aXRlcyAoIlJlOiBbWGVuLWRldmVsXSBbbGludXgtbGludXMgYmlzZWN0aW9uXSBjb21wbGV0ZSB0
ZXN0LWFtZDY0LWFtZDY0LXhsLWNyZWRpdDIiKToKPj4gT24gV2VkLCAyMDIwLTAzLTA0IGF0IDEw
OjI5ICswMDAwLCBvc3N0ZXN0IHNlcnZpY2Ugb3duZXIgd3JvdGU6Cj4+PiBicmFuY2ggeGVuLXVu
c3RhYmxlCj4+PiB4ZW5icmFuY2ggeGVuLXVuc3RhYmxlCj4+PiBqb2IgdGVzdC1hbWQ2NC1hbWQ2
NC14bC1jcmVkaXQyCj4+PiB0ZXN0aWQgZ3Vlc3Qtc3RhcnQKPj4+Cj4+IEkgd2FzIGhhdmluZyBh
IGxvb2sgYXQgdGhpcy4gQSBxdWVzdGlvbjoKPiAuLi4KPj4+ICAgIExhc3QgZmFpbCByZXBybzoK
Pj4+IGh0dHA6Ly9sb2dzLnRlc3QtbGFiLnhlbnByb2plY3Qub3JnL29zc3Rlc3QvbG9ncy8xNDgw
NTMvCj4+Pgo+PiBJbiBPU1NUZXN0LCB3ZSBkb24ndCBjYXB0dXJlIGFuZCBzYXZlIHRoZSBndWVz
dCBzZXJpYWwgY29uc29sZSBvdXRwdXQsCj4+IG9yIGRvIHdlPwo+IAo+IFN1cmUsIHdlIGRvLiAg
QWx0aG91Z2ggb2YgY291cnNlIHRoaXMgaWEgYSBQViBndWVzdCBhbmQgaXQgaGFzIG5vCj4gInNl
cmlhbCIuICBJdCBkb2VzIGhhdmUgaHZjMC4KPiAKPiBIZXJlIGlzIGl0cyBjb25zb2xlIGxvZzoK
PiAKPiBodHRwOi8vbG9ncy50ZXN0LWxhYi54ZW5wcm9qZWN0Lm9yZy9vc3N0ZXN0L2xvZ3MvMTQ4
MDUzL3Rlc3QtYW1kNjQtYW1kNjQteGwtY3JlZGl0Mi9jaGFyZG9ubmF5MS0tLXZhci1sb2cteGVu
LWNvbnNvbGUtZ3Vlc3QtZGViaWFuLmd1ZXN0Lm9zc3Rlc3QubG9nMQo+IAo+IENvbnRhaW5zIGEg
QlVHLgoKSSBoYXZlIHNlbnQgb3V0IHR3byBwYXRjaGVzIHJlcGFpcmluZyB0aGUgaXNzdWUuCgoK
SnVlcmdlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
