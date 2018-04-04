From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Subject: Re: [PATCH v11] x86/altp2m: support for setting
 restrictions for an array of pages
Date: Wed, 4 Apr 2018 11:19:19 +0300
Message-ID: <5d057a6d-85ef-d1b2-0649-6183f4f01dc9@bitdefender.com>
References: <1522424345-10908-1-git-send-email-ppircalabu@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=0srj=gz=bitdefender.com=rcojocaru@srs-us1.protection.inumbo.net>)
 id 1f3ddc-0003Dr-WB
 for xen-devel@lists.xenproject.org; Wed, 04 Apr 2018 08:19:25 +0000
Received: from mx-sr.buh.bitdefender.com (mx-sr.buh.bitdefender.biz
 [10.17.80.103])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id 014A43087988
 for <xen-devel@lists.xenproject.org>; Wed,  4 Apr 2018 12:35:24 +0300 (EEST)
Received: from smtp03.buh.bitdefender.org (smtp.bitdefender.biz [10.17.80.77])
 by mx-sr.buh.bitdefender.com (Postfix) with ESMTP id 48EF17FC7C
 for <xen-devel@lists.xenproject.org>; Wed,  4 Apr 2018 11:19:22 +0300 (EEST)
In-Reply-To: <1522424345-10908-1-git-send-email-ppircalabu@bitdefender.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Petre Pircalabu <ppircalabu@bitdefender.com>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, wei.liu2@citrix.com, George.Dunlap@eu.citrix.com, andrew.cooper3@citrix.com, ian.jackson@eu.citrix.com, tim@xen.org, julien.grall@arm.com, jbeulich@suse.com
List-Id: xen-devel@lists.xenproject.org

T24gMDMvMzAvMjAxOCAwNjozOSBQTSwgUGV0cmUgUGlyY2FsYWJ1IHdyb3RlOgo+IEZyb206IFJh
enZhbiBDb2pvY2FydSA8cmNvam9jYXJ1QGJpdGRlZmVuZGVyLmNvbT4KPiAKPiBGb3IgdGhlIGRl
ZmF1bHQgRVBUIHZpZXcgd2UgaGF2ZSB4Y19zZXRfbWVtX2FjY2Vzc19tdWx0aSgpLCB3aGljaAo+
IGlzIGFibGUgdG8gc2V0IGFuIGFycmF5IG9mIHBhZ2VzIHRvIGFuIGFycmF5IG9mIGFjY2VzcyBy
aWdodHMgd2l0aAo+IGEgc2luZ2xlIGh5cGVyY2FsbC4gSG93ZXZlciwgdGhpcyBmdW5jdGlvbmFs
aXR5IHdhcyBsYWNraW5nIGZvciB0aGUKPiBhbHRwMm0gc3Vic3lzdGVtLCB3aGljaCBjb3VsZCBv
bmx5IHNldCBwYWdlIHJlc3RyaWN0aW9ucyBmb3Igb25lCj4gcGFnZSBhdCBhIHRpbWUuIFRoaXMg
cGF0Y2ggYWRkcmVzc2VzIHRoZSBnYXAuCj4gCj4gSFZNT1BfYWx0cDJtX3NldF9tZW1fYWNjZXNz
X211bHRpIGhhcyBiZWVuIGFkZGVkIGFzIGEgSFZNT1AgKGFzIG9wcG9zZWQgdG8gYQo+IERPTUNU
TCkgZm9yIGNvbnNpc3RlbmN5IHdpdGggaXRzIEhWTU9QX2FsdHAybV9zZXRfbWVtX2FjY2VzcyBj
b3VudGVycGFydCAoYW5kCj4gaGVuY2Ugd2l0aCB0aGUgb3JpZ2luYWwgYWx0cDJtIGRlc2lnbiwg
d2hlcmUgZG9tYWlucyBhcmUgYWxsb3dlZCAtIHdpdGggdGhlCj4gcHJvcGVyIGFsdHAybSBhY2Nl
c3MgcmlnaHRzIC0gdG8gYWx0ZXIgdGhlc2Ugc2V0dGluZ3MpLCBpbiB0aGUgYWJzZW5jZSBvZiBh
bgo+IG9mZmljaWFsIHBvc2l0aW9uIG9uIHRoZSBpc3N1ZSBmcm9tIHRoZSBvcmlnaW5hbCBhbHRw
Mm0gZGVzaWduZXJzLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFJhenZhbiBDb2pvY2FydSA8cmNvam9j
YXJ1QGJpdGRlZmVuZGVyLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBQZXRyZSBQaXJjYWxhYnUgPHBw
aXJjYWxhYnVAYml0ZGVmZW5kZXIuY29tPgo+IEFja2VkLWJ5OiBXZWkgTGl1IDx3ZWkubGl1MkBj
aXRyaXguY29tPgoKR2VvcmdlLCBzaG91bGQgd2UgaGF2ZSBhZGRlZCB5b3VyIFJldmlld2VkLWJ5
IHdpdGggYWRkcmVzc2luZyB5b3VyCmNvbW1lbnRzIGluIHRoaXMgdmVyc2lvbj8KCgpUaGFua3Ms
ClJhenZhbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
