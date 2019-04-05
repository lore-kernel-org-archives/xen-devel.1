Return-Path: <SRS0=0dJu=SH=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F18FC10F0F
	for <xen-devel@archiver.kernel.org>; Fri,  5 Apr 2019 08:12:46 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D67932186A
	for <xen-devel@archiver.kernel.org>; Fri,  5 Apr 2019 08:12:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D67932186A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hCJxa-0008M8-BR; Fri, 05 Apr 2019 08:12:26 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=KiBs=SH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hCJxZ-0008M3-BW
 for xen-devel@lists.xenproject.org; Fri, 05 Apr 2019 08:12:25 +0000
X-Inumbo-ID: 8a412291-577a-11e9-92d7-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 8a412291-577a-11e9-92d7-bc764e045a96;
 Fri, 05 Apr 2019 08:12:23 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Fri, 05 Apr 2019 02:12:22 -0600
Message-Id: <5CA70DE60200007800224CA3@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Fri, 05 Apr 2019 02:12:22 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Andrew Cooper" <andrew.cooper3@citrix.com>
References: <5C868ED8020000780021D5BB@prv1-mh.provo.novell.com>
 <0ce9d1f8-ca58-3f81-4975-7a70f5ab669f@citrix.com>
In-Reply-To: <0ce9d1f8-ca58-3f81-4975-7a70f5ab669f@citrix.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [Xen-devel] Ping: [PATCH v2] x86: don't allow clearing of
 TF_kernel_mode for other than 64-bit PV
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
Cc: xen-devel <xen-devel@lists.xenproject.org>, Tim Deegan <tim@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190405081222.S8o9KlkoPKezggpkYEyW3xc-48jZhBdA9MJZraPBfJs@z>

Pj4+IE9uIDE5LjAzLjE5IGF0IDE4OjAxLCA8Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPiB3cm90
ZToKPiBPbiAzLzExLzE5IDQ6MzcgUE0sIEphbiBCZXVsaWNoIHdyb3RlOgo+PiBUaGUgZmxhZyBp
cyByZWFsbHkgb25seSBtZWFudCBmb3IgdGhvc2UsIGJvdGggSFZNIGFuZCAzMi1iaXQgUFYgdGVs
bAo+PiBrZXJuZWwgZnJvbSB1c2VyIG1vZGUgYmFzZWQgb24gQ1BML1JQTC4gUmVtb3ZlIHRoZSBh
bGwtcXVlc3Rpb24tbWFya3MKPj4gY29tbWVudCBhbmQgbGV0J3MgYmUgb24gdGhlIHNhZmUgc2lk
ZSBoZXJlIGFuZCBhbHNvIHN1cHByZXNzIGNsZWFyaW5nCj4+IGZvciAzMi1iaXQgUFYgKHRoaXMg
aXNuJ3QgYSBmYXN0IHBhdGggYWZ0ZXIgYWxsKS4KPj4gCj4+IFJlbW92ZSBubyBsb25nZXIgbmVj
ZXNzYXJ5IGlzX3B2XzMyYml0XyooKSBmcm9tIHNoX3VwZGF0ZV9jcjMoKSBhbmQKPj4gc2hfd2Fs
a19ndWVzdF90YWJsZXMoKS4gTm90ZSB0aGF0IHNoYWRvd19vbmVfYml0X2Rpc2FibGUoKSBhbHJl
YWR5Cj4+IGFzc3VtZXMgdGhlIG5ldyBiZWhhdmlvci4KPj4gCj4+IFNpZ25lZC1vZmYtYnk6IEph
biBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPiAKPiBBY2tlZC1ieTogR2VvcmdlIER1bmxh
cCA8Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPgoKV2hpbGUgSSBpbnRlbmQgdG8gdGFrZSBHZW9y
Z2UncyBhY2sgYXMgYmVpbmcgc3VmZmljaWVudCB0byBjb3Zlcgp0aGUgc2hhZG93IHNpZGUsIG1h
eSBJIHBsZWFzZSBhc2sgZm9yIGFuIGFjayBvciBvdGhlcndpc2UgZm9yCnRoZSBub24tbW0gcGFy
dCBvZiB0aGUgY2hhbmdlPyBJIGtub3cgeW91J3ZlIG5vdCBiZWVuIGluIGZ1bGwKYWdyZWVtZW50
IHdpdGggdGhlIGNoYW5nZSwgYnV0IGlpcmMgSSd2ZSBuZXZlciBoZWFyZCBiYWNrIG9uIGEKc3Vi
c2VxdWVudCByZXBseSBvZiBtaW5lLiBBbmQgSSBmdXJ0aGVyIHRoaW5rIHRoYXQgd2l0aCB0aGUg
bm93Cih2MikgZXZlbiBtb3JlIG9idmlvdXMgZGVwZW5kZW5jeSBvZiB0aGUgc2hhZG93IGNvZGUg
b24KdGhpcyBiZWhhdmlvciwgdGhlIGNoYW5nZSBzaG91bGQgcmVhbGx5IGJlIHRha2VuIGFzIGlz
LgoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
