Return-Path: <SRS0=ZpmR=ST=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 070F4C10F12
	for <xen-devel@archiver.kernel.org>; Wed, 17 Apr 2019 10:45:00 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CFB2320821
	for <xen-devel@archiver.kernel.org>; Wed, 17 Apr 2019 10:44:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CFB2320821
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hGi3a-0008Pm-Jy; Wed, 17 Apr 2019 10:44:46 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=cP2p=ST=citrix.com=prvs=003bda41c=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hGi3Z-0008Pg-DT
 for xen-devel@lists.xenproject.org; Wed, 17 Apr 2019 10:44:45 +0000
X-Inumbo-ID: ce182b34-60fd-11e9-92d7-bc764e045a96
Received: from SMTP.EU.CITRIX.COM (unknown [185.25.65.24])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id ce182b34-60fd-11e9-92d7-bc764e045a96;
 Wed, 17 Apr 2019 10:44:43 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,361,1549929600"; d="scan'208";a="88952728"
To: Wei Liu <wei.liu2@citrix.com>, Kevin Buckley
 <kevin.buckley.ecs.vuw.ac.nz@gmail.com>
References: <CABwOO=dhCrnZpRNpLr7rDrNdSh9GCH=fqq_50+YScWT4BE-xjQ@mail.gmail.com>
 <20190411102843.GE30543@zion.uk.xensource.com>
 <CABwOO=cOxxk7sbscGRzZ1LuiH8JJnCoBJ2d19ZmaSeu5DBi6iw@mail.gmail.com>
 <20190415092358.GM30543@zion.uk.xensource.com>
 <CABwOO=fSCMfqqay_ZD7FjvoLWjW8PUyyVze9d1s43v=KFDFsXA@mail.gmail.com>
 <20190417095657.GQ30543@zion.uk.xensource.com>
 <20190417104136.GR30543@zion.uk.xensource.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <4487fafe-cee9-4c3b-3059-5073c4a9ce69@citrix.com>
Date: Wed, 17 Apr 2019 11:44:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190417104136.GR30543@zion.uk.xensource.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
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
 Stefano Stabellini <sstabellini@kernel.org>, Jan Beulich <JBeulich@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190417104436.FlA1UYLidNdDxUKohLOSRXpdh71GZeGfW23r9c1dAnM@z>

