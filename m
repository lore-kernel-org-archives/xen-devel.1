From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: automation: Creating a patchwork instance to
 improve pre-commit build testing
Date: Tue, 24 Jul 2018 10:14:45 +0100
Message-ID: <8a113daf-30c4-e406-9041-d25561e61be7@citrix.com>
References: <DD622B30-B54C-4B9A-AA24-05329BD800B9@citrix.com>
 <5B56EC0002000078001D708C@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=szwa=ki=citrix.com=prvs=736780ccf=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1fhtPO-0008Jf-Vx
 for xen-devel@lists.xenproject.org; Tue, 24 Jul 2018 09:15:07 +0000
In-Reply-To: <5B56EC0002000078001D708C@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, Doug Goldstein <cardoe@cardoe.com>, Lars Kurth <lars.kurth@citrix.com>, Wei Liu <wei.liu2@citrix.com>
Cc: Minios-devel <minios-devel@lists.xenproject.org>, xen-devel <xen-devel@lists.xenproject.org>, Iurii Artemenko <Iurii_Artemenko@epam.com>, committers@xenproject.org, Matt Spencer <Matt.Spencer@arm.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjQvMDcvMTggMTA6MDYsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDIzLjA3LjE4IGF0
IDE4OjQwLCA8bGFycy5rdXJ0aEBjaXRyaXguY29tPiB3cm90ZToKPj4gIyBIb3cgZG9lcyB0aGlz
IGltcGFjdCBtZT8KPj4gVGhlIGNvbnRyaWJ1dGlvbiB3b3JrZmxvdyBpcyAqbm90KiBpbXBhY3Rl
ZCBieSB0aGlzIGNoYW5nZSwgYnV0IG9uY2UgdXAgYW5kIAo+PiBydW5uaW5nIHRoZSBmb2xsb3dp
bmcgd2lsbCBoYXBwZW4gb25jZSB5b3UgcG9zdCBhIHBhdGNoIG9yIHBhdGNoIHNlcmllcyB0byAK
Pj4geGVuLWRldmVsOgo+PiAqIFBhdGNod29yayB3aWxsIHRha2UgcGF0Y2ggc2VyaWVzIGZyb20g
dGhlIG1haWxpbmcgbGlzdCBhbmQgYXBwbGllcyBpdAo+PiAqIENJL0RDIHRlc3RpbmcgaXMgdHJp
Z2dlcmVkCj4+ICogQSB0ZXN0IHJlcG9ydCB3aWxsIGJlIHNlbnQgYXMgYSBtYWlsIHRvIHRoZSBw
YXRjaCBvciB0aGUgc2VyaWVzIChha2EgdGhlIDAwIHBhdGNoIG9mIHRoZSBzZXJpZXMpCj4+Cj4+
IFRoaXMgZG9lcyBtZWFuIHRob3VnaCB0aGF0IHNlcmllcyB3aGljaCBkbyBub3QgYnVpbGQgb3Ig
c2hvdyBvdGhlciBpc3N1ZXMsIAo+PiB3aWxsIGxpa2VseSBub3QgYmUgcmV2aWV3ZWQgdW50aWwg
dGhlIHRlc3RzIHBhc3MuIFRoaXMgd291bGQgbGVzc2VuIHRoZSAKPj4gYnVyZGVuIG9uIHJldmll
d2VycywgYXMgdGhleSB3aWxsIGtub3cgd2hldGhlciB0aGUgY29kZSBzdWJtaXR0ZWQgYnVpbGRz
IG9uIGEgCj4+IHdpZGUgYXJyYXkgb2YgZW52aXJvbm1lbnRzLiAKPiBTbyBob3cgYXJlIGRlcGVu
ZGVuY2llcyBiZXR3ZWVuIHNlcmllcyBpbnRlbmRlZCB0byBiZSBkZWFsdCB3aXRoPyBJdAo+IGlz
IG5vdCB1bmNvbW1vbiBmb3Igc29tZW9uZSB0byBzYXkgImFwcGxpZXMgb25seSBvbiB0b3Agb2Yg
eHl6Ii4gVGhlCj4gaW1wbGljYXRpb24gb2YgIndpbGwgbGlrZWx5IG5vdCBiZSByZXZpZXdlZCB1
bnRpbCB0aGUgdGVzdHMgcGFzcyIgc2VlbXMKPiB1bnN1aXRhYmxlIHRvIG1lIGluIHN1Y2ggYSBj
YXNlLgoKOTklIG9mIHN1Ym1pc3Npb25zIGFyZW4ndCAiYXBwbGllcyBvbiB0b3Agb2YgeHl6Ii4K
CkFsdGVybmF0aXZlLCBob3cgYWJvdXQgd2Ugc2VlIGFib3V0IG5vdCBibG9ja2luZyB1bmRlcmx5
aW5nIHBhdGNoZXMgZm9yCnVucmVhc29uYWJsZSBwZXJpb2RzIG9mIHRpbWU/Cgp+QW5kcmV3Cgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
