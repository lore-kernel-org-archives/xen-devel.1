From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH v6 2/2] xen/blkback: rework connect_ring()
 to avoid inconsistent xenstore 'ring-page-order' set by malicious blkfront
Date: Tue, 15 Jan 2019 09:20:36 +0100
Message-ID: <20190115082036.y7svi3xz3dkqd4w4__10883.1712430858$1547540422$gmane$org@mac>
References: <1547484104-20625-1-git-send-email-dongli.zhang@oracle.com>
 <1547484104-20625-2-git-send-email-dongli.zhang@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=2vyh=PX=citrix.com=prvs=911eac428=roger.pau@srs-us1.protection.inumbo.net>)
 id 1gjJyi-0006Ey-UZ
 for xen-devel@lists.xenproject.org; Tue, 15 Jan 2019 08:21:44 +0000
Content-Disposition: inline
In-Reply-To: <1547484104-20625-2-git-send-email-dongli.zhang@oracle.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Dongli Zhang <dongli.zhang@oracle.com>
Cc: axboe@kernel.dk, konrad.wilk@oracle.com, linux-kernel@vger.kernel.org, linux-block@vger.kernel.org, Paul.Durrant@citrix.com, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBKYW4gMTUsIDIwMTkgYXQgMTI6NDE6NDRBTSArMDgwMCwgRG9uZ2xpIFpoYW5nIHdy
b3RlOgo+IFRoZSB4ZW5zdG9yZSAncmluZy1wYWdlLW9yZGVyJyBpcyB1c2VkIGdsb2JhbGx5IGZv
ciBlYWNoIGJsa2JhY2sgcXVldWUgYW5kCj4gdGhlcmVmb3JlIHNob3VsZCBiZSByZWFkIGZyb20g
eGVuc3RvcmUgb25seSBvbmNlLiBIb3dldmVyLCBpdCBpcyBvYnRhaW5lZAo+IGluIHJlYWRfcGVy
X3JpbmdfcmVmcygpIHdoaWNoIG1pZ2h0IGJlIGNhbGxlZCBtdWx0aXBsZSB0aW1lcyBkdXJpbmcg
dGhlCj4gaW5pdGlhbGl6YXRpb24gb2YgZWFjaCBibGtiYWNrIHF1ZXVlLgo+IAo+IElmIHRoZSBi
bGtmcm9udCBpcyBtYWxpY2lvdXMgYW5kIHRoZSAncmluZy1wYWdlLW9yZGVyJyBpcyBzZXQgaW4g
ZGlmZmVyZW50Cj4gdmFsdWUgYnkgYmxrZnJvbnQgZXZlcnkgdGltZSBiZWZvcmUgYmxrYmFjayBy
ZWFkcyBpdCwgdGhpcyBtYXkgZW5kIHVwIGF0Cj4gdGhlICJXQVJOX09OKGkgIT0gKFhFTl9CTEtJ
Rl9SRVFTX1BFUl9QQUdFICogYmxraWYtPm5yX3JpbmdfcGFnZXMpKTsiIGluCj4geGVuX2Jsa2lm
X2Rpc2Nvbm5lY3QoKSB3aGVuIGZyb250ZW5kIGlzIGRlc3Ryb3llZC4KPiAKPiBUaGlzIHBhdGNo
IHJld29ya3MgY29ubmVjdF9yaW5nKCkgdG8gcmVhZCB4ZW5zdG9yZSAncmluZy1wYWdlLW9yZGVy
JyBvbmx5Cj4gb25jZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBEb25nbGkgWmhhbmcgPGRvbmdsaS56
aGFuZ0BvcmFjbGUuY29tPgoKTEdUTToKClJldmlld2VkLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxy
b2dlci5wYXVAY2l0cml4LmNvbT4KClRoYW5rcyEKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
