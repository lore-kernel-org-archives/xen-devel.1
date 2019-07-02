Return-Path: <SRS0=idoa=U7=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 397E3C06510
	for <xen-devel@archiver.kernel.org>; Tue,  2 Jul 2019 10:25:40 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 106B52082F
	for <xen-devel@archiver.kernel.org>; Tue,  2 Jul 2019 10:25:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 106B52082F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hiFya-0002cH-Uc; Tue, 02 Jul 2019 10:25:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Sn/J=U7=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hiFyZ-0002cC-RO
 for xen-devel@lists.xenproject.org; Tue, 02 Jul 2019 10:25:27 +0000
X-Inumbo-ID: b3f6bb2c-9cb3-11e9-a33f-93e3be6fbe10
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b3f6bb2c-9cb3-11e9-a33f-93e3be6fbe10;
 Tue, 02 Jul 2019 10:25:24 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id A6815B124;
 Tue,  2 Jul 2019 10:25:23 +0000 (UTC)
To: Jan Beulich <JBeulich@suse.com>, Dario Faggioli <dfaggioli@suse.com>
References: <be24ad7e-9510-912c-9984-7eec792fae86@suse.com>
 <45139cf0-0b53-1ca2-c8b2-2c2e8813a82d@suse.com>
 <de741925-b823-92ee-c9be-c4cc55da859d@suse.com>
 <0bb81eb9-8303-2dae-2fba-28c73ac74050@suse.com>
 <ee6a055b-2a47-e6ee-91d4-f23bfce5243d@suse.com>
 <ace01bb733d0dd624b9e9ee07c5da4f5567a8a8a.camel@suse.com>
 <ae74f899-b3ea-6349-5352-88b07c0dc9d8@suse.com>
 <e2b690e4ecb8267c600b394c684968c01e510f81.camel@suse.com>
 <43e2efa2-6e9b-4ffd-77ee-c4fb40cab7a2@suse.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <2ea55157-0b74-c4e5-e1a7-35ce345af51f@suse.com>
Date: Tue, 2 Jul 2019 12:25:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <43e2efa2-6e9b-4ffd-77ee-c4fb40cab7a2@suse.com>
Content-Language: de-DE
Subject: Re: [Xen-devel] [PATCH 13/60] xen/sched: move some per-vcpu items
 to struct sched_unit
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
 Konrad Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Meng Xu <mengxu@cis.upenn.edu>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Ian Jackson <ian.jackson@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDIuMDcuMTkgMTI6MDEsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDAyLjA3LjIwMTkgMTE6
