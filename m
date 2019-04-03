From: Pu Wen <puwen@hygon.cn>
Subject: Re: [PATCH v4 00/15] Add support for Hygon Dhyana
 Family 18h processor
Date: Wed, 3 Apr 2019 23:21:03 +0800
Message-ID: <1eb44fcb-6cf1-3f1c-f5c5-70a235149d00@hygon.cn>
References: <cover.1553935727.git.puwen@hygon.cn>
 <af3a73b3-d1d3-4cd0-0758-d457e1a6549a@citrix.com>
 <07149eb5-7025-d069-a7d1-6bf271e630a5@hygon.cn>
 <5CA38A8D0200007800223FC4@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=oXIm=SF=hygon.cn=puwen@srs-us1.protection.inumbo.net>)
 id 1hBhqh-0001Di-0f
 for xen-devel@lists.xenproject.org; Wed, 03 Apr 2019 15:30:47 +0000
In-Reply-To: <5CA38A8D0200007800223FC4@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Wei Liu <wei.liu2@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, xen-devel <xen-devel@lists.xenproject.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Brian Woods <brian.woods@amd.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjAxOS80LzMgMDoxNSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMDIuMDQuMTkgYXQgMTg6
MDAsIDxwdXdlbkBoeWdvbi5jbj4gd3JvdGU6Cj4+IE9uIDIwMTkvNC8yIDIzOjE0LCBBbmRyZXcg
Q29vcGVyIHdyb3RlOgo+Pj4gT24gMzAvMDMvMjAxOSAxMDo0MCwgUHUgV2VuIHdyb3RlOgo+Pj4+
IFRoaXMgcGF0Y2ggc2VyaWVzIGhhdmUgYmVlbiBhcHBsaWVkIGFuZCB0ZXN0ZWQgc3VjY2Vzc2Z1
bGx5IG9uIEh5Z29uCj4+Pj4gRGh5YW5hIHByb2Nlc3NvciwgYWxzbyBiZWVuIHRlc3RlZCBvbiBB
TUQgRVBZQyAoZmFtaWx5IDE3aCkgcHJvY2Vzc29yLgo+Pj4+IEl0IHdvcmtzIGZpbmUgYW5kIG1h
a2VzIG5vIGhhcm0gdG8gdGhlIGV4aXN0aW5nIGNvZGUuCj4+PiBPbmUgdGhpbmcgSSBkb24ndCBz
ZWUgaW4gdGhpcyBzZXJpZXMgaXMgYW55dGhpbmcgYWJvdXQgbWljcm9jb2RlCj4+PiBsb2FkaW5n
LiAgUHJlc3VtYWJseSB5b3UnbGwgZm9sbG93IHRoZSBBTUQgcGF0Y2hsb2FkaW5nIG1lY2hhbmlz
bSwgd2l0aAo+Pj4gYSBibG9iIHlvdSBwcm92aWRlIHlvdXJzZWxmPwo+PiBXaGVuIHRoZSBIeWdv
biBwYXRjaGxvYWRpbmcgbWVjaGFuaXNtIGlzIHByYWN0aWNhYmxlIGFuZCBpdCdzIG5lY2Vzc2Fy
eQo+PiB0byBsb2FkIHRoZSBIeWdvbiBtaWNyb2NvZGUgb3V0c2lkZSBvZiBCSU9TLCB3ZSdsbCBz
ZW5kIHRoZSBwYXRjaGxvYWRpbmcKPj4gcGF0Y2hlcyB0byBYZW4gYW5kIExpbnV4IG1haWxpbmcg
bGlzdHMuCj4gCj4gSSBzdXBwb3NlIGJvdGggSW50ZWwgYW5kIEFNRCBoYWQgdGhpcyBzYW1lIGlu
dGVudGlvbiBvZiB1Y29kZSBsb2FkaW5nCj4gYmVpbmcgYSBmaXJtd2FyZSBqb2Igb25seSwgYW5k
IHdlIHNlZSB3aGVyZSB3ZSBhcmUgcmlnaHQgbm93LiBBcyBsb25nCj4gYXMgdXBkYXRlZCBmaXJt
d2FyZSBkb2VzIG5vdCBiZWNvbWUgYXZhaWxhYmxlIGluIGEgdGltZWx5IG1hbm5lciAob3IKPiBw
ZXJoYXBzIG5vdCBhdCBhbGwsIGJlY2F1c2Ugb2YgYSB2ZW5kb3IgY29uc2lkZXJpbmcgYSBjZXJ0
YWluIHN5c3RlbQo+IEVPTCksIHRoZXJlJ3MgZ29pbmcgdG8gYmUgYSBuZWVkIHRvIGJlIGFibGUg
dG8gbG9hZCBpdCBmcm9tIHRoZSBPUy4KCkl0J3MgcmVhc29uYWJsZS4gQnV0IEknbGwgbm90IHB1
dCB0aGUgbWljcm9jb2RlIGxvYWRpbmcgcGF0Y2ggaW4gdGhpcwpzZXJpZXMsIGFuZCB3aWxsIHNl
bnQgaXQgaW5kaXZpZHVhbGx5IGxhdGVyIGFmdGVyIHN1ZmZpY2llbnRseSB0ZXN0ZWQuCk9yIGp1
c3QgYWRkIEh5Z29uIHZlbmRvciBjaGVja2luZyB0byBmb2xsb3cgdGhlIEFNRCBwYXRjaGxvYWRp
bmcKbWVjaGFuaXNtIHJpZ2h0IG5vdyBhbmQgZG8gdGhlIGFkanVzdG1lbnQgZm9yIEh5Z29uIGlm
IG5lZWRlZCBpbiB0aGUKZnV0dXJlPwoKLS0gClJlZ2FyZHMsClB1IFdlbgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
