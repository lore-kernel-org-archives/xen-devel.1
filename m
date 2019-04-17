Return-Path: <SRS0=ZpmR=ST=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A72AC282DA
	for <xen-devel@archiver.kernel.org>; Wed, 17 Apr 2019 11:17:03 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E6D6320821
	for <xen-devel@archiver.kernel.org>; Wed, 17 Apr 2019 11:17:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E6D6320821
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hGiYb-00032Q-Sf; Wed, 17 Apr 2019 11:16:49 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=f/qU=ST=citrix.com=prvs=0034167b4=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1hGiYa-00032K-I9
 for xen-devel@lists.xenproject.org; Wed, 17 Apr 2019 11:16:48 +0000
X-Inumbo-ID: 4997ace6-6102-11e9-92d7-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 4997ace6-6102-11e9-92d7-bc764e045a96;
 Wed, 17 Apr 2019 11:16:46 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,361,1549929600"; d="scan'208";a="83779522"
Date: Wed, 17 Apr 2019 12:16:35 +0100
From: Wei Liu <wei.liu2@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <20190417111635.GU30543@zion.uk.xensource.com>
References: <CABwOO=cOxxk7sbscGRzZ1LuiH8JJnCoBJ2d19ZmaSeu5DBi6iw@mail.gmail.com>
 <20190415092358.GM30543@zion.uk.xensource.com>
 <CABwOO=fSCMfqqay_ZD7FjvoLWjW8PUyyVze9d1s43v=KFDFsXA@mail.gmail.com>
 <20190417095657.GQ30543@zion.uk.xensource.com>
 <20190417104136.GR30543@zion.uk.xensource.com>
 <4487fafe-cee9-4c3b-3059-5073c4a9ce69@citrix.com>
 <20190417105729.GS30543@zion.uk.xensource.com>
 <cda91b28-50c4-308a-30d8-6cecceb973c6@citrix.com>
 <20190417110356.GT30543@zion.uk.xensource.com>
 <a3576f49-eebc-6684-d043-b9511895cf1a@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a3576f49-eebc-6684-d043-b9511895cf1a@citrix.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Kevin Buckley <kevin.buckley.ecs.vuw.ac.nz@gmail.com>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <JBeulich@suse.com>,
 xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190417111635.FgVxL0WaHzCkQ-lnqi5XqvXzEccrLzytrBVybruCPu0@z>

