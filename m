Return-Path: <SRS0=5+kv=5E=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E839C4332D
	for <xen-devel@archiver.kernel.org>; Thu, 19 Mar 2020 10:01:36 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3A01F2070A
	for <xen-devel@archiver.kernel.org>; Thu, 19 Mar 2020 10:01:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3A01F2070A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jErzR-0000gf-AZ; Thu, 19 Mar 2020 10:01:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=UVx/=5E=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jErzP-0000gZ-PM
 for xen-devel@lists.xenproject.org; Thu, 19 Mar 2020 10:01:23 +0000
X-Inumbo-ID: 96736676-69c8-11ea-92cf-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 96736676-69c8-11ea-92cf-bc764e2007e4;
 Thu, 19 Mar 2020 10:01:23 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 4638CB152;
 Thu, 19 Mar 2020 10:01:22 +0000 (UTC)
To: Miroslav Benes <mbenes@suse.cz>
References: <20200319095606.23627-1-mbenes@suse.cz>
 <20200319095606.23627-2-mbenes@suse.cz>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <71c4eeaf-958a-b215-3033-c3e0d74a9cfa@suse.com>
Date: Thu, 19 Mar 2020 11:01:21 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200319095606.23627-2-mbenes@suse.cz>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 1/2] x86/xen: Make the boot CPU idle task
 reliable
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
Cc: jgross@suse.com, sstabellini@kernel.org, xen-devel@lists.xenproject.org,
 andrew.cooper3@citrix.com, jpoimboe@redhat.com, x86@kernel.org,
 linux-kernel@vger.kernel.org, mingo@redhat.com, bp@alien8.de, hpa@zytor.com,
 live-patching@vger.kernel.org, boris.ostrovsky@oracle.com, jslaby@suse.cz,
 tglx@linutronix.de
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTkuMDMuMjAyMCAxMDo1NiwgTWlyb3NsYXYgQmVuZXMgd3JvdGU6Cj4gVGhlIHVud2luZGVy
IHJlcG9ydHMgdGhlIGJvb3QgQ1BVIGlkbGUgdGFzaydzIHN0YWNrIG9uIFhFTiBQViBhcwo+IHVu
cmVsaWFibGUsIHdoaWNoIGFmZmVjdHMgYXQgbGVhc3QgbGl2ZSBwYXRjaGluZy4gVGhlcmUgYXJl
IHR3byByZWFzb25zCj4gZm9yIHRoaXMuIEZpcnN0LCB0aGUgdGFzayBkb2VzIG5vdCBmb2xsb3cg
dGhlIHg4NiBjb252ZW50aW9uIHRoYXQgaXRzCj4gc3RhY2sgc3RhcnRzIGF0IHRoZSBvZmZzZXQg
cmlnaHQgYmVsb3cgc2F2ZWQgcHRfcmVncy4gSXQgYWxsb3dzIHRoZQo+IHVud2luZGVyIHRvIGVh
c2lseSBkZXRlY3QgdGhlIGVuZCBvZiB0aGUgc3RhY2sgYW5kIHZlcmlmeSBpdC4gU2Vjb25kLAo+
IHN0YXJ0dXBfeGVuKCkgZnVuY3Rpb24gZG9lcyBub3Qgc3RvcmUgdGhlIHJldHVybiBhZGRyZXNz
IGJlZm9yZSBqdW1waW5nCj4gdG8geGVuX3N0YXJ0X2tlcm5lbCgpIHdoaWNoIGNvbmZ1c2VzIHRo
ZSB1bndpbmRlci4KPiAKPiBBbWVuZCBib3RoIGlzc3VlcyBieSBtb3ZpbmcgdGhlIHN0YXJ0aW5n
IHBvaW50IG9mIGluaXRpYWwgc3RhY2sgaW4KPiBzdGFydHVwX3hlbigpIGFuZCBzdG9yaW5nIHRo
ZSByZXR1cm4gYWRkcmVzcyBiZWZvcmUgdGhlIGp1bXAsIHdoaWNoIGlzCj4gZXhhY3RseSB3aGF0
IGNhbGwgaW5zdHJ1Y3Rpb24gZG9lcy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBNaXJvc2xhdiBCZW5l
cyA8bWJlbmVzQHN1c2UuY3o+Cj4gLS0tCj4gIGFyY2gveDg2L3hlbi94ZW4taGVhZC5TIHwgOCAr
KysrKystLQo+ICAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygt
KQo+IAo+IGRpZmYgLS1naXQgYS9hcmNoL3g4Ni94ZW4veGVuLWhlYWQuUyBiL2FyY2gveDg2L3hl
bi94ZW4taGVhZC5TCj4gaW5kZXggMWQwY2VlMzE2M2U0Li5lZGM3NzZhZjBlMGEgMTAwNjQ0Cj4g
LS0tIGEvYXJjaC94ODYveGVuL3hlbi1oZWFkLlMKPiArKysgYi9hcmNoL3g4Ni94ZW4veGVuLWhl
YWQuUwo+IEBAIC0zNSw3ICszNSwxMSBAQCBTWU1fQ09ERV9TVEFSVChzdGFydHVwX3hlbikKPiAg
CXJlcCBfX0FTTV9TSVpFKHN0b3MpCj4gIAo+ICAJbW92ICVfQVNNX1NJLCB4ZW5fc3RhcnRfaW5m
bwo+IC0JbW92ICRpbml0X3RocmVhZF91bmlvbitUSFJFQURfU0laRSwgJV9BU01fU1AKPiArI2lm
ZGVmIENPTkZJR19YODZfNjQKPiArCW1vdiBpbml0aWFsX3N0YWNrKCVyaXApLCAlX0FTTV9TUAo+
ICsjZWxzZQo+ICsJbW92IHBhKGluaXRpYWxfc3RhY2spLCAlX0FTTV9TUAo+ICsjZW5kaWYKCklm
IHlvdSBuZWVkIHRvIGRpc3Rpbmd1aXNoIHRoZSB0d28gYW55d2F5LCB3aHkgbm90IHVzZSAlcnNw
IGFuZAolZXNwIHJlc3BlY3RpdmVseT8KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
