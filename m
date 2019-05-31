From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2] automation: add clang and lld 8 tests to
 gitlab
Date: Fri, 31 May 2019 01:21:15 -0700
Message-ID: <610891a5-c7a1-9a36-33f2-d3d07a513ddd@citrix.com>
References: <20190531081713.55596-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zAi+=T7=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hWcmy-0005Nm-Re
 for xen-devel@lists.xenproject.org; Fri, 31 May 2019 08:21:24 +0000
In-Reply-To: <20190531081713.55596-1-roger.pau@citrix.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Doug Goldstein <cardoe@cardoe.com>, Wei Liu <wl@xen.org>
List-Id: xen-devel@lists.xenproject.org

T24gMzEvMDUvMjAxOSAwMToxNywgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+ICtkZWIgaHR0cDov
L2FwdC5sbHZtLm9yZy9zdHJldGNoLyBsbHZtLXRvb2xjaGFpbi1zdHJldGNoLTggbWFpbgo+ICtk
ZWItc3JjIGh0dHA6Ly9hcHQubGx2bS5vcmcvc3RyZXRjaC8gbGx2bS10b29sY2hhaW4tc3RyZXRj
aC04IG1haW4KPiBkaWZmIC0tZ2l0IGEvYXV0b21hdGlvbi9idWlsZC9kZWJpYW4vc3RyZXRjaC5k
b2NrZXJmaWxlIGIvYXV0b21hdGlvbi9idWlsZC9kZWJpYW4vc3RyZXRjaC5kb2NrZXJmaWxlCj4g
aW5kZXggZGFmOGM5ZDM4NC4uMTg5ZGZmMzI3NSAxMDA2NDQKPiAtLS0gYS9hdXRvbWF0aW9uL2J1
aWxkL2RlYmlhbi9zdHJldGNoLmRvY2tlcmZpbGUKPiArKysgYi9hdXRvbWF0aW9uL2J1aWxkL2Rl
Ymlhbi9zdHJldGNoLmRvY2tlcmZpbGUKPiBAQCAtNSw2ICs1LDE0IEBAIExBQkVMIG1haW50YWlu
ZXIubmFtZT0iVGhlIFhlbiBQcm9qZWN0IiBcCj4gIEVOViBERUJJQU5fRlJPTlRFTkQ9bm9uaW50
ZXJhY3RpdmUKPiAgRU5WIFVTRVIgcm9vdAo+ICAKPiArUlVOIGFwdC1nZXQgdXBkYXRlICYmIFwK
PiArICAgIGFwdC1nZXQgLS1xdWlldCAtLXllcyBpbnN0YWxsIFwKPiArICAgIHdnZXQgXAo+ICsg
ICAgZ251cGcKPiArCj4gK1JVTiB3Z2V0IC1PIC0gaHR0cHM6Ly9hcHQubGx2bS5vcmcvbGx2bS1z
bmFwc2hvdC5ncGcua2V5fGFwdC1rZXkgYWRkIC0KPiArQ09QWSBzdHJldGNoLWxsdm0ubGlzdCAv
ZXRjL2FwdC9zb3VyY2VzLmxpc3QuZC8KPiArCj4gIFJVTiBta2RpciAvYnVpbGQKPiAgV09SS0RJ
UiAvYnVpbGQKPiAgCj4gQEAgLTM5LDkgKzQ3LDEwIEBAIFJVTiBhcHQtZ2V0IHVwZGF0ZSAmJiBc
Cj4gICAgICAgICAgdHJhbnNmaWcgXAo+ICAgICAgICAgIHBhbmRvYyBcCj4gICAgICAgICAgY2hl
Y2twb2xpY3kgXAo+IC0gICAgICAgIHdnZXQgXAoKWW91IGNhbid0IGRyb3Agd2dldCAoc2FkbHkp
LCBiZWNhdXNlIHRoaXMgd2lsbCBicmVhayBDSSBvbiBzdGFnaW5nLTQuMTEKb3Igc3RhZ2luZy00
LjEyICh3aGljaGV2ZXIgaGFkIGdpdGxhYiBDSSBhbmQgdGhlIGxhY2sgb2YgYSBGRVRDSEVSPSB3
YXMKc3RpbGwgZmF0YWwgdG8gLi9jb25maWd1cmUpCgp+QW5kcmV3CgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
