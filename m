From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v2 1/6] x86/xpti: avoid copying L4 page
 table contents when possible
Date: Tue, 6 Mar 2018 09:06:19 +0100
Message-ID: <7d252d4e-36ea-b6fa-23c4-2e9d620277e4@suse.com>
References: <20180302081403.16953-1-jgross@suse.com>
 <20180302081403.16953-2-jgross@suse.com> <5A9D81DC02000078001AEB68@suse.com>
 <491a2039-d6ef-cad1-b8f3-191fddf73ccf@suse.com>
 <5A9E583002000078001AED3A@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=xqmt=f4=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1et7cD-0003h2-9e
 for xen-devel@lists.xenproject.org; Tue, 06 Mar 2018 08:06:29 +0000
In-Reply-To: <5A9E583002000078001AED3A@suse.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: andrew.cooper3@citrix.com, wei.liu2@citrix.com, xen-devel@lists.xenproject.org, Dario Faggioli <dfaggioli@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDYvMDMvMTggMDg6NTgsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDA2LjAzLjE4IGF0
IDA4OjAxLCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPj4gT24gMDUvMDMvMTggMTc6NDMsIEph
biBCZXVsaWNoIHdyb3RlOgo+Pj4+Pj4gT24gMDIuMDMuMTggYXQgMDk6MTMsIDxqZ3Jvc3NAc3Vz
ZS5jb20+IHdyb3RlOgo+Pj4+IC0tLSBhL3hlbi9hcmNoL3g4Ni9tbS5jCj4+Pj4gKysrIGIveGVu
L2FyY2gveDg2L21tLmMKPj4+PiBAQCAtNTA5LDYgKzUwOSw4IEBAIHZvaWQgbWFrZV9jcjMoc3Ry
dWN0IHZjcHUgKnYsIG1mbl90IG1mbikKPj4+PiAgCj4+Pj4gIHZvaWQgd3JpdGVfcHRiYXNlKHN0
cnVjdCB2Y3B1ICp2KQo+Pj4+ICB7Cj4+Pj4gKyAgICBnZXRfY3B1X2luZm8oKS0+cm9vdF9wZ3Rf
Y2hhbmdlZCA9IHRoaXNfY3B1KHJvb3RfcGd0KSAmJiBpc19wdl92Y3B1KHYpICYmCj4+Pj4gKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICFpc19wdl8zMmJpdF92Y3B1KHYp
Owo+Pj4KPj4+IFdoeSBpc19wdl92Y3B1KCkgd2hlbiB5b3UgYWxyZWFkeSBjaGVjayBpc19wdl8z
MmJpdF92Y3B1KCk/Cj4+Cj4+IEkgY2hlY2sgIWlzX3B2XzMyYml0X3ZjcHUoKSB0byBjYXRjaCA2
NC1iaXQgcHYtZG9tYWlucyBvbmx5Lgo+IAo+IE9oLCBJJ20gc29ycnkgLSBGb3Igd2hhdGV2ZXIg
cmVhc29uIEkndmUgaWdub3JlZCB0aGUgISB0aGVyZS4KPiAKPj4+IEFuZCBkb24ndCB5b3UgbmVl
ZCB0byBkaXNhbGxvdyB1cGRhdGluZyBMNHMgb2YgcnVubmluZyBndWVzdHMgbm93Cj4+PiAod2hp
Y2ggaXMgYSBiYWQgaWRlYSBhbnl3YXkpPwo+Pgo+PiBZZXMsIEkgc2hvdWxkIGRvIHRoYXQuCj4g
Cj4gQnV0IHBsZWFzZSBkbyB0aGlzIGFzIGEgc2VwYXJhdGUgY2hhbmdlLCBhcyBzdHJpY3RseSBz
cGVha2luZyB0aGlzIGlzCj4gYSBiZWhhdmlvcmFsIGNoYW5nZSB0aGF0IHdlIGNhbid0IGFsbG93
LiBCdXQgSSB0aGluayB3ZSBzaW1wbHkgbmVlZAo+IHRvIGFjY2VwdCB0aGlzIChhbmQgcGVyaGFw
cyB1bmlmb3JtbHkgZm9yIGFsbCBwYWdlIHRhYmxlIGxldmVscykuCgpIbW0sIHRoaW5raW5nIG1v
cmUgYWJvdXQgaXQ6IHdvdWxkbid0IGl0IGJlIGVub3VnaCB0byBkbyB0aGUgY2hhbmdlIGFuZAp0
aGVuIHNlbmRpbmcgYSBGTFVTSF9ST09UX1BHVEJMIHRvIHRoZSB2Y3B1KHMpIHRoZSBhZmZlY3Rl
ZCBndWVzdCBpcwpydW5uaW5nIG9uPyBUaGlzIHdvdWxkIGNhdXNlIGEgY3ljbGUgdGhyb3VnaCB0
aGUgaHlwZXJ2aXNvciByZXN1bHRpbmcgaW4KYW4gdXBkYXRlZCByb290IHBhZ2UgdGFibGUgb2Yg
dGhhdCBndWVzdC4KCgpKdWVyZ2VuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
