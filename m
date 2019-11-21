Return-Path: <SRS0=W9gt=ZN=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B0BAC432C0
	for <xen-devel@archiver.kernel.org>; Thu, 21 Nov 2019 09:04:59 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 60BED2071C
	for <xen-devel@archiver.kernel.org>; Thu, 21 Nov 2019 09:04:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 60BED2071C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iXiOH-0005uK-KG; Thu, 21 Nov 2019 09:04:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=erj2=ZN=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iXiOG-0005uF-CJ
 for xen-devel@lists.xenproject.org; Thu, 21 Nov 2019 09:04:40 +0000
X-Inumbo-ID: f29c104f-0c3d-11ea-a326-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f29c104f-0c3d-11ea-a326-12813bfff9fa;
 Thu, 21 Nov 2019 09:04:39 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 40BF2AF4E;
 Thu, 21 Nov 2019 09:04:38 +0000 (UTC)
To: Julien Grall <julien@xen.org>
References: <8e8866de-33a8-68c0-3352-d6dfeec4a9b6@suse.com>
 <f2232cd2-4786-2b8e-d649-0635309edb92@suse.com>
 <480f4d49-0a5f-c011-a5b8-85a9fc6352af@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <48afa07d-8219-3a2e-45eb-e3dec2bcb89e@suse.com>
Date: Thu, 21 Nov 2019 10:04:38 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <480f4d49-0a5f-c011-a5b8-85a9fc6352af@xen.org>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 1/2] introduce GFN notification for
 translated domains
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Sander Eikelenboom <linux@eikelenboom.it>,
 Ian Jackson <ian.jackson@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjAuMTEuMjAxOSAyMToyMiwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IE9uIDE0LzExLzIwMTkg
MTY6NDMsIEphbiBCZXVsaWNoIHdyb3RlOgo+PiBJbiBvcmRlciBmb3IgaW5kaXZpZHVhbCBJT01N
VSBkcml2ZXJzIChhbmQgZnJvbSBhbiBhYnN0cmFjdCBwb3YgYWxzbwo+PiBhcmNoaXRlY3R1cmVz
KSB0byBiZSBhYmxlIHRvIGFkanVzdCwgYWhlYWQgb2YgYWN0dWFsIG1hcHBpbmcgcmVxdWVzdHMs
Cj4+IHRoZWlyIGRhdGEgc3RydWN0dXJlcyB3aGVuIHRoZXkgbWlnaHQgY292ZXIgb25seSBhIHN1
Yi1yYW5nZSBvZiBhbGwKPj4gcG9zc2libGUgR0ZOcywgaW50cm9kdWNlIGEgbm90aWZpY2F0aW9u
IGNhbGwgdXNlZCBieSB2YXJpb3VzIGNvZGUgcGF0aHMKPj4gcG90ZW50aWFsbHkgaW5zdGFsbGlu
ZyBhIGZyZXNoIG1hcHBpbmcgb2YgYSBuZXZlciB1c2VkIEdGTiAoZm9yIGEKPj4gcGFydGljdWxh
ciBkb21haW4pLgo+IAo+IElmIEkgdW5kZXJzdGFuZCB0aGlzIGNvcnJlY3RseSwgdGhpcyBpcyBt
b3N0bHkgdGFyZ2V0aW5nIElPTU1OVSBkcml2ZXIgCj4gd2hlcmUgcGFnZS10YWJsZSBhcmUgbm90
IHNoYXJlZCB3aXRoIHRoZSBwcm9jZXNzb3IuIFJpZ2h0PwoKWWVzIC0gd2l0aCBzaGFyZWQgcGFn
ZSB0YWJsZXMgdGhlcmUncyBubyBzZXBhcmF0ZSBoYW5kbGluZyBvZgpJT01NVSAodW4pbWFwcGlu
Z3MgaW4gdGhlIGZpcnN0IHBsYWNlLgoKPj4gVEJEOiBEb2VzIEFybSBhY3R1YWxseSBoYXZlIGFu
eXRoaW5nIHRvIGNoZWNrIGFnYWluc3QgaW4gaXRzCj4+ICAgICAgIGFyY2hfbm90aWZ5X2dmbigp
Pwo+IAo+IEkgdW5kZXJzdGFuZCB0aGF0IHdlIHdhbnQgdG8ga2VlcCB0aGUgY29kZSBtb3N0bHkg
Z2VuZXJpYywgYnV0IEkgYW0gYSAKPiBiaXQgY29uY2VybmVkIG9mIHRoZSBleHRyYSBjb3N0IHRv
IHVzZSBub3RpZnlfZ2ZuKCkgKGFuZCBpbmRpcmVjdGx5IAo+IGlvbW11X25vdGlmeV9nZm4oKSkg
Zm9yIGRvaW5nIG5vdGhpbmcuCj4gCj4gSSBjYW4ndCBzZWUgYW55IGRpcmVjdCB1c2Ugb2YgdGhp
cyBmb3IgdGhlIGZvcmVzZWFibGUgZnV0dXJlIG9uIEFybS4gU28gCj4gY291bGQgd2UgZ2F0ZSB0
aGlzIHVuZGVyIGEgY29uZmlnIG9wdGlvbj8KClRoaXMgaXMgYW4gb3B0aW9uLCBzdXJlLiBBbHRl
cm5hdGl2ZWx5IEkgY291bGQgc2VlIGFib3V0IG1ha2luZyB0aGlzCmFuIGlubGluZSBmdW5jdGlv
biwgYnV0IGlpcmMgdGhlcmUgd2VyZSBoZWFkZXIgZGVwZW5kZW5jeSBpc3N1ZXMuClRoZW4gYWdh
aW4gLSBpcyBhIGNhbGwgdG8gYSBmdW5jdGlvbiBkb2luZyBhbG1vc3Qgbm90aGluZyByZWFsbHkg
c28KbXVjaCBleHRyYSBvdmVyaGVhZCBvbiBBcm0/Cgo+PiAtLS0gYS94ZW4vY29tbW9uL2dyYW50
X3RhYmxlLmMKPj4gKysrIGIveGVuL2NvbW1vbi9ncmFudF90YWJsZS5jCj4+IEBAIC05NDYsNiAr
OTQ2LDE2IEBAIG1hcF9ncmFudF9yZWYoCj4+ICAgICAgICAgICByZXR1cm47Cj4+ICAgICAgIH0K
Pj4gICAKPj4gKyAgICBpZiAoIHBhZ2luZ19tb2RlX3RyYW5zbGF0ZShsZCkgLyogJiYgKG9wLT5m
bGFncyAmIEdOVE1BUF9ob3N0X21hcCkgKi8gJiYKPiAKPiBJIHRoaW5rIHRoaXMgd2FudHMgYW4g
ZXhwbGFuYXRpb24gaW4gdGhlIGNvZGUgd2h5IHRoZSBjaGVjayBpcyBjb21tZW50ZWQuCgpIbW0s
IGluIHN1Y2ggYSBjYXNlIEknZCByYXRoZXIgb21pdCB0aGUgY29tbWVudGVkIGNvbmRpdGlvbi4g
SXQKYmVpbmcgY29tbWVudGVkIGhhcyB0aGUgcHVycG9zZSBvZiBkb2N1bWVudGluZyBpdHNlbGYu
CgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
