From: George Dunlap <George.Dunlap@citrix.com>
Subject: Re: [PATCH V12 2/5] x86/p2m: refactor p2m_reset_altp2m()
Date: Fri, 21 Dec 2018 17:59:32 +0000
Message-ID: <FE2A50FB-9FB1-4F51-8DB8-1F3DC1CADE45@citrix.com>
References: <1545327518-5731-1-git-send-email-rcojocaru@bitdefender.com>
 <1545327518-5731-3-git-send-email-rcojocaru@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ebt8=O6=citrix.com=prvs=886f074fc=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1gaP5J-0001ZV-6m
 for xen-devel@lists.xenproject.org; Fri, 21 Dec 2018 17:59:41 +0000
In-Reply-To: <1545327518-5731-3-git-send-email-rcojocaru@bitdefender.com>
Content-Language: en-US
Content-ID: <28F557345D67B44CBBC607D2C0C99E55@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Razvan Cojocaru <rcojocaru@bitdefender.com>
Cc: Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>, George Dunlap <George.Dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Cgo+IE9uIERlYyAyMCwgMjAxOCwgYXQgNTozOCBQTSwgUmF6dmFuIENvam9jYXJ1IDxyY29qb2Nh
cnVAYml0ZGVmZW5kZXIuY29tPiB3cm90ZToKPiAKPiBSZWZhY3RvciBwMm1fcmVzZXRfYWx0cDJt
KCkgc28gdGhhdCBpdCBjYW4gYmUgdXNlZCB0byByZW1vdmUKPiByZWR1bmRhbnQgY29kZXBhdGhz
LCBmaXhpbmcgdGhlIGxvY2tpbmcgd2hpbGUgd2UncmUgYXQgaXQuCj4gCj4gVGhlIHByZXZpb3Vz
IGNvZGUgbm93IHJlcGxhY2VkIGJ5IHAybV9yZXNldF9hbHRwMm0oZCwgaSwKPiBBTFRQMk1fREVB
Q1RJVkFURSkgY2FsbHMgZGlkIG5vdCBzZXQgcDJtLT5taW5fcmVtYXBwZWRfZ2ZuCj4gYW5kIHAy
bS0+bWF4X3JlbWFwcGVkX2dmbiBiZWNhdXNlIGluIHRob3NlIGNhc2VzIHRoZSBhbHRwMm0KPiBp
ZHggd2FzIGRpc2FibGVkOyBzbyBiZWZvcmUgZ2V0dGluZyB1c2VkIGFnYWluLAo+IHAybV9pbml0
X2FsdHAybV9lcHQoKSB3b3VsZCBnZXQgY2FsbGVkLCB3aGljaCByZXNldHMgdGhlbS4KPiBBbHdh
eXMgc2V0dGluZyB0aGVtIGluIHAybV9yZXNldF9hbHRwMm0oKSwgd2hpbGUgcmVkdW5kYW50LAo+
IGlzIHByZWZlcmFibGUgdG8gYW4gZXh0cmEgY29uZGl0aW9uYWwuCj4gCj4gU2lnbmVkLW9mZi1i
eTogUmF6dmFuIENvam9jYXJ1IDxyY29qb2NhcnVAYml0ZGVmZW5kZXIuY29tPgo+IFRlc3RlZC1i
eTogVGFtYXMgSyBMZW5neWVsIDx0YW1hc0B0a2xlbmd5ZWwuY29tPgoKUmV2aWV3ZWQtYnk6IEdl
b3JnZSBEdW5sYXAgPGdlb3JnZS5kdW5sYXBAY2l0cml4LmNvbT4KCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
