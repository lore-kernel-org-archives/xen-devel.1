Return-Path: <SRS0=ZpmR=ST=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_MUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFD0DC10F12
	for <xen-devel@archiver.kernel.org>; Wed, 17 Apr 2019 09:57:16 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8544520835
	for <xen-devel@archiver.kernel.org>; Wed, 17 Apr 2019 09:57:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8544520835
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hGhJP-00049N-F8; Wed, 17 Apr 2019 09:57:03 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=f/qU=ST=citrix.com=prvs=0034167b4=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1hGhJN-00049G-LP
 for xen-devel@lists.xenproject.org; Wed, 17 Apr 2019 09:57:01 +0000
X-Inumbo-ID: 24553f5c-60f7-11e9-92d7-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 24553f5c-60f7-11e9-92d7-bc764e045a96;
 Wed, 17 Apr 2019 09:56:59 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,361,1549929600"; d="scan'208";a="83774873"
Date: Wed, 17 Apr 2019 10:56:57 +0100
From: Wei Liu <wei.liu2@citrix.com>
To: Kevin Buckley <kevin.buckley.ecs.vuw.ac.nz@gmail.com>
Message-ID: <20190417095657.GQ30543@zion.uk.xensource.com>
References: <CABwOO=dhCrnZpRNpLr7rDrNdSh9GCH=fqq_50+YScWT4BE-xjQ@mail.gmail.com>
 <20190411102843.GE30543@zion.uk.xensource.com>
 <CABwOO=cOxxk7sbscGRzZ1LuiH8JJnCoBJ2d19ZmaSeu5DBi6iw@mail.gmail.com>
 <20190415092358.GM30543@zion.uk.xensource.com>
 <CABwOO=fSCMfqqay_ZD7FjvoLWjW8PUyyVze9d1s43v=KFDFsXA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CABwOO=fSCMfqqay_ZD7FjvoLWjW8PUyyVze9d1s43v=KFDFsXA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: Re: [Xen-devel] Xen commit 9b0bc91b3 possibly removed too much info
 from README
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
Cc: xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190417095657.7XlyDmg0OJtjpPrWHZ6l8ozeHwDcx-8Lic9-AvCg_bE@z>

