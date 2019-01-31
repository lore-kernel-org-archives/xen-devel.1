From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v7 04/15] argo: init, destroy and soft-reset,
 with enable command line opt
Date: Thu, 31 Jan 2019 09:37:45 -0700
Message-ID: <5C5324590200007800212E19@prv1-mh.provo.novell.com>
References: <1548908900-1128-1-git-send-email-christopher.w.clark@gmail.com>
 <1548908900-1128-5-git-send-email-christopher.w.clark@gmail.com>
 <20190131144914.qfoyz2uu4prpkpbo@mac>
 <5C5310970200007800212D5A@prv1-mh.provo.novell.com>
 <20190131160519.l4h75wgctcqkdyx6@mac>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=qOm0=QH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gpFLY-0008SP-L2
 for xen-devel@lists.xenproject.org; Thu, 31 Jan 2019 16:37:48 +0000
In-Reply-To: <20190131160519.l4h75wgctcqkdyx6@mac>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Juergen Gross <jgross@suse.com>, Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, ross.philipson@gmail.com, Jason Andryuk <jandryuk@gmail.com>, Daniel Smith <dpsmith@apertussolutions.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Christopher Clark <christopher.w.clark@gmail.com>, Rich Persaud <persaur@gmail.com>, James McKenzie <james@bromium.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, eric chanudet <eric.chanudet@gmail.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDMxLjAxLjE5IGF0IDE3OjA1LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IE9uIFRodSwgSmFuIDMxLCAyMDE5IGF0IDA4OjEzOjI3QU0gLTA3MDAsIEphbiBCZXVsaWNoIHdy
b3RlOgo+PiA+Pj4gT24gMzEuMDEuMTkgYXQgMTU6NDksIDxyb2dlci5wYXVAY2l0cml4LmNvbT4g
d3JvdGU6Cj4+ID4gT24gV2VkLCBKYW4gMzAsIDIwMTkgYXQgMDg6Mjg6MDlQTSAtMDgwMCwgQ2hy
aXN0b3BoZXIgQ2xhcmsgd3JvdGU6Cj4+ID4+ICtzdGF0aWMgdm9pZAo+PiA+PiArcGVuZGluZ19y
ZW1vdmVfYWxsKGNvbnN0IHN0cnVjdCBkb21haW4gKmQsIHN0cnVjdCBhcmdvX3JpbmdfaW5mbyAq
cmluZ19pbmZvKQo+PiA+PiArewo+PiA+PiArICAgIHN0cnVjdCBwZW5kaW5nX2VudCAqZW50LCAq
bmV4dDsKPj4gPj4gKwo+PiA+PiArICAgIEFTU0VSVChMT0NLSU5HX0wzKGQsIHJpbmdfaW5mbykp
Owo+PiA+PiArCj4+ID4+ICsgICAgLyogRGVsZXRlIGFsbCBwZW5kaW5nIG5vdGlmaWNhdGlvbnMg
ZnJvbSB0aGlzIHJpbmcncyBsaXN0LiAqLwo+PiA+PiArICAgIGxpc3RfZm9yX2VhY2hfZW50cnlf
c2FmZShlbnQsIG5leHQsICZyaW5nX2luZm8tPnBlbmRpbmcsIG5vZGUpCj4+ID4gCj4+ID4gbGlz
dF9maXJzdF9lbnRyeV9vcl9udWxsIGFuZCB5b3UgY2FuIGdldCByaWQgb2YgbmV4dC4KPj4gCj4+
IFdlbGwsIHRoYXQncyBhIHN1YnN0aXR1dGlvbiBJIHdvdWxkbid0IGxpa2UgdG8gZG8gd2hpbGUg
Y29tbWl0dGluZywKPj4gYXMgaXQgbWVhbnMgZG9pbmcgYSBsaXR0bGUgbW9yZSB0aGFuIGEgc2lt
cGxlIHRleHQgcmVwbGFjZW1lbnQuCj4gCj4gRnJvbSBhIGZ1bmN0aW9uYWxpdHkgUG9WIHRoZSBj
b2RlIGRvZXMgZXhhY3RseSB0aGUgc2FtZSwgSSBqdXN0IHRoaW5rCj4gbGlzdF9maXJzdF9lbnRy
eV9vcl9udWxsIGlzIG1vcmUgc3VpdGFibGUgYW5kIEkgaGF2ZW4ndCBiZWVuIGNvbnZpbmNlZAo+
IGJ5IHRoZSBhcmd1bWVudCBwb3N0ZWQgb24gdjUuCgpXZWxsLCB3ZSdyZSBpbiBhZ3JlZW1lbnQu
IEFsbCBJIGRpZCBzYXkgaXMgdGhhdCBhIGNoYW5nZSBsaWtlIHRoaXMKSSdkIGxpa2UgdG8gc2Vl
IGRvbmUgYnkgdGhlIHN1Ym1pdHRlciwgbm90IHRoZSBjb21taXR0ZXIgKGF0IGxlYXN0Cm5vdCBp
ZiBJIGVuZCB1cCBiZWluZyB0aGUgbGF0dGVyKS4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
