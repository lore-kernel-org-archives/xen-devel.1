From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Subject: Re: [PATCH for-4.12 V5 2/2] x86/altp2m: fix
 HVMOP_altp2m_set_domain_state race
Date: Mon, 18 Feb 2019 13:24:10 +0200
Message-ID: <907a00a0-2542-716f-003b-7b9471ebd003@bitdefender.com>
References: <1550245284-9321-1-git-send-email-rcojocaru@bitdefender.com>
 <1550245284-9321-2-git-send-email-rcojocaru@bitdefender.com>
 <5C6A94BC0200007800217899@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=VblJ=QZ=bitdefender.com=rcojocaru@srs-us1.protection.inumbo.net>)
 id 1gvh20-0000dM-RF
 for xen-devel@lists.xenproject.org; Mon, 18 Feb 2019 11:24:16 +0000
In-Reply-To: <5C6A94BC0200007800217899@prv1-mh.provo.novell.com>
Content-Language: en-US-large
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMi8xOC8xOSAxOjE5IFBNLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+PiBPbiAxNS4wMi4xOSBh
dCAxNjo0MSwgPHJjb2pvY2FydUBiaXRkZWZlbmRlci5jb20+IHdyb3RlOgo+PiBIVk1PUF9hbHRw
Mm1fc2V0X2RvbWFpbl9zdGF0ZSBkb2VzIG5vdCBkb21haW5fcGF1c2UoKSwgcHJlc3VtYWJseQo+
PiBvbiBwdXJwb3NlIChhcyBpdCB3YXMgb3JpZ2luYWxseSBzdXBwb3NlZCB0byBjYXRlciB0byBh
IGluLWd1ZXN0Cj4+IGFnZW50LCBhbmQgYSBkb21haW4gcGF1c2luZyBpdHNlbGYgaXMgbm90IGEg
Z29vZCBpZGVhKS4KPj4KPj4gVGhpcyBjYW4gbGVhZCB0byBkb21haW4gY3Jhc2hlcyBpbiB0aGUg
dm14X3ZtZXhpdF9oYW5kbGVyKCkgY29kZQo+PiB0aGF0IGNoZWNrcyBpZiB0aGUgZ3Vlc3QgaGFz
IHRoZSBhYmlsaXR5IHRvIHN3aXRjaCBFUFRQIHdpdGhvdXQgYW4KPj4gZXhpdC4gVGhhdCBjb2Rl
IGNhbiBfX3ZtcmVhZCgpIHRoZSBob3N0IHAybSdzIEVQVF9QT0lOVEVSCj4+IChiZWZvcmUgSFZN
T1BfYWx0cDJtX3NldF9kb21haW5fc3RhdGUgImZvcl9lYWNoX3ZjcHUoKSIgaGFzIGEKPj4gY2hh
bmNlIHRvIHJ1biBhbHRwMm1fdmNwdV9pbml0aWFsaXNlKCksIGJ1dCBhZnRlcgo+PiBkLT5hcmNo
LmFsdHAybV9hY3RpdmUgaXMgc2V0KS4KPj4KPj4gU2lnbmVkLW9mZi1ieTogUmF6dmFuIENvam9j
YXJ1IDxyY29qb2NhcnVAYml0ZGVmZW5kZXIuY29tPgo+IAo+IEFja2VkLWJ5OiBKYW4gQmV1bGlj
aCA8amJldWxpY2hAc3VzZS5jb20+Cj4gCj4gQWxzbyBJIGFzc3VtZSB5b3UgbWVhbiB0byBoYXZl
IHRoZSBzYW1lIGp1c3RpZmljYXRpb24gaGVyZSBhcwo+IHlvdSBoYXZlIGluIHBhdGNoIDEsIGFz
IHRvIDQuMTIgaW5jbHVzaW9uLiBBbmQgZm9yIHRoaXMgcmVhc29uCj4gSSdtIGFsc28gQ2MtaW5n
IErDvHJnZW4gYWdhaW4uCgpJZGVlZCwgSSBkby4gVGhhbmsgeW91IHZlcnkgbXVjaC4KCgpUaGFu
a3MsClJhenZhbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
