From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] x86/spec-ctrl: Fix the parsing of xpti= on
 fixed Intel hardware
Date: Mon, 23 Jul 2018 16:22:11 +0200
Message-ID: <f38b5696-4f68-597c-a2f6-f1cc12b41688@suse.com>
References: <1532353682-28335-1-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1532353682-28335-1-git-send-email-andrew.cooper3@citrix.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel <xen-devel@lists.xen.org>
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjMvMDcvMTggMTU6NDgsIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4gVGhlIGNhbGxzIHRvIHhw
dGlfaW5pdF9kZWZhdWx0KCkgaW4gcGFyc2VfeHB0aSgpIGFyZSBidWdneS4gIFRoZSBDUFVJRCBk
YXRhCj4gaGFzbid0IGJlZW4gZmV0Y2hlZCB0aGF0IGVhcmx5LCBhbmQgYm9vdF9jcHVfaGFzKFg4
Nl9GRUFUVVJFX0FSQ0hfQ0FQUykgd2lsbAo+IGFsd2F5cyBldmFsdWF0ZSBmYWxzZS4KPiAKPiBB
cyBhIHJlc3VsdCwgdGhlIGRlZmF1bHQgY2FzZSB3b24ndCBkaXNhYmxlIFhQVEkgb24gSW50ZWwg
aGFyZHdhcmUgd2hpY2gKPiBhZHZlcnRpc2VzIEFSQ0hfQ0FQQUJJTElUSUVTX1JEQ0xfTk8uCj4g
Cj4gU2ltcGxpZnkgcGFyc2VfeHB0aSgpIHRvIHNvbGVseSB0aGUgc2V0dGluZyBvZiBvcHRfeHB0
aSBhY2NvcmRpbmcgdG8gdGhlCj4gcGFzc2VkIHN0cmluZywgYW5kIGhhdmUgaW5pdF9zcGVjdWxh
dGlvbl9taXRpZ2F0aW9ucygpIGNhbGwKPiB4cHRpX2luaXRfZGVmYXVsdCgpIGlmIGFwcHJvcGlh
dGUuICBEcm9wIHRoZSBmb3JjZSBwYXJhbWV0ZXIsIGFuZCBwYXNzIGNhcHMKPiBpbnN0ZWFkLCB0
byBhdm9pZCByZWR1bmRhbnQgcmUtcmVhZGluZyBvZiBNU1JfQVJDSF9DQVBTLgo+IAo+IFNpZ25l
ZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+CgpSZXZp
ZXdlZC1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgoKCkp1ZXJnZW4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
