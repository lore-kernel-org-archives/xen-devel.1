From: Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH] xen-mapcache: use MAP_FIXED flag so the
 mmap address hint is always honored
Date: Fri, 15 Mar 2019 18:14:09 +0000
Message-ID: <20190315181409.GF11621@perard.uk.xensource.com>
References: <20190315085847.31245-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=bsd1=RS=citrix.com=prvs=970908fcc=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1h4rLe-0001DH-JJ
 for xen-devel@lists.xenproject.org; Fri, 15 Mar 2019 18:14:26 +0000
Content-Disposition: inline
In-Reply-To: <20190315085847.31245-1-roger.pau@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Igor Druzhinin <igor.druzhinin@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Eduardo Habkost <ehabkost@redhat.com>, "Michael
 S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org, Paul Durrant <paul.durrant@citrix.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, xen-devel@lists.xenproject.org, Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBNYXIgMTUsIDIwMTkgYXQgMDk6NTg6NDdBTSArMDEwMCwgUm9nZXIgUGF1IE1vbm5l
IHdyb3RlOgo+IE9yIGlmIGl0J3Mgbm90IHBvc3NpYmxlIHRvIGhvbm9yIHRoZSBoaW50ZWQgYWRk
cmVzcyBhbiBlcnJvciBpcyByZXR1cm5lZAo+IGluc3RlYWQuIFRoaXMgbWFrZXMgaXQgZWFzaWVy
IHRvIHNwb3QgdGhlIGFjdHVhbCBmYWlsdXJlLCBpbnN0ZWFkIG9mCj4gZmFpbGluZyBsYXRlciBv
biB3aGVuIHRoZSBjYWxsZXIgb2YgeGVuX3JlbWFwX2J1Y2tldCByZWFsaXplcyB0aGUKPiBtYXBw
aW5nIGhhcyBub3QgYmVlbiBjcmVhdGVkIGF0IHRoZSByZXF1ZXN0ZWQgYWRkcmVzcy4KPiAKPiBB
bHNvIG5vdGUgdGhhdCBhdCBsZWFzdCBvbiBGcmVlQlNEIHVzaW5nIE1BUF9GSVhFRCB3aWxsIGNh
dXNlIG1tYXAgdG8KPiB0cnkgaGFyZGVyIHRvIGhvbm9yIHRoZSBwYXNzZWQgYWRkcmVzcy4KPiAK
PiBTaWduZWQtb2ZmLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4K
ClRoZSBwYXRjaCBsb29rcyBmaW5lLCBhbmQgTUFQX0ZJWEVEIHNlZW1zIHRvIGJlIHRoZSBleHBl
Y3RlZCBiZWhhdmlvcgpldmVuIG9uIExpbnV4LgoKQWNrZWQtYnk6IEFudGhvbnkgUEVSQVJEIDxh
bnRob255LnBlcmFyZEBjaXRyaXguY29tPgoKPiBkaWZmIC0tZ2l0IGEvaHcvaTM4Ni94ZW4veGVu
LW1hcGNhY2hlLmMgYi9ody9pMzg2L3hlbi94ZW4tbWFwY2FjaGUuYwo+IEBAIC0xODUsOCArMTg1
LDE0IEBAIHN0YXRpYyB2b2lkIHhlbl9yZW1hcF9idWNrZXQoTWFwQ2FjaGVFbnRyeSAqZW50cnks
Cj4gICAgICB9Cj4gIAo+ICAgICAgaWYgKCFkdW1teSkgewo+ICsgICAgICAgIC8qCj4gKyAgICAg
ICAgICogSWYgdGhlIGNhbGxlciBoYXMgcmVxdWVzdGVkIHRoZSBtYXBwaW5nIGF0IGEgc3BlY2lm
aWMgYWRkcmVzcyB1c2UKPiArICAgICAgICAgKiBNQVBfRklYRUQgdG8gbWFrZSBzdXJlIGl0J3Mg
aG9ub3JlZC4gTm90ZSB0aGF0IHdpdGggTUFQX0ZJWEVEIGF0Cj4gKyAgICAgICAgICogbGVhc3Qg
RnJlZUJTRCB3aWxsIHRyeSBoYXJkZXIgdG8gaG9ub3IgdGhlIHBhc3NlZCBhZGRyZXNzLgo+ICsg
ICAgICAgICAqLwoKSSB3b25kZXIgaWYgdGhlIG5vdGUgYWJvdXQgRnJlZUJTRCBpcyBhY3R1YWxs
eSB1c2VmdWwgaGVyZS4gRXZlbiBMaW51eAptYXkgbWFwIGF0IGEgZGlmZmVyZW50IGFkZHJlc3Mg
d2l0aG91dCBNQVBfRklYRUQsIGlmIEkgcmVhZCB0aGUgbWFuIHBhZ2UKY29ycmVjdGx5LiBEbyB5
b3UgbWluZCBpZiBpdCBpcyByZW1vdmVkPwoKPiAgICAgICAgICB2YWRkcl9iYXNlID0geGVuZm9y
ZWlnbm1lbW9yeV9tYXAyKHhlbl9mbWVtLCB4ZW5fZG9taWQsIHZhZGRyLAo+IC0gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgUFJPVF9SRUFEIHwgUFJPVF9XUklURSwg
MCwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFBST1RfUkVB
RCB8IFBST1RfV1JJVEUsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICB2YWRkciA/IE1BUF9GSVhFRCA6IDAsCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBuYl9wZm4sIHBmbnMsIGVycik7CgpUaGFua3MsCgotLSAKQW50aG9u
eSBQRVJBUkQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
