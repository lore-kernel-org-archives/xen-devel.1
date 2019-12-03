Return-Path: <SRS0=u+XK=ZZ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5391AC43215
	for <xen-devel@archiver.kernel.org>; Tue,  3 Dec 2019 08:15:54 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2D43D206DF
	for <xen-devel@archiver.kernel.org>; Tue,  3 Dec 2019 08:15:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2D43D206DF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ic3LU-0001OX-TD; Tue, 03 Dec 2019 08:15:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=zSMg=ZZ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ic3LU-0001OP-0m
 for xen-devel@lists.xenproject.org; Tue, 03 Dec 2019 08:15:44 +0000
X-Inumbo-ID: 1997fca6-15a5-11ea-a55d-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1997fca6-15a5-11ea-a55d-bc764e2007e4;
 Tue, 03 Dec 2019 08:15:43 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id C82F6ACB4;
 Tue,  3 Dec 2019 08:15:42 +0000 (UTC)
To: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
References: <20191121150124.15865-1-aisaila@bitdefender.com>
 <20191121150124.15865-2-aisaila@bitdefender.com>
 <4079604a-8f82-687c-19ff-d0ecfd068dd3@suse.com>
 <528a8abe-d697-1c07-9e7c-43e02e4680a6@bitdefender.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <9a88c571-18a2-a15a-6172-70c8d1f93a5a@suse.com>
Date: Tue, 3 Dec 2019 09:15:55 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <528a8abe-d697-1c07-9e7c-43e02e4680a6@bitdefender.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH V3 2/2] x86/mm: Make use of the default
 access param from xc_altp2m_create_view
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
Cc: Petre Ovidiu PIRCALABU <ppircalabu@bitdefender.com>,
 Kevin Tian <kevin.tian@intel.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 Razvan COJOCARU <rcojocaru@bitdefender.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tamas K Lengyel <tamas@tklengyel.com>,
 Jun Nakajima <jun.nakajima@intel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDIuMTIuMjAxOSAxMzozOSwgQWxleGFuZHJ1IFN0ZWZhbiBJU0FJTEEgd3JvdGU6Cj4gT24g
MjkuMTEuMjAxOSAxMzo0MSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9uIDIxLjExLjIwMTkgMTY6
MDIsIEFsZXhhbmRydSBTdGVmYW4gSVNBSUxBIHdyb3RlOgo+Pj4gQ2hhbmdlcyBzaW5jZSBWMjoK
Pj4+IAktIERyb3Agc3RhdGljIGZyb20geGVubWVtX2FjY2Vzc190b19wMm1fYWNjZXNzKCkgYW5k
IGRlY2xhcmUgaXQKPj4+IGluIG1lbV9hY2Nlc3MuaAo+Pj4gCS0gVXNlIHhlbm1lbV9hY2Nlc3Nf
dG9fcDJtX2FjY2VzcygpIGluIHAybV9pbml0X25leHRfYWx0cDJtKCkKPj4+IAktIFB1bGwgb3V0
IHRoZSBwMm0gc3BlY2lmaWNzIGZyb20gcDJtX2luaXRfYWx0cDJtX2VwdCgpLgo+Pgo+PiBJIGd1
ZXNzIHRoaXMgbGFzdCBwb2ludCB3b3VsZCBiZXR0ZXIgaGF2ZSBiZWVuIGEgcHJlcmVxIHBhdGNo
LAo+PiBidXQgYW55d2F5Lgo+IAo+IFNob3VsZCBJIGhhdmUgYSBwcmVyZXEgcGF0Y2ggZm9yIHRo
aXMgaW4gdGhlIG5leHQgdmVyc2lvbj8KCldlbGwsIEknbSBub3QgdGhlIG1haW50YWluZXIgb2Yg
dGhpcyBjb2RlLCBidXQgaWYgSSB3YXMsIEkgd291bGQKbXVjaCBwcmVmZXIgeW91IGRvaW5nIHNv
LgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
