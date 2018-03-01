From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 6/6] x86/msr: Blacklist various MSRs which
 guests definitely shouldn't be using
Date: Thu, 01 Mar 2018 04:07:53 -0700
Message-ID: <5A97ED1902000078001AD3A6@prv-mh.provo.novell.com>
References: <1519666519-16311-1-git-send-email-andrew.cooper3@citrix.com>
 <1519666519-16311-7-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1519666519-16311-7-git-send-email-andrew.cooper3@citrix.com>
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
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>, Xen-devel <xen-devel@lists.xen.org>, Wei Liu <wei.liu2@citrix.com>, =?UTF-8?Q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI2LjAyLjE4IGF0IDE4OjM1LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gQEAgLTE4Myw2ICsxODcsMTUgQEAgaW50IGd1ZXN0X3JkbXNyKGNvbnN0IHN0cnVjdCB2
Y3B1ICp2LCB1aW50MzJfdCBtc3IsIHVpbnQ2NF90ICp2YWwpCj4gICAgICAgICAgcmV0ID0gZ3Vl
c3RfcmRtc3JfeDJhcGljKHYsIG1zciwgdmFsKTsKPiAgICAgICAgICBnb3RvIG91dDsKPiAgCj4g
KyAgICBjYXNlIDB4YzgwOgo+ICsgICAgICAgIC8qIFNpbGljb24gRGVidWcgSW5mZXJmYWNlIG5v
dCBhZHZlcnRpc2VkIHRvIGd1ZXN0cy4gKi8KPiArICAgICAgICBnb3RvIGdwX2ZhdWx0Owo+ICsK
PiArICAgIGNhc2UgMHhjODEgLi4uIDB4YzhmOiAvKiBNaXNjIFJEVCBNU1JzLiAqLwo+ICsgICAg
Y2FzZSAweGM5MCAuLi4gMHhkOGY6IC8qIENBVCBNYXNrIHJlZ2lzdGVycy4gKi8KCkF0IHRoZSB2
ZXJ5IGxlYXN0IHdoZXJlIHdlIGFscmVhZHkgaGF2ZSAjZGVmaW5lLXMgeW91IHNob3VsZCB1c2UK
dGhvc2UuIEV2ZW4gYmV0dGVyIHdvdWxkIGJlIGlmIHlvdSBhbHNvIGludHJvZHVjZWQgI2RlZmlu
ZS1zIGZvcgpvbmVzIHdlIGRvbid0IGhhbmRsZSBhbnl3aGVyZSB5ZXQsIGFzIFJvZ2VyIGhhcyBh
bHNvIHN1Z2dlc3RlZC4KCkZ1cnRoZXJtb3JlLCB3aGF0IG1ha2VzIHlvdSBpbXBseSB0aGUgZW50
aXJlIGM4MS4uYzhmIHJhbmdlIGlzClJEVD8KCkFuZCB0aGVuIC0gZXZlbiBjYWxsaW5nIHRoZW0g
UkRUIC8gQ0FUIGlzIHF1ZXN0aW9uYWJsZSAtIHRoZSBzYW1lCm51bWJlcnMgaGF2ZSBhbm90aGVy
IHVzZSBvbiB0aGUgWGVvbiA3NTAwIHNlcmllcyBhcyBwZXIgdGhlIFNETS4KCkphbgoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
