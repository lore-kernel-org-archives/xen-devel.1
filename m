Return-Path: <SRS0=ZpmR=ST=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_MUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1BAAC10F12
	for <xen-devel@archiver.kernel.org>; Wed, 17 Apr 2019 11:04:21 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 79B2420645
	for <xen-devel@archiver.kernel.org>; Wed, 17 Apr 2019 11:04:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 79B2420645
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hGiME-00025D-Ei; Wed, 17 Apr 2019 11:04:02 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=f/qU=ST=citrix.com=prvs=0034167b4=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1hGiMD-000254-67
 for xen-devel@lists.xenproject.org; Wed, 17 Apr 2019 11:04:01 +0000
X-Inumbo-ID: 805454eb-6100-11e9-92d7-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 805454eb-6100-11e9-92d7-bc764e045a96;
 Wed, 17 Apr 2019 11:03:59 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,361,1549929600"; d="scan'208";a="83778822"
Date: Wed, 17 Apr 2019 12:03:56 +0100
From: Wei Liu <wei.liu2@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <20190417110356.GT30543@zion.uk.xensource.com>
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
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cda91b28-50c4-308a-30d8-6cecceb973c6@citrix.com>
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
Message-ID: <20190417110356.ISEoC8qD09k9q9--Y1efKykT92R-F_SIXsFW3A6keWw@z>

