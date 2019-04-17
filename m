Return-Path: <SRS0=ZpmR=ST=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BF24C10F12
	for <xen-devel@archiver.kernel.org>; Wed, 17 Apr 2019 11:01:52 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D6DF22064A
	for <xen-devel@archiver.kernel.org>; Wed, 17 Apr 2019 11:01:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D6DF22064A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hGiJp-0001uq-TR; Wed, 17 Apr 2019 11:01:33 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=wIUc=ST=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hGiJo-0001uX-L2
 for xen-devel@lists.xenproject.org; Wed, 17 Apr 2019 11:01:32 +0000
X-Inumbo-ID: 275c9f05-6100-11e9-92d7-bc764e045a96
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 275c9f05-6100-11e9-92d7-bc764e045a96;
 Wed, 17 Apr 2019 11:01:30 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id A0609AC66;
 Wed, 17 Apr 2019 11:01:29 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>
References: <CABwOO=dhCrnZpRNpLr7rDrNdSh9GCH=fqq_50+YScWT4BE-xjQ@mail.gmail.com>
 <20190411102843.GE30543@zion.uk.xensource.com>
 <CABwOO=cOxxk7sbscGRzZ1LuiH8JJnCoBJ2d19ZmaSeu5DBi6iw@mail.gmail.com>
 <20190415092358.GM30543@zion.uk.xensource.com>
 <CABwOO=fSCMfqqay_ZD7FjvoLWjW8PUyyVze9d1s43v=KFDFsXA@mail.gmail.com>
 <20190417095657.GQ30543@zion.uk.xensource.com>
 <20190417104136.GR30543@zion.uk.xensource.com>
 <4487fafe-cee9-4c3b-3059-5073c4a9ce69@citrix.com>
 <20190417105729.GS30543@zion.uk.xensource.com>
 <cda91b28-50c4-308a-30d8-6cecceb973c6@citrix.com>
From: Juergen Gross <jgross@suse.com>
Openpgp: preference=signencrypt
Autocrypt: addr=jgross@suse.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <f1944048-9ad2-aaac-cbed-52faf1b1f16f@suse.com>
Date: Wed, 17 Apr 2019 13:01:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <cda91b28-50c4-308a-30d8-6cecceb973c6@citrix.com>
Content-Language: de-DE
Subject: Re: [Xen-devel] Hypervisor build can't work without `python` (Was:
 Re: Xen commit 9b0bc91b3 possibly removed too much info from README)
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
Cc: xen-devel@lists.xenproject.org, Julien Grall <julien.grall@arm.com>,
 Kevin Buckley <kevin.buckley.ecs.vuw.ac.nz@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Jan Beulich <JBeulich@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190417110128.tmcVthugPfs0CB1vNhRGYCTNfm_1JKH8Q4r4IJrB89o@z>