T24gVHVlLCBBcHIgMTYsIDIwMTkgYXQgMDk6Mjg6MDFQTSArMDgwMCwgS2V2aW4gQnVja2xleSB3
cm90ZToKPiBPbiBNb24sIDE1IEFwciAyMDE5IGF0IDE3OjI0LCBXZWkgTGl1IDx3ZWkubGl1MkBj
aXRyaXguY29tPiB3cm90ZToKPiA+Cj4gPiBPbiBTYXQsIEFwciAxMywgMjAxOSBhdCAxMToxNzo0
OEFNICswODAwLCBLZXZpbiBCdWNrbGV5IHdyb3RlOgo+ID4gPiBPbiBUaHUsIDExIEFwciAyMDE5
IGF0IDE4OjI5LCBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPiB3cm90ZToKPiA+ID4gPgo+
ID4gPiA+IC4uLgo+ID4gPiA+IFN1cmUuIEkgd2lsbCB3cml0ZSBhIHBhdGNoLgo+ID4gPiA+Cj4g
PiA+ID4gV2VpLgo+ID4gPgo+ID4gPiBDb3VwbGUgb2Ygb3RoZXIgdGhpbmdzIEkgbm90aWNlZCBh
ZnRlciBwb3N0aW5nIHRoZSBvcmlnaW5hbCBvYnNlcnZhdGlvbiwKPiA+ID4gdGhhdCBtaWdodCBi
ZSBvZiB1c2UgaW4gcGF0Y2hpbmcgdGhlIGRvY3VtZW50YXRpb24KPiA+ID4KPiA+ID4gMSkKPiA+
ID4KPiA+ID4gVGhlIHRvb2xzL01ha2VmaWxlIGhhcyBhIGJhcmUgUFlUSE9OIEVudlZhciB0aGF0
IGlzbid0IHNlZW1pbmdseQo+ID4gPiByZXBsYWNlZCBieSB0aGUgUFlUSE9OPSB2YWx1ZSBzdXBw
bGllZCB0byBjb25maWd1cmUsIHNvIEkgYWxzbwo+ID4gPiBuZWVkZWQgdG8gc3BlY2lmeSB0aGUK
PiA+ID4KPiA+ID4gUFlUSE9OPS9wYXRoL3RvL2ludGVycHJldGVyCj4gPiA+Cj4gPiA+IGFzIGFu
IGFyZ3VtZW50IHRvIHRoZSAibWFrZSB3b3JsZCIgYXMgd2VsbCBhcyB0byB0aGUgY29uZmlndXJl
Lgo+ID4KPiA+IFRoZSBvbmx5IGFwcGVhcmFuY2Ugb2YgUFlUSE9OIGluIHRvb2xzL01ha2VmaWxl
IGlzIGluIHRoZSBxZW11IGJ1aWxkLgo+ID4gSXQgYWxyZWFkeSBoYXMgdGhlIHJpZ2h0IGZvcm0u
Cj4gPgo+ID4gSSB0ZXN0ZWQgdGhlIGZvbGxvd2luZzoKPiA+Cj4gPiAgICAgJCBQWVRIT049L3Vz
ci9iaW4vcHl0aG9uMyAuL2NvbmZpZ3VyZQo+ID4gICAgICQgbWFrZSAtajggd29ybGQgMj4mMSB8
IHRlZSBsb2cgIyBicm9rZW4gYXRtIHVuZm9ydHVuYXRlbHkKPiA+ICAgICAkIG1ha2UgLUMgdG9v
bHMgc3ViZGlyLWFsbC1xZW11LXhlbi1kaXIgIyB0aGUgcnVuZSB3aGljaCBoYXMgUFlUSE9OIGlu
IGl0Cj4gPgo+ID4gQW5kIHRoZW4gSSBsb29rZWQgZm9yIHRoZSByZWxldmFudCBiaXRzIGluIGxv
ZzoKPiA+Cj4gPiBQS0dfQ09ORklHX1BBVEg9L2xvY2FsL3dvcmsveGVuLmdpdC90b29scy8uLi90
b29scy9wa2ctY29uZmlnJHtQS0dfQ09ORklHX1BBVEg6Kzoke1BLR19DT05GSUdfUEFUSH19IFwK
PiA+ICRzb3VyY2UvY29uZmlndXJlIC0tZW5hYmxlLXhlbiAtLXRhcmdldC1saXN0PWkzODYtc29m
dG1tdSBcCj4gPiAgICAgICAgIC4uLi4KPiA+ICAgICAgICAgLS1weXRob249cHl0aG9uMyBcCj4g
Pgo+ID4gTm90IHN1cmUgd2hpY2ggYmFyZSBQWVRIT04gRW52VmFyIHlvdSByZWZlcnJlZCB0by4g
Q2FuIHlvdSBjbGFyaWZ5Pwo+IAo+IAo+IEhlcmUncyB3aGF0IGkgZGlkIGhhdmluZyBwdWxsZWQg
dGhlIG1hc3RlciBhdCBjb21taXQgY2I3MGEyNgo+IAo+IHRhciB4ZiAvcGF0aC90by94ZW4tY2I3
MGEyNi50YXIuZ3oKPiAKPiBjZCB4ZW4tbWFzdGVyLwo+IAo+IFBZVEhPTj0vdXNyL2Jpbi9weXRo
b24zIC4vY29uZmlndXJlIC0tcHJlZml4PS91c3IgICBcCj4gICAgLS1kaXNhYmxlLXNlYWJpb3Mg
ICBcCj4gICAgLS1kaXNhYmxlLXFlbXUtdHJhZGl0aW9uYWwgIFwKPiAgICAtLWRpc2FibGUtcm9t
YmlvcyAgICAgXAo+ICAgIC0tZGlzYWJsZS1zdHViZG9tIDI+JjEgfCB0ZWUgLi4vY29uZmlnLmxv
Zwo+IAo+IG1ha2UgRUZJX0RJUj0vdXNyL2xpYi9lZmkgd29ybGQgMj4mMSB8IHRlZSAuLi9tYWtl
X3dvcmxkXzMub3V0Cj4gCj4gCj4gLi4uCj4gZ2NjIC1XcCwtTUQsdG9vbHMva2NvbmZpZy8uemNv
bmYudGFiLm8uZCAgICAtRF9HTlVfU09VUkNFCj4gLURfREVGQVVMVF9TT1VSQ0UgLURDVVJTRVNf
TE9DPSI8bmN1cnNlcy5oPiIgLUROQ1VSU0VTX1dJREVDSEFSPTEKPiAtRExPQ0FMRSAgLUl0b29s
cy9rY29uZmlnIC1jIC1vIHRvb2xzL2tjb25maWcvemNvbmYudGFiLm8KPiB0b29scy9rY29uZmln
L3pjb25mLnRhYi5jCj4gZ2NjICAtbyB0b29scy9rY29uZmlnL2NvbmYgdG9vbHMva2NvbmZpZy9j
b25mLm8gdG9vbHMva2NvbmZpZy96Y29uZi50YWIubwo+IHRvb2xzL2tjb25maWcvY29uZiAtcyAt
LXNpbGVudG9sZGNvbmZpZyBLY29uZmlnCj4gbWFrZVszXTogTGVhdmluZyBkaXJlY3RvcnkgJy91
c3Ivc3JjL3hlbi94ZW4tbWFzdGVyL3hlbicKPiBtYWtlIC1mIFJ1bGVzLm1rIF9pbnN0YWxsCj4g
bWFrZVszXTogRW50ZXJpbmcgZGlyZWN0b3J5ICcvdXNyL3NyYy94ZW4veGVuLW1hc3Rlci94ZW4n
Cj4gbWFrZSAtQyB0b29scwo+IG1ha2VbNF06IEVudGVyaW5nIGRpcmVjdG9yeSAnL3Vzci9zcmMv
eGVuL3hlbi1tYXN0ZXIveGVuL3Rvb2xzJwo+IG1ha2Ugc3ltYm9scwo+IG1ha2VbNV06IEVudGVy
aW5nIGRpcmVjdG9yeSAnL3Vzci9zcmMveGVuL3hlbi1tYXN0ZXIveGVuL3Rvb2xzJwo+IGdjYyAt
V2FsbCAtV2Vycm9yIC1Xc3RyaWN0LXByb3RvdHlwZXMgLU8yIC1mb21pdC1mcmFtZS1wb2ludGVy
Cj4gLWZuby1zdHJpY3QtYWxpYXNpbmcgLVdkZWNsYXJhdGlvbi1hZnRlci1zdGF0ZW1lbnQgLW8g
c3ltYm9scwo+IHN5bWJvbHMuYwo+IG1ha2VbNV06IExlYXZpbmcgZGlyZWN0b3J5ICcvdXNyL3Ny
Yy94ZW4veGVuLW1hc3Rlci94ZW4vdG9vbHMnCj4gbWFrZVs0XTogTGVhdmluZyBkaXJlY3Rvcnkg
Jy91c3Ivc3JjL3hlbi94ZW4tbWFzdGVyL3hlbi90b29scycKPiBtYWtlIC1mIC91c3Ivc3JjL3hl
bi94ZW4tbWFzdGVyL3hlbi9SdWxlcy5tayBpbmNsdWRlL3hlbi9jb21waWxlLmgKPiBtYWtlWzRd
OiBFbnRlcmluZyBkaXJlY3RvcnkgJy91c3Ivc3JjL3hlbi94ZW4tbWFzdGVyL3hlbicKPiAgWGVu
IDQuMTMtdW5zdGFibGUKPiAvYmluL3NoOiBweXRob246IGNvbW1hbmQgbm90IGZvdW5kCj4gbWFr
ZVs0XTogKioqIFtNYWtlZmlsZToxNjk6IGluY2x1ZGUveGVuL2NvbXBpbGUuaF0gRXJyb3IgMTI3
CgpIZXJlLiBUaGUgUFlUSE9OIGludm9jYXRpb24gaXMgZnJvbSB0aGUgaHlwZXJ2aXNvciBidWls
ZCwgbm90IHRoZSB0b29scwpidWlsZC4KClRoYW5rcyBmb3IgdGhlIGxvZy4gIEkgd2lsbCBoYXZl
IGEgY2xvc2VyIGxvb2suCgo+IG1ha2VbNF06IExlYXZpbmcgZGlyZWN0b3J5ICcvdXNyL3NyYy94
ZW4veGVuLW1hc3Rlci94ZW4nCj4gbWFrZVszXTogKioqIFtNYWtlZmlsZToxMzc6IC91c3Ivc3Jj
L3hlbi94ZW4tbWFzdGVyL3hlbi94ZW5dIEVycm9yIDIKPiBtYWtlWzNdOiBMZWF2aW5nIGRpcmVj
dG9yeSAnL3Vzci9zcmMveGVuL3hlbi1tYXN0ZXIveGVuJwo+IG1ha2VbMl06ICoqKiBbTWFrZWZp
bGU6NDU6IGluc3RhbGxdIEVycm9yIDIKPiBtYWtlWzJdOiBMZWF2aW5nIGRpcmVjdG9yeSAnL3Vz
ci9zcmMveGVuL3hlbi1tYXN0ZXIveGVuJwo+IG1ha2VbMV06ICoqKiBbTWFrZWZpbGU6MTIzOiBp
bnN0YWxsLXhlbl0gRXJyb3IgMgo+IG1ha2VbMV06IExlYXZpbmcgZGlyZWN0b3J5ICcvdXNyL3Ny
Yy94ZW4veGVuLW1hc3RlcicKPiBtYWtlOiAqKiogW01ha2VmaWxlOjE2NTogd29ybGRdIEVycm9y
IDIKPiAKPiAKPiBOb3RlIHRoZQo+IAo+IC9iaW4vc2g6IHB5dGhvbjogY29tbWFuZCBub3QgZm91
bmQKPiAKPiB3aGlsc3QsIGluIHRoZSB0b29scy9NYWtlZmlsZSwsIEkgc2VlCgpJIHRoaW5rIHRv
b2xzIGJ1aWxkIGlzIGZpbmUuIEl0J3MgaHlwZXJ2aXNvciBidWlsZCB0aGF0IGlzIGJyb2tlbi4K
CgpXZWkuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
