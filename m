From: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH] automation: introduce a script for build
 test
Date: Wed, 25 Jul 2018 12:04:33 +0100
Message-ID: <9c904663-da57-48f8-44d3-42b9ce3c4387@citrix.com>
References: <20180724165651.21743-1-wei.liu2@citrix.com>
 <20180724180152.luftbxunayvi5zgf@doug-macbook.localdomain>
 <20180725104836.GG2296@perard.uk.xensource.com>
 <20180725105353.pgbb36jz6aacufpl@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=y+ah=kj=citrix.com=prvs=737329f3b=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1fiHaw-00037s-Tk
 for xen-devel@lists.xenproject.org; Wed, 25 Jul 2018 11:04:38 +0000
In-Reply-To: <20180725105353.pgbb36jz6aacufpl@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>, Anthony PERARD <anthony.perard@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Doug Goldstein <cardoe@cardoe.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMDcvMjUvMjAxOCAxMTo1MyBBTSwgV2VpIExpdSB3cm90ZToKPiBPbiBXZWQsIEp1bCAyNSwg
MjAxOCBhdCAxMTo0ODozNkFNICswMTAwLCBBbnRob255IFBFUkFSRCB3cm90ZToKPj4gT24gVHVl
LCBKdWwgMjQsIDIwMTggYXQgMDE6MDE6NTJQTSAtMDUwMCwgRG91ZyBHb2xkc3RlaW4gd3JvdGU6
Cj4+PiBPbiBUdWUsIEp1bCAyNCwgMjAxOCBhdCAwNTo1Njo1MVBNICswMTAwLCBXZWkgTGl1IHdy
b3RlOgo+Pj4+IFNpZ25lZC1vZmYtYnk6IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRy
aXguY29tPgo+Pj4+IFNpZ25lZC1vZmYtYnk6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+
Cj4+Pj4gLS0tCj4+Pj4gVGhpcyBpcyBhIHNjcmlwdCBJIHdyb3RlIHByZXZpb3VzbHkgZm9yIGJ1
aWxkIHRlc3QuCj4+Pgo+Pj4gR29hbCBoZXJlIGlzIHRvIGJpc2VjdCBhIHNlcmllcyB0byBmaW5k
IHRoZSBidWlsZCBmYWlsdXJlPyBXZSBjb3VsZAo+Pj4gYWxsb3cgZ2l0IGJpc2VjdCB0byBkbyB0
aGUgd29yayBhbmQganVzdCBidWlsZCBhbmQgcmV0dXJuIHN1Y2Nlc3Mgb3IKPj4+IGZhaWx1cmUg
aW5zdGVhZCBvZiBoYXZpbmcgdG8gd2FsayBpdCBieSBoYW5kLiBJIGRvbid0IGhhdmUgb25lCj4+
PiBzcGVjaWZpY2FsbHkgZm9yIFhlbiBidXQgb24gb3RoZXIgcHJvamVjdHMgSSd2ZSBnb3Qgc29t
ZXRoaW5nIGxpa2U6Cj4+Pgo+Pgo+PiBBY3R1YWxseSwgaXQncyBhIHNjcmlwdCB0aGF0IHRob3Nl
IGEgc2ltaWxhaXIgam9iIHRvOgo+PiAgICAgZ2l0IHJlYmFzZSAtLWV4ZWMgLi9zY3JpcHRzL2Jh
c2ljLWJ1aWxkLnNoIDxiYXNlPgo+IAo+IFRvIGV4cG91bmQgdGhpcyBhIGJpdDoKPiAKPiBUaGF0
J3Mgd2hhdCBJIHVzZWQgYW5kIHRvbGQgb3RoZXJzIHRvIHVzZSBiZWZvcmUsIGJ1dCBpdCBpcyBm
YXIgbW9yZQo+IGRhbmdlcm91cyB0aGFuIHRoaXMgc2NyaXB0IGJlY2F1c2UgZ2l0LXJlYmFzZSBf
cmV3cml0ZXNfIGhpc3RvcnkuCj4gCj4gQSBmYWlsZWQgY29tbWFuZCBhbHNvIGRvZXNuJ3QgcmVz
dG9yZSBvcmlnaW5hbCBoZWFkLCBzbyBpdCBpcyBsZXNzCj4gY29udmVuaWVudCAtLSB5b3UgaGF2
ZSB0byBjaGVjayB0aGUgc3RhdHVzIG9mIHRoZSB0cmVlIGV2ZXJ5IHRpbWUKPiBzb21ldGhpbmcg
YnJlYWtzLgoKSSdtIG5vdCBvcHBvc2VkIHRvIHRoZSBzY3JpcHQgeW91IGhhdmUsIGJ1dCBpdCBt
aWdodCBiZSB3b3J0aCBzZWVpbmcKd2hhdCB3ZSBjYW4gZG8gdG8gdG8gdXNlIGBnaXQgcmViYXNl
YCwgc2luY2UgdGhhdCBzaW1wbGlmaWVzIHRoZSBwcm9jZXNzaW5nLgoKV2UgY291bGQgaGF2ZSBh
IHNjcmlwdCwgZm9yIGluc3RhbmNlLCBkbyBzb21ldGhpbmcgbGlrZToKCmN1cmJyYW5jaD0kKGdp
dCBuYW1lLXJldiAtLW5hbWUtb25seSBIRUFEKQpnaXQgY2hlY2tvdXQgLWIgdG1wLXNlcmllcy1i
dWlsZC10ZXN0CmlmICEgZ2l0IHJlYmFzZSAtLWV4ZWMgLi4uICRiYXNlIDsgdGhlbgoJZ2l0IHJl
YmFzZSAtLWFib3J0CmZpCmdpdCBjaGVja291dCAtZiAkY3VyYnJhbmNoCmdpdCBkZWxldGUgLUQg
dG1wLXNlcmllcy1idWlsZC10ZXN0CgpUaGUgaGlzdG9yeSByZXdyaXRpbmcgaXMgbm93IG1vb3Qg
YmVjYXVzZSB5b3UncmUgcmV3cml0aW5nIGEgdGVtcG9yYXJ5CmJyYW5jaC4KCiAtR2VvcmdlCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