T24gV2VkLCBBcHIgMTcsIDIwMTkgYXQgMTI6MTU6MDRQTSArMDEwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBPbiAxNy8wNC8yMDE5IDEyOjAzLCBXZWkgTGl1IHdyb3RlOgo+ID4gT24gV2VkLCBB
cHIgMTcsIDIwMTkgYXQgMTE6NTg6NDlBTSArMDEwMCwgQW5kcmV3IENvb3BlciB3cm90ZToKPiA+
PiBPbiAxNy8wNC8yMDE5IDExOjU3LCBXZWkgTGl1IHdyb3RlOgo+ID4+PiBPbiBXZWQsIEFwciAx
NywgMjAxOSBhdCAxMTo0NDozNkFNICswMTAwLCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+ID4+Pj4g
T24gMTcvMDQvMjAxOSAxMTo0MSwgV2VpIExpdSB3cm90ZToKPiA+Pj4+PiBPbiBXZWQsIEFwciAx
NywgMjAxOSBhdCAxMDo1Njo1N0FNICswMTAwLCBXZWkgTGl1IHdyb3RlOgo+ID4+Pj4+Pj4gSGVy
ZSdzIHdoYXQgaSBkaWQgaGF2aW5nIHB1bGxlZCB0aGUgbWFzdGVyIGF0IGNvbW1pdCBjYjcwYTI2
Cj4gPj4+Pj4+Pgo+ID4+Pj4+Pj4gdGFyIHhmIC9wYXRoL3RvL3hlbi1jYjcwYTI2LnRhci5nego+
ID4+Pj4+Pj4KPiA+Pj4+Pj4+IGNkIHhlbi1tYXN0ZXIvCj4gPj4+Pj4+Pgo+ID4+Pj4+Pj4gUFlU
SE9OPS91c3IvYmluL3B5dGhvbjMgLi9jb25maWd1cmUgLS1wcmVmaXg9L3VzciAgIFwKPiA+Pj4+
Pj4+ICAgIC0tZGlzYWJsZS1zZWFiaW9zICAgXAo+ID4+Pj4+Pj4gICAgLS1kaXNhYmxlLXFlbXUt
dHJhZGl0aW9uYWwgIFwKPiA+Pj4+Pj4+ICAgIC0tZGlzYWJsZS1yb21iaW9zICAgICBcCj4gPj4+
Pj4+PiAgICAtLWRpc2FibGUtc3R1YmRvbSAyPiYxIHwgdGVlIC4uL2NvbmZpZy5sb2cKPiA+Pj4+
Pj4+Cj4gPj4+Pj4+PiBtYWtlIEVGSV9ESVI9L3Vzci9saWIvZWZpIHdvcmxkIDI+JjEgfCB0ZWUg
Li4vbWFrZV93b3JsZF8zLm91dAo+ID4+Pj4+Pj4KPiA+Pj4+Pj4+Cj4gPj4+Pj4+PiAuLi4KPiA+
Pj4+Pj4+IGdjYyAtV3AsLU1ELHRvb2xzL2tjb25maWcvLnpjb25mLnRhYi5vLmQgICAgLURfR05V
X1NPVVJDRQo+ID4+Pj4+Pj4gLURfREVGQVVMVF9TT1VSQ0UgLURDVVJTRVNfTE9DPSI8bmN1cnNl
cy5oPiIgLUROQ1VSU0VTX1dJREVDSEFSPTEKPiA+Pj4+Pj4+IC1ETE9DQUxFICAtSXRvb2xzL2tj
b25maWcgLWMgLW8gdG9vbHMva2NvbmZpZy96Y29uZi50YWIubwo+ID4+Pj4+Pj4gdG9vbHMva2Nv
bmZpZy96Y29uZi50YWIuYwo+ID4+Pj4+Pj4gZ2NjICAtbyB0b29scy9rY29uZmlnL2NvbmYgdG9v
bHMva2NvbmZpZy9jb25mLm8gdG9vbHMva2NvbmZpZy96Y29uZi50YWIubwo+ID4+Pj4+Pj4gdG9v
bHMva2NvbmZpZy9jb25mIC1zIC0tc2lsZW50b2xkY29uZmlnIEtjb25maWcKPiA+Pj4+Pj4+IG1h
a2VbM106IExlYXZpbmcgZGlyZWN0b3J5ICcvdXNyL3NyYy94ZW4veGVuLW1hc3Rlci94ZW4nCj4g
Pj4+Pj4+PiBtYWtlIC1mIFJ1bGVzLm1rIF9pbnN0YWxsCj4gPj4+Pj4+PiBtYWtlWzNdOiBFbnRl
cmluZyBkaXJlY3RvcnkgJy91c3Ivc3JjL3hlbi94ZW4tbWFzdGVyL3hlbicKPiA+Pj4+Pj4+IG1h
a2UgLUMgdG9vbHMKPiA+Pj4+Pj4+IG1ha2VbNF06IEVudGVyaW5nIGRpcmVjdG9yeSAnL3Vzci9z
cmMveGVuL3hlbi1tYXN0ZXIveGVuL3Rvb2xzJwo+ID4+Pj4+Pj4gbWFrZSBzeW1ib2xzCj4gPj4+
Pj4+PiBtYWtlWzVdOiBFbnRlcmluZyBkaXJlY3RvcnkgJy91c3Ivc3JjL3hlbi94ZW4tbWFzdGVy
L3hlbi90b29scycKPiA+Pj4+Pj4+IGdjYyAtV2FsbCAtV2Vycm9yIC1Xc3RyaWN0LXByb3RvdHlw
ZXMgLU8yIC1mb21pdC1mcmFtZS1wb2ludGVyCj4gPj4+Pj4+PiAtZm5vLXN0cmljdC1hbGlhc2lu
ZyAtV2RlY2xhcmF0aW9uLWFmdGVyLXN0YXRlbWVudCAtbyBzeW1ib2xzCj4gPj4+Pj4+PiBzeW1i
b2xzLmMKPiA+Pj4+Pj4+IG1ha2VbNV06IExlYXZpbmcgZGlyZWN0b3J5ICcvdXNyL3NyYy94ZW4v
eGVuLW1hc3Rlci94ZW4vdG9vbHMnCj4gPj4+Pj4+PiBtYWtlWzRdOiBMZWF2aW5nIGRpcmVjdG9y
eSAnL3Vzci9zcmMveGVuL3hlbi1tYXN0ZXIveGVuL3Rvb2xzJwo+ID4+Pj4+Pj4gbWFrZSAtZiAv
dXNyL3NyYy94ZW4veGVuLW1hc3Rlci94ZW4vUnVsZXMubWsgaW5jbHVkZS94ZW4vY29tcGlsZS5o
Cj4gPj4+Pj4+PiBtYWtlWzRdOiBFbnRlcmluZyBkaXJlY3RvcnkgJy91c3Ivc3JjL3hlbi94ZW4t
bWFzdGVyL3hlbicKPiA+Pj4+Pj4+ICBYZW4gNC4xMy11bnN0YWJsZQo+ID4+Pj4+Pj4gL2Jpbi9z
aDogcHl0aG9uOiBjb21tYW5kIG5vdCBmb3VuZAo+ID4+Pj4+Pj4gbWFrZVs0XTogKioqIFtNYWtl
ZmlsZToxNjk6IGluY2x1ZGUveGVuL2NvbXBpbGUuaF0gRXJyb3IgMTI3Cj4gPj4+Pj4+IEhlcmUu
IFRoZSBQWVRIT04gaW52b2NhdGlvbiBpcyBmcm9tIHRoZSBoeXBlcnZpc29yIGJ1aWxkLCBub3Qg
dGhlIHRvb2xzCj4gPj4+Pj4+IGJ1aWxkLgo+ID4+Pj4+Pgo+ID4+Pj4+PiBUaGFua3MgZm9yIHRo
ZSBsb2cuICBJIHdpbGwgaGF2ZSBhIGNsb3NlciBsb29rLgo+ID4+Pj4+Pgo+ID4+Pj4+Pj4gbWFr
ZVs0XTogTGVhdmluZyBkaXJlY3RvcnkgJy91c3Ivc3JjL3hlbi94ZW4tbWFzdGVyL3hlbicKPiA+
Pj4+Pj4+IG1ha2VbM106ICoqKiBbTWFrZWZpbGU6MTM3OiAvdXNyL3NyYy94ZW4veGVuLW1hc3Rl
ci94ZW4veGVuXSBFcnJvciAyCj4gPj4+Pj4+PiBtYWtlWzNdOiBMZWF2aW5nIGRpcmVjdG9yeSAn
L3Vzci9zcmMveGVuL3hlbi1tYXN0ZXIveGVuJwo+ID4+Pj4+Pj4gbWFrZVsyXTogKioqIFtNYWtl
ZmlsZTo0NTogaW5zdGFsbF0gRXJyb3IgMgo+ID4+Pj4+Pj4gbWFrZVsyXTogTGVhdmluZyBkaXJl
Y3RvcnkgJy91c3Ivc3JjL3hlbi94ZW4tbWFzdGVyL3hlbicKPiA+Pj4+Pj4+IG1ha2VbMV06ICoq
KiBbTWFrZWZpbGU6MTIzOiBpbnN0YWxsLXhlbl0gRXJyb3IgMgo+ID4+Pj4+Pj4gbWFrZVsxXTog
TGVhdmluZyBkaXJlY3RvcnkgJy91c3Ivc3JjL3hlbi94ZW4tbWFzdGVyJwo+ID4+Pj4+Pj4gbWFr
ZTogKioqIFtNYWtlZmlsZToxNjU6IHdvcmxkXSBFcnJvciAyCj4gPj4+Pj4+Pgo+ID4+Pj4+Pj4K
PiA+Pj4+Pj4+IE5vdGUgdGhlCj4gPj4+Pj4+Pgo+ID4+Pj4+Pj4gL2Jpbi9zaDogcHl0aG9uOiBj
b21tYW5kIG5vdCBmb3VuZAo+ID4+Pj4+Pj4KPiA+Pj4+PiBUaGUgaXNzdWUgaGVyZSBpcyBvbiBM
RlMgdGhlcmUgaXMgbm8gL3Vzci9iaW4vcHl0aG9uLiBTbyB0aGUgaHlwZXJ2aXNvcgo+ID4+Pj4+
IGJ1aWxkIGlzIGJyb2tlbiBiZWNhdXNlIHhlbi9pbmNsdWRlL2NvbXBpbGUuaCBpbnZva2VzCj4g
Pj4+Pj4KPiA+Pj4+PiAgQCQoUFlUSE9OKSB0b29scy9maWctdG8tb2N0LnB5IDwgLmJhbm5lciA+
PiAkQC5uZXcKPiA+Pj4+Pgo+ID4+Pj4+IFRoZXJlIGFyZSBvdGhlciBhcHBlYXJhbmNlcyBvZiBQ
WVRIT04gaW4gaHlwZXJ2aXNvciBidWlsZCwgd2hpY2ggYXJlCj4gPj4+Pj4gZXF1YWxseSBicm9r
ZW4uCj4gPj4+Pj4KPiA+Pj4+PiBXZSBoYWQgLyBoYXZlIGEgcG9saWN5IHRvIGF2b2lkIG1ha2lu
ZyBoeXBlcnZpc29yIGJ1aWxkIGRlcGVuZGVudCBvbgo+ID4+Pj4+IGNvbmZpZ3VyZS4gSSBoYXZl
IENDJ2VkIG1vcmUgcGVvcGxlIG9uIHRoZWlyIG9waW5pb25zLgo+ID4+Pj4gV2hlcmUgaGFzICQo
UFlUSE9OKSBnb3QgbG9zdD/CoCBJdCB3YXMgc3BlY2lmaWVkIGNvcnJlY3RseSB0byBiZWdpbiB3
aXRoLgo+ID4+PiBXaGVyZSBpcyBpdCBzcGVjaWZpZWQ/Cj4gPj4gT2ggLSBJIHNlZSBub3cuCj4g
Pj4KPiA+PiBJdCBpcyBzcGVjaWZpZWQgZm9yIC4vY29uZmlndXJlLCBidXQgbm90IGZvciBtYWtl
Lgo+ID4gUmlnaHQuCj4gPgo+ID4gSXQgd29ya3MgZm9yIHRvb2xzIGJlY2F1c2UgdG9vbHMgYnVp
bGQgaW5jbHVkZXMgY29uZmlnL1Rvb2xzLm1rIHdoaWNoCj4gPiBjb250YWlucyB0aGUgY29ycmVj
dCBweXRob24gcGF0aC4gVG9vbHMubWsgaXMgZ2VuZXJhdGVkIGJ5IGNvbmZpZ3VyZS4KPiA+ICAK
PiA+IE9idmlvdXNseSBoeXBlcnZpc29yIGJ1aWxkIHNob3VsZG4ndCBpbmNsdWRlIFRvb2xzLm1r
LiBGdXJ0aGVybW9yZSwgdGhlCj4gPiBwb2xpY3kgb2YgImh2IHNob3VsZG4ndCBkZXBlbmQgb24g
Y29uZmlndXJlIiBtYWtlcyB0aGlzIHJvdXRlIGEgbm8tZ28uCj4gPgo+ID4gRWl0aGVyIHdlIGNo
YW5nZSB0aGUgcG9saWN5LCBvciB3ZSBkb2N1bWVudCB0aGUgZGVmaWNpZW5jeSwgb3Igd2UgY29t
ZQo+ID4gdXAgd2l0aCBzb21lIGNsZXZlciB0cmljayB0byBwcm9iZS4KPiAKPiBHaXZlbiB0aGUg
c2hlYmFuZyBpbiBhbGwgb2Ygb3VyIHNjcmlwdHMsIHdvdWxkIGBlbnYgcHl0aG9uYCBiZQo+IHN1
ZmZpY2llbnRseSBjbGV2ZXIgdHJpY2tlcnksIG9yIGlzIHRoYXQgYSBjYW4gb2Ygd29ybXMgd2Un
ZCBwcmVmZXIgbm90Cj4gdG8gb3Blbj8KCkkgYWxyZWFkeSB0cmllZCBlbnYgcHl0aG9uIC0tIGl0
IGRpZG4ndCB3b3JrLiBJIHRoaW5rIGl0IHNlYXJjaGVzIFBBVEhTCmp1c3QgbGlrZSBhIHNoZWxs
IHdvdWxkLgoKV2VpLgoKPiAKPiB+QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
