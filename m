From: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <royger@freebsd.org>
Subject: Re: [PATCH v3 04/15] argo: init, destroy and soft-reset,
 with enable command line opt
Date: Mon, 14 Jan 2019 20:42:09 +0100
Message-ID: <CAPLaKK4ns7sHFvMwLAsm1=yB81oLPhj1ad9uS1hMSQbghBH11w@mail.gmail.com>
References: <1546846968-7372-1-git-send-email-christopher.w.clark@gmail.com>
 <1546846968-7372-5-git-send-email-christopher.w.clark@gmail.com>
 <20190114144655.enuxtrcihy3vjbjv@zion.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=K9EW=PW=gmail.com=royger@srs-us1.protection.inumbo.net>)
 id 1gj87r-00081R-LP
 for xen-devel@lists.xenproject.org; Mon, 14 Jan 2019 19:42:23 +0000
Received: by mail-oi1-f194.google.com with SMTP id r62so225456oie.1
 for <xen-devel@lists.xenproject.org>; Mon, 14 Jan 2019 11:42:21 -0800 (PST)
In-Reply-To: <20190114144655.enuxtrcihy3vjbjv@zion.uk.xensource.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Ross Philipson <ross.philipson@gmail.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Jason Andryuk <jandryuk@gmail.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Christopher Clark <christopher.w.clark@gmail.com>, Tim Deegan <tim@xen.org>, Daniel Smith <dpsmith@apertussolutions.com>, Rich Persaud <persaur@gmail.com>, Paul Durrant <paul.durrant@citrix.com>, Jan Beulich <jbeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>, James McKenzie <james@bromium.com>, Eric Chanudet <eric.chanudet@gmail.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBKYW4gMTQsIDIwMTkgYXQgMzo0OCBQTSBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXgu
Y29tPiB3cm90ZToKPgo+IEhpIGFsbAo+Cj4gVGhlIGxvY2tpbmcgc2NoZW1lIHNlZW1zIHRvIGJl
IHJlbWFpbmluZyBzdGlja2luZyBwb2ludC4gVGhlIHJlc3QgYXJlCj4gbW9zdGx5IGNvc21ldGlj
IGlzc3VlcyAoRkFPRCwgdGhleSBzdGlsbCBuZWVkIHRvIGJlIGFkZHJlc3NlZCkuICBGcmFua2x5
Cj4gSSBkb24ndCB0aGluayB0aGVyZSBpcyBlbm91Z2ggdGltZSB0byBhZGRyZXNzIGFsbCB0aGUg
dGVjaG5pY2FsIGRldGFpbHMsCj4gYnV0IGxldCBtZSBzdW0gdXAgZWFjaCBzaWRlJ3MgcG9zaXRp
b24gYW5kIHNlZSBpZiB3ZSBjYW4gcmVhY2ggYW4KPiBhbWljYWJsZSBzb2x1dGlvbi4KPgo+IEZy
b20gbWFpbnRhaW5lcnMgYW5kIHJldmlld2VycycgcG9pbnQgb2YgdmlldzoKPgo+IDEuIE1haW50
YWluZXJzIC8gcmV2aWV3ZXJzIGRvbid0IGxpa2UgY29tcGxleGl0eSB1bmxlc3MgYWJzb2x1dGVs
eQo+ICAgIG5lY2Vzc2FyeS4KPiAyLiBNYWludGFpbmVycyAvIHJldmlld2VycyBmZWVsIHRoZXkg
aGF2ZSBhIHJlc3BvbnNpYmlsaXR5IHRvIHVuZGVyc3RhbmQKPiAgICB0aGUgY29kZSBhbmQgYWxn
b3JpdGhtLgo+Cj4gWWV0IGJlaW5nIHRoZSBnYXRla2VlcGVycyBkb2Vzbid0IG5lY2Vzc2FyaWx5
IG1lYW4gd2UgdW5kZXJzdGFuZCBldmVyeQo+IHRlY2huaWNhbCBkZXRhaWxzIGFuZCBldmVyeSB1
c2VjYXNlLiBXZSB3b3VsZCBsaWtlIHRvLCBidXQgbW9zdCBvZiB0aGUKPiB0aW1lIGl0IGlzIHVu
cmVhbGlzdGljLgo+Cj4gRG93biB0byB0aGlzIHNwZWNpZmljIHBhdGNoIHNlcmllczoKPgo+IFJv
Z2VyIHRoaW5rcyB0aGUgbG9ja2luZyBzY2hlbWUgaXMgdG9vIGNvbXBsZXguIENocmlzdG9waGVy
IGFyZ3Vlcwo+IHRoYXQncyBuZWNlc3NhcnkgZm9yIHNob3J0LWxpdmUgY2hhbm5lbHMgdG8gYmUg
cGVyZm9ybWFudC4KPgo+IEJvdGggaGF2ZSB0aGVpciBwb2ludC4KPgo+IEkgdGhpbmsgaGF2aW5n
IGEgY29tcGxleCBsb2NraW5nIHNjaGVtZSBpcyBpbmV2aXRhYmxlLCBqdXN0IGxpa2Ugd2UgZGlk
Cj4gZm9yIHBlcmZvcm1hbnQgZ3JhbnQgdGFibGUgc2V2ZXJhbCB5ZWFycyBhZ28uICBSZWdhcmRs
ZXNzIG9mIHRoZSB0aW1pbmcKPiBpc3N1ZSB3ZSBoYXZlIGF0IGhhbmQsIGFza2luZyBDaHJpc3Rv
cGhlciB0byBpbXBsZW1lbnQgYSBzdHJpcHBlZCBkb3duCj4gdmVyc2lvbiBjcmVhdGVzIG1vcmUg
d29yayBmb3IgaGltLgo+Cj4gWWV0IGlnbm9yaW5nIFJvZ2VyJ3MgY29uY2VybnMgaXMgdW5mYWly
IHRvIGhpbSBhcyB3ZWxsLCBzaW5jZSBoZSBwdXQgaW4KPiBzbyBtdWNoIHRpbWUgYW5kIGVmZm9y
dCB0byB1bmRlcnN0YW5kIHRoZSBhbGdvcml0aG0gYW5kIHByb3ZpZGUKPiBzdWdnZXN0aW9ucy4g
SXQgaXMgaW4gZmFjdCB1bnJlYXNvbmFibGUgdG8gYXNrIGFueW9uZSB0byBmdWxseQo+IHVuZGVy
c3RhbmQgdGhlIGxvY2tpbmcgbWVjaGFuaXNtIGFuZCBjaGVjayB0aGUgaW1wbGVtZW50YXRpb24g
aXMgY29ycmVjdAo+IGluIGEgZmV3IGRheXMgKGdpdmVuIHRoZSBzZXJpZXMgd2FzIHBvc3RlZCBp
biBEZWMgYW5kIHRoZXJlIHdlcmUgbWFqb3IKPiBob2xpZGF5cyBpbiBiZXR3ZWVuLCBwbHVzIGV2
ZXJ5b25lIGhhZCBvdGhlciBjb21taXRtZW50cykuCj4KPiBUbyB1bmJsb2NrIHRoaXMsIGhvdyBh
Ym91dCB3ZSBtYWtlIENocmlzdG9waGVyIG1haW50YWluZXIgb2YgQXJnbz8gSGUKPiBhbmQgT3Bl
blhUIHdpbGwgYmUgb24gdGhlIGhvb2sgZm9yIGZ1cnRoZXIgaW1wcm92ZW1lbnQuIEFuZCBJIGJl
bGlldmUgaXQKPiB3b3VsZCBiZSBpbiB0aGVpciBiZXN0IGludGVyZXN0IHRvIGtlZXAgQXJnbyBi
dWctZnJlZSBhbmQgZXZlbnR1YWxseQo+IG1ha2UgaXQgYmVjb21lIHN1cHBvcnRlZC4KPgo+IFNv
Ogo+Cj4gMS4gTWFrZSBzdXJlIEFyZ28gaXMgc2VsZi1jb250YWluZWQgLS0gdGhpcyByZXF1aXJl
cyBjYXJlZnVsIHJldmlldyBmb3IKPiAgICBpbnRlcmFjdGlvbiBiZXR3ZWVuIEFyZ28gYW5kIG90
aGVyIHBhcnRzIG9mIHRoZSBoeXBlcnZpc29yLgo+IDIuIEFyZ28gaXMgZ29pbmcgdG8gYmUgZXhw
ZXJpbWVudGFsIGFuZCBvZmYtYnktZGVmYXVsdCAtLSB0aGlzIGlzIHRoZQo+ICAgIGRlZmF1bHQg
c3RhdHVzIGZvciBuZXcgZmVhdHVyZSBhbnl3YXkuCj4gMy4gTWFrZSBDaHJpc3RvcGhlciBtYWlu
dGFpbmVyIG9mIEFyZ28gLS0gdGhpcyB3b3VsZCBiZSBhIG5hdHVyYWwgdGhpbmcKPiAgICB0byBk
byBhbnl3YXkuCj4KPiBEb2VzIHRoaXMgd29yayBmb3IgZXZlcnlvbmU/CgpJIHRoaW5rIHRoaXMg
aXMgZmluZS4KClRoYW5rcywgUm9nZXIuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
