From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH v5 08/15] argo: implement the unregister op
Date: Tue, 22 Jan 2019 12:02:48 +0100
Message-ID: <20190122110248.k6f6dv64zswq3o6b@mac>
References: <1548064795-18160-1-git-send-email-christopher.w.clark@gmail.com>
 <1548064795-18160-9-git-send-email-christopher.w.clark@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Y/S+=P6=citrix.com=prvs=918322aae=roger.pau@srs-us1.protection.inumbo.net>)
 id 1gltqx-0004UZ-2r
 for xen-devel@lists.xenproject.org; Tue, 22 Jan 2019 11:04:23 +0000
Content-Disposition: inline
In-Reply-To: <1548064795-18160-9-git-send-email-christopher.w.clark@gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Christopher Clark <christopher.w.clark@gmail.com>
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Ross Philipson <ross.philipson@gmail.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Jason Andryuk <jandryuk@gmail.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Rich Persaud <persaur@gmail.com>, Tim Deegan <tim@xen.org>, Daniel Smith <dpsmith@apertussolutions.com>, Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>, Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org, James McKenzie <james@bromium.com>, Eric Chanudet <eric.chanudet@gmail.com>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBKYW4gMjEsIDIwMTkgYXQgMDE6NTk6NDhBTSAtMDgwMCwgQ2hyaXN0b3BoZXIgQ2xh
cmsgd3JvdGU6Cj4gVGFrZXMgYSBzaW5nbGUgYXJndW1lbnQ6IGEgaGFuZGxlIHRvIHRoZSByaW5n
IHVucmVnaXN0cmF0aW9uIHN0cnVjdCwKPiB3aGljaCBzcGVjaWZpZXMgdGhlIHBvcnQgYW5kIHBh
cnRuZXIgZG9tYWluIGlkIG9yIHdpbGRjYXJkLgo+IAo+IFRoZSByaW5nJ3MgZW50cnkgaXMgcmVt
b3ZlZCBmcm9tIHRoZSBoYXNodGFibGUgb2YgcmVnaXN0ZXJlZCByaW5nczsKPiBhbnkgZW50cmll
cyBmb3IgcGVuZGluZyBub3RpZmljYXRpb25zIGFyZSByZW1vdmVkOyBhbmQgdGhlIHJpbmcgaXMK
PiB1bm1hcHBlZCBmcm9tIFhlbidzIGFkZHJlc3Mgc3BhY2UuCj4gCj4gSWYgdGhlIHJpbmcgaGFk
IGJlZW4gcmVnaXN0ZXJlZCB0byBjb21tdW5pY2F0ZSB3aXRoIGEgc2luZ2xlIHNwZWNpZmllZAo+
IGRvbWFpbiAoaWUuIGEgbm9uLXdpbGRjYXJkIHJpbmcpIHRoZW4gdGhlIHBhcnRuZXIgZG9tYWlu
IHN0YXRlIGlzIHJlbW92ZWQKPiBmcm9tIHRoZSBwYXJ0bmVyIGRvbWFpbidzIGFyZ28gc2VuZF9p
bmZvIGhhc2ggdGFibGUuCj4gCj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoZXIgQ2xhcmsgPGNo
cmlzdG9waGVyLmNsYXJrNkBiYWVzeXN0ZW1zLmNvbT4KCkxHVE06CgpSZXZpZXdlZC1ieTogUm9n
ZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+CgpKdXN0IG9uZSBuaXQgYWJvdXQg
dGhlIG9wZW4tY29kZWQgbGlzdF9mb3JfZWFjaC4KCj4gZGlmZiAtLWdpdCBhL3hlbi9jb21tb24v
YXJnby5jIGIveGVuL2NvbW1vbi9hcmdvLmMKPiBpbmRleCBhN2VjMGUwLi5lNGNkNDQ2IDEwMDY0
NAo+IC0tLSBhL3hlbi9jb21tb24vYXJnby5jCj4gKysrIGIveGVuL2NvbW1vbi9hcmdvLmMKPiBA
QCAtNDMsNiArNDMsNyBAQCBERUZJTkVfWEVOX0dVRVNUX0hBTkRMRSh4ZW5fYXJnb19hZGRyX3Qp
Owo+ICBERUZJTkVfWEVOX0dVRVNUX0hBTkRMRSh4ZW5fYXJnb19nZm5fdCk7Cj4gIERFRklORV9Y
RU5fR1VFU1RfSEFORExFKHhlbl9hcmdvX3JlZ2lzdGVyX3JpbmdfdCk7Cj4gIERFRklORV9YRU5f
R1VFU1RfSEFORExFKHhlbl9hcmdvX3JpbmdfdCk7Cj4gK0RFRklORV9YRU5fR1VFU1RfSEFORExF
KHhlbl9hcmdvX3VucmVnaXN0ZXJfcmluZ190KTsKPiAgCj4gIHN0YXRpYyBib29sIF9fcmVhZF9t
b3N0bHkgb3B0X2FyZ287Cj4gIHN0YXRpYyBib29sIF9fcmVhZF9tb3N0bHkgb3B0X2FyZ29fbWFj
X3Blcm1pc3NpdmU7Cj4gQEAgLTM1MSw2ICszNTIsMzcgQEAgZmluZF9yaW5nX2luZm8oY29uc3Qg
c3RydWN0IGRvbWFpbiAqZCwgY29uc3Qgc3RydWN0IGFyZ29fcmluZ19pZCAqaWQpCj4gICAgICBy
ZXR1cm4gTlVMTDsKPiAgfQo+ICAKPiArc3RhdGljIHN0cnVjdCBhcmdvX3NlbmRfaW5mbyAqCj4g
K2ZpbmRfc2VuZF9pbmZvKGNvbnN0IHN0cnVjdCBkb21haW4gKmQsIGNvbnN0IHN0cnVjdCBhcmdv
X3JpbmdfaWQgKmlkKQo+ICt7Cj4gKyAgICBzdHJ1Y3QgbGlzdF9oZWFkICpjdXJzb3IsICpidWNr
ZXQ7Cj4gKwo+ICsgICAgQVNTRVJUKExPQ0tJTkdfc2VuZF9MMihkKSk7Cj4gKwo+ICsgICAgLyog
TGlzdCBpcyBub3QgbW9kaWZpZWQgaGVyZS4gU2VhcmNoIGFuZCByZXR1cm4gdGhlIG1hdGNoIGlm
IGZvdW5kLiAqLwo+ICsgICAgYnVja2V0ID0gJmQtPmFyZ28tPnNlbmRfaGFzaFtoYXNoX2luZGV4
KGlkKV07Cj4gKwo+ICsgICAgZm9yICggY3Vyc29yID0gYnVja2V0LT5uZXh0OyBjdXJzb3IgIT0g
YnVja2V0OyBjdXJzb3IgPSBjdXJzb3ItPm5leHQgKQoKbGlzdF9mb3JfZWFjaAoKVGhhbmtzLCBS
b2dlci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