T24gV2VkLCBBcHIgMTcsIDIwMTkgYXQgMTE6NTg6NDlBTSArMDEwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBPbiAxNy8wNC8yMDE5IDExOjU3LCBXZWkgTGl1IHdyb3RlOgo+ID4gT24gV2VkLCBB
cHIgMTcsIDIwMTkgYXQgMTE6NDQ6MzZBTSArMDEwMCwgQW5kcmV3IENvb3BlciB3cm90ZToKPiA+
PiBPbiAxNy8wNC8yMDE5IDExOjQxLCBXZWkgTGl1IHdyb3RlOgo+ID4+PiBPbiBXZWQsIEFwciAx
NywgMjAxOSBhdCAxMDo1Njo1N0FNICswMTAwLCBXZWkgTGl1IHdyb3RlOgo+ID4+Pj4+IEhlcmUn
cyB3aGF0IGkgZGlkIGhhdmluZyBwdWxsZWQgdGhlIG1hc3RlciBhdCBjb21taXQgY2I3MGEyNgo+
ID4+Pj4+Cj4gPj4+Pj4gdGFyIHhmIC9wYXRoL3RvL3hlbi1jYjcwYTI2LnRhci5nego+ID4+Pj4+
Cj4gPj4+Pj4gY2QgeGVuLW1hc3Rlci8KPiA+Pj4+Pgo+ID4+Pj4+IFBZVEhPTj0vdXNyL2Jpbi9w
eXRob24zIC4vY29uZmlndXJlIC0tcHJlZml4PS91c3IgICBcCj4gPj4+Pj4gICAgLS1kaXNhYmxl
LXNlYWJpb3MgICBcCj4gPj4+Pj4gICAgLS1kaXNhYmxlLXFlbXUtdHJhZGl0aW9uYWwgIFwKPiA+
Pj4+PiAgICAtLWRpc2FibGUtcm9tYmlvcyAgICAgXAo+ID4+Pj4+ICAgIC0tZGlzYWJsZS1zdHVi
ZG9tIDI+JjEgfCB0ZWUgLi4vY29uZmlnLmxvZwo+ID4+Pj4+Cj4gPj4+Pj4gbWFrZSBFRklfRElS
PS91c3IvbGliL2VmaSB3b3JsZCAyPiYxIHwgdGVlIC4uL21ha2Vfd29ybGRfMy5vdXQKPiA+Pj4+
Pgo+ID4+Pj4+Cj4gPj4+Pj4gLi4uCj4gPj4+Pj4gZ2NjIC1XcCwtTUQsdG9vbHMva2NvbmZpZy8u
emNvbmYudGFiLm8uZCAgICAtRF9HTlVfU09VUkNFCj4gPj4+Pj4gLURfREVGQVVMVF9TT1VSQ0Ug
LURDVVJTRVNfTE9DPSI8bmN1cnNlcy5oPiIgLUROQ1VSU0VTX1dJREVDSEFSPTEKPiA+Pj4+PiAt
RExPQ0FMRSAgLUl0b29scy9rY29uZmlnIC1jIC1vIHRvb2xzL2tjb25maWcvemNvbmYudGFiLm8K
PiA+Pj4+PiB0b29scy9rY29uZmlnL3pjb25mLnRhYi5jCj4gPj4+Pj4gZ2NjICAtbyB0b29scy9r
Y29uZmlnL2NvbmYgdG9vbHMva2NvbmZpZy9jb25mLm8gdG9vbHMva2NvbmZpZy96Y29uZi50YWIu
bwo+ID4+Pj4+IHRvb2xzL2tjb25maWcvY29uZiAtcyAtLXNpbGVudG9sZGNvbmZpZyBLY29uZmln
Cj4gPj4+Pj4gbWFrZVszXTogTGVhdmluZyBkaXJlY3RvcnkgJy91c3Ivc3JjL3hlbi94ZW4tbWFz
dGVyL3hlbicKPiA+Pj4+PiBtYWtlIC1mIFJ1bGVzLm1rIF9pbnN0YWxsCj4gPj4+Pj4gbWFrZVsz
XTogRW50ZXJpbmcgZGlyZWN0b3J5ICcvdXNyL3NyYy94ZW4veGVuLW1hc3Rlci94ZW4nCj4gPj4+
Pj4gbWFrZSAtQyB0b29scwo+ID4+Pj4+IG1ha2VbNF06IEVudGVyaW5nIGRpcmVjdG9yeSAnL3Vz
ci9zcmMveGVuL3hlbi1tYXN0ZXIveGVuL3Rvb2xzJwo+ID4+Pj4+IG1ha2Ugc3ltYm9scwo+ID4+
Pj4+IG1ha2VbNV06IEVudGVyaW5nIGRpcmVjdG9yeSAnL3Vzci9zcmMveGVuL3hlbi1tYXN0ZXIv
eGVuL3Rvb2xzJwo+ID4+Pj4+IGdjYyAtV2FsbCAtV2Vycm9yIC1Xc3RyaWN0LXByb3RvdHlwZXMg
LU8yIC1mb21pdC1mcmFtZS1wb2ludGVyCj4gPj4+Pj4gLWZuby1zdHJpY3QtYWxpYXNpbmcgLVdk
ZWNsYXJhdGlvbi1hZnRlci1zdGF0ZW1lbnQgLW8gc3ltYm9scwo+ID4+Pj4+IHN5bWJvbHMuYwo+
ID4+Pj4+IG1ha2VbNV06IExlYXZpbmcgZGlyZWN0b3J5ICcvdXNyL3NyYy94ZW4veGVuLW1hc3Rl
ci94ZW4vdG9vbHMnCj4gPj4+Pj4gbWFrZVs0XTogTGVhdmluZyBkaXJlY3RvcnkgJy91c3Ivc3Jj
L3hlbi94ZW4tbWFzdGVyL3hlbi90b29scycKPiA+Pj4+PiBtYWtlIC1mIC91c3Ivc3JjL3hlbi94
ZW4tbWFzdGVyL3hlbi9SdWxlcy5tayBpbmNsdWRlL3hlbi9jb21waWxlLmgKPiA+Pj4+PiBtYWtl
WzRdOiBFbnRlcmluZyBkaXJlY3RvcnkgJy91c3Ivc3JjL3hlbi94ZW4tbWFzdGVyL3hlbicKPiA+
Pj4+PiAgWGVuIDQuMTMtdW5zdGFibGUKPiA+Pj4+PiAvYmluL3NoOiBweXRob246IGNvbW1hbmQg
bm90IGZvdW5kCj4gPj4+Pj4gbWFrZVs0XTogKioqIFtNYWtlZmlsZToxNjk6IGluY2x1ZGUveGVu
L2NvbXBpbGUuaF0gRXJyb3IgMTI3Cj4gPj4+PiBIZXJlLiBUaGUgUFlUSE9OIGludm9jYXRpb24g
aXMgZnJvbSB0aGUgaHlwZXJ2aXNvciBidWlsZCwgbm90IHRoZSB0b29scwo+ID4+Pj4gYnVpbGQu
Cj4gPj4+Pgo+ID4+Pj4gVGhhbmtzIGZvciB0aGUgbG9nLiAgSSB3aWxsIGhhdmUgYSBjbG9zZXIg
bG9vay4KPiA+Pj4+Cj4gPj4+Pj4gbWFrZVs0XTogTGVhdmluZyBkaXJlY3RvcnkgJy91c3Ivc3Jj
L3hlbi94ZW4tbWFzdGVyL3hlbicKPiA+Pj4+PiBtYWtlWzNdOiAqKiogW01ha2VmaWxlOjEzNzog
L3Vzci9zcmMveGVuL3hlbi1tYXN0ZXIveGVuL3hlbl0gRXJyb3IgMgo+ID4+Pj4+IG1ha2VbM106
IExlYXZpbmcgZGlyZWN0b3J5ICcvdXNyL3NyYy94ZW4veGVuLW1hc3Rlci94ZW4nCj4gPj4+Pj4g
bWFrZVsyXTogKioqIFtNYWtlZmlsZTo0NTogaW5zdGFsbF0gRXJyb3IgMgo+ID4+Pj4+IG1ha2Vb
Ml06IExlYXZpbmcgZGlyZWN0b3J5ICcvdXNyL3NyYy94ZW4veGVuLW1hc3Rlci94ZW4nCj4gPj4+
Pj4gbWFrZVsxXTogKioqIFtNYWtlZmlsZToxMjM6IGluc3RhbGwteGVuXSBFcnJvciAyCj4gPj4+
Pj4gbWFrZVsxXTogTGVhdmluZyBkaXJlY3RvcnkgJy91c3Ivc3JjL3hlbi94ZW4tbWFzdGVyJwo+
ID4+Pj4+IG1ha2U6ICoqKiBbTWFrZWZpbGU6MTY1OiB3b3JsZF0gRXJyb3IgMgo+ID4+Pj4+Cj4g
Pj4+Pj4KPiA+Pj4+PiBOb3RlIHRoZQo+ID4+Pj4+Cj4gPj4+Pj4gL2Jpbi9zaDogcHl0aG9uOiBj
b21tYW5kIG5vdCBmb3VuZAo+ID4+Pj4+Cj4gPj4+IFRoZSBpc3N1ZSBoZXJlIGlzIG9uIExGUyB0
aGVyZSBpcyBubyAvdXNyL2Jpbi9weXRob24uIFNvIHRoZSBoeXBlcnZpc29yCj4gPj4+IGJ1aWxk
IGlzIGJyb2tlbiBiZWNhdXNlIHhlbi9pbmNsdWRlL2NvbXBpbGUuaCBpbnZva2VzCj4gPj4+Cj4g
Pj4+ICBAJChQWVRIT04pIHRvb2xzL2ZpZy10by1vY3QucHkgPCAuYmFubmVyID4+ICRALm5ldwo+
ID4+Pgo+ID4+PiBUaGVyZSBhcmUgb3RoZXIgYXBwZWFyYW5jZXMgb2YgUFlUSE9OIGluIGh5cGVy
dmlzb3IgYnVpbGQsIHdoaWNoIGFyZQo+ID4+PiBlcXVhbGx5IGJyb2tlbi4KPiA+Pj4KPiA+Pj4g
V2UgaGFkIC8gaGF2ZSBhIHBvbGljeSB0byBhdm9pZCBtYWtpbmcgaHlwZXJ2aXNvciBidWlsZCBk
ZXBlbmRlbnQgb24KPiA+Pj4gY29uZmlndXJlLiBJIGhhdmUgQ0MnZWQgbW9yZSBwZW9wbGUgb24g
dGhlaXIgb3BpbmlvbnMuCj4gPj4gV2hlcmUgaGFzICQoUFlUSE9OKSBnb3QgbG9zdD/CoCBJdCB3
YXMgc3BlY2lmaWVkIGNvcnJlY3RseSB0byBiZWdpbiB3aXRoLgo+ID4gV2hlcmUgaXMgaXQgc3Bl
Y2lmaWVkPwo+IAo+IE9oIC0gSSBzZWUgbm93Lgo+IAo+IEl0IGlzIHNwZWNpZmllZCBmb3IgLi9j
b25maWd1cmUsIGJ1dCBub3QgZm9yIG1ha2UuCgpSaWdodC4KCkl0IHdvcmtzIGZvciB0b29scyBi
ZWNhdXNlIHRvb2xzIGJ1aWxkIGluY2x1ZGVzIGNvbmZpZy9Ub29scy5tayB3aGljaApjb250YWlu
cyB0aGUgY29ycmVjdCBweXRob24gcGF0aC4gVG9vbHMubWsgaXMgZ2VuZXJhdGVkIGJ5IGNvbmZp
Z3VyZS4KIApPYnZpb3VzbHkgaHlwZXJ2aXNvciBidWlsZCBzaG91bGRuJ3QgaW5jbHVkZSBUb29s
cy5tay4gRnVydGhlcm1vcmUsIHRoZQpwb2xpY3kgb2YgImh2IHNob3VsZG4ndCBkZXBlbmQgb24g
Y29uZmlndXJlIiBtYWtlcyB0aGlzIHJvdXRlIGEgbm8tZ28uCgpFaXRoZXIgd2UgY2hhbmdlIHRo
ZSBwb2xpY3ksIG9yIHdlIGRvY3VtZW50IHRoZSBkZWZpY2llbmN5LCBvciB3ZSBjb21lCnVwIHdp
dGggc29tZSBjbGV2ZXIgdHJpY2sgdG8gcHJvYmUuCgpXZWkuCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
