From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 5/5] x86: Reorganise and rename debug
 register fields in struct vcpu
Date: Mon, 29 Oct 2018 11:46:21 +0000
Message-ID: <290c8f1b-087b-d9ca-651c-b7b88f3ca35b@citrix.com>
References: <1539599780-14549-1-git-send-email-andrew.cooper3@citrix.com>
 <1539599780-14549-6-git-send-email-andrew.cooper3@citrix.com>
 <5BD32F7602000078001F54A1@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <5BD32F7602000078001F54A1@prv1-mh.provo.novell.com>
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
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Xen-devel <xen-devel@lists.xen.org>, Jun Nakajima <jun.nakajima@intel.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Brian Woods <brian.woods@amd.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjYvMTAvMTggMTY6MTUsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDE1LjEwLjE4IGF0
IDEyOjM2LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3JvdGU6Cj4+IEBAIC05NzAsOSAr
OTcyLDEzIEBAIGludCBhcmNoX3NldF9pbmZvX2d1ZXN0KAo+PiAgICAgIHYtPmFyY2gucHYuY3Ry
bHJlZ1s0XSA9IGNyNCA/IHB2X2d1ZXN0X2NyNF9maXh1cCh2LCBjcjQpIDoKPj4gICAgICAgICAg
cmVhbF9jcjRfdG9fcHZfZ3Vlc3RfY3I0KG1tdV9jcjRfZmVhdHVyZXMpOwo+PiAgCj4+IC0gICAg
bWVtc2V0KHYtPmFyY2guZGVidWdyZWcsIDAsIHNpemVvZih2LT5hcmNoLmRlYnVncmVnKSk7Cj4+
IC0gICAgZm9yICggaSA9IDA7IGkgPCA4OyBpKysgKQo+PiAtICAgICAgICAodm9pZClzZXRfZGVi
dWdyZWcodiwgaSwgYyhkZWJ1Z3JlZ1tpXSkpOwo+PiArICAgIG1lbXNldCh2LT5hcmNoLmRyLCAw
LCBzaXplb2Yodi0+YXJjaC5kcikpOwo+PiArICAgIHYtPmFyY2guZHI2ID0gdi0+YXJjaC5kcjcg
PSB2LT5hcmNoLnB2LmRyN19lbXVsID0gMDsKPiBDb25zaWRlcmluZyB5b3VyIGVhcmxpZXIgY2hh
bmdlIHRvIGNvcnJlY3QgaW5pdGlhbCB2YWx1ZXMsIHdvdWxkbid0Cj4gaXQgYmUgYmV0dGVyIHRv
IHVzZSB0aGUgKG5vbi16ZXJvKSBkZWZhdWx0IHZhbHVlcyBoZXJlIHRvbywgZXZlbgo+IGlmIGR1
ZSB0byAuLi4KPgo+PiArICAgIGZvciAoIGkgPSAwOyBpIDwgQVJSQVlfU0laRSh2LT5hcmNoLmRy
KTsgaSsrICkKPj4gKyAgICAgICAgc2V0X2RlYnVncmVnKHYsIGksIGMoZGVidWdyZWdbaV0pKTsK
Pj4gKyAgICBzZXRfZGVidWdyZWcodiwgNiwgYyhkZWJ1Z3JlZ1s2XSkpOwo+PiArICAgIHNldF9k
ZWJ1Z3JlZyh2LCA3LCBjKGRlYnVncmVnWzddKSk7Cj4gLi4uIHRoaXMgZG9pbmcgc28gbWlnaHQg
YmUgYmVuaWduIGF0IHRoaXMgcG9pbnQgaW4gdGltZT8KCkFjdHVhbGx5LCBub3cgeW91IHBvaW50
IHRoaXMgb3V0LCBpdCBpcyBhIGxhdGVudCBidWcuwqAgSW5pdGlhbGlzaW5nIGRyNgp0byAwIGhl
cmUgbWVhbnMgdGhhdCBieSB0aGUgZW5kIG9mIHRoZSBzZXJpZXMsIHRoZSBEUjYgbWVyZ2UgbG9n
aWMgd2lsbApsZWF2ZSBSVE0gYXNzZXJ0ZWQuCgo+Cj4gV2l0aCBvciB3aXRob3V0IHRoaXMgYWRq
dXN0bWVudAo+IFJldmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgpU
aGFua3MuCgp+QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
