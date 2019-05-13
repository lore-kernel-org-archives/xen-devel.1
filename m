From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v4] libxl: fix migration of PV and PVH domUs
 with and without qemu
Date: Mon, 13 May 2019 15:42:16 +0100
Message-ID: <20190513144216.GS2798@zion.uk.xensource.com>
References: <20190510152047.17299-1-olaf@aepfle.de>
 <20190513143733.2xodq4nexe7n6er2@Air-de-Roger>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=rpFc=TN=citrix.com=prvs=0298122e9=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1hQC9v-0003ci-Rd
 for xen-devel@lists.xenproject.org; Mon, 13 May 2019 14:42:31 +0000
Content-Disposition: inline
In-Reply-To: <20190513143733.2xodq4nexe7n6er2@Air-de-Roger>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Cc: Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org, Olaf Hering <olaf@aepfle.de>, Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBNYXkgMTMsIDIwMTkgYXQgMDQ6Mzc6MzNQTSArMDIwMCwgUm9nZXIgUGF1IE1vbm7D
qSB3cm90ZToKPiA+IGRpZmYgLS1naXQgYS90b29scy9saWJ4bC9saWJ4bF90eXBlcy5pZGwgYi90
b29scy9saWJ4bC9saWJ4bF90eXBlcy5pZGwKPiA+IGluZGV4IGNiNDcwMmZkN2EuLjdkNzViZDM4
NTAgMTAwNjQ0Cj4gPiAtLS0gYS90b29scy9saWJ4bC9saWJ4bF90eXBlcy5pZGwKPiA+ICsrKyBi
L3Rvb2xzL2xpYnhsL2xpYnhsX3R5cGVzLmlkbAo+ID4gQEAgLTEwNiw2ICsxMDYsNyBAQCBsaWJ4
bF9kZXZpY2VfbW9kZWxfdmVyc2lvbiA9IEVudW1lcmF0aW9uKCJkZXZpY2VfbW9kZWxfdmVyc2lv
biIsIFsKPiA+ICAgICAgKDAsICJVTktOT1dOIiksCj4gPiAgICAgICgxLCAiUUVNVV9YRU5fVFJB
RElUSU9OQUwiKSwgIyBIaXN0b3JpY2FsIHFlbXUteGVuIGRldmljZSBtb2RlbCAocWVtdS1kbSkK
PiA+ICAgICAgKDIsICJRRU1VX1hFTiIpLCAgICAgICAgICAgICAjIFVwc3RyZWFtIGJhc2VkIHFl
bXUteGVuIGRldmljZSBtb2RlbAo+ID4gKyAgICAoMywgIk5PTkVfUkVRVUlSRUQiKSwKPiAKPiBQ
bGFpbiAiTk9ORSIgd291bGQgYWxzbyBiZSBmaW5lIGhlcmUgSU1PLgoKQWxzbyBwbGVhc2UgYWRk
IGEgTElCWExfSEFWRSBtYWNybyB0byBsaWJ4bC5oCgpSb2dlciwgdGhhbmtzIGZvciByZXZpZXdp
bmcgdGhpcyBwYXRjaC4KCldlaS4KCj4gCj4gVGhhbmtzLCBSb2dlci4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
