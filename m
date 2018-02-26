From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 2/5] x86/pv: Avoid leaking other guests'
 MSR_TSC_AUX values into PV context
Date: Mon, 26 Feb 2018 04:25:36 -0700
Message-ID: <5A93FCC002000078001ABB41@prv-mh.provo.novell.com>
References: <1519127923-23539-1-git-send-email-andrew.cooper3@citrix.com>
 <1519127923-23539-3-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1519127923-23539-3-git-send-email-andrew.cooper3@citrix.com>
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
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>, SuraveeSuthikulpanit <suravee.suthikulpanit@amd.com>, Xen-devel <xen-devel@lists.xen.org>, Jun Nakajima <jun.nakajima@intel.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, =?UTF-8?Q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIwLjAyLjE4IGF0IDEyOjU4LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gSWYgdGhlIENQVSBwaXBlbGluZSBzdXBwb3J0cyBSRFRTQ1Agb3IgUkRQSUQsIGEgZ3Vl
c3QgY2FuIG9ic2VydmUgdGhlIHZhbHVlIGluCj4gTVNSX1RTQ19BVVgsIGlycmVzcGVjdGl2ZSBv
ZiB3aGV0aGVyIHRoZSByZWxldmFudCBDUFVJRCBmZWF0dXJlcyBhcmUKPiBhZHZlcnRpc2VkL2hp
ZGRlbi4KPiAKPiBBdCB0aGUgbW9tZW50LCBwYXJhdmlydF9jdHh0X3N3aXRjaF90bygpIG9ubHkg
d3JpdGVzIHRvIE1TUl9UU0NfQVVYIGlmCj4gVFNDX01PREVfUFZSRFRTQ1AgbW9kZSBpcyBlbmFi
bGVkLCBidXQgdGhpcyBpcyBub3QgdGhlIGRlZmF1bHQgbW9kZS4KPiBUaGVyZWZvcmUsIGRlZmF1
bHQgUFYgZ3Vlc3RzIGNhbiByZWFkIHRoZSB2YWx1ZSBmcm9tIGEgcHJldmlvdXNseSBzY2hlZHVs
ZWQKPiBIVk0gdmNwdSwgb3IgVFNDX01PREVfUFZSRFRTQ1AtZW5hYmxlZCBQViBndWVzdC4KPiAK
PiBBbHRlciB0aGUgUFYgcGF0aCB0byBhbHdheXMgd3JpdGUgdG8gTVNSX1RTQ19BVVgsIHVzaW5n
IDAgaW4gdGhlIGNvbW1vbiAKPiBjYXNlLgo+IAo+IFRvIGFtb3J0aXNlIG92ZXJoZWFkIGNvc3Qs
IGludHJvZHVjZSB3cm1zcl90c2NfYXV4KCkgd2hpY2ggcGVyZm9ybXMgYSBsYXp5Cj4gdXBkYXRl
IG9mIHRoZSBNU1IsIGFuZCB1c2UgdGhpcyBmdW5jdGlvbiBjb25zaXN0ZW50bHkgYWNyb3NzIHRo
ZSBjb2RlYmFzZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29v
cGVyM0BjaXRyaXguY29tPgoKRGVzcGl0ZSBtZSBjb250aW51aW5nIHRvIHRoaW5rIHRoYXQgUkRU
U0NQIGFuZCBSRFBJRCBzaG91bGQgYmUKZnVsbHkgaW5kZXBlbmRlbnQgZmVhdHVyZXMsIHRoaXMg
YmVpbmcgaW4gbGluZSB3aXRoIHRoZSBTRE06CkFja2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxp
Y2hAc3VzZS5jb20+CgpKYW4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
