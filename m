Return-Path: <SRS0=9cJ5=WZ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33737C3A5A3
	for <xen-devel@archiver.kernel.org>; Thu, 29 Aug 2019 15:18:46 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 11CDE2339E
	for <xen-devel@archiver.kernel.org>; Thu, 29 Aug 2019 15:18:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 11CDE2339E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i3MC1-0005x5-9A; Thu, 29 Aug 2019 15:18:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=C/xl=WZ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i3MBz-0005wo-NW
 for xen-devel@lists.xenproject.org; Thu, 29 Aug 2019 15:18:31 +0000
X-Inumbo-ID: 42042348-ca70-11e9-951b-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 42042348-ca70-11e9-951b-bc764e2007e4;
 Thu, 29 Aug 2019 15:18:30 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id D8D06AF5B;
 Thu, 29 Aug 2019 15:18:29 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <5D03853F0200007800238448@prv1-mh.provo.novell.com>
 <5D03870E0200007800238473@prv1-mh.provo.novell.com>
 <8c1cbd92-f5b2-122d-c95b-11c96398692b@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <479111d3-ed0b-ae1e-814e-69eb44639b5b@suse.com>
Date: Thu, 29 Aug 2019 17:18:29 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <8c1cbd92-f5b2-122d-c95b-11c96398692b@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH RFC 2/3] x86/ACPI: restore VESA mode upon
 resume from S3
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>, WeiLiu <wl@xen.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjkuMDguMjAxOSAxNjo0NSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAxNC8wNi8yMDE5
IDEyOjM3LCBKYW4gQmV1bGljaCB3cm90ZToKPj4gLS0tCj4+IEknbSB3b25kZXJpbmcgYWN0dWFs
bHkgd2hldGhlciB0aGUgdXNlciBoYXZpbmcgdG8gZXhwbGljaXRseSByZXF1ZXN0IHRoZQo+PiBt
b2RlIHJlc3RvcmF0aW9uIGlzIGEgZ29vZCBtb2RlbDogV2h5IHdvdWxkIHdlIF9ub3RfIHdhbnQg
dG8gcmVzdG9yZSB0aGUKPj4gbW9kZSB3ZSd2ZSBzZXQgZHVyaW5nIGJvb3Q/IEluIHRoZSB3b3Jz
dCBjYXNlIERvbTAga2VybmVsIG9yIFggd2lsbAo+PiBjaGFuZ2UgdGhlIG1vZGUgYW5vdGhlciB0
aW1lLgo+IAo+IEkgdGhpbmsgSSBhZ3JlZS7CoCBJIGNhbid0IHNlZSBhbnl0aGluZyBnb29kIHdo
aWNoIGNhbiBjb21lIGZyb20gb2ZmZXJpbmcKPiBhIGNob2ljZSBoZXJlLCBhbmQgSSBhbSBhbGwg
Zm9yIHJlZHVjaW5nIHRoZSBxdWFudGl0eSBvZiAxNmJpdCBWR0EgY29kZQo+IHdlIGhhdmUuCgpX
ZWxsLCBtb2RlIHJlc3RvcmF0aW9uIG1heSBvZiBjb3Vyc2UgaGFuZyBkdWUgdG8gQklPUyBpc3N1
ZXMuIEJ1dCBpbiBzdWNoCmEgY2FzZSB0aGUgcXVlc3Rpb24gaXMgaG93IHNlbnNpYmxlIGl0IGlz
IHRvIHVzZSBTMyBvbiBzdWNoIGEgc3lzdGVtLgoKQWxzbyBub3RlIHRoYXQgYWRqdXN0aW5nIHRo
aXMgaXNuJ3QgZ29pbmcgdG8gcmVkdWNlIHRoZSBxdWFudGl0eSBvZgoxNi1iaXQgY29kZTsgaXQg
d291bGQgb25seSBiZSBhIGNoYW5nZSB0byB3aGF0IHZpZGVvX2ZsYWdzIGRlZmF1bHRzIHRvLgpS
aWdodCBub3csIHdpdGhvdXQgdGhlIGNvbW1hbmQgbGluZSBvcHRpb24gcHJvdmlkZWQsIG1vZGUg
cmVzdG9yYXRpb24Kd291bGQgaGFwcGVuIG9ubHkgaWYgcmVzZXRfdmlkZW9tb2RlX2FmdGVyX3Mz
KCkgZ2V0cyBpbnZva2VkLCBpLmUuCmp1c3Qgb24gYSBzaW5nbGUgVG9zaGliYSBsYXB0b3AgbW9k
ZWwgd2hpY2ggSSBndWVzcyBkaWRuJ3QgZXZlbiBoYXZlCjY0LWJpdCBjYXBhYmxlIENQVXMuCgpK
YW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
