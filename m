From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 03/14] AMD/IOMMU: Fix multiple reference
 counting errors
Date: Fri, 23 Nov 2018 01:23:14 -0700
Message-ID: <5BF7B8F202000078001FF37E@prv1-mh.provo.novell.com>
References: <1542806482-24030-1-git-send-email-andrew.cooper3@citrix.com>
 <1542806482-24030-4-git-send-email-andrew.cooper3@citrix.com>
 <5BF6C27902000078001FEF9D@prv1-mh.provo.novell.com>
 <6e804647-5e9a-4d41-c441-1317b418e4dc@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <6e804647-5e9a-4d41-c441-1317b418e4dc@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Wei Liu <wei.liu2@citrix.com>, Xen-devel <xen-devel@lists.xen.org>, Brian Woods <brian.woods@amd.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIyLjExLjE4IGF0IDE4OjQ2LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMjIvMTEvMjAxOCAxNDo1MSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+PiBAQCAtMjIw
LDEyICsyMTksMTggQEAgdm9pZCBndWVzdF9pb21tdV9hZGRfcHByX2xvZyhzdHJ1Y3QgZG9tYWlu
ICpkLCB1MzIgZW50cnlbXSkKPj4+ICAgICAgdW5tYXBfZG9tYWluX3BhZ2UobG9nX2Jhc2UpOwo+
Pj4gIAo+Pj4gICAgICBndWVzdF9pb21tdV9kZWxpdmVyX21zaShkKTsKPj4+ICsKPj4+ICtvdXQ6
Cj4+IFBsZWFzZSBpbmRlbnQgYnkgYXQgbGVhc3Qgb25lIGJsYW5rIChzYW1lIGZ1cnRoZXIgZG93
bikuCj4gCj4gSSB0aG91Z2h0IHlvdSd2ZSBzYWlkIHRoYXQgeW91J3JlIG5vIGxvbmdlciB1c2lu
ZyBhbiBvYnNvbGV0ZSB2ZXJzaW9uIG9mCj4gZGlmZi4KCkkgZG9uJ3QgdGhpbmsgSSd2ZSBldmVy
IHNhaWQgc28sIGFuZCBJIGRvbid0IHRoaW5rIGl0IG1hdHRlcnMgbXVjaCB3aGF0CkkgcGVyc29u
YWxseSB1c2UuCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
