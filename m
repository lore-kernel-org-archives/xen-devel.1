From: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH] qemu: include generated files with <> and
 not ""
Date: Tue, 20 Mar 2018 15:50:02 +0200
Message-ID: <20180320154703-mutt-send-email-mst@kernel.org>
References: <1521510562-529051-1-git-send-email-mst@redhat.com>
 <8f06e1e3-4823-d8e8-43bd-c092c523849e@vivier.eu>
 <20180320094406.GD4530@redhat.com>
 <20180320141107-mutt-send-email-mst@kernel.org>
 <20180320121841.GN4530@redhat.com>
 <20180320142756-mutt-send-email-mst@kernel.org>
 <20180320123900.GO4530@redhat.com>
 <20180320133216.u4hdijttdnyjbfpu@sirius.home.kraxel.org>
 <20180320134117.GS4530@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=bav8=gk=redhat.com=mst@srs-us1.protection.inumbo.net>)
 id 1eyHeq-0002dW-NO
 for xen-devel@lists.xenproject.org; Tue, 20 Mar 2018 13:50:32 +0000
Content-Disposition: inline
In-Reply-To: <20180320134117.GS4530@redhat.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, Dmitry Fleytman <dmitry.fleytman@gmail.com>, sheepdog@lists.wpkg.org, Ronnie Sahlberg <ronniesahlberg@gmail.com>, Li Zhijian <lizhijian@cn.fujitsu.com>, David Hildenbrand <david@redhat.com>, Jeff Cody <jcody@redhat.com>, Zhang Chen <zhangckid@gmail.com>, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org, "Richard W.M. Jones" <rjones@redhat.com>, Keith Busch <keith.busch@intel.com>, Max Filippov <jcmvbkbc@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Jiri Pirko <jiri@resnulli.us>, Subbaraya Sundeep <sundeep.lkml@gmail.com>, Eric Blake <eblake@redhat.com>, Michael Roth <mdroth@linux.vnet.ibm.com>, Marcelo Tosatti <mtosatti@redhat.com>, Josh Durgin <jdurgin@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>, Alberto Garcia <berto@igalia.com>, zhanghailiang
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBNYXIgMjAsIDIwMTggYXQgMDE6NDE6MTdQTSArMDAwMCwgRGFuaWVsIFAuIEJlcnJh
bmfDqSB3cm90ZToKPiBPbiBUdWUsIE1hciAyMCwgMjAxOCBhdCAwMjozMjoxNlBNICswMTAwLCBH
ZXJkIEhvZmZtYW5uIHdyb3RlOgo+ID4gICBIaSwKPiA+IAo+ID4gPiA+IFNvIGZvciB0aGVzZSwg
d2Ugc2hvdWxkIHVzZSAiIi4gIE5vbmUgb2YgdGhlc2UgYXJlIGdlbmVyYXRlZCBmaWxlcyB0aG91
Z2guCj4gPiA+IAo+ID4gPiBUaGF0IGxlYWRzIHRvIGNyYXp5IGluY29uc2lzdGVudCBtZXNzYWdl
IGZvciBkZXZlbG9wZXJzIHdoZXJlIDUwJSBvZiBRRU1VCj4gPiA+IGhlYWRlciBmaWxlcyBtdXN0
IHVzZSA8PiBhbmQgdGhlIG90aGVyIDUwJSBvZiBoZWFkZXIgZmlsZXMgbXVzdCB1c2UgIiIuCj4g
PiAKPiA+IFRoZSBydWxlcyBhcmUgcHJldHR5IHNpbXBsZSB0aG91Z2g6Cj4gPiAKPiA+ICAgICgx
KSBIZWFkZXJzIHdoaWNoIGFyZSBnZW5lcmF0ZWQgdXNlIDw+Lgo+ID4gICAgKDIpIEhlYWRlcnMg
d2hpY2ggYXJlIGluIGluY2x1ZGUvIHVzZSA8Pi4KPiA+ICAgICgzKSBIZWFkZXJzIHNpdHRpbmcg
aW4gdGhlIHNhbWUgZGlyZWN0b3J5IGFzIHRoZSBzb3VyY2UgZmlsZXMgdXNlICIiLgo+IAo+IFdl
IGhhdmUgMTIwMCBoZWFkZXIgZmlsZXMgaW4gUUVNVSAtIGEgZGV2ZWxvcGVyIG1pZ2h0IGp1c3Qg
cmVhc29uYWJseSByZW1lbWJlcgo+IHdoaWNoIGhlYWRlciBmaWxlIGlzIGEgUUVNVSBoZWFkZXIs
IHZzIHdoaWNoIGlzIGEgM3JkIHBhcnR5IHN5c3RlbSBoZWFkZXIuCj4gRXhwZWN0aW5nIGRldnMg
dG8gcmVtZW1iZXIgd2hpY2ggb2YgdGhvc2UgMyBidWNrZXRzIGVhY2ggUUVNVSBoZWFkZXIgZmFs
bHMKPiB1bmRlciBpcyB1bnJlYXNvbmFibGUgSU1ITy4gCj4gCj4gUmVnYXJkcywKPiBEYW5pZWwK
ClRoYXQncyB0aGUgQyBsYW5ndWFnZSBmb3IgeW91IHRob3VnaC4gIEZvciBiZXR0ZXIgb3Igd29y
c2UsIHRoZXNlIGFyZQp0aGUgcnVsZXMgdGhhdCBLJlIgY2FtZSB1cCB3aXRoLgoKCj4gLS0gCj4g
fDogaHR0cHM6Ly9iZXJyYW5nZS5jb20gICAgICAtby0gICAgaHR0cHM6Ly93d3cuZmxpY2tyLmNv
bS9waG90b3MvZGJlcnJhbmdlIDp8Cj4gfDogaHR0cHM6Ly9saWJ2aXJ0Lm9yZyAgICAgICAgIC1v
LSAgICAgICAgICAgIGh0dHBzOi8vZnN0b3AxMzguYmVycmFuZ2UuY29tIDp8Cj4gfDogaHR0cHM6
Ly9lbnRhbmdsZS1waG90by5vcmcgICAgLW8tICAgIGh0dHBzOi8vd3d3Lmluc3RhZ3JhbS5jb20v
ZGJlcnJhbmdlIDp8CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
