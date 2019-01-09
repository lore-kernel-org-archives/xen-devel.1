From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v3 04/15] argo: init, destroy and soft-reset,
 with enable command line opt
Date: Wed, 09 Jan 2019 02:35:07 -0700
Message-ID: <5C35C04B020000780020BB8D@prv1-mh.provo.novell.com>
References: <1546846968-7372-1-git-send-email-christopher.w.clark@gmail.com>
 <1546846968-7372-5-git-send-email-christopher.w.clark@gmail.com>
 <CAKf6xpvXBGUwFAjvwromG737Bg-_MB7rWBB=Oj7q2zHgaiF5mg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=7QHe=PR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ghAGV-0006zB-I4
 for xen-devel@lists.xenproject.org; Wed, 09 Jan 2019 09:35:11 +0000
In-Reply-To: <CAKf6xpvXBGUwFAjvwromG737Bg-_MB7rWBB=Oj7q2zHgaiF5mg@mail.gmail.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jason Andryuk <jandryuk@gmail.com>
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, ross.philipson@gmail.com, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Daniel Smith <dpsmith@apertussolutions.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Christopher Clark <christopher.w.clark@gmail.com>, Rich Persaud <persaur@gmail.com>, James McKenzie <james@bromium.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, eric chanudet <eric.chanudet@gmail.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA4LjAxLjE5IGF0IDIzOjU0LCA8amFuZHJ5dWtAZ21haWwuY29tPiB3cm90ZToKCkZp
cnN0IG9mIGFsbCAtIHBsZWFzZSB0cmltIHlvdXIgcmVwbGllcy4KCj4gT24gTW9uLCBKYW4gNywg
MjAxOSBhdCAyOjQzIEFNIENocmlzdG9waGVyIENsYXJrIDxjaHJpc3RvcGhlci53LmNsYXJrQGdt
YWlsLmNvbT4gd3JvdGU6Cj4+IC0tLSBhL2RvY3MvbWlzYy94ZW4tY29tbWFuZC1saW5lLnBhbmRv
Ywo+PiArKysgYi9kb2NzL21pc2MveGVuLWNvbW1hbmQtbGluZS5wYW5kb2MKPj4gQEAgLTE4Miw2
ICsxODIsMTcgQEAgUGVybWl0IFhlbiB0byB1c2UgIkFsd2F5cyBSdW5uaW5nIEFQSUMgVGltZXIi
IHN1cHBvcnQgb24gY29tcGF0aWJsZSBoYXJkd2FyZQo+PiAgaW4gY29tYmluYXRpb24gd2l0aCBj
cHVpZGxlLiAgVGhpcyBvcHRpb24gaXMgb25seSBleHBlY3RlZCB0byBiZSB1c2VmdWwgZm9yCj4+
ICBkZXZlbG9wZXJzIHdpc2hpbmcgWGVuIHRvIGZhbGwgYmFjayB0byBvbGRlciB0aW1pbmcgbWV0
aG9kcyBvbiBuZXdlciBoYXJkd2FyZS4KPj4KPj4gKyMjIyBhcmdvCj4+ICs+IGA9IDxib29sZWFu
PmAKPj4gKwo+PiArPiBEZWZhdWx0OiBgZmFsc2VgCj4+ICsKPj4gK0VuYWJsZSB0aGUgQXJnbyBo
eXBlcnZpc29yLW1lZGlhdGVkIGludGVyZG9tYWluIGNvbW11bmljYXRpb24gbWVjaGFuaXNtLgo+
PiArCj4+ICtUaGlzIGFsbG93cyBkb21haW5zIGFjY2VzcyB0byB0aGUgQXJnbyBoeXBlcmNhbGws
IHdoaWNoIHN1cHBvcnRzIHJlZ2lzdHJhdGlvbgo+PiArb2YgbWVtb3J5IHJpbmdzIHdpdGggdGhl
IGh5cGVydmlzb3IgdG8gcmVjZWl2ZSBtZXNzYWdlcywgc2VuZGluZyBtZXNzYWdlcyB0bwo+PiAr
b3RoZXIgZG9tYWlucyBieSBoeXBlcmNhbGwgYW5kIHF1ZXJ5aW5nIHRoZSByaW5nIHN0YXR1cyBv
ZiBvdGhlciBkb21haW5zLgo+PiArCj4gCj4gRG8gd2Ugd2FudCB0byBzYXkgaXQncyBvbmx5IGF2
YWlsYWJsZSB3aGVuIFhlbiBpcyBjb21waWxlZCB3aXRoIENPTkZJR19BUkdPPwoKV2UgZG9uJ3Qg
ZG8gc28gZWxzZXdoZXJlLCBzbyBJJ20gd2l0aCBDaHJpc3RvcGhlci4KCj4+ICsgICAgICovCj4+
ICsgICAgc3RydWN0IGFyZ29fcmluZ19pbmZvICpyaW5nX2luZm87Cj4+ICsgICAgLyogZG9tYWlu
IHRvIGJlIG5vdGlmaWVkIHdoZW4gc3BhY2UgaXMgYXZhaWxhYmxlICovCj4+ICsgICAgZG9taWRf
dCBkb21haW5faWQ7Cj4+ICsgICAgdWludDE2X3QgcGFkOwo+IAo+IENhbiB3ZSBvcmRlciBkb21h
aW5faWQgYWZ0ZXIgbGVuIGFuZCBkcm9wIHRoZSBwYWQ/CgpUaGF0IHdvdWxkIHN0aWxsIGNhbGwg
Zm9yIGEgcGFkIGZpZWxkIC0gd2UgcHJlZmVyIHRvIGhhdmUgZXhwbGljaXQgcGFkZGluZywKYW5k
IGFsc28gdG8gY2hlY2sgaXQncyB6ZXJvLCB0aGUgbGF0dGVyIHRvIGFsbG93IGZvciBhc3NpZ25p
bmcgbWVhbmluZyB0bwp0aGUgZmllbGQgZG93biB0aGUgcm9hZC4KCkphbgoKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
