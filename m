Return-Path: <SRS0=X6vN=4Q=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A3D0C3F2CD
	for <xen-devel@archiver.kernel.org>; Fri, 28 Feb 2020 15:31:08 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 17C562469F
	for <xen-devel@archiver.kernel.org>; Fri, 28 Feb 2020 15:31:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 17C562469F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j7hbL-0001WX-8q; Fri, 28 Feb 2020 15:30:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=xa6/=4Q=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1j7hbK-0001WR-9Y
 for xen-devel@lists.xenproject.org; Fri, 28 Feb 2020 15:30:54 +0000
X-Inumbo-ID: 4e4accd8-5a3f-11ea-997e-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4e4accd8-5a3f-11ea-997e-12813bfff9fa;
 Fri, 28 Feb 2020 15:30:53 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 5ABD8AD11;
 Fri, 28 Feb 2020 15:30:52 +0000 (UTC)
To: xen-devel@lists.xenproject.org, x86@kernel.org,
 linux-kernel@vger.kernel.org
References: <20200221103851.7855-1-jgross@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <0c2ebf01-e8a0-568d-ec0e-366ed37c1b3b@suse.com>
Date: Fri, 28 Feb 2020 16:30:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200221103851.7855-1-jgross@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] x86/mm: fix dump_pagetables with Xen PV
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
Cc: Peter Zijlstra <peterz@infradead.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJpZW5kbHkgcGluZy4uLgoKT24gMjEuMDIuMjAgMTE6MzgsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6
Cj4gQ29tbWl0IDJhZTI3MTM3YjJkYjg5ICgieDg2OiBtbTogY29udmVydCBkdW1wX3BhZ2V0YWJs
ZXMgdG8gdXNlCj4gd2Fsa19wYWdlX3JhbmdlIikgYnJva2UgWGVuIFBWIGd1ZXN0cyBhcyB0aGUg
aHlwZXJ2aXNvciByZXNlcnZlZCBob2xlCj4gaW4gdGhlIG1lbW9yeSBtYXAgd2FzIG5vdCB0YWtl
biBpbnRvIGFjY291bnQuCj4gCj4gRml4IHRoYXQgYnkgc3RhcnRpbmcgdGhlIGtlcm5lbCByYW5n
ZSBvbmx5IGF0IEdVQVJEX0hPTEVfRU5EX0FERFIuCj4gCj4gRml4ZXM6IDJhZTI3MTM3YjJkYjg5
ICgieDg2OiBtbTogY29udmVydCBkdW1wX3BhZ2V0YWJsZXMgdG8gdXNlIHdhbGtfcGFnZV9yYW5n
ZSIpCj4gUmVwb3J0ZWQtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5vcmc+Cj4gU2lnbmVk
LW9mZi1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgo+IC0tLQo+ICAgYXJjaC94
ODYvbW0vZHVtcF9wYWdldGFibGVzLmMgfCA3ICstLS0tLS0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAx
IGluc2VydGlvbigrKSwgNiBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvYXJjaC94ODYv
bW0vZHVtcF9wYWdldGFibGVzLmMgYi9hcmNoL3g4Ni9tbS9kdW1wX3BhZ2V0YWJsZXMuYwo+IGlu
ZGV4IDY0MjI5ZGFkN2VhYi4uNjkzMDljZDU2ZmRmIDEwMDY0NAo+IC0tLSBhL2FyY2gveDg2L21t
L2R1bXBfcGFnZXRhYmxlcy5jCj4gKysrIGIvYXJjaC94ODYvbW0vZHVtcF9wYWdldGFibGVzLmMK
PiBAQCAtMzYzLDEzICszNjMsOCBAQCBzdGF0aWMgdm9pZCBwdGR1bXBfd2Fsa19wZ2RfbGV2ZWxf
Y29yZShzdHJ1Y3Qgc2VxX2ZpbGUgKm0sCj4gICB7Cj4gICAJY29uc3Qgc3RydWN0IHB0ZHVtcF9y
YW5nZSBwdGR1bXBfcmFuZ2VzW10gPSB7Cj4gICAjaWZkZWYgQ09ORklHX1g4Nl82NAo+IC0KPiAt
I2RlZmluZSBub3JtYWxpemVfYWRkcl9zaGlmdCAoNjQgLSAoX19WSVJUVUFMX01BU0tfU0hJRlQg
KyAxKSkKPiAtI2RlZmluZSBub3JtYWxpemVfYWRkcih1KSAoKHNpZ25lZCBsb25nKSgodSkgPDwg
bm9ybWFsaXplX2FkZHJfc2hpZnQpID4+IFwKPiAtCQkJICAgbm9ybWFsaXplX2FkZHJfc2hpZnQp
Cj4gLQo+ICAgCXswLCBQVFJTX1BFUl9QR0QgKiBQR0RfTEVWRUxfTVVMVCAvIDJ9LAo+IC0Je25v
cm1hbGl6ZV9hZGRyKFBUUlNfUEVSX1BHRCAqIFBHRF9MRVZFTF9NVUxUIC8gMiksIH4wVUx9LAo+
ICsJe0dVQVJEX0hPTEVfRU5EX0FERFIsIH4wVUx9LAo+ICAgI2Vsc2UKPiAgIAl7MCwgfjBVTH0s
Cj4gICAjZW5kaWYKPiAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
