From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v6 01/14] iommu: introduce the concept of
 BFN...
Date: Thu, 30 Aug 2018 09:59:59 -0600
Message-ID: <5B88147F02000078001E39FB@prv1-mh.provo.novell.com>
References: <20180823094711.21376-1-paul.durrant@citrix.com>
 <20180823094711.21376-2-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=wyq4=ln=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fvPMa-0003gQ-D7
 for xen-devel@lists.xenproject.org; Thu, 30 Aug 2018 16:00:04 +0000
In-Reply-To: <20180823094711.21376-2-paul.durrant@citrix.com>
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
Cc: xen-devel <xen-devel@lists.xenproject.org>, Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Kevin Tian <kevin.tian@intel.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIzLjA4LjE4IGF0IDExOjQ2LCA8cGF1bC5kdXJyYW50QGNpdHJpeC5jb20+IHdyb3Rl
Ogo+IC0tLSBhL3hlbi9pbmNsdWRlL3hlbi9tbS5oCj4gKysrIGIveGVuL2luY2x1ZGUveGVuL21t
LmgKPiBAQCAtMjYsNiArMjYsMTEgQEAKPiAgICogICBBIGxpbmVhciBpZGVhIG9mIGEgZ3Vlc3Qg
cGh5c2ljYWwgYWRkcmVzcyBzcGFjZS4gRm9yIGFuIGF1dG8tdHJhbnNsYXRlZAo+ICAgKiAgIGd1
ZXN0LCBwZm4gPT0gZ2ZuIHdoaWxlIGZvciBhIG5vbi10cmFuc2xhdGVkIGd1ZXN0LCBwZm4gIT0g
Z2ZuLgo+ICAgKgo+ICsgKiBiZm46IEJ1cyBGcmFtZSBOdW1iZXIgKGRlZmluaXRpb25zIGluIGlu
Y2x1ZGUveGVuL2lvbW11LmgpCj4gKyAqICAgVGhlIGxpbmVhciBmcmFtZSBudW1iZXJzIG9mIElP
TU1VIGFkZHJlc3Mgc3BhY2UuIEFsbCBpbml0aWF0b3JzIGZvciAoaS5lLgo+ICsgKiAgIGFsbCBk
ZXZpY2VzIGFzc2lnbmVkIHRvKSBhIGd1ZXN0IHNoYXJlIGEgc2luZ2xlIElPTU1VIGFkZHJlc3Mg
c3BhY2UgYW5kLAo+ICsgKiAgIGJ5IGRlZmF1bHQsIFhlbiB3aWxsIGVuc3VyZSBiZm4gPT0gcGZu
LgoKVGhlIGNvZGUgY2hhbmdlcyBhcmUgcHVyZWx5IG1lY2hhbmljYWwgYW5kIGhlbmNlIGZpbmUs
IGJ1dCBJIGhhdmUKdG8gYWRtaXQgSSBjb250aW51ZSB0byBzdHJ1Z2dsZSB3aXRoIHRoZSAiYnVz
IiBwYXJ0IGluIHRoZSBuYW1lIGhlcmU6CkkgZG9uJ3QgdGhpbmsgaXQgaXMgYW55IGxlc3MgYW1i
aWd1b3VzIHRoYW4gR0ZOLCBiZWNhdXNlIHdoaWNoIGJ1cwphcmUgeW91IHRoaW5raW5nIGFib3V0
IGhlcmU/IFRoZSAodmlydHVhbCkgb25lIGFzIHNlZW4gYnkgdGhlIGd1ZXN0LAphaXVpLiBUaGUg
cGh5c2ljYWwgKGhvc3QpIG9uZSB3b3VsZCBiZSBhdCBsZWFzdCBhcyBuYXR1cmFsIHRvIGJlCmlu
ZGV4ZWQgYnkgc3VjaCB0eXBlZC9uYW1lZCB2YXJpYWJsZXMuIEknZCBzb21laG93IGxpa2UgaXQg
dG8gYmUKbWFkZSBleHBsaWNpdCBpbiB0aGUgbmFtZSB3aG9zZSB2aWV3IHRoZXNlIHJlcHJlc2Vu
dC4gR0JGTj8KVkJGTj8KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
