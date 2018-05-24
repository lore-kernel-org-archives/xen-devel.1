From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 4/9] x86/vmx: Support remote access to the
 MSR lists
Date: Thu, 24 May 2018 08:53:16 -0600
Message-ID: <5B06D1DC02000078001C5A2A@prv1-mh.provo.novell.com>
References: <1526988046-22948-1-git-send-email-andrew.cooper3@citrix.com>
 <1526988046-22948-5-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1526988046-22948-5-git-send-email-andrew.cooper3@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Kevin Tian <kevin.tian@intel.com>, Xen-devel <xen-devel@lists.xen.org>, Wei Liu <wei.liu2@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIyLjA1LjE4IGF0IDEzOjIwLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gQEAgLTUzNywyNSArNTQ0LDI3IEBAIGVudW0gdm14X21zcl9saXN0X3R5cGUgewo+ICAg
ICAgVk1YX01TUl9HVUVTVCwKPiAgfTsKPiAgCj4gLWludCB2bXhfYWRkX21zcih1aW50MzJfdCBt
c3IsIGVudW0gdm14X21zcl9saXN0X3R5cGUgdHlwZSk7Cj4gK2ludCB2bXhfYWRkX21zcihzdHJ1
Y3QgdmNwdSAqdiwgdWludDMyX3QgbXNyLCBlbnVtIHZteF9tc3JfbGlzdF90eXBlIHR5cGUpOwo+
ICAKPiAtc3RhdGljIGlubGluZSBpbnQgdm14X2FkZF9ob3N0X2xvYWRfbXNyKHVpbnQzMl90IG1z
cikKPiArc3RhdGljIGlubGluZSBpbnQgdm14X2FkZF9ndWVzdF9tc3Ioc3RydWN0IHZjcHUgKnYs
IHVpbnQzMl90IG1zcikKPiAgewo+IC0gICAgcmV0dXJuIHZteF9hZGRfbXNyKG1zciwgVk1YX01T
Ul9IT1NUKTsKPiArICAgIHJldHVybiB2bXhfYWRkX21zcih2LCBtc3IsIFZNWF9NU1JfR1VFU1Qp
Owo+ICB9Cj4gIAo+IC1zdGF0aWMgaW5saW5lIGludCB2bXhfYWRkX2d1ZXN0X21zcih1aW50MzJf
dCBtc3IpCj4gK3N0YXRpYyBpbmxpbmUgaW50IHZteF9hZGRfaG9zdF9sb2FkX21zcihzdHJ1Y3Qg
dmNwdSAqdiwgdWludDMyX3QgbXNyKQo+ICB7Cj4gLSAgICByZXR1cm4gdm14X2FkZF9tc3IobXNy
LCBWTVhfTVNSX0dVRVNUKTsKPiArICAgIHJldHVybiB2bXhfYWRkX21zcih2LCBtc3IsIFZNWF9N
U1JfSE9TVCk7Cj4gIH0KPiAgCj4gLXN0cnVjdCB2bXhfbXNyX2VudHJ5ICp2bXhfZmluZF9tc3Io
dWludDMyX3QgbXNyLCBlbnVtIHZteF9tc3JfbGlzdF90eXBlIHR5cGUpOwo+ICtzdHJ1Y3Qgdm14
X21zcl9lbnRyeSAqdm14X2ZpbmRfbXNyKHN0cnVjdCB2Y3B1ICp2LCB1aW50MzJfdCBtc3IsCj4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZW51bSB2bXhfbXNyX2xpc3RfdHlw
ZSB0eXBlKTsKPiAgCj4gLXN0YXRpYyBpbmxpbmUgaW50IHZteF9yZWFkX2d1ZXN0X21zcih1aW50
MzJfdCBtc3IsIHVpbnQ2NF90ICp2YWwpCj4gK3N0YXRpYyBpbmxpbmUgaW50IHZteF9yZWFkX2d1
ZXN0X21zcihzdHJ1Y3QgdmNwdSAqdiwgdWludDMyX3QgbXNyLAo+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgdWludDY0X3QgKnZhbCkKCkl0IHdvdWxkIHNlZW0gbG9naWNh
bCBmb3IgdGhlIG5ldyBwYXJhbWV0ZXIgdG8gYmUgY29uc3RpZmllZCBmb3IgYXQgbGVhc3QKdGhl
c2UgbGFzdCB0d28uCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
