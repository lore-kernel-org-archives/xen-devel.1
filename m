From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v3 13/17] x86/xen: enable Hygon support to
 Xen
Date: Sun, 12 Aug 2018 10:55:39 +0200
Message-ID: <0aa44410-47ec-27e2-10d9-c0dc5d2e457a__22428.4267322675$1534064095$gmane$org@suse.com>
References: <cover.1533989492.git.puwen@hygon.cn>
 <2747ad959f07459000f2693a98d237e2b3149ca1.1533989493.git.puwen@hygon.cn>
 <b32887e0-df6e-fb31-d9cd-6b31961c9c2b@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=xw9t=k3=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1fomAA-0002TI-KZ
 for xen-devel@lists.xenproject.org; Sun, 12 Aug 2018 08:55:50 +0000
In-Reply-To: <b32887e0-df6e-fb31-d9cd-6b31961c9c2b@oracle.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>, Pu Wen <puwen@hygon.cn>, tglx@linutronix.de, mingo@redhat.com, hpa@zytor.com, x86@kernel.org, thomas.lendacky@amd.com, bp@alien8.de, pbonzini@redhat.com, JBeulich@suse.com
Cc: linux-arch@vger.kernel.org, xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

T24gMTEvMDgvMTggMTY6MzQsIEJvcmlzIE9zdHJvdnNreSB3cm90ZToKPiBPbiAwOC8xMS8yMDE4
IDA5OjI5IEFNLCBQdSBXZW4gd3JvdGU6Cj4+IFRvIG1ha2UgWGVuIHdvcmsgY29ycmVjdGx5IG9u
IEh5Z29uIHBsYXRmb3JtcywgcmV1c2UgQU1EJ3MgWGVuIHN1cHBvcnQKPj4gY29kZSBwYXRoIGFu
ZCBhZGQgdmVuZG9yIGNoZWNrIGZvciBIeWdvbiBhbG9uZyB3aXRoIEFNRC4KPj4KPj4gU2lnbmVk
LW9mZi1ieTogUHUgV2VuIDxwdXdlbkBoeWdvbi5jbj4KPj4gLS0tCj4+ICBhcmNoL3g4Ni94ZW4v
cG11LmMgfCAxNSArKysrKysrKysrKystLS0KPj4gIDEgZmlsZSBjaGFuZ2VkLCAxMiBpbnNlcnRp
b25zKCspLCAzIGRlbGV0aW9ucygtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvYXJjaC94ODYveGVuL3Bt
dS5jIGIvYXJjaC94ODYveGVuL3BtdS5jCj4+IGluZGV4IDdkMDBkNGEuLjEwNTNkZGEgMTAwNjQ0
Cj4+IC0tLSBhL2FyY2gveDg2L3hlbi9wbXUuYwo+PiArKysgYi9hcmNoL3g4Ni94ZW4vcG11LmMK
Pj4gQEAgLTkwLDYgKzkwLDEyIEBAIHN0YXRpYyB2b2lkIHhlbl9wbXVfYXJjaF9pbml0KHZvaWQp
Cj4+ICAJCQlrN19jb3VudGVyc19taXJyb3JlZCA9IDA7Cj4+ICAJCQlicmVhazsKPj4gIAkJfQo+
PiArCX0gZWxzZSBpZiAoYm9vdF9jcHVfZGF0YS54ODZfdmVuZG9yID09IFg4Nl9WRU5ET1JfSFlH
T04pIHsKPj4gKwkJYW1kX251bV9jb3VudGVycyA9IEYxMEhfTlVNX0NPVU5URVJTOwo+IAo+IEkg
aGF2ZW4ndCBsb29rZWQgaW4gZGV0YWlscyBhdCBaZW4ncyBQTVUgYnV0IHRoZSBQTUMgc2VjdGlv
biBpbiB0aGUgc3BlYwo+IHN0YXJ0cyB3aXRoCj4gwqAgIlRoZXJlIGFyZSBzaXggY29yZSBwZXJm
b3JtYW5jZSBldmVudHMgY291bnRlcnMgcGVyIHRocmVhZC4uLiIKPiAKPiAKPiAKPj4gKwkJYW1k
X2NvdW50ZXJzX2Jhc2UgPSBNU1JfSzdfUEVSRkNUUjA7Cj4+ICsJCWFtZF9jdHJsc19iYXNlID0g
TVNSX0s3X0VWTlRTRUwwOwo+PiArCQlhbWRfbXNyX3N0ZXAgPSAxOwo+PiArCQlrN19jb3VudGVy
c19taXJyb3JlZCA9IDA7Cj4+ICAJfSBlbHNlIHsKPj4gIAkJdWludDMyX3QgZWF4LCBlYngsIGVj
eCwgZWR4Owo+PiAgCj4+IEBAIC0yODUsNyArMjkxLDggQEAgc3RhdGljIGJvb2wgeGVuX2FtZF9w
bXVfZW11bGF0ZSh1bnNpZ25lZCBpbnQgbXNyLCB1NjQgKnZhbCwgYm9vbCBpc19yZWFkKQo+PiAg
Cj4+ICBib29sIHBtdV9tc3JfcmVhZCh1bnNpZ25lZCBpbnQgbXNyLCB1aW50NjRfdCAqdmFsLCBp
bnQgKmVycikKPj4gIHsKPj4gLQlpZiAoYm9vdF9jcHVfZGF0YS54ODZfdmVuZG9yID09IFg4Nl9W
RU5ET1JfQU1EKSB7Cj4+ICsJaWYgKGJvb3RfY3B1X2RhdGEueDg2X3ZlbmRvciA9PSBYODZfVkVO
RE9SX0FNRCB8fAo+PiArCSAgICBib290X2NwdV9kYXRhLng4Nl92ZW5kb3IgPT0gWDg2X1ZFTkRP
Ul9IWUdPTikgewo+IAo+IAo+ICdpZiAoYm9vdF9jcHVfZGF0YS54ODZfdmVuZG9yICE9IFg4Nl9W
RU5ET1JfSU5URUwpJyBwbGVhc2UuCgpSZWFsbHk/IFhlbiBzdXBwb3J0cyBDZW50YXVyLCB0b28u
CgoKSnVlcmdlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
