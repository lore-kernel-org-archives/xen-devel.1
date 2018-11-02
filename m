From: George Dunlap <George.Dunlap@citrix.com>
Subject: Re: [PATCH 1/5] docs/qemu-deprivilege: Revise and
 update with status and future plans
Date: Fri, 2 Nov 2018 11:50:39 +0000
Message-ID: <1E8E6812-3205-40C1-9E5A-6BB549B02E0D@citrix.com>
References: <20181005165701.28030-1-george.dunlap@citrix.com>
 <23507.6792.900112.851242@mariner.uk.xensource.com>
 <bdf85f15-4eb7-a1b1-75cf-b31cae07010b@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=ef1j=nn=citrix.com=prvs=837aa9177=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1gIXyN-0005KD-I2
 for xen-devel@lists.xenproject.org; Fri, 02 Nov 2018 11:50:43 +0000
In-Reply-To: <bdf85f15-4eb7-a1b1-75cf-b31cae07010b@citrix.com>
Content-Language: en-US
Content-ID: <61B2BE32F984E046BFAB00A8F35AB102@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ian Jackson <Ian.Jackson@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Wilk <konrad.wilk@oracle.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim (Xen.org)" <tim@xen.org>, Ross Lagerwall <ross.lagerwall@citrix.com>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, Anthony Perard <anthony.perard@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

