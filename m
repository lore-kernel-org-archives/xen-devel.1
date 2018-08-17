From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v3 0/4] x86/iommu: PVH Dom0 workarounds for
 missing RMRR entries
Date: Fri, 17 Aug 2018 02:10:00 -0600
Message-ID: <5B7682D802000078001DF405@prv1-mh.provo.novell.com>
References: <20180807140243.11265-1-roger.pau@citrix.com>
 <CABfawhkwcV+T5UxRFZ3jz_1eS3ZVF=sMq=zN2sa+eVq8ux5zVg@mail.gmail.com>
 <20180807143715.kscihz3wuj6mcnfi@mac>
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
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=ndfk=la=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fqZpe-0008Ly-Ov
 for xen-devel@lists.xenproject.org; Fri, 17 Aug 2018 08:10:06 +0000
In-Reply-To: <CABfawhmP2z66b7eamaZ-Kc_D=kGEc-0OFRo6EjVUo2Oc0ePCZg@mail.gmail.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Connor Davis <davisc@ainfosec.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE2LjA4LjE4IGF0IDE4OjQzLCA8dGFtYXMuay5sZW5neWVsQGdtYWlsLmNvbT4gd3Jv
dGU6Cj4gQm9vdGluZyBqdXN0IGxpbnV4IHdpdGggYm90aCBvcHRpb25zIHdvcmtzIGp1c3QgZmlu
ZSwgSSBncmVwcGVkIHRoZQo+IGRtZXNnIGxvZyBmb3IgdGhlIGRldmljZSB0aGF0IGNhdXNlcyB0
aGUgaXNzdWVzIHdpdGggWGVuIGJ1dCB0aGVyZSBhcmUKPiBubyBlcnJvcnMgaW4gdGhlIGxvZzoK
CldlbGwsIHRoaXMgYXMgd2VsbCBhcyAuLi4KCj4gSSBkb3VibGUgY2hlY2tlZCBhbmQgdGhlIG9w
dGlvbiBpcyBzZXQgcHJvcGVybHkgYnV0IEknbSBzdGlsbCBnZXR0aW5nCj4gdGhlIHNhbWUgbm9u
LXByZXNlbnQgZW50cnkgZmF1bHRzIGFzIGJlZm9yZS4gQXQgdGhlIG1vbWVudCBJIGRvbid0Cj4g
aGF2ZSBzZXJpYWwgYWNjZXNzIHNvIG5vdCBzdXJlIGhvdyB0byB2ZXJpZnkgdGhhdCB0aGUgb3B0
aW9uIHRvb2sKPiBlZmZlY3QuIFRoaXMgaXMgbXkgYm9vdCBpbmZvOgo+IAo+IFtwdmhdCj4gb3B0
aW9ucz1sb2dsdmw9YWxsIGd1ZXN0X2xvZ2x2bD1hbGwgZG9tMF9tZW09NDA5Nk0sbWF4OjQwOTZN
Cj4gZG9tMF9tYXhfdmNwdXM9MiBzY2hlZD1udWxsIGRvbTA9cHZoIGlvbW11PXJlcXVpcmVkLGRl
YnVnCj4gZG9tMC1pb21tdT1yZWxheGVkIGNvbnNvbGU9dmdhCj4gcm1ycj0weDVmNDgzODU9MDow
OjIuMCwweDIxNjE4Mz0wOjA6Mi4wLDB4NzBiNmQxOT0wOjA6Mi4wCj4ga2VybmVsPXZtbGludXot
NC4xOC4wLXJjOCByb290PS9kZXYvbWFwcGVyL3VidW50dS0tdmctcm9vdCBybyBxdWlldAo+IHNw
bGFzaCB2dC5oYW5kb2ZmPTEKPiByYW1kaXNrPWluaXRyZC5pbWctNC4xOC4wLXJjOAoKLi4uIHRo
aXMgKG9wdGlvbiBsb29rcyBmaW5lIHRvIG1lKSBzdWdnZXN0IHRoYXQgc29tZSBkZWJ1Z2dpbmcg
aXMKZ29pbmcgdG8gYmUgb24gb3JkZXIgb24gdGhhdCBzeXN0ZW0sIHdoaWNoIEkgdW5kZXJzdGFu
ZCB3aWxsIGJlCmF0IGxlYXN0IGRpZmZpY3VsdCB3aXRob3V0IHNlcmlhbCBjb25zb2xlLgoKSmFu
CgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
