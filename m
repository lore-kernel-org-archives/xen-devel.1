From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH RFC 4/4] xen: use per-vcpu TSS and stacks
	for pv domains
Date: Wed, 10 Jan 2018 10:40:05 +0000
Message-ID: <ce0f9f83-2f5e-c236-bb3e-8f77915f92b1@citrix.com>
References: <20180109142700.12028-1-jgross@suse.com>
 <20180109142700.12028-5-jgross@suse.com>
 <3430712a-6b57-fd55-5cf0-727f9817d7da@citrix.com>
 <17111fe9-68d8-5082-385c-caa87e14d6eb@suse.com>
 <5d67a75de9f14baaa48d71a5dcda5720@AMSPEX02CL02.citrite.net>
 <84daf496-aae7-3f14-16f4-b0c600347ef8@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=vr7g=ef=citrix.com=prvs=5411dcb8f=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1eZDnk-0001FO-Nc
 for xen-devel@lists.xenproject.org; Wed, 10 Jan 2018 10:40:08 +0000
In-Reply-To: <84daf496-aae7-3f14-16f4-b0c600347ef8@suse.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Ian Jackson <Ian.Jackson@citrix.com>, "jbeulich@suse.com" <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDkvMDEvMTggMTk6MzksIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4gT24gMDkvMDEvMTggMjA6
MTMsIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4+IChzb3JyeSBmb3IgdGhlIHRvcC1wb3N0LiBJJ20g
b24gbXkgcGhvbmUpIAo+Pgo+PiBJIGNhbiBzZWUgeW91IGFyZSB1c2luZyBsdHIsIGJ1dCBJIGRv
bid0IHNlZSBhbnl3aGVyZSB3aGVyZSB3aGVyZSB5b3UgYXJlIGNoYW5naW5nIHRoZSBjb250ZW50
IG9uIHRoZSBUU1MsIG9yIHRoZSB0b3Atb2Ytc3RhY2sgY29udGVudC4KPiBUaGUgcGVyLXZjcHUg
VFNTIGlzIGFscmVhZHkgaW5pdGlhbGl6ZWQgd2l0aCB0aGUgY29ycmVjdCBzdGFjawo+IGFkZHJl
c3Nlcywgc28gaXQgZG9lc24ndCBoYXZlIHRvIGJlIG1vZGlmaWVkIGxhdGVyLgo+Cj4+IEl0IGlz
IHZlcnkgY29tcGxpY2F0ZWQgdG8gc2FmZWx5IHN3aXRjaCBJU1Qgc3RhY2tzIHdoZW4geW91IG1p
Z2h0IGJlIHRha2luZyBpbnRlcnJ1cHRzLgo+IFVzaW5nIExUUiB3aXRoIGEgbmV3IFRTUyB3aXRo
IGJvdGggc3RhY2sgYXJlYXMgbWFwcGVkIChvbGQgYW5kIG5ldykKPiBzaG91bGQgd29yaywgcmln
aHQ/CgpUaGUgdG9wLW9mLXN0YWNrIGJsb2NrIGhhcyBwY3B1IGluZm9ybWF0aW9uIG9uIGl0LCBp
bmNsdWRpbmcKc21wX3Byb2Nlc3Nvcl9pZCgpIGFuZCBwZXJ2Y3B1X29mZnNldC7CoCBTd2l0Y2hp
bmcgdGhlIGNyNCBzaGFkb3cgd2l0aG91dApoaXR0aW5nIGFuIGFzc2VydCBpcyB0cmlja3ksIGFu
ZCB3YXMgbGVmdCB3aXRoIGEgcmF0aGVyIGxhcmdlIFJGQy9UT0RPCmluIG15IHByZS1rYWlzZXIg
c2VyaWVzLgoKVGhlIHN5c2NhbGwgc3R1YnMgY29udGFpbiBhYnNvbHV0ZSBzdGFjayByZWZlcmVu
Y2VzIGluIHRoZW0sIHNvIGF0IGEKbWluaW11bSB0aGV5IGFsc28gbmVlZCByZXdyaXRpbmcgb24g
Y29udGV4dCBzd2l0Y2guCgp+QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
