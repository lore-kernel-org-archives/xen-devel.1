From: Nadav Amit <namit@vmware.com>
Subject: Re: xen: Can't insert balloon page into VM userspace
 (WAS Re: [linux-linus bisection] complete test-arm64-arm64-xl-xsm)
Date: Tue, 12 Mar 2019 17:25:28 +0000
Message-ID: <A3443EC8-2A35-47C5-9EB3-78763AF641B0__28932.1334262908$1552411613$gmane$org@vmware.com>
References: <E1h3Uiq-0002L6-Ij@osstest.test-lab.xenproject.org>
 <80211e70-5f54-9421-8e8f-2a4fc758ce39@arm.com>
 <46118631-61d4-adb6-6ffc-4e7c62ea3da9@arm.com>
 <20190312171421.GJ19508@bombadil.infradead.org>
 <28a72642-d0db-214c-2bf2-d1a6c6e03d92@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=VhJL=RP=vmware.com=namit@srs-us1.protection.inumbo.net>)
 id 1h3l9q-0007dV-Tb
 for xen-devel@lists.xenproject.org; Tue, 12 Mar 2019 17:25:43 +0000
In-Reply-To: <28a72642-d0db-214c-2bf2-d1a6c6e03d92@redhat.com>
Content-Language: en-US
Content-ID: <50EB2B33C821234E9E7264AB3F0F5A4C@namprd05.prod.outlook.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: David Hildenbrand <david@redhat.com>
Cc: Juergen Gross <jgross@suse.com>, "k.khlebnikov@samsung.com" <k.khlebnikov@samsung.com>, Stefano Stabellini <sstabellini@kernel.org>, Kees Cook <keescook@chromium.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Julien Freche <jfreche@vmware.com>, osstest service owner <osstest-admin@xenproject.org>, Matthew Wilcox <willy@infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>, Pv-drivers <Pv-drivers@vmware.com>, Julien Grall <julien.grall@arm.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>
List-Id: xen-devel@lists.xenproject.org

