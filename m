Return-Path: <SRS0=ZpmR=ST=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_MUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57F8FC282DA
	for <xen-devel@archiver.kernel.org>; Wed, 17 Apr 2019 14:52:40 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 343EB2173C
	for <xen-devel@archiver.kernel.org>; Wed, 17 Apr 2019 14:52:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 343EB2173C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hGlv1-0004Gb-01; Wed, 17 Apr 2019 14:52:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=f/qU=ST=citrix.com=prvs=0034167b4=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1hGluz-0004GW-NB
 for xen-devel@lists.xenproject.org; Wed, 17 Apr 2019 14:52:09 +0000
X-Inumbo-ID: 5c2befb2-6120-11e9-a198-0fca86ee1b85
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5c2befb2-6120-11e9-a198-0fca86ee1b85;
 Wed, 17 Apr 2019 14:52:04 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,362,1549929600"; d="scan'208";a="83802329"
Date: Wed, 17 Apr 2019 15:51:36 +0100
From: Wei Liu <wei.liu2@citrix.com>
To: Juergen Gross <jgross@suse.com>
Message-ID: <20190417145136.GZ30543@zion.uk.xensource.com>
References: <20190417105729.GS30543@zion.uk.xensource.com>
 <cda91b28-50c4-308a-30d8-6cecceb973c6@citrix.com>
 <20190417110356.GT30543@zion.uk.xensource.com>
 <a3576f49-eebc-6684-d043-b9511895cf1a@citrix.com>
 <20190417111635.GU30543@zion.uk.xensource.com>
 <7fe14ebe-987a-8b95-1d77-d6d40a473fa3@citrix.com>
 <20190417112645.GV30543@zion.uk.xensource.com>
 <1ff06c9a-8e81-7c00-9dab-26f3d4173714@suse.com>
 <3d698d86-c406-df10-ccb9-17d38988b0a8@citrix.com>
 <606a37f6-2158-14bf-8f49-79ea249b8f62@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <606a37f6-2158-14bf-8f49-79ea249b8f62@suse.com>
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
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Kevin Buckley <kevin.buckley.ecs.vuw.ac.nz@gmail.com>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <JBeulich@suse.com>,
 xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190417145136.__g5XfXFoVQNYe6uM9fZVwAJb0MiJa97TdLKbHr9-aE@z>

