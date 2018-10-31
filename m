From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 1/8] viridian: move the code into its own
 sub-directory
Date: Wed, 31 Oct 2018 04:17:50 -0600
Message-ID: <5BD9814E02000078001F6ACE@prv1-mh.provo.novell.com>
References: <20181029180211.2155-1-paul.durrant@citrix.com>
 <20181029180211.2155-2-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=nwhd=nl=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gHnZT-0000mI-Sv
 for xen-devel@lists.xenproject.org; Wed, 31 Oct 2018 10:17:55 +0000
In-Reply-To: <20181029180211.2155-2-paul.durrant@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <paul.durrant@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI5LjEwLjE4IGF0IDE5OjAyLCA8cGF1bC5kdXJyYW50QGNpdHJpeC5jb20+IHdyb3Rl
Ogo+IFN1YnNlcXVlbnQgcGF0Y2hlcyB3aWxsIGludHJvZHVjZSBzdXBwb3J0IGZvciBtb3JlIHZp
cmlkaWFuIGVubGlnaHRlbm1lbnRzCj4gd2hpY2ggd2lsbCBtYWtlIGEgc2luZ2xlIHNvdXJjZSBt
b2R1bGUgcXVpdGUgbGVuZ3RoeS4KPiAKPiBUaGlzIHBhdGNoIHRoZXJlZm9yZSBjcmVhdGVzIGEg
bmV3IGFyY2gveDg2L2h2bS92aXJpZGlhbiBzdWItZGlyZWN0b3J5IGFuZAo+IG1vdmVzIHZpcmlk
aWFuLmMgaW50byB0aGF0Lgo+IAo+IFRoZSBwYXRjaCBhbHNvIGZpeGVzIHNvbWUgYmFkIHdoaXRl
c3BhY2Ugd2hpbHN0IG1vdmluZyB0aGUgY29kZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBQYXVsIER1
cnJhbnQgPHBhdWwuZHVycmFudEBjaXRyaXguY29tPgo+IC0tLQo+IENjOiBKYW4gQmV1bGljaCA8
amJldWxpY2hAc3VzZS5jb20+Cj4gQ2M6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNp
dHJpeC5jb20+Cj4gQ2M6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+Cj4gLS0tCj4gIHhl
bi9hcmNoL3g4Ni9odm0vTWFrZWZpbGUgICAgICAgICAgICAgICAgICB8IDIgKy0KPiAgeGVuL2Fy
Y2gveDg2L2h2bS92aXJpZGlhbi9NYWtlZmlsZSAgICAgICAgIHwgMSArCj4gIHhlbi9hcmNoL3g4
Ni9odm0veyA9PiB2aXJpZGlhbn0vdmlyaWRpYW4uYyB8IDQgKystLQo+ICAzIGZpbGVzIGNoYW5n
ZWQsIDQgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0
IHhlbi9hcmNoL3g4Ni9odm0vdmlyaWRpYW4vTWFrZWZpbGUKPiAgcmVuYW1lIHhlbi9hcmNoL3g4
Ni9odm0veyA9PiB2aXJpZGlhbn0vdmlyaWRpYW4uYyAoOTklKQoKQWN0dWFsbHksIEkgbm93IHJl
YWxpemUgdGhhdCBteSBhY2sgaXMgZGVwZW5kZW50IG9uIHlvdSBhbHNvCmFkanVzdGluZyAuL01B
SU5UQUlORVJTIGhlcmUsIG9yIGVsc2UgeW91IHdpbGwgY2Vhc2UgdG8gYmUKbWFpbnRhaW5lciBv
ZiB0aGlzIGNvZGUuCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
