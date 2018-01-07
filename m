From: Matt Wilson <msw@amzn.com>
Subject: Re: [PATCH 22/22] vixen: dom0 builder support
Date: Sat, 6 Jan 2018 16:24:25 -0800
Message-ID: <20180107002425.GC13546@ued668862963453.ant.amazon.com>
References: <1515279277-16301-1-git-send-email-aliguori@amzn.com>
 <1515279277-16301-23-git-send-email-aliguori@amzn.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=rs9j=ec=amzn.com=prvs=538413ddc=msw@srs-us1.protection.inumbo.net>)
 id 1eXyla-0008H7-AG
 for xen-devel@lists.xenproject.org; Sun, 07 Jan 2018 00:24:46 +0000
Content-Disposition: inline
In-Reply-To: <1515279277-16301-23-git-send-email-aliguori@amzn.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Anthony Liguori <aliguori@amzn.com>
Cc: Wei Liu <wei.liu2@citrix.com>, Anthony Liguori <aliguori@amazon.com>, KarimAllah Ahmed <karahmed@amazon.de>, Andrew Cooper <andrew.cooper3@citrix.com>, Jan =?iso-8859-1?Q?H=2E_Sch=F6nherr?= <jschoenh@amazon.de>, Matt Wilson <msw@amazon.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gU2F0LCBKYW4gMDYsIDIwMTggYXQgMDI6NTQ6MzdQTSAtMDgwMCwgQW50aG9ueSBMaWd1b3Jp
IHdyb3RlOgo+IEZyb206IEFudGhvbnkgTGlndW9yaSA8YWxpZ3VvcmlAYW1hem9uLmNvbT4KPiAK
PiBUaGUgZG9tMCBidWlsZGVyIHJlcXVpcmVzIGEgbnVtYmVyIG9mIG1vZGlmaWNhdGlvbnMgaW4g
b3JkZXIgdG8gYmUKPiBhYmxlIHRvIGxhdW5jaCB1bnByaXZpbGVnZWQgZ3Vlc3RzLiAgVGhlIGNv
bnNvbGUgYW5kIHN0b3JlIHBhZ2VzCj4gbXVzdCBiZSBtYXBwZWQgaW4gYSBzcGVjaWZpYyBsb2Nh
dGlvbiB3aXRoaW4gdGhlIGd1ZXN0J3MgaW5pdGlhbAo+IHBhZ2UgdGFibGUuCj4gCj4gV2UgYWxz
byBoYXZlIHRvIHNldHVwIHRoZSBzdGFydCBpbmZvIHRvIGJlIHdoYXQncyBleHBlY3RlZCBmb3IK
PiB1bnByaXZpbGVnZWQgZ3Vlc3RzIGFuZCBzdXByZXNzIHRoZSBub3JtYWwgbG9naWMgdG8gZ2l2
ZSBkb20wCj4gaW5jcmVhc2VkIHBlcm1pc3Npb25zLgo+IAo+IFdlIGhhdmUgdG8gcGFzcyBhcm91
bmQgdGhlIGNvbnNvbGUgYW5kIHN0b3JlIHBhZ2VzIHdoaWNoIGludm9sdmVzCj4gdG91Y2hpbmcg
YSBudW1iZXIgb2YgcGxhY2VzIGluY2x1ZGluZyB0aGUgUFZIIGJ1aWxkZXIuCgpUaGVyZSBhcmUg
c29tZSB1bnJlc29sdmVkIGlzc3VlcyB0aGF0IGFyZSBpbnRyb2R1Y2VkIGJ5IGFwcGFyZW50CmRp
ZmZlcmVuY2VzIGluIGhvdyB0aGUgbGlieGMgZG9tYWluIGJ1aWxkZXIgYW5kIHRoZSBkb20wIGRv
bWFpbgpidWlsZGVyIGFycmFuZ2UgdGhpbmdzLCBpbiBwYXJ0aWN1bGFyIHRoZSBib290c3RyYXAg
cGFnZSB0YWJsZXMgYW5kCjMyLW9uLTY0IGNvbXBhdGliaWxpdHkgcGFnZSB0YWJsZSBmcmFtZXMu
IEFzIGlzLCB0aGlzIHNlZW1zIHRvCnByaW1hcmlseSBjYXVzZSBhbiBpbmNvbXBhdGliaWxpdHkg
d2l0aCAzMi1iaXQgUEFFIG1pbmktb3MgdGhhdCBtYWtlcwphc3N1bXB0aW9ucyBhYm91dCBob3cg
cGFnZSB0YWJsZXMgYXJlIGFsbG9jYXRlZCBhdCBzdGFydCBvZiBkYXkKKGFscmVhZHkgZml4ZWQg
YnkgWzFdKS4KClByYWN0aWNhbGx5IHNwZWFraW5nLCB0aGlzIG1lYW5zIHRoYXQgZXhpc3Rpbmcg
YnVnZ3kgUFYtR1JVQiBpbWFnZXMKZGllIGVhcmx5IGluIE1NIHNldHVwIHdoZW4gbG9hZGVkIGFz
IHRoZSBkb20xIGtlcm5lbCBmb3IgVml4ZW4uCgotLW1zdwoKWzFdIGh0dHA6Ly94ZW5iaXRzLnhl
bi5vcmcvZ2l0d2ViLz9wPW1pbmktb3MuZ2l0O2E9Y29tbWl0ZGlmZjtoPThkODQzNDVhMjBkOGE0
NmVhMjYzNzljOWYxOTk2MWY2YWEzZTZlODMKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
