From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 2/3] x86/pv: Fold
 {compat_}unregister_guest_callback() into its non-compat counterpart
Date: Mon, 19 Mar 2018 11:05:02 -0600
Message-ID: <5AAFFBCE02000078001B3983@prv-mh.provo.novell.com>
References: <1521115122-15824-1-git-send-email-andrew.cooper3@citrix.com>
 <1521115122-15824-3-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1521115122-15824-3-git-send-email-andrew.cooper3@citrix.com>
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
dGU6Cj4gVGhlc2UgZnVuY3Rpb25zIGFyZSBhbG1vc3QgaWRlbnRpY2FsLiAgVGhleSBkaWZmZXIg
b25seSBpbiB0aGUgZXJyb3IgZW1pdHRlZAo+IGZvciB0aGUgdXNlIG9mIENBTExCQUNLVFlQRV9z
eXNjYWxsICh3aGljaCBpcyBpbmNvbnNlcXVlbnRpYWwgdG8gZ3Vlc3RzKSwKCkknbSBub3QgZW50
aXJlbHkgY29udmluY2VkIC0gc28gZmFyIHRoZXJlJ3MgYmVlbiBhIG1hdGNoIGhlcmUgYmV0d2Vl
bgptYXAgYW5kIHVubWFwLCBpLmUuIHdpdGggdGhlIGNoYW5nZSBpdCBtYXkgYmUgYWR2aXNhYmxl
IGZvcgpjb21wYXRfcmVnaXN0ZXJfZ3Vlc3RfY2FsbGJhY2soKSB0byBhbHNvIHJldHVybiAtRUlO
VkFMIGZvcgpDQUxMQkFDS1RZUEVfc3lzY2FsbC4gSG93ZXZlciwgSSBkb24ndCBmZWVsIHN0cm9u
Z2x5IGFib3V0IHRoaXMsIHNvCmVpdGhlciB3YXkgLi4uCgo+IGFuZAo+IHRoZSB0eXBlIG9mIHRo
ZWlyIGFyZ3VtZW50Lgo+IAo+IEhhdmUgdGhlIGNhbGxlcnMgcGFzcyB0aGUgdW5yZWcudHlwZSBw
YXJhbWV0ZXIgZGlyZWN0bHksIGF2b2lkaW5nIHRoZSBuZWVkIGZvcgo+IGRpZmZlcmVudGx5IHR5
cGVkIHBhcmFtZXRlcnMuCj4gCj4gU2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3
LmNvb3BlcjNAY2l0cml4LmNvbT4KCkFja2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3Vz
ZS5jb20+CgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
