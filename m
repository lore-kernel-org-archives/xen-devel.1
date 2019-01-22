From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH v5 00/15] Argo: hypervisor-mediated
 interdomain communication
Date: Tue, 22 Jan 2019 15:17:02 +0100
Message-ID: <20190122141702.h3oxvr25xjxbhjcl@mac>
References: <1548064795-18160-1-git-send-email-christopher.w.clark@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Y/S+=P6=citrix.com=prvs=918322aae=roger.pau@srs-us1.protection.inumbo.net>)
 id 1glwtM-0003q0-BR
 for xen-devel@lists.xenproject.org; Tue, 22 Jan 2019 14:19:04 +0000
Content-Disposition: inline
In-Reply-To: <1548064795-18160-1-git-send-email-christopher.w.clark@gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Christopher Clark <christopher.w.clark@gmail.com>
Cc: Juergen Gross <jgross@suse.com>, Lars Kurth <lars.kurth@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Ross Philipson <ross.philipson@gmail.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Jason Andryuk <jandryuk@gmail.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Rich Persaud <persaur@gmail.com>, Tim Deegan <tim@xen.org>, Daniel Smith <dpsmith@apertussolutions.com>, Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>, Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org, Daniel De Graaf <dgdegra@tycho.nsa.gov>, James McKenzie <james@bromium.com>, Eric Chanudet <eric.chanudet@gmail.com>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBKYW4gMjEsIDIwMTkgYXQgMDE6NTk6NDBBTSAtMDgwMCwgQ2hyaXN0b3BoZXIgQ2xh
cmsgd3JvdGU6Cj4gVmVyc2lvbiBmaXZlIG9mIHRoaXMgcGF0Y2ggc2VyaWVzOgo+IAo+ICogQ2hh
bmdlcyBhcmUgcHJpbWFyaWx5IGFkZHJlc3NpbmcgZmVlZGJhY2sgZnJvbSB0aGUgdjQgc2VyaWVz
IHJldmlld3MuCj4gICBNYW55IHBvaW50cyBub3RlZCBvbiB0aGUgaW52aWRpZHVhbCBjb21taXQg
cG9zdHMuCj4gCj4gKiBDcml0aWNhbCBzZWN0aW9ucyBoYXZlIGJlZW4gc2hydW5rLCB3aXRoIGFs
bG9jYXRpb25zIGFuZCBmcmVlcwo+ICAgcHVsbGVkIG91dHNpZGUgd2hlcmUgcG9zc2libGUsIHJl
b3JkZXJpbmcgbG9naWMgd2l0aGluIGh5cGVyY2FsbCBvcHMuCj4gCj4gKiBBIG5ldyByaW5nIGhh
c2ggZnVuY3Rpb24gaW1wbGVtZW50ZWQsIGRlcml2ZWQgZnJvbSB0aGUgZGpiMiBzdHJpbmcKPiAg
IGhhc2ggZnVuY3Rpb24uCj4gCj4gKiBGbGFncyByZXR1cm5lZCBieSB0aGUgbm90aWZ5IG9wIGhh
dmUgYmVlbiBzaW1wbGlmaWVkLgo+IAo+ICogTm93IHVzZXMgYSBzaW5nbGUgYXJnbyBib290IHBh
cmFtZXRlciwgdGFraW5nIGEgbGlzdDoKPiAgIC0gdG9wIGxldmVsIGJvb2xlYW4gdG8gZW5hYmxl
L2Rpc2FibGUgQXJnbwo+ICAgLSBtYWMtcGVybWlzc2l2ZSBvcHRpb24gdG8gZW5hYmxlL2Rpc2Fi
bGUgd2lsZGNhcmQgcmluZ3MKPiAgIC0gY29tbWFuZCBsaW5lIGRvYyBlZGl0OiBubyAiQ09ORklH
X0FSR08iIGJ1dCByZWZlcnMgdG8gYnVpbGQgY29uZmlnCj4gCj4gKiBTd2l0Y2hlZCB0byB1c2Ug
dGhlIHN0YW5kYXJkIGxpc3QgZGF0YSBzdHJ1Y3R1cmVzIHVzZWQgYnkgWGVuJ3MKPiAgIGNvbW1v
biBjb2RlLgoKQUZBSUsgdGhpcyB3YXMgbm90IHJlcXVlc3RlZCBieSBhbnkgcmV2aWV3ZXIsIHNv
IEkgd29uZGVyIHdoeSB5b3UgbWFkZQpzdWNoIGNoYW5nZS4gVGhlIG1vcmUgdGhhdCB5b3Ugb3Bl
biBjb2RlZCBzb21lIG9mIHRoZSBsaXN0XyBtYWNyb3MKaW5zdGVhZCBvZiBqdXN0IGRvaW5nIGEg
cy9obGlzdF8vbGlzdF8vIHJlcGxhY2VtZW50LgoKSSdtIGZpbmUgd2l0aCB1c2luZyBsaXN0IGlu
c3RlYWQgb2YgaGxpc3QsIGJ1dCBJIGRvbid0IHVuZGVyc3RhbmQgd2h5CnlvdSBkZWNpZGVkIHRv
IG9wZW4gY29kZSBsaXN0X2Zvcl9lYWNoIGFuZCBsaXN0X2Zvcl9lYWNoX3NhZmUgaW5zdGVhZApv
ZiB1c2luZyB0aGUgbWFjcm9zIHByb3ZpZGVkIGJ5IFhlbi4gSXMgdGhlcmUgYW4gaXNzdWUgd2l0
aCBzdWNoCm1hY3Jvcz8KCkkndmUgbWFkZSBhIGNvdXBsZSBvZiBtaW5vciBjb21tZW50cywgYnV0
IEkgdGhpbmsgdGhlIGN1cnJlbnQgc3RhdHVzCmlzIGdvb2QsIGFuZCBmaXhpbmcgdGhvc2UgbWlu
b3IgY29tbWVudHMgaXMgZ29pbmcgdG8gYmUgdHJpdmlhbC4KClJvZ2VyLgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
