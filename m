From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH v2 5/5] x86: Reorganise and rename debug
 register fields in struct vcpu
Date: Mon, 15 Oct 2018 16:18:05 +0200
Message-ID: <20181015141805.rg7o6l6sk73pwo3b@mac.bytemobile.com>
References: <1539599780-14549-1-git-send-email-andrew.cooper3@citrix.com>
 <1539599780-14549-6-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Content-Disposition: inline
In-Reply-To: <1539599780-14549-6-git-send-email-andrew.cooper3@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <JBeulich@suse.com>, Xen-devel <xen-devel@lists.xen.org>, Jun Nakajima <jun.nakajima@intel.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Brian Woods <brian.woods@amd.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBPY3QgMTUsIDIwMTggYXQgMTE6MzY6MjBBTSArMDEwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBSZXVzaW5nIGRlYnVncmVnWzVdIGZvciB0aGUgUFYgZW11bGF0ZWQgSU8gYnJlYWtw
b2ludCBpbmZvcm1hdGlvbiBpcyBjb25mdXNpbmcKPiB0byByZWFkLiAgSW5zdGVhZCwgaW50cm9k
dWNlIGEgZHI3X2VtdWwgZmllbGQgaW4gcHZfdmNwdSBmb3IgdGhlIHB1cG9zZS4KPiAKPiBXaXRo
IHRoZSBQViBlbXVsYXRpb24gb3V0IG9mIHRoZSB3YXksIGRlYnVncmVnWzQsNV0gYXJlIGVudGly
ZWx5IHVudXNlZCBhbmQKPiBkb24ndCBuZWVkIHRvIGJlIHN0b3JlZC4KPiAKPiBSZW5hbWUgZGVi
dWdyZWdbMC4uM10gdG8gZHJbMC4uM10gdG8gcmVkdWNlIGNvZGUgdm9sdW1lLCBidXQga2VlcCB0
aGVtIGFzIGFuCj4gYXJyYXkgYmVjYXVzZSB0aGVpciBiZWhhdmlvdXIgaXMgaWRlbnRpY2FsIGFu
ZCB0aGlzIGhlbHBzIHNpbXBsZnkgc29tZSBvZiB0aGUKPiBQViBoYW5kbGluZy4gIEludHJvZHVj
ZSBkcjYgYW5kIGRyNyBmaWVsZHMgdG8gcmVwbGFjZSBkZWJ1Z3JlZ1s2LDddIHdoaWNoCj4gcmVt
b3ZlcyB0aGUgc3RvcmFnZSBmb3IgZGVidWdyZWdbNCw1XS4KPiAKPiBJbiBhcmNoX2dldF9pbmZv
X2d1ZXN0KCksIGhhbmRsZSB0aGUgbWVyZ2luZyBvZiBlbXVsYXRlZCBkcjcgc3RhdGUgYWxvbmdz
aWRlCj4gYWxsIG90aGVyIGRyIGhhbmRsaW5nLCByYXRoZXIgdGhhbiBtdWNoIGxhdGVyLgo+IAo+
IFNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+
CgpSZXZpZXdlZC1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+CgpU
aGFua3MuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
