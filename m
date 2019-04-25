Return-Path: <SRS0=w6oi=S3=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A40BBC43219
	for <xen-devel@archiver.kernel.org>; Thu, 25 Apr 2019 14:04:23 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 92B6C206BA
	for <xen-devel@archiver.kernel.org>; Thu, 25 Apr 2019 14:04:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 92B6C206BA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hJeyp-0001vO-PF; Thu, 25 Apr 2019 14:04:03 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=iCIG=S3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hJeyn-0001vJ-Pn
 for xen-devel@lists.xenproject.org; Thu, 25 Apr 2019 14:04:01 +0000
X-Inumbo-ID: f93683f8-6762-11e9-843c-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id f93683f8-6762-11e9-843c-bc764e045a96;
 Thu, 25 Apr 2019 14:04:00 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Thu, 25 Apr 2019 08:03:59 -0600
Message-Id: <5CC1BE4A02000078002291B3@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Thu, 25 Apr 2019 08:03:54 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Tamas K Lengyel" <tamas@tklengyel.com>
References: <20190412194712.1602-1-tamas@tklengyel.com>
 <3c3ff047-5026-8b4a-c980-822fb730eaea@citrix.com>
 <CABfawhnkt8i5VYEp2ySes9oBc6=pvrU-vcQ7G0UiuVNpW+g1QQ@mail.gmail.com>
 <F6EF77CA-6EF8-4B5A-AEA7-C6284D371ECD@citrix.com>
 <CABfawhkBp6WtQ-2W=MEUfWYhO68JnOj6V7O3ekTcBggJQEJGBA@mail.gmail.com>
 <5CC196A20200007800229009@prv1-mh.provo.novell.com>
 <CABfawhk1_gH-eni0rtve4jeqAJdSKbHP69PDawyCvqYq-E8Cvg@mail.gmail.com>
In-Reply-To: <CABfawhk1_gH-eni0rtve4jeqAJdSKbHP69PDawyCvqYq-E8Cvg@mail.gmail.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH v2 1/2] x86/mem_sharing: reorder when pages
 are unlocked and released
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>,
 george.dunlap@citrix.com, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190425140354.VDLCLMyg0ZUAZoK1Hseuv7xh6g3dfu-32MkbJKdoATg@z>

Pj4+IE9uIDI1LjA0LjE5IGF0IDE1OjMzLCA8dGFtYXNAdGtsZW5neWVsLmNvbT4gd3JvdGU6Cj4g
T24gVGh1LCBBcHIgMjUsIDIwMTkgYXQgNToxNCBBTSBKYW4gQmV1bGljaCA8SkJldWxpY2hAc3Vz
ZS5jb20+IHdyb3RlOgo+Pgo+PiA+Pj4gT24gMTUuMDQuMTkgYXQgMTk6NTEsIDx0YW1hc0B0a2xl
bmd5ZWwuY29tPiB3cm90ZToKPj4gPiBTaW1wbHkgY2hhbmdpbmcgdG8gZ2V0X3BhZ2Ugd2l0aCBk
b21fY293IGlzIG5vdCBlbm91Z2gsIEkgcmFuIGludG8KPj4gPiBpc3N1ZXMgd2hlcmUgdGhlIHN5
c3RlbSBzdGlsbCBkZWFkbG9ja3MgZHVlIHRvIHRoZSBvcmRlcmluZyBvZgo+PiA+IHB1dF9wYWdl
X2FuZF90eXBlIGJlaW5nIGNhbGxlZCBiZWZvcmUgbWVtX3NoYXJpbmdfcGFnZV91bmxvY2suIFNv
IHRoZQo+PiA+IG9yZGVyaW5nIHN0aWxsIGhhcyB0byBiZSBjaGFuZ2VkLgo+Pgo+PiBEZWFkIGxv
Y2tzIGJlY2F1c2Ugb2YgdGhlIG9yZGVyaW5nIG9mIHJlbGVhc2VzIChvciBsb2NrcyBvciBhbGlr
ZSksCj4+IG5vdCBhY3F1aXJlcz8gVGhhdCBsb29rcyBzdXNwaWNpb3VzIHRvIG1lLCBpLmUuIHN1
Z2dlc3RzIHlldAo+PiBhbm90aGVyIHByb2JsZW0gZWxzZXdoZXJlLgo+IAo+IEZXSVcgcGFnZV9s
b2NrIGhhcyB0aGlzIHdhcm5pbmc6Cj4gCj4gICogV2UgbXVzdCBuZXZlciBjYWxsIF9wdXRfcGFn
ZV90eXBlKCkgd2hpbGUgaG9sZGluZyBhIHBhZ2VfbG9jaygpIGZvcgo+ICAqIHRoYXQgcGFnZTsg
ZG9pbmcgc28gbWF5IGNhdXNlIGEgZGVhZGxvY2sgdW5kZXIgdGhlIHJpZ2h0Cj4gICogY29uZGl0
aW9ucy4KCk9oLCBvZiBjb3Vyc2UuIEkgb25jZSBhZ2FpbiBmb3Jnb3QgdGhhdAptZW1fc2hhcmlu
Z19wYWdlX3VubG9jaygpIGNhbGxzIHBhZ2VfdW5sb2NrKCkuCgo+IFRoYXQgc2FpZCwgSSdtIHdv
cmtpbmcgb24gZ2V0dGluZyByaWQgb2YgdXNpbmcgcGFnZV9sb2NrIGFsdG9nZXRoZXIKPiBiZWNh
dXNlIGl0IGp1c3Qgb3Zlci1jb21wbGljYXRlcyB0aGluZ3MgZm9yIG5vIGdvb2QgcmVhc29uLiBT
aG91bGQgYmUKPiBhYmxlIHRvIHNlbmQgdGhlIG5ldyBwYXRjaGVzIHRvZGF5LgoKT2gsIHRoYXQn
cyBnb29kIG5ld3MuCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
