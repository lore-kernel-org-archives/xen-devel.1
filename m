From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH v5 4/8] microcode: delete 'mc' field from
 struct ucode_cpu_info
Date: Tue, 29 Jan 2019 10:25:03 +0100
Message-ID: <20190129092503.fvoj4nciohtdp3ei@mac>
References: <1548659210-16870-1-git-send-email-chao.gao@intel.com>
 <1548659210-16870-5-git-send-email-chao.gao@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=cRBG=QF=citrix.com=prvs=925bc6214=roger.pau@srs-us1.protection.inumbo.net>)
 id 1goPdt-0000sW-8K
 for xen-devel@lists.xenproject.org; Tue, 29 Jan 2019 09:25:17 +0000
Content-Disposition: inline
In-Reply-To: <1548659210-16870-5-git-send-email-chao.gao@intel.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Chao Gao <chao.gao@intel.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

VGhhbmtzIGZvciB0aGUgY2xlYW51cCEKCk9uIE1vbiwgSmFuIDI4LCAyMDE5IGF0IDAzOjA2OjQ2
UE0gKzA4MDAsIENoYW8gR2FvIHdyb3RlOgo+IGRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9hc20t
eDg2L21pY3JvY29kZS5oIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9taWNyb2NvZGUuaAo+IGluZGV4
IGZjOThmZWQuLjUwN2RhMmUgMTAwNjQ0Cj4gLS0tIGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9taWNy
b2NvZGUuaAo+ICsrKyBiL3hlbi9pbmNsdWRlL2FzbS14ODYvbWljcm9jb2RlLmgKPiBAQCAtMTks
NyArMTksNiBAQCBzdHJ1Y3QgbWljcm9jb2RlX3BhdGNoIHsKPiAgfTsKPiAgCj4gIHN0cnVjdCBt
aWNyb2NvZGVfb3BzIHsKPiAtICAgIGludCAoKm1pY3JvY29kZV9yZXN1bWVfbWF0Y2gpKHVuc2ln
bmVkIGludCBjcHUsIGNvbnN0IHZvaWQgKm1jKTsKPiAgICAgIGludCAoKmNwdV9yZXF1ZXN0X21p
Y3JvY29kZSkodW5zaWduZWQgaW50IGNwdSwgY29uc3Qgdm9pZCAqYnVmLAo+ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBzaXplX3Qgc2l6ZSk7Cj4gICAgICBpbnQgKCpjb2xsZWN0
X2NwdV9pbmZvKSh1bnNpZ25lZCBpbnQgY3B1LCBzdHJ1Y3QgY3B1X3NpZ25hdHVyZSAqY3NpZyk7
Cj4gQEAgLTM5LDExICszOCw2IEBAIHN0cnVjdCBjcHVfc2lnbmF0dXJlIHsKPiAgCj4gIHN0cnVj
dCB1Y29kZV9jcHVfaW5mbyB7Cj4gICAgICBzdHJ1Y3QgY3B1X3NpZ25hdHVyZSBjcHVfc2lnOwo+
IC0gICAgdW5pb24gewo+IC0gICAgICAgIHN0cnVjdCBtaWNyb2NvZGVfaW50ZWwgKm1jX2ludGVs
Owo+IC0gICAgICAgIHN0cnVjdCBtaWNyb2NvZGVfYW1kICptY19hbWQ7Cj4gLSAgICAgICAgdm9p
ZCAqbWNfdmFsaWQ7Cj4gLSAgICB9IG1jOwo+ICB9OwoKSXMgdGhlcmUgcmVhbGx5IGEgbmVlZCBm
b3Igc3VjaCBzdHJ1Y3R1cmUgc2luY2UgaXQgb25seSBoYXMgb25lIGZpZWxkCm5vdz8KCkknbSB0
cnlpbmcgdG8gZmlndXJlIG91dCB3aGV0aGVyIHRoaXMgaXMgZXhwYW5kZWQgYnkgZnVydGhlciBw
YXRjaGVzLApidXQgaXQgc2VlbXMgbGlrZSBpdCdzIG5vdCwgaWYgc28gcGxlYXNlIHJlbW92ZSB0
aGUgc3RydWN0IGFsdG9nZXRoZXIuCgpJJ20gYWxzbyB3b25kZXJpbmcgd2hldGhlciBpdCdzIG5l
ZWRlZCB0byBzdG9yZSB0aGUgY3B1IHNpZ25hdHVyZSBpbgp0aGUgcGNwdSBhcmVhLCBBRkFJQ1Qg
eW91IGFsd2F5cyBjYWxsIGNvbGxlY3RfY3B1X2luZm8gYmVmb3JlCmFwcGx5X21pY3JvY29kZSwg
YXQgd2hpY2ggcG9pbnQgY3B1X3NpZ25hdHVyZSBjb3VsZCBiZSBzdG9yZWQgaW4gdGhlCnN0YWNr
IGFuZCBwYXNzZWQgdG8gYXBwbHlfbWljcm9jb2RlIGFzIGEgcGFyYW1ldGVyPwoKT3IgYXBwbHlf
bWljcm9jb2RlIGNvdWxkIGNhbGwgY29sbGVjdF9jcHVfaW5mbyBkaXJlY3RseS4gR2V0dGluZyBy
aWQKb2YgdGhlIHBjcHUgZmllbGQgd291bGQgYWxzbyBhbGxvdyB5b3UgdG8gZ2V0IHJpZCBvZgpt
aWNyb2NvZGVfZmluaV9jcHUsIGZ1cnRoZXIgY2xlYW5pbmcgdGhlIGNvZGUuCgpUaGFua3MsIFJv
Z2VyLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
