Return-Path: <SRS0=7ods=SL=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_NEOMUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89155C282CE
	for <xen-devel@archiver.kernel.org>; Tue,  9 Apr 2019 13:02:38 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 632742133D
	for <xen-devel@archiver.kernel.org>; Tue,  9 Apr 2019 13:02:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 632742133D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hDqOR-00055v-Tg; Tue, 09 Apr 2019 13:02:27 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=htj9=SL=suse.com=pmladek@srs-us1.protection.inumbo.net>)
 id 1hDqOQ-00055l-Po
 for xen-devel@lists.xenproject.org; Tue, 09 Apr 2019 13:02:26 +0000
X-Inumbo-ID: b87b5e7b-5ac7-11e9-92d7-bc764e045a96
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id b87b5e7b-5ac7-11e9-92d7-bc764e045a96;
 Tue, 09 Apr 2019 13:02:25 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 634F5ACC1;
 Tue,  9 Apr 2019 13:02:24 +0000 (UTC)
Date: Tue, 9 Apr 2019 15:02:23 +0200
From: Petr Mladek <pmladek@suse.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Message-ID: <20190409130223.qylyzna7syu5cdc4@pathway.suse.cz>
References: <20190325193229.23390-1-sakari.ailus@linux.intel.com>
 <20190326133510.cylhvyvc7l77bqdg@pathway.suse.cz>
 <20190403112814.7frkxkwmitzugzmt@paasikivi.fi.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190403112814.7frkxkwmitzugzmt@paasikivi.fi.intel.com>
User-Agent: NeoMutt/20170912 (1.9.0)
Subject: Re: [Xen-devel] [PATCH v2 1/1] treewide: Switch printk users from
 %pf and %pF to %ps and %pS, respectively
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
Cc: linux-scsi@vger.kernel.org, linux-pm@vger.kernel.org,
 Anna-Maria Gleixner <anna-maria@linutronix.de>, linux-mmc@vger.kernel.org,
 linux-nvdimm@lists.01.org, linux-um@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-block@vger.kernel.org, linux-acpi@vger.kernel.org,
 netdev@vger.kernel.org, linux-btrfs@vger.kernel.org, linux-pci@vger.kernel.org,
 sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org,
 ceph-devel@vger.kernel.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Linus Torvalds <torvalds@linux-foundation.org>, linux-mm@kvack.org,
 linux-arm-kernel@lists.infradead.org, drbd-dev@lists.linbit.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkIDIwMTktMDQtMDMgMTQ6Mjg6MTQsIFNha2FyaSBBaWx1cyB3cm90ZToKPiBQaW5nLgo+
IAo+IE9uIFR1ZSwgTWFyIDI2LCAyMDE5IGF0IDAyOjM1OjEwUE0gKzAxMDAsIFBldHIgTWxhZGVr
IHdyb3RlOgo+ID4gTGludXMsCj4gPiAKPiA+IE9uIE1vbiAyMDE5LTAzLTI1IDIxOjMyOjI4LCBT
YWthcmkgQWlsdXMgd3JvdGU6Cj4gPiA+ICVwRiBhbmQgJXBmIGFyZSBmdW5jdGlvbmFsbHkgZXF1
aXZhbGVudCB0byAlcFMgYW5kICVwcyBjb252ZXJzaW9uCj4gPiA+IHNwZWNpZmllcnMuIFRoZSBm
b3JtZXIgYXJlIGRlcHJlY2F0ZWQsIHRoZXJlZm9yZSBzd2l0Y2ggdGhlIGN1cnJlbnQgdXNlcnMK
PiA+ID4gdG8gdXNlIHRoZSBwcmVmZXJyZWQgdmFyaWFudC4KPiA+ID4gCj4gPiA+IFRoZSBjaGFu
Z2VzIGhhdmUgYmVlbiBwcm9kdWNlZCBieSB0aGUgZm9sbG93aW5nIGNvbW1hbmQ6Cj4gPiA+IAo+
ID4gPiAJZ2l0IGdyZXAgLWwgJyVwW2ZGXScgfCBncmVwIC12ICdeXCh0b29sc1x8RG9jdW1lbnRh
dGlvblwpLycgfCBcCj4gPiA+IAl3aGlsZSByZWFkIGk7IGRvIHBlcmwgLWkgLXBlICdzLyVwZi8l
cHMvZzsgcy8lcEYvJXBTL2c7JyAkaTsgZG9uZQo+ID4gPiAKPiA+ID4gQW5kIHZlcmlmeWluZyB0
aGUgcmVzdWx0Lgo+ID4gCj4gPiBJIGd1ZXNzIHRoYXQgdGhlIGJlc3QgdGltaW5nIGZvciBzdWNo
IHRyZWUtd2lkZSBjbGVhbiB1cCBpcyB0aGUgZW5kCj4gPiBvZiB0aGUgbWVyZ2Ugd2luZG93LiBT
aG91bGQgd2Ugd2FpdCBmb3IgNS4yIG9yIGlzIGl0IHN0aWxsIGFjY2VwdGFibGUKPiA+IHRvIHB1
c2ggdGhpcyBmb3IgNS4xLXJjMz8KPiAKPiBUaGUgcGF0Y2ggc3RpbGwgY2xlYW5seSBhcHBsaWVz
IHRvIGxpbnV4LW5leHQgYXMgd2VsbHMgYXMgTGludXMncyB0cmVlLgo+IFNvbWUgJXBmIGJpdHMg
aGF2ZSBhcHBlYXJlZCBhbmQgZml4ZWQgc2luY2UgKGluY2x1ZGUvdHJhY2UvZXZlbnRzL3RpbWVy
LmgpOwo+IHRoZSBmaXggaXMgaW4gbGludXgtbmV4dCBzbyBvbmNlIHRoYXQgYW5kIHRoaXMgcGF0
Y2ggYXJlIG1lcmdlZCwgdGhlcmUgYXJlCj4gbm8gcmVtYWluaW5nICVwZiAob3IgJXBGKSB1c2Vy
cyBsZWZ0LgoKSSBoYXZlIHB1c2hlZCB0aGUgcGF0Y2ggaW50byBwcmludGsuZ2l0LCBicmFuY2gg
Zm9yLTUuMi1wZi1yZW1vdmFsLgpJdCBpcyB2MiB3aXRob3V0IHRoZSBpbmNsdWRlL3RyYWNlL2V2
ZW50cy90aW1lci5oIHN0dWZmLgoKQmVzdCBSZWdhcmRzLApQZXRyCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