T24gMTcvMDQvMjAxOSAxMTo0MSwgV2VpIExpdSB3cm90ZToKPiBPbiBXZWQsIEFwciAxNywgMjAx
OSBhdCAxMDo1Njo1N0FNICswMTAwLCBXZWkgTGl1IHdyb3RlOgo+Pj4gSGVyZSdzIHdoYXQgaSBk
aWQgaGF2aW5nIHB1bGxlZCB0aGUgbWFzdGVyIGF0IGNvbW1pdCBjYjcwYTI2Cj4+Pgo+Pj4gdGFy
IHhmIC9wYXRoL3RvL3hlbi1jYjcwYTI2LnRhci5nego+Pj4KPj4+IGNkIHhlbi1tYXN0ZXIvCj4+
Pgo+Pj4gUFlUSE9OPS91c3IvYmluL3B5dGhvbjMgLi9jb25maWd1cmUgLS1wcmVmaXg9L3VzciAg
IFwKPj4+ICAgIC0tZGlzYWJsZS1zZWFiaW9zICAgXAo+Pj4gICAgLS1kaXNhYmxlLXFlbXUtdHJh
ZGl0aW9uYWwgIFwKPj4+ICAgIC0tZGlzYWJsZS1yb21iaW9zICAgICBcCj4+PiAgICAtLWRpc2Fi
bGUtc3R1YmRvbSAyPiYxIHwgdGVlIC4uL2NvbmZpZy5sb2cKPj4+Cj4+PiBtYWtlIEVGSV9ESVI9
L3Vzci9saWIvZWZpIHdvcmxkIDI+JjEgfCB0ZWUgLi4vbWFrZV93b3JsZF8zLm91dAo+Pj4KPj4+
Cj4+PiAuLi4KPj4+IGdjYyAtV3AsLU1ELHRvb2xzL2tjb25maWcvLnpjb25mLnRhYi5vLmQgICAg
LURfR05VX1NPVVJDRQo+Pj4gLURfREVGQVVMVF9TT1VSQ0UgLURDVVJTRVNfTE9DPSI8bmN1cnNl
cy5oPiIgLUROQ1VSU0VTX1dJREVDSEFSPTEKPj4+IC1ETE9DQUxFICAtSXRvb2xzL2tjb25maWcg
LWMgLW8gdG9vbHMva2NvbmZpZy96Y29uZi50YWIubwo+Pj4gdG9vbHMva2NvbmZpZy96Y29uZi50
YWIuYwo+Pj4gZ2NjICAtbyB0b29scy9rY29uZmlnL2NvbmYgdG9vbHMva2NvbmZpZy9jb25mLm8g
dG9vbHMva2NvbmZpZy96Y29uZi50YWIubwo+Pj4gdG9vbHMva2NvbmZpZy9jb25mIC1zIC0tc2ls
ZW50b2xkY29uZmlnIEtjb25maWcKPj4+IG1ha2VbM106IExlYXZpbmcgZGlyZWN0b3J5ICcvdXNy
L3NyYy94ZW4veGVuLW1hc3Rlci94ZW4nCj4+PiBtYWtlIC1mIFJ1bGVzLm1rIF9pbnN0YWxsCj4+
PiBtYWtlWzNdOiBFbnRlcmluZyBkaXJlY3RvcnkgJy91c3Ivc3JjL3hlbi94ZW4tbWFzdGVyL3hl
bicKPj4+IG1ha2UgLUMgdG9vbHMKPj4+IG1ha2VbNF06IEVudGVyaW5nIGRpcmVjdG9yeSAnL3Vz
ci9zcmMveGVuL3hlbi1tYXN0ZXIveGVuL3Rvb2xzJwo+Pj4gbWFrZSBzeW1ib2xzCj4+PiBtYWtl
WzVdOiBFbnRlcmluZyBkaXJlY3RvcnkgJy91c3Ivc3JjL3hlbi94ZW4tbWFzdGVyL3hlbi90b29s
cycKPj4+IGdjYyAtV2FsbCAtV2Vycm9yIC1Xc3RyaWN0LXByb3RvdHlwZXMgLU8yIC1mb21pdC1m
cmFtZS1wb2ludGVyCj4+PiAtZm5vLXN0cmljdC1hbGlhc2luZyAtV2RlY2xhcmF0aW9uLWFmdGVy
LXN0YXRlbWVudCAtbyBzeW1ib2xzCj4+PiBzeW1ib2xzLmMKPj4+IG1ha2VbNV06IExlYXZpbmcg
ZGlyZWN0b3J5ICcvdXNyL3NyYy94ZW4veGVuLW1hc3Rlci94ZW4vdG9vbHMnCj4+PiBtYWtlWzRd
OiBMZWF2aW5nIGRpcmVjdG9yeSAnL3Vzci9zcmMveGVuL3hlbi1tYXN0ZXIveGVuL3Rvb2xzJwo+
Pj4gbWFrZSAtZiAvdXNyL3NyYy94ZW4veGVuLW1hc3Rlci94ZW4vUnVsZXMubWsgaW5jbHVkZS94
ZW4vY29tcGlsZS5oCj4+PiBtYWtlWzRdOiBFbnRlcmluZyBkaXJlY3RvcnkgJy91c3Ivc3JjL3hl
bi94ZW4tbWFzdGVyL3hlbicKPj4+ICBYZW4gNC4xMy11bnN0YWJsZQo+Pj4gL2Jpbi9zaDogcHl0
aG9uOiBjb21tYW5kIG5vdCBmb3VuZAo+Pj4gbWFrZVs0XTogKioqIFtNYWtlZmlsZToxNjk6IGlu
Y2x1ZGUveGVuL2NvbXBpbGUuaF0gRXJyb3IgMTI3Cj4+IEhlcmUuIFRoZSBQWVRIT04gaW52b2Nh
dGlvbiBpcyBmcm9tIHRoZSBoeXBlcnZpc29yIGJ1aWxkLCBub3QgdGhlIHRvb2xzCj4+IGJ1aWxk
Lgo+Pgo+PiBUaGFua3MgZm9yIHRoZSBsb2cuICBJIHdpbGwgaGF2ZSBhIGNsb3NlciBsb29rLgo+
Pgo+Pj4gbWFrZVs0XTogTGVhdmluZyBkaXJlY3RvcnkgJy91c3Ivc3JjL3hlbi94ZW4tbWFzdGVy
L3hlbicKPj4+IG1ha2VbM106ICoqKiBbTWFrZWZpbGU6MTM3OiAvdXNyL3NyYy94ZW4veGVuLW1h
c3Rlci94ZW4veGVuXSBFcnJvciAyCj4+PiBtYWtlWzNdOiBMZWF2aW5nIGRpcmVjdG9yeSAnL3Vz
ci9zcmMveGVuL3hlbi1tYXN0ZXIveGVuJwo+Pj4gbWFrZVsyXTogKioqIFtNYWtlZmlsZTo0NTog
aW5zdGFsbF0gRXJyb3IgMgo+Pj4gbWFrZVsyXTogTGVhdmluZyBkaXJlY3RvcnkgJy91c3Ivc3Jj
L3hlbi94ZW4tbWFzdGVyL3hlbicKPj4+IG1ha2VbMV06ICoqKiBbTWFrZWZpbGU6MTIzOiBpbnN0
YWxsLXhlbl0gRXJyb3IgMgo+Pj4gbWFrZVsxXTogTGVhdmluZyBkaXJlY3RvcnkgJy91c3Ivc3Jj
L3hlbi94ZW4tbWFzdGVyJwo+Pj4gbWFrZTogKioqIFtNYWtlZmlsZToxNjU6IHdvcmxkXSBFcnJv
ciAyCj4+Pgo+Pj4KPj4+IE5vdGUgdGhlCj4+Pgo+Pj4gL2Jpbi9zaDogcHl0aG9uOiBjb21tYW5k
IG5vdCBmb3VuZAo+Pj4KPiBUaGUgaXNzdWUgaGVyZSBpcyBvbiBMRlMgdGhlcmUgaXMgbm8gL3Vz
ci9iaW4vcHl0aG9uLiBTbyB0aGUgaHlwZXJ2aXNvcgo+IGJ1aWxkIGlzIGJyb2tlbiBiZWNhdXNl
IHhlbi9pbmNsdWRlL2NvbXBpbGUuaCBpbnZva2VzCj4KPiAgQCQoUFlUSE9OKSB0b29scy9maWct
dG8tb2N0LnB5IDwgLmJhbm5lciA+PiAkQC5uZXcKPgo+IFRoZXJlIGFyZSBvdGhlciBhcHBlYXJh
bmNlcyBvZiBQWVRIT04gaW4gaHlwZXJ2aXNvciBidWlsZCwgd2hpY2ggYXJlCj4gZXF1YWxseSBi
cm9rZW4uCj4KPiBXZSBoYWQgLyBoYXZlIGEgcG9saWN5IHRvIGF2b2lkIG1ha2luZyBoeXBlcnZp
c29yIGJ1aWxkIGRlcGVuZGVudCBvbgo+IGNvbmZpZ3VyZS4gSSBoYXZlIENDJ2VkIG1vcmUgcGVv
cGxlIG9uIHRoZWlyIG9waW5pb25zLgoKV2hlcmUgaGFzICQoUFlUSE9OKSBnb3QgbG9zdD/CoCBJ
dCB3YXMgc3BlY2lmaWVkIGNvcnJlY3RseSB0byBiZWdpbiB3aXRoLgoKfkFuZHJldwoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
