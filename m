From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v7 09/15] argo: implement the sendv op;
 evtchn: expose send_guest_global_virq
Date: Tue, 05 Feb 2019 00:47:54 -0700
Message-ID: <5C593FAA0200007800213D1C@prv1-mh.provo.novell.com>
References: <1548908900-1128-1-git-send-email-christopher.w.clark@gmail.com>
 <1548908900-1128-10-git-send-email-christopher.w.clark@gmail.com>
 <5C584EFE0200007800213AF4@prv1-mh.provo.novell.com>
 <CACMJ4GbAJ+1Tyh7Ty8LuGJy52xU0wBQ0fbzpijVhnd03PULTkA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=tSsM=QM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gqvSg-0000BJ-Pw
 for xen-devel@lists.xenproject.org; Tue, 05 Feb 2019 07:48:06 +0000
In-Reply-To: <CACMJ4GbAJ+1Tyh7Ty8LuGJy52xU0wBQ0fbzpijVhnd03PULTkA@mail.gmail.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Christopher Clark <christopher.w.clark@gmail.com>
Cc: Juergen Gross <jgross@suse.com>, Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, ross.philipson@gmail.com, Jason Andryuk <jandryuk@gmail.com>, Daniel Smith <dpsmith@apertussolutions.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Rich Persaud <persaur@gmail.com>, James McKenzie <james@bromium.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, eric chanudet <eric.chanudet@gmail.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA1LjAyLjE5IGF0IDAxOjUyLCA8Y2hyaXN0b3BoZXIudy5jbGFya0BnbWFpbC5jb20+
IHdyb3RlOgo+IFRvIG1ha2UgQXJnbydzIGN1cnJlbnQgRXhwZXJpbWVudGFsIHN0YXR1cyBjbGVh
cmVyLCB3aXRoIHRoZSBBQkkgc3RhYmlsaXR5Cj4gc3RhdHVzIHRoYXQgYWNjb3JkcywgSSBwcm9w
b3NlIHRoZSBmb2xsb3dpbmcgYWRkaXRpb24gdG8gU1VQUE9SVC5tZDoKPiAKPiBXaXRoaW4gc2Vj
dGlvbjogIyMgVmlydHVhbCBIYXJkd2FyZSwgSHlwZXJ2aXNvcgo+IAo+ICMjIyBBcmdvOiBJbnRl
ci1kb21haW4gbWVzc2FnZSBkZWxpdmVyeSBieSBoeXBlcmNhbGwuCj4gCj4gICAgIFN0YXR1czog
RXhwZXJpbWVudGFsCgpBaCB5ZXMuIEl0J3Mgb2RkIGVub3VnaCB0aGF0IG5vLW9uZSBzbyBmYXIg
aGFzIG5vdGljZWQgdGhlIG5lZWQKZm9yIGFuIGFkZGl0aW9uIHRoZXJlLiBJIHRoaW5rIHdlJ3Jl
IHN0aWxsIG9uIHRoZSBwYXRoIG9mIGxlYXJuaW5nIHRoYXQKZmVhdHVyZSBhZGRpdGlvbnMgbmVl
ZCBuZXcgZW50cmllcyB0aGVyZS4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
