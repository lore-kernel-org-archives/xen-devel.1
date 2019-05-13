From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: Xen commit 9b0bc91b3 possibly removed too much info
 from README
Date: Mon, 13 May 2019 14:40:15 +0100
Message-ID: <20190513134015.GE2798@zion.uk.xensource.com>
References: <CABwOO=dhCrnZpRNpLr7rDrNdSh9GCH=fqq_50+YScWT4BE-xjQ@mail.gmail.com>
 <20190411102843.GE30543@zion.uk.xensource.com>
 <CABwOO=cOxxk7sbscGRzZ1LuiH8JJnCoBJ2d19ZmaSeu5DBi6iw@mail.gmail.com>
 <20190415092358.GM30543@zion.uk.xensource.com>
 <20190415093632.GN30543@zion.uk.xensource.com>
 <CABwOO=cyX0PcuvbfYu1ZyN384604sT2HPAoJR+cknFqWH-e7PQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=rpFc=TN=citrix.com=prvs=0298122e9=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1hQBBj-0003lC-1h
 for xen-devel@lists.xenproject.org; Mon, 13 May 2019 13:40:19 +0000
Content-Disposition: inline
In-Reply-To: <CABwOO=cyX0PcuvbfYu1ZyN384604sT2HPAoJR+cknFqWH-e7PQ@mail.gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Kevin Buckley <kevin.buckley.ecs.vuw.ac.nz@gmail.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBBcHIgMTYsIDIwMTkgYXQgMDk6MzE6NDFQTSArMDgwMCwgS2V2aW4gQnVja2xleSB3
cm90ZToKPiA+IE9oIHdhaXQsIEkgZG9uJ3QgdGhpbmsgdGhlcmUgaXMgYW55dGhpbmcgdG8gZml4
IHRoZXJlLiBUaG9zZSBzZW50ZW5jZXMKPiA+IGxvb2sgcmVwZXRpdGl2ZSBidXQgdGhleSBkbyBz
YXkgZGlmZmVyZW50IHRoaW5nczogaW4gdG9vbHMgY2FzZSwgaXQgc2F5cwo+ID4gInJlcG9zIHdp
bGwgYmUgY2xvbmVkIjsgaW4gc3R1YmRvbSBjYXNlLCBpdCBzYXlzICJleHRlcm5hbCBwYWNrYWdl
cwo+ID4gd2lsbCBiZSBkb3dubG9hZGVkLiBTbyB0aGV5IGRvIHJlZmxlY3QgY29ycmVjdGx5IHdo
YXQgd2lsbCBoYXBwZW4uCj4gPgo+IAo+IExldCBtZSBuYXJyb3cgdGhpbmdzIGRvd24gYSBiaXQg
ZnVydGhlciB0byBoaWdobGlnaHQgdGhlIGR1cGxpY2F0aW9uCj4gCj4gLS0tLTg8LS0tLS0tLS04
PC0tLS0tLS0tODwtLS0tLS0tLTg8LS0tLS0tLS04PC0tLS0tLS0tODwtLS0tLS0tLTg8LS0tLS0t
LS04PC0tLS0KPiBEdXJpbmcgdG9vbHMgYnVpbGQgZXh0ZXJuYWwgcmVwb3Mgd2lsbCBiZSBjbG9u
ZWQgaW50byB0aGUgc291cmNlIHRyZWUuICAgIDw9PT0gMQo+IFRoaXMgdmFyaWFibGUgY2FuIGJl
IHVzZWQgdG8gcG9pbnQgdG8gYSBkaWZmZXJlbnQgZ2l0IGJpbmFyeSB0byBiZSB1c2VkLgo+IEdJ
VD0KPiAKPiBEdXJpbmcgdG9vbHMgYnVpbGQgZXh0ZXJuYWwgcmVwb3Mgd2lsbCBiZSBjbG9uZWQg
aW50byB0aGUgc291cmNlIHRyZWUuICAgIDw9PT0gMgo+IER1cmluZyBzdHViZG9tIGJ1aWxkIGV4
dGVybmFsIHBhY2thZ2VzIHdpbGwgYmUgZG93bmxvYWRlZCBpbnRvIHRoZQo+IHNvdXJjZSB0cmVl
LiBUaGVzZSB2YXJpYWJsZXMgY2FuIGJlIHVzZWQgdG8gcG9pbnQgdG8gYSBkaWZmZXJlbnQKPiBs
b2NhdGlvbnMuCj4gIFhFTl9FWFRGSUxFU19VUkw9Cj4gT1ZNRl9VUFNUUkVBTV9VUkw9Cj4gLS0t
LTg8LS0tLS0tLS04PC0tLS0tLS0tODwtLS0tLS0tLTg8LS0tLS0tLS04PC0tLS0tLS0tODwtLS0t
LS0tLTg8LS0tLS0tLS04PC0tLS0KPiAKPiBIb3BlIHRoYXQncyBjbGVhcmVyID8KClllcyBpdCBp
cyBjbGVhcmVyLiBUaGFua3MuCgpXZWkuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
