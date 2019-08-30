Return-Path: <SRS0=lSNx=W2=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B50CC3A5A3
	for <xen-devel@archiver.kernel.org>; Fri, 30 Aug 2019 07:08:36 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DEBCF22CE3
	for <xen-devel@archiver.kernel.org>; Fri, 30 Aug 2019 07:08:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DEBCF22CE3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i3b17-0007DZ-Tx; Fri, 30 Aug 2019 07:08:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=xdvb=W2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i3b16-0007DU-Av
 for xen-devel@lists.xenproject.org; Fri, 30 Aug 2019 07:08:16 +0000
X-Inumbo-ID: ed620911-caf4-11e9-ae7b-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ed620911-caf4-11e9-ae7b-12813bfff9fa;
 Fri, 30 Aug 2019 07:08:13 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 417B1B6EC;
 Fri, 30 Aug 2019 07:08:12 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Lars Kurth <lars.kurth@xenproject.org>
References: <20190823142529.21521-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <217c4457-0a2e-76c2-aade-5a160a9466e9@suse.com>
Date: Fri, 30 Aug 2019 09:08:09 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190823142529.21521-1-andrew.cooper3@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] MAINTAINERS: Fold SVM into x86
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
 George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 Ian Jackson <ian.jackson@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjMuMDguMjAxOSAxNjoyNSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBXZSBhcmUgbm93IGRv
d24gdG8gMCBTVk0gbWFpbnRhaW5lcnMgd2hvIGFyZSBhY3RpdmUgYW5kIHdpc2ggdG8gaG9sZCB0
aGUKPiBwb3NpdGlvbi4gIEZhbGwgYmFjayB0byBnZW5lcmFsIHg4NiBtYWludGVuYW5jZSB1bnRp
bCB0aGlzIHBvc2l0aW9uIGNoYW5nZXMuCgpXaGF0IHlvdSBzYXkgYWJvdmUgd29ya3MgZm9yIFNW
TSwgYnV0IC4uLgoKPiAtLS0gYS9NQUlOVEFJTkVSUwo+ICsrKyBiL01BSU5UQUlORVJTCj4gQEAg
LTE0NCwxOCArMTQ0LDYgQEAgRjoJeGVuL2RyaXZlcnMvYWNwaS8KPiAgRjoJeGVuL2luY2x1ZGUv
YWNwaS8KPiAgRjoJdG9vbHMvbGliYWNwaS8KPiAgCj4gLUFNRCBJT01NVQo+IC1NOglTdXJhdmVl
IFN1dGhpa3VscGFuaXQgPHN1cmF2ZWUuc3V0aGlrdWxwYW5pdEBhbWQuY29tPgo+IC1TOglNYWlu
dGFpbmVkCj4gLUY6CXhlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FtZC8KCi4uLiBub3QgZm9yIHRo
aXMsIHdoaWNoIHdpbGwgbWFrZSBtZSB0aGUgb25seSBtYWludGFpbmVyLCB3aGljaCBpbiB0dXJu
CkkgZG9uJ3QgdGhpbmsgaXMgd2hhdCB5b3Ugd2FudC4gSU9XIGlmIHRoaXMgaXMgdGhlIHdheSB0
byBnbyAoc2VlIGJlbG93KQp0aGVuIEkgdGhpbmsgeW91IHdhbnQgdG8gbW92ZSB0aGlzIEY6IGxp
bmUgdG8gdGhlIFg4NiBzZWN0aW9uLgoKSW5kZXBlbmRlbnQgb2YgdGhhdCBJIHdvbmRlciB3aGV0
aGVyIHdlIHNob3VsZG4ndCBnZXQgYXQgbGVhc3Qgc29tZQpjb25zZW50IGZyb20gQU1EIG9uIHRo
aXMsIGV2ZW4gaWYgcGVyaGFwcyBub3QgaW4gdGhlIHNoYXBlIG9mIGEKZm9ybWFsIGFjay4gTGFy
cywgY2FuIHlvdSBwb3NzaWJseSB0cnkgdG8gaGVscCBvdXQgd2l0aCB0aGlzPwoKSmFuCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
