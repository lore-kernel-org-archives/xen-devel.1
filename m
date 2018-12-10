From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] x86/hvm/viridian: stop open coding updates
 to APIC registers
Date: Mon, 10 Dec 2018 08:16:17 -0700
Message-ID: <5C0E83410200007800204C0C@prv1-mh.provo.novell.com>
References: <20181207175008.2146-1-paul.durrant@citrix.com>
 <5C0E6DBA0200007800204ADE@prv1-mh.provo.novell.com>
 <630ac633c6c94148956e49b7ffabfa8c@AMSPEX02CL03.citrite.net>
 <43f2e8136740428abb9607a3b8b16f00@AMSPEX02CL03.citrite.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=lbjb=OT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gWNIF-0005wh-22
 for xen-devel@lists.xenproject.org; Mon, 10 Dec 2018 15:16:23 +0000
In-Reply-To: <43f2e8136740428abb9607a3b8b16f00@AMSPEX02CL03.citrite.net>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <paul.durrant@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDEwLjEyLjE4IGF0IDE1OjU3LCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+IHdyb3Rl
Ogo+PiBGcm9tOiBQYXVsIER1cnJhbnQKPj4gU2VudDogMTAgRGVjZW1iZXIgMjAxOCAxNDo1Nwo+
PiAKPj4gPiBGcm9tOiBKYW4gQmV1bGljaCBbbWFpbHRvOkpCZXVsaWNoQHN1c2UuY29tXQo+PiA+
IFNlbnQ6IDEwIERlY2VtYmVyIDIwMTggMTM6NDQKPj4gPgo+PiA+ID4+PiBPbiAwNy4xMi4xOCBh
dCAxODo1MCwgPHBhdWwuZHVycmFudEBjaXRyaXguY29tPiB3cm90ZToKPj4gPiA+IFRoZSBjb2Rl
IGluIHZpcmlkaWFuX3N5bmljX3dybXNyKCkgZHVwbGljYXRlcyBsb2dpYyBpbgo+PiA+IHZsYXBp
Y19yZWdfd3JpdGUoKQo+PiA+ID4gdG8gdXBkYXRlIHRoZSBJQ1IsIElDUjIgYW5kIFRBU0tQUkkg
cmVnaXN0ZXJzLiBJbnN0ZWFkIG9mIGRvaW5nIHRoaXMsCj4+ID4gPiBtYWtlIHZsYXBpY19yZWdf
d3JpdGUoKSBub24tc3RhdGljIGFuZCBjYWxsIGl0Lgo+PiA+Cj4+ID4gVGhlcmUncyBhIHNpZGUg
ZWZmZWN0IGZyb20gdGhpcyBjaGFuZ2UsIHdoaWNoIEkgdGhpbmsgc2hvdWxkIGJlIGNhbGxlZAo+
PiA+IG91dCBzaW5jZSBwZXJoYXBzIGl0J3MgYWN0dWFsbHkgYSAobWlub3IpIGJ1ZyBmaXg6IHZs
YXBpY19yZWdfd3JpdGUoKQo+PiA+IGNsZWFycyBvdXQgdmxhcGljLT5sb2FkZWQsIHdoaWNoIHRo
ZSBvcGVuIGNvZGVkIFZpcmlkaWFuIGNvZGUgZGlkbid0Cj4+ID4gZG8uCj4+ID4KPj4gCj4+IFll
cywgdGhhdCB3YXMgYW4gYW5vbWFseSBhbmQgZGlkIGxvb2sgd3JvbmcuCj4+IAo+PiA+IElmIGl0
IHdhc24ndCBmb3IgdGhpcywgSSB3b3VsZCBoYXZlIGJlZW4gdW5jZXJ0YWluIHdoZXRoZXIgZXhw
b3NpbmcgYQo+PiA+IGZ1bmN0aW9uIHRoYXQgcmVhbGx5IHdhcyBtZWFudCB0byBiZSB2bGFwaWMu
Yy1pbnRlcm5hbCBpcyBhIGdvb2QgaWRlYS4KPj4gPgo+PiAKPj4gVW5mb3J0dW5hdGVseSB0aGUg
d2F5IHRoYXQgTWljcm9zb2Z0IHNwZWNpZnkgdGhlIFN5bklDIChhcyBhICJzdXBlcnNldCBvZgo+
PiB0aGUgbG9jYWwgQVBJQyIpIG1lYW5zIHRoYXQgdGhlIGNvZGUgZG9lcyBuZWVkIHRvIGJlIGNs
b3NlbHkgdGllZC4gRG8geW91Cj4+IHdhbnQgbWUgdG8gZm9ybXVsYXRlIGEgY29tbWVudCBhbmQg
c3VibWl0IGEgdjIsIG9yIGFyZSB5b3UgaGFwcHkgdG8gYWRkIGEKPj4gY29tbWVudCBvbiBjb21t
aXQ/Cj4gCj4gT2gsIEkgc2VlIEFuZHJldyBhbHJlYWR5IGNvbW1pdHRlZCBpdC4KClJpZ2h0LCBh
bmQgaWYgYW55dGhpbmcgaXQgd291bGQgaGF2ZSBiZWVuIGFuIGFkZGl0aW9uIHRvIHRoZQpkZXNj
cmlwdGlvbiwgc28gdGhlcmUncyBubyBwb2ludCBzdWJtaXR0aW5nIGFueSBpbmNyZW1lbnRhbApw
YXRjaC4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
