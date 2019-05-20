Return-Path: <SRS0=/voU=TU=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A940BC04AAF
	for <xen-devel@archiver.kernel.org>; Mon, 20 May 2019 09:49:20 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 73EA120815
	for <xen-devel@archiver.kernel.org>; Mon, 20 May 2019 09:49:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 73EA120815
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hSeum-0004ue-Fc; Mon, 20 May 2019 09:49:04 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=DuAc=TU=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hSeuk-0004uZ-Su
 for xen-devel@lists.xenproject.org; Mon, 20 May 2019 09:49:02 +0000
X-Inumbo-ID: 7ebf91e4-7ae4-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 7ebf91e4-7ae4-11e9-8980-bc764e045a96;
 Mon, 20 May 2019 09:49:01 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8B929374;
 Mon, 20 May 2019 02:49:00 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EF49E3F575;
 Mon, 20 May 2019 02:48:58 -0700 (PDT)
To: Viktor Mitin <viktor.mitin.19@gmail.com>, Jan Beulich
 <JBeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Juergen Gross <jgross@suse.com>
References: <CAOcoXZZZbKOXkNQNqFgp9BSRUHnovDqZ4TfV_aMh+h9BcC6Qnw@mail.gmail.com>
 <5CDEA9CC020000780023017C@prv1-mh.provo.novell.com>
 <CAOcoXZa=KriCu6KP0Ju-sFdNx8xgz91FgXTbimGGC7tAk=BsXg@mail.gmail.com>
 <5CDECD540200007800230246@prv1-mh.provo.novell.com>
 <CAOcoXZYeoUt9bf2Uv7-pbhFV+bnaz0hvxPKc9A9CnjcUc1bDuA@mail.gmail.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <8f45b2af-dad9-d4ea-8809-577603a25667@arm.com>
Date: Mon, 20 May 2019 10:48:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAOcoXZYeoUt9bf2Uv7-pbhFV+bnaz0hvxPKc9A9CnjcUc1bDuA@mail.gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] libxc: Casting of xen virtual address type
 xen_vaddr_t to signed int64 type: (int64_t)vaddr
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
Cc: "andrii_anisov@epam.com" <andrii_anisov@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="UTF-8"; format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190520094857._2O4F1GzQhrhizMm8NuwqYmHSNporizeUc5qVGF09Wo@z>

SGkgVmlrdG9yLAoKSXMgdGhlcmUgYW55IHNwZWNpZmljIHJlYXNvbiBJIGVuZGVkIHVwIHRvIGJl
IENDZWQgaW4gYSBtaWRkbGUgb2YgYW4geDg2IHRocmVhZD8KCkNoZWVycywKCk9uIDIwLzA1LzIw
MTkgMTA6MTcsIFZpa3RvciBNaXRpbiB3cm90ZToKPj4+IE1lYW4gdGhhdCByZXN1bHQgb2YgIihp
bnQ2NF90KXZhZGRyID4+IDYzIiBjYW4gYmUgMCBvciAxLgo+Pj4gU28gdGhlIG5leHQgY29kZSBt
YXkgbm90IHdvcmsgcHJvcGVybHkgaW4gY2FzZSBvZiBhbm90aGVyICdpbXBsZW1lbnRhdGlvbnMn
Lgo+Pj4gV2l0aCBhbm90aGVyIGNvbXBpbGVyIChpLmUuIGNsYW5nLCBldGMpIHRoaXMgY29kZSBt
YXkgaW50cm9kdWNlIGJ1Z3MKPj4+IHdoaWNoIGFyZSBoYXJkIHRvIGZpbmQuCj4+Pgo+Pj4gKChp
bnQ2NF90KXZhZGRyID4+IDQ3KSA9PSAoKGludDY0X3QpdmFkZHIgPj4gNjMpCj4+Pgo+Pj4gRm9y
IHRoaXMgcmVhc29uIGl0IGlzIGJldHRlciB0byBhdm9pZCBpbXBsZW1lbnRhdGlvbi1kZWZpbmVk
IGNvZGUuCj4+Cj4+IFdlbGwsIGlkZWFsbHkgd2UnZCBsaWtlIHRvIGdldCBhd2F5IHdpdGhvdXQg
dXNpbmcgaW1wbGVtZW50YXRpb24KPj4gZGVmaW5lZCBiZWhhdmlvci4gQnV0IEknbSBhZnJhaWQg
d2UncmUgcXVpdGUgZmFyIGZyb20gdGhhdCwgYW5kCj4+IHdlJ2Qgbm90IGFsd2F5cyBiZSB3aWxs
aW5nIHRvIGFjY2VwdCB0aGUgd29yc2Ugc291cmNlIGFuZC9vcgo+PiBiaW5hcnkgY29kZSB0aGF0
IHdvdWxkIGJlIG5lZWRlZCB0byBhdm9pZCBpdC4KPiAKPiBIb3cgYWJvdXQgdXNpbmcgdGhlIG5l
eHQgb25lLWxpbmVyIHRvIGF2b2lkIGltcGxlbWVudGF0aW9uLWRlZmluZWQgY29kZSA6Cj4gCj4g
Ly9SZXR1cm5zIHRydWUgaW4gY2FzZSB3aGVuIHRoZSB0b3AgbGVmdCAxNyBiaXRzIGFyZSBhbGwg
emVybyBvciBhcmUgYWxsIG9uZQo+IHJldHVybiAoKCEodmFkZHIgPj4gNDcpKSB8fCAoKCh2YWRk
ciA+PiA0NykmMHgxRkZGRikgPT0gMHgxRkZGRikpCj4gCj4gQWdyZWU/Cj4gCj4gVGhhbmtzCj4g
CgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
