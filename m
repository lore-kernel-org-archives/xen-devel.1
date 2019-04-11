From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH RFC 00/49] xen: add core scheduling support
Date: Thu, 11 Apr 2019 09:16:40 +0200
Message-ID: <f3631a2a-f818-c940-8cec-3d2ace741158@suse.com>
References: <20190329150934.17694-1-jgross@suse.com>
 <8f88c0017bcd6bace30e485547efe8e982469086.camel@suse.com>
 <59657c28f62cf82860560efaece6d0bfb0983846.camel@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=4K+I=SN=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hETwz-00047M-LK
 for xen-devel@lists.xenproject.org; Thu, 11 Apr 2019 07:16:45 +0000
In-Reply-To: <59657c28f62cf82860560efaece6d0bfb0983846.camel@suse.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Dario Faggioli <dfaggioli@suse.com>, xen-devel@lists.xenproject.org
Cc: Kevin Tian <kevin.tian@intel.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <george.dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, Robert VanVossen <robert.vanvossen@dornerworks.com>, Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>, Josh Whitehead <josh.whitehead@dornerworks.com>, Meng Xu <mengxu@cis.upenn.edu>, Jan Beulich <jbeulich@suse.com>, Ian Jackson <ian.jackson@eu.citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTEvMDQvMjAxOSAwMjozNCwgRGFyaW8gRmFnZ2lvbGkgd3JvdGU6Cj4gT24gRnJpLCAyMDE5
LTAzLTI5IGF0IDE5OjE2ICswMTAwLCBEYXJpbyBGYWdnaW9saSB3cm90ZToKPj4gT24gRnJpLCAy
MDE5LTAzLTI5IGF0IDE2OjA4ICswMTAwLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOgo+Pj4gSSBoYXZl
IGRvbmUgc29tZSB2ZXJ5IGJhc2ljIHBlcmZvcm1hbmNlIHRlc3Rpbmc6IG9uIGEgNCBjcHUgc3lz
dGVtCj4+PiAoMiBjb3JlcyB3aXRoIDIgdGhyZWFkcyBlYWNoKSBJIGRpZCBhICJtYWtlIC1qIDQi
IGZvciBidWlsZGluZyB0aGUKPj4+IFhlbgo+Pj4gaHlwZXJ2aXNvci4gV2l0aCBUaGlzIHRlc3Qg
aGFzIGJlZW4gcnVuIG9uIGRvbTAsIG9uY2Ugd2l0aCBubyBvdGhlcgo+Pj4gZ3Vlc3QgYWN0aXZl
IGFuZCBvbmNlIHdpdGggYW5vdGhlciBndWVzdCB3aXRoIDQgdmNwdXMgcnVubmluZyB0aGUKPj4+
IHNhbWUKPj4+IHRlc3QuCj4+IEp1c3QgYXMgYW4gaGVhZHMgdXAgZm9yIHBlb3BsZSAoYXMgSnVl
cmdlbiBrbm93cyB0aGlzIGFscmVhZHkgOi1EKSwKPj4gSSdtCj4+IHBsYW5uaW5nIHRvIHJ1biBz
b21lIHBlcmZvcm1hbmNlIGV2YWx1YXRpb24gb2YgdGhpcyBwYXRjaGVzLgo+Pgo+PiBJJ3ZlIGdv
dCBhbiA4IENQVXMgc3lzdGVtICg0IGNvcmVzLCAyIHRocmVhZHMgZWFjaCwgbm8tTlVNQSkgYW5k
IGFuCj4+IDE2Cj4+IENQVXMgc3lzdGVtICgyIHNvY2tldHMvTlVNQSBub2RlcywgNCBjb3JlcyBl
YWNoLCAyIHRocmVhZHMgZWFjaCkgb24KPj4gd2hpY2ggSSBzaG91bGQgYmUgYWJsZSB0byBnZXQg
c29tZSBiZW5jaCBzdWl0ZSBydW5uaW5nIHJlbGF0aXZlbHkKPj4gZWFzeQo+PiBhbmQgKGhvcGVm
dWxseSkgcXVpY2suCj4+Cj4+IEknbSBwbGFubmluZyB0byBldmFsdWF0ZToKPj4gLSB2YW5pbGxh
IChpLmUuLCB3aXRob3V0IHRoaXMgc2VyaWVzKSwgU01UIGVuYWJsZWQgaW4gQklPUwo+PiAtIHZh
bmlsbGEgKGkuZS4sIHdpdGhvdXQgdGhpcyBzZXJpZXMpLCBTTVQgZGlzYWJsZWQgaW4gQklPUwo+
PiAtIHBhdGNoZWQgKGkuZS4sIHdpdGggdGhpcyBzZXJpZXMpLCBncmFudWxhcml0eT10aHJlYWQK
Pj4gLSBwYXRjaGVkIChpLmUuLCB3aXRoIHRoaXMgc2VyaWVzKSwgZ3JhbnVsYXJpdHk9Y29yZQo+
Pgo+PiBJJ2xsIGRvIHN0YXJ0IHdpdGggbm8gb3ZlcmNvbW1pdG1lbnQsIGFuZCB0aGVuIG1vdmUg
dG8gMngKPj4gb3ZlcmNvbW1pdG1lbnQgKGFzIHlvdSBkaWQgYWJvdmUpLgo+Pgo+IEkndmUgZ290
IHRoZSBmaXJzdCBzZXQgb2YgcmVzdWx0cy4gSXQncyBmZXdlciB0aGFuIEkgd2FudGVkL2V4cGVj
dGVkIHRvCj4gaGF2ZSBhdCB0aGlzIHBvaW50IGluIHRpbWUsIGJ1dCBzdGlsbC4uLgo+IAo+IEFs
c28sIGl0J3MgUGhvcm9uaXggYWdhaW4uIEkgZG9uJ3QgZXNwZWNpYWxseSBsb3ZlIGl0LCBidXQg
SSdtIHN0aWxsCj4gd29ya2luZyBvbiBjb252aW5jaW5nIG91ciBvd24gaW50ZXJuYWwgYXV0b21h
dGVkIGJlbmNobWFya2luZyB0b29sCj4gKHdoaWNoIEkgbGlrZSBhIGxvdCBtb3JlIDotKSApIHRv
IGJlIGEgZ29vZCBmcmllbmQgb2YgWGVuLiA6LVAKCkkgdGhpbmsgdGhlIFBob3Jvbml4IHRlc3Rz
IGFzIHN1Y2ggYXJlIG5vdCB0aGF0IGJhZCwgaXRzIHRoZSB3YXkgdGhleQphcmUgdXNlZCBieSBQ
aG9yb25peCB3aGljaCBpcyBjb21wbGV0ZWx5IGlkaW90aWMuCgo+IEl0J3MgYSBub3QgdG9vIGJp
ZyBzZXQgb2YgdGVzdHMsIGRvbmUgaW4gdGhlIGZvbGxvd2luZyBjb25kaXRpb25zOgo+IC0gaGFy
ZHdhcmU6IEludGVsIFhlb24gRTU2MjA7IDIgTlVNQSBub2RlcywgNCBjb3JlcyBhbmQgMiB0aHJl
YWRzIGVhY2gKPiAtIHNsb3cgZGlzayAob2xkIHJvdGF0aW9uYWwgSEREKQo+IC0gYmVuY2htYXJr
cyBydW4gaW4gZG9tMAo+IC0gQ1BVLCBtZW1vcnkgYW5kIHNvbWUgZGlzayBJTyBiZW5jaG1hcmtz
Cj4gLSBhbGwgU3BlYyZNZWx0IG1pdGlnYXRpb25zIGRpc2FibGVkIGJvdGggYXQgWGVuIGFuZCBk
b20wIGtlcm5lbCBsZXZlbAo+IC0gY3B1ZnJlcSBnb3Zlcm5vciA9IHBlcmZvcm1hbmNlLCBtYXhf
Y3N0YXRlID0gQzEKPiAtICpub24qIGRlYnVnIGh5cGVydmlzb3IKPiAKPiBJbiBqdXN0IG9uZSBz
ZW50ZW5jZSwgd2hhdCBJJ2Qgc2F5IGlzICJTbyBmYXIgc28gZ29kIiA6LUQKPiAKPiBodHRwczov
L29wZW5iZW5jaG1hcmtpbmcub3JnL3Jlc3VsdC8xOTA0MTA1LVNQLTE5MDQxMDBEQTM4CgpUaGFu
a3MgZm9yIGRvaW5nIHRoYXQhCgoKSnVlcmdlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