NDAsIERhcmlvIEZhZ2dpb2xpIHdyb3RlOgo+PiBPbiBUdWUsIDIwMTktMDctMDIgYXQgMDg6Mjkg
KzAwMDAsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4gT24gMDIuMDcuMjAxOSAxMDoyMSwgRGFyaW8g
RmFnZ2lvbGkgd3JvdGU6Cj4+Pj4gT24gVHVlLCAyMDE5LTA3LTAyIGF0IDA3OjU0ICswMDAwLCBK
YW4gQmV1bGljaCB3cm90ZToKPj4+Pj4KPj4+Pj4gQW5kIGFnYWluIC0gaWYgc29tZW9uZSBwaW5z
IGV2ZXJ5IHZDUFUgdG8gYSBzaW5nbGUgcENQVSwgdGhhdAo+Pj4+PiBsYXN0Cj4+Pj4+IHN1Y2gg
cGlubmluZyBvcGVyYXRpb24gd2lsbCBiZSB3aGF0IHRha2VzIGxvbmcgdGVybSBlZmZlY3QuIEFp
dWkKPj4+Pj4gYWxsCj4+Pj4+IHZDUFUtcyBpbiB0aGUgdW5pdCB3aWxsIHRoZW4gYmUgcGlubmVk
IHRvIHRoYXQgb25lIHBDUFUsIGkuZS4KPj4+Pj4gdGhleSdsbCBlaXRoZXIgYWxsIGNvbXBldGUg
Zm9yIHRoZSBvbmUgcENQVSdzIHRpbWUsIG9yIG9ubHkgb25lCj4+Pj4+IG9mCj4+Pj4+IHRoZW0g
d2lsbCBldmVyIGdldCBzY2hlZHVsZWQuCj4+Pj4+Cj4+Pj4gSSdtIG5vdCBzdXJlIEknbSBnZXR0
aW5nIHRoaXMuIE9uIGFuLCBzYXksIFNNVCBzeXN0ZW0sIHdpdGggNAo+Pj4+IHRocmVhZHMKPj4+
PiBwZXIgY29yZSwgYSB1bml0IGlzIDQgdkNQVXMgYW5kIGEgcENQVSBpcyA0IHRocmVhZHMuCj4+
Pgo+Pj4gTm8sIHRoZSBtZWFuaW5nIG9mIHBDUFUgaXMgYSBzaW5nbGUgdGhyZWFkIG9mIGEgc2lu
Z2xlIGNvcmUuIEkuZS4KPj4+IHdoYXQgaXMgcmVwcmVzZW50ZWQgYnkgYSBzaW5nbGUgY3B1bWFz
a190IGJpdC4KPj4+Cj4+IEZpbmUsIGxldCdzIGNvbnRpbnVlIHRvIGNhbGwgdGhhdCBhIHBDUFUu
IFRoZW4sIHdoZW4gY29yZS1zY2hlZHVsaW5nIGlzCj4+IGVuYWJsZWQsIHRoZXJlJ3Mgbm8gPDxt
dWx0aXBsZSB2Q1BVcyBvZiBhIHVuaXQgYmVpbmcgcGlubmVkIHRvIHRoZSBzYW1lCj4+IHBDUFUg
YW5kIGFsbCBjb21wZXRpbmcgZm9yIGp1dCBpdHMgQ1BVIHRpbWU+Pi4KPj4KPj4gVGhlcmUncyB1
bml0cyBvZiA0IHZDUFVzIGJlaW5nIHBpbm5lZCB0byA0IHBDUFVzICh0aGUgNCBwQ1BVcyBvZiBh
Cj4+IGNvcmUsIG5vdCA0IHJhbmRvbSwgbm9yIGFyYml0cmFyeSwgb25lcykuCj4+Cj4+IFRoYXQg
aXMgdGhlIHBvaW50LCBBRkFJVUkuCj4gCj4gV2VsbCwgb2theSwgcXVpdGUgcG9zc2libGUuIEJ1
dCB0aGVuIGZvciB0aGUgZXhhbXBsZSB0b3BvbG9neQo+IHlvdSBnYXZlLCB3aGF0IGlzIGdvaW5n
IHRvIGJlIHRoZSBlZmZlY3Qgb2YKPiAKPiB4bCB2Y3B1LXBpbiAwIDAgMAoKZG9tMCB2Y3B1MCB3
aWxsIGJlIHBpbm5lZCB0byBjcHUwLgpkb20wIHZjcHUxIHdpbGwgYmUgcGlubmVkIHRvIGNwdTEu
CmRvbTAgdmNwdTIgd2lsbCBiZSBwaW5uZWQgdG8gY3B1Mi4KZG9tMCB2Y3B1MyB3aWxsIGJlIHBp
bm5lZCB0byBjcHUzLgoKPiA/IEluIHBhcnRpY3VsYXIgZm9yIERvbTAgYW5kIGluIHBhcnRpY3Vs
YXIgZm9yIENQVSAwLCB0aGVyZSBtYXkKPiBiZSByZWFzb25zIHRvIHBpbiBhIHBhcnRpY3VsYXIg
dkNQVSB0byBpdC4KCkluIHJlYWxpdHkgb25seSBwaW5uaW5nIHZjcHUwIHRvIGNwdTAgc2hvdWxk
IGJlIG5lZWRlZC4gQW5kIHRoaXMgaXMgZG9uZQplLmcuIGluIGRjZGJhc19zbWlfcmVxdWVzdCgp
LgoKCkp1ZXJnZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
