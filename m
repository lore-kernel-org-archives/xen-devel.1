From: Tamas K Lengyel <tamas@tklengyel.com>
Subject: Re: [PATCH v2 2/2] x86/mem_sharing: replace using
 page_lock with our own lock
Date: Sun, 14 Apr 2019 22:53:32 -0600
Message-ID: <CABfawhn72K1Dz65bNGFxYrZPkazsRmXPMkQwehsBSNsjGim8aA@mail.gmail.com>
References: <20190412194712.1602-1-tamas@tklengyel.com>
 <20190412194712.1602-2-tamas@tklengyel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=t1d2=SR=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1hFteC-0000NT-HV
 for xen-devel@lists.xenproject.org; Mon, 15 Apr 2019 04:55:12 +0000
Received: by mail-wr1-f46.google.com with SMTP id y7so19975443wrn.11
 for <xen-devel@lists.xenproject.org>; Sun, 14 Apr 2019 21:54:09 -0700 (PDT)
In-Reply-To: <20190412194712.1602-2-tamas@tklengyel.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: George Dunlap <george.dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBBcHIgMTIsIDIwMTkgYXQgMTo1MCBQTSBUYW1hcyBLIExlbmd5ZWwgPHRhbWFzQHRr
bGVuZ3llbC5jb20+IHdyb3RlOgo+Cj4gVGhlIHBhZ2VfbG9jayBzeXN0ZW0gd2FzIG5vdCBpbnRl
bmRlZCB0byBiZSB1c2VkIG91dHNpZGUgdGhlIFBWIHBhZ2V0YWJsZQo+IGNvZGUuIFJlcGxhY2Ug
aXRzIHVzZSBpbiBtZW1fc2hhcmluZyB3aXRoIGFuIGludGVybmFsIHJ3bG9jay4KPgoKQWZ0ZXIg
ZnVydGhlciB0ZXN0aW5nIEknbSBhY3R1YWxseSBydW5uaW5nIGludG8gYSBsb3Qgb2Ygc3RyYW5n
ZQpwcm9ibGVtcyB3aXRoIHRoaXMgd2hlbiBkb21haW5zIHdpdGggc2hhcmVkIG1lbW9yeSBnZXQg
ZGVzdHJveWVkLApvZGRseSBlbm91Z2ggYWZ0ZXIgbWVtX3NoYXJpbmcgZmluaXNoZXMgY2xlYW5p
bmcgdXA6IChYRU4pCls8ZmZmZjgyZDA4MDI3MjliOT5dIGRvbWFpbi5jI3JlbGlucXVpc2hfbWVt
b3J5KzB4NjIvMHg0ZjguIEkgdHJpZWQKbW92aW5nIHRoZSBsb2NrIGludG8gcGFnZV9pbmZvIGlu
c3RlYWQgKGluIGEgbmV3IHN0cnVjdCB3aXRoCnNoYXJpbmdfaW5mbykgYnV0IHRoaXMgYXBwcm9h
Y2ggc2VlbXMgdG8gcmVxdWlyZSBhIGxvdCBtb3JlIGVmZm9ydCBhbmQKYSBsb3QgbW9yZSB0aG91
Z2h0IHB1dCBpbnRvIGl0IGFzIHBhZ2VfbG9jayBzZWVtcyB0byBoYXZlIHNvbWUgb3RoZXIKc2lk
ZS1lZmZlY3QgdGhhdCBtYWtlcyB0aGlzIGFsbCB3b3JrLiBVbmZvcnR1bmF0ZWx5IGF0IHRoaXMg
dGltZSBJCmNhbid0IGFmZm9yZCBjaGFzaW5nIHRoaXMgcGF0aCBmdXJ0aGVyIHNvIEknbGwganVz
dCBnbyB3aXRoIHRoZQpiYW5kLWFpZCBzb2x1dGlvbiBvZiBtYWtpbmcgcGFnZV9sb2NrL3BhZ2Vf
dW5sb2NrIG1lbV9zaGFyaW5nCmZyaWVuZGx5LgoKVGFtYXMKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
