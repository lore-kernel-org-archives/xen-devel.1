Return-Path: <SRS0=/JXh=YD=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43DCEC4360C
	for <xen-devel@archiver.kernel.org>; Thu, 10 Oct 2019 11:54:32 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EEE1A206A1
	for <xen-devel@archiver.kernel.org>; Thu, 10 Oct 2019 11:54:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EEE1A206A1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iIX1F-0003iJ-IH; Thu, 10 Oct 2019 11:54:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=cAbn=YD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iIX1E-0003hZ-Ci
 for xen-devel@lists.xenproject.org; Thu, 10 Oct 2019 11:54:08 +0000
X-Inumbo-ID: a8b91fbc-eb54-11e9-9800-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a8b91fbc-eb54-11e9-9800-12813bfff9fa;
 Thu, 10 Oct 2019 11:54:05 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 7A462AD3B;
 Thu, 10 Oct 2019 11:54:04 +0000 (UTC)
To: Roger Pau Monne <roger.pau@citrix.com>
References: <20191010113345.6867-1-roger.pau@citrix.com>
 <20191010113345.6867-2-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <b1e9fac5-a476-638c-e550-c179146ecf7f@suse.com>
Date: Thu, 10 Oct 2019 13:54:06 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191010113345.6867-2-roger.pau@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 1/2] x2APIC: translate IO-APIC entries
 when enabling the IOMMU
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
Cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTAuMTAuMjAxOSAxMzozMywgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+IFdoZW4gaW50ZXJy
dXB0IHJlbWFwcGluZyBpcyBlbmFibGVkIGFzIHBhcnQgb2YgZW5hYmxpbmcgeDJBUElDIHRoZQoK
UGVyaGFwcyAidW5tYXNrZWQiIGluc3RlYWQgb2YgInRoZSI/Cgo+IElPLUFQSUMgZW50cmllcyBh
bHNvIG5lZWQgdG8gYmUgdHJhbnNsYXRlZCB0byB0aGUgbmV3IGZvcm1hdCBhbmQgYWRkZWQKPiB0
byB0aGUgaW50ZXJydXB0IHJlbWFwcGluZyB0YWJsZS4KPiAKPiBUaGlzIHByZXZlbnRzIElPTU1V
IGludGVycnVwdCByZW1hcHBpbmcgZmF1bHRzIHdoZW4gYm9vdGluZyBvbgo+IGhhcmR3YXJlIHRo
YXQgaGFzIHVubWFza2VkIElPLUFQSUMgcGlucy4KCkJ1dCBpbiB0aGUgZW5kIGl0IG9ubHkgcGFw
ZXJzIG92ZXIgd2hhdGV2ZXIgdGhlIHNwdXJpb3VzIGludGVycnVwdHMKcmVzdWx0IGZvcm0sIGRv
ZXNuJ3QgaXQ/IFdoaWNoIGlzbid0IHRvIHNheSB0aGlzIGlzbid0IGFuCmltcHJvdmVtZW50LiBD
YWxsaW5nIG91dCB0aGUgRXh0SW50IGNhc2UgaGVyZSBtYXkgYmUgd29ydGh3aGlsZSBhcwp3ZWxs
LCBhcyB3b3VsZCBiZSBwb2ludGluZyBvdXQgdGhhdCB0aGlzIGNhc2Ugc3RpbGwgd29uJ3Qgd29y
ayBvbgpBTUQgSU9NTVVzLgoKPiAtLS0gYS94ZW4vYXJjaC94ODYvYXBpYy5jCj4gKysrIGIveGVu
L2FyY2gveDg2L2FwaWMuYwo+IEBAIC01MTUsNyArNTE1LDcgQEAgc3RhdGljIHZvaWQgcmVzdW1l
X3gyYXBpYyh2b2lkKQo+ICAgICAgaW9tbXVfZW5hYmxlX3gyYXBpYygpOwo+ICAgICAgX19lbmFi
bGVfeDJhcGljKCk7Cj4gIAo+IC0gICAgcmVzdG9yZV9JT19BUElDX3NldHVwKGlvYXBpY19lbnRy
aWVzKTsKPiArICAgIHJlc3RvcmVfSU9fQVBJQ19zZXR1cChpb2FwaWNfZW50cmllcywgdHJ1ZSk7
Cj4gICAgICB1bm1hc2tfODI1OUEoKTsKPiAgCj4gIG91dDoKPiBAQCAtOTYxLDcgKzk2MSwxMiBA
QCB2b2lkIF9faW5pdCB4MmFwaWNfYnNwX3NldHVwKHZvaWQpCj4gICAgICAgICAgcHJpbnRrKCJT
d2l0Y2hlZCB0byBBUElDIGRyaXZlciAlc1xuIiwgZ2VuYXBpYy5uYW1lKTsKPiAgCj4gIHJlc3Rv
cmVfb3V0Ogo+IC0gICAgcmVzdG9yZV9JT19BUElDX3NldHVwKGlvYXBpY19lbnRyaWVzKTsKPiAr
ICAgIC8qCj4gKyAgICAgKiBOQjogZG8gbm90IHVzZSByYXcgbW9kZSB3aGVuIHJlc3RvcmluZyBl
bnRyaWVzIGlmIHRoZSBpb21tdSBoYXMgYmVlbgo+ICsgICAgICogZW5hYmxlZCBkdXJpbmcgdGhl
IHByb2Nlc3MsIGJlY2F1c2UgdGhlIGVudHJpZXMgbmVlZCB0byBiZSB0cmFuc2xhdGVkCj4gKyAg
ICAgKiBhbmQgYWRkZWQgdG8gdGhlIHJlbWFwcGluZyB0YWJsZSBpbiB0aGF0IGNhc2UuCj4gKyAg
ICAgKi8KPiArICAgIHJlc3RvcmVfSU9fQVBJQ19zZXR1cChpb2FwaWNfZW50cmllcywgIXgyYXBp
Y19lbmFibGVkKTsKCkhvdyBpcyB0aGlzIGRpZmZlcmVudCBpbiB0aGUgcmVzdW1lX3gyYXBpYygp
IGNhc2U/IFRoZSBJT01NVSBnZXRzCmVuYWJsZWQgaW4gdGhlIGNvdXJzZSBvZiB0aGF0IGFzIHdl
bGwuIEkuZS4gSSdkIGV4cGVjdCB5b3Ugd2FudAp0byBwYXNzICJmYWxzZSIgdGhlcmUsIG5vdCAi
dHJ1ZSIuCgpBbHNvIGhvdyB3b3VsZCAieDJhcGljX2VuYWJsZWQiIHJlZmxlY3QgdGhlIHRyYW5z
aXRpb24/IEl0IG1heQpoYXZlIGJlZW4gInRydWUiIGFscmVhZHkgYmVmb3JlIGVudGVyaW5nIHRo
ZSBmdW5jdGlvbiBoZXJlLgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
