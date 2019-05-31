From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH v2] automation: add clang and lld 8 tests to
 gitlab
Date: Fri, 31 May 2019 10:33:25 +0200
Message-ID: <20190531083325.vtn2yd3yviljrp5n@Air-de-Roger>
References: <20190531081713.55596-1-roger.pau@citrix.com>
 <610891a5-c7a1-9a36-33f2-d3d07a513ddd@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=TvYf=T7=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hWcyo-0006G6-8a
 for xen-devel@lists.xenproject.org; Fri, 31 May 2019 08:33:38 +0000
Content-Disposition: inline
In-Reply-To: <610891a5-c7a1-9a36-33f2-d3d07a513ddd@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>, Wei Liu <wl@xen.org>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBNYXkgMzEsIDIwMTkgYXQgMDE6MjE6MTVBTSAtMDcwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBPbiAzMS8wNS8yMDE5IDAxOjE3LCBSb2dlciBQYXUgTW9ubmUgd3JvdGU6Cj4gPiAr
ZGViIGh0dHA6Ly9hcHQubGx2bS5vcmcvc3RyZXRjaC8gbGx2bS10b29sY2hhaW4tc3RyZXRjaC04
IG1haW4KPiA+ICtkZWItc3JjIGh0dHA6Ly9hcHQubGx2bS5vcmcvc3RyZXRjaC8gbGx2bS10b29s
Y2hhaW4tc3RyZXRjaC04IG1haW4KPiA+IGRpZmYgLS1naXQgYS9hdXRvbWF0aW9uL2J1aWxkL2Rl
Ymlhbi9zdHJldGNoLmRvY2tlcmZpbGUgYi9hdXRvbWF0aW9uL2J1aWxkL2RlYmlhbi9zdHJldGNo
LmRvY2tlcmZpbGUKPiA+IGluZGV4IGRhZjhjOWQzODQuLjE4OWRmZjMyNzUgMTAwNjQ0Cj4gPiAt
LS0gYS9hdXRvbWF0aW9uL2J1aWxkL2RlYmlhbi9zdHJldGNoLmRvY2tlcmZpbGUKPiA+ICsrKyBi
L2F1dG9tYXRpb24vYnVpbGQvZGViaWFuL3N0cmV0Y2guZG9ja2VyZmlsZQo+ID4gQEAgLTUsNiAr
NSwxNCBAQCBMQUJFTCBtYWludGFpbmVyLm5hbWU9IlRoZSBYZW4gUHJvamVjdCIgXAo+ID4gIEVO
ViBERUJJQU5fRlJPTlRFTkQ9bm9uaW50ZXJhY3RpdmUKPiA+ICBFTlYgVVNFUiByb290Cj4gPiAg
Cj4gPiArUlVOIGFwdC1nZXQgdXBkYXRlICYmIFwKPiA+ICsgICAgYXB0LWdldCAtLXF1aWV0IC0t
eWVzIGluc3RhbGwgXAo+ID4gKyAgICB3Z2V0IFwKPiA+ICsgICAgZ251cGcKPiA+ICsKPiA+ICtS
VU4gd2dldCAtTyAtIGh0dHBzOi8vYXB0Lmxsdm0ub3JnL2xsdm0tc25hcHNob3QuZ3BnLmtleXxh
cHQta2V5IGFkZCAtCj4gPiArQ09QWSBzdHJldGNoLWxsdm0ubGlzdCAvZXRjL2FwdC9zb3VyY2Vz
Lmxpc3QuZC8KPiA+ICsKPiA+ICBSVU4gbWtkaXIgL2J1aWxkCj4gPiAgV09SS0RJUiAvYnVpbGQK
PiA+ICAKPiA+IEBAIC0zOSw5ICs0NywxMCBAQCBSVU4gYXB0LWdldCB1cGRhdGUgJiYgXAo+ID4g
ICAgICAgICAgdHJhbnNmaWcgXAo+ID4gICAgICAgICAgcGFuZG9jIFwKPiA+ICAgICAgICAgIGNo
ZWNrcG9saWN5IFwKPiA+IC0gICAgICAgIHdnZXQgXAo+IAo+IFlvdSBjYW4ndCBkcm9wIHdnZXQg
KHNhZGx5KSwgYmVjYXVzZSB0aGlzIHdpbGwgYnJlYWsgQ0kgb24gc3RhZ2luZy00LjExCj4gb3Ig
c3RhZ2luZy00LjEyICh3aGljaGV2ZXIgaGFkIGdpdGxhYiBDSSBhbmQgdGhlIGxhY2sgb2YgYSBG
RVRDSEVSPSB3YXMKPiBzdGlsbCBmYXRhbCB0byAuL2NvbmZpZ3VyZSkKCk9oIG5vLCBJIGhhdmVu
J3QgZHJvcHBlZCB3Z2V0LCBqdXN0IGluc3RhbGxlZCBpdCBzb29uZXIgc28gaXQgY2FuIGJlCnVz
ZWQgdG8gZmV0Y2ggdGhlIGxsdm0gYXB0IHJlcG9zaXRvcnkga2V5IChzZWUgdGhlIGFwdC1nZXQg
YWJvdmUgdGhpcwpvbmUpLgoKVGhhbmtzLCBSb2dlci4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