T24gMTcvMDQvMjAxOSAxMjo1OCwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAxNy8wNC8yMDE5
IDExOjU3LCBXZWkgTGl1IHdyb3RlOgo+PiBPbiBXZWQsIEFwciAxNywgMjAxOSBhdCAxMTo0NDoz
NkFNICswMTAwLCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+Pj4gT24gMTcvMDQvMjAxOSAxMTo0MSwg
V2VpIExpdSB3cm90ZToKPj4+PiBPbiBXZWQsIEFwciAxNywgMjAxOSBhdCAxMDo1Njo1N0FNICsw
MTAwLCBXZWkgTGl1IHdyb3RlOgo+Pj4+Pj4gSGVyZSdzIHdoYXQgaSBkaWQgaGF2aW5nIHB1bGxl
ZCB0aGUgbWFzdGVyIGF0IGNvbW1pdCBjYjcwYTI2Cj4+Pj4+Pgo+Pj4+Pj4gdGFyIHhmIC9wYXRo
L3RvL3hlbi1jYjcwYTI2LnRhci5nego+Pj4+Pj4KPj4+Pj4+IGNkIHhlbi1tYXN0ZXIvCj4+Pj4+
Pgo+Pj4+Pj4gUFlUSE9OPS91c3IvYmluL3B5dGhvbjMgLi9jb25maWd1cmUgLS1wcmVmaXg9L3Vz
ciAgIFwKPj4+Pj4+ICAgIC0tZGlzYWJsZS1zZWFiaW9zICAgXAo+Pj4+Pj4gICAgLS1kaXNhYmxl
LXFlbXUtdHJhZGl0aW9uYWwgIFwKPj4+Pj4+ICAgIC0tZGlzYWJsZS1yb21iaW9zICAgICBcCj4+
Pj4+PiAgICAtLWRpc2FibGUtc3R1YmRvbSAyPiYxIHwgdGVlIC4uL2NvbmZpZy5sb2cKPj4+Pj4+
Cj4+Pj4+PiBtYWtlIEVGSV9ESVI9L3Vzci9saWIvZWZpIHdvcmxkIDI+JjEgfCB0ZWUgLi4vbWFr
ZV93b3JsZF8zLm91dAo+Pj4+Pj4KPj4+Pj4+Cj4+Pj4+PiAuLi4KPj4+Pj4+IGdjYyAtV3AsLU1E
LHRvb2xzL2tjb25maWcvLnpjb25mLnRhYi5vLmQgICAgLURfR05VX1NPVVJDRQo+Pj4+Pj4gLURf
REVGQVVMVF9TT1VSQ0UgLURDVVJTRVNfTE9DPSI8bmN1cnNlcy5oPiIgLUROQ1VSU0VTX1dJREVD
SEFSPTEKPj4+Pj4+IC1ETE9DQUxFICAtSXRvb2xzL2tjb25maWcgLWMgLW8gdG9vbHMva2NvbmZp
Zy96Y29uZi50YWIubwo+Pj4+Pj4gdG9vbHMva2NvbmZpZy96Y29uZi50YWIuYwo+Pj4+Pj4gZ2Nj
ICAtbyB0b29scy9rY29uZmlnL2NvbmYgdG9vbHMva2NvbmZpZy9jb25mLm8gdG9vbHMva2NvbmZp
Zy96Y29uZi50YWIubwo+Pj4+Pj4gdG9vbHMva2NvbmZpZy9jb25mIC1zIC0tc2lsZW50b2xkY29u
ZmlnIEtjb25maWcKPj4+Pj4+IG1ha2VbM106IExlYXZpbmcgZGlyZWN0b3J5ICcvdXNyL3NyYy94
ZW4veGVuLW1hc3Rlci94ZW4nCj4+Pj4+PiBtYWtlIC1mIFJ1bGVzLm1rIF9pbnN0YWxsCj4+Pj4+
PiBtYWtlWzNdOiBFbnRlcmluZyBkaXJlY3RvcnkgJy91c3Ivc3JjL3hlbi94ZW4tbWFzdGVyL3hl
bicKPj4+Pj4+IG1ha2UgLUMgdG9vbHMKPj4+Pj4+IG1ha2VbNF06IEVudGVyaW5nIGRpcmVjdG9y
eSAnL3Vzci9zcmMveGVuL3hlbi1tYXN0ZXIveGVuL3Rvb2xzJwo+Pj4+Pj4gbWFrZSBzeW1ib2xz
Cj4+Pj4+PiBtYWtlWzVdOiBFbnRlcmluZyBkaXJlY3RvcnkgJy91c3Ivc3JjL3hlbi94ZW4tbWFz
dGVyL3hlbi90b29scycKPj4+Pj4+IGdjYyAtV2FsbCAtV2Vycm9yIC1Xc3RyaWN0LXByb3RvdHlw
ZXMgLU8yIC1mb21pdC1mcmFtZS1wb2ludGVyCj4+Pj4+PiAtZm5vLXN0cmljdC1hbGlhc2luZyAt
V2RlY2xhcmF0aW9uLWFmdGVyLXN0YXRlbWVudCAtbyBzeW1ib2xzCj4+Pj4+PiBzeW1ib2xzLmMK
Pj4+Pj4+IG1ha2VbNV06IExlYXZpbmcgZGlyZWN0b3J5ICcvdXNyL3NyYy94ZW4veGVuLW1hc3Rl
ci94ZW4vdG9vbHMnCj4+Pj4+PiBtYWtlWzRdOiBMZWF2aW5nIGRpcmVjdG9yeSAnL3Vzci9zcmMv
eGVuL3hlbi1tYXN0ZXIveGVuL3Rvb2xzJwo+Pj4+Pj4gbWFrZSAtZiAvdXNyL3NyYy94ZW4veGVu
LW1hc3Rlci94ZW4vUnVsZXMubWsgaW5jbHVkZS94ZW4vY29tcGlsZS5oCj4+Pj4+PiBtYWtlWzRd
OiBFbnRlcmluZyBkaXJlY3RvcnkgJy91c3Ivc3JjL3hlbi94ZW4tbWFzdGVyL3hlbicKPj4+Pj4+
ICBYZW4gNC4xMy11bnN0YWJsZQo+Pj4+Pj4gL2Jpbi9zaDogcHl0aG9uOiBjb21tYW5kIG5vdCBm
b3VuZAo+Pj4+Pj4gbWFrZVs0XTogKioqIFtNYWtlZmlsZToxNjk6IGluY2x1ZGUveGVuL2NvbXBp
bGUuaF0gRXJyb3IgMTI3Cj4+Pj4+IEhlcmUuIFRoZSBQWVRIT04gaW52b2NhdGlvbiBpcyBmcm9t
IHRoZSBoeXBlcnZpc29yIGJ1aWxkLCBub3QgdGhlIHRvb2xzCj4+Pj4+IGJ1aWxkLgo+Pj4+Pgo+
Pj4+PiBUaGFua3MgZm9yIHRoZSBsb2cuICBJIHdpbGwgaGF2ZSBhIGNsb3NlciBsb29rLgo+Pj4+
Pgo+Pj4+Pj4gbWFrZVs0XTogTGVhdmluZyBkaXJlY3RvcnkgJy91c3Ivc3JjL3hlbi94ZW4tbWFz
dGVyL3hlbicKPj4+Pj4+IG1ha2VbM106ICoqKiBbTWFrZWZpbGU6MTM3OiAvdXNyL3NyYy94ZW4v
eGVuLW1hc3Rlci94ZW4veGVuXSBFcnJvciAyCj4+Pj4+PiBtYWtlWzNdOiBMZWF2aW5nIGRpcmVj
dG9yeSAnL3Vzci9zcmMveGVuL3hlbi1tYXN0ZXIveGVuJwo+Pj4+Pj4gbWFrZVsyXTogKioqIFtN
YWtlZmlsZTo0NTogaW5zdGFsbF0gRXJyb3IgMgo+Pj4+Pj4gbWFrZVsyXTogTGVhdmluZyBkaXJl
Y3RvcnkgJy91c3Ivc3JjL3hlbi94ZW4tbWFzdGVyL3hlbicKPj4+Pj4+IG1ha2VbMV06ICoqKiBb
TWFrZWZpbGU6MTIzOiBpbnN0YWxsLXhlbl0gRXJyb3IgMgo+Pj4+Pj4gbWFrZVsxXTogTGVhdmlu
ZyBkaXJlY3RvcnkgJy91c3Ivc3JjL3hlbi94ZW4tbWFzdGVyJwo+Pj4+Pj4gbWFrZTogKioqIFtN
YWtlZmlsZToxNjU6IHdvcmxkXSBFcnJvciAyCj4+Pj4+Pgo+Pj4+Pj4KPj4+Pj4+IE5vdGUgdGhl
Cj4+Pj4+Pgo+Pj4+Pj4gL2Jpbi9zaDogcHl0aG9uOiBjb21tYW5kIG5vdCBmb3VuZAo+Pj4+Pj4K
Pj4+PiBUaGUgaXNzdWUgaGVyZSBpcyBvbiBMRlMgdGhlcmUgaXMgbm8gL3Vzci9iaW4vcHl0aG9u
LiBTbyB0aGUgaHlwZXJ2aXNvcgo+Pj4+IGJ1aWxkIGlzIGJyb2tlbiBiZWNhdXNlIHhlbi9pbmNs
dWRlL2NvbXBpbGUuaCBpbnZva2VzCj4+Pj4KPj4+PiAgQCQoUFlUSE9OKSB0b29scy9maWctdG8t
b2N0LnB5IDwgLmJhbm5lciA+PiAkQC5uZXcKPj4+Pgo+Pj4+IFRoZXJlIGFyZSBvdGhlciBhcHBl
YXJhbmNlcyBvZiBQWVRIT04gaW4gaHlwZXJ2aXNvciBidWlsZCwgd2hpY2ggYXJlCj4+Pj4gZXF1
YWxseSBicm9rZW4uCj4+Pj4KPj4+PiBXZSBoYWQgLyBoYXZlIGEgcG9saWN5IHRvIGF2b2lkIG1h
a2luZyBoeXBlcnZpc29yIGJ1aWxkIGRlcGVuZGVudCBvbgo+Pj4+IGNvbmZpZ3VyZS4gSSBoYXZl
IENDJ2VkIG1vcmUgcGVvcGxlIG9uIHRoZWlyIG9waW5pb25zLgo+Pj4gV2hlcmUgaGFzICQoUFlU
SE9OKSBnb3QgbG9zdD/CoCBJdCB3YXMgc3BlY2lmaWVkIGNvcnJlY3RseSB0byBiZWdpbiB3aXRo
Lgo+PiBXaGVyZSBpcyBpdCBzcGVjaWZpZWQ/Cj4gCj4gT2ggLSBJIHNlZSBub3cuCj4gCj4gSXQg
aXMgc3BlY2lmaWVkIGZvciAuL2NvbmZpZ3VyZSwgYnV0IG5vdCBmb3IgbWFrZS4KPiAKPiBIb3cg
aGFzIHRoaXMgZXZlciB3b3JrZWQ/CgpDb25maWcubWsgY29udGFpbnM6CgpQWVRIT04gICAgICA/
PSBweXRob24KUFlUSE9OX1BSRUZJWF9BUkcgPz0gLS1wcmVmaXg9IiQocHJlZml4KSIKCgpKdWVy
Z2VuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
