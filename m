From: Daniel Kiper <daniel.kiper@oracle.com>
Subject: Re: [PATCH v2 1/8] xen: calculate XEN_BUILD_TIME using
 XEN_BUILD_DATE value
Date: Wed, 4 Jul 2018 16:39:57 +0200
Message-ID: <20180704143957.GC26572@olila.local.net-space.pl>
References: <1529418946-30114-1-git-send-email-daniel.kiper@oracle.com>
 <1529418946-30114-2-git-send-email-daniel.kiper@oracle.com>
 <5B30F2B202000078001CD8E4@prv1-mh.provo.novell.com>
 <20180704120629.GJ4670@olila.local.net-space.pl>
 <23356.53881.85485.72287@mariner.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=z+bn=ju=oracle.com=daniel.kiper@srs-us1.protection.inumbo.net>)
 id 1faix7-0003aU-Pw
 for xen-devel@lists.xenproject.org; Wed, 04 Jul 2018 14:40:17 +0000
Content-Disposition: inline
In-Reply-To: <23356.53881.85485.72287@mariner.uk.xensource.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ian Jackson <ian.jackson@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <JBeulich@suse.com>, Tamas K Lengyel <tamas.k.lengyel@gmail.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBKdWwgMDQsIDIwMTggYXQgMDI6NTg6MTdQTSArMDEwMCwgSWFuIEphY2tzb24gd3Jv
dGU6Cj4gRGFuaWVsIEtpcGVyIHdyaXRlcyAoIlJlOiBbUEFUQ0ggdjIgMS84XSB4ZW46IGNhbGN1
bGF0ZSBYRU5fQlVJTERfVElNRSB1c2luZyBYRU5fQlVJTERfREFURSB2YWx1ZSIpOgo+ID4gV2Vs
bCwgdGhpcyBjb21wbGljYXRlcyBzaXR1YXRpb24gZnVydGhlciBhbmQgaXQgc2VlbXMgdG8gbWUg
dGhhdAo+ID4gc2VkLWVyeSBjYW5ub3QgYmUgc3VmZmljaWVudC4gQW55d2F5LCBJIHdpbGwgdGFr
ZSBhIGxvb2sgaG93IHRvCj4gPiBzb2x2ZSB0aGF0Lgo+Cj4gT3VyIG90aGVyIGN1cnJlbnQgaG9z
dCBPUyBpcyBGcmVlQlNELiAgRnJlZUJTRCdzIGRhdGUoMSkgdXNlcyAtZCBmb3IKPiBzb21ldGhp
bmcgdXR0ZXJseSBkaWZmZXJlbnQgKGFsc28sIHNvbWV0aGluZyBtYWQpLiAgQ2FuIHdlIHJlbHkg
b24KPiBQZXJsIHlldCA/ICBQZXJsIGNhbiBkbyB0aGlzIGtpbmQgb2YgdGhpbmcgZWFzaWx5IGVu
b3VnaC4KCk9oLCBQZXJsLCBpdCBzZWVtcyBsaWtlIGEgZHlpbmcgbGFuZ3VhZ2UuLi4gU25pZmYu
Li4KCj4gQWx0ZXJuYXRpdmVseSB3ZSBjb3VsZCBoYXZlIGEgd3JhcHBlciBzY3JpcHQuCgpJIHRo
aW5rIHRoYXQgaXQgaXMgYSBiZXR0ZXIgc29sdXRpb24uCgo+IEFuZHJldyBDb29wZXI6Cj4gPiBX
aHkgYXJlIHdlIGFkZGluZyB5ZXQgbW9yZSBYZW4gc3BlY2lmaWMgbG9naWMgdG8gaW1wbGVtZW50
IHRoZSBzYW1lIGFzCj4gPiBTT1VSQ0VfREFURV9FUE9DSCBmcm9tIHRoZSByZXByb2R1Y2libGUt
YnVpbGRzLm9yZyBlZmZvcnQ/Cj4KPiBXZSBzaG91bGQgY2xlYXJseSBob25vdXIgU09VUkNFX0RB
VEVfRVBPQ0guICBCdXQgdGhhdCdzIGEgZGlmZmVyZW50Cj4gcXVlc3Rpb24uCj4KPiBJIHRoaW5r
IHRoZSByaWdodCB0aGluZyBpcyBzb21ldGhpbmcgbGlrZSB0aGlzOgo+Cj4gZXhwb3J0IFhFTl9C
VUlMRF9QT1NJWF9USU1FCT89ICQoc2hlbGwgZWNobyAkJHtTT1VSQ0VfREFURV9FUE9DSC1kYXRl
ICslc30pCgpPSywgYnV0IHdoYXQgaWYgU09VUkNFX0RBVEVfRVBPQ0ggaXMgbm90IGRlZmluZWQ/
CiJkYXRlIiBjb21tYW5kIGlzIG5vdCBhIGdvb2Qgc29sdXRpb24gaGVyZS4KCj4gZXhwb3J0IFhF
Tl9CVUlMRF9EQVRFCQk/PSAkKHNoZWxsIExDX0FMTD1DIGRhdGVfcGFyc2luZ19lcG9jaCAkKFhF
Tl9CVUlMRF9FUE9DSCkpCj4gZXhwb3J0IFhFTl9CVUlMRF9USU1FCQk/PSAkKHNoZWxsIExDX0FM
TD1DIGRhdGVfcGFyc2luZ19lcG9jaCAkKFhFTl9CVUlMRF9FUE9DSCkgKyVUKQo+Cj4gV2hlcmUg
ZGF0ZV9wYXJzaW5nX2Vwb2NoIGlzIHRoaXMgb24gR05VIHN5c3RlbXMKPgo+ICAgICMhL2Jpbi9z
aAo+ICAgIHNldCAtZQo+ICAgIGVwb2NoPSQxOyBzaGlmdAo+ICAgIGRhdGUgLXUgLWQgIkAkZXBv
Y2giICIkQCIKPgo+IGFuZCBJIHRoaW5rIHNvbWV0aGluZyBsaWtlIHRoaXMgb24gRnJlZUJTRAo+
Cj4gICAgIyEvYmluL3NoCj4gICAgc2V0IC1lCj4gICAgZXBvY2g9JDE7IHNoaWZ0Cj4gICAgZGF0
ZSAtdSAtam4gLWYlcyAiJGVwb2NoIiAiJEAiCgpJZiBvdGhlciBndXlzIGFyZSBPSyB3aXRoIHRo
YXQgSSBjYW4gcHJlcGFyZSBhIHBhdGNoIHdpdGggeW91ciBTdWdnZXN0ZWQtYnkuCgpEYW5pZWwK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
