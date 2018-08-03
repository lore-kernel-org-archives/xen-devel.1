From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] qemu-trad: stop using the default IOREQ
 server
Date: Fri, 3 Aug 2018 14:23:31 +0100
Message-ID: <4d4ad0ba-5bc3-8c7a-c394-3016b09cadf7@citrix.com>
References: <20180803132029.33536-1-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=shfp=ks=citrix.com=prvs=746ef734c=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1fla3K-0001ex-6N
 for xen-devel@lists.xenproject.org; Fri, 03 Aug 2018 13:23:34 +0000
In-Reply-To: <20180803132029.33536-1-paul.durrant@citrix.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <paul.durrant@citrix.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Ian Jackson <ian.jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDMvMDgvMTggMTQ6MjAsIFBhdWwgRHVycmFudCB3cm90ZToKPiBCZWNhdXNlIHFlbXUtdHJh
ZCBpcyB1c2luZyB0aGUgbGVnYWN5IEhWTSBwYXJhbSBtZWNoYW5pc20gb2YgaG9va2luZyBpbnRv
Cj4gWGVuLCBpdCBtZWFucyB0aGF0IFhlbiBoYXMgdG8gbWFpbnRhaW4gdGhlIG5vdGlvbiBvZiBh
ICdkZWZhdWx0JyBJT1JFUQo+IHNlcnZlciB3aGljaCBpcyB3aGVyZSBhbGwgSS9PIGdvZXMgaWYg
bm8gb3RoZXIgZGV2aWNlIG1vZGVsIGNsYWltcyBpdC4KPiBNYWludGFpbmluZyB0aGlzIGNvZGUg
aW4gWGVuIGhhcyBhIGNvc3QgYW5kIGl0IHdvdWxkIGJlIGdvb2QgaWYgdGhlIHByb2plY3QKPiBu
byBsb25nZXIgaGFkIHRvIHBheSBpdC4KPgo+IFRoaXMgcGF0Y2ggbWFrZXMgdGhlIG5lY2Vzc2Fy
eSBtaW5pbWFsIGNoYW5nZXMgdG8gdGhlIHFlbXUtdHJhZCB0byB1c2UgdGhlCj4gSU9SRVEgc2Vy
dmVyIEFQSSB0byBob29rIGludG8gWGVuLiBUaGlzIG1lYW5zIHRoZSBkZWZhdWx0IElPUkVRIHNl
cnZlcgo+IHdpbGwgbm8gbG9uZ2VyIGJlIGluIHVzZSBhbmQgdGh1cyBpdCBubyBsb25nZXIgbmVl
ZHMgdG8gYmUgbWFpbnRhaW5lZC4KPgo+IFNpZ25lZC1vZmYtYnk6IFBhdWwgRHVycmFudCA8cGF1
bC5kdXJyYW50QGNpdHJpeC5jb20+CgpBY2tlZC1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNv
b3BlcjNAY2l0cml4LmNvbT4KCldoaWxlIHFlbXUtdHJhZCBpcyBzdXBwb3NlZCB0byBiZSBpbiBk
ZWVwLWZyZWV6ZSwgdGhpcyBzbWFsbCBjaGFuZ2Ugd2lsbAphbGxvdyBmb3Igc3Vic3RhbnRpYWwg
Y2xlYW51cCBhbmQgc2ltcGxpZmljYXRpb24gaW4gdGhlIGh5cGVydmlzb3IuCgp+QW5kcmV3Cgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
