From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 5/7] public / x86: introduce
 __HYPERCALL_iommu_op
Date: Thu, 07 Jun 2018 09:41:37 -0600
Message-ID: <5B19523102000078001C935E@prv1-mh.provo.novell.com>
References: <20180212104714.1922-1-paul.durrant@citrix.com>
 <20180212104714.1922-6-paul.durrant@citrix.com>
 <5AABC5B402000078001B2C6B@prv-mh.provo.novell.com>
 <efc86f12783d4ab0b6ef15f50a7d59e2@AMSPEX02CL03.citrite.net>
 <5B19315402000078001C91C3@prv1-mh.provo.novell.com>
 <ab6e3d25-f0dc-1e1a-0b11-522a36217b79@citrix.com>
 <037261924f504968b8cfbcd882f9bf83@AMSPEX02CL03.citrite.net>
 <23321.16210.868949.648522@mariner.uk.xensource.com>
 <98d6267dded342d7ab9263b86b265bb1@AMSPEX02CL03.citrite.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=jlm1=iz=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fQx2l-0000wH-7l
 for xen-devel@lists.xenproject.org; Thu, 07 Jun 2018 15:41:43 +0000
In-Reply-To: <98d6267dded342d7ab9263b86b265bb1@AMSPEX02CL03.citrite.net>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <paul.durrant@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, george.dunlap@citrix.com, Ian Jackson <Ian.Jackson@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Daniel de Graaf <dgdegra@tycho.nsa.gov>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA3LjA2LjE4IGF0IDE3OjIxLCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+IHdyb3Rl
Ogo+PiAgLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0KPj4gRnJvbTogSWFuIEphY2tzb24gW21h
aWx0bzppYW4uamFja3NvbkBjaXRyaXguY29tXQo+PiBTZW50OiAwNyBKdW5lIDIwMTggMTU6MjEK
Pj4gVG86IFBhdWwgRHVycmFudCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+Cj4+IENjOiBHZW9y
Z2UgRHVubGFwIDxHZW9yZ2UuRHVubGFwQGNpdHJpeC5jb20+OyBKYW4gQmV1bGljaAo+PiA8SkJl
dWxpY2hAc3VzZS5jb20+OyBBbmRyZXcgQ29vcGVyIDxBbmRyZXcuQ29vcGVyM0BjaXRyaXguY29t
PjsgV2VpCj4+IExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT47IFN0ZWZhbm8gU3RhYmVsbGluaSA8
c3N0YWJlbGxpbmlAa2VybmVsLm9yZz47IHhlbi0KPj4gZGV2ZWwgPHhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZz47IEtvbnJhZCBSemVzenV0ZWsgV2lsawo+PiA8a29ucmFkLndpbGtAb3Jh
Y2xlLmNvbT47IERhbmllbCBkZSBHcmFhZiA8ZGdkZWdyYUB0eWNoby5uc2EuZ292PjsgVGltCj4+
IChYZW4ub3JnKSA8dGltQHhlbi5vcmc+Cj4+IFN1YmplY3Q6IFJFOiBbUEFUQ0ggNS83XSBwdWJs
aWMgLyB4ODY6IGludHJvZHVjZSBfX0hZUEVSQ0FMTF9pb21tdV9vcAo+PiAKPj4gUGF1bCBEdXJy
YW50IHdyaXRlcyAoIlJFOiBbUEFUQ0ggNS83XSBwdWJsaWMgLyB4ODY6IGludHJvZHVjZQo+PiBf
X0hZUEVSQ0FMTF9pb21tdV9vcCIpOgo+PiA+IEZXSVcgTGludXggYXBwZWFycyB0byB1c2UgYSBz
aW5nbGUgJ18nIHByZWZpeCBhbmQgbm8gc3VmZml4Lgo+PiAKPj4gVGhpcyBwcmFjdGljZSBvZiBz
Y2F0dGVyaW5nIHVuZGVyc2NvcmVzIGFib3V0LCBhcHBhcmVudGx5IGF0IHJhbmRvbSwKPj4gaXMg
YmFmZmxpbmcgdG8gbWUuCj4+IAo+PiBJdCBkb2Vzbid0IGxvb2sgbGlrZSBtb3N0IG9mIHRoZSBw
ZW9wbGUgd2hvIGRvIGl0IGFyZSBhd2FyZSBvZiB0aGUKPj4gcnVsZXMuICBGb3IgZXhhbXBsZSwg
I2RlZmluaW5nIGFueSBpZGVudGlmaWVyIHN0YXJ0aW5nIF9fIGlzIGEgbGljZW5jZQo+PiB0byB0
aGUgY29tcGlsZXIgdG8gc3R1ZmYgZGVtb25zIHVwIHlvdXIgbm9zZS4KPj4gCj4+IFdlIHNob3Vs
ZCBkbyB0aGlzOgo+PiAgICNkZWZpbmUgWEVOX1BVQkxJQ19JT01NVV9PUF9ICj4+IHdoaWNoIGlz
IChpKSBub3QgaW4gYW55IG9mIHRoZSBjb21waWxlcidzIG5hbWVzcGFjZXMgKGlpKSBoYXMgWEVO
XyBhdAo+PiB0aGUgYmVnaW5uaW5nIHNvIHdlIGNhbiBqdXN0aWZ5IHRoaW5raW5nIHRoYXQgaXQg
d29uJ3QgY2xhc2ggd2l0aAo+PiBhbnlvbmUgZWxzZSdzIGlkZW50aWZpZXJzIChJaWkpIHdpbGwg
bmV2ZXIgY2xhc2ggd2l0aCBhbnkgb2Ygb3VyIG93bgo+PiBiZWNhdXNlIGl0IGVuZHMgaW4gX0gu
Cj4+IAo+IAo+IFNvdW5kcyBvayB0byBtZS4gUGF0Y2ggdG8gQ09ESU5HX1NUWUxFPwoKSSd2ZSBz
ZW50IGEgcGF0Y2ggYWxyZWFkeSwgYnV0IHRoYXQncyBhZGRyZXNzaW5nIHRoZSBvdGhlciBhc3Bl
Y3QuIEkKZG9uJ3QgdGhpbmsgQ09ESU5HX1NUWUxFIG5lZWRzIHRvIHRhbGsgYWJvdXQgY29uZm9y
bWluZyB3aXRoCmxhbmd1YWdlIHN0YW5kYXJkcy4gVG8gcmVkdWNlIHRoZSByaXNrIG9mIG1pc2d1
aWRpbmcgcGVvcGxlLCBJIGFncmVlCndlIHNob3VsZCBzZWUgYWJvdXQgcmVkdWNpbmcgdGhlIG51
bWJlciBvZiBleGlzdGluZyB2aW9sYXRpb25zLiBXZSd2ZQpiZWVuIGRvaW5nIHRoaXMgZm9yIHF1
aXRlIGEgd2hpbGUsIGJ1dCB0aGUgcHJvY2VzcyBpcyByYXRoZXIgc2xvdyBnb2luZywKbGFyZ2Vs
eSBiZWNhdXNlIHNvIGZhciB3ZSBtb3N0bHkgY2hhbmdlIHRoaW5ncyB3ZSBuZWVkIHRvIHRvdWNo
CmFueXdheS4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
