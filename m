From: George Dunlap <George.Dunlap@citrix.com>
Subject: Re: [PATCH V12 1/5] x86/p2m: allocate logdirty_ranges
 for altp2ms
Date: Fri, 21 Dec 2018 17:53:17 +0000
Message-ID: <4FF5F047-34AC-4830-AD45-FF14E9D28838@citrix.com>
References: <1545327518-5731-1-git-send-email-rcojocaru@bitdefender.com>
 <1545327518-5731-2-git-send-email-rcojocaru@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ebt8=O6=citrix.com=prvs=886f074fc=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1gaOzA-0000tr-1Z
 for xen-devel@lists.xenproject.org; Fri, 21 Dec 2018 17:53:20 +0000
In-Reply-To: <1545327518-5731-2-git-send-email-rcojocaru@bitdefender.com>
Content-Language: en-US
Content-ID: <B07279489E18444590476F1174F6AA7D@citrix.com>
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
cnVAYml0ZGVmZW5kZXIuY29tPiB3cm90ZToKPiAKPiBGb3Igbm93LCBvbmx5IGRvIGFsbG9jYXRp
b24vZGVhbGxvY2F0aW9uOyBrZWVwaW5nIHRoZW0gaW4gc3luYwo+IHdpbGwgYmUgZG9uZSBpbiBz
dWJzZXF1ZW50IHBhdGNoZXMuCj4gCj4gTG9nZGlydHkgc3luY2hyb25pemF0aW9uIHdpbGwgb25s
eSBiZSBkb25lIGZvciBhY3RpdmUgYWx0cDJtczsKPiBzbyBhbGxvY2F0ZSBsb2dkaXJ0eSByYW5n
ZXNldHMgKGNvcHlpbmcgdGhlIGhvc3QgbG9nZGlydHkKPiByYW5nZXNldCkgd2hlbiBhbiBhbHRw
Mm0gaXMgYWN0aXZhdGVkLCBhbmQgZnJlZSBpdCB3aGVuCj4gZGVhY3RpdmF0ZWQuCj4gCj4gU2ln
bmVkLW9mZi1ieTogUmF6dmFuIENvam9jYXJ1IDxyY29qb2NhcnVAYml0ZGVmZW5kZXIuY29tPgo+
IFRlc3RlZC1ieTogVGFtYXMgSyBMZW5neWVsIDx0YW1hc0B0a2xlbmd5ZWwuY29tPgoKUmV2aWV3
ZWQtYnk6IEdlb3JnZSBEdW5sYXAgPGdlb3JnZS5kdW5sYXBAY2l0cml4LmNvbT4KCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
