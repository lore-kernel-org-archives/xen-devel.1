From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v2 1/6] cpupools: fix state when downing a
 CPU failed
Date: Wed, 18 Jul 2018 11:13:59 +0200
Message-ID: <a3fd1fa1-e9f8-fa6d-062a-af7c82206e22@suse.com>
References: <5B4EF70702000078001D53C7@prv1-mh.provo.novell.com>
 <5B4EF7D302000078001D53D1@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=wq/s=kc=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1ffiX5-0001kz-Ro
 for xen-devel@lists.xenproject.org; Wed, 18 Jul 2018 09:14:03 +0000
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id A2782ACF3
 for <xen-devel@lists.xenproject.org>; Wed, 18 Jul 2018 09:14:00 +0000 (UTC)
In-Reply-To: <5B4EF7D302000078001D53D1@suse.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMTgvMDcvMTggMTA6MTgsIEphbiBCZXVsaWNoIHdyb3RlOgo+IFdoaWxlIEkndmUgcnVuIGlu
dG8gdGhlIGlzc3VlIHdpdGggZnVydGhlciBwYXRjaGVzIGluIHBsYWNlIHdoaWNoIG5vCj4gbG9u
Z2VyIGd1YXJhbnRlZSB0aGUgcGVyLUNQVSBhcmVhIHRvIHN0YXJ0IG91dCBhcyBhbGwgemVyb3Ms
IHRoZQo+IENQVV9ET1dOX0ZBSUxFRCBwcm9jZXNzaW5nIGxvb2tzIHRvIGhhdmUgdGhlIHNhbWUg
aXNzdWU6IEJ5IG5vdCB6YXBwaW5nCj4gdGhlIHBlci1DUFUgY3B1cG9vbCBwb2ludGVyLCBjcHVw
b29sX2NwdV9hZGQoKSdzIChpbmRpcmVjdCkgaW52b2NhdGlvbgo+IG9mIHNjaGVkdWxlX2NwdV9z
d2l0Y2goKSB3aWxsIHRyaWdnZXIgdGhlICJjICE9IG9sZF9wb29sIiBhc3NlcnRpb24KPiB0aGVy
ZS4KPiAKPiBDbGVhcmluZyB0aGUgZmllbGQgZHVyaW5nIENQVV9ET1dOX1BSRVBBUkUgaXMgdG9v
IGVhcmx5IChhZmFpY3QgdGhpcwo+IHNob3VsZCBub3QgaGFwcGVuIGJlZm9yZSBjcHVfZGlzYWJs
ZV9zY2hlZHVsZXIoKSkuIENsZWFyaW5nIGl0IGluCj4gQ1BVX0RFQUQgYW5kIENQVV9ET1dOX0ZB
SUxFRCB3b3VsZCBiZSBhbiBvcHRpb24sIGJ1dCB3b3VsZCB0YWtlIHRoZSBzYW1lCj4gcGllY2Ug
b2YgY29kZSB0d2ljZS4gU2luY2UgdGhlIGZpZWxkJ3MgdmFsdWUgc2hvdWxkbid0IG1hdHRlciB3
aGlsZSB0aGUKPiBDUFUgaXMgb2ZmbGluZSwgc2ltcGx5IGNsZWFyIGl0IChpbXBsaWNpdGx5KSBm
b3IgQ1BVX09OTElORSBhbmQKPiBDUFVfRE9XTl9GQUlMRUQsIGJ1dCBvbmx5IGZvciBvdGhlciB0
aGFuIHRoZSBzdXNwZW5kL3Jlc3VtZSBjYXNlICh3aGljaAo+IGdldHMgc3BlY2lhbGx5IGhhbmRs
ZWQgaW4gY3B1cG9vbF9jcHVfcmVtb3ZlKCkpLgo+IAo+IEJ5IGFkanVzdGluZyB0aGUgY29uZGl0
aW9uYWwgaW4gY3B1cG9vbF9jcHVfYWRkKCkgQ1BVX0RPV05fRkFJTEVECj4gaGFuZGxpbmcgaW4g
dGhlIHN1c3BlbmQgY2FzZSBzaG91bGQgbm93IGFsc28gYmUgaGFuZGxlZCBiZXR0ZXIuCj4gCj4g
U2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKUmV2aWV3ZWQt
Ynk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KCgpKdWVyZ2VuCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
