From: Juergen Gross <jgross@suse.com>
Subject: Re: [RFC PATCH v1 00/16] xen: sched: implement
 core-scheduling
Date: Fri, 12 Oct 2018 11:23:22 +0200
Message-ID: <ade01660-a6c1-340c-34e7-0d9e0b2ff51f@suse.com>
References: <153515305655.8598.6054293649487840735.stgit@Istar.fritz.box>
 <7553b02f-514d-d577-a4ae-3478036f8f62@suse.com>
 <3636eba03691a0331a6e82cb11a651fd41c475ec.camel@suse.com>
 <6ffe5f58-8aec-c349-e08b-58dc1d3d5469@suse.com>
 <8224a31a6fd968344499b52e4bc77d78576c1a8e.camel@suse.com>
 <60e809eb-1971-b467-9a56-c116c60445b2@suse.com>
 <d6956fbf7441ae3ced4a273c58b7126db1c6466c.camel@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=14it=my=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1gAtfK-00079H-4e
 for xen-devel@lists.xenproject.org; Fri, 12 Oct 2018 09:23:26 +0000
In-Reply-To: <d6956fbf7441ae3ced4a273c58b7126db1c6466c.camel@suse.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Dario Faggioli <dfaggioli@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Bhavesh Davda <bhavesh.davda@oracle.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTIvMTAvMjAxOCAxMToxNSwgRGFyaW8gRmFnZ2lvbGkgd3JvdGU6Cj4gT24gRnJpLCAyMDE4
LTEwLTEyIGF0IDEwOjM1ICswMjAwLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOgo+PiBPbiAxMi8xMC8y
MDE4IDA5OjQ5LCBEYXJpbyBGYWdnaW9saSB3cm90ZToKPj4+Cj4+PiBCdXQgaG93IGVhc3kgaXQg
aXMgdG8gb3B0IG91dCwgaWYgb25lIGRvZXNuJ3Qgd2FudCBpdD8gRS5nLiwgaW4gdGhlCj4+PiBj
b250ZXh0IG9mIEwxVEYsIHdoYXQgaWYgSSdtIG5vdCBhZmZlY3RlZCwgYW5kIGhlbmNlIGFtIG5v
dAo+Pj4gaW50ZXJlc3RlZAo+Pj4gaW4gY29yZS1zY2hlZHVsaW5nPyBXaGF0IGlmIEkgd2FudCBh
IGNwdXBvb2wgd2l0aCBjb3JlLXNjaGVkdWxpbmcKPj4+IGFuZAo+Pj4gb25lIHdpdGhvdXQ/Cj4+
Pgo+Pj4gSSBtYXkgYmUgd3JvbmcsIGJ1dCBvdXQgb2YgdGhlIHRvcCBvZiBteSBoZWFkLCBidXQg
aXQgc2VlbXMgdG8gbWUKPj4+IHRoYXQKPj4+IGRvaW5nIHRoaW5ncyBpbiBzY2hlZHVsZS5jIG1h
a2VzIHRoaXMgYSBsb3QgaGFyZGVyLCBpZiBwb3NzaWJsZSBhdAo+Pj4gYWxsLgo+Pgo+PiBXaHk/
IFRoaXMgd291bGQgYmUgYSBwZXItY3B1cG9vbCBzZXR0aW5nLCBzbyB0aGUgc2NoZWR1bGluZwo+
PiBncmFudWxhcml0eQo+PiB3b3VsZCBsaXZlIGluIHN0cnVjdCBzY2hlZHVsZXIuCj4+Cj4gTW1t
Li4uIGl0J3MgYWxyZWFkeSBzdGFydGluZyB0byBiZSBhIGJpdCBoYXJkIHRvIHJlYXNvbiwgd2l0
aG91dAo+IGxvb2tpbmcgYXQgYXQgbGVhc3QgYSBwcm90b3R5cGUgb2YgdGhlIGNvZGUuIDotLwo+
IAo+IEJ1dCwgYW55d2F5LCBpZiBJJ20gaW4gc2NoZWRfZGFyaW8uYywgYW5kIHNjaGVkdWxlLmMg
bWFrZXMgbWUgcmVhc29uIGluCj4gdGVybXMgb2YgdkNvcmVzLCBob3cgZG8gSSBkZWFsIHdpdGgg
c2luZ2xlIENQVXMgZm9yIGEgcGFydGljdWxhcgo+IGNwdXBvb2wgdGhhdCBkb2VzIG5vdCB3YW50
IGNvcmUtc2NoZWR1bGluZz8KCnNjaGVkX2RhcmlvLmMgd291bGQgb25seSBrbm93IG9mIHNjaGVk
dWxpbmcgZW50aXRpZXMuIE1hcHBpbmcgb2YgdmNwdXMKdG8gc2NoZWR1bGluZyBlbnRpdGllcyBp
cyBwYXJ0IG9mIHRoZSBpbmZyYXN0cnVjdHVyZS4KCnNjaGVkdWxlLmMgd291bGQgcmVjZWl2ZSB2
Y3B1IHN0YXRlIGNoYW5nZXMuIEluIGNhc2Ugc3VjaCBhIHZjcHUKc3RhdGUgY2hhbmdlIGxlYWRz
IHRvIGEgc2NoZWR1bGluZyBlbnRpdHkgc3RhdGUgY2hhbmdlIHRoZSByZWxhdGVkCnNjaGVkdWxl
ciBpcyBpbmZvcm1lZCBhYm91dCB0aGF0IHRvIGJlIGFibGUgdG8gcmVhY3QuCgpJbiBjYXNlIHRo
ZSBzY2hlZHVsaW5nIGVudGl0eSBpcyBhIHRocmVhZCAobm8gY29yZSBzY2hlZHVsaW5nKSBlYWNo
CnZjcHUgc3RhdGUgY2hhbmdlIHdpbGwgcmVzdWx0IGluIGEgc2NoZWR1bGluZyBlbnRpdHkgc3Rh
dGUgY2hhbmdlLApzbyBpdCB3aWxsIGJlIGFzIHRvZGF5LgoKCkp1ZXJnZW4KCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
