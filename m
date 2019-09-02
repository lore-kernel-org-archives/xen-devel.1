Return-Path: <SRS0=4VTz=W5=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0947C3A59B
	for <xen-devel@archiver.kernel.org>; Mon,  2 Sep 2019 07:54:38 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 789342173E
	for <xen-devel@archiver.kernel.org>; Mon,  2 Sep 2019 07:54:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 789342173E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i4hAL-0000pP-Qu; Mon, 02 Sep 2019 07:54:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=kzGk=W5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i4hAJ-0000pK-Tz
 for xen-devel@lists.xenproject.org; Mon, 02 Sep 2019 07:54:19 +0000
X-Inumbo-ID: dbe75f83-cd56-11e9-ae9f-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id dbe75f83-cd56-11e9-ae9f-12813bfff9fa;
 Mon, 02 Sep 2019 07:54:17 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 5326BAFBE;
 Mon,  2 Sep 2019 07:54:16 +0000 (UTC)
To: Adam Zerella <adam.zerella@gmail.com>
References: <20190901065828.7762-1-adam.zerella@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <84ce8eca-b02a-de32-2e1b-a0bf3542c674@suse.com>
Date: Mon, 2 Sep 2019 09:54:20 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190901065828.7762-1-adam.zerella@gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] x86/xen/efi: Fix EFI variable 'name' type
 conversion
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
 Stefano Stabellini <sstabellini@kernel.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>,
 xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDEuMDkuMjAxOSAwODo1OCwgQWRhbSBaZXJlbGxhIHdyb3RlOgo+IFRoaXMgcmVzb2x2ZXMg
YSB0eXBlIGNvbnZlcnNpb24gZnJvbSAnY2hhciAqJyB0byAndW5zaWduZWQgc2hvcnQnLgoKQ291
bGQgeW91IGV4cGxhaW4gdGhpcz8gVGhlcmUncyBubyAuLi4KCj4gLS0tIGEvYXJjaC94ODYveGVu
L2VmaS5jCj4gKysrIGIvYXJjaC94ODYveGVuL2VmaS5jCj4gQEAgLTExOCw4ICsxMTgsOCBAQCBz
dGF0aWMgZW51bSBlZmlfc2VjdXJlYm9vdF9tb2RlIHhlbl9lZmlfZ2V0X3NlY3VyZWJvb3Qodm9p
ZCkKPiAgCXVuc2lnbmVkIGxvbmcgc2l6ZTsKPiAgCj4gIAlzaXplID0gc2l6ZW9mKHNlY2Jvb3Qp
Owo+IC0Jc3RhdHVzID0gZWZpLmdldF92YXJpYWJsZShMIlNlY3VyZUJvb3QiLCAmZWZpX3Zhcmlh
YmxlX2d1aWQsCj4gLQkJCQkgIE5VTEwsICZzaXplLCAmc2VjYm9vdCk7Cj4gKwlzdGF0dXMgPSBl
ZmkuZ2V0X3ZhcmlhYmxlKChlZmlfY2hhcjE2X3QgKilMIlNlY3VyZUJvb3QiLAo+ICsJCQkJICAm
ZWZpX3ZhcmlhYmxlX2d1aWQsIE5VTEwsICZzaXplLCAmc2VjYm9vdCk7CgouLi4gImNoYXIgKiIg
cmVzdWx0aW5nIGFzIHR5cGUgZm9yIEwiIiB0eXBlIHN0cmluZ3MsIGhlbmNlIHRoZXJlCnNob3Vs
ZCBiZSBubyBuZWVkIGZvciBhIGNhc3Q6IEluIGZhY3QgSSBjb25zaWRlciBzdWNoIGNhc3RzCmRh
bmdlcm91cywgYXMgdGhleSBtYXkgaGlkZSBhY3R1YWwgcHJvYmxlbXMuIFRvIG1lIHRoaXMgbG9v
a3MKbW9yZSBsaWtlIHNvbWV0aGluZyB0aGF0IHdhbnRzIGZpeGluZyBpbiBzcGFyc2U7IHRoZSBj
b21waWxlcnMsCmFmdGVyIGFsbCwgaGF2ZSBubyBpc3N1ZSB3aXRoIHN1Y2ggd2lkZSBjaGFyYWN0
ZXIgc3RyaW5nIGxpdGVyYWxzLgoKPiBAQCAtMTU4LDcgKzE1OCw3IEBAIHN0YXRpYyBlbnVtIGVm
aV9zZWN1cmVib290X21vZGUgeGVuX2VmaV9nZXRfc2VjdXJlYm9vdCh2b2lkKQo+ICAJcmV0dXJu
IGVmaV9zZWN1cmVib290X21vZGVfdW5rbm93bjsKPiAgfQo+ICAKPiAtdm9pZCBfX2luaXQgeGVu
X2VmaV9pbml0KHN0cnVjdCBib290X3BhcmFtcyAqYm9vdF9wYXJhbXMpCj4gK3N0YXRpYyB2b2lk
IF9faW5pdCB4ZW5fZWZpX2luaXQoc3RydWN0IGJvb3RfcGFyYW1zICpib290X3BhcmFtcykKPiAg
ewo+ICAJZWZpX3N5c3RlbV90YWJsZV90ICplZmlfc3lzdGFiX3hlbjsKCklmIEkgd2FzIGEgbWFp
bnRhaW5lciBvZiB0aGlzIGNvZGUsIEknZCByZXF1ZXN0IHRoaXMgbm90IGJlIHBhcnQKb2YgYSBw
YXRjaCB3aXRoIGEgdGl0bGUgYmVpbmcgZW50aXJlbHkgdW5yZWxhdGVkIHRvIHRoZSBjaGFuZ2Uu
CgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
