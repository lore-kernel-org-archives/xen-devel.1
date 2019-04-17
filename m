Return-Path: <SRS0=ZpmR=ST=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E7D7C282DA
	for <xen-devel@archiver.kernel.org>; Wed, 17 Apr 2019 11:23:54 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EB3B2206BA
	for <xen-devel@archiver.kernel.org>; Wed, 17 Apr 2019 11:23:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EB3B2206BA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hGif9-0003qd-KH; Wed, 17 Apr 2019 11:23:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=cP2p=ST=citrix.com=prvs=003bda41c=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hGif8-0003qY-ED
 for xen-devel@lists.xenproject.org; Wed, 17 Apr 2019 11:23:34 +0000
X-Inumbo-ID: 3a599c30-6103-11e9-bbba-87b9a3d56916
Received: from SMTP.EU.CITRIX.COM (unknown [185.25.65.24])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3a599c30-6103-11e9-bbba-87b9a3d56916;
 Wed, 17 Apr 2019 11:23:31 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,361,1549929600"; d="scan'208";a="88954505"
To: Wei Liu <wei.liu2@citrix.com>
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
 <20190417111635.GU30543@zion.uk.xensource.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <7fe14ebe-987a-8b95-1d77-d6d40a473fa3@citrix.com>
Date: Wed, 17 Apr 2019 12:23:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190417111635.GU30543@zion.uk.xensource.com>
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
 Kevin Buckley <kevin.buckley.ecs.vuw.ac.nz@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Jan Beulich <JBeulich@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190417112329.fdVpykgrLESrxoRVO46waNJZn5RlS1aX7JUm_bQBwrU@z>

