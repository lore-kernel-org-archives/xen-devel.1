From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v20 12/13] x86/hvm: Remove redundant save
 functions
Date: Tue, 11 Sep 2018 08:00:17 -0600
Message-ID: <5B97CA7102000078001E7539@prv1-mh.provo.novell.com>
References: <20180910142602.15987-1-aisaila@bitdefender.com>
 <20180910142602.15987-13-aisaila@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20180910142602.15987-13-aisaila@bitdefender.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: aisaila@bitdefender.com
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul.durrant@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDEwLjA5LjE4IGF0IDE2OjI2LCA8YWlzYWlsYUBiaXRkZWZlbmRlci5jb20+IHdyb3Rl
Ogo+IEBAIC0xNDgsMTQgKzE0NiwxNyBAQCBpbnQgaHZtX3NhdmVfb25lKHN0cnVjdCBkb21haW4g
KmQsIHVuc2lnbmVkIGludCB0eXBlY29kZSwgdW5zaWduZWQgaW50IGluc3RhbmNlLAo+ICAgICAg
ICAgICAhaHZtX3NyX2hhbmRsZXJzW3R5cGVjb2RlXS5zYXZlICkKPiAgICAgICAgICByZXR1cm4g
LUVJTlZBTDsKPiAgCj4gKyAgICBpZiAoIGluc3RhbmNlID49IGQtPm1heF92Y3B1cyAmJgo+ICsg
ICAgICAgICBodm1fc3JfaGFuZGxlcnNbdHlwZWNvZGVdLmtpbmQgPT0gSFZNU1JfUEVSX1ZDUFUg
KQo+ICsgICAgICAgIHJldHVybiAtRU5PRU5UOwo+ICsgICAgdiA9ICBkLT52Y3B1W2h2bV9zcl9o
YW5kbGVyc1t0eXBlY29kZV0ua2luZCA9PSBIVk1TUl9QRVJfVkNQVSA/Cj4gKyAgICAgICAgICAg
ICAgICAgaW5zdGFuY2UgOiAwXTsKCkkgdGhpbmsgdGhpcyB3b3VsZCBiZSBlYXNpZXIgdG8gcmVh
ZCAobGVzcyByZWR1bmRhbmN5KSBhcwoKICAgIGlmICggaHZtX3NyX2hhbmRsZXJzW3R5cGVjb2Rl
XS5raW5kICE9IEhWTVNSX1BFUl9WQ1BVICkKICAgICAgICB2ID0gZC0+dmNwdVswXTsKICAgIGVs
c2UgaWYgKCBpbnN0YW5jZSA+PSBkLT5tYXhfdmNwdXMgfHwgIWQtPnZjcHVbaW5zdGFuY2VdICkK
ICAgICAgICByZXR1cm4gLUVOT0VOVDsKICAgIGVsc2UKICAgICAgICB2ID0gIGQtPnZjcHVbaW5z
dGFuY2VdOwoKV2hlbiBJIGhhZCBzdWdnZXN0ZWQgcHV0dGluZyB0aGUgY29uZGl0aW9uYWwgb3Bl
cmF0b3IgaW5zaWRlIHRoZQpzcXVhcmUgYnJhY2tldHMgdGhlcmUgd2FzIHRvbyBsaXR0bGUgY29u
dGV4dCBwcm92aWRlZC4gU2hvdWxkIEkgZW5kCnVwIGNvbW1pdHRpbmcgdGhpcywgSSB0aGluayBJ
J2xsIGVkaXQgdGhlIHBhdGNoIGFjY29yZGluZ2x5ICh0aGUgTlVMTApjaGVjayBuZWVkcyBhZGRp
bmcgYW55d2F5KS4KCldpdGggYXQgbGVhc3QgdGhlIE5VTEwgY2hlY2sgaW4gcGxhY2UKUmV2aWV3
ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCkphbgoKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
