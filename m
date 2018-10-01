From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] mm/page_alloc: always scrub pages given to
 the allocator
Date: Mon, 01 Oct 2018 09:15:51 -0600
Message-ID: <5BB23A2702000078001ED598@prv1-mh.provo.novell.com>
References: <20181001095818.22782-1-sergey.dyasli@citrix.com>
 <5BB2014B02000078001ED2B6@prv1-mh.provo.novell.com>
 <43064b50-6f49-a073-9219-5a0a031be93b@citrix.com>
 <5BB2234802000078001ED441@prv1-mh.provo.novell.com>
 <1e93bdeb94b84ce4840dd0370992e603f2bd1b26.camel@citrix.com>
 <c34c8254-f5f3-de93-9d9b-b720563a3fbe@citrix.com>
 <c16044dcaac3b6a95a4fd91dd129d6311cdedc5f.camel@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <c16044dcaac3b6a95a4fd91dd129d6311cdedc5f.camel@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Sergey Dyasli <sergey.dyasli@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, george.dunlap@citrix.com, xen-devel@lists.xen.org, Julien Grall <julien.grall@arm.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDAxLjEwLjE4IGF0IDE2OjI4LCA8c2VyZ2V5LmR5YXNsaUBjaXRyaXguY29tPiB3cm90
ZToKPiBPbiBNb24sIDIwMTgtMTAtMDEgYXQgMTQ6NTQgKzAxMDAsIEdlb3JnZSBEdW5sYXAgd3Jv
dGU6Cj4+IFJpZ2h0LCB0aGUgd2hvbGUgcG9pbnQgb2YgaWRsZSBsb29wIHNjcnViYmluZyBpcyB0
aGF0IHlvdSAqZG9uJ3QqCj4+IHN5bmNyb25vdXNseSB3YWl0IGZvciAqYWxsKiB0aGUgbWVtb3J5
IHRvIGZpbmlzaCBzY3J1YmJpbmcgYmVmb3JlIHlvdQo+PiBjYW4gdXNlIHBhcnQgb2YgaXQuICBT
byB3aHkgaXMgdGhpcyBhbiBpc3N1ZSBmb3IgeW91IGd1eXMgLS0gd2hhdAo+PiBjb25jcmV0ZSBw
cm9ibGVtIGRpZCBpdCBjYXVzZSwgdGhhdCB0aGUgZnVsbCBhbW91bnQgb2YgbWVtb3J5IHRvb2sg
NDBzCj4+IHRvIGZpbmlzaCBzY3J1YmJpbmcgcmF0aGVyIHRoYW4gb25seSA4cz8KPiAKPiBUaGVy
ZSBpcyBubyBpc3N1ZSBhdCB0aGUgbW9tZW50LiBVc2luZyBpZGxlIGxvb3AgdG8gc2NydWIgYWxs
IHRoZSBtZW1vcnkKPiBpcyBqdXN0IG5vdCB2aWFibGU6IGl0IGRvZXNuJ3Qgc2NhbGUuIEhvdyBs
b25nIGRvZXMgaXQgY3VycmVudGx5IHRha2UKPiB0byBib290c2NydWIgYSBtdWx0aS1UYiBzeXN0
ZW0/IElmIGl0IHRha2VzIGEgZmV3IG1pbnV0ZXMgdGhlbiBJIGZlYXIKPiB0aGF0IGl0IG1pZ2h0
IHRha2UgYW4gaG91ciB0byBpZGxlLXNjcnViIGl0LgoKQnV0IHRoYXQncyBmaW5lLCBhdCBsZWFz
dCBpbiB0aGVvcnksIGFzIGxvbmcgYXMgbm8gc2NydWJiaW5nIHdpbGwgYmUKc2tpcHBlZCB3aGVu
IGl0IHdhcyBhY3R1YWxseSBuZWVkZWQuIFRoZSBzeXN0ZW0gd2lsbCBiZSBzbGlnaHRseQptb3Jl
IGJ1c3kgdW50aWwgZG9uZSB3aXRoIHRoZSBzY3J1YmJpbmcsIGJ1dCB0aGF0J3MgZXhhY3RseSB0
aGUKZXhwZWN0ZWQgcHJpY2UgdG8gcGF5IGZvciB0aGUgY3V0IGRvd24gb24gYm9vdCB0aW1lLgoK
SmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
