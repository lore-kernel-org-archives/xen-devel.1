From: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH for-4.10.0-shim-comet] x86/guest: use the
 vcpu_info area from shared_info
Date: Wed, 17 Jan 2018 11:04:36 +0000
Message-ID: <47a0b922-7a9a-1afd-d869-c7dec0774c88@citrix.com>
References: <20180117105702.33667-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=yrqs=em=citrix.com=prvs=548fec723=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1eblWp-0004fg-8S
 for xen-devel@lists.xenproject.org; Wed, 17 Jan 2018 11:05:11 +0000
In-Reply-To: <20180117105702.33667-1-roger.pau@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDEvMTcvMjAxOCAxMDo1NyBBTSwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+IElmIHVzaW5n
IGxlc3MgdGhhbiAzMiB2Q1BVcyAoWEVOX0xFR0FDWV9NQVhfVkNQVVMpLgo+IAo+IFRoaXMgaXMg
YSB3b3JrYXJvdW5kIHRoYXQgc2hvdWxkIGFsbG93IHRvIGJvb3QgdGhlIHNoaW0gb24gaHlwZXJ2
aXNvcnMKPiB3aXRob3V0IGNvbW1pdCAieDg2L3VwY2FsbDogaW5qZWN0IGEgc3B1cmlvdXMgZXZl
bnQgYWZ0ZXIgc2V0dGluZwo+IHVwY2FsbCB2ZWN0b3IiIGFzIGxvbmcgYXMgbGVzcyB0aGFuIDMy
IHZDUFVzIGFyZSBhc3NpZ25lZCB0byB0aGUKPiBzaGltLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFJv
Z2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgo+IC0tLQo+IENjOiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4gQ2M6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29w
ZXIzQGNpdHJpeC5jb20+Cj4gQ2M6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+Cj4gQ2M6
IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPgo+IENjOiBHZW9yZ2UgRHVu
bGFwIDxnZW9yZ2UuZHVubGFwQGNpdHJpeC5jb20+Cj4gLS0tCj4gT05MWSBhcHBseSB0byB0aGUg
NC4xMC4wLXNoaW0tY29tZXQgYnJhbmNoLiBMb25nIHRlcm0gd2UgZG9uJ3Qgd2FudCB0bwo+IGNh
cnJ5IHRoaXMgcGF0Y2ggc2luY2UgaXQgd291bGQgcHJldmVudCB0aGUgdmNwdV9pbmZvIG1hcHBp
bmcgY29kZQo+IGZyb20gYmVpbmcgdGVzdGVkIHVubGVzcyBhIHNoaW0gd2l0aCA+IDMyIHZDUFVz
IGlzIGNyZWF0ZWQsIHdoaWNoCj4gZG9lc24ndCBzZWVtIHZlcnkgY29tbW9uLgoKSnVzdCB0byBm
aWxsIHRoaXMgb3V0IGEgYml0OgoKV2l0aG91dCB0aGlzIHBhdGNoLCBwZW9wbGUgbmVlZCB0byBy
ZWJvb3QgdGhlaXIgTDAgaHlwZXJ2aXNvciBpbiBvcmRlcgp0byB1c2UgQ29tZXQuCgpXaXRoIHRo
aXMgcGF0Y2gsIHBlb3BsZSBvbmx5IG5lZWQgdG8gY29tcGlsZSBhbmQgdXBkYXRlIHRoZWlyIEww
IHRvb2xzCnRvIHVzZSBDb21ldDsgdGhleSBjYW4gYXZvaWQgcmVib290aW5nIHRoZWlyIEwwIGh5
cGVydmlzb3IuCgpSb2dlciB3b3VsZCBsaWtlIHRvIGF2b2lkIGNoZWNraW5nIHRoaXMgaW4gdG8g
c3RhZ2luZywgYmVjYXVzZSBoZSdzCmFmcmFpZCBpdCBtaWdodCBtYWtlIHRoZSA+MzJ2Y3B1IHBh
dGggYml0cm90LgoKVGhlIHJpc2sgb2YgY2hlY2tpbmcgaXQgaW50byB0aGUgQ29tZXQgYnJhbmNo
ZXMgYnV0IG5vdCBzdGFnaW5nIGlzIHRoYXQKaWYgcGVvcGxlIHVwZGF0ZSB0aGVpciBzaGltIHRv
ICJSdWRvbHBoIiAoNC4xMSkgd2l0aG91dCByZWJvb3RpbmcgdGhlaXIKaG9zdCwgdGhpbmdzIG1h
eSB1bmV4cGVjdGVkbHkgbm90IHdvcmsuICBJIHRoaW5rIHRoYXQncyBzb21ldGhpbmcgd2UgY2Fu
CmxpdmUgd2l0aC4KCiAtR2VvcmdlCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
