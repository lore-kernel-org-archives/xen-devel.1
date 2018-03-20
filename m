From: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH] qemu: include generated files with <> and
 not ""
Date: Tue, 20 Mar 2018 15:53:51 +0200
Message-ID: <20180320155042-mutt-send-email-mst@kernel.org>
References: <1521510562-529051-1-git-send-email-mst@redhat.com>
 <8f06e1e3-4823-d8e8-43bd-c092c523849e@vivier.eu>
 <20180320094406.GD4530@redhat.com>
 <20180320141107-mutt-send-email-mst@kernel.org>
 <20180320121841.GN4530@redhat.com>
 <20180320142756-mutt-send-email-mst@kernel.org>
 <20180320123900.GO4530@redhat.com>
 <20180320133216.u4hdijttdnyjbfpu@sirius.home.kraxel.org>
 <6061af99-0c27-e02b-e185-fe1dfca1a96a@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=bav8=gk=redhat.com=mst@srs-us1.protection.inumbo.net>)
 id 1eyHiW-0002pk-Ne
 for xen-devel@lists.xenproject.org; Tue, 20 Mar 2018 13:54:20 +0000
Content-Disposition: inline
In-Reply-To: <6061af99-0c27-e02b-e185-fe1dfca1a96a@redhat.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Thomas Huth <thuth@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, Dmitry Fleytman <dmitry.fleytman@gmail.com>, sheepdog@lists.wpkg.org, Ronnie Sahlberg <ronniesahlberg@gmail.com>, Li Zhijian <lizhijian@cn.fujitsu.com>, David Hildenbrand <david@redhat.com>, Jeff Cody <jcody@redhat.com>, Zhang Chen <zhangckid@gmail.com>, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org, "Richard W.M. Jones" <rjones@redhat.com>, Keith Busch <keith.busch@intel.com>, Max Filippov <jcmvbkbc@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Jiri Pirko <jiri@resnulli.us>, Subbaraya Sundeep <sundeep.lkml@gmail.com>, Eric Blake <eblake@redhat.com>, Michael Roth <mdroth@linux.vnet.ibm.com>, Marcelo Tosatti <mtosatti@redhat.com>, Josh Durgin <jdurgin@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>, Alberto Garcia <berto@igalia.com>, zhanghailiang
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBNYXIgMjAsIDIwMTggYXQgMDI6NDY6NDZQTSArMDEwMCwgVGhvbWFzIEh1dGggd3Jv
dGU6Cj4gT24gMjAuMDMuMjAxOCAxNDozMiwgR2VyZCBIb2ZmbWFubiB3cm90ZToKPiA+ICAgSGks
Cj4gPiAKPiA+Pj4gU28gZm9yIHRoZXNlLCB3ZSBzaG91bGQgdXNlICIiLiAgTm9uZSBvZiB0aGVz
ZSBhcmUgZ2VuZXJhdGVkIGZpbGVzIHRob3VnaC4KPiA+Pgo+ID4+IFRoYXQgbGVhZHMgdG8gY3Jh
enkgaW5jb25zaXN0ZW50IG1lc3NhZ2UgZm9yIGRldmVsb3BlcnMgd2hlcmUgNTAlIG9mIFFFTVUK
PiA+PiBoZWFkZXIgZmlsZXMgbXVzdCB1c2UgPD4gYW5kIHRoZSBvdGhlciA1MCUgb2YgaGVhZGVy
IGZpbGVzIG11c3QgdXNlICIiLgo+ID4gCj4gPiBUaGUgcnVsZXMgYXJlIHByZXR0eSBzaW1wbGUg
dGhvdWdoOgo+ID4gCj4gPiAgICAoMSkgSGVhZGVycyB3aGljaCBhcmUgZ2VuZXJhdGVkIHVzZSA8
Pi4KPiA+ICAgICgyKSBIZWFkZXJzIHdoaWNoIGFyZSBpbiBpbmNsdWRlLyB1c2UgPD4uCj4gPiAg
ICAoMykgSGVhZGVycyBzaXR0aW5nIGluIHRoZSBzYW1lIGRpcmVjdG9yeSBhcyB0aGUgc291cmNl
IGZpbGVzIHVzZSAiIi4KPiAKPiBVZ2gsIG5vLiBQbGVhc2UgZG9uJ3QuIFRoZSBub3JtYWwgd2F5
IG9mIGluY2x1ZGluZyBoZWFkZXIgZmlsZXMgaW4gUUVNVQoKU3RyZXNzIG9uICJpbiBRRU1VIi4K
Cj4gaXMgdG8gdXNlICIiIC0gYWxzbyBmb3IgaGVhZGVycyB0aGF0IGFyZSBub3QgaW4gdGhlIHNh
bWUgZGlyZWN0b3J5LiBGb3IKPiBleGFtcGxlIGp1c3QgZG8gYQo+IAo+ICBncmVwIC1yICdeI2lu
Y2x1ZGUuKmh3LycgaHcvCj4gCj4gZnJvbSB0aGUgdG9wIGRpcmVjdG9yeSBhbmQgeW91J2xsIHNl
ZSB3aGF0IEkgbWVhbi4gQ2hhbmdpbmcgdGhhdCBydWxlIGlzCj4gY3JhenkuCj4gU28gcGxlYXNl
LCBsZXQncyBqdXN0IGZpeCB0aGUgY29uZmlndXJlIHNjcmlwdCB0byBkZXRlY3Qgc29tZQo+IG1v
cmUgc3RhbGUgZmlsZXMgaW4gdGhlIHNvdXJjZSB0cmVlLCBhbmQgd2UncmUgZG9uZS4KPiAKPiAg
VGhvbWFzCgpUaGUgcnVsZSBwcm9iYWJseSBzZXJ2ZWQgYSB1c2VmdWwgcHVycG9zZSB3aGVuIGFs
bApoZWFkZXJzIHdoZXJlIGluIHRoZSBzYW1lIGRpcmVjdG9yeSBhcyB0aGUgc291cmNlLgp3ZSBt
b3ZlZCB0aGVtIG91dCBzbyB0aGF0IGlzIG5vIGxvbmdlciB0aGUgY2FzZS4KCi0tIApNU1QKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
