From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH 15/25] argo: implement the sendv op
Date: Fri, 4 Jan 2019 09:43:06 +0100
Message-ID: <20190104084306.id4qlvqlqga3y4q5@mac.bytemobile.com>
References: <1543627984-21394-1-git-send-email-christopher.w.clark@gmail.com>
 <1543627984-21394-16-git-send-email-christopher.w.clark@gmail.com>
 <5C10F69A0200007800205711@prv1-mh.provo.novell.com>
 <CACMJ4Ga6uRNtLN75dY7rugrMgb0VOXYVXEE11R2CSbabNTa0-Q@mail.gmail.com>
 <5C1B53BC0200007800207E73@prv1-mh.provo.novell.com>
 <CACMJ4GbkBn692QsX9d-Y43YNN6N_foOCqJJQja0exDm7SNO8Aw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=CPMs=PM=citrix.com=prvs=9008e7f41=roger.pau@srs-us1.protection.inumbo.net>)
 id 1gfL4W-0005Wk-Hq
 for xen-devel@lists.xenproject.org; Fri, 04 Jan 2019 08:43:16 +0000
Content-Disposition: inline
In-Reply-To: <CACMJ4GbkBn692QsX9d-Y43YNN6N_foOCqJJQja0exDm7SNO8Aw@mail.gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Christopher Clark <christopher.w.clark@gmail.com>
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Ross Philipson <ross.philipson@gmail.com>, Jason Andryuk <jandryuk@gmail.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Rich Persaud <persaur@gmail.com>, James McKenzie <voreekf@madingley.org>, Daniel Smith <dpsmith@apertussolutions.com>, Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>, Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>, eric chanudet <eric.chanudet@gmail.com>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBKYW4gMDQsIDIwMTkgYXQgMTI6MTM6MDlBTSAtMDgwMCwgQ2hyaXN0b3BoZXIgQ2xh
cmsgd3JvdGU6Cj4gMikgdGhlIHAybSB0eXBlIG9mIHRoZSBndWVzdC1zdXBwbGllZCBtZW1vcnkg
Zm9yIHRoZSByaW5nLgo+IAo+IFJvZ2VyIHJhaXNlZCBhIHF1ZXJ5IGFib3V0IG5vdCBwaW5uaW5n
IHRoZSBwMm0gdHlwZSBvZiBtZW1vcnkKPiB1c2VkIGZvciB0aGUgcmluZywgYW5kIG15IHJlc3Bv
bnNlIG9uIDIxc3QgRGVjZW1iZXIgaXMgaGVyZToKPiAKPiBodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL2FyY2hpdmVzL2h0bWwveGVuLWRldmVsLzIwMTgtMTIvbXNnMDIyMDQuaHRtbAo+IAo+
IEF0IHRoZSBtb21lbnQsIEkgaGF2ZW4ndCBjaGFuZ2VkIHRoYXQgY29kZS4gSWYgdGhlIHAybSB0
eXBlIGlzIGNoYW5nZWQKPiBhZnRlciByaW5nIHJlZ2lzdHJhdGlvbiwgaXMgaXQgYSBwcm9ibGVt
PyBJZiBub3QsIHRoZW4gSSB0aGluayB0aGUgY29kZSBpcwo+IE9LOyBidXQgaWYgc28gdGhlbiBh
IHBvaW50ZXIgdG8gd2hhdCBtYWtlcyBpdCBwcm9ibGVtYXRpYyB3b3VsZCBiZQo+IGhlbHBmdWwg
dG8gZGV0ZXJtaW5lIGFuIGFwcHJvcHJpYXRlIG5leHQgc3RlcC4KCk15IHBvaW50IHdhcyB0aGF0
IHlvdSBkb24ndCBuZWVkIHRvIGNoZWNrIGV2ZXJ5IHRpbWUgdGhhdCB0aGUgZ2ZuIC0+Cm1mbiB0
cmFuc2xhdGlvbnMgZm9yIHRoZSByaW5nIGFyZSB0aGUgc2FtZSAoYXMgaXMgZG9uZSBpbgphcmdv
X2ZpbmRfcmluZ19tZm5zKS4gQUZBSUNUIHlvdSB0YWtlIGEgcmVmZXJlbmNlIHRvIGVhY2ggcGFn
ZSBpbiB0aGUKcmluZywgc28gdGhlcmUncyBubyBuZWVkIHRvIGNoZWNrIHRoYXQgdGhlIHAybSBt
YXBwaW5nIGlzIHN0aWxsIHRoZQpzYW1lLgoKSSB0aGluayB0aGUgcDJtIHR5cGUgY2hlY2tzIHRo
YXQgeW91IGRvIGFyZSBjb3JyZWN0LCBhbmQgeW91IHNob3VsZApvbmx5IGFsbG93IHAybV9yYW1f
cncgcGFnZXMgdG8gYmUgdXNlZCBmb3IgdGhlIHJpbmcuCgpSb2dlci4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
