From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 1/3] x86/pv: Avoid locked bit manipulation
 in register_guest_callback()
Date: Mon, 19 Mar 2018 10:59:57 -0600
Message-ID: <5AAFFA9D02000078001B3961@prv-mh.provo.novell.com>
References: <1521115122-15824-1-git-send-email-andrew.cooper3@citrix.com>
 <1521115122-15824-2-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1521115122-15824-2-git-send-email-andrew.cooper3@citrix.com>
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
Cc: Xen-devel <xen-devel@lists.xen.org>, Wei Liu <wei.liu2@citrix.com>, =?UTF-8?Q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE1LjAzLjE4IGF0IDEyOjU4LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gQ2hhbmdlcyB0byBhcmNoLnZnY19mbGFncyBhcmUgbWFkZSB0byBjdXJyZW50IGluIHN5
bmNyaG9ub3VzIGNvbnRleHQgb25seSwgYW5kCj4gZG9uJ3QgbmVlZCB0byBiZSBsb2NrZWQuICAo
VGhlIG9ubHkgb3RoZXIgY2hhbmdlcyBhcmUgdmlhCj4gYXJjaF9zZXRfaW5mb19ndWVzdCgpLCB3
aGljaCBvcGVyYXRlcyBvbiBkZXNjaGVkdWxlZCB2Y3B1cyBvbmx5KS4KPiAKPiBSZXBsYWNlIHRo
ZSB7c2V0LGNsZWFyfV9iaXQoKSBjYWxscyB3aXRoIGNvbXBpbGVyLXZpc2libGUgYml0d2lzZSAK
PiBvcGVyYXRpb25zLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5j
b29wZXIzQGNpdHJpeC5jb20+CgpSZXZpZXdlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1
c2UuY29tPgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
