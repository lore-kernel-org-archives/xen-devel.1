From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] mm: make opt_bootscrub non-init
Date: Mon, 26 Nov 2018 05:36:32 -0700
Message-ID: <5BFBE8D002000078001FFF55@prv1-mh.provo.novell.com>
References: <20181123143002.79743-1-roger.pau@citrix.com>
 <5BFBC59802000078001FFD36@prv1-mh.provo.novell.com>
 <20181126120439.lsmf5u37evvkqwgm@mac>
 <5BFBE48C02000078001FFF19@prv1-mh.provo.novell.com>
 <7b965c37-9d3a-35bd-0b6b-75296490be5c@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=aZgN=OF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gRG80-00010o-ML
 for xen-devel@lists.xenproject.org; Mon, 26 Nov 2018 12:36:40 +0000
In-Reply-To: <7b965c37-9d3a-35bd-0b6b-75296490be5c@arm.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI2LjExLjE4IGF0IDEzOjI1LCA8anVsaWVuLmdyYWxsQGFybS5jb20+IHdyb3RlOgo+
IE1heSBJIGFzayB3aGF0IGFyZSB0aGUgZG93bnNpZGVzPyBEbyB5b3UgZXhwZWN0IGEgbG90IG9m
IGZhbHNlIHBvc2l0aXZlPwoKSGF2aW5nIHRvIHNwbGl0IGNvZGUgcGF0aHMsIHRvIGludHJvZHVj
ZSByZWR1bmRhbmN5LCBvciB0byBtb3ZlCmNvZGUvZGF0YSBvdXQgb2YgLmluaXQuKiB0aGF0IGNv
dWxkIGluIGZhY3QgbGl2ZSB0aGVyZSBhcmUgYWxsCnBvc3NpYmxlIGlzc3Vlcy4gUGx1cyB0aGUg
X19yZWZ7LGRhdGF9IGFubm90YXRpb24gdGhhdCBMaW51eCBoYXMKYWxzbyBpbnZpdGUgZm9yIGFi
dXNlIChhdCB3aGljaCBwb2ludCB3ZSdkIGJlIGJhY2sgdG8gd2hlcmUgd2UKY3VycmVudGx5IGFy
ZSwganVzdCBhdCBwZXJoYXBzIGEgc21hbGxlciBzY29wZSkuCgpKYW4KCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
