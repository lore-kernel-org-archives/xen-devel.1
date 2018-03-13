From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 1/5] x86/hvm: Handle viridian MSRs via
 the new guest_{rd, wr}msr() infrastructure
Date: Tue, 13 Mar 2018 15:47:40 +0000
Message-ID: <41c1d046-117c-c9c7-077e-42ae6ef90656@citrix.com>
References: <1520449116-15443-1-git-send-email-andrew.cooper3@citrix.com>
 <1520449116-15443-2-git-send-email-andrew.cooper3@citrix.com>
 <5AA7FA4A02000078001B10D9@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <5AA7FA4A02000078001B10D9@prv-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

T24gMTMvMDMvMTggMTU6MjAsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDA3LjAzLjE4IGF0
IDE5OjU4LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3JvdGU6Cj4+IEBAIC0xNzUsMTEg
KzE3NywyNiBAQCBpbnQgZ3Vlc3RfcmRtc3IoY29uc3Qgc3RydWN0IHZjcHUgKnYsIHVpbnQzMl90
IG1zciwgdWludDY0X3QgKnZhbCkKPj4gICAgICAgICAgICAgICAgIF9NU1JfTUlTQ19GRUFUVVJF
U19DUFVJRF9GQVVMVElORzsKPj4gICAgICAgICAgYnJlYWs7Cj4+ICAKPj4gKyAgICBjYXNlIE1T
Ul9IWVBFUlZJU09SX1NUQVJUIC4uLiBNU1JfSFlQRVJWSVNPUl9TVEFSVCArIE5SX1ZJUklESUFO
X01TUlMgLSAKPj4gMToKPj4gKyAgICAgICAgaWYgKCBpc192aXJpZGlhbl9kb21haW4oZCkgKQo+
PiArICAgICAgICB7Cj4+ICsgICAgICAgICAgICByZXQgPSBndWVzdF9yZG1zcl92aXJpZGlhbih2
LCBtc3IsIHZhbCk7Cj4+ICsgICAgICAgICAgICBnb3RvIG91dDsKPj4gKyAgICAgICAgfQo+PiAr
Cj4+ICsgICAgICAgIC8qIEZhbGx0aHJvdWdoLiAqLwo+PiAgICAgIGRlZmF1bHQ6Cj4+ICAgICAg
ICAgIHJldHVybiBYODZFTVVMX1VOSEFORExFQUJMRTsKPj4gICAgICB9Cj4+ICAKPj4gLSAgICBy
ZXR1cm4gWDg2RU1VTF9PS0FZOwo+PiArIG91dDoKPiBJJ3ZlIG5vdGljZWQgdGhpcyBvbmx5IGlu
IHRoZSBjb250ZXh0IG9mIHBhdGNoIDQsIGJ1dCB3aHkgaXMgdGhpcyBsYWJlbAo+IGFuZCB5ZXQg
YW5vdGhlciB1bm5lY2Vzc2FyeSAiZ290byIgaGVyZT8gVGhhdCAiZ290byIgY291bGQgc2ltcGx5
Cj4gYmUgImJyZWFrIiBhZmFpY3MuCgpBaCAtIHRoYXQgaXMgZm9yIGNoYW5nZXMgd2hpY2ggSSBo
YXZlbid0IHBvc3RlZCB5ZXQuCgpXaGVuIHdlIGdldCBvbnRvIE1TUnMgd2hpY2ggbWlnaHQgYmUg
aW4gdGhlIGxvYWQvc2F2ZSBsaXN0cywgb3IgbWF5IGJlCnN0YXNoZWQgaW4gdGhlIFZNQ0IvVk1D
UyByYXRoZXIgdGhhbiBpbiByZWFsIGhhcmR3YXJlLCB3ZSBuZWVkIHRvIGNhbGwKYmFjayBpbnRv
IGFyY2ggc3BlY2lmaWMgY29kZSB3aGVuIGFuIHVwZGF0ZSBpcyBjb21wbGV0ZWQuCgp+QW5kcmV3
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
