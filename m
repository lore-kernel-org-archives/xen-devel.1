Return-Path: <SRS0=neah=WM=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2698C3A59C
	for <xen-devel@archiver.kernel.org>; Fri, 16 Aug 2019 09:17:54 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9DFF2206C2
	for <xen-devel@archiver.kernel.org>; Fri, 16 Aug 2019 09:17:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9DFF2206C2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hyYMY-0008Gv-6r; Fri, 16 Aug 2019 09:17:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=n1LD=WM=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hyYMW-0008Gq-VK
 for xen-devel@lists.xenproject.org; Fri, 16 Aug 2019 09:17:32 +0000
X-Inumbo-ID: aba0f566-c006-11e9-8bb2-12813bfff9fa
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id aba0f566-c006-11e9-8bb2-12813bfff9fa;
 Fri, 16 Aug 2019 09:17:29 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2507728;
 Fri, 16 Aug 2019 02:17:29 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8B1A03F706;
 Fri, 16 Aug 2019 02:17:28 -0700 (PDT)
To: Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <alpine.DEB.2.21.1908151634170.8737@sstabellini-ThinkPad-T480s>
 <20190815233618.31630-2-sstabellini@kernel.org>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <df288911-2b33-8160-582d-e3c933ee8b8d@arm.com>
Date: Fri, 16 Aug 2019 10:17:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190815233618.31630-2-sstabellini@kernel.org>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v6 2/8] xen/arm: make process_memory_node a
 device_tree_node_func
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
Cc: Stefano Stabellini <stefanos@xilinx.com>, Volodymyr_Babchuk@epam.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiAxNi8wOC8yMDE5IDAwOjM2LCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6Cj4gQ2hh
bmdlIHRoZSBzaWduYXR1cmUgb2YgcHJvY2Vzc19tZW1vcnlfbm9kZSB0byBtYXRjaAo+IGRldmlj
ZV90cmVlX25vZGVfZnVuYy4gVGhhbmtzIHRvIHRoaXMgY2hhbmdlLCB0aGUgbmV4dCBwYXRjaCB3
aWxsIGJlCj4gYWJsZSB0byB1c2UgZGV2aWNlX3RyZWVfZm9yX2VhY2hfbm9kZSB0byBjYWxsIHBy
b2Nlc3NfbWVtb3J5X25vZGUgb24gYWxsCj4gdGhlIGNoaWxkcmVuIG9mIGEgcHJvdmlkZWQgbm9k
ZS4KPiAKPiBSZXR1cm4gZXJyb3IgaWYgdGhlcmUgaXMgbm8gcmVnIHByb3BlcnR5IG9yIGlmIG5y
X2JhbmtzIGlzIHJlYWNoZWQuIExldAo+IHRoZSBjYWxsZXIgZGVhbCB3aXRoIHRoZSBlcnJvci4K
ClRoaXMgc2VudGVuY2UgZG9lcyBub3QgbWF0Y2ggdGhlIGNoYW5nZSBiZWxvdy4gT25seSAyIG9m
IHRoZSBuZXcgZXJyb3IgcGF0aHMgYXJlIApkZXNjcmliZWQgaGVyZS4KCj4gCj4gQWRkIGEgcHJp
bnRrIHdoZW4gZGV2aWNlIHRyZWUgcGFyc2luZyBmYWlscy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBT
dGVmYW5vIFN0YWJlbGxpbmkgPHN0ZWZhbm9zQHhpbGlueC5jb20+Cj4gLS0tCj4gQ2hhbmdlcyBp
biB2NjoKPiAtIGZpeCBvdXQgb2Ygc3BhY2UgY2hlY2sKPiAtIGJyaW5nIGJhY2sgcHJpbnRrIHdo
ZW4gYWRkcmVzc19jZWxscyBvciBzaXplX2NlbGxzIGFyZSBub3QgcHJvcGVybHkgc2V0Cj4gLSBy
ZXR1cm4gLUVJTlZBTCBpbiB0aGF0IGNhc2UgKGRpZmZlcmVudCBmcm9tIHJlZyBtaXNzaW5nKQo+
IC0gYWRkIHByaW50ayB3aGVuIHBhcnNpbmcgZmFpbHMKPiAtIHJldHVybiAtRU5PRU5UIHdoZW4g
bWVtb3J5IHNpemUgaXMgMAo+IAo+IENoYW5nZXMgaW4gdjU6Cj4gLSByZXR1cm4gLUVOT0VOVCBp
ZiBhZGRyZXNzX2NlbGxzIG9yIHNpemVfY2VsbHMgYXJlIG5vdCBwcm9wZXJseSBzZXQKPiAKPiBD
aGFuZ2VzIGluIHY0Ogo+IC0gcmV0dXJuIGVycm9yIGlmIHRoZXJlIGlzIG5vIHJlZyBwcm9wZXJ5
LCByZW1vdmUgcHJpbnRrCj4gLSByZXR1cm4gZXJyb3IgaWYgbnJfYmFua3MgaXMgcmVhY2hlZAo+
IAo+IENoYW5nZXMgaW4gdjM6Cj4gLSBpbXByb3ZlIGNvbW1pdCBtZXNzYWdlCj4gLSBjaGVjayBy
ZXR1cm4gdmFsdWUgb2YgcHJvY2Vzc19tZW1vcnlfbm9kZQo+IAo+IENoYW5nZXMgaW4gdjI6Cj4g
LSBuZXcKPiAtLS0KPiAgIHhlbi9hcmNoL2FybS9ib290ZmR0LmMgfCAyOSArKysrKysrKysrKysr
KysrKystLS0tLS0tLS0tLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDE4IGluc2VydGlvbnMoKyksIDEx
IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vYm9vdGZkdC5jIGIv
eGVuL2FyY2gvYXJtL2Jvb3RmZHQuYwo+IGluZGV4IGYxNjE0ZWY3ZmMuLjlkYzJjMTM1MmQgMTAw
NjQ0Cj4gLS0tIGEveGVuL2FyY2gvYXJtL2Jvb3RmZHQuYwo+ICsrKyBiL3hlbi9hcmNoL2FybS9i
b290ZmR0LmMKPiBAQCAtMTMwLDkgKzEzMCwxMCBAQCBpbnQgX19pbml0IGRldmljZV90cmVlX2Zv
cl9lYWNoX25vZGUoY29uc3Qgdm9pZCAqZmR0LCBpbnQgbm9kZSwKPiAgICAgICByZXR1cm4gMDsK
PiAgIH0KPiAgIAo+IC1zdGF0aWMgdm9pZCBfX2luaXQgcHJvY2Vzc19tZW1vcnlfbm9kZShjb25z
dCB2b2lkICpmZHQsIGludCBub2RlLAo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBjb25zdCBjaGFyICpuYW1lLAo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICB1MzIgYWRkcmVzc19jZWxscywgdTMyIHNpemVfY2VsbHMpCj4gK3N0YXRpYyBp
bnQgX19pbml0IHByb2Nlc3NfbWVtb3J5X25vZGUoY29uc3Qgdm9pZCAqZmR0LCBpbnQgbm9kZSwK
PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb25zdCBjaGFyICpuYW1l
LCBpbnQgZGVwdGgsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdTMy
IGFkZHJlc3NfY2VsbHMsIHUzMiBzaXplX2NlbGxzLAo+ICsgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHZvaWQgKmRhdGEpCj4gICB7Cj4gICAgICAgY29uc3Qgc3RydWN0IGZk
dF9wcm9wZXJ0eSAqcHJvcDsKPiAgICAgICBpbnQgaTsKPiBAQCAtMTQ1LDE1ICsxNDYsMTIgQEAg
c3RhdGljIHZvaWQgX19pbml0IHByb2Nlc3NfbWVtb3J5X25vZGUoY29uc3Qgdm9pZCAqZmR0LCBp
bnQgbm9kZSwKPiAgICAgICB7Cj4gICAgICAgICAgIHByaW50aygiZmR0OiBub2RlIGAlcyc6IGlu
dmFsaWQgI2FkZHJlc3MtY2VsbHMgb3IgI3NpemUtY2VsbHMiLAo+ICAgICAgICAgICAgICAgICAg
bmFtZSk7Cj4gLSAgICAgICAgcmV0dXJuOwo+ICsgICAgICAgIHJldHVybiAtRUlOVkFMOwo+ICAg
ICAgIH0KPiAgIAo+ICAgICAgIHByb3AgPSBmZHRfZ2V0X3Byb3BlcnR5KGZkdCwgbm9kZSwgInJl
ZyIsIE5VTEwpOwo+ICAgICAgIGlmICggIXByb3AgKQo+IC0gICAgewo+IC0gICAgICAgIHByaW50
aygiZmR0OiBub2RlIGAlcyc6IG1pc3NpbmcgYHJlZycgcHJvcGVydHlcbiIsIG5hbWUpOwo+IC0g
ICAgICAgIHJldHVybjsKPiAtICAgIH0KPiArICAgICAgICByZXR1cm4gLUVOT0VOVDsKPiAgIAo+
ICAgICAgIGNlbGwgPSAoY29uc3QgX19iZTMyICopcHJvcC0+ZGF0YTsKPiAgICAgICBiYW5rcyA9
IGZkdDMyX3RvX2NwdShwcm9wLT5sZW4pIC8gKHJlZ19jZWxscyAqIHNpemVvZiAodTMyKSk7Cj4g
QEAgLTE2MiwxMSArMTYwLDE1IEBAIHN0YXRpYyB2b2lkIF9faW5pdCBwcm9jZXNzX21lbW9yeV9u
b2RlKGNvbnN0IHZvaWQgKmZkdCwgaW50IG5vZGUsCj4gICAgICAgewo+ICAgICAgICAgICBkZXZp
Y2VfdHJlZV9nZXRfcmVnKCZjZWxsLCBhZGRyZXNzX2NlbGxzLCBzaXplX2NlbGxzLCAmc3RhcnQs
ICZzaXplKTsKPiAgICAgICAgICAgaWYgKCAhc2l6ZSApCj4gLSAgICAgICAgICAgIGNvbnRpbnVl
Owo+ICsgICAgICAgICAgICByZXR1cm4gLUVOT0VOVDsKCkkgZG9uJ3QgdGhpbmsgd2UgY2FuIHRy
ZWF0IHRoZSBzYW1lIHdheSB0aGUgbGFjayBvZiAicmVncyIgcHJvcGVydGllcyBhbmQgYSBzaXpl
IApvZiAwLgoKVGhlIGZvcm1lciBpcyBleHBlY3RlZCBhcyBiaW5kaW5nIGFsbG93IHlvdSB0byBk
byBpdCBmb3IgcmVzZXJ2ZWQtbWVtb3J5LiBUaGUgCmxhdHRlciBpcyB0aGUgdXNlciBub3Qgd3Jp
dGluZyB0aGUgcHJvcGVydHkgY29ycmVjdGx5LiBTbyBpZ25vcmluZyB0aGUgbGF0dGVyIAp3aWxs
IHJlc3VsdCB0byBYZW4gcG90ZW50aWFsbHkgbWlzc2luZyBzb21lIHJlc2VydmVkLXJlZ2lvbnMg
KG5vdCBncmVhdCEpLgoKU28sIHNpbWlsYXIgdG8gI2FkZHJlc3MtY2VsbHMvI3NpemUtY2VsbHMg
ZGlzY3Vzc2lvbiwgd2Ugc2hvdWxkIHJldHVybiBhbiBlcnJvciAKd2UgYXJlIGFibGUgdG8gZGlz
dGluZ3Vpc2guIFByb2JhYmx5IC1FSU5WQUwuCgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
