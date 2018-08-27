From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH RESEND v3 1/2] x86/mmcfg: Rename
 pt_pci_init() and call it in acpi_mmcfg_init()
Date: Mon, 27 Aug 2018 02:16:11 -0600
Message-ID: <5B83B34B02000078001E2048@prv1-mh.provo.novell.com>
References: <2a59b3e6-692d-45ee-aedb-0ddcb280602c@default>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <2a59b3e6-692d-45ee-aedb-0ddcb280602c@default>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Zhenzhong Duan <zhenzhong.duan@oracle.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-Devel <xen-devel@lists.xen.org>, manoj.gopalasetty@hpe.com, david.westwood@hpe.com, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Srinivas REDDY Eeda <srinivas.eeda@oracle.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIyLjA4LjE4IGF0IDExOjE2LCA8emhlbnpob25nLmR1YW5Ab3JhY2xlLmNvbT4gd3Jv
dGU6Cj4gR2l2ZW4gd2hhdCBwdF9wY2lfaW5pdCgpIGFjdHVhbGx5IGRvZXMsIHJlbmFtZSBpdCBw
cm9wZXJseSBhbmQgbW92ZSBpdHMKPiBkZWNsYXJhdGlvbiB0byBwY2kuaCwgbW92ZSB0aGUgb25s
eSBjYWxsIGluIGFjcGlfbW1jZmdfaW5pdCgpLgo+IAo+IE5vIGZ1bmN0aW9uYWwgY2hhbmdlLgo+
IAo+IFNpZ25lZC1vZmYtYnk6IFpoZW56aG9uZyBEdWFuIDx6aGVuemhvbmcuZHVhbkBvcmFjbGUu
Y29tPgo+IFRlc3RlZC1ieTogR29wYWxhc2V0dHksIE1hbm9qIDxtYW5vai5nb3BhbGFzZXR0eUBo
cGUuY29tPgo+IEFja2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgpQbGVh
c2UgYXZvaWQgbmVlZGxlc3MgcmUtc2VuZGluZyBvZiBwYXRjaGVzIHRoYXQgaGF2ZSBhbHJlYWR5
CmdvbmUgaW4uIFJvZ2VyJ3MgcmVtYXJrIHJlZ2FyZGluZyB0aGUgcXVlc3Rpb25hYmxlIHNvbGl0
YXJ5IHYzCjIvMiB3YXMgY29ycmVjdCwganVzdCB0aGF0IHlvdSBzaG91bGQgaGF2ZSBkcm9wcGVk
IHRoZSAyLzIKaW5zdGVhZCBvZiByZS1zZW5kaW5nIGFuIGFscmVhZHkgYXBwbGllZCBwYXRjaC4K
CkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
