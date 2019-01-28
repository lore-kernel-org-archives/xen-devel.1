From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v3 2/6] libxl: attach PCI device to qemu
 only after setting pciback/pcifront
Date: Mon, 28 Jan 2019 14:24:27 +0000
Message-ID: <20190128142427.mnmy625d6hq3u34j@zion.uk.xensource.com>
References: <cover.3de8cf7a339b8395cb449f8f3d44fee884ce04fa.1548469645.git-series.marmarek@invisiblethingslab.com>
 <7061e5e8c4f3a8966acefa0f8634843566733926.1548469645.git-series.marmarek@invisiblethingslab.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=eoWa=QE=citrix.com=prvs=9248dae56=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1go7pu-0001SC-UX
 for xen-devel@lists.xenproject.org; Mon, 28 Jan 2019 14:24:30 +0000
Content-Disposition: inline
In-Reply-To: <7061e5e8c4f3a8966acefa0f8634843566733926.1548469645.git-series.marmarek@invisiblethingslab.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?= <marmarek@invisiblethingslab.com>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gU2F0LCBKYW4gMjYsIDIwMTkgYXQgMDM6MzE6MTNBTSArMDEwMCwgTWFyZWsgTWFyY3p5a293
c2tpLUfDs3JlY2tpIHdyb3RlOgo+IFdoZW4gcWVtdSBpcyBydW5uaW5nIGluIHN0dWJkb21haW4s
IGhhbmRsaW5nICJwY2ktaW5zIiBjb21tYW5kIHdpbGwgZmFpbAo+IGlmIHBjaWZyb250IGlzIG5v
dCBpbml0aWFsaXplZCBhbHJlYWR5LiBGaXggdGhpcyBieSBzZW5kaW5nIHN1Y2ggY29tbWFuZAo+
IG9ubHkgYWZ0ZXIgY29uZmlybWluZyB0aGF0IHBjaWJhY2svZnJvbnQgaXMgcnVubmluZy4KPiAK
PiBTaWduZWQtb2ZmLWJ5OiBNYXJlayBNYXJjenlrb3dza2ktR8OzcmVja2kgPG1hcm1hcmVrQGlu
dmlzaWJsZXRoaW5nc2xhYi5jb20+CgpBY2tlZC1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4
LmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
