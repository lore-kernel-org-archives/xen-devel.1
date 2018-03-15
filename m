From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] x86: vlapic: Clear vector's TMR bit upon
 acceptance of edge-triggered interrupt to IRR
Date: Thu, 15 Mar 2018 02:39:34 -0600
Message-ID: <5AAA3F5602000078001B1F5B@prv-mh.provo.novell.com>
References: <1521070556-6795-1-git-send-email-liran.alon@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1521070556-6795-1-git-send-email-liran.alon@oracle.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>, Liran Alon <liran.alon@oracle.com>
Cc: andrew.cooper3@citrix.com, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE1LjAzLjE4IGF0IDAwOjM1LCA8bGlyYW4uYWxvbkBvcmFjbGUuY29tPiB3cm90ZToK
PiBBY2NvcmRpbmcgdG8gSW50ZWwgU0RNIDEwLjguNCBJbnRlcnJ1cHQgQWNjZXB0YW5jZSBmb3Ig
Rml4ZWQgSW50ZXJydXB0czoKPiAiVGhlIHRyaWdnZXIgbW9kZSByZWdpc3RlciAoVE1SKSBpbmRp
Y2F0ZXMgdGhlIHRyaWdnZXIgbW9kZSBvZiB0aGUKPiBpbnRlcnJ1cHQgKHNlZSBGaWd1cmUgMTAt
MjApLiBVcG9uIGFjY2VwdGFuY2Ugb2YgYW4gaW50ZXJydXB0Cj4gaW50byB0aGUgSVJSLCB0aGUg
Y29ycmVzcG9uZGluZyBUTVIgYml0IGlzIGNsZWFyZWQgZm9yCj4gZWRnZS10cmlnZ2VyZWQgaW50
ZXJydXB0cyBhbmQgc2V0IGZvciBsZXZlbC10cmlnZ2VyZWQgaW50ZXJydXB0cy4KPiBJZiBhIFRN
UiBiaXQgaXMgc2V0IHdoZW4gYW4gRU9JIGN5Y2xlIGZvciBpdHMgY29ycmVzcG9uZGluZwo+IGlu
dGVycnVwdCB2ZWN0b3IgaXMgZ2VuZXJhdGVkLCBhbiBFT0kgbWVzc2FnZSBpcyBzZW50IHRvCj4g
YWxsIEkvTyBBUElDcy4iCj4gCj4gQmVmb3JlIHRoaXMgcGF0Y2ggVE1SLWJpdCB3YXMgY2xlYXJl
ZCBvbiBMQVBJQyBFT0kgd2hpY2ggaXMgbm90IHdoYXQKPiByZWFsIGhhcmR3YXJlIGRvZXMuIFRo
aXMgd2FzIGFsc28gY29uZmlybWVkIGluIEtWTSB1cHN0cmVhbSBjb21taXQKPiBhMGM5YTgyMmJm
MzcgKCJLVk06IGRvbnQgY2xlYXIgVE1SIG9uIEVPSSIpLgo+IAo+IEJlaGF2aW9yIGFmdGVyIHRo
aXMgcGF0Y2ggaXMgYWxpZ25lZCB3aXRoIGJvdGggSW50ZWwgU0RNIGFuZCBLVk0KPiBpbXBsZW1l
bnRhdGlvbi4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBMaXJhbiBBbG9uIDxsaXJhbi5hbG9uQG9yYWNs
ZS5jb20+Cj4gUmV2aWV3ZWQtYnk6IEJvcmlzIE9zdHJvdnNreSA8Ym9yaXMub3N0cm92c2t5QG9y
YWNsZS5jb20+Cj4gU2lnbmVkLW9mZi1ieTogQm9yaXMgT3N0cm92c2t5IDxib3Jpcy5vc3Ryb3Zz
a3lAb3JhY2xlLmNvbT4KCkJvcmlzIC0gd2hpY2ggb2YgdGhlIHR3byB0YWdzIGlzIHRoZSBjb3Jy
ZWN0IG9uZT8KClJldmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgpK
YW4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