PiBPbiBNYXIgMTIsIDIwMTksIGF0IDEwOjIzIEFNLCBEYXZpZCBIaWxkZW5icmFuZCA8ZGF2aWRA
cmVkaGF0LmNvbT4gd3JvdGU6Cj4gCj4gT24gMTIuMDMuMTkgMTg6MTQsIE1hdHRoZXcgV2lsY294
IHdyb3RlOgo+PiBPbiBUdWUsIE1hciAxMiwgMjAxOSBhdCAwNTowNTozOVBNICswMDAwLCBKdWxp
ZW4gR3JhbGwgd3JvdGU6Cj4+PiBPbiAzLzEyLzE5IDM6NTkgUE0sIEp1bGllbiBHcmFsbCB3cm90
ZToKPj4+PiBJdCBsb29rcyBsaWtlIGFsbCB0aGUgYXJtIHRlc3QgZm9yIGxpbnVzIFsxXSBhbmQg
bmV4dCBbMl0gdHJlZQo+Pj4+IGFyZSBub3cgZmFpbGluZy4geDg2IHNlZW1zIHRvIGJlIG1vc3Rs
eSBvay4KPj4+PiAKPj4+PiBUaGUgYmlzZWN0b3IgZmluZ2VyZWQgdGhlIGZvbGxvd2luZyBjb21t
aXQ6Cj4+Pj4gCj4+Pj4gY29tbWl0IDBlZTkzMGU2Y2FmYTA0OGMxOTI1ODkzZDBjYTg5OTE4YjI4
MTRmMmMKPj4+PiBBdXRob3I6IE1hdHRoZXcgV2lsY294IDx3aWxseUBpbmZyYWRlYWQub3JnPgo+
Pj4+IERhdGU6ICAgVHVlIE1hciA1IDE1OjQ2OjA2IDIwMTkgLTA4MDAKPj4+PiAKPj4+PiAgICAg
bW0vbWVtb3J5LmM6IHByZXZlbnQgbWFwcGluZyB0eXBlZCBwYWdlcyB0byB1c2Vyc3BhY2UKPj4+
PiAgICAgUGFnZXMgd2hpY2ggdXNlIHBhZ2VfdHlwZSBtdXN0IG5ldmVyIGJlIG1hcHBlZCB0byB1
c2Vyc3BhY2UgYXMgaXQgd291bGQKPj4+PiAgICAgZGVzdHJveSB0aGVpciBwYWdlIHR5cGUuICBB
ZGQgYW4gZXhwbGljaXQgY2hlY2sgZm9yIHRoaXMgaW5zdGVhZCBvZgo+Pj4+ICAgICBhc3N1bWlu
ZyB0aGF0IGtlcm5lbCBkcml2ZXJzIGFsd2F5cyBnZXQgdGhpcyByaWdodC4KPj4gCj4+IE9oIGdv
b2QsIGl0IGZvdW5kIGEgcmVhbCBwcm9ibGVtLgo+PiAKPj4+IEl0IHR1cm5zIG91dCB0aGUgcHJv
YmxlbSBpcyBiZWNhdXNlIHRoZSBiYWxsb29uIGRyaXZlciB3aWxsIGNhbGwKPj4+IF9fU2V0UGFn
ZU9mZmxpbmUoKSBvbiBhbGxvY2F0ZWQgcGFnZS4gVGhlcmVmb3JlIHRoZSBwYWdlIGhhcyBhIHR5
cGUgYW5kCj4+PiB2bV9pbnNlcnRfcGFnZXMgd2lsbCBkZW55IHRoZSBpbnNlcnRpb24uCj4+PiAK
Pj4+IE15IGtub3dsZWRnZSBpcyBxdWl0ZSBsaW1pdGVkIGluIHRoaXMgYXJlYS4gU28gSSBhbSBu
b3Qgc3VyZSBob3cgd2UgY2FuCj4+PiBzb2x2ZSB0aGUgcHJvYmxlbS4KPj4+IAo+Pj4gSSB3b3Vs
ZCBhcHByZWNpYXRlIGlmIHNvbWVvbmUgY291bGQgcHJvdmlkZSBpbnB1dCBvZiB0byBmaXggdGhl
IG1hcHBpbmcuCj4+IAo+PiBJIGRvbid0IGtub3cgdGhlIGJhbGxvb24gZHJpdmVyLCBzbyBJIGRv
bid0IGtub3cgd2h5IGl0IHdhcyBkb2luZyB0aGlzLAo+PiBidXQgd2hhdCBpdCB3YXMgZG9pbmcg
d2FzIFdyb25nIGFuZCBoYXMgYmVlbiBzaW5jZSAyMDE0IHdpdGg6Cj4gCj4gSnVzdCB0byBjbGFy
aWZ5IG9uIHRoYXQgcG9pbnQsIFhFTiBiYWxsb29uIGRvZXMgbm90IHVzZSBiYWxsb29uCj4gY29t
cGFjdGlvbiBhcyBmYXIgYXMgSSBrbm93IChvbmx5IHZpcnRpby1iYWxsb29uIGFuZCBhcyBmYXIg
YXMgSSBrbm93Cj4gbm93IGFsc28gdm13YXJlIGJhbGxvb24pLiBCb3RoIG9mIHRoZW0gZG9uJ3Qg
bWFwIGFueSBzdWNoIHBhZ2VzIHRvIHVzZXIKPiBzcGFjZSwgc28gaXQgbmV2ZXIgd2FzIGFuZCBp
c24ndCBhIHByb2JsZW0uCgpJIHN0aWxsIG5lZWQgdG8gc3VibWl0IHRoZSBuZXh0IHZlcnNpb24g
b2YgdGhlIHBhdGNoZXMsIGJ1dCB5ZXMsIHdlIGFyZSBub3QKYWJvdXQgdG8gbWFwIHRoZW0gdG8g
dXNlcnNwYWNlIChkYWgpLgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
