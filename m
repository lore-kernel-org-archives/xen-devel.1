Return-Path: <SRS0=MmA3=SR=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F3A5C10F0E
	for <xen-devel@archiver.kernel.org>; Mon, 15 Apr 2019 11:43:50 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DBB872073F
	for <xen-devel@archiver.kernel.org>; Mon, 15 Apr 2019 11:43:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TzGICg0r"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DBB872073F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hG01N-000055-Po; Mon, 15 Apr 2019 11:43:33 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=5YYu=SR=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1hG01M-00004z-Q4
 for xen-devel@lists.xenproject.org; Mon, 15 Apr 2019 11:43:32 +0000
X-Inumbo-ID: b0ff98d8-5f73-11e9-92d7-bc764e045a96
Received: from mail-lj1-x241.google.com (unknown [2a00:1450:4864:20::241])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id b0ff98d8-5f73-11e9-92d7-bc764e045a96;
 Mon, 15 Apr 2019 11:43:31 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id l7so15308587ljg.6
 for <xen-devel@lists.xenproject.org>; Mon, 15 Apr 2019 04:43:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=jxWJgTg/k+mMcRMgJYvEFPAjkQd+nSEFrNE5PkCmC0g=;
 b=TzGICg0ruetj96VkcEQO6257AaV6nIdc31fFrwQwR6561AqB5gOu8Q2W7cFjTCvCh8
 ZRXOBwbwzPTKne1XUXxexKK2LkgF5TXSGr2pb07lO8eZhblnF25DVfZGbsGYB4goY1ck
 oY3XdV0G20UvNxEf3ZRHWSGecSlQlyqXRTqzDGJbcgr16kCXxijpuBNmgqfSnR8M+gdd
 jvpn9jwoDE0oWpY/kNdsnYEF1F5JfWqTE9l3vOCj5Q/81OAF9Qa1nLl0wWyUOslJeEAM
 +1+hFES59TNHe+M+dvE2J49BBQCxOTMAYxXTmcS/K2YLq4JTBivxLtVqKU7vkYGfWcfq
 vDdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=jxWJgTg/k+mMcRMgJYvEFPAjkQd+nSEFrNE5PkCmC0g=;
 b=IBOlF0LPVwWd7JF1SV0rXwn6BgOxeP0KXCtKmPAPNe/aAOJ7S/uogfzPqIKj8yTo1j
 wSGXt1GCkoHUC8G2pK5+eg0SuGquDOaXGfJqE36gM32MLSFWWovHsy7l7IH1KhUqSJE0
 Ff63qME28Z7GNZpHjgSpxj0f+BYYiitUDvdHqwwtJmyMP5qEveulYf2MkAViuwY3vKX0
 6jtNrE3MgKglfFWFoldZML8aPbbj77HU5GUjQCwWXyGuJGyCeVkiH+nwUKiRbqe0WYXj
 +A+q42L8Xg4Kc5kTRC1o1D3hnw6HLxG3UVjTkGVekDCZ1lN8uuh4NotvVbNIifrbm9kW
 uKAw==
X-Gm-Message-State: APjAAAWmxvzK5pDLwKPMQYa852Y6q8lQ2gCXnqjFaizJG2L8Z1SUQsAW
 GCraqrHbhFozspoktkHzq7o=
X-Google-Smtp-Source: APXvYqwVSmUxEHA4QAlx2X0QT+DZupkHeaMSxBlvmQHIYpSjSPELBlrqUCksOB+iFWkK8VAUu6ZcPQ==
X-Received: by 2002:a2e:6a05:: with SMTP id f5mr16625145ljc.149.1555328610247; 
 Mon, 15 Apr 2019 04:43:30 -0700 (PDT)
