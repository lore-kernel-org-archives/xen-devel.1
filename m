Return-Path: <SRS0=tVhX=W6=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 560E7C3A5A2
	for <xen-devel@archiver.kernel.org>; Tue,  3 Sep 2019 10:22:48 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3236C2087E
	for <xen-devel@archiver.kernel.org>; Tue,  3 Sep 2019 10:22:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3236C2087E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i55xJ-0002gA-EL; Tue, 03 Sep 2019 10:22:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=j28/=W6=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1i55xI-0002g2-7f
 for xen-devel@lists.xenproject.org; Tue, 03 Sep 2019 10:22:32 +0000
X-Inumbo-ID: bc20745c-ce34-11e9-8980-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bc20745c-ce34-11e9-8980-bc764e2007e4;
 Tue, 03 Sep 2019 10:22:30 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 940E3ADDD;
 Tue,  3 Sep 2019 10:22:29 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>
References: <20190828080028.18205-1-jgross@suse.com>
 <20190828080028.18205-2-jgross@suse.com>
 <393f2e3f-d15c-270b-9938-4ebcc251b482@suse.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <f5bd649c-1dc2-080b-df0c-ef06d59da35b@suse.com>
Date: Tue, 3 Sep 2019 12:22:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <393f2e3f-d15c-270b-9938-4ebcc251b482@suse.com>
Content-Language: de-DE
Subject: Re: [Xen-devel] [PATCH v3 1/4] xen: use common output function in
 debugtrace
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDMuMDkuMTkgMTI6MDAsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDI4LjA4LjIwMTkgMTA6
MDAsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+IFRvZGF5IGR1bXBpbmcgdGhlIGRlYnVndHJhY2Ug
YnVmZmVycyBpcyBkb25lIHZpYSBzZXJjb25fcHV0cygpLCB3aGlsZQo+PiBkaXJlY3QgcHJpbnRp
bmcgb2YgdHJhY2UgZW50cmllcyAoYWZ0ZXIgdG9nZ2xpbmcgb3V0cHV0IHRvIHRoZSBjb25zb2xl
KQo+PiBpcyB1c2luZyBzZXJpYWxfcHV0cygpLgo+Pgo+PiBVc2Ugc2VyY29uX3B1dHMoKSBpbiBi
b3RoIGNhc2VzLCBhcyB0aGUgZGlmZmVyZW5jZSBiZXR3ZWVuIGJvdGggaXMgbm90Cj4+IHJlYWxs
eSBtYWtpbmcgc2Vuc2UuCj4gCj4gTm8gbWF0dGVyIHRoYXQgSSBsaWtlIHRoaXMgY2hhbmdlLCBJ
J20gbm90IGNvbnZpbmNlZCBpdCdzIGNvcnJlY3Q6Cj4gVGhlcmUgYXJlIHR3byBkaWZmZXJlbmNl
cyBiZXR3ZWVuIHRoZSBmdW5jdGlvbnMsIG5laXRoZXIgb2Ygd2hpY2gKPiBJIGNvdWxkIHF1YWxp
ZnkgYXMgIm5vdCByZWFsbHkgbWFraW5nIHNlbnNlIjogV2h5IGlzIGl0IG9idmlvdXMKPiB0aGF0
IGl0IG1ha2VzIG5vIHNlbnNlIGZvciB0aGUgZGVidWd0cmFjZSBvdXRwdXQgdG8gYnlwYXNzIG9u
ZSBvcgo+IGJvdGggb2Ygc2VyaWFsX3N0ZWFsX2ZuKCkgYW5kIHB2X2NvbnNvbGVfcHV0cygpPyBJ
ZiB5b3UncmUKPiBjb252aW5jZWQgb2YgdGhpcywgcGxlYXNlIHByb3ZpZGUgdGhlICJ3aHkiLXMg
YmVoaW5kIHRoZSBzZW50ZW5jZQo+IGFib3ZlLgoKT2theSwgSSdsbCB1c2U6CgpVc2Ugc2VyY29u
X3B1dHMoKSBpbiBib3RoIGNhc2VzLCB0byBiZSBjb25zaXN0ZW50IGJldHdlZW4gZHVtcGluZyB0
aGUKYnVmZmVyIHdoZW4gc3dpdGNoaW5nIGRlYnVndHJhY2UgdG8gY29uc29sZSBvdXRwdXQgYW5k
IHdoZW4gcHJpbnRpbmcKYSBkZWJ1Z3RyYWNlIGVudHJ5IGRpcmVjdGx5IHRvIGNvbnNvbGUuCgoK
SnVlcmdlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
