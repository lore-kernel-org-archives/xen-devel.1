From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [Minios-devel] automation: Creating a patchwork
 instance to improve pre-commit build testing
Date: Tue, 24 Jul 2018 10:46:43 +0100
Message-ID: <20180724094643.h2tzxh3rvupqcqwt@citrix.com>
References: <DD622B30-B54C-4B9A-AA24-05329BD800B9@citrix.com>
 <5B56EC0002000078001D708C@prv1-mh.provo.novell.com>
 <20180724092430.puacbfkbimdm5anz@citrix.com>
 <07A3F9EF-AF5C-4E46-BBA0-31A77C90D3F9@xenproject.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=2t9p=ki=citrix.com=prvs=736d78cd4=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1fhtu3-0003SS-QD
 for xen-devel@lists.xenproject.org; Tue, 24 Jul 2018 09:46:47 +0000
Content-Disposition: inline
In-Reply-To: <07A3F9EF-AF5C-4E46-BBA0-31A77C90D3F9@xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Lars Kurth <lars.kurth.xen@gmail.com>
Cc: Lars Kurth <lars.kurth@citrix.com>, Iurii Artemenko <Iurii_Artemenko@epam.com>, Wei Liu <wei.liu2@citrix.com>, Doug Goldstein <cardoe@cardoe.com>, Minios-devel <minios-devel@lists.xenproject.org>, Committers <committers@xenproject.org>, 'Jan Beulich' <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>, Matt Spencer <Matt.Spencer@arm.com>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBKdWwgMjQsIDIwMTggYXQgMTA6Mzg6MjRBTSArMDEwMCwgTGFycyBLdXJ0aCB3cm90
ZToKPiAKPiAKPiA+IE9uIDI0IEp1bCAyMDE4LCBhdCAxMDoyNCwgV2VpIExpdSA8d2VpLmxpdTJA
Y2l0cml4LmNvbT4gd3JvdGU6Cj4gPiAKPiA+IE9uIFR1ZSwgSnVsIDI0LCAyMDE4IGF0IDAzOjA2
OjA4QU0gLTA2MDAsIEphbiBCZXVsaWNoIHdyb3RlOgo+ID4+Pj4+IE9uIDIzLjA3LjE4IGF0IDE4
OjQwLCA8bGFycy5rdXJ0aEBjaXRyaXguY29tPiB3cm90ZToKPiA+Pj4gIyBIb3cgZG9lcyB0aGlz
IGltcGFjdCBtZT8KPiA+Pj4gVGhlIGNvbnRyaWJ1dGlvbiB3b3JrZmxvdyBpcyAqbm90KiBpbXBh
Y3RlZCBieSB0aGlzIGNoYW5nZSwgYnV0IG9uY2UgdXAgYW5kIAo+ID4+PiBydW5uaW5nIHRoZSBm
b2xsb3dpbmcgd2lsbCBoYXBwZW4gb25jZSB5b3UgcG9zdCBhIHBhdGNoIG9yIHBhdGNoIHNlcmll
cyB0byAKPiA+Pj4geGVuLWRldmVsOgo+ID4+PiAqIFBhdGNod29yayB3aWxsIHRha2UgcGF0Y2gg
c2VyaWVzIGZyb20gdGhlIG1haWxpbmcgbGlzdCBhbmQgYXBwbGllcyBpdAo+ID4+PiAqIENJL0RD
IHRlc3RpbmcgaXMgdHJpZ2dlcmVkCj4gPj4+ICogQSB0ZXN0IHJlcG9ydCB3aWxsIGJlIHNlbnQg
YXMgYSBtYWlsIHRvIHRoZSBwYXRjaCBvciB0aGUgc2VyaWVzIChha2EgdGhlIDAwIHBhdGNoIG9m
IHRoZSBzZXJpZXMpCj4gPj4+IAo+ID4+PiBUaGlzIGRvZXMgbWVhbiB0aG91Z2ggdGhhdCBzZXJp
ZXMgd2hpY2ggZG8gbm90IGJ1aWxkIG9yIHNob3cgb3RoZXIgaXNzdWVzLCAKPiA+Pj4gd2lsbCBs
aWtlbHkgbm90IGJlIHJldmlld2VkIHVudGlsIHRoZSB0ZXN0cyBwYXNzLiBUaGlzIHdvdWxkIGxl
c3NlbiB0aGUgCj4gPj4+IGJ1cmRlbiBvbiByZXZpZXdlcnMsIGFzIHRoZXkgd2lsbCBrbm93IHdo
ZXRoZXIgdGhlIGNvZGUgc3VibWl0dGVkIGJ1aWxkcyBvbiBhIAo+ID4+PiB3aWRlIGFycmF5IG9m
IGVudmlyb25tZW50cy4gCj4gPj4gCj4gPj4gU28gaG93IGFyZSBkZXBlbmRlbmNpZXMgYmV0d2Vl
biBzZXJpZXMgaW50ZW5kZWQgdG8gYmUgZGVhbHQgd2l0aD8gSXQKPiA+PiBpcyBub3QgdW5jb21t
b24gZm9yIHNvbWVvbmUgdG8gc2F5ICJhcHBsaWVzIG9ubHkgb24gdG9wIG9mIHh5eiIuIFRoZQo+
ID4+IGltcGxpY2F0aW9uIG9mICJ3aWxsIGxpa2VseSBub3QgYmUgcmV2aWV3ZWQgdW50aWwgdGhl
IHRlc3RzIHBhc3MiIHNlZW1zCj4gPj4gdW5zdWl0YWJsZSB0byBtZSBpbiBzdWNoIGEgY2FzZS4K
PiA+PiAKPiA+IAo+ID4gV2UgaGF2ZSBiZWVuIGFza2luZyBldmVyeW9uZSB0byByZWJhc2UgdG8g
c3RhZ2luZyBiZWZvcmUgcG9zdGluZyBhIG5ldwo+ID4gdmVyc2lvbiBmb3IgYSBsb25nIHRpbWUu
ICBJdCBpcyBuYXR1cmFsIGZvciB0aGUgYm90IHRvIGFzc3VtZSB0aGF0Cj4gPiBldmVyeXRoaW5n
IHNob3VsZCBhcHBseSBvbiB0b3Agb2Ygc3RhZ2luZy4gVGhhdCB3b3VsZCBwcm92aWRlIG1vc3Qg
dmFsdWUKPiA+IHRvIHRoZSBjb21tdW5pdHkuCj4gPiAKPiA+IEZvciBzcGVjaWFsIGNhc2VzIGxp
a2UgeW91IGp1c3QgbWVudGlvbiwgd2Ugc2hvdWxkIGFpbSB0byBwcm92aWRlCj4gPiBtZWNoYW5p
c21zIHRvIG1hbnVhbGx5IGFwcG9pbnQgYSBicmFuY2ggdG8gYmUgdGVzdGVkLgo+IAo+IFdlaSwg
RG91ZzogSSBoYXZlIGFub3RoZXIgcXVlc3Rpb24sIHdoaWNoIGlzIG1haW5seSBmb3IgbXkgb3du
IHVuZGVyc3RhbmRpbmcuIAo+IAo+IFJpZ2h0IG5vdyB3ZSBhbGxvdyBwb3N0aW5nIG9mIHBhdGNo
ZXMgdG8gTGludXgsIFFlbXUsIHhlbi5naXQsCj4gT1NTVEVTVCwgLi4uIHRvIHhlbi1kZXZlbC4g
VGhlIHBsYW5uZWQgQ0kgaW5mcmFzdHJ1Y3R1cmUgb25seSBhcHBsaWVzCj4gdG8geGVuLmdpdC4g
SGF2ZSB5b3UgdGhvdWdodCBhYm91dCBob3cgdG8gaGFuZGxlIHN1Y2ggY2FzZXM/IAoKTm8uIEkg
aGF2ZW4ndC4gIFdlIG1heSBiZSBhYmxlIHRvIHVzZSBzb21lIGhldXJpc3RpY3MgaGVyZS4KCldl
aS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
