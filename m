From: Lars Kurth <lars.kurth.xen@gmail.com>
Subject: Re: [PATCH v3 04/15] argo: init, destroy and soft-reset,
 with enable command line opt
Date: Mon, 14 Jan 2019 15:29:41 +0000
Message-ID: <B9309824-C85F-4C4A-B285-BB7345EFE235@xenproject.org>
References: <1546846968-7372-1-git-send-email-christopher.w.clark@gmail.com>
 <1546846968-7372-5-git-send-email-christopher.w.clark@gmail.com>
 <20190114144655.enuxtrcihy3vjbjv@zion.uk.xensource.com>
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.1\))
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=MOjM=PW=gmail.com=lars.kurth.xen@srs-us1.protection.inumbo.net>)
 id 1gj4BO-00023Z-8z
 for xen-devel@lists.xenproject.org; Mon, 14 Jan 2019 15:29:46 +0000
Received: by mail-wr1-x443.google.com with SMTP id z5so23321678wrt.11
 for <xen-devel@lists.xenproject.org>; Mon, 14 Jan 2019 07:29:45 -0800 (PST)
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
Cc: Juergen Gross <jgross@suse.com>, Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Ross Philipson <ross.philipson@gmail.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Jason Andryuk <jandryuk@gmail.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Christopher Clark <christopher.w.clark@gmail.com>, "Tim (Xen.org)" <tim@xen.org>, Daniel Smith <dpsmith@apertussolutions.com>, Rich Persaud <persaur@gmail.com>, Paul Durrant <paul.durrant@citrix.com>, 'Jan Beulich' <jbeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>, James McKenzie <james@bromium.com>, Eric Chanudet <eric.chanudet@gmail.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

QWRkaW5nIEp1ZXJnZW4sCgp0byBtYWtlIHN1cmUgaGUgaXMgYXdhcmUgb2YgdGhlIGRpc2N1c3Np
b24sIGFzIHRoaXMgaXMgYW4gZXhjZWxsZW50IHN1bW1hcnkgb2YgdGhlIHN0YXR1cyBvZiB0aGlz
IHNlcmllcy4KCj4gT24gMTQgSmFuIDIwMTksIGF0IDE0OjQ2LCBXZWkgTGl1IDx3ZWkubGl1MkBj
aXRyaXguY29tPiB3cm90ZToKPiAKPiBIaSBhbGwKPiAKPiBUaGUgbG9ja2luZyBzY2hlbWUgc2Vl
bXMgdG8gYmUgcmVtYWluaW5nIHN0aWNraW5nIHBvaW50LiBUaGUgcmVzdCBhcmUKPiBtb3N0bHkg
Y29zbWV0aWMgaXNzdWVzIChGQU9ELCB0aGV5IHN0aWxsIG5lZWQgdG8gYmUgYWRkcmVzc2VkKS4g
IEZyYW5rbHkKPiBJIGRvbid0IHRoaW5rIHRoZXJlIGlzIGVub3VnaCB0aW1lIHRvIGFkZHJlc3Mg
YWxsIHRoZSB0ZWNobmljYWwgZGV0YWlscywKPiBidXQgbGV0IG1lIHN1bSB1cCBlYWNoIHNpZGUn
cyBwb3NpdGlvbiBhbmQgc2VlIGlmIHdlIGNhbiByZWFjaCBhbgo+IGFtaWNhYmxlIHNvbHV0aW9u
LgoKc25pcAoKPiBUbyB1bmJsb2NrIHRoaXMsIGhvdyBhYm91dCB3ZSBtYWtlIENocmlzdG9waGVy
IG1haW50YWluZXIgb2YgQXJnbz8gSGUKPiBhbmQgT3BlblhUIHdpbGwgYmUgb24gdGhlIGhvb2sg
Zm9yIGZ1cnRoZXIgaW1wcm92ZW1lbnQuIEFuZCBJIGJlbGlldmUgaXQKPiB3b3VsZCBiZSBpbiB0
aGVpciBiZXN0IGludGVyZXN0IHRvIGtlZXAgQXJnbyBidWctZnJlZSBhbmQgZXZlbnR1YWxseQo+
IG1ha2UgaXQgYmVjb21lIHN1cHBvcnRlZC4KPiAKPiBTbzoKPiAKPiAxLiBNYWtlIHN1cmUgQXJn
byBpcyBzZWxmLWNvbnRhaW5lZCAtLSB0aGlzIHJlcXVpcmVzIGNhcmVmdWwgcmV2aWV3IGZvcgo+
ICAgaW50ZXJhY3Rpb24gYmV0d2VlbiBBcmdvIGFuZCBvdGhlciBwYXJ0cyBvZiB0aGUgaHlwZXJ2
aXNvci4KPiAyLiBBcmdvIGlzIGdvaW5nIHRvIGJlIGV4cGVyaW1lbnRhbCBhbmQgb2ZmLWJ5LWRl
ZmF1bHQgLS0gdGhpcyBpcyB0aGUKPiAgIGRlZmF1bHQgc3RhdHVzIGZvciBuZXcgZmVhdHVyZSBh
bnl3YXkuCj4gMy4gTWFrZSBDaHJpc3RvcGhlciBtYWludGFpbmVyIG9mIEFyZ28gLS0gdGhpcyB3
b3VsZCBiZSBhIG5hdHVyYWwgdGhpbmcKPiAgIHRvIGRvIGFueXdheS4KPiAKPiBEb2VzIHRoaXMg
d29yayBmb3IgZXZlcnlvbmU/CgpJIHRoaW5rIHRoaXMgaXMgYSBnb29kIHdheSBmb3J3YXJkLiBU
aGFuayB5b3UgV2VpIGZvciBwdXR0aW5nIHRoaXMgbWFpbCB0b2dldGhlci4KCkJlc3QgUmVnYXJk
cwpMYXJzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
