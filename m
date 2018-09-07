From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v3 15/16] x86/pvshim: disable HVM for PV shim
Date: Fri, 7 Sep 2018 08:46:34 +0100
Message-ID: <20180907074634.qny2aazswjnrb4zy@zion.uk.xensource.com>
References: <20180904161533.11575-1-wei.liu2@citrix.com>
 <20180904161533.11575-16-wei.liu2@citrix.com>
 <5B92265C02000078001E62B1@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=c06c=lv=citrix.com=prvs=7819b22f9=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1fyBTT-0006jW-Ih
 for xen-devel@lists.xenproject.org; Fri, 07 Sep 2018 07:46:39 +0000
Content-Disposition: inline
In-Reply-To: <5B92265C02000078001E62B1@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Ian Jackson <Ian.Jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBTZXAgMDcsIDIwMTggYXQgMDE6MTg6NTJBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDA0LjA5LjE4IGF0IDE4OjE1LCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gPiBTaWduZWQtb2ZmLWJ5OiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgo+ID4g
UmV2aWV3ZWQtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgo+IAo+
IEkgdGhpbmsgdGhpcyBzaG91bGQgYmUgbWVyZ2VkIGludG8gdGhlIHByZXZpb3VzIHBhdGNoLCBu
byBtYXR0ZXIgd2hhdAo+IHRoZSBmaW5hbCByZXNvbHV0aW9uIHRoZXJlIGlzLCBhcyBldmVuIHdp
dGggdGhlIGNoYW5nZSBvZiBkZWZhdWx0IHRoZQo+IGFkanVzdG1lbnQgaGVyZSBzaG91bGQgaGFw
cGVuLiBPdG9oIFJvZ2VyJ3MgInB2c2hpbTogaW50cm9kdWNlIGEgUFYKPiBzaGltIGRlZmNvbmZp
ZyIgc2hvdWxkIGVsaW1pbmF0ZSB0aGUgbmVlZCBmb3IgdGhpcyBjaGFuZ2UgYWx0b2dldGhlci4K
CkkgdGhpbmsgSSB3aWxsIHN0aWxsIG5lZWQgdG8gcGF0Y2ggdGhhdCBuZXcgZmlsZSBhdCBzb21l
IHBvaW50IGJlY2F1c2UKaXQgaGFzIENPTkZJR19QVj15LCBidXQgdGhhdCBjYW4gYmUgZG9uZSBl
YXNpbHkuICBJIHdpbGwgZm9sZCB0aGF0IGludG8KdGhlIHByZXZpb3VzIHBhdGNoIGluIG5leHQg
aXRlcmF0aW9uLgoKPiBJIG5vdGljZSAob25seSBub3cpIHRoYXQgaGlzIHBhdGNoIGFwcGVhcnMg
dG8gc2ltcGx5IGJlIHdhaXRpbmcgZm9yIGFuCj4geDg2IG1haW50YWluZXIgYWNrLCBzbyBJIGd1
ZXNzIEknbGwganVzdCBnbyBhaGVhZCBhbmQgY29tbWl0IGl0LgoKWWVhaCwgcGxlYXNlIGNvbW1p
dCB0aGF0IHBhdGNoLiAgSSB3aWxsIHJlYmFzZSBteSBjb2RlLgoKV2VpLgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
