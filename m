From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH v7 10/15] argo: implement the notify op
Date: Thu, 31 Jan 2019 17:45:16 +0100
Message-ID: <20190131164516.dtnb5t7potvruhuc@mac>
References: <1548908900-1128-1-git-send-email-christopher.w.clark@gmail.com>
 <1548908900-1128-11-git-send-email-christopher.w.clark@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=KPPl=QH=citrix.com=prvs=927f2c6f3=roger.pau@srs-us1.protection.inumbo.net>)
 id 1gpFTH-0001RN-63
 for xen-devel@lists.xenproject.org; Thu, 31 Jan 2019 16:45:47 +0000
Content-Disposition: inline
In-Reply-To: <1548908900-1128-11-git-send-email-christopher.w.clark@gmail.com>
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

T24gV2VkLCBKYW4gMzAsIDIwMTkgYXQgMDg6Mjg6MTVQTSAtMDgwMCwgQ2hyaXN0b3BoZXIgQ2xh
cmsgd3JvdGU6Cj4gUXVlcmllcyBmb3IgZGF0YSBhYm91dCBzcGFjZSBhdmFpbGFiaWxpdHkgaW4g
cmVnaXN0ZXJlZCByaW5ncyBhbmQKPiBjYXVzZXMgbm90aWZpY2F0aW9uIHRvIGJlIHNlbnQgd2hl
biBzcGFjZSBoYXMgYmVjb21lIGF2YWlsYWJsZS4KPiAKPiBUaGUgaHlwZXJjYWxsIG9wIHBvcHVs
YXRlcyBhIHN1cHBsaWVkIGRhdGEgc3RydWN0dXJlIHdpdGggaW5mb3JtYXRpb24gYWJvdXQKPiBy
aW5nIHN0YXRlIGFuZCBpZiBpbnN1ZmZpY2llbnQgc3BhY2UgaXMgY3VycmVudGx5IGF2YWlsYWJs
ZSBpbiBhIGdpdmVuIHJpbmcsCj4gdGhlIGh5cGVydmlzb3Igd2lsbCByZWNvcmQgdGhlIGRvbWFp
bidzIGV4cHJlc3NlZCBpbnRlcmVzdCBhbmQgbm90aWZ5IGl0Cj4gd2hlbiBpdCBvYnNlcnZlcyB0
aGF0IHNwYWNlIGhhcyBiZWNvbWUgYXZhaWxhYmxlLgo+IAo+IENoZWNrcyBmb3IgZnJlZSBzcGFj
ZSBvY2N1ciB3aGVuIHRoaXMgbm90aWZ5IG9wIGlzIGludm9rZWQsIHNvIGl0IG1heSBiZQo+IGlu
dGVudGlvbmFsbHkgaW52b2tlZCB3aXRoIG5vIGRhdGEgc3RydWN0dXJlIHRvIHBvcHVsYXRlCj4g
KGllLiBhIE5VTEwgYXJndW1lbnQpIHRvIHRyaWdnZXIgc3VjaCBhIGNoZWNrIGFuZCBjb25zZXF1
ZW50IG5vdGlmaWNhdGlvbnMuCj4gCj4gTGltaXQgdGhlIG1heGltdW0gbnVtYmVyIG9mIG5vdGlm
eSByZXF1ZXN0cyBpbiBhIHNpbmdsZSBvcGVyYXRpb24gdG8gYQo+IHNpbXBsZSBmaXhlZCBsaW1p
dCBvZiAyNTYuCj4gCj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoZXIgQ2xhcmsgPGNocmlzdG9w
aGVyLmNsYXJrNkBiYWVzeXN0ZW1zLmNvbT4KPiBUZXN0ZWQtYnk6IENocmlzIFBhdHRlcnNvbiA8
cGF0dGVyc29uY0BhaW5mb3NlYy5jb20+CgpSZXZpZXdlZC1ieTogUm9nZXIgUGF1IE1vbm7DqSA8
cm9nZXIucGF1QGNpdHJpeC5jb20+CgpEZXNwaXRlIHRoZSB1c2FnZSBvZiBsaXN0X2Zvcl9lYWNo
X2VudHJ5X3NhZmUgaW5zdGVhZCBvZgpsaXN0X2ZpcnN0X2VudHJ5X29yX251bGwuCgo+ICtzdGF0
aWMgdm9pZAo+ICtwZW5kaW5nX25vdGlmeShzdHJ1Y3QgbGlzdF9oZWFkICp0b19ub3RpZnkpCj4g
K3sKPiArICAgIHN0cnVjdCBwZW5kaW5nX2VudCAqZW50LCAqbmV4dDsKPiArCj4gKyAgICBBU1NF
UlQoTE9DS0lOR19SZWFkX0wxKTsKPiArCj4gKyAgICAvKiBTZW5kaW5nIHNpZ25hbHMgZm9yIGFs
bCBlbnRzIGluIHRoaXMgbGlzdCwgZHJhaW5pbmcgdW50aWwgaXQgaXMgZW1wdHkuICovCj4gKyAg
ICBsaXN0X2Zvcl9lYWNoX2VudHJ5X3NhZmUoZW50LCBuZXh0LCB0b19ub3RpZnksIG5vZGUpCgps
aXN0X2ZpcnN0X2VudHJ5X29yX251bGwgd291bGQgYmUgbW9yZSBzdWl0YWJsZSBoZXJlLgoKUm9n
ZXIuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
