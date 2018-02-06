From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] x86/nmi: lower initial watchdog frequency
 to avoid boot hangs
Date: Tue, 06 Feb 2018 09:07:23 -0700
Message-ID: <5A79E0CB02000078001A5BBA@prv-mh.provo.novell.com>
References: <1517865522-3248-1-git-send-email-igor.druzhinin@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1517865522-3248-1-git-send-email-igor.druzhinin@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Igor Druzhinin <igor.druzhinin@citrix.com>
Cc: andrew.cooper3@citrix.com, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA1LjAyLjE4IGF0IDIyOjE4LCA8aWdvci5kcnV6aGluaW5AY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gLS0tIGEveGVuL2FyY2gveDg2L25taS5jCj4gKysrIGIveGVuL2FyY2gveDg2L25taS5j
Cj4gQEAgLTM0LDcgKzM0LDggQEAKPiAgI2luY2x1ZGUgPGFzbS9hcGljLmg+Cj4gIAo+ICB1bnNp
Z25lZCBpbnQgbm1pX3dhdGNoZG9nID0gTk1JX05PTkU7Cj4gLXN0YXRpYyB1bnNpZ25lZCBpbnQg
bm1pX2h6ID0gSFo7Cj4gKy8qIGluaXRpYWwgd2F0Y2hkb2cgZnJlcXVlbmN5IC0gc2hvdWxkbid0
IGJlIHRvbyBoaWdoIHRvIGF2b2lkIGJvb3QgaGFuZ3MgKi8KPiArc3RhdGljIHVuc2lnbmVkIGlu
dCBubWlfaHogPSBIWiAvIDEwOwoKRm9yIG9uZSAtIHRoZSBjb21tZW50IHNob3VsZCBleHBsYWlu
IHdoYXQgInRvbyBoaWdoIiBtZWFucy4KRnVydGhlciAtIHdoYXQgaWYgb24gYW5vdGhlciBzeXN0
ZW0gMTBIeiBpcyBzdGlsbCB0b28gaGlnaD8gSSBhbHNvIGhvcGUKeW91IHJlYWxpemUgdGhhdCB5
b3Ugc2xvdyBkb3duIGJvb3QgYSBsaXR0bGUgZm9yIGV2ZXJ5b25lIGp1c3QKYmVjYXVzZSBvZiB0
aGlzIG9uZSBtYWNoaW5lIG1vZGVsLiBDYW4gdGhlIGxvd2VyIGZyZXF1ZW5jeSBwZXJoYXBzCmJl
IHNldCB2aWEgRE1JIHF1aXJrLCBvciBvdGhlcndpc2Ugb2J0YWluIGEgY29tbWFuZCBsaW5lIG92
ZXJyaWRlCihwZXJoYXBzIHNvbWV0aGluZyBsaWtlICJ3YXRjaGRvZz1wcm9iZToxMEh6Iik/CgpK
YW4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
