From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH] libxl: fix libxl_domain_need_memory after
 899433f149d
Date: Mon, 20 May 2019 10:21:44 +0100
Message-ID: <20190520092144.GT2798@zion.uk.xensource.com>
References: <20190517170555.17423-1-wei.liu2@citrix.com>
 <20190520091435.k4txcb4m3lx7n4py@Air-de-Roger>
 <236744ae-6faa-d543-3450-2da58019e117@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=R9VY=TU=citrix.com=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1hSeUR-0002fE-C3
 for xen-devel@lists.xenproject.org; Mon, 20 May 2019 09:21:51 +0000
Content-Disposition: inline
In-Reply-To: <236744ae-6faa-d543-3450-2da58019e117@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Juergen Gross <jgross@suse.com>, Olaf Hering <olaf@aepfle.de>, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>, Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBNYXkgMjAsIDIwMTkgYXQgMTA6MTk6MjZBTSArMDEwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBPbiAyMC8wNS8yMDE5IDEwOjE0LCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOgo+ID4K
PiA+PiBkaWZmIC0tZ2l0IGEvdG9vbHMvbGlieGwvbGlieGxfbWVtLmMgYi90b29scy9saWJ4bC9s
aWJ4bF9tZW0uYwo+ID4+IGluZGV4IDQ0OGEyYWY4ZmQuLmZlMWY5YzJmZjggMTAwNjQ0Cj4gPj4g
LS0tIGEvdG9vbHMvbGlieGwvbGlieGxfbWVtLmMKPiA+PiArKysgYi90b29scy9saWJ4bC9saWJ4
bF9tZW0uYwo+ID4+IEBAIC00NTcsNiArNDU3LDI0IEBAIGludCBsaWJ4bF9kb21haW5fbmVlZF9t
ZW1vcnkobGlieGxfY3R4ICpjdHgsCj4gPj4gICAgICBsaWJ4bF9kb21haW5fYnVpbGRfaW5mb19p
bml0KGJfaW5mbyk7Cj4gPj4gICAgICBsaWJ4bF9kb21haW5fYnVpbGRfaW5mb19jb3B5KGN0eCwg
Yl9pbmZvLCBiX2luZm9faW4pOwo+ID4+ICAKPiA+PiArICAgIC8qCj4gPj4gKyAgICAgKiBJdCBo
YXMgYmVjb21lIGEgcmVxdWlyZW1lbnQgdGhhdCB0byBmaWd1cmUgb3V0IHdoaWNoIFFFTVUgdG8K
PiA+PiArICAgICAqIHVzZSwgbGlieGwgd2lsbCBuZWVkIHRvIHBlZWsgZF9jb25maWcncyBjb250
ZW50LiBUaGUgY29kZSBoYXMKPiA+PiArICAgICAqIGJlZW4gY2hhbmdlZCBzdWNoIHRoYXQgb25l
IHdpbGwgbmVlZCB0byBjYWxsCj4gPj4gKyAgICAgKiBsaWJ4bF9fZG9tYWluX3NldF9kZXZpY2Vf
bW9kZWwgYmVmb3JlIGNhbGxpbmcKPiA+PiArICAgICAqIGxpYnhsX19kb21haW5fYnVpbGRfaW5m
b19zZXRkZWZhdWx0IGluc2lkZSBsaWJ4bC4KPiA+PiArICAgICAqCj4gPj4gKyAgICAgKiBUaGlz
IChwcm9ibGVtYXRpYykgcHVibGljIEFQSSBpcyB0aGUgb25seSBvbmUgd2hpY2ggdGFrZXMgYQo+
ID4+ICsgICAgICogYl9pbmZvLCBpbXBvc2luZyB0aGUgc2FtZSByZXF1aXJlbWVudCBvbiB0aGUg
dXNlcnMgb2YgdGhpcwo+ID4+ICsgICAgICogcHVibGljIEFQSSB3aWxsIGJyZWFrIHRoZW0uCj4g
Cj4gVGhpcyBzZW50ZW5jZSBkb2Vzbid0IHF1aXRlIHBhcnNlLsKgIFlvdSBlaXRoZXIgd2FudCAi
Yl9pbmZvLsKgIEltcG9zaW5nIiwKPiBvciBzb21ldGhpbmcgbGlrZSAiYl9pbmZvLCBhbmQgaW1w
b3NpbmciLgoKWWVwLiBBbHJlYWR5IGZpeGVkIGluIG15IGxvY2FsIGNvcHkuCgpJIHNlbnQgYW4g
ZW1haWwgdmlhIHhlbi5vcmcgYWRkcmVzcyB0byB0aGF0IGVmZmVjdCBidXQgaXQgZGlkbid0IGNv
bWUKdGhyb3VnaC4KCldlaS4KCj4gCj4gfkFuZHJldwoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
