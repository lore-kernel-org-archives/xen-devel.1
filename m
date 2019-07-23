Return-Path: <SRS0=IY88=VU=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB3FBC7618B
	for <xen-devel@archiver.kernel.org>; Tue, 23 Jul 2019 14:30:16 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A7A0721848
	for <xen-devel@archiver.kernel.org>; Tue, 23 Jul 2019 14:30:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A7A0721848
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hpvnq-0001r9-FM; Tue, 23 Jul 2019 14:30:06 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=bPW/=VU=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hpvno-0001ZB-GQ
 for xen-devel@lists.xenproject.org; Tue, 23 Jul 2019 14:30:04 +0000
X-Inumbo-ID: 5b449890-ad56-11e9-8980-bc764e045a96
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 5b449890-ad56-11e9-8980-bc764e045a96;
 Tue, 23 Jul 2019 14:30:02 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id C6D8DAFA9;
 Tue, 23 Jul 2019 14:30:01 +0000 (UTC)
To: Dario Faggioli <dfaggioli@suse.com>, xen-devel@lists.xenproject.org
References: <20190723092056.15045-1-jgross@suse.com>
 <20190723092056.15045-3-jgross@suse.com>
 <a2338765fbb092989ec600829417f066c4231f1d.camel@suse.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <08ba595f-c242-fd30-f338-861158a88c8c@suse.com>
Date: Tue, 23 Jul 2019 16:30:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <a2338765fbb092989ec600829417f066c4231f1d.camel@suse.com>
Content-Language: de-DE
Subject: Re: [Xen-devel] [PATCH 2/2] xen: merge temporary vcpu pinning
 scenarios
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 JulienGrall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjMuMDcuMTkgMTU6MDcsIERhcmlvIEZhZ2dpb2xpIHdyb3RlOgo+IE9uIFR1ZSwgMjAxOS0w
Ny0yMyBhdCAxMToyMCArMDIwMCwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPj4gVG9kYXkgdGhlcmUg
YXJlIHRocmVlIHNjZW5hcmlvcyB3aGljaCBhcmUgcGlubmluZyB2Y3B1cyB0ZW1wb3JhcmlseQo+
PiB0bwo+PiBhIHNpbmdsZSBwaHlzaWNhbCBjcHU6Cj4+Cj4+IC0gTk1JL01DRSBpbmplY3Rpb24g
aW50byBQViBkb21haW5zCj4+IC0gd2FpdF9ldmVudCgpIGhhbmRsaW5nCj4+IC0gdmNwdV9waW5f
b3ZlcnJpZGUoKSBoYW5kbGluZwo+Pgo+PiBFYWNoIG9mIHRob3NlIGNhc2VzIGFyZSBoYW5kbGVk
IGluZGVwZW5kZW50bHkgdG9kYXkgdXNpbmcgdGhlaXIgb3duCj4+IHRlbXBvcmFyeSBjcHVtYXNr
IHRvIHNhdmUgdGhlIG9sZCBhZmZpbml0eSBzZXR0aW5ncy4KPj4KPj4gVGhlIHRocmVlIGNhc2Vz
IGNhbiBiZSBjb21iaW5lZCBhcyB0aGUgdHdvIGxhdHRlciBjYXNlcyB3aWxsIG9ubHkgcGluCj4+
IGEgdmNwdSB0byB0aGUgcGh5c2ljYWwgY3B1IGl0IGlzIGFscmVhZHkgcnVubmluZyBvbiwgd2hp
bGUKPj4gdmNwdV9waW5fb3ZlcnJpZGUoKSBpcyBhbGxvd2VkIHRvIGZhaWwuCj4+Cj4+IFNvIG1l
cmdlIHRoZSB0aHJlZSB0ZW1wb3JhcnkgcGlubmluZyBzY2VuYXJpb3MgYnkgb25seSB1c2luZyBv
bmUKPj4gY3B1bWFzayBhbmQgYSBwZXItdmNwdSBiaXRtYXNrIGZvciBzcGVjaWZ5aW5nIHdoaWNo
IG9mIHRoZSB0aHJlZQo+PiBzY2VuYXJpb3MgaXMgY3VycmVudGx5IGFjdGl2ZSAodGhleSBhcmUg
YWxsb3dlZCB0byBuZXN0KS4KPj4KPiBSaWdodC4gQW5kLCBhZnRlciB0aGlzIHBhdGNoLCBhbGwg
dGhlIHRocmVlIGNhc2VzIGFib3ZlIGFuZAo+IHN1c3BlbmQvcmVzdW1lLCBhbGwgdXNlIGNwdV9o
YXJkX2FmZmluaXR5X3NhdmVkLgo+IAo+IENhbiB5b3UgYWRkIGEgcGFyYWdyYXBoLCBlaXRoZXIg
aGVyZSBpbiB0aGUgY2hhbmdlbG9nLCBvbiBpbiBhIGNvbW1lbnQKPiAoZS5nLiwgYXQgdGhlIHRv
cCBvciBpbnNpZGUgb2YgdmNwdV9zZXRfdG1wX2FmZmluaXR5KCkpLCBhYm91dCB3aHkgdGhpcwo+
IGlzIGFsbCBmaW5lPwoKWWVzLgoKCkp1ZXJnZW4KCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
