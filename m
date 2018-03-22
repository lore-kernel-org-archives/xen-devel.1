From: Alexey G <x1917x@gmail.com>
Subject: Re: [RFC PATCH 07/12] hvmloader: allocate MMCONFIG area
 in the MMIO hole + minor code refactoring
Date: Thu, 22 Mar 2018 23:05:11 +1000
Message-ID: <20180322230511.00000b6a@gmail.com>
References: <cover.1520867740.git.x1917x@gmail.com>
 <62c7a3037bb9f5631542f635dc36ae3338c7bf47.1520867741.git.x1917x@gmail.com>
 <20180319155802.immvsgqttrs3yezg@MacBook-Pro-de-Roger.local>
 <20180320054922.00005669@gmail.com>
 <20180320085048.orjv67qtwhe35ntl@MacBook-Pro-de-Roger.local>
 <20180321105840.00004698@gmail.com>
 <20180321090911.qd6epofdaywc4blb@MacBook-Pro-de-Roger.local>
 <20180322002540.000032f1@gmail.com>
 <20180321152017.bv32mt4bpxaa7zfr@MacBook-Pro-de-Roger.local>
 <20180322025656.00005281@gmail.com>
 <3a237f106c9348799473fca673f7ef7c@AMSPEX02CL03.citrite.net>
 <20180322103142.0000423c@gmail.com>
 <5AB37FA002000078001B4DD5@prv-mh.provo.novell.com>
 <20180322195506.00000d4a@gmail.com>
 <6dd0dcee536c44409bda0729bdac5164@AMSPEX02CL03.citrite.net>
 <20180322215636.000042ea@gmail.com>
 <5AB3AB1802000078001B5065@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=w0ds=gm=gmail.com=x1917x@srs-us1.protection.inumbo.net>)
 id 1eyzuJ-0004SB-EP
 for xen-devel@lists.xenproject.org; Thu, 22 Mar 2018 13:05:27 +0000
Received: by mail-lf0-x22c.google.com with SMTP id c78-v6so8344095lfh.1
 for <xen-devel@lists.xenproject.org>; Thu, 22 Mar 2018 06:05:25 -0700 (PDT)
In-Reply-To: <5AB3AB1802000078001B5065@prv-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>, Paul Durrant <Paul.Durrant@citrix.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Anthony Perard <anthony.perard@citrix.com>, Ian Jackson <Ian.Jackson@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCAyMiBNYXIgMjAxOCAwNjowOTo0NCAtMDYwMAoiSmFuIEJldWxpY2giIDxKQmV1bGlj
aEBzdXNlLmNvbT4gd3JvdGU6Cgo+Pj4+IE9uIDIyLjAzLjE4IGF0IDEyOjU2LCA8eDE5MTd4QGdt
YWlsLmNvbT4gd3JvdGU6ICAKPj4gSSByZWFsbHkgZG9uJ3QgdW5kZXJzdGFuZCB3aHkgc29tZSBw
ZW9wbGUgaGF2ZSB0aGF0IGZlYXIgb2YgZW11bGF0ZWQKPj4gTU1DT05GSUcgLS0gaXQncyByZWFs
bHkgdGhlIHNhbWUgdGhpbmcgYXMgYW55IG90aGVyIE1NSU8gcmFuZ2UgUUVNVQo+PiBhbHJlYWR5
IGVtdWxhdGVzIHZpYSBtYXBfaW9fcmFuZ2VfdG9faW9yZXFfc2VydmVyKCkuIE5vIHNlbnNpdGl2
ZQo+PiBpbmZvcm1hdGlvbiBleHBvc2VkLiBJdCBpcyByZWxhdGVkIG9ubHkgdG8gZW11bGF0ZWQg
UENJIGNvbmYgc3BhY2UKPj4gd2hpY2ggUUVNVSBhbHJlYWR5IGtub3dzIGFib3V0IGFuZCB1c2Us
IHByb3ZpZGluZyBlbXVsYXRlZCBQQ0kKPj4gZGV2aWNlcyBmb3IgaXQuICAKPgo+WW91IGNvbnRp
bnVlIHRvIGlnbm9yZSB0aGUgcm91dGluZyByZXF1aXJlbWVudCBtdWx0aXBsZSBpb3JlcQo+c2Vy
dmVycyBpbXBvc2UuCgpJZiB0aGUgZW11bGF0ZWQgTU1DT05GSUcgYXBwcm9hY2ggd2lsbCBiZSBt
b2RpZmllZCB0byBiZWNvbWUKZnVsbHkgY29tcGF0aWJsZSB3aXRoIG11bHRpcGxlIGlvcmVxIHNl
cnZlcnMgKHdoYXRldmVyIHRoZXkgdXNlZCBmb3IpLCBJCmFzc3VtZSB0aGVyZSB3aWxsIGJlIG5v
IG9iamVjdGlvbnMgdGhhdCBlbXVsYXRlZCBNTUNPTkZJRyBjYW4ndCBiZQp1c2VkPwpJIGp1c3Qg
d2FudCB0byBjbGFyaWZ5IHRoaXMgbW9tZW50IC0tIHdoeSBwZW9wbGUgdGhpbmsgdGhhdAphIGNv
bXBsZXRlbHkgZW11bGF0ZWQgTU1JTyByYW5nZSwgbm90IHJlbGF0ZWQgaW4gYW55CndheSB0byBo
b3N0J3MgTU1DT05GSUcgbWF5IGNvbXByb21pc2Ugc29tZXRoaW5nLgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
