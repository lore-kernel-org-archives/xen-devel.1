From: Pu Wen <puwen@hygon.cn>
Subject: Re: [PATCH v3 13/17] x86/xen: enable Hygon support to
 Xen
Date: Thu, 16 Aug 2018 21:22:01 +0800
Message-ID: <d8e2dfb0-a2ff-5376-c39f-83626f257fda__36384.7492415973$1534425655$gmane$org@hygon.cn>
References: <cover.1533989492.git.puwen@hygon.cn>
 <2747ad959f07459000f2693a98d237e2b3149ca1.1533989493.git.puwen@hygon.cn>
 <b32887e0-df6e-fb31-d9cd-6b31961c9c2b@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=zt+t=k7=hygon.cn=puwen@srs-us1.protection.inumbo.net>)
 id 1fqIE9-0005J0-TN
 for xen-devel@lists.xenproject.org; Thu, 16 Aug 2018 13:22:13 +0000
In-Reply-To: <b32887e0-df6e-fb31-d9cd-6b31961c9c2b@oracle.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>, tglx@linutronix.de, mingo@redhat.com, hpa@zytor.com, x86@kernel.org, thomas.lendacky@amd.com, bp@alien8.de, pbonzini@redhat.com, jgross@suse.com, JBeulich@suse.com
Cc: linux-arch@vger.kernel.org, xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

T24gMjAxOC84LzExIDIyOjM0LCBCb3JpcyBPc3Ryb3Zza3kgd3JvdGU6Cj4gT24gMDgvMTEvMjAx
OCAwOToyOSBBTSwgUHUgV2VuIHdyb3RlOgo+PiBUbyBtYWtlIFhlbiB3b3JrIGNvcnJlY3RseSBv
biBIeWdvbiBwbGF0Zm9ybXMsIHJldXNlIEFNRCdzIFhlbiBzdXBwb3J0Cj4+IGNvZGUgcGF0aCBh
bmQgYWRkIHZlbmRvciBjaGVjayBmb3IgSHlnb24gYWxvbmcgd2l0aCBBTUQuCj4+Cj4+IFNpZ25l
ZC1vZmYtYnk6IFB1IFdlbiA8cHV3ZW5AaHlnb24uY24+Cj4+IC0tLQo+PiAgIGFyY2gveDg2L3hl
bi9wbXUuYyB8IDE1ICsrKysrKysrKysrKy0tLQo+PiAgIDEgZmlsZSBjaGFuZ2VkLCAxMiBpbnNl
cnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvYXJjaC94ODYveGVu
L3BtdS5jIGIvYXJjaC94ODYveGVuL3BtdS5jCj4+IGluZGV4IDdkMDBkNGEuLjEwNTNkZGEgMTAw
NjQ0Cj4+IC0tLSBhL2FyY2gveDg2L3hlbi9wbXUuYwo+PiArKysgYi9hcmNoL3g4Ni94ZW4vcG11
LmMKPj4gQEAgLTkwLDYgKzkwLDEyIEBAIHN0YXRpYyB2b2lkIHhlbl9wbXVfYXJjaF9pbml0KHZv
aWQpCj4+ICAgCQkJazdfY291bnRlcnNfbWlycm9yZWQgPSAwOwo+PiAgIAkJCWJyZWFrOwo+PiAg
IAkJfQo+PiArCX0gZWxzZSBpZiAoYm9vdF9jcHVfZGF0YS54ODZfdmVuZG9yID09IFg4Nl9WRU5E
T1JfSFlHT04pIHsKPj4gKwkJYW1kX251bV9jb3VudGVycyA9IEYxMEhfTlVNX0NPVU5URVJTOwo+
IAo+IEkgaGF2ZW4ndCBsb29rZWQgaW4gZGV0YWlscyBhdCBaZW4ncyBQTVUgYnV0IHRoZSBQTUMg
c2VjdGlvbiBpbiB0aGUgc3BlYwo+IHN0YXJ0cyB3aXRoCj4gIMKgICJUaGVyZSBhcmUgc2l4IGNv
cmUgcGVyZm9ybWFuY2UgZXZlbnRzIGNvdW50ZXJzIHBlciB0aHJlYWQuLi4iCgpUaGVyZSBhcmUg
c2l4IGNvcmUgcGVyZm9ybWFuY2UgZXZlbnRzIGNvdW50ZXJzIHBlciB0aHJlYWQsIHNvIHRoZXJl
IGFyZQpzaXggTVNScyBmb3IgdGhlc2UgY291bnRlcnMoMC01KS4gQWxzbyB0aGVyZSBhcmUgZm91
ciBsZWdhY3kgUE1DIE1TUnMsCnRoZXkgYXJlIGFsaWFzIG9mIHRoZSBjb3VudGVycygwLTMpLgoK
SW4gdGhpcyB2ZXJzaW9uIG9mIGtlcm5lbCBaZW4gdXNlIHRoZSBsYWdhY3kgdmVyc2lvbiBvZiBQ
TVUgTVNScyBmb3IgWGVuLgpGb3Igc2FmZXR5IGNvbnNpZGVyYXRpb24sIERoeWFuYSBqdXN0IGZ1
bGxvdyB0aGlzIHN0YXRlZ3kuIEFuZCBpdCB3b3JrcwpmaW5lIHdoZW4gVlBNVSBlbmFibGVkIGlu
IFhlbiBvbiBIeWdvbiBwbGF0Zm9ybXMgYnkgdGVzdGluZyB3aXRoIHBlcmYuCgpUaGFua3MsClB1
IFdlbgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
