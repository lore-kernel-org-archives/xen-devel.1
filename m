From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v9 5/7] memory: add
 check_get_page_from_gfn() as a wrapper...
Date: Wed, 19 Sep 2018 02:34:18 -0600
Message-ID: <5BA20A0A02000078001E9C25@prv1-mh.provo.novell.com>
References: <20180913152128.6114-1-paul.durrant@citrix.com>
 <20180913152128.6114-6-paul.durrant@citrix.com>
 <5BA0FAB702000078001E9779@prv1-mh.provo.novell.com>
 <71ebe85f6fe94f989db6618eabf22c1e@AMSPEX02CL03.citrite.net>
 <5BA110EF02000078001E9802@prv1-mh.provo.novell.com>
 <ef6cbe5d4b994f7fbf61eb634c040dd4@AMSPEX02CL03.citrite.net>
 <5BA1E69F02000078001E99DF@prv1-mh.provo.novell.com>
 <f6f35c7b1ccf4abbaf0352f99b89e4fe@AMSPEX02CL03.citrite.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=lqxj=mb=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1g2XwE-0006aL-Dr
 for xen-devel@lists.xenproject.org; Wed, 19 Sep 2018 08:34:22 +0000
In-Reply-To: <f6f35c7b1ccf4abbaf0352f99b89e4fe@AMSPEX02CL03.citrite.net>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, george.dunlap@citrix.com, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>, IanJackson <Ian.Jackson@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE5LjA5LjE4IGF0IDA5OjU2LCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+IHdyb3Rl
Ogo+PiBGcm9tOiBKYW4gQmV1bGljaCBbbWFpbHRvOkpCZXVsaWNoQHN1c2UuY29tXQo+PiBTZW50
OiAxOSBTZXB0ZW1iZXIgMjAxOCAwNzowMwo+PiAKPj4gPj4+IE9uIDE4LjA5LjE4IGF0IDE4OjM3
LCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+IHdyb3RlOgo+PiA+IE1vdmluZyB0byBwMm0tY29t
bW9uIHdvbid0IHdvcmsuIFRoZSBmdW5jdGlvbiBkZWNsYXJhdGlvbiBpbnZvbHZlcyBhCj4+ID4g
cDJtX3R5cGVfdCBhcmd1bWVudCBhbmQgdGhhdCBlbnVtIGlzIGRlZmluZWQgaW4gdGhlIGFybSBh
bmQgeDg2IHNwZWNpZmljCj4+ID4gaGVhZGVycy4gSSBwcm9wb3NlIHRoZXJlZm9yZSB0byBsZWF2
ZSB0aGlzIHBhdGNoIGFzLWlzLgo+PiAKPj4gTGVhdmluZyB0aGUgZHVwbGljYXRpb24gaW4gcGxh
Y2UgaXMganVzdCB0aGUgbGFzdCByZXNvcnQgaW1vLiBEb2VzCj4+IHhlbi9tbS5oCj4+IG5vdCB3
b3JrIGVpdGhlcj8KPiAKPiBObywgaXQgd29uJ3QuIEl0IGhhcyB0byBiZSBzb21ldGhpbmcgKmFm
dGVyKiB0aGUgZGVmaW5pdGlvbiBvZiB0aGUgCj4gcDJtX3R5cGVfdCBlbnVtLiBJIGNvdWxkLCBh
cyBKdWxpZW4gc3VnZ2VzdGVkLCBtb3ZlIHRoZSBpbmNsdXNpb24gb2YgCj4gcDJtLWNvbW1vbiBh
ZnRlciB0aGF0IHBvaW50LCBidXQgaXQgd291bGQgbWVhbiB0aGUgaGVhZGVyIGd1YXJkcyB3b3Vs
ZCBjZWFzZSAKPiB0byBEVFJUIG9mIGNvdXJzZS4gSSdtIG5vdCBzdXJlIHdoZXRoZXIgQyB3aWxs
IGFsbG93IG1lIHRvIGZvcndhcmQgZGVjbGFyZSAKPiB0aGUgZW51bSAobm90IHNvbWV0aGluZyBJ
J3ZlIHRyaWVkKSBidXQgSSBjb3VsZCBnaXZlIHRoYXQgYSBnby4gQW55IG90aGVyIAo+IHN1Z2dl
c3Rpb25zPwoKSSdtIGFmcmFpZCBJIGRvbid0IHVuZGVyc3RhbmQgeW91ciBjb25jZXJuIHdydCBp
bmNsdWRlIGd1YXJkcy4gRWFjaCBoZWFkZXIKaGFzIGl0cyBvd24uIEknbSBhY3R1YWxseSBzdXJw
cmlzZWQgdGhlIGN1cnJlbnQgaW5jbHVzaW9uIHBvaW50IGlzIGF0IHRoZSB0b3AKb2YgdGhlIGZp
bGUsIHJhdGhlciB0aGFuIGFmdGVyIGF0IGxlYXN0IHRoZSBiYXNpYyB0eXBlIGRlZmluaXRpb25z
IGVhY2ggYXJjaApoYXMgdG8gc3VwcGx5LgoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
