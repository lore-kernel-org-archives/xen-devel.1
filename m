From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2 5/5] x86: Reorganise and rename debug
 register fields in struct vcpu
Date: Fri, 26 Oct 2018 09:15:02 -0600
Message-ID: <5BD32F7602000078001F54A1@prv1-mh.provo.novell.com>
References: <1539599780-14549-1-git-send-email-andrew.cooper3@citrix.com>
 <1539599780-14549-6-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1539599780-14549-6-git-send-email-andrew.cooper3@citrix.com>
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
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Xen-devel <xen-devel@lists.xen.org>, Jun Nakajima <jun.nakajima@intel.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Brian Woods <brian.woods@amd.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE1LjEwLjE4IGF0IDEyOjM2LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gQEAgLTk3MCw5ICs5NzIsMTMgQEAgaW50IGFyY2hfc2V0X2luZm9fZ3Vlc3QoCj4gICAg
ICB2LT5hcmNoLnB2LmN0cmxyZWdbNF0gPSBjcjQgPyBwdl9ndWVzdF9jcjRfZml4dXAodiwgY3I0
KSA6Cj4gICAgICAgICAgcmVhbF9jcjRfdG9fcHZfZ3Vlc3RfY3I0KG1tdV9jcjRfZmVhdHVyZXMp
Owo+ICAKPiAtICAgIG1lbXNldCh2LT5hcmNoLmRlYnVncmVnLCAwLCBzaXplb2Yodi0+YXJjaC5k
ZWJ1Z3JlZykpOwo+IC0gICAgZm9yICggaSA9IDA7IGkgPCA4OyBpKysgKQo+IC0gICAgICAgICh2
b2lkKXNldF9kZWJ1Z3JlZyh2LCBpLCBjKGRlYnVncmVnW2ldKSk7Cj4gKyAgICBtZW1zZXQodi0+
YXJjaC5kciwgMCwgc2l6ZW9mKHYtPmFyY2guZHIpKTsKPiArICAgIHYtPmFyY2guZHI2ID0gdi0+
YXJjaC5kcjcgPSB2LT5hcmNoLnB2LmRyN19lbXVsID0gMDsKCkNvbnNpZGVyaW5nIHlvdXIgZWFy
bGllciBjaGFuZ2UgdG8gY29ycmVjdCBpbml0aWFsIHZhbHVlcywgd291bGRuJ3QKaXQgYmUgYmV0
dGVyIHRvIHVzZSB0aGUgKG5vbi16ZXJvKSBkZWZhdWx0IHZhbHVlcyBoZXJlIHRvbywgZXZlbgpp
ZiBkdWUgdG8gLi4uCgo+ICsgICAgZm9yICggaSA9IDA7IGkgPCBBUlJBWV9TSVpFKHYtPmFyY2gu
ZHIpOyBpKysgKQo+ICsgICAgICAgIHNldF9kZWJ1Z3JlZyh2LCBpLCBjKGRlYnVncmVnW2ldKSk7
Cj4gKyAgICBzZXRfZGVidWdyZWcodiwgNiwgYyhkZWJ1Z3JlZ1s2XSkpOwo+ICsgICAgc2V0X2Rl
YnVncmVnKHYsIDcsIGMoZGVidWdyZWdbN10pKTsKCi4uLiB0aGlzIGRvaW5nIHNvIG1pZ2h0IGJl
IGJlbmlnbiBhdCB0aGlzIHBvaW50IGluIHRpbWU/CgpXaXRoIG9yIHdpdGhvdXQgdGhpcyBhZGp1
c3RtZW50ClJldmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgpKYW4K
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
