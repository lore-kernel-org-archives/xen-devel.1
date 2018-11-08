From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] x86/amd: don't set pv_post_outb_hook when
 !CONFIG_PV
Date: Thu, 08 Nov 2018 08:34:35 -0700
Message-ID: <5BE4578B02000078001F9BF8@prv1-mh.provo.novell.com>
References: <20181108145809.12232-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=e9yk=nt=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gKmKO-0006J0-I2
 for xen-devel@lists.xenproject.org; Thu, 08 Nov 2018 15:34:40 +0000
In-Reply-To: <20181108145809.12232-1-wei.liu2@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA4LjExLjE4IGF0IDE1OjU4LCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4g
LS0tIGEveGVuL2FyY2gveDg2L2NwdS9hbWQuYwo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9jcHUvYW1k
LmMKPiBAQCAtNjMxLDcgKzYzMSw5IEBAIHN0YXRpYyB2b2lkIGluaXRfYW1kKHN0cnVjdCBjcHVp
bmZvX3g4NiAqYykKPiAgCWNhc2UgMHhmIC4uLiAweDE3Ogo+ICAJCWRpc2FibGVfYzFlKE5VTEwp
Owo+ICAJCWlmIChhY3BpX3NtaV9jbWQgJiYgKGFjcGlfZW5hYmxlX3ZhbHVlIHwgYWNwaV9kaXNh
YmxlX3ZhbHVlKSkgewo+ICsjaWZkZWYgQ09ORklHX1BWCj4gIAkJCXB2X3Bvc3Rfb3V0Yl9ob29r
ID0gYW1kX2NoZWNrX2Rpc2FibGVfYzFlOwo+ICsjZW5kaWYKPiAgCQkJYW1kX2FjcGlfYzFlX3F1
aXJrID0gdHJ1ZTsKPiAgCQl9Cj4gIAkJYnJlYWs7CgpIbW0sIEkgd291bGQgaGF2ZSBob3BlZCBm
b3IgdGhpcyB0byBnZXQgcHJvcGVybHkgY2xlYW5lZCB1cCwKYXMgb3V0bGluZWQgaW4gdGhhdCBv
dGhlciB0aHJlYWQsIGlmIHlvdSBhbHJlYWR5IHRvdWNoIGl0LiBBbnl3YXksCkkgc2VlIHlvdSd2
ZSBnb3QgdGhlIG5lY2Vzc2FyeSBhY2tzLCBzbyB0aGUgc3Vic2VxdWVudApjbGVhbnVwIHBhdGNo
IHdpbGwganVzdCBoYXZlIHRvIGRlbGV0ZSB0d28gbW9yZSBsaW5lcy4KCkphbgoKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
