From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH v3 0/4] x86/iommu: PVH Dom0 workarounds for
 missing RMRR entries
Date: Fri, 17 Aug 2018 10:53:23 +0200
Message-ID: <20180817085323.hglub4jq2lqer2rf@mac>
References: <20180807143715.kscihz3wuj6mcnfi@mac>
 <CABfawhmQ557uduVUJjTMbZ3u5FWswPvbVYSUBY785Vx=qbitfA@mail.gmail.com>
 <20180807150829.ydvmvpfyrigeeyyd@mac>
 <CABfawhkomnqJ4rjc5ZBZ+rdJSeqx1XTeAKSeYQRva-BoLQeHsw@mail.gmail.com>
 <CABfawhnSmeR_SeMHjL7CG0tCnnHUKPdCPQePD_iRVZiO4N+mxw@mail.gmail.com>
 <20180808082557.iklujkqgmb5sdzyr@mac>
 <5B6ABDE202000078001DBE54@prv1-mh.provo.novell.com>
 <CABfawh=c168v2EDXoqUAgOTM4v3rodRUqQk8XYMMFgo_68PM_w@mail.gmail.com>
 <5B73CACA02000078001DE1B5@prv1-mh.provo.novell.com>
 <CABfawhmP2z66b7eamaZ-Kc_D=kGEc-0OFRo6EjVUo2Oc0ePCZg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=qfmz=la=citrix.com=prvs=760927a5f=roger.pau@srs-us1.protection.inumbo.net>)
 id 1fqaVj-0004Eh-1v
 for xen-devel@lists.xenproject.org; Fri, 17 Aug 2018 08:53:35 +0000
Content-Disposition: inline
In-Reply-To: <CABfawhmP2z66b7eamaZ-Kc_D=kGEc-0OFRo6EjVUo2Oc0ePCZg@mail.gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Connor Davis <davisc@ainfosec.com>, Jan Beulich <JBeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBBdWcgMTYsIDIwMTggYXQgMTA6NDM6NTRBTSAtMDYwMCwgVGFtYXMgSyBMZW5neWVs
IHdyb3RlOgo+IEkgZG91YmxlIGNoZWNrZWQgYW5kIHRoZSBvcHRpb24gaXMgc2V0IHByb3Blcmx5
IGJ1dCBJJ20gc3RpbGwgZ2V0dGluZwo+IHRoZSBzYW1lIG5vbi1wcmVzZW50IGVudHJ5IGZhdWx0
cyBhcyBiZWZvcmUuIEF0IHRoZSBtb21lbnQgSSBkb24ndAo+IGhhdmUgc2VyaWFsIGFjY2VzcyBz
byBub3Qgc3VyZSBob3cgdG8gdmVyaWZ5IHRoYXQgdGhlIG9wdGlvbiB0b29rCj4gZWZmZWN0LiBU
aGlzIGlzIG15IGJvb3QgaW5mbzoKPiAKPiBbcHZoXQo+IG9wdGlvbnM9bG9nbHZsPWFsbCBndWVz
dF9sb2dsdmw9YWxsIGRvbTBfbWVtPTQwOTZNLG1heDo0MDk2TQo+IGRvbTBfbWF4X3ZjcHVzPTIg
c2NoZWQ9bnVsbCBkb20wPXB2aCBpb21tdT1yZXF1aXJlZCxkZWJ1Zwo+IGRvbTAtaW9tbXU9cmVs
YXhlZCBjb25zb2xlPXZnYQo+IHJtcnI9MHg1ZjQ4Mzg1PTA6MDoyLjAsMHgyMTYxODM9MDowOjIu
MCwweDcwYjZkMTk9MDowOjIuMAoKVGhpcyBpcyBub3QgdGhlIGNvcnJlY3QgZm9ybWF0LiBJdCdz
OgoKcm1ycj0weDVmNDgzODU9MDowOjIuMDsweDIxNjE4Mz0wOjA6Mi4wOzB4NzBiNmQxOT0wOjA6
Mi4wCgpOb3RlIHRoZSAnOycgYmV0d2VlbiBybXJyIGVudHJpZXMuCgpSb2dlci4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