W1JlLXNlbmRpbmcgYXMgdGhpcyBtYWlsIHNlZW1zIHRvIGhhdmUgZ29uZSBtaXNzaW5nXQoKPiBP
biBPY3QgMjYsIDIwMTgsIGF0IDM6NTIgUE0sIEdlb3JnZSBEdW5sYXAgPGdlb3JnZS5kdW5sYXBA
Y2l0cml4LmNvbT4gd3JvdGU6Cj4gCj4gT24gMTAvMjYvMjAxOCAwMjo0NSBQTSwgSWFuIEphY2tz
b24gd3JvdGU6Cj4+IEdlb3JnZSBEdW5sYXAgd3JpdGVzICgiW1BBVENIIDEvNV0gZG9jcy9xZW11
LWRlcHJpdmlsZWdlOiBSZXZpc2UgYW5kIHVwZGF0ZSB3aXRoIHN0YXR1cyBhbmQgZnV0dXJlIHBs
YW5zIik6Cj4+PiBkb2NzL3FlbXUtZGVwcml2aWxlZ2UudHh0IGhhZCBzb21lIGJhc2ljIGluc3Ry
dWN0aW9ucyBmb3IgdXNpbmcKPj4+IGRtX3Jlc3RyaWN0LCBidXQgaXQgd2FzIGluY29tcGxldGUs
IG1pc2xlYWRpbmcsIGFuZCBzdGFsZS4KPj4gCj4+IFRoYW5rcyBmb3IgdGhlIHVwZGF0ZXMgdG8g
dGhlIHVuc2hhcmUgc3R1ZmYuCj4+IAo+Pj4gKyMjIyBEZXZpY2UgTW9kZWwgRGVwcml2aWxlZ2lu
Zwo+Pj4gKwo+Pj4gKyAgICBTdGF0dXMsIExpbnV4OiBUZWNoIFByZXZpZXcsIHdpdGggbGltaXRl
ZCBzdXBwb3J0Cj4+ICAgICAgICAgICAgICAgICAgICBeCj4+ICAgICAgICAgICAgICAgICAgICAg
ZG9tMAo+IAo+ICJEZXByaXZpbGVnaW5nIiBvbmx5IG1ha2VzIHNlbnNlIGluIGEgZG9tMCBjb250
ZXh0OyB0aGUgZGVmaW5pdGlvbiBpbgo+IHRoZSBmaXJzdCBwYXJhZ3JhcGggc2hvdWxkIG1ha2Ug
dGhhdCBjbGVhci4gIEkgdGhpbmsgYWRkaW5nICdkb20wJyB3b3VsZAo+IGNvbmZ1c2UgdGhlIGlz
c3VlIGJ5IGltcGx5aW5nIHRoYXQgbm9uLWRvbTAgZGVwcml2aWxlZ2luZyBpcyBwb3NzaWJsZS4K
PiAKPj4gSSB0aGluayB0aGlzIG1heWJlIG5lZWRzCj4+IAo+PiAgKyAgICBTdGF0dXMsIEZyZWVC
U0QgZG9tMDogVW5zdXBwb3J0ZWQKPj4gCj4+IHRvbyA/ICBUaGUgdXN1YWwgZGVmYXVsdCBpcyBz
dXBwb3J0ZWQgYW5kIG5vdCBsaXN0aW5nIGl0IGF0IGFsbCBpcwo+PiBjb25mdXNpbmcuCj4gCj4g
V2hlcmUgZG8gd2Ugc2F5IHRoZSBkZWZhdWx0IGlzIHN1cHBvcnRlZD8gIEkgdGhvdWdodCB0aGUg
ZGVmYXVsdCBmb3IgYQo+IF9mZWF0dXJlXyBub3QgbWVudGlvbmVkIHdhcyAibm8gaW5mb3JtYXRp
b24iIChpLmUuLCBtaWdodCBiZSBlaXRoZXIKPiBzdXBwb3J0ZWQgb3Igbm90IC0tIGlmIHRoZXJl
J3MgYSBxdWVzdGlvbiBhc2spLCBhbmQgdGhlIGRlZmF1bHQgZm9yIGEKPiBfY29uZmlndXJhdGlv
bl8gbm90IG1lbnRpb25lZCB3YXMgInVuc3VwcG9ydGVkIi4KPiAKPj4+ICtOT1RFOiBNb3N0IG1v
ZGVybiBzeXN0ZW1zIGhhdmUgMzItYml0IFVJRHMsIGFuZCBzbyBjYW4gaW4gdGhlb3J5IGdvIHVw
Cj4+PiArdG8gMl4zMSAob3IgMl4zMiBpZiB1aWRzIGFyZSB1bnNpZ25lZCkuICBQT1NJWCBvbmx5
IGd1YXJhbnRlZXMgMTYtYml0Cj4+PiArVUlEcyBob3dldmVyOyBVSUQgNjU1MzUgaXMgcmVzZXJ2
ZWQgZm9yIGFuIGludmFsaWQgdmFsdWUsIGFuZCA2NTUzNCBpcwo+Pj4gK25vcm1hbGx5IGFsbG9j
YXRlZCB0byAibm9ib2R5Ii4gIEFkZGl0aW9uYWxseSwgc29tZSBjb250YWluZXIgc3lzdGVtcwo+
Pj4gK2hhdmUgcHJvcG9zZWQgdXNpbmcgdGhlIHVwcGVyIDMyIGJpdHMgb2YgdGhlIHVpZCBmb3Ig
YSBjb250YWluZXIgSUQuCj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXl4KPj4g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAxNgo+IAo+IEFjawo+IAo+PiBUaGlzIGlz
IGEgZ29vZCBwYXJhZ3JhcGguCj4+IAo+PiBDYW4gSSBzdWdnZXN0IHdlIHBpY2sgYSBkaWZmZXJl
bnQgZXhhbXBsZSB0byA2NTUzNiA/ICBJdCdzIHZpc3VhbGx5Cj4+IHNpbWlsYXIgdG8gdGhlIGZh
bWlsaWFyIHZhbHVlcyBvZiA2NTUzNCBhbmQgNjU1MzUgYW5kIGFidXRzIHRoZW0uCj4+IAo+PiBv
c3N0ZXN0IHVzZXMgMjAwMDAwIGJ1dCB0aGF0J3Mgbm90IGEgbXVsdGlwbGUgb2YgMl4xNi4KPj4g
SG93IGFib3V0IDEzMTA3MiA/Cj4gCj4gSXMgdGhlIGlkZWEgZm9yIG1ha2luZyBpdCBhIG11bHRp
cGxlIG9mIDJeMTYgdGhhdCB0aGUgdmFsdWVzIHdpbGwgdGhlbgo+IG9ubHkgdGFrZSB1cCBvbmUg
ZW50cnkgaW4gdGhlICJjb250YWluZXIgSUQiIHNwYWNlPwo+IAo+IC1HZW9yZ2UKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
