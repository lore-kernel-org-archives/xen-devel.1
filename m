From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH 1/3] x86/pv: Avoid locked bit manipulation
 in register_guest_callback()
Date: Tue, 20 Mar 2018 12:30:24 +0000
Message-ID: <20180320123024.pz7tozjnjhbdm4kz@MacBook-Pro-de-Roger.local>
References: <1521115122-15824-1-git-send-email-andrew.cooper3@citrix.com>
 <1521115122-15824-2-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Content-Disposition: inline
In-Reply-To: <1521115122-15824-2-git-send-email-andrew.cooper3@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Wei Liu <wei.liu2@citrix.com>, Jan Beulich <JBeulich@suse.com>, Xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBNYXIgMTUsIDIwMTggYXQgMTE6NTg6NDBBTSArMDAwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBDaGFuZ2VzIHRvIGFyY2gudmdjX2ZsYWdzIGFyZSBtYWRlIHRvIGN1cnJlbnQgaW4g
c3luY3Job25vdXMgY29udGV4dCBvbmx5LCBhbmQKPiBkb24ndCBuZWVkIHRvIGJlIGxvY2tlZC4g
IChUaGUgb25seSBvdGhlciBjaGFuZ2VzIGFyZSB2aWEKPiBhcmNoX3NldF9pbmZvX2d1ZXN0KCks
IHdoaWNoIG9wZXJhdGVzIG9uIGRlc2NoZWR1bGVkIHZjcHVzIG9ubHkpLgo+IAo+IFJlcGxhY2Ug
dGhlIHtzZXQsY2xlYXJ9X2JpdCgpIGNhbGxzIHdpdGggY29tcGlsZXItdmlzaWJsZSBiaXR3aXNl
IG9wZXJhdGlvbnMuCj4gCj4gU2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNv
b3BlcjNAY2l0cml4LmNvbT4KClJldmlld2VkLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5w
YXVAY2l0cml4LmNvbT4KClRoYW5rcywgUm9nZXIuCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
