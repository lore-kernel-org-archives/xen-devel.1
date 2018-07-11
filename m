From: Michal Hocko <mhocko@kernel.org>
Subject: Re: [RFC PATCH] mm,
 oom: distinguish blockable mode for mmu notifiers
Date: Wed, 11 Jul 2018 11:03:53 +0200
Message-ID: <20180711090353.GD20050__12395.5111871057$1531299762$gmane$org@dhcp22.suse.cz>
References: <20180622150242.16558-1-mhocko@kernel.org>
 <20180627074421.GF32348@dhcp22.suse.cz>
 <20180709122908.GJ22049@dhcp22.suse.cz>
 <20180710134040.GG3014@mtr-leonro.mtl.com>
 <20180710141410.GP14284@dhcp22.suse.cz>
 <20180710162020.GJ3014@mtr-leonro.mtl.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=7onx=j3=kernel.org=mhocko@srs-us1.protection.inumbo.net>)
 id 1fdB2W-0000l6-Fn
 for xen-devel@lists.xenproject.org; Wed, 11 Jul 2018 09:04:00 +0000
Content-Disposition: inline
In-Reply-To: <20180710162020.GJ3014@mtr-leonro.mtl.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Leon Romanovsky <leon@kernel.org>
Cc: kvm@vger.kernel.org, Radim =?utf-8?B?S3LEjW3DocWZ?= <rkrcmar@redhat.com>, David Airlie <airlied@linux.ie>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Sudeep Dutt <sudeep.dutt@intel.com>, dri-devel@lists.freedesktop.org, linux-mm@kvack.org, Felix Kuehling <felix.kuehling@amd.com>, Andrea Arcangeli <aarcange@redhat.com>, "David (ChunMing) Zhou" <David1.Zhou@amd.com>, Dimitri Sivanich <sivanich@sgi.com>, linux-rdma@vger.kernel.org, amd-gfx@lists.freedesktop.org, Jason Gunthorpe <jgg@ziepe.ca>, Doug Ledford <dledford@redhat.com>, David Rientjes <rientjes@google.com>, xen-devel@lists.xenproject.org, intel-gfx@lists.freedesktop.org, Jani Nikula <jani.nikula@linux.intel.com>, =?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Juergen Gross <jgross@suse.com>Mike Marciniszyn <mi>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlIDEwLTA3LTE4IDE5OjIwOjIwLCBMZW9uIFJvbWFub3Zza3kgd3JvdGU6Cj4gT24gVHVl
LCBKdWwgMTAsIDIwMTggYXQgMDQ6MTQ6MTBQTSArMDIwMCwgTWljaGFsIEhvY2tvIHdyb3RlOgo+
ID4gT24gVHVlIDEwLTA3LTE4IDE2OjQwOjQwLCBMZW9uIFJvbWFub3Zza3kgd3JvdGU6Cj4gPiA+
IE9uIE1vbiwgSnVsIDA5LCAyMDE4IGF0IDAyOjI5OjA4UE0gKzAyMDAsIE1pY2hhbCBIb2NrbyB3
cm90ZToKPiA+ID4gPiBPbiBXZWQgMjctMDYtMTggMDk6NDQ6MjEsIE1pY2hhbCBIb2NrbyB3cm90
ZToKPiA+ID4gPiA+IFRoaXMgaXMgdGhlIHYyIG9mIFJGQyBiYXNlZCBvbiB0aGUgZmVlZGJhY2sg
SSd2ZSByZWNlaXZlZCBzbyBmYXIuIFRoZQo+ID4gPiA+ID4gY29kZSBldmVuIGNvbXBpbGVzIGFz
IGEgYm9udXMgOykgSSBoYXZlbid0IHJ1bnRpbWUgdGVzdGVkIGl0IHlldCwgbW9zdGx5Cj4gPiA+
ID4gPiBiZWNhdXNlIEkgaGF2ZSBubyBpZGVhIGhvdy4KPiA+ID4gPiA+Cj4gPiA+ID4gPiBBbnkg
ZnVydGhlciBmZWVkYmFjayBpcyBoaWdobHkgYXBwcmVjaWF0ZWQgb2YgY291cnNlLgo+ID4gPiA+
Cj4gPiA+ID4gQW55IG90aGVyIGZlZWRiYWNrIGJlZm9yZSBJIHBvc3QgdGhpcyBhcyBub24tUkZD
Pwo+ID4gPgo+ID4gPiBGcm9tIG1seDUgcGVyc3BlY3RpdmUsIHdobyBpcyBwcmltYXJ5IHVzZXIg
b2YgdW1lbV9vZHAuYyB5b3VyIGNoYW5nZSBsb29rcyBvay4KPiA+Cj4gPiBDYW4gSSBhc3N1bWUg
eW91ciBBY2tlZC1ieT8KPiAKPiBJIGRpZG4ndCBoYXZlIGEgY2hhbmNlIHRvIHRlc3QgaXQgYmVj
YXVzZSBpdCBhcHBsaWVzIG9uIG91ciByZG1hLW5leHQsIGJ1dAo+IGZhaWxzIHRvIGNvbXBpbGUu
CgpXaGF0IGlzIHRoZSBjb21waWxhdGlvbiBwcm9ibGVtPyBJcyBpdCBjYXVzZWQgYnkgdGhlIHBh
dGNoIG9yIHNvbWUgb3RoZXIKdW5yZWxhdGVkIGNoYW5nZWQ/Ci0tIApNaWNoYWwgSG9ja28KU1VT
RSBMYWJzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
