From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH v4 0/8] x86: Meltdown band-aid overhead reduction
Date: Mon, 19 Mar 2018 07:32:02 -0600
Message-ID: <5AAFC9E202000078001B36F7@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=eu9s=gj=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1exutV-0001Uf-04
 for xen-devel@lists.xenproject.org; Mon, 19 Mar 2018 13:32:09 +0000
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel <xen-devel@lists.xenproject.org>
Cc: Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

MTogTk9QIG91dCBtb3N0IFhQVEkgZW50cnkvZXhpdCBjb2RlIHdoZW4gaXQncyBub3QgaW4gdXNl
CjI6IGRpc2FibGUgWFBUSSB3aGVuIFJEQ0xfTk8KMzogeDg2OiBsb2cgWFBUSSBlbmFibGVkIHN0
YXR1cwo0OiB1c2UgJXIxMiB0byB3cml0ZSB6ZXJvIGludG8geGVuX2NyMwo1OiByZWR1Y2UgLnRl
eHQuZW50cnkKNjogZW5hYmxlIGludGVycnVwdHMgZWFybGllciB3aXRoIFhQVEkgZGlzYWJsZWQK
NzogYWxzbyBOT1Agb3V0IHhlbl9jcjMgcmVzdG9yZXMgb2YgWFBUSQo4OiBhdm9pZCBkb3VibGUg
Q1IzIHJlbG9hZCB3aGVuIHN3aXRjaGluZyB0byBndWVzdCB1c2VyIG1vZGUKClNpZ25lZC1vZmYt
Ynk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KLS0tCnY0OiBNYWluIGNoYW5nZSBp
cyB0aGUgc3BsaXQgb2YgcGF0Y2ggMS4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
