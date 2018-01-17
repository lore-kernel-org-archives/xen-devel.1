From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH for-4.10.0-shim-comet] x86/guest: use the
 vcpu_info area from shared_info
Date: Wed, 17 Jan 2018 05:35:04 -0700
Message-ID: <5A5F5108020000780019F7C8@prv-mh.provo.novell.com>
References: <20180117105702.33667-1-roger.pau@citrix.com>
 <47a0b922-7a9a-1afd-d869-c7dec0774c88@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=dqeo=em=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ebmvs-0005qK-23
 for xen-devel@lists.xenproject.org; Wed, 17 Jan 2018 12:35:08 +0000
In-Reply-To: <47a0b922-7a9a-1afd-d869-c7dec0774c88@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: George Dunlap <george.dunlap@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE3LjAxLjE4IGF0IDEyOjA0LCA8Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPiB3cm90
ZToKPiBPbiAwMS8xNy8yMDE4IDEwOjU3IEFNLCBSb2dlciBQYXUgTW9ubmUgd3JvdGU6Cj4+IElm
IHVzaW5nIGxlc3MgdGhhbiAzMiB2Q1BVcyAoWEVOX0xFR0FDWV9NQVhfVkNQVVMpLgo+PiAKPj4g
VGhpcyBpcyBhIHdvcmthcm91bmQgdGhhdCBzaG91bGQgYWxsb3cgdG8gYm9vdCB0aGUgc2hpbSBv
biBoeXBlcnZpc29ycwo+PiB3aXRob3V0IGNvbW1pdCAieDg2L3VwY2FsbDogaW5qZWN0IGEgc3B1
cmlvdXMgZXZlbnQgYWZ0ZXIgc2V0dGluZwo+PiB1cGNhbGwgdmVjdG9yIiBhcyBsb25nIGFzIGxl
c3MgdGhhbiAzMiB2Q1BVcyBhcmUgYXNzaWduZWQgdG8gdGhlCj4+IHNoaW0uCj4+IAo+PiBTaWdu
ZWQtb2ZmLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KPj4gLS0t
Cj4+IENjOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4+IENjOiBBbmRyZXcgQ29v
cGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgo+PiBDYzogV2VpIExpdSA8d2VpLmxpdTJA
Y2l0cml4LmNvbT4KPj4gQ2M6IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29t
Pgo+PiBDYzogR2VvcmdlIER1bmxhcCA8Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPgo+PiAtLS0K
Pj4gT05MWSBhcHBseSB0byB0aGUgNC4xMC4wLXNoaW0tY29tZXQgYnJhbmNoLiBMb25nIHRlcm0g
d2UgZG9uJ3Qgd2FudCB0bwo+PiBjYXJyeSB0aGlzIHBhdGNoIHNpbmNlIGl0IHdvdWxkIHByZXZl
bnQgdGhlIHZjcHVfaW5mbyBtYXBwaW5nIGNvZGUKPj4gZnJvbSBiZWluZyB0ZXN0ZWQgdW5sZXNz
IGEgc2hpbSB3aXRoID4gMzIgdkNQVXMgaXMgY3JlYXRlZCwgd2hpY2gKPj4gZG9lc24ndCBzZWVt
IHZlcnkgY29tbW9uLgo+IAo+IEp1c3QgdG8gZmlsbCB0aGlzIG91dCBhIGJpdDoKPiAKPiBXaXRo
b3V0IHRoaXMgcGF0Y2gsIHBlb3BsZSBuZWVkIHRvIHJlYm9vdCB0aGVpciBMMCBoeXBlcnZpc29y
IGluIG9yZGVyCj4gdG8gdXNlIENvbWV0Lgo+IAo+IFdpdGggdGhpcyBwYXRjaCwgcGVvcGxlIG9u
bHkgbmVlZCB0byBjb21waWxlIGFuZCB1cGRhdGUgdGhlaXIgTDAgdG9vbHMKPiB0byB1c2UgQ29t
ZXQ7IHRoZXkgY2FuIGF2b2lkIHJlYm9vdGluZyB0aGVpciBMMCBoeXBlcnZpc29yLgo+IAo+IFJv
Z2VyIHdvdWxkIGxpa2UgdG8gYXZvaWQgY2hlY2tpbmcgdGhpcyBpbiB0byBzdGFnaW5nLCBiZWNh
dXNlIGhlJ3MKPiBhZnJhaWQgaXQgbWlnaHQgbWFrZSB0aGUgPjMydmNwdSBwYXRoIGJpdHJvdC4K
PiAKPiBUaGUgcmlzayBvZiBjaGVja2luZyBpdCBpbnRvIHRoZSBDb21ldCBicmFuY2hlcyBidXQg
bm90IHN0YWdpbmcgaXMgdGhhdAo+IGlmIHBlb3BsZSB1cGRhdGUgdGhlaXIgc2hpbSB0byAiUnVk
b2xwaCIgKDQuMTEpIHdpdGhvdXQgcmVib290aW5nIHRoZWlyCj4gaG9zdCwgdGhpbmdzIG1heSB1
bmV4cGVjdGVkbHkgbm90IHdvcmsuICBJIHRoaW5rIHRoYXQncyBzb21ldGhpbmcgd2UgY2FuCj4g
bGl2ZSB3aXRoLgoKSSBhZ3JlZS4gSSdtIG5vdCBzdXJlIHRoaXMgcGF0Y2ggZ29pbmcgaW50byB0
aGF0IGJyYW5jaCBvbmx5IG5lZWRzCmFuIHg4NiBtYWludGFpbmVycyBhY2ssIGJ1dCBpZiBzbywg
ZmVlbCBmcmVlIHRvIGFkZCBtaW5lLgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
