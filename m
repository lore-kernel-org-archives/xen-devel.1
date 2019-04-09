Return-Path: <SRS0=7ods=SL=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_MUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FAA5C10F0E
	for <xen-devel@archiver.kernel.org>; Tue,  9 Apr 2019 10:50:56 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0125B2084C
	for <xen-devel@archiver.kernel.org>; Tue,  9 Apr 2019 10:50:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0125B2084C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hDoKo-0004wk-Hf; Tue, 09 Apr 2019 10:50:34 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=+Yc4=SL=citrix.com=prvs=99536ed25=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1hDoKn-0004wf-2o
 for xen-devel@lists.xenproject.org; Tue, 09 Apr 2019 10:50:33 +0000
X-Inumbo-ID: 4b9ac7e6-5ab5-11e9-92d7-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 4b9ac7e6-5ab5-11e9-92d7-bc764e045a96;
 Tue, 09 Apr 2019 10:50:31 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,329,1549929600"; d="scan'208";a="83093726"
Date: Tue, 9 Apr 2019 11:50:27 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Laszlo Ersek <lersek@redhat.com>
Message-ID: <20190409105027.GC1435@perard.uk.xensource.com>
References: <20190408142408.30419-1-anthony.perard@citrix.com>
 <6c00d5f5-e187-5fe2-8b3e-301ec51efb6b@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6c00d5f5-e187-5fe2-8b3e-301ec51efb6b@redhat.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Subject: Re: [Xen-devel] [PATCH v2 00/31] Specific platform to run OVMF in
 Xen PVH and HVM guests
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
Cc: Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Jordan Justen <jordan.l.justen@intel.com>, edk2-devel@lists.01.org,
 Leif Lindholm <leif.lindholm@linaro.org>, Julien Grall <julien.grall@arm.com>,
 xen-devel@lists.xenproject.org, edk2-devel-groups-io <devel@edk2.groups.io>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190409105027.5MQAx7Z37qtmscw7358thFyzGt9Fi8sVdBH5QZGH1Xc@z>

