Return-Path: <SRS0=/kPz=ZE=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47B7CC43331
	for <xen-devel@archiver.kernel.org>; Tue, 12 Nov 2019 14:31:52 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 264E220578
	for <xen-devel@archiver.kernel.org>; Tue, 12 Nov 2019 14:31:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 264E220578
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iUXCm-00011d-JT; Tue, 12 Nov 2019 14:31:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=CoZ6=ZE=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iUXCl-00011Y-KQ
 for xen-devel@lists.xenproject.org; Tue, 12 Nov 2019 14:31:39 +0000
X-Inumbo-ID: 22d0bab2-0559-11ea-b678-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 22d0bab2-0559-11ea-b678-bc764e2007e4;
 Tue, 12 Nov 2019 14:31:38 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id ECD48B03A;
 Tue, 12 Nov 2019 14:31:37 +0000 (UTC)
To: Tamas K Lengyel <tamas@tklengyel.com>
References: <20191106153442.12776-1-aisaila@bitdefender.com>
 <9a02de11-09bd-a54f-48f6-1ce1a0246325@suse.com>
 <CABfawhkjgmyYa11CMH1fBZG+Ee2ngvsoFzBvCixrj08FMcMT5A@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <2ba0e8d7-0e58-62c0-6c2b-8d9934b1137e@suse.com>
Date: Tue, 12 Nov 2019 15:31:52 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <CABfawhkjgmyYa11CMH1fBZG+Ee2ngvsoFzBvCixrj08FMcMT5A@mail.gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH V2 1/2] x86/altp2m: Add hypercall to set a
 range of sve bits
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
Cc: Petre Ovidiu PIRCALABU <ppircalabu@bitdefender.com>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "julien@xen.org" <julien@xen.org>, "wl@xen.org" <wl@xen.org>,
 Razvan COJOCARU <rcojocaru@bitdefender.com>,
 "konrad.wilk@oracle.com" <konrad.wilk@oracle.com>,
 "george.dunlap@eu.citrix.com" <george.dunlap@eu.citrix.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "ian.jackson@eu.citrix.com" <ian.jackson@eu.citrix.com>,
 Alexandru Stefan ISAILA <aisaila@bitdefender.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTIuMTEuMjAxOSAxNTowNSwgVGFtYXMgSyBMZW5neWVsIHdyb3RlOgo+IE9uIFR1ZSwgTm92
IDEyLCAyMDE5IGF0IDQ6NTQgQU0gSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPiB3cm90
ZToKPj4gT24gMDYuMTEuMjAxOSAxNjozNSwgQWxleGFuZHJ1IFN0ZWZhbiBJU0FJTEEgd3JvdGU6
Cj4+PiArICAgICAgICBlbHNlCj4+PiArICAgICAgICB7Cj4+PiArICAgICAgICAgICAgcmMgPSBw
Mm1fc2V0X3N1cHByZXNzX3ZlX211bHRpKGQsICZhLnUuc3VwcHJlc3NfdmUpOwo+Pj4gKwo+Pj4g
KyAgICAgICAgICAgIGlmICggcmMgPT0gLUVSRVNUQVJUICkKPj4+ICsgICAgICAgICAgICAgICAg
aWYgKCBfX2NvcHlfZmllbGRfdG9fZ3Vlc3QoZ3Vlc3RfaGFuZGxlX2Nhc3QoYXJnLAo+Pj4gKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB4ZW5faHZtX2FsdHAybV9v
cF90KSwKPj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgJmEs
IHUuc3VwcHJlc3NfdmUub3BhcXVlKSApCj4+PiArICAgICAgICAgICAgICAgICAgICByYyA9IC1F
RkFVTFQ7Cj4+Cj4+IElmIHRoZSBvcGVyYXRpb24gaXMgYmVzdCBlZmZvcnQsIF9zb21lXyBpbmRp
Y2F0aW9uIG9mIGZhaWx1cmUgc2hvdWxkCj4+IHN0aWxsIGJlIGhhbmRlZCBiYWNrIHRvIHRoZSBj
YWxsZXIuIFdoZXRoZXIgdGhhdCdzIHRocm91Z2ggdGhlIG9wYXF1ZQo+PiBmaWVsZCBvciBieSBz
b21lIG90aGVyIG1lYW5zIGlzIHNlY29uZGFyeS4gSWYgbm90IHZpYSB0aGF0IGZpZWxkCj4+ICh3
aGljaCB3b3VsZCBtYWtlIHRoZSBvdXRlciBvZiB0aGUgdHdvIGlmKCktcyBkaXNhcHBlYXIpLCBw
bGVhc2UgZm9sZAo+PiB0aGUgaWYoKS1zLgo+IAo+IEF0IGxlYXN0IGZvciBtZW1fc2hhcmluZ19y
YW5nZV9vcCB3ZSBhbHNvIGRvIGEgYmVzdC1lZmZvcnQgYW5kIGRvbid0Cj4gcmV0dXJuIGFuIGVy
cm9yIGZvciBwYWdlcyB3aGVyZSBpdCB3YXNuJ3QgcG9zc2libGUgdG8gc2hhcmUuIFNvIEkKPiBk
b24ndCB0aGluayBpdCdzIGFic29sdXRlbHkgbmVjZXNzYXJ5IHRvIGRvIHRoYXQsIGVzcGVjaWFs
bHkgaWYgdGhlCj4gY2FsbGVyIGNhbid0IGRvIGFueXRoaW5nIGFib3V0IHRob3NlIGVycm9ycyBh
bnl3YXkuCgptZW0tc2hhcmluZyBpcyBhIGxpdHRsZSBkaWZmZXJlbnQgaW4gbmF0dXJlLCBpc24n
dCBpdD8gSWYgeW91CmNhbid0IHNoYXJlIGEgcGFnZSwgYm90aCBpbnZvbHZlZCBndWVzdHMgd2ls
bCBjb250aW51ZSB0byBydW4Kd2l0aCB0aGVpciBvd24gaW5zdGFuY2VzLiBJZiB5b3Ugd2FudCB0
byBzdXBwcmVzcyAjVkUgZGVsaXZlcnkKYW5kIGl0IGZhaWxzLCBiZWhhdmlvciB3b24ndCBiZSB0
cmFuc3BhcmVudGx5IGNvcnJlY3QsIGFzCnRoZXJlJ2xsIHBvdGVudGlhbGx5IGJlICNWRSB3aGVu
IHRoZXJlIHNob3VsZCBiZSBub25lLiBXaGV0aGVyCnRoYXQncyBiZW5pZ24gdG8gdGhlIGd1ZXN0
IHZlcnkgbXVjaCBkZXBlbmRzIG9uIGl0cyBoYW5kbGVyLgoKSmFuCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
