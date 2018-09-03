From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH] pvshim: introduce a PV shim defconfig
Date: Mon, 3 Sep 2018 15:49:39 +0200
Message-ID: <20180903134633.aiyhu46vqu52n6yq@mac.bytemobile.com>
References: <20180822103655.53122-1-roger.pau@citrix.com>
 <5B83C85B02000078001E2140@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=r/nd=lr=citrix.com=prvs=7776ac630=roger.pau@srs-us1.protection.inumbo.net>)
 id 1fwpEk-0002Rd-FC
 for xen-devel@lists.xenproject.org; Mon, 03 Sep 2018 13:49:50 +0000
Content-Disposition: inline
In-Reply-To: <5B83C85B02000078001E2140@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBBdWcgMjcsIDIwMTggYXQgMDM6NDY6MDNBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDIyLjA4LjE4IGF0IDEyOjM2LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdy
b3RlOgo+ID4gLS0tIC9kZXYvbnVsbAo+ID4gKysrIGIveGVuL2FyY2gveDg2L2NvbmZpZ3MvcHZz
aGltX2RlZmNvbmZpZwo+ID4gQEAgLTAsMCArMSwyMyBAQAo+ID4gKyMgRW5hYmxlIFBWIHNoaW0g
bW9kZQo+ID4gK0NPTkZJR19QVj15Cj4gPiArQ09ORklHX1hFTl9HVUVTVD15Cj4gPiArQ09ORklH
X1BWSF9HVUVTVD15Cj4gPiArQ09ORklHX1BWX1NISU09eQo+ID4gK0NPTkZJR19QVl9TSElNX0VY
Q0xVU0lWRT15Cj4gPiArIyBEaXNhYmxlIGZlYXR1cmVzIG5vdCB1c2VkIGJ5IHRoZSBQViBzaGlt
Cj4gPiArQ09ORklHX05SX0NQVVM9MzIKPiA+ICtDT05GSUdfU0hBRE9XX1BBR0lORz1uCj4gPiAr
Q09ORklHX0JJR01FTT1uCj4gPiArQ09ORklHX0hWTV9GRVA9bgo+ID4gK0NPTkZJR19UQk9PVD1u
Cj4gPiArQ09ORklHX0tFWEVDPW4KPiA+ICtDT05GSUdfVE1FTT1uCj4gPiArQ09ORklHX1hFTk9Q
Uk9GPW4KPiA+ICtDT05GSUdfWFNNPW4KPiA+ICtDT05GSUdfU0NIRURfQ1JFRElUMj1uCj4gPiAr
Q09ORklHX1NDSEVEX1JURFM9bgo+ID4gK0NPTkZJR19TQ0hFRF9BUklOQzY1Mz1uCj4gPiArQ09O
RklHX1NDSEVEX05VTEw9bgo+ID4gK0NPTkZJR19MSVZFUEFUQ0g9bgo+ID4gK0NPTkZJR19TVVBQ
UkVTU19EVVBMSUNBVEVfU1lNQk9MX1dBUk5JTkdTPW4KPiA+ICtDT05GSUdfREVCVUc9bgo+IAo+
IFNpbmNlIHRoZSAqZGVmY29uZmlnLXMgd2UgaGF2ZSBzbyBmYXIgYXJlIGFsbCBlbXB0eSwgYW5k
IHNpbmNlIHRoZQo+IExpbnV4IHg4NiBvbmVzIGFyZW4ndCB3cml0dGVuIHRoaXMgd2F5IEkgd29u
ZGVyOiBJcyB0aGVyZSBhIHJlYXNvbgo+IHlvdSB1c2UgIj1uIiBpbnN0ZWFkIG9mIHRoZSAiIyBD
T05GSUdfLi4uIGlzIG5vdCBzZXQiIGZvcm0/CgpNeSBwZXJzb25hbCBwcmVmZXJlbmNlIGlzIHRv
IGV4cGxpY2l0bHkgc2V0IHRoZW0gdG8gPW4sIEkgdGhpbmsgaXQncwpjbGVhcmVyLiBVc2luZyAi
IyBDT05GSUdfRk9PIGlzIG5vdCBzZXQiIGxvb2tzIHRvIG1lIGxpa2UgIkNPTkZJR19GT08Kd2ls
bCBiZSB1c2luZyB0aGUgZGVmYXVsdCB2YWx1ZSIuIEluIGFueSBjYXNlLCBJJ3ZlIGNoYW5nZWQg
dGhpcyB0bwp1c2UgdGhlICdpcyBub3Qgc2V0JyBmb3JtIGFuZCB3aWxsIHJlc2VuZCBzaG9ydGx5
LgoKVGhhbmtzLCBSb2dlci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