T24gTW9uLCBBcHIgMDgsIDIwMTkgYXQgMDU6NTA6NTdQTSArMDIwMCwgTGFzemxvIEVyc2VrIHdy
b3RlOgo+IE9uIDA0LzA4LzE5IDE2OjIzLCBBbnRob255IFBFUkFSRCB3cm90ZToKPiA+IFF1ZXN0
aW9uOgo+ID4KPiA+IFNob3VsZCB3ZSBzdGFydCBtb3ZpbmcgdGhlc2UgdG8gYSBkaWZmZXJlbnQg
KlBrZz8gTGlrZSBpdCdzIGRvbmUgZm9yCj4gPiBBcm1Qa2cgYW5kIEFybVZpcnRQa2c/ICBNYXli
ZSBYZW5Qa2cuCj4gCj4gSSdtIHByZXR0eSBoYXBweSB3aXRoIHRoZSBjdXJyZW50IHBhY2thZ2Ug
c3RydWN0dXJlLiBBcm1Qa2cgaXMgZm9yIGJvdGgKPiBwaHlzaWNhbCBhbmQgdmlydHVhbCBoYXJk
d2FyZS4gQXJtVmlydFBrZyBpcyB2aXJ0LW9ubHksIGFuZCB3ZSBhbHJlYWR5Cj4gaGF2ZSBzZXBh
cmF0ZSBwbGF0Zm9ybSBEU0NzL0ZERnMgYmV0d2VlbiBYZW4gKEFybVZpcnRYZW4pIGFuZCBRRU1V
L0tWTQo+IChBcm1WaXJ0UWVtdVtLZXJuZWxdKS4gWGVuLSBhbmQgUUVNVS9LVk0tc3BlY2lmaWMg
ZHJpdmVycyBhbmQgbGlicmFyeQo+IGluc3RhbmNlcyBwZWFjZWZ1bGx5IGNvZXhpc3QgdW5kZXIg
QXJtVmlydFBrZzsgdGhlIERTQ3MvRkRGcyBpbmNsdWRlCj4gdGhlbSBhcyBhcHByb3ByaWF0ZS4K
PiAKPiBUaGUgc2FtZSBzaG91bGQgbWFwIG5pY2VseSB0byBPdm1mUGtnLiB4ODYgc3R1ZmYgdGhh
dCB0YXJnZXRzIGJvdGgKPiBwaHlzaWNhbCBhbmQgdmlydHVhbCBoYXJkd2FyZSBiZWxvbmdzIHVu
ZGVyIFBjQXRDaGlwc2V0UGtnIGFuZAo+IFVlZmlDcHVQa2cuIFZpcnQtb25seSBzdHVmZiBzaG91
bGQgZ28gdW5kZXIgT3ZtZlBrZzsgWGVuLXNwZWNpZmljIGFuZAo+IFFFTVUvS1ZNLXNwZWNpZmlj
IG1vZHVsZXMgY2FuIGNvZXhpc3QgdW5kZXIgT3ZtZlBrZy4gSXQncyBzdWZmaWNpZW50IGlmCj4g
dGhlIHBsYXRmb3JtIERTQ3MgY2hlcnJ5LXBpY2sgdGhlbSBhcyBhcHByb3ByaWF0ZS4KClRoYW5r
cyBmb3IgdGhlIGZlZWRiYWNrLCB0aGF0IHNvdW5kcyBnb29kLgoKPiA+IFRvIGJ1aWxkIGFuZCBi
b290Ogo+ID4KPiA+IFRvIGJ1aWxkLCBzaW1wbHkgcnVuIE92bWZQa2cvYnVpbGQuc2ggLXAgT3Zt
ZlBrZy9YZW5Pdm1mLmRzYwo+IAo+ICgxKSBUbyBzdGljayB3aXRoIHRoZSBBcm1WaXJ0IHBhdHRl
cm4sIHdlIHNob3VsZCBpbml0aWFsbHkgY2FsbCB0aGlzCj4gcGxhdGZvcm0gT3ZtZlhlbi4KCkkn
bGwgcmVuYW1lIGl0IGluIHYzLgoKPiAoMykgUGxlYXNlIGZpbGUgYSBCWiBhdCA8aHR0cHM6Ly9i
dWd6aWxsYS50aWFub2NvcmUub3JnLz4gYWJvdXQgdGhpcwo+IGZlYXR1cmUsIGFuZCBhc3NpZ24g
aXQgdG8geW91cnNlbGYuIFRoZSBCWiBzaG91bGQga2VlcCB0cmFjayBvZiBhbGwKPiB2ZXJzaW9u
cyBvZiB0aGUgcGF0Y2ggc2VyaWVzIChmcm9tIHRoZSBtYWlsaW5nIGxpc3QgYXJjaGl2ZSkuCgpE
b25lOiBodHRwczovL2J1Z3ppbGxhLnRpYW5vY29yZS5vcmcvc2hvd19idWcuY2dpP2lkPTE2ODkK
SSdsbCBhZGQgdGhlIGxpbmtzIGZvciB0aGUgcGF0Y2ggc2VyaWVzIG9uY2UgdGhlcmUgaXMgb25l
IGZvciB2Mi4KCj4gKDUpIFRoZSBCWiBzaG91bGQgYmUgcmVmZXJlbmNlZCBpbiBhbGwgdGhlIGNv
bW1pdCBtZXNzYWdlcy4KCkknbGwgZG8gdGhhdCBpbiB2My4KCj4gKDYpIFRoZSBuZXcgZWRrMiBk
ZXZlbG9wbWVudCBtYWlsaW5nIGxpc3QgaXMgYXQ6Cgo6LSgKCj4gaHR0cHM6Ly9lZGsyLmdyb3Vw
cy5pby9nL2RldmVsCj4gCj4gUGxlYXNlIHN1YnNjcmliZSB0aGVyZSwgYW5kIHJlc2VuZCB0aGlz
IHNlcmllcyB0byB0aGF0IGFkZHJlc3MsIGkuZS4KPiA8ZGV2ZWxAZWRrMi5ncm91cHMuaW8+LiBJ
J20gQ0MnaW5nIHRoZSBuZXcgYWRkcmVzcyBteXNlbGYsIGZvciB0aGlzCj4gaW5pdGlhbCByZXNw
b25zZSwgYnV0IEknZCBwcmVmZXIgdGhlIHJlc3Qgb2YgbXkgY29tbWVudHMgdG8gZ28gb25seSB0
bwo+IHRoZSBuZXcgbGlzdCAod2l0aG91dCBtYW51YWxseSB1cGRhdGluZyB0aGUgQ0MgbGlzdCBv
biBldmVyeSByZXNwb25zZSkuCgpJJ20gYWJvdXQgdG8gZG8gdGhhdC4KClRoYW5rcywKCi0tIApB
bnRob255IFBFUkFSRAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
