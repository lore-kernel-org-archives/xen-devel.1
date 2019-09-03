Return-Path: <SRS0=tVhX=W6=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 444F0C3A5A2
	for <xen-devel@archiver.kernel.org>; Tue,  3 Sep 2019 11:51:23 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 190152087E
	for <xen-devel@archiver.kernel.org>; Tue,  3 Sep 2019 11:51:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 190152087E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i57KT-0001Yp-1F; Tue, 03 Sep 2019 11:50:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=CRa/=W6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i57KR-0001Yg-OR
 for xen-devel@lists.xenproject.org; Tue, 03 Sep 2019 11:50:31 +0000
X-Inumbo-ID: 076e5eea-ce41-11e9-8853-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 076e5eea-ce41-11e9-8853-bc764e2007e4;
 Tue, 03 Sep 2019 11:50:30 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 2BF6FAFC3;
 Tue,  3 Sep 2019 11:50:30 +0000 (UTC)
To: Juergen Gross <jgross@suse.com>
References: <20190828080028.18205-1-jgross@suse.com>
 <20190828080028.18205-4-jgross@suse.com>
 <46c66d92-87c0-d90f-921d-68082d52c798@suse.com>
 <fb6cf90c-6ddc-f605-8b18-06010f17fbb4@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <8c915d3c-c022-a397-bf43-db98111ffd0a@suse.com>
Date: Tue, 3 Sep 2019 13:50:35 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <fb6cf90c-6ddc-f605-8b18-06010f17fbb4@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 3/4] xen: refactor debugtrace data
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDMuMDkuMjAxOSAxMjozMSwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBPbiAwMy4wOS4xOSAx
MjoxNiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9uIDI4LjA4LjIwMTkgMTA6MDAsIEp1ZXJnZW4g
R3Jvc3Mgd3JvdGU6Cj4+PiArc3RhdGljIHVuc2lnbmVkIGludCBkZWJ1Z3RyYWNlX2tpbG9ieXRl
cyA9IDEyODsKPj4KPj4gU2luY2UgeW91IHRvdWNoIHRoaXMgYW55d2F5LCBhZGQgX19pbml0ZGF0
YT8gTWF5YmUgYWxzbyBtb3ZlIGl0Cj4+IG5leHQgdG8gaXRzIGludGVnZXJfcGFyYW0oKT8KPiAK
PiBUaGlzIGlzIG1vZGlmaWVkIGluIHBhdGNoIDQgYWdhaW4sIGFuZCB0aGVyZSBJIG5lZWQgaXQg
aW4gdGhlIHJ1bm5pbmcKPiBzeXN0ZW0gZm9yIHN1cHBvcnQgb2YgY3B1IGhvdHBsdWcgd2l0aCBw
ZXItY3B1IGJ1ZmZlcnMuCgpSaWdodCwgSSd2ZSBtZWFud2hpbGUgbm90aWNlZCB0aGlzLiBIZW5j
ZSBpdCdzIGZpbmUgdG8ga2VlcCBhcyBpcy4KCj4+PiBAQCAtMTY1LDEyICsxNzEsMTQgQEAgc3Rh
dGljIGludCBfX2luaXQgZGVidWd0cmFjZV9pbml0KHZvaWQpCj4+PiAgICAgICAgICAgcmV0dXJu
IDA7Cj4+PiAgIAo+Pj4gICAgICAgb3JkZXIgPSBnZXRfb3JkZXJfZnJvbV9ieXRlcyhieXRlcyk7
Cj4+PiAtICAgIGRlYnVndHJhY2VfYnVmID0gYWxsb2NfeGVuaGVhcF9wYWdlcyhvcmRlciwgMCk7
Cj4+PiAtICAgIEFTU0VSVChkZWJ1Z3RyYWNlX2J1ZiAhPSBOVUxMKTsKPj4+ICsgICAgZGF0YSA9
IGFsbG9jX3hlbmhlYXBfcGFnZXMob3JkZXIsIDApOwo+Pj4gKyAgICBpZiAoICFkYXRhICkKPj4+
ICsgICAgICAgIHJldHVybiAtRU5PTUVNOwo+Pj4gICAKPj4+IC0gICAgbWVtc2V0KGRlYnVndHJh
Y2VfYnVmLCAnXDAnLCBieXRlcyk7Cj4+PiArICAgIG1lbXNldChkYXRhLCAnXDAnLCBieXRlcyk7
Cj4+PiAgIAo+Pj4gLSAgICBkZWJ1Z3RyYWNlX2J5dGVzID0gYnl0ZXM7Cj4+PiArICAgIGRhdGEt
PmJ5dGVzID0gYnl0ZXMgLSBzaXplb2YoKmRhdGEpOwo+Pj4gKyAgICBkZWJ0cl9kYXRhID0gZGF0
YTsKPj4KPj4gVGhlIGFsbG9jYXRpb24gbWF5IGVuZCB1cCBiZWluZyBhbG1vc3QgdHdpY2UgYXMg
YmlnIGFzIHdoYXQgZ2V0cwo+PiBhY3R1YWxseSB1c2VkIHRoaXMgd2F5LiBXb3VsZG4ndCBpdCBt
YWtlIHNlbnNlIHRvIHJlLWNhbGN1bGF0ZQo+PiAiYnl0ZXMiIGZyb20gIm9yZGVyIj8KPiAKPiBZ
ZXMsIHlvdSBhcmUgcmlnaHQuCgpBY3R1YWxseSBJIHdhc24ndCwgd2hpY2ggSSBkaWQgbm90aWNl
IHNlZWluZyB0aGUgcmVsZXZhbnQgcGllY2UKb2YgY29kZSBnZXR0aW5nIHRvdWNoZWQgaW4gcGF0
Y2ggNDoKCiAgICB3aGlsZSAoIChrYnl0ZXMgPSAoZGVidWd0cmFjZV9raWxvYnl0ZXMgJiAoZGVi
dWd0cmFjZV9raWxvYnl0ZXMtMSkpKSAhPSAwICkKICAgICAgICBkZWJ1Z3RyYWNlX2tpbG9ieXRl
cyA9IGtieXRlczsKCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
