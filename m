From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH v5 00/15] Argo: hypervisor-mediated
 interdomain communication
Date: Wed, 6 Feb 2019 11:31:27 +0100
Message-ID: <20190206103127.d3pl2phgaxzht6fh@mac>
References: <1548064795-18160-1-git-send-email-christopher.w.clark@gmail.com>
 <20190122141702.h3oxvr25xjxbhjcl@mac>
 <CACMJ4Gbr4dR2B7o=+i_0aCEPiXTA9nF-w477Btvv8vd_B2+mOw@mail.gmail.com>
 <20190131133931.vincqqgf4acywekz@mac>
 <CACMJ4GZ+85Hr4x8Ydt9u8zJWQLnGcDCxnWoHw3WQdqOZaZJ0gQ@mail.gmail.com>
 <20190204100712.idxj4xpvifv7yy6f@mac>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=eoF8=QN=citrix.com=prvs=93319c3d4=roger.pau@srs-us1.protection.inumbo.net>)
 id 1grKXZ-0002DH-CH
 for xen-devel@lists.xenproject.org; Wed, 06 Feb 2019 10:34:49 +0000
Content-Disposition: inline
In-Reply-To: <20190204100712.idxj4xpvifv7yy6f@mac>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Cc: Juergen Gross <jgross@suse.com>, Lars Kurth <lars.kurth@citrix.com>, Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Ross Philipson <ross.philipson@gmail.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Jason Andryuk <jandryuk@gmail.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Christopher Clark <christopher.w.clark@gmail.com>, Tim Deegan <tim@xen.org>, Daniel Smith <dpsmith@apertussolutions.com>, Rich Persaud <persaur@gmail.com>, Paul Durrant <paul.durrant@citrix.com>, Jan Beulich <jbeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>, Daniel De Graaf <dgdegra@tycho.nsa.gov>, James McKenzie <james@bromium.com>, Eric Chanudet <eric.chanudet@gmail.com>
List-Id: xen-devel@lists.xenproject.org

R2VudGxlIHBpbmcgb24gdGhlIHF1ZXN0aW9ucyBiZWxvdy4KCk9uIE1vbiwgRmViIDA0LCAyMDE5
IGF0IDExOjA3OjEyQU0gKzAxMDAsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6Cj4gT24gU3VuLCBG
ZWIgMDMsIDIwMTkgYXQgMTA6MDQ6MjlBTSAtMDgwMCwgQ2hyaXN0b3BoZXIgQ2xhcmsgd3JvdGU6
Cj4gPiBPbiBUaHUsIEphbiAzMSwgMjAxOSBhdCA1OjM5IEFNIFJvZ2VyIFBhdSBNb25uw6kgPHJv
Z2VyLnBhdUBjaXRyaXguY29tPiB3cm90ZToKPiA+ID4KPiA+ID4gT24gV2VkLCBKYW4gMzAsIDIw
MTkgYXQgMDg6MDU6MzBQTSAtMDgwMCwgQ2hyaXN0b3BoZXIgQ2xhcmsgd3JvdGU6Cj4gPiA+ID4g
T24gVHVlLCBKYW4gMjIsIDIwMTkgYXQgNjoxOSBBTSBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5w
YXVAY2l0cml4LmNvbT4gd3JvdGU6Cj4gPiA+ID4gPgo+ID4gPiA+ID4gT24gTW9uLCBKYW4gMjEs
IDIwMTkgYXQgMDE6NTk6NDBBTSAtMDgwMCwgQ2hyaXN0b3BoZXIgQ2xhcmsgd3JvdGU6Cj4gPiA+
ID4gQXMgZGlzY3Vzc2VkIG9mZmxpbmU6Cj4gPiA+ID4KPiA+ID4gPiAtIFVzaW5nIFhlbidzIGxp
c3QgbWFjcm9zIHdpbGwgZXhwZWRpdGUgQXJnbydzIG1lcmdlIGZvciBYZW4gNC4xMgo+ID4gPiA+
IC0gTGlzdCBtYWNyb3MgaW4gWGVuIGxpc3QuaCBvcmlnaW5hdGVkIGluIExpbnV4IGxpc3QuaCBh
bmQgaGF2ZSBkaXZlcmdlZAo+ID4gPiA+IC0gT3BlblhUIGhhcyB1c2UgY2FzZXMgZm9yIG1lYXN1
cmVkIGxhdW5jaCBhbmQgbmVzdGVkIHZpcnR1YWxpemF0aW9uLAo+ID4gPiA+ICAgd2hpY2ggaW5m
bHVlbmNlIGRvd25zdHJlYW0gcGVyZm9ybWFuY2UgYW5kIHNlY3VyaXR5IHJlcXVpcmVtZW50cyBm
b3IKPiA+ID4gPiAgIEFyZ28gYW5kIFhlbgo+IAo+IEZXSVcsIEkgZG9uJ3Qgc2VlIHRoZSBjb25u
ZWN0aW9uIGJldHdlZW4gbmVzdGVkIHZpcnR1YWxpemF0aW9uIG9yCj4gbWVhc3VyZWQgbGF1bmNo
IGFuZCB0aGUgbGlzdCBtYWNyb3MuIEkgdGhpbmsgYSBsaXR0bGUgYml0IG1vcmUgY29udGV4dAo+
IHdvdWxkIGJlIGhlbHBmdWwgaGVyZSBpbiBvcmRlciB0byB1bmRlcnN0YW5kIHRoZSBpc3N1ZS4K
PiAKPiA+ID4gPiAtIE9wZW5YVCBjYW4gdGVtcG9yYXJpbHkgcGF0Y2ggWGVuIDQuMTIgZm9yIGRv
d25zdHJlYW0gdXNlCj4gCj4gUGF0Y2hpbmcgdGhlIG1hY3JvcyBmb3IgT3BlblhUIGlzIHBlcmZl
Y3RseSBmaW5lLCBidXQgaXQgd291bGQgYmUKPiBiZXR0ZXIgdG8gdW5kZXJzdGFuZCBhbmQgZml4
IHRoZSBwcm9ibGVtIHVwc3RyZWFtIGlmIHBvc3NpYmxlLgo+IAo+IEhvdyBhcmUgeW91IHBhdGNo
aW5nIHRoZSBtYWNyb3M/Cj4gCj4gV2hhdCBhcmUgeW91IHRyeWluZyB0byBhY2hpZXZlIGJ5IHBh
dGNoaW5nIHRoZW0/Cj4gCj4gVGhhbmtzLCBSb2dlci4KPiAKPiBfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IFhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKPiBY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKPiBodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVsCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