T24gV2VkLCBBcHIgMTcsIDIwMTkgYXQgMDI6NDQ6MjFQTSArMDIwMCwgSnVlcmdlbiBHcm9zcyB3
cm90ZToKPiBPbiAxNy8wNC8yMDE5IDEzOjUzLCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+ID4gT24g
MTcvMDQvMjAxOSAxMjo0MywgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiA+PiBPbiAxNy8wNC8yMDE5
IDEzOjI2LCBXZWkgTGl1IHdyb3RlOgo+ID4+PiBPbiBXZWQsIEFwciAxNywgMjAxOSBhdCAxMjoy
MzoyOVBNICswMTAwLCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+ID4+Pj4gT24gMTcvMDQvMjAxOSAx
MjoxNiwgV2VpIExpdSB3cm90ZToKPiA+Pj4+PiBPbiBXZWQsIEFwciAxNywgMjAxOSBhdCAxMjox
NTowNFBNICswMTAwLCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+ID4+Pj4+PiBPbiAxNy8wNC8yMDE5
IDEyOjAzLCBXZWkgTGl1IHdyb3RlOgo+ID4+Pj4+Pj4gT24gV2VkLCBBcHIgMTcsIDIwMTkgYXQg
MTE6NTg6NDlBTSArMDEwMCwgQW5kcmV3IENvb3BlciB3cm90ZToKPiA+Pj4+Pj4+PiBPbiAxNy8w
NC8yMDE5IDExOjU3LCBXZWkgTGl1IHdyb3RlOgo+ID4+Pj4+Pj4+PiBPbiBXZWQsIEFwciAxNywg
MjAxOSBhdCAxMTo0NDozNkFNICswMTAwLCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+ID4+Pj4+Pj4+
Pj4gT24gMTcvMDQvMjAxOSAxMTo0MSwgV2VpIExpdSB3cm90ZToKPiA+Pj4+Pj4+Pj4+PiBPbiBX
ZWQsIEFwciAxNywgMjAxOSBhdCAxMDo1Njo1N0FNICswMTAwLCBXZWkgTGl1IHdyb3RlOgo+ID4+
Pj4+Pj4+Pj4+Pj4gSGVyZSdzIHdoYXQgaSBkaWQgaGF2aW5nIHB1bGxlZCB0aGUgbWFzdGVyIGF0
IGNvbW1pdCBjYjcwYTI2Cj4gPj4+Pj4+Pj4+Pj4+Pgo+ID4+Pj4+Pj4+Pj4+Pj4gdGFyIHhmIC9w
YXRoL3RvL3hlbi1jYjcwYTI2LnRhci5nego+ID4+Pj4+Pj4+Pj4+Pj4KPiA+Pj4+Pj4+Pj4+Pj4+
IGNkIHhlbi1tYXN0ZXIvCj4gPj4+Pj4+Pj4+Pj4+Pgo+ID4+Pj4+Pj4+Pj4+Pj4gUFlUSE9OPS91
c3IvYmluL3B5dGhvbjMgLi9jb25maWd1cmUgLS1wcmVmaXg9L3VzciAgIFwKPiA+Pj4+Pj4+Pj4+
Pj4+ICAgIC0tZGlzYWJsZS1zZWFiaW9zICAgXAo+ID4+Pj4+Pj4+Pj4+Pj4gICAgLS1kaXNhYmxl
LXFlbXUtdHJhZGl0aW9uYWwgIFwKPiA+Pj4+Pj4+Pj4+Pj4+ICAgIC0tZGlzYWJsZS1yb21iaW9z
ICAgICBcCj4gPj4+Pj4+Pj4+Pj4+PiAgICAtLWRpc2FibGUtc3R1YmRvbSAyPiYxIHwgdGVlIC4u
L2NvbmZpZy5sb2cKPiA+Pj4+Pj4+Pj4+Pj4+Cj4gPj4+Pj4+Pj4+Pj4+PiBtYWtlIEVGSV9ESVI9
L3Vzci9saWIvZWZpIHdvcmxkIDI+JjEgfCB0ZWUgLi4vbWFrZV93b3JsZF8zLm91dAo+ID4+Pj4+
Pj4+Pj4+Pj4KPiA+Pj4+Pj4+Pj4+Pj4+Cj4gPj4+Pj4+Pj4+Pj4+PiAuLi4KPiA+Pj4+Pj4+Pj4+
Pj4+IGdjYyAtV3AsLU1ELHRvb2xzL2tjb25maWcvLnpjb25mLnRhYi5vLmQgICAgLURfR05VX1NP
VVJDRQo+ID4+Pj4+Pj4+Pj4+Pj4gLURfREVGQVVMVF9TT1VSQ0UgLURDVVJTRVNfTE9DPSI8bmN1
cnNlcy5oPiIgLUROQ1VSU0VTX1dJREVDSEFSPTEKPiA+Pj4+Pj4+Pj4+Pj4+IC1ETE9DQUxFICAt
SXRvb2xzL2tjb25maWcgLWMgLW8gdG9vbHMva2NvbmZpZy96Y29uZi50YWIubwo+ID4+Pj4+Pj4+
Pj4+Pj4gdG9vbHMva2NvbmZpZy96Y29uZi50YWIuYwo+ID4+Pj4+Pj4+Pj4+Pj4gZ2NjICAtbyB0
b29scy9rY29uZmlnL2NvbmYgdG9vbHMva2NvbmZpZy9jb25mLm8gdG9vbHMva2NvbmZpZy96Y29u
Zi50YWIubwo+ID4+Pj4+Pj4+Pj4+Pj4gdG9vbHMva2NvbmZpZy9jb25mIC1zIC0tc2lsZW50b2xk
Y29uZmlnIEtjb25maWcKPiA+Pj4+Pj4+Pj4+Pj4+IG1ha2VbM106IExlYXZpbmcgZGlyZWN0b3J5
ICcvdXNyL3NyYy94ZW4veGVuLW1hc3Rlci94ZW4nCj4gPj4+Pj4+Pj4+Pj4+PiBtYWtlIC1mIFJ1
bGVzLm1rIF9pbnN0YWxsCj4gPj4+Pj4+Pj4+Pj4+PiBtYWtlWzNdOiBFbnRlcmluZyBkaXJlY3Rv
cnkgJy91c3Ivc3JjL3hlbi94ZW4tbWFzdGVyL3hlbicKPiA+Pj4+Pj4+Pj4+Pj4+IG1ha2UgLUMg
dG9vbHMKPiA+Pj4+Pj4+Pj4+Pj4+IG1ha2VbNF06IEVudGVyaW5nIGRpcmVjdG9yeSAnL3Vzci9z
cmMveGVuL3hlbi1tYXN0ZXIveGVuL3Rvb2xzJwo+ID4+Pj4+Pj4+Pj4+Pj4gbWFrZSBzeW1ib2xz
Cj4gPj4+Pj4+Pj4+Pj4+PiBtYWtlWzVdOiBFbnRlcmluZyBkaXJlY3RvcnkgJy91c3Ivc3JjL3hl
bi94ZW4tbWFzdGVyL3hlbi90b29scycKPiA+Pj4+Pj4+Pj4+Pj4+IGdjYyAtV2FsbCAtV2Vycm9y
IC1Xc3RyaWN0LXByb3RvdHlwZXMgLU8yIC1mb21pdC1mcmFtZS1wb2ludGVyCj4gPj4+Pj4+Pj4+
Pj4+PiAtZm5vLXN0cmljdC1hbGlhc2luZyAtV2RlY2xhcmF0aW9uLWFmdGVyLXN0YXRlbWVudCAt
byBzeW1ib2xzCj4gPj4+Pj4+Pj4+Pj4+PiBzeW1ib2xzLmMKPiA+Pj4+Pj4+Pj4+Pj4+IG1ha2Vb
NV06IExlYXZpbmcgZGlyZWN0b3J5ICcvdXNyL3NyYy94ZW4veGVuLW1hc3Rlci94ZW4vdG9vbHMn
Cj4gPj4+Pj4+Pj4+Pj4+PiBtYWtlWzRdOiBMZWF2aW5nIGRpcmVjdG9yeSAnL3Vzci9zcmMveGVu
L3hlbi1tYXN0ZXIveGVuL3Rvb2xzJwo+ID4+Pj4+Pj4+Pj4+Pj4gbWFrZSAtZiAvdXNyL3NyYy94
ZW4veGVuLW1hc3Rlci94ZW4vUnVsZXMubWsgaW5jbHVkZS94ZW4vY29tcGlsZS5oCj4gPj4+Pj4+
Pj4+Pj4+PiBtYWtlWzRdOiBFbnRlcmluZyBkaXJlY3RvcnkgJy91c3Ivc3JjL3hlbi94ZW4tbWFz
dGVyL3hlbicKPiA+Pj4+Pj4+Pj4+Pj4+ICBYZW4gNC4xMy11bnN0YWJsZQo+ID4+Pj4+Pj4+Pj4+
Pj4gL2Jpbi9zaDogcHl0aG9uOiBjb21tYW5kIG5vdCBmb3VuZAo+ID4+Pj4+Pj4+Pj4+Pj4gbWFr
ZVs0XTogKioqIFtNYWtlZmlsZToxNjk6IGluY2x1ZGUveGVuL2NvbXBpbGUuaF0gRXJyb3IgMTI3
Cj4gPj4+Pj4+Pj4+Pj4+IEhlcmUuIFRoZSBQWVRIT04gaW52b2NhdGlvbiBpcyBmcm9tIHRoZSBo
eXBlcnZpc29yIGJ1aWxkLCBub3QgdGhlIHRvb2xzCj4gPj4+Pj4+Pj4+Pj4+IGJ1aWxkLgo+ID4+
Pj4+Pj4+Pj4+Pgo+ID4+Pj4+Pj4+Pj4+PiBUaGFua3MgZm9yIHRoZSBsb2cuICBJIHdpbGwgaGF2
ZSBhIGNsb3NlciBsb29rLgo+ID4+Pj4+Pj4+Pj4+Pgo+ID4+Pj4+Pj4+Pj4+Pj4gbWFrZVs0XTog
TGVhdmluZyBkaXJlY3RvcnkgJy91c3Ivc3JjL3hlbi94ZW4tbWFzdGVyL3hlbicKPiA+Pj4+Pj4+
Pj4+Pj4+IG1ha2VbM106ICoqKiBbTWFrZWZpbGU6MTM3OiAvdXNyL3NyYy94ZW4veGVuLW1hc3Rl
ci94ZW4veGVuXSBFcnJvciAyCj4gPj4+Pj4+Pj4+Pj4+PiBtYWtlWzNdOiBMZWF2aW5nIGRpcmVj
dG9yeSAnL3Vzci9zcmMveGVuL3hlbi1tYXN0ZXIveGVuJwo+ID4+Pj4+Pj4+Pj4+Pj4gbWFrZVsy
XTogKioqIFtNYWtlZmlsZTo0NTogaW5zdGFsbF0gRXJyb3IgMgo+ID4+Pj4+Pj4+Pj4+Pj4gbWFr
ZVsyXTogTGVhdmluZyBkaXJlY3RvcnkgJy91c3Ivc3JjL3hlbi94ZW4tbWFzdGVyL3hlbicKPiA+
Pj4+Pj4+Pj4+Pj4+IG1ha2VbMV06ICoqKiBbTWFrZWZpbGU6MTIzOiBpbnN0YWxsLXhlbl0gRXJy
b3IgMgo+ID4+Pj4+Pj4+Pj4+Pj4gbWFrZVsxXTogTGVhdmluZyBkaXJlY3RvcnkgJy91c3Ivc3Jj
L3hlbi94ZW4tbWFzdGVyJwo+ID4+Pj4+Pj4+Pj4+Pj4gbWFrZTogKioqIFtNYWtlZmlsZToxNjU6
IHdvcmxkXSBFcnJvciAyCj4gPj4+Pj4+Pj4+Pj4+Pgo+ID4+Pj4+Pj4+Pj4+Pj4KPiA+Pj4+Pj4+
Pj4+Pj4+IE5vdGUgdGhlCj4gPj4+Pj4+Pj4+Pj4+Pgo+ID4+Pj4+Pj4+Pj4+Pj4gL2Jpbi9zaDog
cHl0aG9uOiBjb21tYW5kIG5vdCBmb3VuZAo+ID4+Pj4+Pj4+Pj4+Pj4KPiA+Pj4+Pj4+Pj4+PiBU
aGUgaXNzdWUgaGVyZSBpcyBvbiBMRlMgdGhlcmUgaXMgbm8gL3Vzci9iaW4vcHl0aG9uLiBTbyB0
aGUgaHlwZXJ2aXNvcgo+ID4+Pj4+Pj4+Pj4+IGJ1aWxkIGlzIGJyb2tlbiBiZWNhdXNlIHhlbi9p
bmNsdWRlL2NvbXBpbGUuaCBpbnZva2VzCj4gPj4+Pj4+Pj4+Pj4KPiA+Pj4+Pj4+Pj4+PiAgQCQo
UFlUSE9OKSB0b29scy9maWctdG8tb2N0LnB5IDwgLmJhbm5lciA+PiAkQC5uZXcKPiA+Pj4+Pj4+
Pj4+Pgo+ID4+Pj4+Pj4+Pj4+IFRoZXJlIGFyZSBvdGhlciBhcHBlYXJhbmNlcyBvZiBQWVRIT04g
aW4gaHlwZXJ2aXNvciBidWlsZCwgd2hpY2ggYXJlCj4gPj4+Pj4+Pj4+Pj4gZXF1YWxseSBicm9r
ZW4uCj4gPj4+Pj4+Pj4+Pj4KPiA+Pj4+Pj4+Pj4+PiBXZSBoYWQgLyBoYXZlIGEgcG9saWN5IHRv
IGF2b2lkIG1ha2luZyBoeXBlcnZpc29yIGJ1aWxkIGRlcGVuZGVudCBvbgo+ID4+Pj4+Pj4+Pj4+
IGNvbmZpZ3VyZS4gSSBoYXZlIENDJ2VkIG1vcmUgcGVvcGxlIG9uIHRoZWlyIG9waW5pb25zLgo+
ID4+Pj4+Pj4+Pj4gV2hlcmUgaGFzICQoUFlUSE9OKSBnb3QgbG9zdD/CoCBJdCB3YXMgc3BlY2lm
aWVkIGNvcnJlY3RseSB0byBiZWdpbiB3aXRoLgo+ID4+Pj4+Pj4+PiBXaGVyZSBpcyBpdCBzcGVj
aWZpZWQ/Cj4gPj4+Pj4+Pj4gT2ggLSBJIHNlZSBub3cuCj4gPj4+Pj4+Pj4KPiA+Pj4+Pj4+PiBJ
dCBpcyBzcGVjaWZpZWQgZm9yIC4vY29uZmlndXJlLCBidXQgbm90IGZvciBtYWtlLgo+ID4+Pj4+
Pj4gUmlnaHQuCj4gPj4+Pj4+Pgo+ID4+Pj4+Pj4gSXQgd29ya3MgZm9yIHRvb2xzIGJlY2F1c2Ug
dG9vbHMgYnVpbGQgaW5jbHVkZXMgY29uZmlnL1Rvb2xzLm1rIHdoaWNoCj4gPj4+Pj4+PiBjb250
YWlucyB0aGUgY29ycmVjdCBweXRob24gcGF0aC4gVG9vbHMubWsgaXMgZ2VuZXJhdGVkIGJ5IGNv
bmZpZ3VyZS4KPiA+Pj4+Pj4+ICAKPiA+Pj4+Pj4+IE9idmlvdXNseSBoeXBlcnZpc29yIGJ1aWxk
IHNob3VsZG4ndCBpbmNsdWRlIFRvb2xzLm1rLiBGdXJ0aGVybW9yZSwgdGhlCj4gPj4+Pj4+PiBw
b2xpY3kgb2YgImh2IHNob3VsZG4ndCBkZXBlbmQgb24gY29uZmlndXJlIiBtYWtlcyB0aGlzIHJv
dXRlIGEgbm8tZ28uCj4gPj4+Pj4+Pgo+ID4+Pj4+Pj4gRWl0aGVyIHdlIGNoYW5nZSB0aGUgcG9s
aWN5LCBvciB3ZSBkb2N1bWVudCB0aGUgZGVmaWNpZW5jeSwgb3Igd2UgY29tZQo+ID4+Pj4+Pj4g
dXAgd2l0aCBzb21lIGNsZXZlciB0cmljayB0byBwcm9iZS4KPiA+Pj4+Pj4gR2l2ZW4gdGhlIHNo
ZWJhbmcgaW4gYWxsIG9mIG91ciBzY3JpcHRzLCB3b3VsZCBgZW52IHB5dGhvbmAgYmUKPiA+Pj4+
Pj4gc3VmZmljaWVudGx5IGNsZXZlciB0cmlja2VyeSwgb3IgaXMgdGhhdCBhIGNhbiBvZiB3b3Jt
cyB3ZSdkIHByZWZlciBub3QKPiA+Pj4+Pj4gdG8gb3Blbj8KPiA+Pj4+PiBJIGFscmVhZHkgdHJp
ZWQgZW52IHB5dGhvbiAtLSBpdCBkaWRuJ3Qgd29yay4gSSB0aGluayBpdCBzZWFyY2hlcyBQQVRI
Uwo+ID4+Pj4+IGp1c3QgbGlrZSBhIHNoZWxsIHdvdWxkLgo+ID4+Pj4gU28gdGhpcyBwYXJ0aWN1
bGFyIHVzZSBvZiBweXRob24gaXMgY29tcGxldGVseSB0cml2aWFsLsKgIEl0IGlzIGFuIG9jdGFs
Cj4gPj4+PiBjb252ZXJzaW9uIG9uIHRoZSBiYW5uZXIgc3RyaW5nLCB0byBmZWVkIGludG8gYSBz
dHJpbmcgZm9yIFhFTl9CQU5ORVIKPiA+Pj4+Cj4gPj4+PiBJdCBleGlzdHMgYmVjYXVzZSBJIHJl
bW92ZWQgYSBmb3JrIG9mIGZpZ2xldFsxXSBmcm9tIFhlbidzIHNvdXJjZSB0cmVlCj4gPj4+PiB3
aXRoIHRoaXMgc2NyaXB0LCBidXQgaXRzIHByb2JhYmx5IGp1c3QgYXMgZWFzeSB0byBkbyB3aXRo
IGF3ayBvcgo+ID4+Pj4gc29tZXRoaW5nIHNpbWlsYXIuCj4gPj4+Pgo+ID4+Pj4gfkFuZHJldwo+
ID4+Pj4KPiA+Pj4+IFsxXSBZZXMgLSBYZW4gZGlkIHVzZSB0byBjYXJyeSBhIGZvcmsgb2YgZmln
bGV0IHdoaWNoIGRpZmZlcmVkIHNvbGVseSBieQo+ID4+Pj4gYmVpbmcgYWJsZSB0byBvdXRwdXQg
YW4gb2N0YWwtZXNjYXBlZCBzdHJpbmcuwqAgTm8gLSBJIGhhdmUgbm8gd29yZHMKPiA+Pj4+IHdo
aWNoIGNhbiBwb3NzaWJseSBiZSB1c2VkIHRvIGRlZmVuZCB0aGlzLi4uCj4gPj4+Cj4gPj4+IEJ1
dCB0aGVyZSBhcmUgb3RoZXIgbGVzcyB0cml2aWFsIG9uZXMuIFNlZSB4ZW4vaW5jbHVkZS9NYWtl
ZmlsZS4gWFNNCj4gPj4+IGFsc28gcmVsaWVzIG9uIGl0IHRvIGdlbmVyYXRlIHBvbGljeS4gV2hh
dCBkbyB5b3Ugd2FudCB0byBkbyB3aXRoIHRob3NlPwo+ID4+IFNob3VsZG4ndCBfc29tZV8gc2V0
dGluZ3Mgb2YgY29uZmlndXJlIGVuZCB1cCBpbiB0aGUgaHlwZXJ2aXNvciBidWlsZCwKPiA+PiB0
b28/IExpa2UgQ0MsIEFXSywgU0hFTEwsIEhPU1RDQz8KPiA+Pgo+ID4+IE1heWJlIHdlIG5lZWQg
YSByYXRoZXIgc21hbGwgYmFzaWNfdG9vbHMubWsgY29udGFpbmluZyB0aG9zZSBzZXR0aW5ncwo+
ID4+ICh3aXRoIGEgc2FuZSBkZWZhdWx0LCBvZiBjb3Vyc2UpPwo+ID4gCj4gPiBJbiB0aGUgcGFz
dCwgdGhlcmUgaGFzIGJlZW4gYSB2ZWhlbWVudCBvYmplY3Rpb24gdG8gcmVxdWlyaW5nCj4gPiAu
L2NvbmZpZ3VyZSBiZWZvcmUgYnVpbGRpbmcgWGVuLCBhbmQgSSBzdGlsbCBhZ3JlZSB3aXRoIHRo
aXMgcG9pbnQgb2YKPiA+IHZpZXcuwqAgTm9vbmUgc2hvdWxkIG5lZWQgdG8gcnVuIC4vY29uZmln
dXJlIHRvIGJlIGFibGUgdG8gYnVpbGQgYQo+ID4gZnJlZXN0YW5kaW5nIGl0ZW0gd2l0aCBubyB1
c2Vyc3BhY2UgY29ubmVjdGlvbi4KPiA+IAo+ID4gVGhlIHByb2JsZW0gWGVuIGhhcyBpcyB0aGF0
IHdlJ3ZlIGdvdCB0d28gdmFzdGx5IGRpZmZlcmVudCBwcm9qZWN0cyBpbgo+ID4gdGhlIHNhbWUg
c291cmNlIHJlcG8sIGFuZCBgbWFrZWAgcnVuZXMgd2hpY2ggZW5jb21wYXNzIGJvdGguCj4gPiAK
PiA+IENvdWxkIHdlIGdvIHdpdGggc29tZSBjb21wcm9taXNlIHdoZXJlIHRoZSByZXN1bHRzIG9m
IGNvbmZpZ3VyZSBhcmUgdXNlZAo+ID4gaWYgdGhleSBhcmUgYXZhaWxhYmxlLCBidXQgZm9yIHBl
b3BsZSBub3Qgd2FudGluZyB0byBydW4gY29uZmlndXJlLCBpZgo+ID4gdGhleSd2ZSBnb3Qgbm9u
LXN0YW5kYXJkIHN0YW5kYXJkIHRvb2xzLCB0aGV5IG5lZWQgdG8gcGFzcyB0aGVtIHRvIG1ha2UK
PiA+IGFzIHdlbGw/wqAgVGhpcyBpcyBjb25zaXN0ZW50IHdpdGggaG93IGNyb3NzIGNvbXBpbGlu
ZyB3b3Jrcy4KPiAKPiBUaGF0IHNob3VsZCBiZSBmYWlybHkgZWFzeS4KPiAKPiBMZXQgQ29uZmln
Lm1rIGhhdmU6Cj4gCj4gLWluY2x1ZGUgY29uZmlnL2Jhc2ljX3Rvb2xzLm1rCj4gCj4gYXQgdGhl
IHZlcnkgYmVnaW5uaW5nLCB3aXRoIGNvbmZpZy9iYXNpY190b29scy5tayBiZWluZyBjcmVhdGVk
IHZpYQo+IGNvbmZpZ3VyZSBhbmQgY29udGFpbmluZyB0aGUgYmFzaWMgdG9vbCB2YXJpYWJsZXM6
Cj4gCj4gQ0MgOj0gZ2NjCj4gQVdLIDo9IGF3awo+IFBZVEhPTiA6PSBweXRob24zCj4gLi4uCj4g
Cj4gQXMgQ29uZmlnLm1rIHdpbGwgc2V0IHRob3NlIHZhcmlhYmxlcyB3aXRoIGRlZnVhbHQgdmFs
dWVzIGluIGNhc2UgdGhleQo+IGFyZSBlbXB0eSBhbGwgaXMgZmluZSB0aGVuLgoKRnJhbmtseSBJ
J20gbm90IGEgYmlnIGZhbiBvZiB0aGlzIGFwcHJvYWNoIC0tIHlvdSBjYW4gcG90ZW50aWFsbHkg
Z2V0CmRpZmZlcmVudCB0b29sY2hhaW4gZGVwZW5kaW5nIG9uIGhvdyB5b3UgYnVpbGQgc3R1ZmYu
IEkgd291bGQgcmF0aGVyCmp1c3QgZG9jdW1lbnQgdGhhdCBmb3IgaHlwZXJ2aXNvciBidWlsZCBl
aXRoZXIgcHl0aG9uIGlzIGF2YWlsYWJsZSBvcgp5b3Ugc2hvdWxkIHNwZWNpZnkgUFlUSE9OPSB3
aGVuIGludm9raW5nIG1ha2UuCgpXZWkuCgo+IAo+IAo+IEp1ZXJnZW4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
