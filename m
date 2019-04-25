Return-Path: <SRS0=w6oi=S3=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 631ACC43218
	for <xen-devel@archiver.kernel.org>; Thu, 25 Apr 2019 13:34:39 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 26F0A206C0
	for <xen-devel@archiver.kernel.org>; Thu, 25 Apr 2019 13:34:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=tklengyel.com header.i=@tklengyel.com header.b="g7k8AfZH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 26F0A206C0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=tklengyel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hJeW6-0007ax-33; Thu, 25 Apr 2019 13:34:22 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=cKnJ=S3=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1hJeW4-0007ar-LU
 for xen-devel@lists.xenproject.org; Thu, 25 Apr 2019 13:34:20 +0000
X-Inumbo-ID: d41b5507-675e-11e9-843c-bc764e045a96
Received: from rs224.mailgun.us (unknown [209.61.151.224])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id d41b5507-675e-11e9-843c-bc764e045a96;
 Thu, 25 Apr 2019 13:34:19 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=tklengyel.com;
 q=dns/txt; 
 s=krs; t=1556199259; h=Content-Type: Cc: To: Subject: Message-ID: Date:
 From: In-Reply-To: References: MIME-Version: Sender;
 bh=yKbQNqUyNraW6GNija8lL2NTCWFZdysjlJ8CCNvnyD4=;
 b=g7k8AfZHznn9Ueprya1cPLQ4evTf32M4OM1BEIP7/m/5QhqJ10Ebw680gqmhejl0zKJXxrJ4
 DW7CZ0MusxfKI4W25F+3wZAmQXX9NWcYENIQKci2byfEQ2HW6h5NuggkTYW9uTJrkokjvGIk
 blAv6AhbsEzYoSfZVy7u7gQu0/w=
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyIyYTNmOCIsICJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmciLCAiY2Q4NDAiXQ==
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by mxa.mailgun.org with ESMTP id 5cc1b75a.7f1a40020a30-smtp-out-n03;
 Thu, 25 Apr 2019 13:34:18 -0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id s18so5548607wrp.0
 for <xen-devel@lists.xenproject.org>; Thu, 25 Apr 2019 06:34:18 -0700 (PDT)
X-Gm-Message-State: APjAAAXZP5Ffid9yBECvYFvT/CJn+vOL3ZD4HmHf50/uzmbaSHycJI6u
 6fjGoIO0bqqn4mEp4+crc/B0AibZ1VGmIjLXq58=
X-Google-Smtp-Source: APXvYqxCHrdrJScVNXQ9n7Aubol6PHWZSNcBmiOZ/i9xm4e2HkY2tRGrnXpX6S2i4ngL9uC722ADZKV8L8NhpnBj0G0=
X-Received: by 2002:adf:fc8f:: with SMTP id g15mr26154630wrr.113.1556199257910; 
 Thu, 25 Apr 2019 06:34:17 -0700 (PDT)
MIME-Version: 1.0
References: <20190412194712.1602-1-tamas@tklengyel.com>
 <3c3ff047-5026-8b4a-c980-822fb730eaea@citrix.com>
 <CABfawhnkt8i5VYEp2ySes9oBc6=pvrU-vcQ7G0UiuVNpW+g1QQ@mail.gmail.com>
 <F6EF77CA-6EF8-4B5A-AEA7-C6284D371ECD@citrix.com>
 <CABfawhkBp6WtQ-2W=MEUfWYhO68JnOj6V7O3ekTcBggJQEJGBA@mail.gmail.com>
 <5CC196A20200007800229009@prv1-mh.provo.novell.com>
In-Reply-To: <5CC196A20200007800229009@prv1-mh.provo.novell.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Thu, 25 Apr 2019 07:33:40 -0600
X-Gmail-Original-Message-ID: <CABfawhk1_gH-eni0rtve4jeqAJdSKbHP69PDawyCvqYq-E8Cvg@mail.gmail.com>
Message-ID:
 <CABfawhk1_gH-eni0rtve4jeqAJdSKbHP69PDawyCvqYq-E8Cvg@mail.gmail.com>
To: Jan Beulich <JBeulich@suse.com>
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
 George Dunlap <george.dunlap@citrix.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190425133340.Ip-HiHUcUYx3ibvVrj7Ni1W7-9Tnl1Bn1DyCyM8vFf4@z>

T24gVGh1LCBBcHIgMjUsIDIwMTkgYXQgNToxNCBBTSBKYW4gQmV1bGljaCA8SkJldWxpY2hAc3Vz
ZS5jb20+IHdyb3RlOgo+Cj4gPj4+IE9uIDE1LjA0LjE5IGF0IDE5OjUxLCA8dGFtYXNAdGtsZW5n
eWVsLmNvbT4gd3JvdGU6Cj4gPiBTaW1wbHkgY2hhbmdpbmcgdG8gZ2V0X3BhZ2Ugd2l0aCBkb21f
Y293IGlzIG5vdCBlbm91Z2gsIEkgcmFuIGludG8KPiA+IGlzc3VlcyB3aGVyZSB0aGUgc3lzdGVt
IHN0aWxsIGRlYWRsb2NrcyBkdWUgdG8gdGhlIG9yZGVyaW5nIG9mCj4gPiBwdXRfcGFnZV9hbmRf
dHlwZSBiZWluZyBjYWxsZWQgYmVmb3JlIG1lbV9zaGFyaW5nX3BhZ2VfdW5sb2NrLiBTbyB0aGUK
PiA+IG9yZGVyaW5nIHN0aWxsIGhhcyB0byBiZSBjaGFuZ2VkLgo+Cj4gRGVhZCBsb2NrcyBiZWNh
dXNlIG9mIHRoZSBvcmRlcmluZyBvZiByZWxlYXNlcyAob3IgbG9ja3Mgb3IgYWxpa2UpLAo+IG5v
dCBhY3F1aXJlcz8gVGhhdCBsb29rcyBzdXNwaWNpb3VzIHRvIG1lLCBpLmUuIHN1Z2dlc3RzIHll
dAo+IGFub3RoZXIgcHJvYmxlbSBlbHNld2hlcmUuCgpGV0lXIHBhZ2VfbG9jayBoYXMgdGhpcyB3
YXJuaW5nOgoKICogV2UgbXVzdCBuZXZlciBjYWxsIF9wdXRfcGFnZV90eXBlKCkgd2hpbGUgaG9s
ZGluZyBhIHBhZ2VfbG9jaygpIGZvcgogKiB0aGF0IHBhZ2U7IGRvaW5nIHNvIG1heSBjYXVzZSBh
IGRlYWRsb2NrIHVuZGVyIHRoZSByaWdodAogKiBjb25kaXRpb25zLgoKVGhhdCBzYWlkLCBJJ20g
d29ya2luZyBvbiBnZXR0aW5nIHJpZCBvZiB1c2luZyBwYWdlX2xvY2sgYWx0b2dldGhlcgpiZWNh
dXNlIGl0IGp1c3Qgb3Zlci1jb21wbGljYXRlcyB0aGluZ3MgZm9yIG5vIGdvb2QgcmVhc29uLiBT
aG91bGQgYmUKYWJsZSB0byBzZW5kIHRoZSBuZXcgcGF0Y2hlcyB0b2RheS4KClRhbWFzCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
