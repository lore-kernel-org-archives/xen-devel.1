From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: Rudolph: merging Vixen and Comet
Date: Tue, 16 Jan 2018 19:00:48 +0000
Message-ID: <20180116190048.cwejkl4egik2rxv6@citrix.com>
References: <20180112132409.4d4fn6mbprgm7vhg@citrix.com>
 <20180112141704.GC16260@aepfle.de>
 <20180112142030.puipf25gp2fooaxe@citrix.com>
 <808b6de4-be69-4a4c-1cd3-40b6dc8a5bde@cardoe.com>
 <CAFLBxZYsneE=pst_aJ0rEyV_855UD4PfUAuQiogxL9hG_9nRKg@mail.gmail.com>
 <CA+aC4ktSKZX_LG7efR337swWUBdynvNxGVMQ3Ab+Fvy9U8RpJA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=xstf=el=citrix.com=prvs=5473c9914=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1ebWTi-00037U-4F
 for xen-devel@lists.xenproject.org; Tue, 16 Jan 2018 19:00:58 +0000
Content-Disposition: inline
In-Reply-To: <CA+aC4ktSKZX_LG7efR337swWUBdynvNxGVMQ3Ab+Fvy9U8RpJA@mail.gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Anthony Liguori <anthony@codemonkey.ws>
Cc: Olaf Hering <olaf@aepfle.de>, Wei Liu <wei.liu2@citrix.com>, Anthony Liguori <aliguori@amazon.com>, KarimAllah Ahmed <karahmed@amazon.de>, George Dunlap <dunlapg@umich.edu>, Jan =?iso-8859-1?Q?H=2E_Sch=F6nherr?= <jschoenh@amazon.de>, Doug Goldstein <cardoe@cardoe.com>, Jan Beulich <JBeulich@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>, Matt Wilson <msw@amazon.com>, Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBKYW4gMTYsIDIwMTggYXQgMDc6MjM6NDNQTSArMDEwMCwgQW50aG9ueSBMaWd1b3Jp
IHdyb3RlOgo+IE9uIFR1ZSwgSmFuIDE2LCAyMDE4IGF0IDU6NTEgUE0sIEdlb3JnZSBEdW5sYXAg
PGR1bmxhcGdAdW1pY2guZWR1PiB3cm90ZToKPiA+IE9uIFR1ZSwgSmFuIDE2LCAyMDE4IGF0IDQ6
NDIgUE0sIERvdWcgR29sZHN0ZWluIDxjYXJkb2VAY2FyZG9lLmNvbT4gd3JvdGU6Cj4gPj4gT24g
MS8xMi8xOCA4OjIwIEFNLCBXZWkgTGl1IHdyb3RlOgo+ID4+PiBPbiBGcmksIEphbiAxMiwgMjAx
OCBhdCAwMzoxNzowNFBNICswMTAwLCBPbGFmIEhlcmluZyB3cm90ZToKPiA+Pj4+IE9uIEZyaSwg
SmFuIDEyLCBXZWkgTGl1IHdyb3RlOgo+ID4+Pj4KPiA+Pj4+PiAgICAgICAgICAgICAgICAgICAg
ICAgVml4ZW4gICAgICAgICAgICAgICAgICAgICAgICAgIENvbWV0Cj4gPj4+Pj4gR3Vlc3QgY29u
c29sZSAgICAgICAgIE91dHB1dCBvbmx5ICAgICAgICAgICAgICAgICAgICBCaS1kaXJlY3Rpb25h
bAo+ID4+Pj4KPiA+Pj4+IFdpdGggdGhlIHByb3BlciBwYXRjaCBpbnB1dCB3b3JrcyBmb3IgVml4
ZW4uIFVubGVzcyB0aGlzIGl0ZW0gbWVhbgo+ID4+Pj4gc29tZXRoaW5nIGVsc2UuCj4gPj4+Cj4g
Pj4+IFZpeGVuIG1lYW5zIHRoZSB2ZXJzaW9uIHVwc3RyZWFtIHB1dCBpbnRvIHRoZSBhZHZpc29y
eS4gVGhlIHBhdGNoIHlvdQo+ID4+PiB0YWxrZWQgYWJvdXQgaXMgbm90IHByb3ZpZGVkIGluIHRo
YXQgYnJhbmNoLgo+ID4+Pgo+ID4+PiBXZWkuCj4gPj4+Cj4gPj4KPiA+PiBDYW4gd2UgbWVyZ2Ug
c29tZSBmaXhlcyBwZW9wbGUgaGF2ZSBwcm9wb3NlZCBpbnRvIHRoZSBWaXhlbiBicmFuY2g/Cj4g
Pj4gVGhlcmUgYXJlIGEgbnVtYmVyIG9mIHZpcnR1YWxpemF0aW9uIHByb3ZpZGVycyB0aGF0IGhh
dmUgcm9sbGVkIGZvcndhcmQKPiA+PiB3aXRoIFZpeGVuLiBUaGV5IGFyZSBjbGVhcmx5IGNvbnRy
aWJ1dGluZyBwYXRjaGVzIG9uIHRoZSBNTCBhbmQgaGF2aW5nCj4gPj4gb25lIHBsYWNlIHRvIHdv
cmsgdG9nZXRoZXIgd291bGQgYmUgbmljZS4KPiA+Cj4gPiBJZiBBbnRob255IGlzIE9LLCB3ZSBj
YW4gY2FsbCBoaW0gdGhlICJtYWludGFpbmVyIiBmb3IgdGhlIFZpeGVuCj4gPiBicmFuY2g7IHRo
ZSBjb21taXR0ZXJzIGNhbiBjaGVjayBpbiBhbnl0aGluZyB0aGF0IGhhcyBoaXMgQWNrIHRvIHRo
ZQo+ID4gVml4ZW4gYnJhbmNoLCBhbmQgdGhlIFNlY3VyaXR5IFRlYW0gY2FuIHBvc3QgbmV3IHNp
Z25lZCB0YWdzIHdoZW4KPiA+IGFwcHJvcHJpYXRlLgo+ID4KPiA+IEl0IGxvb2tlZCBsaWtlIEFu
dGhvbnkgaGFkIHNvbWUgaXNzdWVzIHdpdGggdGhlIG1vc3QgcmVjZW50IHBhdGNoIHRob3VnaC4K
PiAKPiBJIGFtIHZlcnkgaGFwcHkgdG8gcmV2aWV3IHN0dWZmIGZvciB0aGUgVml4ZW4gYnJhbmNo
IGJ1dCBJJ20gZXZlbiBtb3JlCj4gZWFnZXIgdG8gZ2V0IFZpeGVuIGFuZCBDb21ldCBtZXJnZWQu
ICBHZXR0aW5nIENvbWV0IGludG8gc3RhZ2luZyB3aWxsCj4gaGVscCBvdXQgdXMgYSBsb3QuCj4g
CgpJIGp1c3QgcHVzaGVkIGEgYnVuY2ggb2YgY29tZXQgcGF0Y2hlcyB0byBzdGFnaW5nLiBJIHdp
bGwgcHVzaCBzb21lIG9mCnRoZSBwZW5kaW5nIGZpeGVzIHRvbW9ycm93LgoKV2VpLgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
