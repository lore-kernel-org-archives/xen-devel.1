Return-Path: <SRS0=ZpmR=ST=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 976C9C282DC
	for <xen-devel@archiver.kernel.org>; Wed, 17 Apr 2019 10:42:04 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6DA492173C
	for <xen-devel@archiver.kernel.org>; Wed, 17 Apr 2019 10:42:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6DA492173C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hGi0e-0008BB-VW; Wed, 17 Apr 2019 10:41:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=f/qU=ST=citrix.com=prvs=0034167b4=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1hGi0d-0008B5-4G
 for xen-devel@lists.xenproject.org; Wed, 17 Apr 2019 10:41:43 +0000
X-Inumbo-ID: 613fdbf8-60fd-11e9-8bcb-5b05656bc32e
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 613fdbf8-60fd-11e9-8bcb-5b05656bc32e;
 Wed, 17 Apr 2019 10:41:39 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,361,1549929600"; d="scan'208";a="83777284"
Date: Wed, 17 Apr 2019 11:41:36 +0100
From: Wei Liu <wei.liu2@citrix.com>
To: Kevin Buckley <kevin.buckley.ecs.vuw.ac.nz@gmail.com>
Message-ID: <20190417104136.GR30543@zion.uk.xensource.com>
References: <CABwOO=dhCrnZpRNpLr7rDrNdSh9GCH=fqq_50+YScWT4BE-xjQ@mail.gmail.com>
 <20190411102843.GE30543@zion.uk.xensource.com>
 <CABwOO=cOxxk7sbscGRzZ1LuiH8JJnCoBJ2d19ZmaSeu5DBi6iw@mail.gmail.com>
 <20190415092358.GM30543@zion.uk.xensource.com>
 <CABwOO=fSCMfqqay_ZD7FjvoLWjW8PUyyVze9d1s43v=KFDFsXA@mail.gmail.com>
 <20190417095657.GQ30543@zion.uk.xensource.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190417095657.GQ30543@zion.uk.xensource.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: [Xen-devel] Hypervisor build can't work without `python` (Was: Re:
 Xen commit 9b0bc91b3 possibly removed too much info from README)
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
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien.grall@arm.com>,
 Jan Beulich <JBeulich@suse.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190417104136.btMCyBo24vh7JG7g9wmIgH4ujVq_Ip78lDGkmSbbWrc@z>

