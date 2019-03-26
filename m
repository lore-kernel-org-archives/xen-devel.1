From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [RFC PATCH v6 13/12] microcode: add sequential
 application policy
Date: Tue, 26 Mar 2019 10:23:04 -0600
Message-ID: <5C9A51E80200007800221FC1@prv1-mh.provo.novell.com>
References: <1552291056-20286-1-git-send-email-chao.gao@intel.com>
 <1552291056-20286-13-git-send-email-chao.gao@intel.com>
 <1d9184c6-38c4-dc85-9542-fb7397d6c43a@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=fwfT=R5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1h8or0-0004rN-PZ
 for xen-devel@lists.xenproject.org; Tue, 26 Mar 2019 16:23:10 +0000
In-Reply-To: <1d9184c6-38c4-dc85-9542-fb7397d6c43a@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Sergey Dyasli <sergey.dyasli@citrix.com>, Chao Gao <chao.gao@intel.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>, Ashok Raj <ashok.raj@intel.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIxLjAzLjE5IGF0IDEzOjI0LCA8c2VyZ2V5LmR5YXNsaUBjaXRyaXguY29tPiB3cm90
ZToKPiBAQCAtMjE2LDYgKzIxOCwxMCBAQCBERUZJTkVfUEVSX0NQVShzdHJ1Y3QgY3B1X3NpZ25h
dHVyZSwgY3B1X3NpZyk7Cj4gICAqLwo+ICBzdGF0aWMgYXRvbWljX3QgY3B1X2luLCBjcHVfb3V0
Owo+IAo+ICtzdGF0aWMgdWludDMyX3QgYXBwbGljYXRpb25fc3RyYXRlZ3k7Cj4gKy8qIFRoZSBu
ZXh0IENQVSB0byBwZXJmb3JtIGEgdWNvZGUgdXBkYXRlICovCj4gK3N0YXRpYyBpbnQgbmV4dF9j
cHU7Cgp1bnNpZ25lZCBpbnQgKHR3aWNlKS4KCj4gLS0tIGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9w
cm9jZXNzb3IuaAo+ICsrKyBiL3hlbi9pbmNsdWRlL2FzbS14ODYvcHJvY2Vzc29yLmgKPiBAQCAt
NTczLDcgKzU3Myw4IEBAIGludCByZG1zcl9oeXBlcnZpc29yX3JlZ3ModWludDMyX3QgaWR4LCB1
aW50NjRfdCAqdmFsKTsKPiAgaW50IHdybXNyX2h5cGVydmlzb3JfcmVncyh1aW50MzJfdCBpZHgs
IHVpbnQ2NF90IHZhbCk7Cj4gCj4gIHZvaWQgbWljcm9jb2RlX3NldF9tb2R1bGUodW5zaWduZWQg
aW50KTsKPiAtaW50IG1pY3JvY29kZV91cGRhdGUoWEVOX0dVRVNUX0hBTkRMRV9QQVJBTShjb25z
dF92b2lkKSwgdW5zaWduZWQgbG9uZyBsZW4pOwo+ICtpbnQgbWljcm9jb2RlX3VwZGF0ZShYRU5f
R1VFU1RfSEFORExFX1BBUkFNKGNvbnN0X3ZvaWQpLCB1bnNpZ25lZCBsb25nIGxlbiwKPiArICAg
ICAgICAgICAgICAgICAgICAgdWludDMyX3Qgc3RyYXRlZ3kpOwoKQWdhaW4uCgo+IC0tLSBhL3hl
bi9pbmNsdWRlL3B1YmxpYy9wbGF0Zm9ybS5oCj4gKysrIGIveGVuL2luY2x1ZGUvcHVibGljL3Bs
YXRmb3JtLmgKPiBAQCAtMTE0LDYgKzExNCw5IEBAIHN0cnVjdCB4ZW5wZl9taWNyb2NvZGVfdXBk
YXRlIHsKPiAgICAgIC8qIElOIHZhcmlhYmxlcy4gKi8KPiAgICAgIFhFTl9HVUVTVF9IQU5ETEUo
Y29uc3Rfdm9pZCkgZGF0YTsvKiBQb2ludGVyIHRvIG1pY3JvY29kZSBkYXRhICovCj4gICAgICB1
aW50MzJfdCBsZW5ndGg7ICAgICAgICAgICAgICAgICAgLyogTGVuZ3RoIG9mIG1pY3JvY29kZSBk
YXRhLiAqLwo+ICsjZGVmaW5lIFhFTlBGX21pY3JvY29kZV9wYXJhbGxlbCAgIDAKPiArI2RlZmlu
ZSBYRU5QRl9taWNyb2NvZGVfc2VxdWVudGlhbCAxCj4gKyAgICB1aW50MzJfdCBzdHJhdGVneTsg
ICAgICAgICAgICAgICAgLyogQXBwbGljYXRpb24gc3RyYXRlZ3kuICAgICAqLwo+ICB9OwoKVGhp
cyBpcyBub3QgYSBjb21wYXRpYmxlIGV4dGVuc2lvbiBvZiB0aGUgaW50ZXJmYWNlOiBGb3IgNjQt
Yml0CnRoZXJlJ3Mgbm8gZ3VhcmFudGVlIGV4aXN0aW5nIGNhbGxlcnMgd291bGQgemVybyB0aGUg
cGFkZGluZwpmaWVsZCwgd2hpbGUgZm9yIDMyLWJpdCB0aGVyZSdzIG5vIHBhZGRpbmcgZmllbGQg
YXQgYWxsLCBzbyBmb3IgYW4KZXhpc3RpbmcsIHVuYXdhcmUgY2FsbGVyIHlvdSdkIGNvbnN1bWUg
cmFuZG9tIGRhdGEgYXMgaW5wdXQuCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
