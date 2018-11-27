From: Paul Durrant <Paul.Durrant@citrix.com>
Subject: Re: [PATCH] amd-iommu: remove page merging code
Date: Tue, 27 Nov 2018 14:12:53 +0000
Message-ID: <326c82d0833d4388b72c7f213554d374@AMSPEX02CL03.citrite.net>
References: <20181126173045.1274-1-paul.durrant@citrix.com>
 <5BFD402B02000078002005C5@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=mivs=og=citrix.com=prvs=8623b3373=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1gRe74-0000oK-0O
 for xen-devel@lists.xenproject.org; Tue, 27 Nov 2018 14:13:18 +0000
In-Reply-To: <5BFD402B02000078002005C5@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: 'Jan Beulich' <JBeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Brian Woods <brian.woods@amd.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
List-Id: xen-devel@lists.xenproject.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IEphbiBCZXVsaWNoIFttYWlsdG86
SkJldWxpY2hAc3VzZS5jb21dCj4gU2VudDogMjcgTm92ZW1iZXIgMjAxOCAxMzowMgo+IFRvOiBQ
YXVsIER1cnJhbnQgPFBhdWwuRHVycmFudEBjaXRyaXguY29tPgo+IENjOiBCcmlhbiBXb29kcyA8
YnJpYW4ud29vZHNAYW1kLmNvbT47IFN1cmF2ZWUgU3V0aGlrdWxwYW5pdAo+IDxzdXJhdmVlLnN1
dGhpa3VscGFuaXRAYW1kLmNvbT47IHhlbi1kZXZlbCA8eGVuLQo+IGRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnPgo+IFN1YmplY3Q6IFJlOiBbWGVuLWRldmVsXSBbUEFUQ0hdIGFtZC1pb21tdTog
cmVtb3ZlIHBhZ2UgbWVyZ2luZyBjb2RlCj4gCj4gPj4+IE9uIDI2LjExLjE4IGF0IDE4OjMwLCA8
cGF1bC5kdXJyYW50QGNpdHJpeC5jb20+IHdyb3RlOgo+ID4gVGhlIHBhZ2UgbWVyZ2luZyBsb2dp
YyBtYWtlcyB1c2Ugb2YgYml0cyAxLTggYW5kIGJpdCA2MyBvZiBhIFBURSwgd2hpY2gKPiB1c2Vk
Cj4gPiB0byBiZSBzcGVjaWZpZWQgYXMgaWdub3JlZC4gSG93ZXZlciwgYml0cyA1IGFuZCA2IGFy
ZSBub3cgc3BlY2lmaWVkIGFzCj4gPiAnYWNjZXNzZWQnIGFuZCAnZGlydHknIGJpdHMgYW5kIHRo
ZWlyIHVzZSBvbmx5IHJlbWFpbnMgc2FmZSBhcyBsb25nIGFzCj4gPiB0aGUgRFRFICdIb3N0IEFj
Y2VzcyBEaXJ0eScgYml0cyByZW1haW4gY2xlYXIuIFRoZSBjb2RlIGlzIGFsc28gb2YKPiBkdWJp
b3VzCj4gPiBiZW5lZml0IGFuZCB3YXMgdGhlIHN1YmplY3QgWFNBLTI3NS4KPiA+Cj4gPiBUaGlz
IHBhdGNoIHJlbW92ZXMgdGhlIGNvZGUsIGZyZWVpbmcgdXAgdGhlIHJlbWFpbmluZyBQVEUgJ2ln
bm9yZWQnIGJpdHMKPiA+IGZvciBvdGhlciBwb3RlbnRpYWwgdXNlIGFuZCBzaG9ydGVuaW5nIHRo
ZSBzb3VyY2UgYnkgMTcwIGxpbmVzLgo+IAo+IE5vIHdvcmQgYXQgYWxsIGFib3V0IHRoZSBwZXJm
b3JtYW5jZSBpbXBsaWNhdGlvbnM/IERvIHlvdSBoYXZlCj4gYW55IHBsYW5zIHRvIHJlLWludHJv
ZHVjZSBwcm9wZXJseSB3b3JraW5nIHBhZ2UgcmVjb21iaW5pbmcKPiBjb2RlPyBJIHJlYWxpemUg
VlQtZCBkb2Vzbid0IGhhdmUgYW55IGVpdGhlciAodGhlIG1haW50YWluZXJzIGF0Cj4gc29tZSBw
b2ludCBpbiB0aGUgZGlzdGFudCBwYXN0IGhhZCBwcm9taXNlZCB0byBpbXBsZW1lbnQgaXQsIGJ1
dAo+IEkgZ3Vlc3MgdGhhdCdzIGxvbmcgYmVlbiBmb3Jnb3R0ZW4pLCBidXQgYW55d2F5Li4uCj4g
CgpJIGhvcGUgdG8gd2lyZSB0aHJvdWdoIHRoZSBvcmRlciBwYXJhbWV0ZXIgdG8gdGhlIGltcGxl
bWVudGF0aW9ucyBldmVudHVhbGx5LCB3aGljaCBpcyB0aGUgcmlnaHQgd2F5IHRvIGRvIHRoaW5n
cyBJIHRoaW5rLiBJdCBhbHNvIG1lYW5zIEknbGwgcHJvYmFibHkgbmVlZCB0byB0d2VhayB0aGUg
UFYtSU9NTVUgaW50ZXJmYWNlIHRvIGhhbmRsZSBhbiBvcmRlciBwYXJhbWV0ZXIgYmVmb3JlIEkg
c2VuZCB2Lm5leHQgdG9vLgoKICBQYXVsCgo+IEphbgo+IAoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
