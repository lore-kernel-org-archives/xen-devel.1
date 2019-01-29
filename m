From: Chao Gao <chao.gao@intel.com>
Subject: Re: [PATCH v5 4/8] microcode: delete 'mc' field from
 struct ucode_cpu_info
Date: Tue, 29 Jan 2019 21:27:10 +0800
Message-ID: <20190129132708.GA9079@gao-cwp>
References: <1548659210-16870-1-git-send-email-chao.gao@intel.com>
 <1548659210-16870-5-git-send-email-chao.gao@intel.com>
 <20190129092503.fvoj4nciohtdp3ei@mac>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1edO=QF=intel.com=chao.gao@srs-us1.protection.inumbo.net>)
 id 1goTM6-0001FF-E2
 for xen-devel@lists.xenproject.org; Tue, 29 Jan 2019 13:23:10 +0000
Content-Disposition: inline
In-Reply-To: <20190129092503.fvoj4nciohtdp3ei@mac>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBKYW4gMjksIDIwMTkgYXQgMTA6MjU6MDNBTSArMDEwMCwgUm9nZXIgUGF1IE1vbm7D
qSB3cm90ZToKPlRoYW5rcyBmb3IgdGhlIGNsZWFudXAhCj4KPk9uIE1vbiwgSmFuIDI4LCAyMDE5
IGF0IDAzOjA2OjQ2UE0gKzA4MDAsIENoYW8gR2FvIHdyb3RlOgo+PiBkaWZmIC0tZ2l0IGEveGVu
L2luY2x1ZGUvYXNtLXg4Ni9taWNyb2NvZGUuaCBiL3hlbi9pbmNsdWRlL2FzbS14ODYvbWljcm9j
b2RlLmgKPj4gaW5kZXggZmM5OGZlZC4uNTA3ZGEyZSAxMDA2NDQKPj4gLS0tIGEveGVuL2luY2x1
ZGUvYXNtLXg4Ni9taWNyb2NvZGUuaAo+PiArKysgYi94ZW4vaW5jbHVkZS9hc20teDg2L21pY3Jv
Y29kZS5oCj4+IEBAIC0xOSw3ICsxOSw2IEBAIHN0cnVjdCBtaWNyb2NvZGVfcGF0Y2ggewo+PiAg
fTsKPj4gIAo+PiAgc3RydWN0IG1pY3JvY29kZV9vcHMgewo+PiAtICAgIGludCAoKm1pY3JvY29k
ZV9yZXN1bWVfbWF0Y2gpKHVuc2lnbmVkIGludCBjcHUsIGNvbnN0IHZvaWQgKm1jKTsKPj4gICAg
ICBpbnQgKCpjcHVfcmVxdWVzdF9taWNyb2NvZGUpKHVuc2lnbmVkIGludCBjcHUsIGNvbnN0IHZv
aWQgKmJ1ZiwKPj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHNpemVfdCBzaXpl
KTsKPj4gICAgICBpbnQgKCpjb2xsZWN0X2NwdV9pbmZvKSh1bnNpZ25lZCBpbnQgY3B1LCBzdHJ1
Y3QgY3B1X3NpZ25hdHVyZSAqY3NpZyk7Cj4+IEBAIC0zOSwxMSArMzgsNiBAQCBzdHJ1Y3QgY3B1
X3NpZ25hdHVyZSB7Cj4+ICAKPj4gIHN0cnVjdCB1Y29kZV9jcHVfaW5mbyB7Cj4+ICAgICAgc3Ry
dWN0IGNwdV9zaWduYXR1cmUgY3B1X3NpZzsKPj4gLSAgICB1bmlvbiB7Cj4+IC0gICAgICAgIHN0
cnVjdCBtaWNyb2NvZGVfaW50ZWwgKm1jX2ludGVsOwo+PiAtICAgICAgICBzdHJ1Y3QgbWljcm9j
b2RlX2FtZCAqbWNfYW1kOwo+PiAtICAgICAgICB2b2lkICptY192YWxpZDsKPj4gLSAgICB9IG1j
Owo+PiAgfTsKPgo+SXMgdGhlcmUgcmVhbGx5IGEgbmVlZCBmb3Igc3VjaCBzdHJ1Y3R1cmUgc2lu
Y2UgaXQgb25seSBoYXMgb25lIGZpZWxkCj5ub3c/Cj4KPkknbSB0cnlpbmcgdG8gZmlndXJlIG91
dCB3aGV0aGVyIHRoaXMgaXMgZXhwYW5kZWQgYnkgZnVydGhlciBwYXRjaGVzLAo+YnV0IGl0IHNl
ZW1zIGxpa2UgaXQncyBub3QsIGlmIHNvIHBsZWFzZSByZW1vdmUgdGhlIHN0cnVjdCBhbHRvZ2V0
aGVyLgo+Cj5JJ20gYWxzbyB3b25kZXJpbmcgd2hldGhlciBpdCdzIG5lZWRlZCB0byBzdG9yZSB0
aGUgY3B1IHNpZ25hdHVyZSBpbgo+dGhlIHBjcHUgYXJlYSwgQUZBSUNUIHlvdSBhbHdheXMgY2Fs
bCBjb2xsZWN0X2NwdV9pbmZvIGJlZm9yZQo+YXBwbHlfbWljcm9jb2RlLCBhdCB3aGljaCBwb2lu
dCBjcHVfc2lnbmF0dXJlIGNvdWxkIGJlIHN0b3JlZCBpbiB0aGUKPnN0YWNrIGFuZCBwYXNzZWQg
dG8gYXBwbHlfbWljcm9jb2RlIGFzIGEgcGFyYW1ldGVyPwo+Cj5PciBhcHBseV9taWNyb2NvZGUg
Y291bGQgY2FsbCBjb2xsZWN0X2NwdV9pbmZvIGRpcmVjdGx5LiBHZXR0aW5nIHJpZAo+b2YgdGhl
IHBjcHUgZmllbGQgd291bGQgYWxzbyBhbGxvdyB5b3UgdG8gZ2V0IHJpZCBvZgo+bWljcm9jb2Rl
X2ZpbmlfY3B1LCBmdXJ0aGVyIGNsZWFuaW5nIHRoZSBjb2RlLgoKWW91ciBzdWdnZXN0aW9ucyBh
cmUgdmlhYmxlIGFuZCB3aWxsIGZvbGxvdyB0aGVtLgoKVGhhbmtzCkNoYW8KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