T24gV2VkLCBBcHIgMTcsIDIwMTkgYXQgMTA6NTY6NTdBTSArMDEwMCwgV2VpIExpdSB3cm90ZToK
PiA+IAo+ID4gSGVyZSdzIHdoYXQgaSBkaWQgaGF2aW5nIHB1bGxlZCB0aGUgbWFzdGVyIGF0IGNv
bW1pdCBjYjcwYTI2Cj4gPiAKPiA+IHRhciB4ZiAvcGF0aC90by94ZW4tY2I3MGEyNi50YXIuZ3oK
PiA+IAo+ID4gY2QgeGVuLW1hc3Rlci8KPiA+IAo+ID4gUFlUSE9OPS91c3IvYmluL3B5dGhvbjMg
Li9jb25maWd1cmUgLS1wcmVmaXg9L3VzciAgIFwKPiA+ICAgIC0tZGlzYWJsZS1zZWFiaW9zICAg
XAo+ID4gICAgLS1kaXNhYmxlLXFlbXUtdHJhZGl0aW9uYWwgIFwKPiA+ICAgIC0tZGlzYWJsZS1y
b21iaW9zICAgICBcCj4gPiAgICAtLWRpc2FibGUtc3R1YmRvbSAyPiYxIHwgdGVlIC4uL2NvbmZp
Zy5sb2cKPiA+IAo+ID4gbWFrZSBFRklfRElSPS91c3IvbGliL2VmaSB3b3JsZCAyPiYxIHwgdGVl
IC4uL21ha2Vfd29ybGRfMy5vdXQKPiA+IAo+ID4gCj4gPiAuLi4KPiA+IGdjYyAtV3AsLU1ELHRv
b2xzL2tjb25maWcvLnpjb25mLnRhYi5vLmQgICAgLURfR05VX1NPVVJDRQo+ID4gLURfREVGQVVM
VF9TT1VSQ0UgLURDVVJTRVNfTE9DPSI8bmN1cnNlcy5oPiIgLUROQ1VSU0VTX1dJREVDSEFSPTEK
PiA+IC1ETE9DQUxFICAtSXRvb2xzL2tjb25maWcgLWMgLW8gdG9vbHMva2NvbmZpZy96Y29uZi50
YWIubwo+ID4gdG9vbHMva2NvbmZpZy96Y29uZi50YWIuYwo+ID4gZ2NjICAtbyB0b29scy9rY29u
ZmlnL2NvbmYgdG9vbHMva2NvbmZpZy9jb25mLm8gdG9vbHMva2NvbmZpZy96Y29uZi50YWIubwo+
ID4gdG9vbHMva2NvbmZpZy9jb25mIC1zIC0tc2lsZW50b2xkY29uZmlnIEtjb25maWcKPiA+IG1h
a2VbM106IExlYXZpbmcgZGlyZWN0b3J5ICcvdXNyL3NyYy94ZW4veGVuLW1hc3Rlci94ZW4nCj4g
PiBtYWtlIC1mIFJ1bGVzLm1rIF9pbnN0YWxsCj4gPiBtYWtlWzNdOiBFbnRlcmluZyBkaXJlY3Rv
cnkgJy91c3Ivc3JjL3hlbi94ZW4tbWFzdGVyL3hlbicKPiA+IG1ha2UgLUMgdG9vbHMKPiA+IG1h
a2VbNF06IEVudGVyaW5nIGRpcmVjdG9yeSAnL3Vzci9zcmMveGVuL3hlbi1tYXN0ZXIveGVuL3Rv
b2xzJwo+ID4gbWFrZSBzeW1ib2xzCj4gPiBtYWtlWzVdOiBFbnRlcmluZyBkaXJlY3RvcnkgJy91
c3Ivc3JjL3hlbi94ZW4tbWFzdGVyL3hlbi90b29scycKPiA+IGdjYyAtV2FsbCAtV2Vycm9yIC1X
c3RyaWN0LXByb3RvdHlwZXMgLU8yIC1mb21pdC1mcmFtZS1wb2ludGVyCj4gPiAtZm5vLXN0cmlj
dC1hbGlhc2luZyAtV2RlY2xhcmF0aW9uLWFmdGVyLXN0YXRlbWVudCAtbyBzeW1ib2xzCj4gPiBz
eW1ib2xzLmMKPiA+IG1ha2VbNV06IExlYXZpbmcgZGlyZWN0b3J5ICcvdXNyL3NyYy94ZW4veGVu
LW1hc3Rlci94ZW4vdG9vbHMnCj4gPiBtYWtlWzRdOiBMZWF2aW5nIGRpcmVjdG9yeSAnL3Vzci9z
cmMveGVuL3hlbi1tYXN0ZXIveGVuL3Rvb2xzJwo+ID4gbWFrZSAtZiAvdXNyL3NyYy94ZW4veGVu
LW1hc3Rlci94ZW4vUnVsZXMubWsgaW5jbHVkZS94ZW4vY29tcGlsZS5oCj4gPiBtYWtlWzRdOiBF
bnRlcmluZyBkaXJlY3RvcnkgJy91c3Ivc3JjL3hlbi94ZW4tbWFzdGVyL3hlbicKPiA+ICBYZW4g
NC4xMy11bnN0YWJsZQo+ID4gL2Jpbi9zaDogcHl0aG9uOiBjb21tYW5kIG5vdCBmb3VuZAo+ID4g
bWFrZVs0XTogKioqIFtNYWtlZmlsZToxNjk6IGluY2x1ZGUveGVuL2NvbXBpbGUuaF0gRXJyb3Ig
MTI3Cj4gCj4gSGVyZS4gVGhlIFBZVEhPTiBpbnZvY2F0aW9uIGlzIGZyb20gdGhlIGh5cGVydmlz
b3IgYnVpbGQsIG5vdCB0aGUgdG9vbHMKPiBidWlsZC4KPiAKPiBUaGFua3MgZm9yIHRoZSBsb2cu
ICBJIHdpbGwgaGF2ZSBhIGNsb3NlciBsb29rLgo+IAo+ID4gbWFrZVs0XTogTGVhdmluZyBkaXJl
Y3RvcnkgJy91c3Ivc3JjL3hlbi94ZW4tbWFzdGVyL3hlbicKPiA+IG1ha2VbM106ICoqKiBbTWFr
ZWZpbGU6MTM3OiAvdXNyL3NyYy94ZW4veGVuLW1hc3Rlci94ZW4veGVuXSBFcnJvciAyCj4gPiBt
YWtlWzNdOiBMZWF2aW5nIGRpcmVjdG9yeSAnL3Vzci9zcmMveGVuL3hlbi1tYXN0ZXIveGVuJwo+
ID4gbWFrZVsyXTogKioqIFtNYWtlZmlsZTo0NTogaW5zdGFsbF0gRXJyb3IgMgo+ID4gbWFrZVsy
XTogTGVhdmluZyBkaXJlY3RvcnkgJy91c3Ivc3JjL3hlbi94ZW4tbWFzdGVyL3hlbicKPiA+IG1h
a2VbMV06ICoqKiBbTWFrZWZpbGU6MTIzOiBpbnN0YWxsLXhlbl0gRXJyb3IgMgo+ID4gbWFrZVsx
XTogTGVhdmluZyBkaXJlY3RvcnkgJy91c3Ivc3JjL3hlbi94ZW4tbWFzdGVyJwo+ID4gbWFrZTog
KioqIFtNYWtlZmlsZToxNjU6IHdvcmxkXSBFcnJvciAyCj4gPiAKPiA+IAo+ID4gTm90ZSB0aGUK
PiA+IAo+ID4gL2Jpbi9zaDogcHl0aG9uOiBjb21tYW5kIG5vdCBmb3VuZAo+ID4gCgpUaGUgaXNz
dWUgaGVyZSBpcyBvbiBMRlMgdGhlcmUgaXMgbm8gL3Vzci9iaW4vcHl0aG9uLiBTbyB0aGUgaHlw
ZXJ2aXNvcgpidWlsZCBpcyBicm9rZW4gYmVjYXVzZSB4ZW4vaW5jbHVkZS9jb21waWxlLmggaW52
b2tlcwoKIEAkKFBZVEhPTikgdG9vbHMvZmlnLXRvLW9jdC5weSA8IC5iYW5uZXIgPj4gJEAubmV3
CgpUaGVyZSBhcmUgb3RoZXIgYXBwZWFyYW5jZXMgb2YgUFlUSE9OIGluIGh5cGVydmlzb3IgYnVp
bGQsIHdoaWNoIGFyZQplcXVhbGx5IGJyb2tlbi4KCldlIGhhZCAvIGhhdmUgYSBwb2xpY3kgdG8g
YXZvaWQgbWFraW5nIGh5cGVydmlzb3IgYnVpbGQgZGVwZW5kZW50IG9uCmNvbmZpZ3VyZS4gSSBo
YXZlIENDJ2VkIG1vcmUgcGVvcGxlIG9uIHRoZWlyIG9waW5pb25zLgoKV2VpLgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
