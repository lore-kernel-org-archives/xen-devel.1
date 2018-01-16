From: Anthony Liguori <anthony@codemonkey.ws>
Subject: Re: Rudolph: merging Vixen and Comet
Date: Tue, 16 Jan 2018 19:23:43 +0100
Message-ID: <CA+aC4ktSKZX_LG7efR337swWUBdynvNxGVMQ3Ab+Fvy9U8RpJA@mail.gmail.com>
References: <20180112132409.4d4fn6mbprgm7vhg@citrix.com>
 <20180112141704.GC16260@aepfle.de>
 <20180112142030.puipf25gp2fooaxe@citrix.com>
 <808b6de4-be69-4a4c-1cd3-40b6dc8a5bde@cardoe.com>
 <CAFLBxZYsneE=pst_aJ0rEyV_855UD4PfUAuQiogxL9hG_9nRKg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=rye0=el=codemonkey.ws=anthony@srs-us1.protection.inumbo.net>)
 id 1ebVtj-0007iL-Ny
 for xen-devel@lists.xenproject.org; Tue, 16 Jan 2018 18:23:47 +0000
Received: by mail-lf0-x241.google.com with SMTP id a204so10318717lfa.2
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jan 2018 10:23:45 -0800 (PST)
In-Reply-To: <CAFLBxZYsneE=pst_aJ0rEyV_855UD4PfUAuQiogxL9hG_9nRKg@mail.gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: George Dunlap <dunlapg@umich.edu>
Cc: Olaf Hering <olaf@aepfle.de>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <JBeulich@suse.com>, KarimAllah Ahmed <karahmed@amazon.de>, =?UTF-8?Q?Jan_H=2E_Sch=C3=B6nherr?= <jschoenh@amazon.de>, Doug Goldstein <cardoe@cardoe.com>, Anthony Liguori <aliguori@amazon.com>, Xen-devel <xen-devel@lists.xenproject.org>, Matt Wilson <msw@amazon.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBKYW4gMTYsIDIwMTggYXQgNTo1MSBQTSwgR2VvcmdlIER1bmxhcCA8ZHVubGFwZ0B1
bWljaC5lZHU+IHdyb3RlOgo+IE9uIFR1ZSwgSmFuIDE2LCAyMDE4IGF0IDQ6NDIgUE0sIERvdWcg
R29sZHN0ZWluIDxjYXJkb2VAY2FyZG9lLmNvbT4gd3JvdGU6Cj4+IE9uIDEvMTIvMTggODoyMCBB
TSwgV2VpIExpdSB3cm90ZToKPj4+IE9uIEZyaSwgSmFuIDEyLCAyMDE4IGF0IDAzOjE3OjA0UE0g
KzAxMDAsIE9sYWYgSGVyaW5nIHdyb3RlOgo+Pj4+IE9uIEZyaSwgSmFuIDEyLCBXZWkgTGl1IHdy
b3RlOgo+Pj4+Cj4+Pj4+ICAgICAgICAgICAgICAgICAgICAgICBWaXhlbiAgICAgICAgICAgICAg
ICAgICAgICAgICAgQ29tZXQKPj4+Pj4gR3Vlc3QgY29uc29sZSAgICAgICAgIE91dHB1dCBvbmx5
ICAgICAgICAgICAgICAgICAgICBCaS1kaXJlY3Rpb25hbAo+Pj4+Cj4+Pj4gV2l0aCB0aGUgcHJv
cGVyIHBhdGNoIGlucHV0IHdvcmtzIGZvciBWaXhlbi4gVW5sZXNzIHRoaXMgaXRlbSBtZWFuCj4+
Pj4gc29tZXRoaW5nIGVsc2UuCj4+Pgo+Pj4gVml4ZW4gbWVhbnMgdGhlIHZlcnNpb24gdXBzdHJl
YW0gcHV0IGludG8gdGhlIGFkdmlzb3J5LiBUaGUgcGF0Y2ggeW91Cj4+PiB0YWxrZWQgYWJvdXQg
aXMgbm90IHByb3ZpZGVkIGluIHRoYXQgYnJhbmNoLgo+Pj4KPj4+IFdlaS4KPj4+Cj4+Cj4+IENh
biB3ZSBtZXJnZSBzb21lIGZpeGVzIHBlb3BsZSBoYXZlIHByb3Bvc2VkIGludG8gdGhlIFZpeGVu
IGJyYW5jaD8KPj4gVGhlcmUgYXJlIGEgbnVtYmVyIG9mIHZpcnR1YWxpemF0aW9uIHByb3ZpZGVy
cyB0aGF0IGhhdmUgcm9sbGVkIGZvcndhcmQKPj4gd2l0aCBWaXhlbi4gVGhleSBhcmUgY2xlYXJs
eSBjb250cmlidXRpbmcgcGF0Y2hlcyBvbiB0aGUgTUwgYW5kIGhhdmluZwo+PiBvbmUgcGxhY2Ug
dG8gd29yayB0b2dldGhlciB3b3VsZCBiZSBuaWNlLgo+Cj4gSWYgQW50aG9ueSBpcyBPSywgd2Ug
Y2FuIGNhbGwgaGltIHRoZSAibWFpbnRhaW5lciIgZm9yIHRoZSBWaXhlbgo+IGJyYW5jaDsgdGhl
IGNvbW1pdHRlcnMgY2FuIGNoZWNrIGluIGFueXRoaW5nIHRoYXQgaGFzIGhpcyBBY2sgdG8gdGhl
Cj4gVml4ZW4gYnJhbmNoLCBhbmQgdGhlIFNlY3VyaXR5IFRlYW0gY2FuIHBvc3QgbmV3IHNpZ25l
ZCB0YWdzIHdoZW4KPiBhcHByb3ByaWF0ZS4KPgo+IEl0IGxvb2tlZCBsaWtlIEFudGhvbnkgaGFk
IHNvbWUgaXNzdWVzIHdpdGggdGhlIG1vc3QgcmVjZW50IHBhdGNoIHRob3VnaC4KCkkgYW0gdmVy
eSBoYXBweSB0byByZXZpZXcgc3R1ZmYgZm9yIHRoZSBWaXhlbiBicmFuY2ggYnV0IEknbSBldmVu
IG1vcmUKZWFnZXIgdG8gZ2V0IFZpeGVuIGFuZCBDb21ldCBtZXJnZWQuICBHZXR0aW5nIENvbWV0
IGludG8gc3RhZ2luZyB3aWxsCmhlbHAgb3V0IHVzIGEgbG90LgoKUmVnYXJkcywKCkFudGhvbnkg
TGlndW9yaQoKPiAgLUdlb3JnZQo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KPiBYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Cj4gWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCj4gaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
