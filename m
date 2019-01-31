From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v7 04/15] argo: init, destroy and soft-reset,
 with enable command line opt
Date: Thu, 31 Jan 2019 08:13:27 -0700
Message-ID: <5C5310970200007800212D5A@prv1-mh.provo.novell.com>
References: <1548908900-1128-1-git-send-email-christopher.w.clark@gmail.com>
 <1548908900-1128-5-git-send-email-christopher.w.clark@gmail.com>
 <20190131144914.qfoyz2uu4prpkpbo@mac>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=qOm0=QH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gpE21-0006Qp-FN
 for xen-devel@lists.xenproject.org; Thu, 31 Jan 2019 15:13:33 +0000
In-Reply-To: <20190131144914.qfoyz2uu4prpkpbo@mac>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>, Christopher Clark <christopher.w.clark@gmail.com>
Cc: Juergen Gross <jgross@suse.com>, Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, ross.philipson@gmail.com, Jason Andryuk <jandryuk@gmail.com>, Daniel Smith <dpsmith@apertussolutions.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Rich Persaud <persaur@gmail.com>, James McKenzie <james@bromium.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, eric chanudet <eric.chanudet@gmail.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDMxLjAxLjE5IGF0IDE1OjQ5LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IE9uIFdlZCwgSmFuIDMwLCAyMDE5IGF0IDA4OjI4OjA5UE0gLTA4MDAsIENocmlzdG9waGVyIENs
YXJrIHdyb3RlOgo+PiArc3RhdGljIHN0cnVjdCBhcmdvX3JpbmdfaW5mbyAqCj4+ICtmaW5kX3Jp
bmdfaW5mbyhjb25zdCBzdHJ1Y3QgZG9tYWluICpkLCBjb25zdCBzdHJ1Y3QgYXJnb19yaW5nX2lk
ICppZCkKPj4gK3sKPj4gKyAgICBzdHJ1Y3QgYXJnb19yaW5nX2luZm8gKnJpbmdfaW5mbzsKPj4g
KyAgICBjb25zdCBzdHJ1Y3QgbGlzdF9oZWFkICpidWNrZXQ7Cj4+ICsKPj4gKyAgICBBU1NFUlQo
TE9DS0lOR19SZWFkX3JpbmdzX0wyKGQpKTsKPj4gKwo+PiArICAgIC8qIExpc3QgaXMgbm90IG1v
ZGlmaWVkIGhlcmUuIFNlYXJjaCBhbmQgcmV0dXJuIHRoZSBtYXRjaCBpZiBmb3VuZC4gKi8KPj4g
KyAgICBidWNrZXQgPSAmZC0+YXJnby0+cmluZ19oYXNoW2hhc2hfaW5kZXgoaWQpXTsKPj4gKwo+
PiArICAgIGxpc3RfZm9yX2VhY2hfZW50cnkocmluZ19pbmZvLCBidWNrZXQsIG5vZGUpCj4gCj4g
SSdtIG5vdCBzdXJlIHdoYXQncyB0aGUgcG9saWN5IHJlZ2FyZGluZyBsaXN0XyBtYWNyb3MsIHNo
b3VsZCBzcGFjZXMKPiBiZSBhZGRlZCBiZXR3ZWVuIHRoZSBwYXJlbnRoZXNlcz8KPiAKPiBsaXN0
X2Zvcl9lYWNoX2VudHJ5ICggcmluZ19pbmZvLCBidWNrZXQsIG5vZGUgKQo+IAo+IEkgZG9uJ3Qg
aGF2ZSBhIHN0cm9uZyBvcGluaW9uIGVpdGhlciB3YXkuCgpXZSB1c2UgYSBtaXgsIGJlY2F1c2Ug
aXQncyBub3QgcmVhbGx5IGNsZWFyIHdoZXRoZXIgdG8gY29uc2lkZXIgc3VjaAoia2luZC1vZi1r
ZXl3b3JkcyIuCgo+PiArc3RhdGljIHZvaWQKPj4gK3BlbmRpbmdfcmVtb3ZlX2FsbChjb25zdCBz
dHJ1Y3QgZG9tYWluICpkLCBzdHJ1Y3QgYXJnb19yaW5nX2luZm8gKnJpbmdfaW5mbykKPj4gK3sK
Pj4gKyAgICBzdHJ1Y3QgcGVuZGluZ19lbnQgKmVudCwgKm5leHQ7Cj4+ICsKPj4gKyAgICBBU1NF
UlQoTE9DS0lOR19MMyhkLCByaW5nX2luZm8pKTsKPj4gKwo+PiArICAgIC8qIERlbGV0ZSBhbGwg
cGVuZGluZyBub3RpZmljYXRpb25zIGZyb20gdGhpcyByaW5nJ3MgbGlzdC4gKi8KPj4gKyAgICBs
aXN0X2Zvcl9lYWNoX2VudHJ5X3NhZmUoZW50LCBuZXh0LCAmcmluZ19pbmZvLT5wZW5kaW5nLCBu
b2RlKQo+IAo+IGxpc3RfZmlyc3RfZW50cnlfb3JfbnVsbCBhbmQgeW91IGNhbiBnZXQgcmlkIG9m
IG5leHQuCgpXZWxsLCB0aGF0J3MgYSBzdWJzdGl0dXRpb24gSSB3b3VsZG4ndCBsaWtlIHRvIGRv
IHdoaWxlIGNvbW1pdHRpbmcsCmFzIGl0IG1lYW5zIGRvaW5nIGEgbGl0dGxlIG1vcmUgdGhhbiBh
IHNpbXBsZSB0ZXh0IHJlcGxhY2VtZW50LgoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
