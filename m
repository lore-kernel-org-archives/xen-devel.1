From: Michal Hocko <mhocko@kernel.org>
Subject: Re: [RFC PATCH] mm,
 oom: distinguish blockable mode for mmu notifiers
Date: Wed, 11 Jul 2018 13:13:18 +0200
Message-ID: <20180711111318.GL20050__6439.11135052821$1531307522$gmane$org@dhcp22.suse.cz>
References: <20180622150242.16558-1-mhocko@kernel.org>
 <20180627074421.GF32348@dhcp22.suse.cz>
 <20180709122908.GJ22049@dhcp22.suse.cz>
 <20180710134040.GG3014@mtr-leonro.mtl.com>
 <20180710141410.GP14284@dhcp22.suse.cz>
 <20180710162020.GJ3014@mtr-leonro.mtl.com>
 <20180711090353.GD20050@dhcp22.suse.cz>
 <20180711101447.GU3014@mtr-leonro.mtl.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=7onx=j3=kernel.org=mhocko@srs-us1.protection.inumbo.net>)
 id 1fdD3h-0007P8-Fg
 for xen-devel@lists.xenproject.org; Wed, 11 Jul 2018 11:13:21 +0000
Content-Disposition: inline
In-Reply-To: <20180711101447.GU3014@mtr-leonro.mtl.com>
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

T24gV2VkIDExLTA3LTE4IDEzOjE0OjQ3LCBMZW9uIFJvbWFub3Zza3kgd3JvdGU6Cj4gT24gV2Vk
LCBKdWwgMTEsIDIwMTggYXQgMTE6MDM6NTNBTSArMDIwMCwgTWljaGFsIEhvY2tvIHdyb3RlOgo+
ID4gT24gVHVlIDEwLTA3LTE4IDE5OjIwOjIwLCBMZW9uIFJvbWFub3Zza3kgd3JvdGU6Cj4gPiA+
IE9uIFR1ZSwgSnVsIDEwLCAyMDE4IGF0IDA0OjE0OjEwUE0gKzAyMDAsIE1pY2hhbCBIb2NrbyB3
cm90ZToKPiA+ID4gPiBPbiBUdWUgMTAtMDctMTggMTY6NDA6NDAsIExlb24gUm9tYW5vdnNreSB3
cm90ZToKPiA+ID4gPiA+IE9uIE1vbiwgSnVsIDA5LCAyMDE4IGF0IDAyOjI5OjA4UE0gKzAyMDAs
IE1pY2hhbCBIb2NrbyB3cm90ZToKPiA+ID4gPiA+ID4gT24gV2VkIDI3LTA2LTE4IDA5OjQ0OjIx
LCBNaWNoYWwgSG9ja28gd3JvdGU6Cj4gPiA+ID4gPiA+ID4gVGhpcyBpcyB0aGUgdjIgb2YgUkZD
IGJhc2VkIG9uIHRoZSBmZWVkYmFjayBJJ3ZlIHJlY2VpdmVkIHNvIGZhci4gVGhlCj4gPiA+ID4g
PiA+ID4gY29kZSBldmVuIGNvbXBpbGVzIGFzIGEgYm9udXMgOykgSSBoYXZlbid0IHJ1bnRpbWUg
dGVzdGVkIGl0IHlldCwgbW9zdGx5Cj4gPiA+ID4gPiA+ID4gYmVjYXVzZSBJIGhhdmUgbm8gaWRl
YSBob3cuCj4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiBBbnkgZnVydGhlciBmZWVkYmFjayBp
cyBoaWdobHkgYXBwcmVjaWF0ZWQgb2YgY291cnNlLgo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiBB
bnkgb3RoZXIgZmVlZGJhY2sgYmVmb3JlIEkgcG9zdCB0aGlzIGFzIG5vbi1SRkM/Cj4gPiA+ID4g
Pgo+ID4gPiA+ID4gRnJvbSBtbHg1IHBlcnNwZWN0aXZlLCB3aG8gaXMgcHJpbWFyeSB1c2VyIG9m
IHVtZW1fb2RwLmMgeW91ciBjaGFuZ2UgbG9va3Mgb2suCj4gPiA+ID4KPiA+ID4gPiBDYW4gSSBh
c3N1bWUgeW91ciBBY2tlZC1ieT8KPiA+ID4KPiA+ID4gSSBkaWRuJ3QgaGF2ZSBhIGNoYW5jZSB0
byB0ZXN0IGl0IGJlY2F1c2UgaXQgYXBwbGllcyBvbiBvdXIgcmRtYS1uZXh0LCBidXQKPiA+ID4g
ZmFpbHMgdG8gY29tcGlsZS4KPiA+Cj4gPiBXaGF0IGlzIHRoZSBjb21waWxhdGlvbiBwcm9ibGVt
PyBJcyBpdCBjYXVzZWQgYnkgdGhlIHBhdGNoIG9yIHNvbWUgb3RoZXIKPiA+IHVucmVsYXRlZCBj
aGFuZ2VkPwo+IAo+IFRoYW5rcyBmb3IgcHVzaGluZyBtZSB0byB0YWtlIGEgbG9vayBvbiBpdC4K
PiBZb3VyIHBhdGNoIG5lZWRzIHRoZSBmb2xsb3dpbmcgaHVuayB0byBwcm9wZXJseSBjb21waWxl
IGF0IGxlYXN0IG9uIG15IHN5c3RlbS4KCkkgc3VzcGVjdCB5b3Ugd2VyZSB0cnlpbmcgdGhlIG9y
aWdpbmFsIHZlcnNpb24uIEkndmUgcG9zdGVkIGFuIHVwZGF0ZWQKcGF0Y2ggaGVyZSBodHRwOi8v
bGttbC5rZXJuZWwub3JnL3IvMjAxODA2MjcwNzQ0MjEuR0YzMjM0OEBkaGNwMjIuc3VzZS5jegph
bmQgYWxsIHRoZXNlIGlzc3VlcyBzaG91bGQgYmUgZml4ZWQgdGhlcmUuIEluY2x1ZGluZyBtYW55
IG90aGVyIGZpeGVzLgoKQ291bGQgeW91IGhhdmUgYSBsb29rIGF0IHRoYXQgb25lIHBsZWFzZT8K
LS0gCk1pY2hhbCBIb2NrbwpTVVNFIExhYnMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