Received: from [10.17.182.120] (ll-22.209.223.85.sovam.net.ua. [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id q5sm8667918lff.30.2019.04.15.04.43.28
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 15 Apr 2019 04:43:29 -0700 (PDT)
To: Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
References: <1554718489-11318-1-git-send-email-olekstysh@gmail.com>
 <1554718489-11318-6-git-send-email-olekstysh@gmail.com>
 <6bf762cb-90b5-4bfe-33eb-6ab3f70c7b34@arm.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <f3fc931c-6f0a-f8e7-f5a6-c8c915ac4841@gmail.com>
Date: Mon, 15 Apr 2019 14:43:28 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <6bf762cb-90b5-4bfe-33eb-6ab3f70c7b34@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH V3 5/5] xen/arm: Add early printk support
 for SCIFA compatible UARTs
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
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 sstabellini@kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="UTF-8"; format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190415114328.rr7ub-on6MssxQKlR36zV2D13LlUveelGlK2F1MvexA@z>

Ck9uIDE0LjA0LjE5IDIwOjU2LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gSGkgT2xla3NhbmRyLAoK
SGkgSnVsaWVuCgoKPgo+IE9uIDQvOC8xOSAxMToxNCBBTSwgT2xla3NhbmRyIFR5c2hjaGVua28g
d3JvdGU6Cj4+IEZyb206IE9sZWtzYW5kciBUeXNoY2hlbmtvIDxvbGVrc2FuZHJfdHlzaGNoZW5r
b0BlcGFtLmNvbT4KPj4KPj4gVGhpcyBwYXRjaCBtYWtlcyBwb3NzaWJsZSB0byB1c2UgZXhpc3Rp
bmcgZWFybHkgcHJpbmsgY29kZQo+PiBmb3IgUmVuZXNhcyAiU3RvdXQiIGJvYXJkIGJhc2VkIG9u
IFItQ2FyIEgyIFNvQyAoU0NJRkEpLgo+Pgo+PiBUaGUgIkVBUkxZX1BSSU5US19WRVJTSU9OIiBm
b3IgdGhhdCBib2FyZCBzaG91bGQgYmUgJ0EnOgo+PiBDT05GSUdfRUFSTFlfUFJJTlRLPXNjaWYs
MHhlNmM0MDAwMCxBCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IE9sZWtzYW5kciBUeXNoY2hlbmtvIDxv
bGVrc2FuZHJfdHlzaGNoZW5rb0BlcGFtLmNvbT4KPj4gQ0M6IEp1bGllbiBHcmFsbCA8anVsaWVu
LmdyYWxsQGFybS5jb20+Cj4+Cj4+IC0tLQo+PiDCoMKgwqDCoCBDaGFuZ2VzIGluIHYzOgo+PiDC
oMKgwqDCoMKgwqDCoMKgIC0gSXQgd2FzIGRlY2lkZWQgbm90IHRvIGludHJvZHVjZSBuZXcgZGVi
dWctc2NpZmEuaW5jCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgIGZvciBoYW5kbGluZyBTQ0lGQSBp
bnRlcmZhY2UsIGJ1dCB0byBleHRlbmQgZXhpc3RpbmcKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqAg
ZGVidWctc2NpZi5pbmMgZm9yIGhhbmRsaW5nIGJvdGggaW50ZXJmYWNlcy4KPj4gwqDCoMKgwqDC
oMKgwqDCoMKgwqAgVGhpcyBwYXRjaCBpcyBhIHJlc3VsdCBvZiBzcGxpdHRpbmcgYW4gaW5pdGlh
bCBwYXRjaAo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoCAieGVuL2FybTogQWRkIFNDSUZBIFVBUlQg
c3VwcG9ydCBmb3IgZWFybHkgcHJpbnRrIgo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoCBhbmQgb25s
eSBhZGRzIGEgc3VwcG9ydC4KPj4gLS0tCj4+IMKgIHhlbi9hcmNoL2FybS9hcm0zMi9kZWJ1Zy1z
Y2lmLmluYyB8IDkgKysrKysrLS0tCj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMo
KyksIDMgZGVsZXRpb25zKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vYXJtMzIv
ZGVidWctc2NpZi5pbmMgCj4+IGIveGVuL2FyY2gvYXJtL2FybTMyL2RlYnVnLXNjaWYuaW5jCj4+
IGluZGV4IGE4ZDJlYWUuLjk0YTE4ZWEgMTAwNjQ0Cj4+IC0tLSBhL3hlbi9hcmNoL2FybS9hcm0z
Mi9kZWJ1Zy1zY2lmLmluYwo+PiArKysgYi94ZW4vYXJjaC9hcm0vYXJtMzIvZGVidWctc2NpZi5p
bmMKPj4gQEAgLTEsNyArMSw3IEBACj4+IMKgIC8qCj4+IMKgwqAgKiB4ZW4vYXJjaC9hcm0vYXJt
MzIvZGVidWctc2NpZi5pbmMKPj4gwqDCoCAqCj4+IC0gKiBTQ0lGIHNwZWNpZmljIGRlYnVnIGNv
ZGUKPj4gKyAqIFNDSUYoQSkgc3BlY2lmaWMgZGVidWcgY29kZQo+PiDCoMKgICoKPj4gwqDCoCAq
IE9sZWtzYW5kciBUeXNoY2hlbmtvIDxvbGVrc2FuZHIudHlzaGNoZW5rb0BnbG9iYWxsb2dpYy5j
b20+Cj4+IMKgwqAgKiBDb3B5cmlnaHQgKEMpIDIwMTQsIEdsb2JhbGxvZ2ljLgo+PiBAQCAtMjIs
MTAgKzIyLDEzIEBACj4+IMKgICNpZmRlZiBFQVJMWV9QUklOVEtfVkVSU0lPTl9OT05FCj4+IMKg
ICNkZWZpbmUgU1RBVFVTX1JFR8KgwqDCoCBTQ0lGX1NDRlNSCj4+IMKgICNkZWZpbmUgVFhfRklG
T19SRUfCoMKgIFNDSUZfU0NGVERSCj4+ICsjZWxpZiBFQVJMWV9QUklOVEtfVkVSU0lPTl9BCj4+
ICsjZGVmaW5lIFNUQVRVU19SRUfCoMKgwqAgU0NJRkFfU0NBU1NSCj4+ICsjZGVmaW5lIFRYX0ZJ
Rk9fUkVHwqDCoCBTQ0lGQV9TQ0FGVERSCj4+IMKgICNlbmRpZgo+PiDCoCDCoCAvKgo+PiAtICog
U0NJRiBVQVJUIHdhaXQgVUFSVCB0byBiZSByZWFkeSB0byB0cmFuc21pdAo+PiArICogU0NJRihB
KSBVQVJUIHdhaXQgVUFSVCB0byBiZSByZWFkeSB0byB0cmFuc21pdAo+Cj4gV2hlbiBTQ0lGQiB3
aWxsIGJlIGludHJvZHVjZWQsIHdlIHdpbGwgaGF2ZSB0byBtb2RpZnkgdGhpcyBjb21tZW50IAo+
IGFnYWluLiBBcyB3ZSBhcmUgb25seSBkZWFsaW5nIHdpdGggYW55IHZlcnNpb24gb2YgU0NJQyBp
biB0aGlzIGZpbGUsIAo+IGNvdWxkIHdlIGp1c3QgcmV3b3JrIHRoZSBjb21tZW50IHRvIGF2b2lk
IG1lbnRpb25pbmcgdGhlIFVBUlQgbmFtZT8KCkkgdGhpbmssIHllcy4gV2hhdCBhYm91dCB1c2lu
ZyBTQ0lGKFgpPyBTaGFsbCBJIHVwZGF0ZSAKc2NpZi11YXJ0LmMvc2NpZi11YXJ0Lmggd2hpY2gg
aGFzIFNDSUYoQSkgc3RyaW5nPwoKCj4KPj4gwqDCoCAqIHJiOiByZWdpc3RlciB3aGljaCBjb250
YWlucyB0aGUgVUFSVCBiYXNlIGFkZHJlc3MKPj4gwqDCoCAqIHJjOiBzY3JhdGNoIHJlZ2lzdGVy
Cj4+IMKgwqAgKi8KPj4gQEAgLTM3LDcgKzQwLDcgQEAKPj4gwqAgLmVuZG0KPj4gwqAgwqAgLyoK
Pj4gLSAqIFNDSUYgVUFSVCB0cmFuc21pdCBjaGFyYWN0ZXIKPj4gKyAqIFNDSUYoQSkgVUFSVCB0
cmFuc21pdCBjaGFyYWN0ZXIKPgo+IFNhbWUgaGVyZS4KPgo+PiDCoMKgICogcmI6IHJlZ2lzdGVy
IHdoaWNoIGNvbnRhaW5zIHRoZSBVQVJUIGJhc2UgYWRkcmVzcwo+PiDCoMKgICogcnQ6IHJlZ2lz
dGVyIHdoaWNoIGNvbnRhaW5zIHRoZSBjaGFyYWN0ZXIgdG8gdHJhbnNtaXQKPj4gwqDCoCAqLwo+
Pgo+Cj4gQ2hlZXJzLAo+Ci0tIApSZWdhcmRzLAoKT2xla3NhbmRyIFR5c2hjaGVua28KCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
