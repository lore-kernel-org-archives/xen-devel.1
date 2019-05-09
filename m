From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH RFC V2 02/45] xen/sched: use new sched_item
 instead of vcpu in scheduler interfaces
Date: Thu, 9 May 2019 07:59:20 +0200
Message-ID: <3276dcdd-c740-05f2-df89-df0c3e3d3432@suse.com>
References: <20190506065644.7415-1-jgross@suse.com>
 <20190506065644.7415-3-jgross@suse.com>
 <06d4c89b-202e-bea4-23f9-c41dd8d17d52@citrix.com>
 <33e39539-2087-3bbb-cc46-a8d309c9d8d2@suse.com>
 <54785fa3c24d14de6c00d343046711f25ea28700.camel@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=8hXi=TJ=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hOc5W-0000vs-6Y
 for xen-devel@lists.xenproject.org; Thu, 09 May 2019 05:59:26 +0000
In-Reply-To: <54785fa3c24d14de6c00d343046711f25ea28700.camel@suse.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Dario Faggioli <dfaggioli@suse.com>, George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <george.dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Robert VanVossen <robert.vanvossen@dornerworks.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Josh Whitehead <josh.whitehead@dornerworks.com>, Meng Xu <mengxu@cis.upenn.edu>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDkvMDUvMjAxOSAwNzo1NiwgRGFyaW8gRmFnZ2lvbGkgd3JvdGU6Cj4gT24gVGh1LCAyMDE5
LTA1LTA5IGF0IDA3OjM2ICswMjAwLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOgo+PiBPbiAwOC8wNS8y
MDE5IDE4OjM1LCBHZW9yZ2UgRHVubGFwIHdyb3RlOgo+Pj4gT24gNS82LzE5IDc6NTYgQU0sIEp1
ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+Pj4KPj4+ICdpdGVtJyByZWFsbHkgc2VlbXMgbGlrZSB0aGUg
d3Jvbmcgd29yZCBoZXJlLiAgVG8gbWUgJ2l0ZW0nIGFsd2F5cwo+Pj4gbWVhbnMKPj4+IG9uZSB0
aGluZzsgd2hlcmVhcyB3aGF0IHlvdSdyZSBwbGFubmluZyBvbiBkb2luZyBpcyBncm91cGluZwo+
Pj4gdG9nZXRoZXIKPj4+IHZjcHVzIHRvIHNjaGVkdWxlIHRvZ2V0aGVyOyB3aGljaCB3b3VsZCBt
ZWFuICJ1bml0IiAoYXMgaW4sIGEKPj4+IG1pbGl0YXJ5Cj4+PiB1bml0KS4KPj4+Cj4+PiBJIHJl
YWxpemUgY2hhbmdpbmcgaXQgaGVyZSBwcm9iYWJseSBtZWFucyBhbHNvIGNoYW5naW5nIGl0IGlu
IHRoZQo+Pj4gbmV4dAo+Pj4gNDMgcGF0Y2hlcyBhcyB3ZWxsLgo+Pgo+PiBPbmx5IGFib3V0IDEw
MDAgbGluZXMgdG8gY2hhbmdlLgo+Pgo+PiBUQkgsIHJlcGxhY2luZyAiaXRlbSIgd2l0aCAidW5p
dCIgaXMgZG9hYmxlIHZpYSBzZWQuIERvaW5nIHRoZSBzYW1lCj4+IHdpdGgKPj4gKGFzIERhcmlv
IHN1Z2dlc3RlZCkgImVudGl0eSIgaXMgbW9yZSBwYWluZnVsLCBhcyBJIHdvdWxkIG5lZWQgdG8K
Pj4gY2hlY2sKPj4gY29kaW5nIHN0eWxlIChsaW5lIGxlbmd0aCwgaW5kZW50YXRpb24pIG1hbnVh
bGx5IGFmdGVyd2FyZHMuIAo+Pgo+IEFoLCByaWdodCwgSSBkaWRuJ3Qgc3BvdCB0aGF0ICdpdGVt
JyBhbmQgJ3VuaXQnIGFyZSB0aGUgc2FtZSBsZW5ndGguCj4gTWFrZXMgc2Vuc2UuCj4gCj4+IFNv
IERhcmlvLAo+PiB3b3VsZCB5b3UgYmUgZmluZSB3aXRoICJ1bml0Ij8gVGhpcyBtaWdodCBzYXZl
IG1lIHNvbWUgaG91cnMgb2Ygd29yay4KPj4KPiBJIGd1ZXNzIEkgYW0sIHllcy4gSSBsaWtlIGl0
IG1vcmUgdGhhbiAnaXRlbScgdG9vIGFuZCwgYXMgbXVjaCBhcyBJCj4gbGlrZSAnZW50aXR5Jywg
SSBhZ3JlZSBpdCdzIG5vdCB3b3J0aCB0aGUgZXh0cmEgZWZmb3J0LgoKVGhhbmtzLiBTbyAidW5p
dCIgaXQgaXMgdGhlbi4KCgpKdWVyZ2VuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
