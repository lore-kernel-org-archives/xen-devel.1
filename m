From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v9 5/7] memory: add
 check_get_page_from_gfn() as a wrapper...
Date: Wed, 19 Sep 2018 02:31:47 -0600
Message-ID: <5BA2097302000078001E9C22@prv1-mh.provo.novell.com>
References: <20180913152128.6114-1-paul.durrant@citrix.com>
 <20180913152128.6114-6-paul.durrant@citrix.com>
 <5BA0FAB702000078001E9779@prv1-mh.provo.novell.com>
 <71ebe85f6fe94f989db6618eabf22c1e@AMSPEX02CL03.citrite.net>
 <5BA110EF02000078001E9802@prv1-mh.provo.novell.com>
 <ef6cbe5d4b994f7fbf61eb634c040dd4@AMSPEX02CL03.citrite.net>
 <5BA1E69F02000078001E99DF@prv1-mh.provo.novell.com>
 <f6f35c7b1ccf4abbaf0352f99b89e4fe@AMSPEX02CL03.citrite.net>
 <a6b4262af22f4c04a223d790a8992921@AMSPEX02CL03.citrite.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=lqxj=mb=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1g2Xtr-0006SX-3B
 for xen-devel@lists.xenproject.org; Wed, 19 Sep 2018 08:31:55 +0000
In-Reply-To: <a6b4262af22f4c04a223d790a8992921@AMSPEX02CL03.citrite.net>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <paul.durrant@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, george.dunlap@citrix.com, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>, IanJackson <Ian.Jackson@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE5LjA5LjE4IGF0IDEwOjAxLCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+IHdyb3Rl
Ogo+PiBGcm9tOiBYZW4tZGV2ZWwgW21haWx0bzp4ZW4tZGV2ZWwtYm91bmNlc0BsaXN0cy54ZW5w
cm9qZWN0Lm9yZ10gT24gQmVoYWxmCj4+IE9mIFBhdWwgRHVycmFudAo+PiBTZW50OiAxOSBTZXB0
ZW1iZXIgMjAxOCAwODo1Ngo+PiAKPj4gPiBGcm9tOiBKYW4gQmV1bGljaCBbbWFpbHRvOkpCZXVs
aWNoQHN1c2UuY29tXQo+PiA+IFNlbnQ6IDE5IFNlcHRlbWJlciAyMDE4IDA3OjAzCj4+ID4KPj4g
PiA+Pj4gT24gMTguMDkuMTggYXQgMTg6MzcsIDxQYXVsLkR1cnJhbnRAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4+ID4gPiBNb3ZpbmcgdG8gcDJtLWNvbW1vbiB3b24ndCB3b3JrLiBUaGUgZnVuY3Rpb24g
ZGVjbGFyYXRpb24gaW52b2x2ZXMgYQo+PiA+ID4gcDJtX3R5cGVfdCBhcmd1bWVudCBhbmQgdGhh
dCBlbnVtIGlzIGRlZmluZWQgaW4gdGhlIGFybSBhbmQgeDg2Cj4+IHNwZWNpZmljCj4+ID4gPiBo
ZWFkZXJzLiBJIHByb3Bvc2UgdGhlcmVmb3JlIHRvIGxlYXZlIHRoaXMgcGF0Y2ggYXMtaXMuCj4+
ID4KPj4gPiBMZWF2aW5nIHRoZSBkdXBsaWNhdGlvbiBpbiBwbGFjZSBpcyBqdXN0IHRoZSBsYXN0
IHJlc29ydCBpbW8uIERvZXMKPj4gPiB4ZW4vbW0uaAo+PiA+IG5vdCB3b3JrIGVpdGhlcj8KPj4g
Cj4+IE5vLCBpdCB3b24ndC4gSXQgaGFzIHRvIGJlIHNvbWV0aGluZyAqYWZ0ZXIqIHRoZSBkZWZp
bml0aW9uIG9mIHRoZQo+PiBwMm1fdHlwZV90IGVudW0uIEkgY291bGQsIGFzIEp1bGllbiBzdWdn
ZXN0ZWQsIG1vdmUgdGhlIGluY2x1c2lvbiBvZiBwMm0tCj4+IGNvbW1vbiBhZnRlciB0aGF0IHBv
aW50LCBidXQgaXQgd291bGQgbWVhbiB0aGUgaGVhZGVyIGd1YXJkcyB3b3VsZCBjZWFzZQo+PiB0
byBEVFJUIG9mIGNvdXJzZS4gSSdtIG5vdCBzdXJlIHdoZXRoZXIgQyB3aWxsIGFsbG93IG1lIHRv
IGZvcndhcmQgZGVjbGFyZQo+PiB0aGUgZW51bSAobm90IHNvbWV0aGluZyBJJ3ZlIHRyaWVkKSBi
dXQgSSBjb3VsZCBnaXZlIHRoYXQgYSBnby4gQW55IG90aGVyCj4+IHN1Z2dlc3Rpb25zPwo+PiAK
PiAKPiBGb3J3YXJkIGRlY2xhcmF0aW9uIG9mIHRoZSBlbnVtIGRvZXMgaW5kZWVkIGFwcGVhciB0
byB3b3JrLCBzbyBJJ2xsIGdvIHdpdGggCj4gdGhhdC4KClRoYXQncyBhbiBleHRlbnNpb24gSSdt
IG5vdCBldmVuIHN1cmUgYWxsIGdjYyB2ZXJzaW9ucyBzdXBwb3J0IChJJ3ZlIGNoZWNrZWQKNC4z
IGp1c3Qgbm93LCB3aGVyZSBpdCB3b3JrcykuIFJvZ2VyLCBhbnkgY2hhbmNlIHlvdSBrbm93IHdo
ZXRoZXIgY2xhbmcKc3VwcG9ydHMgdGhpcz8KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
