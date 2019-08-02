Return-Path: <SRS0=7xGv=V6=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBD9EC32750
	for <xen-devel@archiver.kernel.org>; Fri,  2 Aug 2019 04:51:22 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9B1FB206A3
	for <xen-devel@archiver.kernel.org>; Fri,  2 Aug 2019 04:51:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9B1FB206A3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1htPX0-0004G5-Pw; Fri, 02 Aug 2019 04:51:06 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=F6th=V6=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1htPWy-0004Fx-SZ
 for xen-devel@lists.xenproject.org; Fri, 02 Aug 2019 04:51:04 +0000
X-Inumbo-ID: 20f83f20-b4e1-11e9-8980-bc764e045a96
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 20f83f20-b4e1-11e9-8980-bc764e045a96;
 Fri, 02 Aug 2019 04:51:03 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id EFCA5AD89;
 Fri,  2 Aug 2019 04:51:01 +0000 (UTC)
To: Andy Smith <andy@strugglers.net>, Andrew Cooper <andrew.cooper3@citrix.com>
References: <20190721200623.GJ11726@bitfolk.com>
 <7d518504-b12b-a6b9-dc37-7fdb00f8d632@suse.com>
 <c33f310d-7956-ba59-7df7-1cdc66aa1979@citrix.com>
 <20190802021529.GR12975@bitfolk.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <649f7339-a51c-985f-1395-1835f4c04b99@suse.com>
Date: Fri, 2 Aug 2019 06:51:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190802021529.GR12975@bitfolk.com>
Content-Language: en-US
Subject: Re: [Xen-devel] "CPU N still not dead..." messages during microcode
 update stage of boot when smt=0
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
Cc: xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich <JBeulich@suse.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDIuMDguMTkgMDQ6MTUsIEFuZHkgU21pdGggd3JvdGU6Cj4gSGksCj4gCj4gT24gTW9uLCBK
dWwgMjIsIDIwMTkgYXQgMDE6MDY6MDNQTSArMDEwMCwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4g
T24gMjIvMDcvMjAxOSAxMDoxNiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+PiBPbiAyMS4wNy4yMDE5
IDIyOjA2LCBBbmR5IFNtaXRoIHdyb3RlOgo+Pj4+IChYRU4pIEFkZGluZyBjcHUgMSB0byBydW5x
dWV1ZSAwCj4+Pj4gKFhFTikgQ1BVIDEgc3RpbGwgbm90IGRlYWQuLi4KPj4+PiAoWEVOKSBDUFUg
MSBzdGlsbCBub3QgZGVhZC4uLgo+Pj4+IChYRU4pIENQVSAxIHN0aWxsIG5vdCBkZWFkLi4uCj4+
Pj4gKFhFTikgQ1BVIDEgc3RpbGwgbm90IGRlYWQuLi4KPiAKPiBb4oCmXQo+IAo+PiBEb2VzIHJl
dmVydGluZyBiYWNrIHRvIGNyZWRpdDEgbWFrZSB0aGUgaXNzdWUgZ28gYXdheT8KPiAKPiBZZXMs
IEkgZG9uJ3Qgc2VlIHRoaXMgd2l0aCBzY2hlZD1jcmVkaXQsIHNtdD0wIGFuZCBTTVQgZW5hYmxl
ZCBpbgo+IHRoZSBCSU9TOgo+IAo+IChYRU4pIG1pY3JvY29kZTogQ1BVMiB1cGRhdGVkIGZyb20g
cmV2aXNpb24gMHgyMDAwMDU3IHRvIDB4MjAwMDA1ZSwgZGF0ZSA9IDIwMTktMDQtMDIKPiAoWEVO
KSBtaWNyb2NvZGU6IENQVTQgdXBkYXRlZCBmcm9tIHJldmlzaW9uIDB4MjAwMDA1NyB0byAweDIw
MDAwNWUsIGRhdGUgPSAyMDE5LTA0LTAyCj4gKFhFTikgbWljcm9jb2RlOiBDUFU2IHVwZGF0ZWQg
ZnJvbSByZXZpc2lvbiAweDIwMDAwNTcgdG8gMHgyMDAwMDVlLCBkYXRlID0gMjAxOS0wNC0wMgo+
IChYRU4pIG1pY3JvY29kZTogQ1BVOCB1cGRhdGVkIGZyb20gcmV2aXNpb24gMHgyMDAwMDU3IHRv
IDB4MjAwMDA1ZSwgZGF0ZSA9IDIwMTktMDQtMDIKPiAoWEVOKSBtaWNyb2NvZGU6IENQVTEwIHVw
ZGF0ZWQgZnJvbSByZXZpc2lvbiAweDIwMDAwNTcgdG8gMHgyMDAwMDVlLCBkYXRlID0gMjAxOS0w
NC0wMgo+IChYRU4pIG1pY3JvY29kZTogQ1BVMTIgdXBkYXRlZCBmcm9tIHJldmlzaW9uIDB4MjAw
MDA1NyB0byAweDIwMDAwNWUsIGRhdGUgPSAyMDE5LTA0LTAyCj4gKFhFTikgbWljcm9jb2RlOiBD
UFUxNCB1cGRhdGVkIGZyb20gcmV2aXNpb24gMHgyMDAwMDU3IHRvIDB4MjAwMDA1ZSwgZGF0ZSA9
IDIwMTktMDQtMDIKPiAoWEVOKSBCcm91Z2h0IHVwIDggQ1BVcwo+IChYRU4pIFBhcmtlZCA4IENQ
VXMKClRoaXMgd2lsbCBiZSBjdXJlZCBieSBteSBjb3JlIHNjaGVkdWxpbmcgc2VyaWVzLiBBcyBJ
IGRvbid0IHRoaW5rIHdlCndhbnQgdG8gd2FpdCBmb3IgdGhhdCB0byBnbyBpbiBJIGNhbiBpc29s
YXRlIHRoZSByZWxhdGVkIHBhdGNoZXMgYW5kCnBvc3QgdGhlbS4KClRoZSBuZWVkZWQgcGF0Y2hl
cyB3aWxsIGJlOgoKeGVuL3NjaGVkOiB1c2Ugb25lIHNjaGVkdWxlIGxvY2sgZm9yIGFsbCBmcmVl
IGNwdXMKeGVuL3NjaGVkOiBwb3B1bGF0ZSBjcHVwb29sMCBvbmx5IGFmdGVyIGFsbCBjcHVzIGFy
ZSB1cAp4ZW4vc2NoZWQ6IHJlbW92ZSBjcHUgZnJvbSBwb29sMCBiZWZvcmUgcmVtb3ZpbmcgaXQK
eGVuL3NjaGVkOiBhZGQgbWluaW1hbGlzdGljIGlkbGUgc2NoZWR1bGVyIGZvciBmcmVlIGNwdXMK
CldpdGggdGhvc2UgaW4gcGxhY2UgY3JlZGl0MiB3aWxsIG5ldmVyIGJlIGluIGNoYXJnZSBmb3Ig
YSBjcHUganVzdCBiZWluZwpicm91Z2h0IHVwLCB3aGljaCBpbiB0dXJuIGNhbid0IGJsb2NrIGEg
Y3B1IHRvIGJlIHBhcmtlZCByaWdodCBhd2F5LgoKCkp1ZXJnZW4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
