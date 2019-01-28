From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH for-4.12] x86/hvm: Fix
 hvm_cr4_guest_valid_bits() for PVH dom0
Date: Mon, 28 Jan 2019 15:22:09 +0000
Message-ID: <20190128152209.5gugm3k3bkqxknzx@zion.uk.xensource.com>
References: <1548683789-21610-1-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Content-Disposition: inline
In-Reply-To: <1548683789-21610-1-git-send-email-andrew.cooper3@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Juergen Gross <jgross@suse.com>, Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <JBeulich@suse.com>, Xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBKYW4gMjgsIDIwMTkgYXQgMDE6NTY6MjlQTSArMDAwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBCZWZvcmUgdGhlIGNwdWlkX3BvbGljeSBsb2dpYyBjYW1lIGFsb25nLCAlY3I0IGF1
ZGl0aW5nIG9uIG1pZ3JhdGUtaW4gd2FzCj4gY29tcGxpY2F0ZWQsIGJlY2F1c2UgYXQgdGhhdCBw
b2ludCBubyBDUFVJRCBpbmZvcm1hdGlvbiBoYWQgYmVlbiBzZXQgZm9yIHRoZQo+IGd1ZXN0LiAg
QXVkaXRpbmcgYWdhaW5zdCB0aGUgaG9zdCBDUFVJRCB3YXMgYmV0dGVyIHRoYW4gbm90aGluZywg
YnV0IG5vdAo+IGlkZWFsLgo+IAo+IE9yZGVyIG9mIGluZm9ybWF0aW9uIGluIHRoZSBtaWdyYXRp
b24gc3RyZWFtIGlzIHN0aWxsIGFuIGlzc3VlIChoZW5jZSB3ZSBzdGlsbAo+IG5lZWQgdG8ga2Vl
cCB0aGUgcmVzdG9yZSBwYXJhbWV0ZXIgdG8gY29wZSB3aXRoIGEgbmVzdGVkIHZpcnQgY29ybmVy
IGNhc2UpLAo+IGJ1dCBzaW5jZSBYZW4gNC45LCB0aGUgZG9tYWluIHN0YXJ0cyB3aXRoIHRoZSBh
cHBsaWNhYmxlIG1heCBwb2xpY3ksIHdoaWNoIGlzCj4gYSBtb3JlIGFwcHJvcHJpYXRlIHVwcGVy
IGJvdW5kIHRoYW4gdGhlIGhvc3QgY3B1aWQgcG9saWN5Lgo+IAo+IFRoaXMgYWxzbyBtYWtlcyB0
aGUgZml4IGZyb20gYy9zIDlkMmVmYmFmYjggb2Jzb2xldGUsIGFzIG5vdCBldmVuIGRvbTAgc3Rh
cnRzCj4gd2l0aG91dCBhIHBvbGljeS4KPiAKPiBGaW5hbGx5LCByZXBvc2l0aW9uIHRoZSBVTUlQ
IGxvZ2ljIGFzIGl0IGlzIHRoZSBvbmx5IHJvdyBvdXQgb2Ygb3JkZXIuCj4gCj4gU2lnbmVkLW9m
Zi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KCkl0IGlzIGlu
ZGVlZCB0aGUgY2FzZSB0aGF0IGFsbCB4ODYgZG9tYWlucyB3aWxsIGdldCBhIGNwdWlkIHBvbGlj
eSwKYXVkaXRpbmcgYWdhaW5zdCB0aGF0IG1ha2VzIG1vcmUgc2Vuc2UuIEJ1dCB3aGF0IGFib3V0
IGNvZGUgaW4KaHZtX2VmZXJfdmFsaWQ/IFdoeSBkaWRuJ3QgeW91IG1ha2UgaXQgd29yayB3aXRo
IGFyY2guY3B1aWQ/CgpXZWkuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
