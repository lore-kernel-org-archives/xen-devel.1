Return-Path: <SRS0=4rCt=ZV=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57247C432C0
	for <xen-devel@archiver.kernel.org>; Fri, 29 Nov 2019 13:50:29 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2DAD4217AB
	for <xen-devel@archiver.kernel.org>; Fri, 29 Nov 2019 13:50:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2DAD4217AB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iagey-00066P-TD; Fri, 29 Nov 2019 13:50:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=mjd+=ZV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iagex-00066K-ND
 for xen-devel@lists.xenproject.org; Fri, 29 Nov 2019 13:50:11 +0000
X-Inumbo-ID: 291a1090-12af-11ea-83b8-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 291a1090-12af-11ea-83b8-bc764e2007e4;
 Fri, 29 Nov 2019 13:50:11 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 153DFAC93;
 Fri, 29 Nov 2019 13:50:10 +0000 (UTC)
To: Wei Liu <wl@xen.org>
References: <20191121185049.16666-1-liuwe@microsoft.com>
 <20191121185049.16666-7-liuwe@microsoft.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <adb846a4-1adc-b02d-6924-0ffb23da2832@suse.com>
Date: Fri, 29 Nov 2019 14:50:18 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191121185049.16666-7-liuwe@microsoft.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v4 6/8] x86: switch xen guest implementation
 to use hypervisor framework
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
Cc: Xen Development List <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <liuwe@microsoft.com>, Michael Kelley <mikelley@microsoft.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjEuMTEuMjAxOSAxOTo1MCwgV2VpIExpdSB3cm90ZToKPiArdm9pZCBfX2luaXQgaHlwZXJ2
aXNvcl9zZXR1cCh2b2lkKQo+ICt7Cj4gKyAgICBpZiAoIGhvcHMgJiYgaG9wcy0+c2V0dXAgKQo+
ICsgICAgICAgIGhvcHMtPnNldHVwKCk7Cj4gK30KPiArCj4gK3ZvaWQgaHlwZXJ2aXNvcl9hcF9z
ZXR1cCh2b2lkKQo+ICt7Cj4gKyAgICBpZiAoIGhvcHMgJiYgaG9wcy0+YXBfc2V0dXAgKQo+ICsg
ICAgICAgIGhvcHMtPmFwX3NldHVwKCk7Cj4gK30KPiArCj4gK3ZvaWQgaHlwZXJ2aXNvcl9yZXN1
bWUodm9pZCkKPiArewo+ICsgICAgaWYgKCBob3BzICYmIGhvcHMtPnJlc3VtZSApCj4gKyAgICAg
ICAgaG9wcy0+cmVzdW1lKCk7Cj4gK30KCkkgYXNzdW1lIHRoZXNlIGRvbid0IGdldCBleGVjdXRl
ZCBmcmVxdWVudGx5IGVub3VnaCBmb3IKYWx0ZXJuYXRpdmVzIGluZGlyZWN0IGNhbGwgcGF0Y2hp
bmcgdG8gbWF0dGVyPyBEb3duIHRoZSByb2FkLCBpZgphbnkgbW9yZSBmcmVxdWVudGx5IGV4ZWN1
dGVkIGhvb2tzIHNob3VsZCBhcHBlYXIsIHdlIHdpbGwgd2FudAp0byBzd2l0Y2ggdG8gdGhhdCBt
b2RlbCB0aG91Z2guIFRoaXMgaGFzIHRoZSBhZGRlZCBiZW5lZml0IG9mCnRoZXJlIHRoZW4gYmVp
bmcgb25seSBvbmUgcnVudGltZSBpbnN0YW5jZSBvZiBzdHJ1Y3QKaHlwZXJ2aXNvcl9vcHM7IGFs
bCBwZXItaHlwZXJ2aXNvciBvbmVzIHdvdWxkIGJlY29tZQpfX2luaXRjb25zdHJlbC4KCj4gQEAg
LTMyNiw2ICszMTAsMzEgQEAgdm9pZCBoeXBlcnZpc29yX3Jlc3VtZSh2b2lkKQo+ICAgICAgICAg
IHB2X2NvbnNvbGVfaW5pdCgpOwo+ICB9Cj4gIAo+ICtzdGF0aWMgY29uc3Qgc3RydWN0IGh5cGVy
dmlzb3Jfb3BzIHhnX29wcyA9IHsKCldpdGggdGhpcyBuZXcgeGdfIHByZWZpeCwgLi4uCgo+ICsg
ICAgLm5hbWUgPSAiWGVuIiwKPiArICAgIC5zZXR1cCA9IHhlbl9zZXR1cCwKPiArICAgIC5hcF9z
ZXR1cCA9IHhlbl9hcF9zZXR1cCwKPiArICAgIC5yZXN1bWUgPSB4ZW5fcmVzdW1lLAoKLi4uIEkn
ZCBsaWtlIHRvIHN1Z2dlc3QgdG8gdXNlIGl0IGZvciB0aGVzZSBvbmVzIHRvbyAoaWYgdGhleQpu
ZWVkIHRvIGhhdmUgYSBwcmVmaXggaW4gdGhlIGZpcnN0IHBsYWNlLCB3aGljaCBJIGRvdWJ0LCBi
dXQKd2hpY2ggSSBrbm93IG90aGVycyB2aWV3IGRpZmZlcmVudGx5KS4KCj4gK2NvbnN0IHN0cnVj
dCBoeXBlcnZpc29yX29wcyAqIF9faW5pdCB4ZW5fcHJvYmUodm9pZCkKCkZvciB0aGlzIG9uZSB0
aGUgY2FsbCBpcyBhIGxpdHRsZSBtb3JlIGRpZmZpY3VsdCwgYnV0IGZvcgpjb25zaXN0ZW5jeSBJ
IHRoaW5rIHhnXyB3b3VsZCBiZSBzbGlnaHRseSBiZXR0ZXIgaGVyZSBhcyB3ZWxsLgoKTml0OiBT
dHJpY3RseSBzcGVha2luZyB0aGVyZSdzIGEgc3RyYXkgYmxhbmsgYWZ0ZXIgKi4gV2UKbm9ybWFs
bHkgaGF2ZSBvbmVzIG9ubHkgYWhlYWQgb2YgKiwgYnV0IG5vdCBhZnRlci4KCkphbgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
