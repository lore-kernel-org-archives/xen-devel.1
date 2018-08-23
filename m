From: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
Subject: Re: [PATCH v1 6/6] xsm: add tee access policy support
Date: Thu, 23 Aug 2018 16:32:00 +0300
Message-ID: <8e5d910b-f996-94e0-2fdc-ae435690c920@epam.com>
References: <BA190A75E8413C49BB9E1D2B85D118114CE48725@MSMR-GH1-UEA01.corp.nsa.gov>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <BA190A75E8413C49BB9E1D2B85D118114CE48725@MSMR-GH1-UEA01.corp.nsa.gov>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: "dgdegra@tycho.nsa.gov" <dgdegra@tycho.nsa.gov>, "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

SGVsbG8gRGFuaWVsLAoKT24gMjMuMDguMTggMDE6NDQsIERlR3JhYWYsIERhbmllbCBHIHdyb3Rl
Ogo+PiBGcm9tOiBWb2xvZHlteXIgQmFiY2h1ayA8dm9sb2R5bXlyX2JhYmNodWtAZXBhbS5jb20+
Cj4+IFNlbnQ6IFdlZG5lc2RheSwgQXVndXN0IDIyLCAyMDE4IDEwOjEyIEFNCj4+Cj4+IEFzIHdl
IGRvbid0IHdhbnQgYW55IGd1ZXN0IHRvIGFjY2VzcyBsaW1pdGVkIHJlc291cmNlcyBvZiBURUUs
IHdlIG5lZWQgYSB3YXkgdG8gY29udHJvbCB3aG8gY2FuIHdvcmsgd2l0aCBpdC4KPj4KPj4gVGh1
cywgbmV3IGFjY2VzcyB2ZWN0b3IgY2xhc3MgInRlZSIgaXMgYWRkZWQgd2l0aCBvbmx5IG9ueSBv
cGVyYXRpb24gImNhbGwiIHNvIGZhci4gdGVlIGZyYW1ld29yayB1c2VzIHRoaXMgdG8gY2hlY2sg
aWYgZ3Vlc3QgaGFzIGEgcmlnaHQKPj4gdG8gd29yayB3aXRoIFRFRS4KPj4KPj4gQWxzbywgZXhh
bXBsZSBzZWN1cml0eSBjb250ZXh0IGRvbVVfd2l0aF90ZWVfdCB3YXMgYWRkZWQuCj4gQXJlIHlv
dSBwbGFubmluZyB0byBhZGQgbW9yZSBhY2Nlc3MgdmVjdG9ycyB0byB0aGlzIGNsYXNzIGluIHRo
ZSBmdXR1cmU/IE90aGVyd2lzZSwgaXQgcHJvYmFibHkgZG9lc24ndCBuZWVkIGl0cyBvd24gY2xh
c3MgLSBzaW5jZSB5b3UgdXNlIHhlbl90IGFzIHRoZSB0YXJnZXQsIHBsYWNpbmcgaXQgaW4gY2xh
c3MgeGVuL3hlbjIgaXMgcHJlZmVycmVkIChsaWtlIHRtZW0gYW5kIG90aGVycyBhcmUgbm93KS4K
PiAKCkF0IHRoZSBtb21lbnQgSSBjYW4ndCBpbWFnaW5lIGFueSBvdGhlciB2ZWN0b3JzLiBSZWFz
b24gSSBjcmVhdGVkIGEgbmV3IApjbGFzcyBpcyB0aGF0IGl0IHNlZW1lZCB3cm9uZyB0byBtZSB0
byB1c2UgZ2VuZXJpYyB4ZW4veGVuMiBjbGFzcywgCmJlY2F1c2UsIHN0cmljdGx5IHNwZWFraW5n
LCB0aGlzIHZlY3RvciBoYXZlIG5vdGhpbmcgdG8gZG8gd2l0aCB4ZW4gY29yZS4KCkJ1dCwgaWYg
eW91IHRoaW5rIHRoYXQgaXQgaXMgYXBwcm9wcmlhdGUgdG8gaGF2ZSB2ZWN0b3IgInRlZV9jYWxs
IiBpbiAKeGVuMiBjbGFzcywgdGhlbiBJIGNhbiBtb3ZlIGl0IHRoZXJlLgoKLS0gClZvbG9keW15
ciBCYWJjaHVrCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
