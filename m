From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] libx86: Work around GCC bug with ebx output
 constrants
Date: Mon, 19 Nov 2018 13:29:55 +0000
Message-ID: <f0b3c2fb-8d31-7e79-c666-4d5b8d7153eb@citrix.com>
References: <1542633088-11101-1-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1542633088-11101-1-git-send-email-andrew.cooper3@citrix.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Xen-devel <xen-devel@lists.xen.org>
Cc: Wei Liu <wei.liu2@citrix.com>, Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTkvMTEvMjAxOCAxMzoxMSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBTb21lIHZlcnNpb25z
IG9mIEdDQyBjYW4ndCBjb21waWxlIGNwdWlkLmMsIGFuZCBmYWlsIHdpdGggdGhlIHJhdGhlciBj
cnlwdGljOgo+Cj4gICBJbiBmaWxlIGluY2x1ZGVkIGZyb20gbGliL3g4Ni9jcHVpZC5jOjM6MDoK
PiAgIGxpYi94ODYvY3B1aWQuYzogSW4gZnVuY3Rpb24g4oCYeDg2X2NwdWlkX3BvbGljeV9maWxs
X25hdGl2ZeKAmToKPiAgIGluY2x1ZGUveGVuL2xpYi94ODYvY3B1aWQuaDoyNTo1OiBlcnJvcjog
aW5jb25zaXN0ZW50IG9wZXJhbmQgY29uc3RyYWludHMgaW4gYW4g4oCYYXNt4oCZCj4gICAgICAg
IGFzbSAoICJjcHVpZCIKPiAgICAgICAgXgo+Cj4gSW4gcHJhY3RpY2UsIHRoaXMgaXMgYSBjb2xs
aXNpb24gYmV0d2VlbiB0aGUgb3V0cHV0IGNvbnN0cmFpbnQgYW5kIHRoZSBHT1QKPiB3aGljaCBp
cyBoZWxkIGluICVlYnggd2hlbiBjb21waWxpbmcgd2l0aCAtZlBJQyBmb3IgbGlicmFyaWVzLgo+
Cj4gVGhpcyBhZmZlY3RzIGF0IGxlYXN0IEdDQyA0LjkgYXMgc2hpcHBlZCBpbiBEZWJpYW4gSmVz
c2llLCBidXQgZXhwZXJpbWVudGFsbHkKPiBpcyBmaXhlZCBpbiBHQ0MgNiBhbmQgbGF0ZXIuICBD
dXJpb3VzbHksIGl0IG9ubHkgYWZmZWN0cyAzMi1iaXQgYnVpbGRzLgoKQWN0dWFsbHksIGhhdmlu
ZyBqdXN0IGdvdCBHQ0MgNSB3b3JraW5nLCB0aGF0IGlzIGFsc28gZmluZS7CoCBJJ2xsIGFkanVz
dAp0aGUgd29yZGluZy9jaGVjaywgYnV0IHdvbid0IGJvdGhlciBwb3N0aW5nIGEgdjIgaWYgdGhh
dCBpcyB0aGUgb25seSBjaGFuZ2UuCgp+QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
