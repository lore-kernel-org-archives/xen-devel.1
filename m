Return-Path: <SRS0=ufJU=23=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23826C2D0D1
	for <xen-devel@archiver.kernel.org>; Mon,  6 Jan 2020 10:27:18 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EDDB820731
	for <xen-devel@archiver.kernel.org>; Mon,  6 Jan 2020 10:27:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EDDB820731
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ioPat-0005ze-Lg; Mon, 06 Jan 2020 10:26:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=5DW6=23=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ioPas-0005zZ-FB
 for xen-devel@lists.xenproject.org; Mon, 06 Jan 2020 10:26:42 +0000
X-Inumbo-ID: 02aa74b2-306f-11ea-b6f1-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 02aa74b2-306f-11ea-b6f1-bc764e2007e4;
 Mon, 06 Jan 2020 10:26:33 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id CBC35AF8A;
 Mon,  6 Jan 2020 10:26:32 +0000 (UTC)
To: Wei Liu <wl@xen.org>
References: <20200105164801.26278-1-liuwe@microsoft.com>
 <20200105164801.26278-4-liuwe@microsoft.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <8437e48d-b22c-68c1-f589-fd945c011a3f@suse.com>
Date: Mon, 6 Jan 2020 11:27:18 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20200105164801.26278-4-liuwe@microsoft.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 3/5] x86/hyperv: provide percpu hypercall
 input page
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
Cc: Wei Liu <liuwe@microsoft.com>, Paul Durrant <paul@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Michael Kelley <mikelley@microsoft.com>,
 Xen Development List <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDUuMDEuMjAyMCAxNzo0NywgV2VpIExpdSB3cm90ZToKPiBIeXBlci1WJ3MgaW5wdXQgLyBv
dXRwdXQgYXJndW1lbnQgbXVzdCBiZSA4IGJ5dGVzIGFsaWduZWQgYW4gbm90IGNyb3NzCj4gcGFn
ZSBib3VuZGFyeS4gVGhlIGVhc2llc3Qgd2F5IHRvIHNhdGlzZnkgdGhvc2UgcmVxdWlyZW1lbnRz
IGlzIHRvIHVzZQo+IHBlcmNwdSBwYWdlLgoKSSdtIG5vdCBzdXJlICJlYXNpZXN0IiBpcyByZWFs
bHkgdHJ1ZSBoZXJlLiBPdGhlcnMgY291bGQgY29uc2lkZXIgYWRkaW5nCl9fYWxpZ25lZCgpIGF0
dHJpYnV0ZXMgYXMgZWFzeSBvciBldmVuIGVhc2llciAoYnkgYmVpbmcgZXZlbiBtb3JlCnRyYW5z
cGFyZW50IHRvIHVzZSBzaXRlcykuIENvdWxkIHdlIHNldHRsZSBvbiAiT25lIHdheSAuLi4iPwoK
PiBAQCAtODMsMTQgKzg0LDMzIEBAIHN0YXRpYyB2b2lkIF9faW5pdCBzZXR1cF9oeXBlcmNhbGxf
cGFnZSh2b2lkKQo+ICAgICAgd3Jtc3JsKEhWX1g2NF9NU1JfSFlQRVJDQUxMLCBoeXBlcmNhbGxf
bXNyLmFzX3VpbnQ2NCk7Cj4gIH0KPiAgCj4gK3N0YXRpYyB2b2lkIHNldHVwX2h5cGVyY2FsbF9w
Y3B1X2FyZyh2b2lkKQo+ICt7Cj4gKyAgICB2b2lkICptYXBwaW5nOwo+ICsKPiArICAgIG1hcHBp
bmcgPSBhbGxvY194ZW5oZWFwX3BhZ2UoKTsKPiArICAgIGlmICggIW1hcHBpbmcgKQo+ICsgICAg
ICAgIHBhbmljKCJGYWlsZWQgdG8gYWxsb2NhdGUgaHlwZXJjYWxsIGlucHV0IHBhZ2UgZm9yICV1
XG4iLAoKIi4uLiBmb3IgQ1BVJXVcbiIgcGxlYXNlLgoKPiArICAgICAgICAgICAgICBzbXBfcHJv
Y2Vzc29yX2lkKCkpOwo+ICsKPiArICAgIHRoaXNfY3B1KGh2X3BjcHVfaW5wdXRfYXJnKSA9IG1h
cHBpbmc7CgpXaGVuIG9mZmxpbmluZyBhbmQgdGhlbiByZS1vbmxpbmluZyBhIENQVSwgdGhlIHBy
aW9yIHBhZ2Ugd2lsbCBiZQpsZWFrZWQuCgo+IC0tLSBhL3hlbi9pbmNsdWRlL2FzbS14ODYvZ3Vl
c3QvaHlwZXJ2LmgKPiArKysgYi94ZW4vaW5jbHVkZS9hc20teDg2L2d1ZXN0L2h5cGVydi5oCj4g
QEAgLTUxLDYgKzUxLDggQEAgc3RhdGljIGlubGluZSB1aW50NjRfdCBodl9zY2FsZV90c2ModWlu
dDY0X3QgdHNjLCB1aW50NjRfdCBzY2FsZSwKPiAgCj4gICNpZmRlZiBDT05GSUdfSFlQRVJWX0dV
RVNUCj4gIAo+ICsjaW5jbHVkZSA8eGVuL3BlcmNwdS5oPgo+ICsKPiAgI2luY2x1ZGUgPGFzbS9n
dWVzdC9oeXBlcnZpc29yLmg+Cj4gIAo+ICBzdHJ1Y3QgbXNfaHlwZXJ2X2luZm8gewo+IEBAIC02
Myw2ICs2NSw4IEBAIHN0cnVjdCBtc19oeXBlcnZfaW5mbyB7Cj4gIH07Cj4gIGV4dGVybiBzdHJ1
Y3QgbXNfaHlwZXJ2X2luZm8gbXNfaHlwZXJ2Owo+ICAKPiArREVDTEFSRV9QRVJfQ1BVKHZvaWQg
KiwgaHZfcGNwdV9pbnB1dF9hcmcpOwoKV2lsbCB0aGlzIHJlYWxseSBiZSBuZWVkZWQgb3V0c2lk
ZSBvZiB0aGUgZmlsZSB0aGF0IGRlZmluZXMgaXQ/CgpBbHNvLCB3aGlsZSBsb29raW5nIGF0IHRo
aXMgSSBub3RpY2UgdGhhdCAtIGRlc3BpdGUgbXkgZWFybGllcgpjb21tZW50IHdoZW4gZ2l2aW5n
IHRoZSByZXNwZWN0aXZlLCBzb3J0LW9mLWNvbmRpdGlvbmFsIGFjayAtCnRoZXJlIGFyZSAoc3Rp
bGwpIG1hbnkgYXBwYXJlbnRseSBwb2ludGxlc3MgX19wYWNrZWQgYXR0cmlidXRlcwppbiBoeXBl
cnYtdGxmcy5oLiBDYXJlIHRvIGNvbW1lbnQgb24gdGhpcz8KCkphbgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
