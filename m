From: Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH v1] libxl: fix migration of PV and PVH domUs
 with and without qemu
Date: Thu, 11 Apr 2019 16:56:02 +0100
Message-ID: <20190411155602.GL1435@perard.uk.xensource.com>
References: <20190410103338.5456-1-olaf@aepfle.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Xe+J=SN=citrix.com=prvs=9977b2ae1=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1hEc5C-0006je-Qh
 for xen-devel@lists.xenproject.org; Thu, 11 Apr 2019 15:57:46 +0000
Content-Disposition: inline
In-Reply-To: <20190410103338.5456-1-olaf@aepfle.de>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Olaf Hering <olaf@aepfle.de>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>, Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBBcHIgMTAsIDIwMTkgYXQgMTI6MzM6MzhQTSArMDIwMCwgT2xhZiBIZXJpbmcgd3Jv
dGU6Cj4gSWYgYSBkb21VIGhhcyBhIHFlbXUteGVuIGluc3RhbmNlIGF0dGFjaGVkLCBpdCBpcyBy
ZXF1aXJlZCB0byBjYWxsIHFlbXVzCj4gInhlbi1zYXZlLWRldmljZXMtc3RhdGUiIG1ldGhvZC4g
V2l0aG91dCBpdCwgdGhlIHJlY2VpdmluZyBzaWRlIG9mIGEgUFYgb3IKPiBQVkggbWlncmF0aW9u
IG1heSBiZSB1bmFibGUgdG8gbG9jayB0aGUgaW1hZ2U6Cj4gCj4geGVuIGJlOiBxZGlzay01MTcx
MjogeGVuIGJlOiBxZGlzay01MTcxMjogZXJyb3I6IEZhaWxlZCB0byBnZXQgIndyaXRlIiBsb2Nr
Cj4gZXJyb3I6IEZhaWxlZCB0byBnZXQgIndyaXRlIiBsb2NrCj4geGVuIGJlOiBxZGlzay01MTcx
MjogeGVuIGJlOiBxZGlzay01MTcxMjogaW5pdGlhbGlzZSgpIGZhaWxlZAo+IGluaXRpYWxpc2Uo
KSBmYWlsZWQKCkkgaGF2ZW4ndCBtYW5hZ2VkIHRvIHJlcHJvZHVjZSB0aGlzLCBidXQgdGhpcyBi
dWcgd2lsbCBnbyBhd2F5IHdpdGgKUUVNVSA0LjAuIFRoZSBiYWNrZW5kIGluIFFFTVUgNC4wIHdp
bGwgbm90IGxvY2sgdGhlIGRpc2sgaW1hZ2UgYW55bW9yZS4KCk1heWJlIHdlIGNvdWxkIHNpbXBs
eSBhcHBseSBhIHBhdGNoIHRvIG91ciBxZW11LXhlbiB0cmVlcyB3aGljaCBhdm9pZAp0aGUgbG9j
ayBvbiBkaXNrIGltYWdlcyBmb3IgdGhlIHB2IGRpc2tzPyBUaGF0IHdvdWxkIGF2b2lkIGEgY29u
dm9sdXRlZApwYXRjaCB0byBsaWJ4bC4KClRoZSBsb2NrIGFwcGVhcmVkIGluIFFFTVUgMi4xMCAo
cWVtdS14ZW4tNC4xMCksIGFuZCB3b24ndCBleGlzdCBmb3IgcHYKZ3Vlc3Qgd2l0aCBRRU1VIDQu
MCAocWVtdS14ZW4tNC4xMykuCgotLSAKQW50aG9ueSBQRVJBUkQKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