T24gMTcvMDQvMjAxOSAxMjoxNiwgV2VpIExpdSB3cm90ZToKPiBPbiBXZWQsIEFwciAxNywgMjAx
OSBhdCAxMjoxNTowNFBNICswMTAwLCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+PiBPbiAxNy8wNC8y
MDE5IDEyOjAzLCBXZWkgTGl1IHdyb3RlOgo+Pj4gT24gV2VkLCBBcHIgMTcsIDIwMTkgYXQgMTE6
NTg6NDlBTSArMDEwMCwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4+PiBPbiAxNy8wNC8yMDE5IDEx
OjU3LCBXZWkgTGl1IHdyb3RlOgo+Pj4+PiBPbiBXZWQsIEFwciAxNywgMjAxOSBhdCAxMTo0NDoz
NkFNICswMTAwLCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+Pj4+Pj4gT24gMTcvMDQvMjAxOSAxMTo0
MSwgV2VpIExpdSB3cm90ZToKPj4+Pj4+PiBPbiBXZWQsIEFwciAxNywgMjAxOSBhdCAxMDo1Njo1
N0FNICswMTAwLCBXZWkgTGl1IHdyb3RlOgo+Pj4+Pj4+Pj4gSGVyZSdzIHdoYXQgaSBkaWQgaGF2
aW5nIHB1bGxlZCB0aGUgbWFzdGVyIGF0IGNvbW1pdCBjYjcwYTI2Cj4+Pj4+Pj4+Pgo+Pj4+Pj4+
Pj4gdGFyIHhmIC9wYXRoL3RvL3hlbi1jYjcwYTI2LnRhci5nego+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+
IGNkIHhlbi1tYXN0ZXIvCj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4gUFlUSE9OPS91c3IvYmluL3B5dGhv
bjMgLi9jb25maWd1cmUgLS1wcmVmaXg9L3VzciAgIFwKPj4+Pj4+Pj4+ICAgIC0tZGlzYWJsZS1z
ZWFiaW9zICAgXAo+Pj4+Pj4+Pj4gICAgLS1kaXNhYmxlLXFlbXUtdHJhZGl0aW9uYWwgIFwKPj4+
Pj4+Pj4+ICAgIC0tZGlzYWJsZS1yb21iaW9zICAgICBcCj4+Pj4+Pj4+PiAgICAtLWRpc2FibGUt
c3R1YmRvbSAyPiYxIHwgdGVlIC4uL2NvbmZpZy5sb2cKPj4+Pj4+Pj4+Cj4+Pj4+Pj4+PiBtYWtl
IEVGSV9ESVI9L3Vzci9saWIvZWZpIHdvcmxkIDI+JjEgfCB0ZWUgLi4vbWFrZV93b3JsZF8zLm91
dAo+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+Cj4+Pj4+Pj4+PiAuLi4KPj4+Pj4+Pj4+IGdjYyAtV3AsLU1E
LHRvb2xzL2tjb25maWcvLnpjb25mLnRhYi5vLmQgICAgLURfR05VX1NPVVJDRQo+Pj4+Pj4+Pj4g
LURfREVGQVVMVF9TT1VSQ0UgLURDVVJTRVNfTE9DPSI8bmN1cnNlcy5oPiIgLUROQ1VSU0VTX1dJ
REVDSEFSPTEKPj4+Pj4+Pj4+IC1ETE9DQUxFICAtSXRvb2xzL2tjb25maWcgLWMgLW8gdG9vbHMv
a2NvbmZpZy96Y29uZi50YWIubwo+Pj4+Pj4+Pj4gdG9vbHMva2NvbmZpZy96Y29uZi50YWIuYwo+
Pj4+Pj4+Pj4gZ2NjICAtbyB0b29scy9rY29uZmlnL2NvbmYgdG9vbHMva2NvbmZpZy9jb25mLm8g
dG9vbHMva2NvbmZpZy96Y29uZi50YWIubwo+Pj4+Pj4+Pj4gdG9vbHMva2NvbmZpZy9jb25mIC1z
IC0tc2lsZW50b2xkY29uZmlnIEtjb25maWcKPj4+Pj4+Pj4+IG1ha2VbM106IExlYXZpbmcgZGly
ZWN0b3J5ICcvdXNyL3NyYy94ZW4veGVuLW1hc3Rlci94ZW4nCj4+Pj4+Pj4+PiBtYWtlIC1mIFJ1
bGVzLm1rIF9pbnN0YWxsCj4+Pj4+Pj4+PiBtYWtlWzNdOiBFbnRlcmluZyBkaXJlY3RvcnkgJy91
c3Ivc3JjL3hlbi94ZW4tbWFzdGVyL3hlbicKPj4+Pj4+Pj4+IG1ha2UgLUMgdG9vbHMKPj4+Pj4+
Pj4+IG1ha2VbNF06IEVudGVyaW5nIGRpcmVjdG9yeSAnL3Vzci9zcmMveGVuL3hlbi1tYXN0ZXIv
eGVuL3Rvb2xzJwo+Pj4+Pj4+Pj4gbWFrZSBzeW1ib2xzCj4+Pj4+Pj4+PiBtYWtlWzVdOiBFbnRl
cmluZyBkaXJlY3RvcnkgJy91c3Ivc3JjL3hlbi94ZW4tbWFzdGVyL3hlbi90b29scycKPj4+Pj4+
Pj4+IGdjYyAtV2FsbCAtV2Vycm9yIC1Xc3RyaWN0LXByb3RvdHlwZXMgLU8yIC1mb21pdC1mcmFt
ZS1wb2ludGVyCj4+Pj4+Pj4+PiAtZm5vLXN0cmljdC1hbGlhc2luZyAtV2RlY2xhcmF0aW9uLWFm
dGVyLXN0YXRlbWVudCAtbyBzeW1ib2xzCj4+Pj4+Pj4+PiBzeW1ib2xzLmMKPj4+Pj4+Pj4+IG1h
a2VbNV06IExlYXZpbmcgZGlyZWN0b3J5ICcvdXNyL3NyYy94ZW4veGVuLW1hc3Rlci94ZW4vdG9v
bHMnCj4+Pj4+Pj4+PiBtYWtlWzRdOiBMZWF2aW5nIGRpcmVjdG9yeSAnL3Vzci9zcmMveGVuL3hl
bi1tYXN0ZXIveGVuL3Rvb2xzJwo+Pj4+Pj4+Pj4gbWFrZSAtZiAvdXNyL3NyYy94ZW4veGVuLW1h
c3Rlci94ZW4vUnVsZXMubWsgaW5jbHVkZS94ZW4vY29tcGlsZS5oCj4+Pj4+Pj4+PiBtYWtlWzRd
OiBFbnRlcmluZyBkaXJlY3RvcnkgJy91c3Ivc3JjL3hlbi94ZW4tbWFzdGVyL3hlbicKPj4+Pj4+
Pj4+ICBYZW4gNC4xMy11bnN0YWJsZQo+Pj4+Pj4+Pj4gL2Jpbi9zaDogcHl0aG9uOiBjb21tYW5k
IG5vdCBmb3VuZAo+Pj4+Pj4+Pj4gbWFrZVs0XTogKioqIFtNYWtlZmlsZToxNjk6IGluY2x1ZGUv
eGVuL2NvbXBpbGUuaF0gRXJyb3IgMTI3Cj4+Pj4+Pj4+IEhlcmUuIFRoZSBQWVRIT04gaW52b2Nh
dGlvbiBpcyBmcm9tIHRoZSBoeXBlcnZpc29yIGJ1aWxkLCBub3QgdGhlIHRvb2xzCj4+Pj4+Pj4+
IGJ1aWxkLgo+Pj4+Pj4+Pgo+Pj4+Pj4+PiBUaGFua3MgZm9yIHRoZSBsb2cuICBJIHdpbGwgaGF2
ZSBhIGNsb3NlciBsb29rLgo+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4gbWFrZVs0XTogTGVhdmluZyBkaXJl
Y3RvcnkgJy91c3Ivc3JjL3hlbi94ZW4tbWFzdGVyL3hlbicKPj4+Pj4+Pj4+IG1ha2VbM106ICoq
KiBbTWFrZWZpbGU6MTM3OiAvdXNyL3NyYy94ZW4veGVuLW1hc3Rlci94ZW4veGVuXSBFcnJvciAy
Cj4+Pj4+Pj4+PiBtYWtlWzNdOiBMZWF2aW5nIGRpcmVjdG9yeSAnL3Vzci9zcmMveGVuL3hlbi1t
YXN0ZXIveGVuJwo+Pj4+Pj4+Pj4gbWFrZVsyXTogKioqIFtNYWtlZmlsZTo0NTogaW5zdGFsbF0g
RXJyb3IgMgo+Pj4+Pj4+Pj4gbWFrZVsyXTogTGVhdmluZyBkaXJlY3RvcnkgJy91c3Ivc3JjL3hl
bi94ZW4tbWFzdGVyL3hlbicKPj4+Pj4+Pj4+IG1ha2VbMV06ICoqKiBbTWFrZWZpbGU6MTIzOiBp
bnN0YWxsLXhlbl0gRXJyb3IgMgo+Pj4+Pj4+Pj4gbWFrZVsxXTogTGVhdmluZyBkaXJlY3Rvcnkg
Jy91c3Ivc3JjL3hlbi94ZW4tbWFzdGVyJwo+Pj4+Pj4+Pj4gbWFrZTogKioqIFtNYWtlZmlsZTox
NjU6IHdvcmxkXSBFcnJvciAyCj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+IE5vdGUgdGhl
Cj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4gL2Jpbi9zaDogcHl0aG9uOiBjb21tYW5kIG5vdCBmb3VuZAo+
Pj4+Pj4+Pj4KPj4+Pj4+PiBUaGUgaXNzdWUgaGVyZSBpcyBvbiBMRlMgdGhlcmUgaXMgbm8gL3Vz
ci9iaW4vcHl0aG9uLiBTbyB0aGUgaHlwZXJ2aXNvcgo+Pj4+Pj4+IGJ1aWxkIGlzIGJyb2tlbiBi
ZWNhdXNlIHhlbi9pbmNsdWRlL2NvbXBpbGUuaCBpbnZva2VzCj4+Pj4+Pj4KPj4+Pj4+PiAgQCQo
UFlUSE9OKSB0b29scy9maWctdG8tb2N0LnB5IDwgLmJhbm5lciA+PiAkQC5uZXcKPj4+Pj4+Pgo+
Pj4+Pj4+IFRoZXJlIGFyZSBvdGhlciBhcHBlYXJhbmNlcyBvZiBQWVRIT04gaW4gaHlwZXJ2aXNv
ciBidWlsZCwgd2hpY2ggYXJlCj4+Pj4+Pj4gZXF1YWxseSBicm9rZW4uCj4+Pj4+Pj4KPj4+Pj4+
PiBXZSBoYWQgLyBoYXZlIGEgcG9saWN5IHRvIGF2b2lkIG1ha2luZyBoeXBlcnZpc29yIGJ1aWxk
IGRlcGVuZGVudCBvbgo+Pj4+Pj4+IGNvbmZpZ3VyZS4gSSBoYXZlIENDJ2VkIG1vcmUgcGVvcGxl
IG9uIHRoZWlyIG9waW5pb25zLgo+Pj4+Pj4gV2hlcmUgaGFzICQoUFlUSE9OKSBnb3QgbG9zdD/C
oCBJdCB3YXMgc3BlY2lmaWVkIGNvcnJlY3RseSB0byBiZWdpbiB3aXRoLgo+Pj4+PiBXaGVyZSBp
cyBpdCBzcGVjaWZpZWQ/Cj4+Pj4gT2ggLSBJIHNlZSBub3cuCj4+Pj4KPj4+PiBJdCBpcyBzcGVj
aWZpZWQgZm9yIC4vY29uZmlndXJlLCBidXQgbm90IGZvciBtYWtlLgo+Pj4gUmlnaHQuCj4+Pgo+
Pj4gSXQgd29ya3MgZm9yIHRvb2xzIGJlY2F1c2UgdG9vbHMgYnVpbGQgaW5jbHVkZXMgY29uZmln
L1Rvb2xzLm1rIHdoaWNoCj4+PiBjb250YWlucyB0aGUgY29ycmVjdCBweXRob24gcGF0aC4gVG9v
bHMubWsgaXMgZ2VuZXJhdGVkIGJ5IGNvbmZpZ3VyZS4KPj4+ICAKPj4+IE9idmlvdXNseSBoeXBl
cnZpc29yIGJ1aWxkIHNob3VsZG4ndCBpbmNsdWRlIFRvb2xzLm1rLiBGdXJ0aGVybW9yZSwgdGhl
Cj4+PiBwb2xpY3kgb2YgImh2IHNob3VsZG4ndCBkZXBlbmQgb24gY29uZmlndXJlIiBtYWtlcyB0
aGlzIHJvdXRlIGEgbm8tZ28uCj4+Pgo+Pj4gRWl0aGVyIHdlIGNoYW5nZSB0aGUgcG9saWN5LCBv
ciB3ZSBkb2N1bWVudCB0aGUgZGVmaWNpZW5jeSwgb3Igd2UgY29tZQo+Pj4gdXAgd2l0aCBzb21l
IGNsZXZlciB0cmljayB0byBwcm9iZS4KPj4gR2l2ZW4gdGhlIHNoZWJhbmcgaW4gYWxsIG9mIG91
ciBzY3JpcHRzLCB3b3VsZCBgZW52IHB5dGhvbmAgYmUKPj4gc3VmZmljaWVudGx5IGNsZXZlciB0
cmlja2VyeSwgb3IgaXMgdGhhdCBhIGNhbiBvZiB3b3JtcyB3ZSdkIHByZWZlciBub3QKPj4gdG8g
b3Blbj8KPiBJIGFscmVhZHkgdHJpZWQgZW52IHB5dGhvbiAtLSBpdCBkaWRuJ3Qgd29yay4gSSB0
aGluayBpdCBzZWFyY2hlcyBQQVRIUwo+IGp1c3QgbGlrZSBhIHNoZWxsIHdvdWxkLgoKU28gdGhp
cyBwYXJ0aWN1bGFyIHVzZSBvZiBweXRob24gaXMgY29tcGxldGVseSB0cml2aWFsLsKgIEl0IGlz
IGFuIG9jdGFsCmNvbnZlcnNpb24gb24gdGhlIGJhbm5lciBzdHJpbmcsIHRvIGZlZWQgaW50byBh
IHN0cmluZyBmb3IgWEVOX0JBTk5FUgoKSXQgZXhpc3RzIGJlY2F1c2UgSSByZW1vdmVkIGEgZm9y
ayBvZiBmaWdsZXRbMV0gZnJvbSBYZW4ncyBzb3VyY2UgdHJlZQp3aXRoIHRoaXMgc2NyaXB0LCBi
dXQgaXRzIHByb2JhYmx5IGp1c3QgYXMgZWFzeSB0byBkbyB3aXRoIGF3ayBvcgpzb21ldGhpbmcg
c2ltaWxhci4KCn5BbmRyZXcKClsxXSBZZXMgLSBYZW4gZGlkIHVzZSB0byBjYXJyeSBhIGZvcmsg
b2YgZmlnbGV0IHdoaWNoIGRpZmZlcmVkIHNvbGVseSBieQpiZWluZyBhYmxlIHRvIG91dHB1dCBh
biBvY3RhbC1lc2NhcGVkIHN0cmluZy7CoCBObyAtIEkgaGF2ZSBubyB3b3Jkcwp3aGljaCBjYW4g
cG9zc2libHkgYmUgdXNlZCB0byBkZWZlbmQgdGhpcy4uLgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
