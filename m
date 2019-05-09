From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH RFC V2 02/45] xen/sched: use new sched_item
 instead of vcpu in scheduler interfaces
Date: Thu, 9 May 2019 07:36:10 +0200
Message-ID: <33e39539-2087-3bbb-cc46-a8d309c9d8d2@suse.com>
References: <20190506065644.7415-1-jgross@suse.com>
 <20190506065644.7415-3-jgross@suse.com>
 <06d4c89b-202e-bea4-23f9-c41dd8d17d52@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=8hXi=TJ=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hObj6-0007eV-5V
 for xen-devel@lists.xenproject.org; Thu, 09 May 2019 05:36:16 +0000
In-Reply-To: <06d4c89b-202e-bea4-23f9-c41dd8d17d52@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <george.dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Robert VanVossen <robert.vanvossen@dornerworks.com>, Dario Faggioli <dfaggioli@suse.com>, Julien Grall <julien.grall@arm.com>, Josh Whitehead <josh.whitehead@dornerworks.com>, Meng Xu <mengxu@cis.upenn.edu>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDgvMDUvMjAxOSAxODozNSwgR2VvcmdlIER1bmxhcCB3cm90ZToKPiBPbiA1LzYvMTkgNzo1
NiBBTSwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPj4gSW4gb3JkZXIgdG8gcHJlcGFyZSBjb3JlLSBh
bmQgc29ja2V0LXNjaGVkdWxpbmcgdXNlIGEgbmV3IHN0cnVjdAo+PiBzY2hlZF9pdGVtIGluc3Rl
YWQgb2Ygc3RydWN0IHZjcHUgZm9yIGludGVyZmFjZXMgb2YgdGhlIGRpZmZlcmVudAo+PiBzY2hl
ZHVsZXJzLgo+Pgo+PiBSZW5hbWUgdGhlIHBlci1zY2hlZHVsZXIgZnVuY3Rpb25zIGluc2VydF92
Y3B1IGFuZCByZW1vdmVfdmNwdSB0bwo+PiBpbnNlcnRfaXRlbSBhbmQgcmVtb3ZlX2l0ZW0gdG8g
cmVmbGVjdCB0aGUgY2hhbmdlIG9mIHRoZSBwYXJhbWV0ZXIuCj4+IEluIHRoZSBzY2hlZHVsZXJz
IHJlbmFtZSBsb2NhbCBmdW5jdGlvbnMgc3dpdGNoZWQgdG8gc2NoZWRfaXRlbSwgdG9vLgo+Pgo+
PiBGb3Igbm93IHRoaXMgbmV3IHN0cnVjdCB3aWxsIGNvbnRhaW4gYSB2Y3B1IHBvaW50ZXIgb25s
eSBhbmQgaXMKPj4gYWxsb2NhdGVkIG9uIHRoZSBzdGFjay4gVGhpcyB3aWxsIGJlIGNoYW5nZWQg
bGF0ZXIuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNv
bT4KPiAKPiBPeSwgSSByZWFsaXplIHRoaXMgY29tbWVudCBpcyBnb2luZyB0byBiZSBzb21ld2hh
dCBwYWluZnVsLCBidXQuLi4KCkkgaG9wZSBJIGRpZG4ndCBzY3JlYW0gb3V0IHRvbyBsb3VkLi4u
IDstKQoKPiAnaXRlbScgcmVhbGx5IHNlZW1zIGxpa2UgdGhlIHdyb25nIHdvcmQgaGVyZS4gIFRv
IG1lICdpdGVtJyBhbHdheXMgbWVhbnMKPiBvbmUgdGhpbmc7IHdoZXJlYXMgd2hhdCB5b3UncmUg
cGxhbm5pbmcgb24gZG9pbmcgaXMgZ3JvdXBpbmcgdG9nZXRoZXIKPiB2Y3B1cyB0byBzY2hlZHVs
ZSB0b2dldGhlcjsgd2hpY2ggd291bGQgbWVhbiAidW5pdCIgKGFzIGluLCBhIG1pbGl0YXJ5Cj4g
dW5pdCkuCj4gCj4gSSByZWFsaXplIGNoYW5naW5nIGl0IGhlcmUgcHJvYmFibHkgbWVhbnMgYWxz
byBjaGFuZ2luZyBpdCBpbiB0aGUgbmV4dAo+IDQzIHBhdGNoZXMgYXMgd2VsbC4KCk9ubHkgYWJv
dXQgMTAwMCBsaW5lcyB0byBjaGFuZ2UuCgpUQkgsIHJlcGxhY2luZyAiaXRlbSIgd2l0aCAidW5p
dCIgaXMgZG9hYmxlIHZpYSBzZWQuIERvaW5nIHRoZSBzYW1lIHdpdGgKKGFzIERhcmlvIHN1Z2dl
c3RlZCkgImVudGl0eSIgaXMgbW9yZSBwYWluZnVsLCBhcyBJIHdvdWxkIG5lZWQgdG8gY2hlY2sK
Y29kaW5nIHN0eWxlIChsaW5lIGxlbmd0aCwgaW5kZW50YXRpb24pIG1hbnVhbGx5IGFmdGVyd2Fy
ZHMuIFNvIERhcmlvLAp3b3VsZCB5b3UgYmUgZmluZSB3aXRoICJ1bml0Ij8gVGhpcyBtaWdodCBz
YXZlIG1lIHNvbWUgaG91cnMgb2Ygd29yay4KCgpKdWVyZ2VuCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
